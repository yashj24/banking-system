/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connect.MyConnection;
import Model.History;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author HP
 */
public class Functionalities {
    
    
    public static boolean changePin(int acNo , String newPin){
        
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
     newPin = encrypt(newPin);
        try {
            con = MyConnection.getConnection();
            sql = "UPDATE accountdetails SET pin = ? WHERE accountNo = ?";

            ps = con.prepareStatement(sql);
           ps.setString(1, newPin);
             ps.setInt(2, acNo);
          int n = ps.executeUpdate();
            if (n>0) {
                
                return true;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
        
        
        
    }
    
    public static boolean login(int acNo , String pin){
        
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        ResultSet rs = null;
        try {
            con = MyConnection.getConnection();
            sql = "select * from accountdetails where accountNo = ? and pin=?";

            ps = con.prepareStatement(sql);
           ps.setInt(1, acNo);
             ps.setString(2, pin);
          rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
        
        
        
    }

    public static int balance(int acc) {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        ResultSet rs = null;
        int bal = 0;
        try {
            con = MyConnection.getConnection();
            sql = "select balance from accountdetails where accountNo = ?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, acc);
            rs = ps.executeQuery();   //password must be given in encrypted format
            if (rs.next()) {
                bal = rs.getInt(1);
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return bal;

    }
    
    
    public static boolean withdrawal(int acNo,int amt){
        
        if(amt>20000){
            System.out.println("Limit exceeded");
            return false;
        }
       int bal = balance(acNo);
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        
       bal = bal-amt;
        try {
            con = MyConnection.getConnection();
            sql = "UPDATE accountdetails SET balance = ? WHERE accountNo = ?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, bal);
             ps.setInt(2, acNo);
          int n = ps.executeUpdate();
            if (n>0) {
                history(acNo,"Withdrawal",amt);
                return true;
                
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
    }
    
    
    public static boolean deposit(int acNo, int amt){
      
       int bal = balance(acNo);
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
       
       bal = bal+amt;
        try {
            con = MyConnection.getConnection();
            sql = "UPDATE accountdetails SET balance = ? WHERE accountNo = ?;";

            ps = con.prepareStatement(sql);
            ps.setInt(1, bal);
             ps.setInt(2, acNo);
          int n = ps.executeUpdate();
            if (n>0) {
                history(acNo,"Deposit",amt);
                return true;
                
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
    }

    
    public static void history(int acNo, String type,int amt){
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
       
        try {
            con = MyConnection.getConnection();
            sql = "insert into history values(?,?,?,?,0)";

            ps = con.prepareStatement(sql);
            ps.setInt(1, acNo);
            ps.setString(2, type);
            ps.setInt(3,amt);
            ps.setInt(4,balance(acNo));
            ps.executeUpdate();
         

        } catch (Exception e) {
            System.out.println(e);
        }
        
        
    }
    
    
    public static ArrayList<History> transactionHistory(int acNo){
        
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
        ResultSet rs = null;
      ArrayList<History> al=new ArrayList<>();
        try {
            con = MyConnection.getConnection();
            sql = "select * from history where acNo = ?";

            ps = con.prepareStatement(sql);
            ps.setInt(1, acNo);
            rs = ps.executeQuery();
            while(rs.next()){
                History h = new History();
                h.setAcNo(rs.getInt(1));
                h.setType(rs.getString(2));
                h.setAmt(rs.getInt(3));
                h.setBalance(rs.getInt(4));
                al.add(h);
            }
         

        } catch (Exception e) {
            System.out.println(e);
        }
        
        
        return al;
    }
    
    public static String encrypt(String pass){
         
        String encryptedpassword = null;  
        try   
        {  
            /* MessageDigest instance for MD5. */  
            MessageDigest m = MessageDigest.getInstance("MD5");  
              
            /* Add plain-text password bytes to digest using MD5 update() method. */  
            m.update(pass.getBytes());  
              
            /* Convert the hash value into bytes */   
            byte[] ba = m.digest();  
              
            /* The bytes array has bytes in decimal form. Converting it into hexadecimal format. */  
            StringBuilder s = new StringBuilder();  
            for(int i=0; i< ba.length ;i++)  
            {  
                s.append(Integer.toString((ba[i] & 0xff) + 0x100, 16).substring(1));  
            }  
              
          
            encryptedpassword = s.toString();  
        }   
        catch (NoSuchAlgorithmException e)   
        {  
            e.printStackTrace();  
        }  
          
        
        
        
        return encryptedpassword;
    }
    
    
    public static void addUser(String pin){
        Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
      pin = encrypt(pin);
      
        try {
            con = MyConnection.getConnection();
            sql = "insert into accountdetails values(?,0,?)";

            ps = con.prepareStatement(sql);
            ps.setInt(1, acNum());
            ps.setString(2, pin);
            ps.executeUpdate();
          
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
       
    }
    
     public static int acNum(){
         Connection con = null;
        PreparedStatement ps = null;
        String sql = null;
       ResultSet rs = null;
      int acNo =0;
        try {
            con = MyConnection.getConnection();
            sql = "select max(accountNo) from accountdetails";

            ps = con.prepareStatement(sql);
          
            
          rs=ps.executeQuery();
          if(rs.next()){
               acNo = rs.getInt(1);
              
          }
            
        } catch (Exception e) {
            System.out.println(e);
        }
      return ++acNo;  
     }
    
    
    public static void main(String[] args) {
       
      //changePin(36732814,34000);
      withdrawal(36732814,3000);
    }

}

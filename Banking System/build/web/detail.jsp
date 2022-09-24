<%-- 
    Document   : detail
    Created on : 24 Sep, 2022, 11:02:45 AM
    Author     : HP
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.History"%>
<%@page import="DAO.Functionalities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details</title>
        <link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity = "sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin = "anonymous" >


    </head>
    <body style="background-color: #EEF2E6">
        <form action=success.jsp method=post>
            <center>
                <br>
                <br>
        <%
            int acNo = Integer.parseInt(session.getAttribute("acNo").toString());
            String pin = session.getAttribute("pin").toString();
            if (request.getParameter("bal") != null) {

        %>
        

        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">BALANCE</h5>
                <h6 class="card-subtitle mb-2 text-muted"><% out.println(Functionalities.balance(acNo)); %> </h6>
            </div>
        </div>
        <%

        } else if (request.getParameter("cp") != null) {
        %>
         
        <p>Enter Old Pin: <input type="number" name="oPin" min="1000" max="9999" required> 
        
        <p>Enter New Pin: <input type="number" name="nPin" min="1000" max="9999" required>
        <input type="submit" name=""></p>
        
      
        <%
            
        } else if (request.getParameter("th") != null) {
        %>

        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Sno</th>
                    <th scope="col">Type</th>  
                    <th scope="col">Amount</th>
                    <th scope="col">Balance</th>
                </tr>
            </thead>
            <tbody>
                
                <%  ArrayList<History> al= Functionalities.transactionHistory(acNo); 
                if(al.size()==0){
                    out.println("<h1>Oops, No Transaction History</h1>");
                }else{
                for(int i=0;i<al.size();i++){
                History h = al.get(i);
                
                
                out.println("<tr>");
                    out.println("<th scope=row>"+(i+1)+"</th>");
                    out.println("<td>"+ h.getType() +"</td>");
                    out.println("<td>"+ h.getAmt()+"</td>");
                    out.println("<td>"+ h.getBalance()+"</td>");
                    
                    out.println("</tr>");
                }
               %>
            </tbody>
        </table>   

         

        <%
           
        }}
        
        
        else if (request.getParameter("dp") != null) {
        %>

        
      

        <p>Enter Amount: <input type="number" name="deposit" min="1" required> <input type="submit" name=""></p>
  
        
        <%
           
        } else if (request.getParameter("wd") != null) {
        %>
        <p>Enter Amount: <input type="number" name="withdrawal" min="1" max="20000" required> <input type="submit" name=""></p>
        <p> Max Limit: Rs. 20000 </p>
        <%
               
            }
        %>
        </form>
        </center>
    </body>
</html>

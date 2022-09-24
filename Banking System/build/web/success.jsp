<%-- 
    Document   : success
    Created on : 24 Sep, 2022, 11:50:07 AM
    Author     : HP
--%>

<%@page import="DAO.Functionalities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Process</title>
         <link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity = "sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin = "anonymous" >


    </head>
    <body style="background-color: #EEF2E6">
        <% 
        int acNo = Integer.parseInt(session.getAttribute("acNo").toString());
            String pin = session.getAttribute("pin").toString();
        int val = 0;
        if (request.getParameter("deposit") != null){
            val = Integer.parseInt(request.getParameter("deposit"));
           if(Functionalities.deposit(acNo, val)){
               out.println("Success");
           }
        }
        else if (request.getParameter("withdrawal") != null){
            val = Integer.parseInt(request.getParameter("withdrawal"));
            if(Functionalities.withdrawal(acNo, val)){
               out.println("Success");
           }
        }
        else if (request.getParameter("oPin") != null){
            String oPin = request.getParameter("oPin");
            oPin = Functionalities.encrypt(oPin);
            String nPin = (request.getParameter("nPin")).toString();
            if(Functionalities.login(acNo, oPin)){
              if(Functionalities.changePin(acNo, nPin)){
                   out.println("Success");
              }
                
                
               
           } else{
                out.println("Incorrect Pin");
            }   
            
        }
        
      
        %>
        
        
        
    </body>
</html>

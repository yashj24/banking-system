<%-- 
    Document   : login
    Created on : 5 Jul, 2022, 1:20:31 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Jekyll v3.8.5">
        <title>Login</title>


        <link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity = "sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin = "anonymous" >







    </head>
    <body class="text-center" style="background-color: #EEF2E6">
    
        <form class="form" method="post" action="home.jsp">
            <br><br>
            <img class="mb-4" src="images\logo.jpg" alt="" width="100" height="100">
            <h1 class="h3 mb-3 font-weight-normal">Bank Of Indore</h1>
            <center>
                <table >
                    <tr>
                        <td><label class="font-weight-bold">Account Number:</label></td>
                        <td> <input type="number" name="acNo"  placeholder="Account No." required autofocus></td>
                    <br>
                    </tr>
                    <tr>
                        <td><label class="font-weight-bold" >Pin:</label></td>
                        <td>  <input type="password" name="Pin"  placeholder="Pin" required></td>
                    </tr>
                </table>
            </center>
            <br>
            <button class="btn btn-lg btn-primary " type="submit">Sign in</button>
        </table>
        <p class="mt-5 mb-3 text-muted">&copy;Yash Jain</p>
    </form>
        
        
</body>
</html>
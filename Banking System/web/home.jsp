<%-- 
    Document   : home
    Created on : 24 Sep, 2022, 1:33:29 AM
    Author     : HP
--%>

<%@page import="DAO.Functionalities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bank Of Indore</title>
        <link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity = "sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin = "anonymous" >


    </head>
    <body style="background-color: #EEF2E6">
        <%

            int acNo = Integer.parseInt(request.getParameter("acNo").toString());
            String pin = request.getParameter("Pin").toString();
            pin = Functionalities.encrypt(pin);
            session.setAttribute("acNo", acNo);
            session.setAttribute("pin", pin);
            if (Functionalities.login(acNo, pin)) {

        %>
    <center>
        <table style="margin: 0;
               position: absolute;
               top: 30%;
               left: 50%;
               -ms-transform: translate(-50%, -50%);
               transform: translate(-50%, -50%);">
            <form action="detail.jsp" method="post">
                <tr>
                    <td><button name="bal" value="bal" type="submit" class="btn btn-outline-danger">Balance</button></td>
                </tr>
                <tr>
                    <td> <button name="dp" value="dp" type="submit" class="btn btn-outline-danger">Deposit</button></td>
                </tr>
                <tr>
                    <td><button type="submit" name="cp" value="cp" class="btn btn-outline-danger">Change Pin</button></td>
                  </tr>
                <tr>
                    <td><button type="submit" name="wd" value="wd" class="btn btn-outline-danger">Withdrawal</button></td>
                </tr>
        </table>

        <button style="margin: 0;
                position: absolute;
                top: 50%;
                left: 50%;
                -ms-transform: translate(-50%, -50%);
                transform: translate(-50%, -50%);" type="submit" name="th" value="th" class="btn btn-outline-danger">History</button>



    </form>

</center>
<% } else { %>
<h1> Kindly check your credentials.  </h1>

<% }%>
</body>
</html>

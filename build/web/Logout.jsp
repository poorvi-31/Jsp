<%-- 
    Document   : Logout
    Created on : 26-Oct-2023, 12:37:33 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                session.setAttribute("rs", null);
                session.invalidate();
                response.sendRedirect("signin.jsp");
        %>        
    </body>
</html>

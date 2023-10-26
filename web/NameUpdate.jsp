<%-- 
    Document   : NameUpdate
    Created on : 26-Oct-2023, 12:42:01 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.IOException,
        java.io.PrintWriter,
        jakarta.servlet.ServletException,
        jakarta.servlet.http.HttpServlet,
        jakarta.servlet.http.HttpServletRequest,
        jakarta.servlet.http.HttpServletResponse,
        java.sql.Connection,
        java.sql.*,
        java.sql.DriverManager,
        java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <link rel="stylesheet" href="update.css">
        </head>
        <body>
            <form>
                <div class="container">
                    <div class="first">
                        <div class="input" id="head"><b><u>Enter Your New Username</u></b></div>
                        <div class="input"><b>Username</b></div>
                        <div class="input"><input type="text" name="fn"></div>
                        <div class="input"><button type="submit" value="Save">Save</button></div>
                        <div class="input"><a href="#">Back</a></div>
                    </div>
                </div>
                <%
                String p = request.getParameter("fn");
         
            Connection con = null;
            try {

            String fn = (String)session.getAttribute("email");
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver Loaded");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ServletShop", "root", "Info@1234");
            System.out.println("Connection Done");
            //                String sql = "update shop set Fullname = ? where email = ?";

            PreparedStatement ps = con.prepareStatement("update shop set Fullname = ? where email = ?");
            ps.setString(1,p);
            ps.setString(2, fn);
            int n = ps.executeUpdate();
            if(n>0)
            {
            %>
            <span>Updated</span>
            <%
            }
            else
            {
//            out.print("Changes Not Saved");
            }
            } catch (Exception e) {
            System.out.println(e);
            }
                %>
        </body>
    </html>

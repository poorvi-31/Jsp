<%-- 
    Document   : signin
    Created on : 26-Oct-2023, 11:10:48 AM
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
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="signin.css">
        <style>
            #validUser{
                margin-left: 20px;
                font-size: 20px;
            }
            #validPass
            {
                margin-left: 20px;
                font-size: 20px;
            }
        </style>
        <script>
            function validate()
            {

                var user = document.getElementById("user");
                var pass = document.getElementById("pass");
                var validUser = document.getElementById("validUser");
                var validPass = document.getElementById("validPass");
                validUser.innerHTML = "";
                var isValid = true;
                if (!user.value) {
                    validUser.innerHTML = "Username is required.";
                    user.focus();
                    isValid = false;
                }
                validPass.innerHTML = "";
                if (!pass.value) {
                    validPass.innerHTML = "Password is required";
                    pass.focus();
                    isValid = false;
                }
                if (!isValid) {
                    return false;
                }
                return true;
            }
        </script>

        <script>

            function myvalid()
            {
                var pass = document.getElementById("pass");
                var validPass = document.getElementById("validPass");
                validPass.innerHTML = "Username/password incorrect";
//                                validPass.innerHTML = "";
//                                pass.focus();
//                                return false;
            }


        </script> 
    </head>

    <body>
        <form onsubmit="return validate()">
            <div id="container">
                <div id="page">
                    <div id="pageTwo">

                    </div>
                    <div id="pageOne">
                        <div id="sign"><b>Sign In</b></div>
                        <div>Username</div>
                        <div><input type="username" name="username" placeholder="Username" id="user"></div>
                        <span id="validUser" style="color: red"></span>
                        <div>Password</div> 
                        <div><input type="password" name="pass" placeholder="........." id="pass"></div>
                        <span id="validPass" style="color: red"></span>
                        <div id="buttons"><button>Sign in</button></div>
                        <div><a href='Signup.jsp'>New user?</a></div>
                        </form>

                        <%
                              String us = request.getParameter("username");
                                String p = request.getParameter("pass");
                                Connection con = null;
                                
                                  if(us!=null){
                        %>

                        <%

                                                    try {

                                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                                        System.out.println("Driver Loaded");
                                                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ServletShop", "root", "Info@1234");
                                                        System.out.println("Connection Done");
                                                        String sql = "select * from shop where username=? and pass=?";
                                                        PreparedStatement ps = con.prepareStatement(sql);
                                                        ps.setString(1, us);
                                                        ps.setString(2, p);

                                                        ResultSet rs = ps.executeQuery();
                                
                                                        if (rs.next()) {
                                  
                //                                                     HttpSession session = request.getSession();
                                                        session.setAttribute("username",rs.getString("username"));
                                                         session.setAttribute("pass",rs.getString("pass"));
                                                         session.setAttribute("email",rs.getString("email"));
                                                          session.setAttribute("fullname",rs.getString("Fullname"));
                                                            session.setAttribute("phone",rs.getString("phoneno"));
                                                              session.setAttribute("rs",rs);
                                                            response.sendRedirect("home.jsp");
                                                        }else {
                        %>
                        <script>
                            myvalid();
                        </script>                
                        <%
     
                        //                    rs.close();
                                            ps.close();
                                            con.close();

                                        }} catch (Exception e) {
                                      
         
                            }
                                        
                            finally {

                                try {
                                    con.close();
                                } catch (SQLException ex) {

                                }
                            }

}
 %>
                        </body>
                        </html>
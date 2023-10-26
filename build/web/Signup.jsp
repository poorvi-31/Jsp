<%-- 
    Document   : Signup
    Created on : 26-Oct-2023, 10:05:02 AM
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
        <script>
            function validateForm() {
                var name = document.getElementById("name");
                var email = document.getElementById("email");
                var user = document.getElementById("user");
                var phone = document.getElementById("phone");
                var password = document.getElementById("password");
                var confirm_password = document.getElementById("confirm_password");
                var validUser = document.getElementById("valUser");
                var validName = document.getElementById("valName");
                var validEmail = document.getElementById("valEmail");
                var validNum = document.getElementById("valNum");
                var validPass = document.getElementById("valPass");
                var validCon = document.getElementById("valCon");

                // Reset validation messages
                validName.innerHTML = "";
                validEmail.innerHTML = "";
                validNum.innerHTML = "";
                validPass.innerHTML = "";
                validCon.innerHTML = "";
                validUser.innerHTML = "";

                var isValid = true;

                // Check for null or empty values in specific fields
                if (!name.value) {
                    validName.innerHTML = "Name is required.";
                    name.focus();
                    isValid = false;
                }
                if (!user.value) {
                    validUser.innerHTML = "username is required.";
                    user.focus();
                    isValid = false;
                }
                if (!email.value) {
                    validEmail.innerHTML = "Email is required.";
                    isValid = false;
                }

                if (!phone.value) {
                    validNum.innerHTML = "Phone Number is required.";
                    phone.focus()
                    isValid = false;
                }

                if (!password.value) {
                    validPass.innerHTML = "Password is required.";
                    isValid = false;
                }

                if (!confirm_password.value) {
                    validCon.innerHTML = "Confirm Password is required.";
                    isValid = false;
                }
                if (!isValid) {
                    return false;
                }


                var containsNumbers = /\d/.test(name.value);
                if (containsNumbers) {
                    validName.innerHTML = "Name cannot have numbers.";
                    name.focus();
                    return false; // Prevent the form from submitting
                }

                var isValidPhoneNumber = /^[6-9]\d{9}$/.test(phone.value);

                if (!isValidPhoneNumber) {
                    validNum.innerHTML = "Invalid Number!";
                    phone.focus();
                    return false;
                }
                var isValidPassword = /^.{8}$/.test(password.value);
                if (!isValidPassword)
                {
                    validPass.innerHTML = "Password should contain eight characters";
                    password.focus();
                    return false;
                }
                if (password.value != confirm_password.value)
                {
                    validCon.innerHTML = "Password and confirm password do not match.";
                    confirm_password.focus();
                    return false;
                }

                return true;

            }
        </script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <title>Registration Page</title>
        <style>
            #top
            {
                font-size: 20px;
                background-color: #0182CF;
                color: white;

            }
            .validate
            {
                color: red;
            }

            #box
            {
                background-color:#EBEBEB;
                box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            }

        </style>
    </head>
    <body id="backImg">
        <div class="container mt-2">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card "  id="box">
                        <div class="card-header text-center" id="top">Registration Form</div>
                        <div class="card-body">
                            <form onsubmit="return validateForm()">
                                <div class="form-group">
                                    <label for="name">Name:</label>
                                    <input type="text" class="form-control" id="name" name="name">
                                    <span id="valName" class="validate"></span>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input type="email" class="form-control" id="email" name="email">
                                    <span id="valEmail" class="validate"></span>
                                </div>
                                <div class="form-group">
                                    <label for="email">Username</label>
                                    <input type="text" class="form-control" id="user" name="user">
                                    <span id="valUser" class="validate"></span>
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone Number:</label>
                                    <input type="tel" class="form-control" id="phone" name="phone">
                                    <span id="valNum" class="validate"></span>
                                </div>

                                <div class="form-group">
                                    <label for="password">Password:</label>
                                    <input type="password" class="form-control" id="password" name="password">
                                    <span id="valPass" class="validate"></span>
                                </div>
                                <div class="form-group">
                                    <label for="confirm_password">Confirm Password:</label>
                                    <input type="password" class="form-control" id="confirm_password" name="confirm_password">
                                    <span id="valCon" class="validate"></span>
                                </div>
                                <button type="submit" class="btn btn-primary" name='sign'>Register</button>
                                <div><u>Already have an account?</u>&nbsp;<a href='signin.jsp'>Signin</a></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<%
          String s = request.getParameter("name");
          if(s!=null){
                    String fn = request.getParameter("name");
                    String em = request.getParameter("email");
                    String us = request.getParameter("user");
                    String ph = request.getParameter("phone");
                    String p = request.getParameter("password");
                    String cp = request.getParameter("confirm_password");

                        try {

                            Class.forName("com.mysql.cj.jdbc.Driver");
                            System.out.println("Driver Loaded");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ServletShop", "root", "Info@1234");
                            System.out.println("Connection Done");
                            String sql = "insert into shop values(?,?,?,?,?)";
                            PreparedStatement ps = con.prepareStatement(sql);
                            ps.setString(1, fn);
                            ps.setString(2, em);
                            ps.setString(3, us);
                            ps.setString(4, p);
                            ps.setString(5,ph);
                            int n = ps.executeUpdate();
                            if (n > 0) {
                                response.sendRedirect("home.jsp");
                            }
                        } catch (Exception e) {
                            

                        }
                    }
                   

%>

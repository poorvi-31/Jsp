<%-- 
    Document   : ChangePass
    Created on : 26-Oct-2023, 12:53:52 PM
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
               function validate()
            {

                var oldpass = document.getElementById("oldpass");
                var Newpass = document.getElementById("Newpass");
                var conf = document.getElementById("conf");
                var valOld = document.getElementById("valOld");
                var valNew = document.getElementById("valNew");
                var valCon = document.getElementById("valCon");
                valOld.innerHTML = "";
                var isValid = true;
                if (!oldpass.value) {
                    valOld.innerHTML = "Old is required.";
                    oldpass.focus();
                    isValid = false;
                }
                valNew.innerHTML = "";
                if (!Newpass.value) {
                    valNew.innerHTML = "Password is required";
                    Newpass.focus();
                    isValid = false;
                }
                  valCon.innerHTML = "";
                if (!conf.value) {
                    valCon.innerHTML = "Confirm Password is required";
                    conf.focus();
                    isValid = false;
                }
                if (!isValid) {
                    return false;
                }
               
                 var isValidPassword = /^.{8}$/.test(Newpass.value);
                if (!isValidPassword)
                {
                    valNew.innerHTML = "Password should contain eight characters";
                    Newpass.focus();
                    return false;
                }
                else if(conf!=Newpass)
                {
                     valCon.innerHTML = "Confirm Password is required";
                    conf.focus();
                    isValid = false;
                }
                return true;
            }
        </script>
         <script>
             function change()
             {
                         var oldpass = document.getElementById("oldpass");
                          var valOld = document.getElementById("valOld");
                            valOld.innerHTML = "Incorrect old password";
                            oldpass.focus();
                        }
                     </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <link rel="stylesheet" href="change.css">
        </head>
        <body>
            <form action="" onsubmit="return validate()">
                <div id="container">
                    <div id="first">
                        <div id="divone">Change Password</div>
                        <div class="divtwo">Enter Your old password:</div>
                        <div class="divtwo"><input type="password" name="old" class="input" id="oldpass"></div>
                        <span id="valOld" style="color: red"></span>
                        <div class="divtwo">Enter Your new password:</div>
                        <div class="divtwo"><input type="password" name="newpass" class="input" id="Newpass"></div>
                        <span id="valNew" style="color: red"></span>
                        <div class="divtwo">Confirm Password</div>
                        <div class="divtwo"><input type="password" name="confirm" class="input" id="conf"></div>
                        <span id="valCon" style="color: red"></span>
                        <div id="button"><input type="submit" value="Save"></div>
                        <div class="divtwo"><a href='profile.jsp'>Back</a></div>
                    </div>
                </div>
            </form>
        </body>
    </html>
    <%
   String op = request.getParameter("old");
            String p = request.getParameter("newpass");
            String cp = request.getParameter("confirm");
                       Connection con = null;
               if(op!=null){
               %>
               <%
        
 
            try {
                    String email = (String) session.getAttribute("email");
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    System.out.println("Driver Loaded");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ServletShop", "root", "Info@1234");
                    System.out.println("Connection Done");
                    PreparedStatement ps = con.prepareStatement("update shop set pass = ? where email = ?");
                    ps.setString(1, p);
                    ps.setString(2, email);
                    int n = ps.executeUpdate();
                    if (n > 0) {
                    } else {
                    %>
                    <script>
                        change();
                        </script>
    <%
                    }
                }
                
            catch (Exception e) {
                System.out.println(e);
            }
                   }  
            %>
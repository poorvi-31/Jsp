<%-- 
    Document   : EmailVal.jsp
    Created on : 28-Oct-2023, 10:34:40 AM
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
          <link rel="stylesheet" href="update.css">
    </head>
   <body>
         <script>
            function validate()
            {
                var name = document.getElementById("fn");
                var valName = document.getElementById("valName");
                
                 valName.innerHTML = "";
                 if (!name.value) {
                    valName.innerHTML = "Name is required.";
                    name.focus();
                    return false;
                }
                return true;
            }
            function valName()
            {
                 var name = document.getElementById("fn");
                var valName = document.getElementById("valName");
                 var containsNumbers = /\d/.test(name.value);
                if (containsNumbers) {
                    valName.innerHTML = "Name cannot have numbers.";
                    name.focus();
                    return false; 
                }
                return true;
            }
        </script>
        <form onsubmit="return validate()">
            <div class="container">
                <div class="first">
                    <div class="input" id="head"><b><u>Enter Your New Name</u></b></div>
                    <div class="input"><b>Username</b></div>
                    <div class="input"><input type="text" name="fn" id="fn" onkeyup="return valName()"></div>
                    <span id="valName"></span>
                    <div class="input"><button type="submit" value="Save">Save</button></div>
                    <div class="input"><a href="home.jsp">Back</a></div>
                </div>
            </div>
        </form>
    </body>
</html>
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

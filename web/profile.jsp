<%-- 
    Document   : profile
    Created on : 26-Oct-2023, 10:59:12 AM
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
            
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!DOCTYPE html>
    <html lang='en'>
        <head>
            <meta charset='UTF-8'>
            <meta name='viewport' content='width=device-width, initial-scale=1.0'>
            <title></title>
            <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css' integrity='sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==' crossorigin='anonymous' referrerpolicy='no-referrer' />
            <link href='https://fonts.googleapis.com/css?family=Cinzel Decorative' rel='stylesheet'>
            <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
            <link rel='stylesheet' href='profile.css'>
            <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css'>
            <script src='https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js'></script>
            <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js'></script>
        </head>
        <%
            String username = (String) session.getAttribute("username");
            String email = (String) session.getAttribute("email");
            String fn = (String) session.getAttribute("fullname");
        %>
        <body>
            <section id='userinfo'>
                <div id='container'>
                    <div id='userprofilediv'>
                        <center><div id='userimg'></div></center>
                        <center><div id='duser'><%= (String) session.getAttribute("username")%><a href='#'><i class='fas fa-edit' id='editicon' style='color: #000000;'></i></a></div></i></center>
                    </div>
                    <div id='details'>
                        <div id='myoption'><span id='text1'>Name :&nbsp;&nbsp; <%= (String) session.getAttribute("fullname")%></span><button><a href='NameUpdate.jsp'>Edit</a></button></div>
                        <div id='myoption'><span id='text1'>User Name :&nbsp;&nbsp;<%=(String) session.getAttribute("email")%></span><button><a href='#'>Edit</a></button></div>
                        <div id='myoption'><span id='text1'>Email:&nbsp;&nbsp;<%=(String) session.getAttribute("fullname")%></span><button><a href='#'>Edit</a></button></div>
                        <center><button id='back'><a href='home.jsp'>Back :</a></button></center>
                    </div>
                    <div id='last'><a href='ChangePass.jsp'>Change Password</a></div>
                </div>
            </section>
            <section id='changeusername'>

        </body>
    </html>

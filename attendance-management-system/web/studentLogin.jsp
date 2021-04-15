<%-- 
    Document   : studentLogin
    Created on : 28 Mar, 2021, 12:31:09 AM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Login</title>
         <link rel="stylesheet" href="css/style.css"/>
   
    </head>
    <body style="background-color: white;">
               <%
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","root");
                    String password=request.getParameter("password");
                    Statement stmt=conn.createStatement();
                    String query="select * from student where email='"+request.getParameter("email")+"' AND password='"+password+"';";
                    ResultSet rs = stmt.executeQuery(query);
                    String val=request.getParameter("email")+"gg";
                    if(rs.next()){
                        Cookie cookie = new Cookie("loggedin",val);
                        cookie.setMaxAge(60*60*24); 
                        response.addCookie(cookie);
                        session.setAttribute("SId",rs.getInt("SId"));
                        %>
                        
                        <h1>Login successful<h1>
                                <%    response.sendRedirect("StudentDashboard.jsp");
                    }
                    else{
%>  <img style="position:absolute;right:10%" src="css/login failed.jpg" alt="Image counld not be loaded">
                        <h1 style="color: #335070;">Sorry, your login has failed as credentials do not match! </h1>
                        <%
                    } 
                    %>
    </body>
</html>

<%-- 
    Document   : teacherRegister
    Created on : 29 Mar, 2021, 11:26:03 PM
    Author     : user
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher Register</title>
    </head>
    <body>
        <%
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","root");
        PreparedStatement stmt=conn.prepareStatement("Insert into teacher (Tname,email,password ,Scontact) values(?,?,?,?)");
        String phoneno=request.getParameter("contact");
        String email=request.getParameter("email");
        String name=request.getParameter("name");
        stmt.setString(1, name);
        stmt.setString(2,email);
        stmt.setString(3,request.getParameter("password"));
        stmt.setString(4,phoneno);
        int st =stmt.executeUpdate();
                if(st>=1){
                    %>
           <h1>Registered<h1>
                   <%
        }
        else{
%>
          <h1>Registration Failed<h1>
<%
        }
        conn.close();
        %>
    </body>
</html>

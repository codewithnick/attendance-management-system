<%-- 
    Document   : studentRegister
    Created on : 28 Mar, 2021, 12:09:10 AM
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
        <title>Student Register</title>
    </head>
    <body>
        <%
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","root");
        PreparedStatement stmt=conn.prepareStatement("Insert into Student (Sname,email,password ,RollNo,Sem,scontact) values(?,?,?,?,?,?)");
        String phoneno=request.getParameter("contact");
        String email=request.getParameter("email");
        String name=request.getParameter("name");
        stmt.setString(1, name);
        stmt.setString(2,email);
        stmt.setString(3,request.getParameter("password"));
        stmt.setString(4, request.getParameter("rollno"));
        stmt.setInt(5, Integer.parseInt(request.getParameter("Sem")));
        stmt.setString(6,phoneno);
        int st =stmt.executeUpdate();
                if(st>=1){
                    %>
           <h1>registered<h1>
                   <%
        }
        else{
%>
          <h1>registration failed<h1>
<%
        }
        conn.close();
        %>
    </body>
</html>

<%-- 
    Document   : teacherLogin
    Created on : 29 Mar, 2021, 11:32:09 PM
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
        <title>login</title>
    </head>
    <body>
                      <%
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","shivam12");
                    String password=request.getParameter("password");
                    Statement stmt=conn.createStatement();
                    String query="select * from teacher where email='"+request.getParameter("email")+"' AND password='"+password+"';";
                    ResultSet rs = stmt.executeQuery(query);
                    String val=request.getParameter("email")+"gg";
                    
                    if(rs.next()){
                        Cookie cookie = new Cookie("loggedin",val);
                        cookie.setMaxAge(60*60*24); 
                        response.addCookie(cookie);
                        %>
                        
                        <h1>Logged in  <h1>
                                <%
                    }
                    else{
%>
                        <h1>Login failed<h1>
                        <%
                    } 
                    %>
    </body>
</html>

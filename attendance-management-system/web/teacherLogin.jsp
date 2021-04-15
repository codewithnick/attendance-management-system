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
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","root");
                    String password=request.getParameter("password");
                    Statement stmt=conn.createStatement();
                    String query="select * from teacher where email='"+request.getParameter("email")+"' AND password='"+password+"';";
                    ResultSet rs = stmt.executeQuery(query);
                    String val=request.getParameter("email");
                    
                    if(rs.next()){
                        Cookie cookie = new Cookie("loggedin",val);
                        cookie.setMaxAge(60*60*24); 
                        response.addCookie(cookie);
                        session.setAttribute("isTeacherLogin", true);
                        session.setAttribute("email",rs.getString("email"));
                        session.setAttribute("TId",rs.getInt("TId"));
                        %>
                        
                        <h1>Hello <%=val%>, you have successfully logged in!  <h1>
                                <%   response.sendRedirect("showSubject.jsp");
                    }
                    else{
%>
                        <img style="position:absolute;right:10%" src="css/login failed.jpg" alt="Image counld not be loaded">
                        <h1 style="color: #800020;">Sorry, your login has failed as credentials do not match! </h1>
                        <%
                    } 
                    %>
    </body>
</html>

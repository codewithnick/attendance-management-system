<%-- 
    Document   : header
    Created on : Mar 27, 2021, 8:21:25 PM
    Author     : PRAJAPATI GAURAV
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","root");
    if(session.getAttribute("TId")==null)
%><script> location.href="error.html" ;</script><%
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <div class="header">
            <div class="navbar">
                <img src="css/logo.jpg" width="50px" height="50px" style="position:absolute; left:5px;"> <a class="logo" href="#"></a>
                <div class="navItem">
                    <ul>
                        <li><a href="showSubject.jsp">Show Sub</a></li>
                        <li><a href="Addsubject.jsp">Add Sub</a></li>
                        <li><a href="view.jsp">Search</a></li>
                        <li><a href="updateprofile.jsp">UpdatePro</a></li>
                        <li><a href="deleteprofile.jsp">DeletePro</a></li>
                        <li><a href="deletestudentprofile.jsp">DeleteStud</a></li>
                        <li><a href="logout.jsp">LogOut</a></li>
                    </ul>
                </div>
            </div>
        </div>
   
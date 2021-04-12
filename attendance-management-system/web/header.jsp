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
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--  css file here   -->
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <div class="header">
            <div class="navbar">
                <a class="logo" href="#">L</a>
                <div class="navItem">
                    <ul>
                        <li><a href="showSubject.jsp">Show subject</a></li>
                        <li><a href="Addsubject.jsp">Add subject</a></li>
                        <li><a href="view.html">Search</a></li>
                        <li><a href="updateprofile.jsp">Update Profile</a></li>
                        <li><a href="deleteprofile.jsp">Delete profile</a></li>
                        <li><a href="#">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
   
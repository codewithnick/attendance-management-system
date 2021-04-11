<%-- 
    Document   : studentheader
    Created on : Apr 6, 2021, 7:44:12 PM
    Author     : bot
--%>
<%@page import="java.sql.Time"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","SYCS");
     //getting current day of week ,date,time
            Calendar calendar = Calendar.getInstance();
            Date date = calendar.getTime();         
            String Dow=new SimpleDateFormat("EEEE", Locale.ENGLISH).format(date.getTime());
            long now = System.currentTimeMillis();
            Time sqlTime = new Time(now);  
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
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
                <a class="logo" href="index.jsp">Online Attendance</a>
                <div class="navItem">
                    <ul>
                        <li><a href="StudentDashboard.jsp">Student</a></li>
                        <li><a href="UpdateStudentProfile.jsp">Update</a></li>                        
                        <li><a href="deleteprofile.jsp">Delete profile</a></li>
                        <li><a href="#">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
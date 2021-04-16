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
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","root");
     //getting current day of week ,date,time
            Calendar calendar = Calendar.getInstance();
            Date date = calendar.getTime();         
            String Dow=new SimpleDateFormat("EEEE", Locale.ENGLISH).format(date.getTime());
            long now = System.currentTimeMillis();
            Time sqlTime = new Time(now);  
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
            //default will change later
           // int sid = 101;
           int sid;
            
            
            if(session.getAttribute("SId")== null){
%><script> location.href="error.html" ;</script><%
    return;}

            sid=(Integer)session.getAttribute("SId");
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
    <body >
        <div class="header">
            <div class="navbar">
                <img src="css/logo.jpg" width="50px" height="50px" style="position: absolute;top:10px;left:15px"> <a class="logo" href="index.jsp"></a>
                <div class="navItem">
                    <ul>
                        <li><a href="StudentDashboard.jsp"><img style="position:absolute;top:10px;width:50px; height:50px;right: 350px; " src="css/profile.jpg" > </a></li>
                        <li><a href="UpdateStudentProfile.jsp?sid=<%=sid%>"><img style="position:absolute;top:10px;width:50px; height:50px;right: 200px;" src="css/update logo.jpg" ></a></li>                                              
                        <li><a href="studentLogout.jsp"><img style="position:absolute;top:10px;width:50px; height:50px;right: 50px;" src="css/logout.jpg">  </a></li>
                    </ul>
                </div>
            </div>
</div>
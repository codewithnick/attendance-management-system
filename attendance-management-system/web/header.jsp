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
    {%><script> location.href="error.html" ;</script><%}
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
                <img src="css/logo.jpg" width="50px" height="50px" style="position:absolute; left:15px;"> <a class="logo" href="#"></a>
                <div class="navItem">
                    <ul>
                        <li><a href="showSubject.jsp"><img style="position:absolute;top:10px;width:50px; height:50px;right: 650px;" src="css/show sub.jpg" width="50px" height="50px" ></a></li>
                        <li><a href="Addsubject.jsp"><img style="position:absolute;top:10px;width:50px; height:50px;right: 550px;" src="css/add sub.jpg" width="50px" height="50px" ></a></li>
                        <li><a href="view.jsp"><img style="position:absolute;top:10px;width:50px; height:50px;right: 450px;" src="css/search.jpg" width="50px" height="50px" ></a></li>
                        <li><a href="updateprofile.jsp"><img style="position:absolute;top:10px;width:50px; height:50px;right: 350px;" src="css/update logo.jpg" width="50px" height="50px" ></a></li>
                        <li><a href="deleteprofile.jsp"><img style="position:absolute;top:10px;width:50px; height:50px;right: 250px;" src="css/delete profile.jpg" width="50px" height="50px" ></a></li>
                        <li><a href="deletestudentprofile.jsp"><img style="position:absolute;top:10px;width:50px; height:50px;right: 150px;" src="css/delete student.jpg" width="50px" height="50px" ></a></li>
                        <li><a href="logout.jsp"><img style="position:absolute;top:10px;width:50px; height:50px;right: 50px;" src="css/logout.jpg" width="50px" height="50px" ></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <br>
        <br>
   
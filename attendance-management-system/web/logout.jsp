<%-- 
    Document   : logout
    Created on : Apr 10, 2021, 3:59:29 PM
    Author     : PRAJAPATI GAURAV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
            session.setAttribute("isTeacherLogin", false);
            response.sendRedirect("teacher.html");
        %>
    </body>
</html>

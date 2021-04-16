<%-- 
    Document   : studentLogout
    Created on : Apr 14, 2021, 6:32:28 PM
    Author     : PRAJAPATI GAURAV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Logout</title>
    </head>
    <body>
        <%
            session.setAttribute("SId",null);
            response.sendRedirect("student.html");
            Cookie cookie = null;
            Cookie[] cookies = null;
            if( cookies != null ) {
           
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               if((cookie.getName( )).compareTo("loggedin") == 0 ) {
                  cookie.setMaxAge(0);
                  response.addCookie(cookie);
                  out.print("Deleted cookie: " +
                  cookie.getName( ) + "<br/>");
               }
               out.print("Name : " + cookie.getName( ) + ", ");
               out.print("Value: " + cookie.getValue( )+" <br/>");
            }
         }

        %>
    </body>
</html>

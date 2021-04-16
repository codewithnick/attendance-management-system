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
        <title></title>
    </head>
    <body>
        <%
        
            session.setAttribute("isTeacherLogin", null);
            response.sendRedirect("teacher.html");
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

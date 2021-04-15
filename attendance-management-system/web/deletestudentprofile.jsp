<%-- 
    Document   : deletestudentprofile
    Created on : Apr 13, 2021, 3:41:33 PM
    Author     : bot
--%>

<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@include file="header.jsp"%> 

<!DOCTYPE html>
<%! String message="";%>
<%    
    if (request.getParameter("Submit") != null)
        {
        
        int sid = Integer.parseInt(request.getParameter("SId"));

%>
<script language="JavaScript" type="text/javascript">
    if (confirm("Are you sure you want to delete"))
    {
    <%        String Query = "delete from attendance where sid=?";
        PreparedStatement del = conn.prepareStatement(Query);
        del.setInt(1, sid);
        del.executeUpdate();
        String Query1 = "delete from student where sid=?";
        PreparedStatement delete = conn.prepareStatement(Query1);
        delete.setInt(1, sid);
        delete.executeUpdate();
        message = "Students record has been deleted successfully!";}%>
     
        
</script>
<div>
    <form action="">
        <table align="center">
            <tr> <td style="background-color: #000000;color:white;">Enter Students Id</td><td><input style="background-color: #000000;color:white; height:40px;" type="text" name="SId"></td>
        </table>
            <p align="center"><input style="background-color: #ff0000;color:white; height:40px;" type="submit" value="Delete Profile" name="Submit"></p>
        <% if(!message.equals("")){ %>
        <div class="massage"><p><%=message%></p></div>            
                <%}%>
    </form>
</div>

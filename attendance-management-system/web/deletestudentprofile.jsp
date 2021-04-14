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
<%String message="";%>
<%    
    if (request.getParameter("Submit") != null)
        {
        
        int sid = Integer.parseInt(request.getParameter("SId"));

%>
<script language="JavaScript" type="text/javascript">
    if (confirm("are you sure you want to delete"))
    {
    <%        String Query = "delete from attendance where sid=?";
        PreparedStatement del = conn.prepareStatement(Query);
        del.setInt(1, sid);
        del.executeUpdate();
        String Query1 = "delete from student where sid=?";
        PreparedStatement delete = conn.prepareStatement(Query1);
        delete.setInt(1, sid);
        delete.executeUpdate();
        //delete student record
        //delete all attendance pf the student
        message = "Deleted Student record ";}%>
     } 
        
</script>
<div>
    <form action="">
        </br>  SId:<input type="text" name="SId"></br></br>
        <input type="submit" value="Delete account" name="Submit"></br></br>
        <% if(!message.equals("")){ %>
        <div class="massage"><p><%=message%></p></div>            
                <%}%>
    </form>
</div>
<%@ include file="footer.jsp" %>

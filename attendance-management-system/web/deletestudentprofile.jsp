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
<%
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","root");    
%>
<!DOCTYPE html>
<%  
    String message="";
    int sid=101;
    if(request.getParameter("Submit")!=null){
       
    Statement stmt=conn.createStatement();
    String contact=request.getParameter("SContact");

    String sql="select SContact from Student where SId='"+sid+"';";
    ResultSet r = stmt.executeQuery(sql);
    String SContact="";
    if(r.next())
    {
        SContact=r.getString("SContact");
    }
    
    if(contact.equals(SContact))
    {  %>
    
     <script language="JavaScript" type="text/javascript">
    if(confirm("are you sure you want to delete"))
    {
    <%
        String Query= "delete from attendance where sid=?";
        PreparedStatement del= conn.prepareStatement(Query) ;
        del.setInt(1,sid);
        del.executeUpdate();
        String Query1="delete from student where sid=?";
        PreparedStatement delete= conn.prepareStatement(Query1) ;
        delete.setInt(1,sid);
        delete.executeUpdate();
        //delete student record
        //delete all attendance pf the student
    %>
    //        delete code here
    }
    </script>
   <% }
    else {
         message="Credentials do not match";    
    }
}
%>
<div>
    <form action="">
      </br>  Scontact:<input type="text" name="SContact"></br></br>
      <input type="submit" value="Delete account" name="Submit"></br></br>
        <% if(!message.equals("")){ %>
            <div class="massage"><p><%= message%></p></div>            
          <%  }  %>
    </form>
</div>
<%@ include file="footer.jsp" %>

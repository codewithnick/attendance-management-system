<%-- 
    Document   : deleteprofile
    Created on : Mar 31, 2021, 9:07:05 PM
    Author     : PRAJAPATI GAURAV
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>
<%  
    String message="";
    if(request.getParameter("TAccount")!=null){
    Statement stmt=conn.createStatement();
    String contact=request.getParameter("SContact");
    int TId;
    TId=(Integer)session.getAttribute("TId");
    String sql="select SContact from teacher where TId='"+TId+"';";
    ResultSet r = stmt.executeQuery(sql);
    String SContact="";
    if(r.next())
    {
        SContact=r.getString("SContact");
    }
    
    if(contact.equals(SContact))
    {  %>
    <% TId=(Integer)session.getAttribute("TId"); %>
     <script language="JavaScript" type="text/javascript">
    if(confirm("are you sure you want to delete"))
    {
    
        window.location.href='update.jsp?Id='+<%=TId%>;
    }
    </script>
   <% }
    else {
         message="Scontact not match";    
    }
}
%>
<div>
    <form action="">
      </br>  Scontact:<input type="text" name="SContact"></br></br>
      <input type="submit" value="Delete account" name="TAccount"></br></br>
        <% if(!message.equals("")){ %>
            <div class="massage"><p><%= message%></p></div>
            
          <%  }  %>
    </form>
</div>
<%@ include file="footer.jsp" %>

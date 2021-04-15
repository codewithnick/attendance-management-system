<%-- 
    Document   : deleteprofile
    Created on : Mar 31, 2021, 9:07:05 PM
    Author     : PRAJAPATI GAURAV
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>

    
<%!  
    String message = ""; %>
    <%
    if(request.getParameter("TAccount")!=null){
    Statement stmt=conn.createStatement();
    String contact=request.getParameter("SContact");
    int TId;
    TId=(Integer)session.getAttribute("TId");
    String sql="select SContact from teacher where TId='"+TId+"';";
    ResultSet r = stmt.executeQuery(sql);
    String SContact="";
    if(r.next()){
        SContact=r.getString("SContact");
    }
    
    if(contact.equals(SContact)){ 
        TId=(Integer)session.getAttribute("TId"); %>
     <script language="JavaScript" type="text/javascript">
    if(confirm("Are you sure you want to delete this profile?")){
    window.location.href='update.jsp?Id='+<%=TId%>;
    }
    </script>
   <% }
    else {
      message="Sorry, Account cannot be deleted as teachers contact does not match with the registered number!";    
    }
}
%>
<div>
    <form action="">
        <table align="center" style="height:40px">
            
            <tr><td style="background-color: #000000;color:white;">Enter Teachers Contact Number</td><td width="70px" ><input style="background-color: #000000;color:white; height:40px;"  type="text" name="SContact"><td></tr>
        </table>
        <p align="center"><input style="background-color: #ff0000;color:white; height:40px;"  type="submit" value="Delete Profile" name="TAccount"></p>
        <% if(!message.equals("")){ %>
            <div ><p style="padding: 5px;display:inline-block ;position:relative ;left:25%;font-size:16px; font-weight:bold;background-color: #ff0000;color: white; height:40px;" ><%= message%></p></div>
            
          <%  }  %>
    </form>
</div>



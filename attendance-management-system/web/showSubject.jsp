<%-- 
    Document   : showSubject
    Created on : Mar 29, 2021, 4:34:52 PM
    Author     : PRAJAPATI GAURAV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="header.jsp" %>
<title>Show Subject</title>
<div class="tables" align="center">
    <table border="1">
        <tr>
            <th>Sr.No</th>
            <th>Subject</th>
            <th>DayOfWeek</th>
            <th>Sem</th>
            <th>Delete</th>
            <th>Edit</th>
            <th>View</th>
        </tr>
        <%
            PreparedStatement ps= conn.prepareStatement("Select * from subject where TId=?");
            
            int TId=(Integer)session.getAttribute("TId"); 
            ps.setInt(1,TId); 
            ResultSet r=ps.executeQuery();
            int sid;
            String Subject="";
            String DOW="";
            int Sem;
            int Sno=0;
            while(r.next()){
               sid=r.getInt("SubId");
               Subject=r.getString("Subject");
               DOW=r.getString("DayOfWeek");
               Sem=r.getInt("Sem");
               Sno=Sno+1;
        %>
        <tr>
            <td><%=Sno%></td>
            <td><%=Subject%></td>
            <td><%=DOW%></td>
            <td><%=Sem%></td>
            <td><a href="update.jsp?q=delete&sid=<%=sid%>">Delete</a></td>
            <td><a href="EditSubject2.jsp?sid=<%=sid%>">Edit</a></td>
            <td><a href="view.jsp?btn_search=search&txt_search=<%=Subject%>&search=subject">View</a></td>
        </tr>
        <% } %> 
    </table>
</div>



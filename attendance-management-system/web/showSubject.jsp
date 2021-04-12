<%-- 
    Document   : showSubject
    Created on : Mar 29, 2021, 4:34:52 PM
    Author     : PRAJAPATI GAURAV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="header.jsp" %>

<div class="tables">
    <table border="1">
        <tr>
            <th>S.No</th>
            <th>Subject</th>
            <th>DayOfWeek</th>
            <th>Sem</th>
            <th>Delete</th>
            <th>Edit</th>
            <th>View</th>
        </tr>
        <% 
            PreparedStatement ps=conn.prepareStatement("Select * from subject where TId=?");
            ps.setInt(1,201);
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
            <td><a href="EditSubject.html?sid=<%=sid%>">Edit</a></td>
            <td><a href="view.jsp?search=subject&txt_search=<%=Subject%>">View</a></td>
        </tr>
        <% } %> 
    </table>
</div>
<%@ include file="footer.jsp" %>



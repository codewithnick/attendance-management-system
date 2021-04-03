<%-- 
    Document   : update
    Created on : Apr 1, 2021, 10:57:24 PM
    Author     : PRAJAPATI GAURAV
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@ include file="header.jsp" %>
<%
 String message="";
if(request.getParameter("Id")!=null){
    String sql1="delete from subject where TId=?";
    PreparedStatement p=conn.prepareStatement(sql1);
    p.setInt(1,201);
    int r1=p.executeUpdate();
    String sql="delete from  teacher where TId=?";
    PreparedStatement ps=conn.prepareStatement(sql);
    ps.setInt(1,201);
    int r=ps.executeUpdate();
    if(r>0)
    {
        response.sendRedirect("showSubject.jsp");
    }
    else{
          message="profile delete successfully";
    }
            
}
else{
    message=" not delete Successfully";
}
%>

<%-- delete attendance --%>
<%
if(request.getParameter("sid")!=null){
    int SubId;
    SubId=Integer.parseInt(request.getParameter("sid"));
    String sql1="delete from subject where SubId=?";
    PreparedStatement p=conn.prepareStatement(sql1);
    p.setInt(1,SubId);
    int r1=p.executeUpdate();
    response.sendRedirect("showSubject.jsp");
}
%>
<%@ include file="footer.jsp" %>

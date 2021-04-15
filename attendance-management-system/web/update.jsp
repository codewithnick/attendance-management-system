<%-- 
    Document   : update
    Created on : Apr 1, 2021, 10:57:24 PM
    Author     : PRAJAPATI GAURAV
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@ include file="header.jsp" %>
<%!
 String message=""; %>
 <%
if(request.getParameter("Id")!=null){
    int TId=Integer.parseInt(request.getParameter("Id"));
     String sql2="delete from attendance where SubId in(select SubId from subject where TId=?)";
     PreparedStatement p2=conn.prepareStatement(sql2);
    p2.setInt(1,TId);
    int r2=p2.executeUpdate();
    String sql1="delete from subject where TId=?";
    PreparedStatement p=conn.prepareStatement(sql1);
    p.setInt(1,TId);
    int r1=p.executeUpdate();
    String sql="delete from  teacher where TId=?";
    PreparedStatement ps=conn.prepareStatement(sql);
    ps.setInt(1,TId);
    int r=ps.executeUpdate();
    if(r>0)
    {
        response.sendRedirect("teacher.html");
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
if((request.getParameter("sid")!=null)& (request.getParameter("q")!=null)){
    int SubId;
    SubId=Integer.parseInt(request.getParameter("sid"));
    String sql1="delete from subject where SubId=?";
    PreparedStatement p=conn.prepareStatement(sql1);
    p.setInt(1,SubId);
    int r1=p.executeUpdate();
    String sql3="delete from attendance where SubId=?";
    PreparedStatement p3=conn.prepareStatement(sql3);
    p3.setInt(1,SubId);
    int r3=p3.executeUpdate();
    response.sendRedirect("showSubject.jsp");
}
%>

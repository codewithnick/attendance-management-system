<%-- 
    Document   : updateprofile
    Created on : Mar 31, 2021, 7:47:54 PM
    Author     : PRAJAPATI GAURAV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
   String message="";
   if(request.getParameter("Tupdate")!=null){
       String tname=request.getParameter("TName");
       String tphone=request.getParameter("Tphone");
       String sql1="update teacher set TName=?,SContact=? where TId=?";
       PreparedStatement p=conn.prepareStatement(sql1);
        p.setString(1,tname);
        p.setString(2,tphone);
        p.setInt(3,201);
        int r=p.executeUpdate();
            if(r>0)
            {
                message="Profile Updated Successfully";
            }
            else{
                message="Profile not updated";
            }
   }
%>

<div class="container">
    <h2>Update profile</h2>
    <form action="">
        <% 
            String sql="select * from teacher where TId=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            //Static teacher id
            ps.setInt(1,201); 
            ResultSet r=ps.executeQuery();
            String name="";
            String contact="";
            while(r.next()){
                name=r.getString("TName");
                contact=r.getString("SContact");
            }
        %>
        Name:<input type="text" name="TName" value="<%=name%>"></br></br>
        Phone<input type="text" name="Tphone" value="<%=contact%>"></br></br>
        <input type="submit" value="Update" name="Tupdate"></br></br>
        <% if(!message.equals("")){ %>
            <div class="massage"><p><%= message%></p></div>
          <%  }  %>
    </form>
</div>

<%@ include file="footer.jsp" %>

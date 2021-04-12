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
       int TId=(Integer)session.getAttribute("TId");
       String temail=request.getParameter("Temail");
       String tpassword=request.getParameter("TPassword");
       String sql1="update teacher set TName=?,SContact=?,email=?,Password=? where TId=?";
       PreparedStatement p=conn.prepareStatement(sql1);
        p.setString(1,tname);
        p.setString(2,tphone);
        p.setString(3,temail);
        p.setString(4,tpassword);
        p.setInt(5,TId);
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
            int TId=(Integer)session.getAttribute("TId");
            ps.setInt(1,TId); 
            ResultSet r=ps.executeQuery();
            String name="";
            String contact="";
            String email="";
            String Dept="";
            String password="";
            while(r.next()){
                name=r.getString("TName");
                contact=r.getString("SContact");
                email=r.getString("email");
                password=r.getString("Password");
            }
        %>
        Name:<input type="text" name="TName" value="<%=name%>"></br></br>
        Phone<input type="text" name="Tphone" value="<%=contact%>"></br></br>
        Email<input type="email" name="Temail" value="<%=email%>"></br></br>
        Password<input type="text" name="TPassword" value="<%=password%>"></br></br>
        <input type="submit" value="Update" name="Tupdate"></br></br>
        <% if(!message.equals("")){ %>
            <div class="massage"><p><%= message%></p></div>
          <%  }  %>
    </form>
</div>

<%@ include file="footer.jsp" %>

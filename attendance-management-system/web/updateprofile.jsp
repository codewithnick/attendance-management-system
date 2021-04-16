<%-- 
    Document   : updateprofile
    Created on : Mar 31, 2021, 7:47:54 PM
    Author     : PRAJAPATI GAURAV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<title>Update Profile</title>
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
                message="Profile updation failed";
            }
   }
%>
<head>
    <link rel="stylesheet" href="css\style.css"
</head>
<div>
    <h2 align="center">You can update your profile here</h2>
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
            String password="";
            while(r.next()){
                name=r.getString("TName");
                contact=r.getString("SContact");
                email=r.getString("email");
                password=r.getString("Password");
            }
        %>
        <table align="center" class="updateteacherprofile">
            
            <tr><td>Name</td><td><input type="text" name="TName" value="<%=name%>"></td></tr>
        <tr><td>Phone</td><td><input type="text" name="Tphone" value="<%=contact%>"></td></tr>
        <tr><td>Email</td><td><input type="text" name="Temail" value="<%=email%>"></td></tr>
        <tr><td>Password</td><td><input type="text" name="TPassword" value="<%=password%>"></td></tr>
        <tr><td colspan="2"></td></tr>
        <tr><td colspan="2" align="center"><input type="submit" value="UPDATE" name="Tupdate"></td></tr>
        </table>
        <br>
        <br>
        <% if(!message.equals("")){ %>
            <div style="padding:10px; display:inline-block ;position:relative ;left:43%;font-size:16px; font-weight:bold;background-color:black;color:#32a852; height:50px;"><p><%= message%></p></div>
          <%  }  %>
    </form>
</div>

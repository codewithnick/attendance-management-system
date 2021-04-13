<%-- 
    Document   : updateStudentProfile.jsp
    Created on : Apr 12, 2021, 6:46:32 PM
    Author     : bot
--%>

<%@ include file="studentheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String message="";
   int sid=101;
   if(request.getParameter("update")!=null){
       String sname=request.getParameter("SName");
       String sphone=request.getParameter("Sphone");
       String rollno=request.getParameter("RollNo");
       String sem=request.getParameter("Sem");
       
       //String temail=request.getParameter("Temail");
       //String tpassword=request.getParameter("TPassword");
       String sql1="update student set SName=?,RollNo=?,Sem=?,SContact=? where SId=?";
       PreparedStatement p=conn.prepareStatement(sql1);
        p.setString(1,sname);
        p.setString(2,rollno);
        p.setString(3, sem);
        p.setString(4,sphone);
        p.setInt(5,sid);
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
            String sql="select * from student where SId=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            //sid=(Integer)session.getAttribute("SId");
            ps.setInt(1,sid); 
            ResultSet r=ps.executeQuery();
            String name="";
            String contact="";
            String email="";
            String Dept="";
            String password="";
            int sem=1;
            String rollno=""; 
            while(r.next()){
                name=r.getString("SName");
                contact=r.getString("SContact");
                //email=r.getString("email");
                //password=r.getString("Password");
                rollno=r.getString("RollNO");
                sem =r.getInt("Sem");
            }
        %>
        Name:<input type="text" name="SName" value="<%=name%>"></br></br>
        Phone:<input type="text" name="Sphone" value="<%=contact%>"></br></br>
<!--        Email<input type="email" name="Temail" value="<%=email%>"></br></br>-->
<!--        Password<input type="text" name="TPassword" value="<%=password%>"></br></br>-->
        RollNO:<input type="text" name="RollNo" value="<%=rollno%>"></br></br>
        Sem:
        <select name="Sem">
            <%for (int i = 1; i <=6; i++) {
            %>
            <option <%if(i==sem){%>selected<%}%>>
                <%=i%>
            </option>
            <%
                }
            %>
        </select></br></br>
        <input type="submit" value="Update" name="update"></br></br>
        <% if(!message.equals("")){ %>
            <div class="massage"><p><%= message%></p></div>
          <%  }  %>
    </form>
</div>

<%@ include file="footer.jsp" %>

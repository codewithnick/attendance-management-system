<%-- 
    Document   : view
    Created on : 7 Apr, 2021, 4:59:39 PM
    Author     : Sophia Dcruz
--%>

<<<<<<< HEAD
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
=======
>>>>>>> upstream/main

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View</title>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        
        <div class="viewtable">
                <table align="center" border="1">
                    <tr> <th>Attendance Id</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Attendance</th>
                    <th>Student Id</th>
                    <th>Subject ID</th>
                    <th>Delete Record</th>
                    </tr>
            
       <% 
          String txt=request.getParameter("txt_search");
          String dropdown=request.getParameter("search");
<<<<<<< HEAD
        String a;
        if (request.getParameter("delete") == null)
    a = "";
else
    a = request.getParameter("delete");

   

            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","root");
            PreparedStatement ps;
            ResultSet rs;
            if(dropdown.equals("name")){%>
             <h1>Hello <%=txt%>! Your attendance is recorded as below</h1>
                    <%   
            ps = con.prepareStatement("Select * from Attendance where SId in(Select SId from Student where SName= ?) Order by Attendance desc");            
=======

            PreparedStatement ps;
            ResultSet rs;
            if(dropdown.equals("name")){
            ps = conn.prepareStatement("Select * from Attendance where SId =(Select SId from Student where SName= ?) Order by Attendance desc");
>>>>>>> upstream/main
            ps.setString(1,txt);
            rs=ps.executeQuery(); 
     }
<<<<<<< HEAD
            else if(dropdown.equals("rollno")){%>
            <h1>Attendance for RollNo <%=txt%> is recorded as below</h1>
            <%ps = con.prepareStatement("Select * from Attendance where SId in (Select SId from Student where RollNo= ?) Order by Attendance desc");
            ps.setString(1,txt);
            rs=ps.executeQuery();
     }
            else if(dropdown.equals("subject")){%>
           <h1>Your attendance for <%=txt%> is recorded as below</h1>
            <% ps = con.prepareStatement("Select * from Attendance where SubId in (Select SubId from Subject where Subject= ?) Order by Attendance desc");
            ps.setString(1,txt);
            rs=ps.executeQuery();
     }
            else{%>
           <h1>Your attendance on <%=txt%> is recorded as below</h1>
            <%
            ps = con.prepareStatement("Select * from Attendance where Date =? Order by Attendance desc");
=======
            else if(dropdown.equals("rollno")){
            ps = conn.prepareStatement("Select * from Attendance where SId =(Select SId from Student where RollNo= ?) Order by Attendance desc");
            ps.setString(1,txt);
            rs=ps.executeQuery();
     }
            else if(dropdown.equals("subject")){
            ps = conn.prepareStatement("Select * from Attendance where SubId =(Select SubId from Subject where Subject= ?) Order by Attendance desc");
            ps.setString(1,txt);
            rs=ps.executeQuery();
     }
            else{
            ps = conn.prepareStatement("Select * from Attendance where Date =? Order by Attendance desc");
>>>>>>> upstream/main
            ps.setString(1,txt);
            rs=ps.executeQuery();
            } 
        PreparedStatement del = con.prepareStatement("Delete from Attendance where AId=? ");
         if(a != null){
     /*   deleteRecord(Integer.parseInt(a),del); */
    }
       int record;%>
            <%!
               
           public void deleteRecord(int aid, PreparedStatement del){

           try{
            del.setInt(1,aid);
            del.executeUpdate();
}
    catch(SQLException e){
        System.out.println("Exception");
}
       
} %>
    <%   while(rs.next()){
                 String temp;
                 if(rs.getInt("attendance")==1){
                      temp="Present";
                 }
                 else{
                     temp="Absent";
        }
                 int aid=rs.getInt("AId");
                 String aidstring=String.valueOf(aid);
%><form action="#">   
    <tr><td><%= aidstring%></td>
    <td><%=rs.getString("Date")%></td>
    <td><%=rs.getString("Time")%></td>
    <td><%= temp %></td>
   <td><%=rs.getInt("SId")%></td>
    <td><%=rs.getInt("SubId")%></td>
    <td>     
        <input type="submit" value="<%=aidstring%>" name="delete" onClick="<%
       
        %>" >
</td></tr></form>
    <%
}   %>
  </table>
  </div>

    </body>
</html>

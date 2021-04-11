<%-- 
    Document   : view
    Created on : 7 Apr, 2021, 4:59:39 PM
    Author     : Sophia Dcruz
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
                <table border="1">
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
        String a;
        if (request.getParameter("delete") == null)
    a = "";
else
    a = request.getParameter("delete");

   

            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","root");
            PreparedStatement ps;
            ResultSet rs;
            if(dropdown.equals("name")){
            ps = con.prepareStatement("Select * from Attendance where SId in(Select SId from Student where SName= ?) Order by Attendance desc");            
            ps.setString(1,txt);
            rs=ps.executeQuery(); 
     }
            else if(dropdown.equals("rollno")){
            ps = con.prepareStatement("Select * from Attendance where SId in (Select SId from Student where RollNo= ?) Order by Attendance desc");
            ps.setString(1,txt);
            rs=ps.executeQuery();
     }
            else if(dropdown.equals("subject")){
            ps = con.prepareStatement("Select * from Attendance where SubId in (Select SubId from Subject where Subject= ?) Order by Attendance desc");
            ps.setString(1,txt);
            rs=ps.executeQuery();
     }
            else{
            ps = con.prepareStatement("Select * from Attendance where Date =? Order by Attendance desc");
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
    </body>
</html>

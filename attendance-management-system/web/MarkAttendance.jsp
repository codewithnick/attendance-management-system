<%-- 
    Document   : MarkAttendance
    Created on : 11 Apr, 2021, 4:49:33 PM
    Author     : Dispersion
--%>

<%@ include file="studentheader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 		<link href="markattendance.css" rel="stylesheet" type="text/css">
        <title>Mark Attendance</title>
    </head>
    <body>
     <%

                int sid=Integer.parseInt(request.getParameter("SId"));
                int subjectid=Integer.parseInt(request.getParameter("SubId"));
                String sname="";
                String rollno="";
                int sem=0;
                String tname="";
                String subject="";
                int tid=0;
                String day="";
                int a_id=0;
                boolean bool=false;
                PreparedStatement s=conn.prepareStatement("Select * from Student where SId=?");
                s.setInt(1,sid);
                ResultSet stu=s.executeQuery();
                while(stu.next()){
                    sname=stu.getString("SName");
                    rollno=stu.getString("Rollno");
                    sem=stu.getInt("Sem");  
                }
                
                PreparedStatement t=conn.prepareStatement("Select * from subject where SubId=?");         
                t.setInt(1,subjectid);
                ResultSet sub=t.executeQuery();
                while(sub.next()){
                    subject=sub.getString("Subject");
                    tid=sub.getInt("TId");
                    day=sub.getString("DayofWeek");  
                }
                
                PreparedStatement teach=conn.prepareStatement("Select * from teacher where TId=?");
                teach.setInt(1,tid);
                ResultSet tea=teach.executeQuery();
                if(tea.next()){
                tname=tea.getString("TName");}
                                  

                PreparedStatement a=conn.prepareStatement("Select * from Attendance where SId=? and SubId=?");
                a.setInt(1,sid);
               a.setInt(2,subjectid);


                ResultSet re=a.executeQuery();
                if(re.next()){
                a_id=re.getInt("AId");}
               
                
                PreparedStatement p=conn.prepareStatement("Update Attendance set Attendance=?,time=? where AId=?");
                 p.setBoolean(1,true);
                 p.setTime(2,sqlTime);
                 p.setInt(3,a_id);
                 int mark=p.executeUpdate();              
                %>
            
            <h3>Congrats, Attendance is marked For</h3>
            <table id="Main"  >       
            <tr><th>NAME</th> <td><%=sname%></td></tr>
            <tr></tr> <th>ROLLNO</th> <td><%=rollno%></td></tr>
            <tr><th>SEMESTER</th><td><%=sem%></td></tr>
            <tr><th>SUBJECT</th><td><%=subject%></td></tr>
            <tr><th>DAY</th><td><%=day%></td></tr>
            <tr><th>TEACHER</th><td><%=tname%></td></tr>
            <tr>
                <th>Return to</th>
                <td id="link">
                        <a href="StudentDashboard.jsp"><button>Dashboard</button></a>                     
                </td>  
            </tr>
        </table>     

    </body>
</html>


<%-- 
    Document   : MarkAttendance
    Created on : 11 Apr, 2021, 4:49:33 PM
    Author     : Dispersion
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attendance?useSSL=false","root","root");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Attendance?useSSL=false","root","SYCS");

                
                Calendar calendar = Calendar.getInstance();
                Date date = calendar.getTime();      
                long now = System.currentTimeMillis();
                Time sqlTime = new Time(now);  
                java.sql.Date sqlDate = new java.sql.Date(date.getTime());
                
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

                <div><%=sid%><%=subjectid%></div>

             <table border="1">       
            <tr>
                <th>NAME</th>
                <th>ROLLNO</th>
                <th>SEMESTER</th>
                <th>SUBJECT</th>
                <th>DAY</th>
                <th>TEACHER</th>
                <th>MARK</th>

            </tr>
            <tr>
                <td><%=sname%></td>
                <td><%=rollno%></td>
                <td><%=sem%></td>
                <td><%=subject%></td>
                <td><%=day%></td>
                 <td><%=tname%></td>
                <td>
                        <a href="StudentDashboard.jsp">Mark</a>                     
                </td>  
            </tr>         
        </table>           


    </body>
</html>


<%-- 
    Document   : StudentDashboard
    Created on : Apr 6, 2021, 7:08:03 PM
    Author     : bot
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ include file="studentheader.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <div>Student Name</div>
    <div>RollNO</div>
    <div>contact</div>
    <div>semester</div>
    
    <div>Today's date: <%= (new java.util.Date()).toLocaleString()%></div>


    <%
        

        //find sem through sid
        PreparedStatement semps = conn.prepareStatement("Select sem from student where SId=?  ");
        semps.setInt(1, sid);
        ResultSet re = semps.executeQuery();
        re.next();
        int sem = re.getInt(1);

        //fetchh sub acc of day of week
        PreparedStatement sub = conn.prepareStatement("Select * from subject where DayOfWeek=? and sem=?");
        sub.setString(1, Dow);
        sub.setInt(2, sem);
        ResultSet subjects = sub.executeQuery();

//            
        //find max AId
        String sql1 = "select max(AId) as max from attendance";
        PreparedStatement ps1 = conn.prepareStatement(sql1);
        ResultSet newid = ps1.executeQuery();
        int Newid = 1;
        if (newid.next()) {
            Newid = newid.getInt(1) + 1;
        }

        // get all students id in the same semester
        PreparedStatement studentsps = conn.prepareStatement("Select SId from student where Sem= ?");
        studentsps.setInt(1, sem);
        ResultSet students = studentsps.executeQuery();
        //get all subjects               
        subjects = sub.executeQuery();
        while (subjects.next()) {
            int Subjectid = subjects.getInt(1);
            //check if attendance already exists
            String sql2 = "select AId from attendance where Date= ? and SId=? and SubId=?";
            PreparedStatement attendanceexists = conn.prepareStatement(sql2);
            attendanceexists.setDate(1, sqlDate);
            attendanceexists.setInt(2, sid);
            attendanceexists.setInt(3, Subjectid);
            ResultSet attendanceid = attendanceexists.executeQuery();
            if (attendanceid.next()) {
                //attendance exists
                //do nothing give the option to mark attendance 
            } else {
                // iterate through all students in same semester and 
                // add the attendence record for today and current subject
                while (students.next()) {
                    int studentid = students.getInt(1);
                    //attendance create new record default unmarked insert
                    PreparedStatement attend = conn.prepareStatement("Insert into attendance"
                            + "(AId,Date,Time,SId,SubId) values(?,?,?,?,?)");
                    attend.setInt(1, Newid);
                    Newid += 1;
                    attend.setDate(2, sqlDate);
                    attend.setTime(3, sqlTime);
                    attend.setInt(4, studentid);
                    attend.setInt(5, Subjectid);
                    attend.executeUpdate();
                }
            }
        }
    %>

    <br>

    <div>sem<%=sem%></div>
    <br>
    <div>Today is <%=Dow%></div>
    <h1>Subject wise attendance</h1>
    <div class="tables">
        <table border="1">
            <tr>
                <!--<th>Id</th>-->
                <th>Subject</th>
                <th>DayOfWeek</th>
                <th>Sem</th>
                <th>Mark</th>
                <th>Attended Lectures</th>
                <th>Total Lectures</th>
            </tr>
            <%
                subjects = sub.executeQuery();
                while (subjects.next()) {
                    int Subjectid = subjects.getInt(1);
                    String subject = subjects.getString("Subject");
                    PreparedStatement pm = conn.prepareStatement("Select count(*) from Attendance where SubId =? and SId =? Order by Attendance desc");
                    pm.setInt(1,Subjectid);
                    pm.setInt(2,sid);
                    ResultSet total=pm.executeQuery();
                    int tot=0,attended=0;
                    if(total.next())
                        {tot=total.getInt(1);}
                    pm = conn.prepareStatement("Select count(*) from Attendance where SubId =? and SId =? and attendance=1 Order by Attendance desc");
                    pm.setInt(1,Subjectid);
                    pm.setInt(2,sid);
                    total=pm.executeQuery();
                    if(total.next())
                        {attended=total.getInt(1);}
                    float percent=(attended/tot)*100;
            %>
            <tr>
             <!--   <td><%=Subjectid%></td>-->
                <td><%=subject%></td>
                <td><%=Dow%></td>
                <td><%=sem%></td>
                <td>
                    <a href="./MarkAttendance.jsp?SId=<%=sid%>&SubId=<%=Subjectid%>">
                        Mark
                    </a>
                </td>
                <td><%=percent%> %</td>
                <td><%=tot%></td>
            </tr>
            <%
                }
            %>
            

        </table>    
    </div>

</html>

<%-- 
    Document   : view
    Created on : 7 Apr, 2021, 4:59:39 PM
    Author     : Sophia Dcruz
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
         <form action="view.jsp">
             <br>
             <br>
            <table align="center">
                <tr><td ><input style="background-color:#072f5f;color:white ;width:70%;height: 30%;" type="text" name="txt_search"></td>  
                    <td width="25%"><select name="search" style="background-color:#072f5f;color:white ; width:100%;height: 30%;">
                <option value="name">Name</option>
                <option value="rollno">Roll No</option>
                <option value="subject">Subject</option>
                <option value="date">Date</option>
              </select>
                    </td>
                    <td><input style="background-color:#072f5f ;color:white;width:100%;height: 30%;"  type="submit" value="Search" name="btn_search"></td> 
                
            </table>
             <br>
             <br>
         </form>
        <div class="viewtable">
            <table border="1" align="center" >
                <tr> <th>RollNo</th>
                    <th>Name</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Attendance</th>
                    <th>Teacher name</th>
                    <th>Subject</th>
                    <th>Delete</th>
                </tr>

                <%  if(request.getParameter("btn_search")!=null){
                    String txt = request.getParameter("txt_search");
                    String dropdown = request.getParameter("search");
                     int TId=(Integer)session.getAttribute("TId");
                    PreparedStatement ps;
                    ResultSet rs;
                    if (dropdown.equals("name")) {
                        ps = conn.prepareStatement("Select * from Attendance where SubId in (select SubID from subject where TId=?) and SId in (Select SId from Student where SName= ?) Order by Attendance desc");
                        ps.setString(2, txt);
                        ps.setInt(1, TId);
                        rs = ps.executeQuery();
                    } else if (dropdown.equals("rollno")) {
                        ps = conn.prepareStatement("Select * from Attendance where SubId in (select SubID from subject where TId=?) and SId in(Select SId from Student where RollNo= ?) Order by Attendance desc");
                        ps.setInt(1, TId);
                        ps.setString(2, txt);
                        rs = ps.executeQuery();
                    } else if (dropdown.equals("subject")) {
                        ps = conn.prepareStatement("Select * from Attendance where SubId in (Select SubId from Subject where TId=? and Subject= ?) Order by Attendance desc");
                        ps.setInt(1, TId);
                        ps.setString(2, txt);
                        rs = ps.executeQuery();
                    } else {
                        ps = conn.prepareStatement("Select * from Attendance where  SubId in (select SubID from subject where TId=?)  Date =? Order by Attendance desc");
                        ps.setString(2, txt);
                        ps.setInt(1, TId);
                        rs = ps.executeQuery();
                    }
                    int Absent=0,present=0;
                    while (rs.next()) {
                        String temp;
                        String name = "";
                        String rollno = "";
                        int AId =rs.getInt("AId");
                        int SId = rs.getInt("SId");
                        String Subject = "";
                        //  for name and rollno
                        PreparedStatement ps1 = conn.prepareStatement("Select * from Student where SId=?");
                        ps1.setInt(1, SId);
                        ResultSet rs1 = ps1.executeQuery();
                        if (rs1.next()) {
                            name = rs1.getString("SName");
                            rollno = rs1.getString("RollNo");
                        }
                        // end of for adding name and rollno

                        // for subject name
                        int SubId = rs.getInt("SubId");
                        PreparedStatement ps2 = conn.prepareStatement("Select * from subject where SubId=?");
                        ps2.setInt(1, SubId);
                        ResultSet rs2 = ps2.executeQuery();
                        if (rs2.next()) {
                            Subject = rs2.getString("Subject");
                            TId = rs2.getInt("TId");
                        }
                        // end for subject name

                        // for displaying teacher name
                        String Tname = "";
                        PreparedStatement ps3 = conn.prepareStatement("Select * from teacher where TId=?");
                        ps3.setInt(1, TId);
                        ResultSet rs3 = ps3.executeQuery();
                        if (rs3.next()) {
                            Tname = rs3.getString("TName");

                        }
                        //enf for displaying teacher name
                        if (rs.getInt("attendance") == 1) {
                            temp = "Present";
                            present+=1;
                        } else {
                            temp = "Absent";
                            Absent+=1;
                        }

                %>  
                <tr><td><%=rollno%></td>
                    <td><%=name%></td>
                    <td><%=rs.getString("Date")%></td>
                    <td><%=rs.getString("Time")%></td>
                    <td><%= temp%></td>
                    <td><%=Tname%></td>
                    <td><%=Subject%></td>
                    <td><a href="deleteattendance.jsp?aid=<%=AId%>">Delete record</a></td></tr>
                    <%
        }%>
            </table>
        </div>
        <h3 style="text-align: center"><%=present%> were present, <%=Absent%> were absent</h3>
            <%}%>
    </body>
</html>

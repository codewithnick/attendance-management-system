<%-- 
    Document   : EditSubject2
    Created on : 12 Apr, 2021, 3:53:33 PM
    Author     : Admin
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@ include file="header.jsp" %>
<%
   
    if(request.getParameter("submit")!=null){
        
       // Statement stmt=conn.createStatement();
        if((request.getParameter("sid")!=null)){
        int SubId;
        SubId=Integer.parseInt(request.getParameter("sid"));
        String subje=request.getParameter("upsuj");
        String DOW=request.getParameter("updowe");
        int Sem=Integer.parseInt(request.getParameter("upsem"));
        String sql1="update Subject Set Subject=? , Sem=? , DayOfWeek=? where SubId=? ;";
        PreparedStatement stmt=conn.prepareStatement(sql1);
        stmt.setString(1,subje);
        stmt.setInt(2,Sem);
        stmt.setString(3,DOW);
        stmt.setInt(4,SubId);
        //String query2="update Subject Set Subject='"+subje+"' , Sem='"+Sem+"' , DayOfWeek='"+DOW+"' where SubId=401 ;";
        stmt.executeUpdate();
        }
        }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Subject</title>
    </head>
    <body>
        <%
            //Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","root");
            String x="";
            int y=0;
            int SubId=0;
            String Dow="";
            if((request.getParameter("sid")!=null)){
            SubId=Integer.parseInt(request.getParameter("sid"));
            PreparedStatement stmt1=conn.prepareStatement("select Subject,Sem,DayOfWeek from subject where SubId=?;");
            stmt1.setInt(1,SubId);
            /*Statement stmt1=conn1.createStatement();
            String query1="select Subject,Sem from subject where SubId=401;";*/
            ResultSet rs1 = stmt1.executeQuery();

            if (rs1.next())
            {
                x = rs1.getString("Subject");
                y = rs1.getInt("Sem");
                Dow = rs1.getString("DayOfWeek");
            }
            }
        %>
        <h1 style="text-align: center;">Welcome, You can edit the subject here!</h1>
        <br>
        <form action="EditSubject2.jsp">
            <input type="hidden" name="sid" value="<%=SubId%>" />
            <table align="center" class="editsub">            
            <tr><td>New Subject</td><td><input type="text" value="<%=x%>" name="upsuj"></td></tr>
            <tr><td>New Day Of Week</td>
            <td>
                <select name="updowe">
                <option <%if(Dow.equals("Monday")){%>selected<%}%> value="Monday">Monday</option>
                <option <%if(Dow.equals("Tuesday")){%>selected<%}%> value="Tuesday">Tuesday</option>
                <option <%if(Dow.equals("Wednesday")){%>selected<%}%> value="Wednesday">Wednesday</option>
                <option <%if(Dow.equals("Thursday")){%>selected<%}%> value="Thursday">Thursday</option>
                <option <%if(Dow.equals("Friday")){%>selected<%}%> value="Friday">Friday</option>
                <option <%if(Dow.equals("Saturday")){%>selected<%}%> value="Saturday">Saturday</option>
                </select>
            </td>
            </tr>
            <tr>
            <td>
                <label>New Semester:</label>
            </td>
            <td>
                <select name="upsem">
                    <%for (int i = 1; i <= 6; i++) {
                    %>
                    <option <%if (i == y) {%>selected<%}%>>
                        <%=i%>
                    </option>
                    <%
                        }
                    %>
                </select>
            </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;"><input type="submit" value="SAVE CHANGES" name="submit" style="font-size:16px;font-weight: bold; width:20em;background:white;"></td></tr>
        </table>
        </form>
    </body>
</html>

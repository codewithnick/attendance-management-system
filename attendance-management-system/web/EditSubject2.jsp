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
    //Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","root");
    if(request.getParameter("Submit")!=null){
        
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
            if((request.getParameter("sid")!=null)){
            SubId=Integer.parseInt(request.getParameter("sid"));
            PreparedStatement stmt1=conn.prepareStatement("select Subject,Sem from subject where SubId=?;");
            stmt1.setInt(1,SubId);
            /*Statement stmt1=conn1.createStatement();
            String query1="select Subject,Sem from subject where SubId=401;";*/
            ResultSet rs1 = stmt1.executeQuery();

            if (rs1.next())
            {
                x = rs1.getString("Subject");
                y = rs1.getInt("Sem");
            }
            }
        %>
        <form action="EditSubject2.jsp">
            <input type="hidden" name="sid" value="<%=SubId%>" />
            <table>
            <tr>
            <td>
            Current Semester:<%=y%>
            </td>
            </tr>
            <tr>
            <td>
            Current Subject:<%=x%>
            </td>
            </tr>
            <tr>
                <td>
                    <label>New Subject:</label>
                </td>
            <td>
                <input type="text" name="upsuj">
            </td>
            </tr>
            <tr>
            <td>
                <label>New Day Of Week:</label>
            </td>
            <td>
                <select name="updowe">
                <option value="Monday">Monday</option>
                <option value="Tuesday">Tuesday</option>
                <option value="Wednesday">Wednesday</option>
                <option value="Thrusday">Thrusday</option>
                <option value="Friday">Friday</option>
                <option value="Saturday">Saturday</option>
                </select>
            </td>
            </tr>
            <tr>
            <td>
                <label>New Semester:</label>
            </td>
            <td>
                <select name="upsem">
                <option value="1">I</option>
                <option value="2">II</option>
                <option value="3">III</option>
                <option value="4">IV</option>
                <option value="5">V</option>
                <option value="6">VI</option>
                </select>
            </td>
            </tr>
            <tr>
                <td><input type="submit" value="Save" name="Submit"/></td>
            </tr>
        </table>
        </form>
    </body>
</html>

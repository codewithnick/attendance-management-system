<%-- 
    Document   : Addsubject
    Created on : Mar 27, 2021, 10:10:57 PM
    Author     : PRAJAPATI GAURAV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="header.jsp" %>
<% String message="";
   if(request.getParameter("submit")!=null){
        String Sub=request.getParameter("Subject");
        String DOW=request.getParameter("RDay");
        int Sem=Integer.parseInt(request.getParameter("Rsemester"));
        int TId=(Integer)session.getAttribute("TId");
        String sql="insert into subject( SubId,Subject,DayOfWeek,TId,Sem) values(?,?,?,?,?)";
            PreparedStatement ps=conn.prepareStatement(sql);
            String sql1="select max(SubId) as max from subject";
           PreparedStatement ps1=conn.prepareStatement(sql1);
            ResultSet newid=ps1.executeQuery();
            int Newid=1;
            if(newid.next())
            {
                Newid=newid.getInt(1)+1;
            }
            ps.setInt(1,Newid);
            ps.setString(2,Sub);
            ps.setString(3,DOW);
            ps.setInt(4,TId);
            ps.setInt(5,Sem);
            int r=ps.executeUpdate();
            if(r>0)
            {
                message="Subject has been added Successfully";
            }
            else{
                message="Failed to add Subject";
            }
        
   }
        
 %>
 
    <head>
        <title>Add Subject</title>
        <link rel="stylesheet" href="css/style.css"/>
    </head>
 <body>
     <br>
     <br>
     <h1 style="text-align: center; color:#fe019a">Welcome, You can add new subject here!</h1>
    
        <form action="Addsubject.jsp">
            <table border="1" align="center" class="addsub">
                <tr><td> Subject Name</td><td><input type="text" name="Subject"></td></tr>
            <tr><td>Select Day Of Week</td><td><select name="RDay">
                <option>Select Day</option>
                <option value="Monday">Monday</option>
                <option value="Tuesday">Tuesday</option>
                <option value="Wednesday">Wednesday</option>
                <option value="Thursday">Thursday</option>
                <option value="Friday">Friday</option>
                <option value="Saturday">Saturday</option>
                <option value="Sunday">Sunday</option>
            </select></td></tr>
            <tr><td>Select Semester</td><td><select name="Rsemester">
                <option>Select Sem</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                    </select></td></tr>
            <tr><td colspan='2'></td></tr>
        <tr><td colspan="2" style="text-align: center;"><input type="submit" value="SUBMIT" name="submit" style="font-size:16px;font-weight: bold; width:20em;background:white;"></td></tr>
            <% if(!message.equals("")){ %>
            <div class="massage"><p><%= message%></p></div>
            </table>
          <%  }  %>
        </form>
 </body>
    

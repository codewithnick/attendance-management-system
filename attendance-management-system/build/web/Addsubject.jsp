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
       // Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","");
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
            //System.out.println(Newid+" new id");
            ps.setInt(1,Newid);
            ps.setString(2,Sub);
            ps.setString(3,DOW);
            ps.setInt(4,TId);
            ps.setInt(5,Sem);
            int r=ps.executeUpdate();
            if(r>0)
            {
                message="Subject Added Successfully";
            }
            else{
                message="Subject not added Successfully";
            }
        
   }
        
 %>

    <h1>Welcome TeacherName</h1>
    <div class="card">
        <form action="Addsubject.jsp">
            <h2>Add your Subject</h2>
            Subject Name:<input type="text" name="Subject"></br></br>
            DayOfWeek:<select name="RDay">
                <option>Select Day</option>
                <option value="Monday">Monday</option>
                <option value="Tuesday">Tuesday</option>
                <option value="Wednesday">Wednesday</option>
                <option value="Thursday">Thursday</option>
                <option value="Friday">Friday</option>
                <option value="Saturday">Saturday</option>
                <option value="Sunday">Sunday</option>
            </select></br></br>
            SEM:<select name="Rsemester">
                <option>Select Sem</option>
                <option value="1">Sem 1</option>
                <option value="2">Sem 2</option>
                <option value="3">Sem 3</option>
                <option value="4">Sem 4</option>
                <option value="5">Sem 5</option>
                <option value="6">Sem 6</option>
            </select></br></br>
            <input type="submit" value="SUBMIT" name="submit"></br></br>
            <% if(!message.equals("")){ %>
            <div class="massage"><p><%= message%></p></div>
          <%  }  %>
        </form>
    </div>
    
 <%@ include file="footer.jsp" %>

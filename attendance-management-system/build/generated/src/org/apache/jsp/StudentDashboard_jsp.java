package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Time;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Calendar;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;

public final class StudentDashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/studentheader.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","root");
     //getting current day of week ,date,time
            Calendar calendar = Calendar.getInstance();
            Date date = calendar.getTime();         
            String Dow=new SimpleDateFormat("EEEE", Locale.ENGLISH).format(date.getTime());
            long now = System.currentTimeMillis();
            Time sqlTime = new Time(now);  
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("        <!--  css file here   -->\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\"/>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body >\r\n");
      out.write("        <div class=\"header\">\r\n");
      out.write("            <div class=\"navbar\">\r\n");
      out.write("                <a class=\"logo\" href=\"index.jsp\">Online Attendance</a>\r\n");
      out.write("                <div class=\"navItem\">\r\n");
      out.write("                    <ul>\r\n");
      out.write("                        <li><a href=\"StudentDashboard.jsp\">Student</a></li>\r\n");
      out.write("                        <li><a href=\"UpdateStudentProfile.jsp\">Update Profile</a></li>                        \r\n");
      out.write("                        <li><a href=\"deleteprofile.jsp\">Delete Profile</a></li>\r\n");
      out.write("                        <li><a href=\"#\">LogOut</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <br>\r\n");
      out.write("      <h1 style=\"background-color: #cade52 ;\" align='center'>Mark your attendance for the day!</h1>\r\n");
      out.write("    <div class=\"studentheader\">Today's Date: ");
      out.print( (new java.util.Date()).toLocaleString());
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    ");

        //default will change later
        int sid = 101;

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
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <br>\r\n");
      out.write("    <body>\r\n");
      out.write("        \r\n");
      out.write("    <div class=\"studentheader\">Attendance for Semester: ");
      out.print(sem);
      out.write("</div>\r\n");
      out.write("    <br>\r\n");
      out.write("    <div class=\"studentheader\">Today is: ");
      out.print(Dow);
      out.write("</div>\r\n");
      out.write("    <br>\r\n");
      out.write("    <div class=\"studenttable\" align=\"center\">\r\n");
      out.write("        <table border=\"1\">\r\n");
      out.write("            <tr style=\"background-color: #cade52; color: black; font-size: 20px;\">\r\n");
      out.write("                <!--<th>Id</th>-->\r\n");
      out.write("                <th>Subject</th>\r\n");
      out.write("                <th>DayOfWeek</th>\r\n");
      out.write("                <th>Sem</th>\r\n");
      out.write("                <th>Mark</th>\r\n");
      out.write("                <th>Lectures Attended</th>\r\n");
      out.write("                <th>Total Lectures</th>\r\n");
      out.write("            </tr>\r\n");
      out.write("            ");

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
            
      out.write("\r\n");
      out.write("           <tr>\r\n");
      out.write("             <!--   <td>");
      out.print(Subjectid);
      out.write("</td>-->\r\n");
      out.write("                <td>");
      out.print(subject);
      out.write("</td>\r\n");
      out.write("                <td>");
      out.print(Dow);
      out.write("</td>\r\n");
      out.write("                <td>");
      out.print(sem);
      out.write("</td>\r\n");
      out.write("                <td>\r\n");
      out.write("                    <a href=\"./MarkAttendance.jsp?SId=");
      out.print(sid);
      out.write("&SubId=");
      out.print(Subjectid);
      out.write("\">\r\n");
      out.write("                        Mark\r\n");
      out.write("                    </a>\r\n");
      out.write("                </td>\r\n");
      out.write("                <td>");
      out.print(percent);
      out.write(" %</td>\r\n");
      out.write("                <td>");
      out.print(tot);
      out.write("</td>\r\n");
      out.write("            </tr>\r\n");
      out.write("            ");

                }
            
      out.write("\r\n");
      out.write("            \r\n");
      out.write("\r\n");
      out.write("        </table>    \r\n");
      out.write("    </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

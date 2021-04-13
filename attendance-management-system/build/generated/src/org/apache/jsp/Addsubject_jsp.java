package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class Addsubject_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/footer.jsp");
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
      response.setContentType("text/html");
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

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","root");

      out.write("\r\n");
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
      out.write("    <body>\r\n");
      out.write("        <div class=\"header\">\r\n");
      out.write("            <div class=\"navbar\">\r\n");
      out.write("                <a class=\"logo\" href=\"index.jsp\">Online Attendance</a>\r\n");
      out.write("                <div class=\"navItem\">\r\n");
      out.write("                    <ul>\r\n");
      out.write("                        <li><a href=\"showSubject.jsp\">Show subject</a></li>\r\n");
      out.write("                        <li><a href=\"Addsubject.jsp\">Add subject</a></li>\r\n");
      out.write("                        <li><a href=\"updateprofile.jsp\">Update Profile</a></li>\r\n");
      out.write("                        <li><a href=\"deleteprofile.jsp\">Delete profile</a></li>\r\n");
      out.write("                        <li><a href=\"#\">Logout</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("   ");
      out.write('\r');
      out.write('\n');
 String message="";
   if(request.getParameter("submit")!=null){
        String Sub=request.getParameter("Subject");
        String DOW=request.getParameter("RDay");
        int Sem=Integer.parseInt(request.getParameter("Rsemester"));
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
            ps.setInt(4,201);
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
        
 
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <h1>Welcome TeacherName</h1>\r\n");
      out.write("    <div class=\"card\">\r\n");
      out.write("        <form action=\"Addsubject.jsp\">\r\n");
      out.write("            <h2>Add your Subject</h2>\r\n");
      out.write("            Subject Name:<input type=\"text\" name=\"Subject\"></br></br>\r\n");
      out.write("            DayOfWeek:<select name=\"RDay\">\r\n");
      out.write("                <option>Select Day</option>\r\n");
      out.write("                <option value=\"Monday\">Monday</option>\r\n");
      out.write("                <option value=\"Tuesday\">Tuesday</option>\r\n");
      out.write("                <option value=\"Wednesday\">Wednesday</option>\r\n");
      out.write("                <option value=\"Thursday\">Thursday</option>\r\n");
      out.write("                <option value=\"Friday\">Friday</option>\r\n");
      out.write("                <option value=\"Saturday\">Saturday</option>\r\n");
      out.write("                <option value=\"Sunday\">Sunday</option>\r\n");
      out.write("            </select></br></br>\r\n");
      out.write("            SEM:<select name=\"Rsemester\">\r\n");
      out.write("                <option>Select Sem</option>\r\n");
      out.write("                <option value=\"1\">Sem 1</option>\r\n");
      out.write("                <option value=\"2\">Sem 2</option>\r\n");
      out.write("                <option value=\"3\">Sem 3</option>\r\n");
      out.write("                <option value=\"4\">Sem 4</option>\r\n");
      out.write("                <option value=\"5\">Sem 5</option>\r\n");
      out.write("                <option value=\"6\">Sem 6</option>\r\n");
      out.write("            </select></br></br>\r\n");
      out.write("            <input type=\"submit\" value=\"SUBMIT\" name=\"submit\"></br></br>\r\n");
      out.write("            ");
 if(!message.equals("")){ 
      out.write("\r\n");
      out.write("            <div class=\"massage\"><p>");
      out.print( message);
      out.write("</p></div>\r\n");
      out.write("          ");
  }  
      out.write("\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write(" ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
      out.write('\r');
      out.write('\n');
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

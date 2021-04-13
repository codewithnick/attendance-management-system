package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class showSubject_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("                        <li><a href=\"showSubject.jsp\">Show Subject</a></li>\r\n");
      out.write("                        <li><a href=\"Addsubject.jsp\">Add Subject</a></li>\r\n");
      out.write("                        <li><a href=\"updateprofile.jsp\">Update Profile</a></li>\r\n");
      out.write("                        <li><a href=\"deleteprofile.jsp\">Delete Profile</a></li>\r\n");
      out.write("                        <li><a href=\"#\">LogOut</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("   ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"tables\" align=\"center\">\r\n");
      out.write("    <table border=\"1\">\r\n");
      out.write("        <tr>\r\n");
      out.write("            <th>Sr.No</th>\r\n");
      out.write("            <th>Subject</th>\r\n");
      out.write("            <th>DayOfWeek</th>\r\n");
      out.write("            <th>Sem</th>\r\n");
      out.write("            <th>Delete</th>\r\n");
      out.write("            <th>Edit</th>\r\n");
      out.write("            <th>View</th>\r\n");
      out.write("        </tr>\r\n");
      out.write("        ");
 
            PreparedStatement ps=conn.prepareStatement("Select * from subject where TId=?");
            ps.setInt(1,201);
            ResultSet r=ps.executeQuery();
            int sid;
            String Subject="";
            String DOW="";
            int Sem;
            int Sno=0;
            while(r.next()){
               sid=r.getInt("SubId");
               Subject=r.getString("Subject");
               DOW=r.getString("DayOfWeek");
               Sem=r.getInt("Sem");
               Sno=Sno+1;
        
      out.write("\r\n");
      out.write("        <tr>\r\n");
      out.write("            <td>");
      out.print(Sno);
      out.write("</td>\r\n");
      out.write("            <td>");
      out.print(Subject);
      out.write("</td>\r\n");
      out.write("            <td>");
      out.print(DOW);
      out.write("</td>\r\n");
      out.write("            <td>");
      out.print(Sem);
      out.write("</td>\r\n");
      out.write("            <td><a href=\"update.jsp?q=delete&sid=");
      out.print(sid);
      out.write("\">Delete</a></td>\r\n");
      out.write("            <td><a href=\"update.jsp?sid=");
      out.print(sid);
      out.write("\">Edit</a></td>\r\n");
      out.write("            <td><a href=\"update.jsp?sid=");
      out.print(sid);
      out.write("&Subject=");
      out.print(Subject);
      out.write("&DOW=");
      out.print(DOW);
      out.write("&Sem=");
      out.print(Sem);
      out.write("\">View</a></td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        ");
 } 
      out.write(" \r\n");
      out.write("    </table>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
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

package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Connection;
import java.sql.ResultSet;

public final class view_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


               
           public void deleteRecord(int aid, PreparedStatement del){

           try{
            del.setInt(1,aid);
            del.executeUpdate();
}
    catch(SQLException e){
        System.out.println("Exception");
}
       
} 
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("          <form action=\"view.jsp\">\n");
      out.write("           \n");
      out.write("            <table>\n");
      out.write("                <tr>  <td><input type=\"text\" name=\"txt_search\"> </td>  \n");
      out.write("                    <td><input type=\"submit\" value=\"Search\" name=\"btn_search\"> </td> <td>By<td> \n");
      out.write("                    <td><select name=\"search\">\n");
      out.write("                <option value=\"name\">Name</option>\n");
      out.write("                <option value=\"rollno\">Roll No</option>\n");
      out.write("                <option value=\"subject\">Subject</option>\n");
      out.write("                <option value=\"date\">Date</option>\n");
      out.write("              </select>\n");
      out.write("                    </td>\n");
      out.write("            </table>\n");
      out.write("           \n");
      out.write("        </form>\n");
      out.write("                <table border=\"1\">\n");
      out.write("                    <tr> <th>Attendance Id</th>\n");
      out.write("                    <th>Date</th>\n");
      out.write("                    <th>Time</th>\n");
      out.write("                    <th>Attendance</th>\n");
      out.write("                    <th>Student Id</th>\n");
      out.write("                    <th>Subject ID</th>\n");
      out.write("                    <th>Delete Record</th>\n");
      out.write("                    </tr>\n");
      out.write("            \n");
      out.write("       ");
 
          String txt=request.getParameter("txt_search");
          String dropdown=request.getParameter("search");
        String a;
        if (request.getParameter("delete") == null)
    a = "";
else
    a = request.getParameter("delete");

   

            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance?useSSL=false","root","root");
            PreparedStatement ps;
            ResultSet rs;
            if(dropdown.equals("name")){
            ps = con.prepareStatement("Select * from Attendance where SId in(Select SId from Student where SName= ?) Order by Attendance desc");            
            ps.setString(1,txt);
            rs=ps.executeQuery(); 
     }
            else if(dropdown.equals("rollno")){
            ps = con.prepareStatement("Select * from Attendance where SId in (Select SId from Student where RollNo= ?) Order by Attendance desc");
            ps.setString(1,txt);
            rs=ps.executeQuery();
     }
            else if(dropdown.equals("subject")){
            ps = con.prepareStatement("Select * from Attendance where SubId in (Select SubId from Subject where Subject= ?) Order by Attendance desc");
            ps.setString(1,txt);
            rs=ps.executeQuery();
     }
            else{
            ps = con.prepareStatement("Select * from Attendance where Date =? Order by Attendance desc");
            ps.setString(1,txt);
            rs=ps.executeQuery();
            } 
        PreparedStatement del = con.prepareStatement("Delete from Attendance where AId=? ");
         if(a != null){
     /*   deleteRecord(Integer.parseInt(a),del); */
    }
       int record;
      out.write("\n");
      out.write("            ");
      out.write("\n");
      out.write("    ");
   while(rs.next()){
                 String temp;
                 if(rs.getInt("attendance")==1){
                      temp="Present";
                 }
                 else{
                     temp="Absent";
        }
                 int aid=rs.getInt("AId");
                 String aidstring=String.valueOf(aid);

      out.write("<form action=\"#\">   \n");
      out.write("    <tr><td>");
      out.print( aidstring);
      out.write("</td>\n");
      out.write("    <td>");
      out.print(rs.getString("Date"));
      out.write("</td>\n");
      out.write("    <td>");
      out.print(rs.getString("Time"));
      out.write("</td>\n");
      out.write("    <td>");
      out.print( temp );
      out.write("</td>\n");
      out.write("   <td>");
      out.print(rs.getInt("SId"));
      out.write("</td>\n");
      out.write("    <td>");
      out.print(rs.getInt("SubId"));
      out.write("</td>\n");
      out.write("    <td>     \n");
      out.write("        <input type=\"submit\" value=\"");
      out.print(aidstring);
      out.write("\" name=\"delete\" onClick=\"");

       
        
      out.write("\" >\n");
      out.write("</td></tr></form>\n");
      out.write("    ");

}   
      out.write("\n");
      out.write("  </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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

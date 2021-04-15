<%-- 
    Document   : deleteattendance
    Created on : Apr 14, 2021, 5:05:03 PM
    Author     : bot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

        <% 
            int aid= Integer.parseInt(request.getParameter("aid"));
            String sql="update attendance set attendance=0 where aid=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1,aid);
            ps.executeUpdate();           
            response.sendRedirect("view.jsp");
        %>              
    </body>
</html>

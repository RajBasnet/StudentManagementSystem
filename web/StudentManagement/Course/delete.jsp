<%@page import="com.leapfrog.entity.dao.impl.CourseDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.CourseDAO"%>


<%
    CourseDAO courseDAO=new CourseDAOimpl();
    if(request.getParameter("id")!=null){
    int id=Integer.parseInt(request.getParameter("id"));
    courseDAO.delete(id);
    response.sendRedirect("course.jsp");
    
}
%>


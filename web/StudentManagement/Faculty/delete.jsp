<%@page import="com.leapfrog.entity.dao.impl.FacultyDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.FacultyDAO"%>
<%
    FacultyDAO facultyDAO= new FacultyDAOimpl();
    if(request.getParameter("id")!=null){
        int id=Integer.parseInt(request.getParameter("id"));
        facultyDAO.delete(id);
        response.sendRedirect("faculty.jsp");
    }
    

%>
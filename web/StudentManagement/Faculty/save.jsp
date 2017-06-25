<%@page import="com.leapfrog.entity.dao.impl.FacultyDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.FacultyDAO"%>
<%@page import="com.leapfrog.entity.Faculty"%>
<%
    if(request.getMethod().equalsIgnoreCase("post")){
    Faculty faculty=new Faculty();
    
    faculty.setName(request.getParameter("faculty_name"));
    faculty.setStatus(request.getParameter("status")!=null);
    FacultyDAO facultyDAO=new FacultyDAOimpl();
    if(request.getParameter("faculty_id")==null){
       facultyDAO.insert(faculty);
    }else{
        int id=Integer.parseInt(request.getParameter("faculty_id"));
        faculty.setId(id);
        facultyDAO.update(faculty);
    }
    
    response.sendRedirect("faculty.jsp");
    } else {
        out.println("<h1>Error</h1>");
    }

%>
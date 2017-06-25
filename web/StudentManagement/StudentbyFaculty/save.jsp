<%@page import="com.leapfrog.entity.dao.impl.StudentbyFacultyDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.StudentbyFacultyDAO"%>
<%@page import="com.leapfrog.entity.StudentbyFaculty"%>
<%@page import="com.leapfrog.entity.Student"%>
<%@page import="com.leapfrog.entity.dao.impl.FacultyDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.FacultyDAO"%>
<%@page import="com.leapfrog.entity.Faculty"%>
<%
    if(request.getMethod().equalsIgnoreCase("post")){
    Faculty faculty=new Faculty();
    faculty.setId(Integer.parseInt(request.getParameter("faculty_id")));
    
    Student student=new Student();
    student.setId(Integer.parseInt(request.getParameter("student_id")));
    
    StudentbyFaculty sf=new StudentbyFaculty();
    sf.setFaculty(faculty);
    sf.setStudent(student);
   
    StudentbyFacultyDAO sfDAO=new StudentbyFacultyDAOimpl();
    sfDAO.insert(sf);
    
    response.sendRedirect("Studentbyfaculty.jsp");
    } else {
        out.println("<h1>Error</h1>");
    }

%>
<%@page import="com.leapfrog.entity.dao.impl.StudentDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.StudentDAO"%>
<%@page import="com.leapfrog.entity.Student"%>
<%
    if(request.getMethod().equalsIgnoreCase("post")){
    Student student=new Student();
    
    student.setFirstName(request.getParameter("first_name"));
    student.setLastName(request.getParameter("last_name"));
    student.setStatus(request.getParameter("status")!=null);
    StudentDAO studentDAO=new StudentDAOimpl();
    if(request.getParameter("student_id")==null){
       studentDAO.insert(student);
    }else{
        int id=Integer.parseInt(request.getParameter("student_id"));
        student.setId(id);
        studentDAO.update(student);
    }
    
    response.sendRedirect("student.jsp");
    } else {
        out.println("<h1>Error</h1>");
    }

%>
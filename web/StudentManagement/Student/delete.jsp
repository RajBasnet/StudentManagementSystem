<%@page import="com.leapfrog.entity.dao.impl.StudentDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.StudentDAO"%>
<%
    StudentDAO studentDAO= new StudentDAOimpl();
    if(request.getParameter("id")!=null){
        int id=Integer.parseInt(request.getParameter("id"));
        studentDAO.delete(id);
        response.sendRedirect("student.jsp");
    }
    

%>
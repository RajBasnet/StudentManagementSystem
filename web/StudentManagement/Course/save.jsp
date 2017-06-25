<%@page import="com.leapfrog.entity.Student"%>
<%@page import="com.leapfrog.entity.Faculty"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.leapfrog.entity.dao.impl.CourseDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.CourseDAO"%>

<%@page import="com.leapfrog.entity.Course"%>
<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        Course course = new Course();

        
        course.setName(request.getParameter("course_name"));
        course.setCode(request.getParameter("course_code"));
        

        course.setStatus(request.getParameter("status") != null);
        CourseDAO courseDAO = new CourseDAOimpl();
        if (request.getParameter("course_id")==null) {
            courseDAO.insert(course);

            
        } else {
            int id = Integer.parseInt(request.getParameter("course_id"));
            course.setId(id);
            courseDAO.update(course);
        }
        response.sendRedirect("course.jsp");
        
    } else {
        out.println("<h1>Error</h1>");

    }

%>
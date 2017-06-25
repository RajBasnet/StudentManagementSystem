<%@page import="com.leapfrog.entity.dao.impl.StudentbyCourseDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.StudentbyCourseDAO"%>
<%@page import="com.leapfrog.entity.StudentbyCourse"%>
<%@page import="com.leapfrog.entity.Student"%>
<%@page import="com.leapfrog.entity.dao.impl.CourseDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.CourseDAO"%>
<%@page import="com.leapfrog.entity.Course"%>
<%
    if(request.getMethod().equalsIgnoreCase("post")){
    Course course=new Course();
    course.setId(Integer.parseInt(request.getParameter("course_id")));
    
    Student student=new Student();
    student.setId(Integer.parseInt(request.getParameter("student_id")));
    
    StudentbyCourse sc=new StudentbyCourse();
    sc.setCourse(course);
    sc.setStudent(student);
   
    StudentbyCourseDAO scDAO=new StudentbyCourseDAOimpl();
    scDAO.insert(sc);
    
    response.sendRedirect("Studentbycourse.jsp");
    } else {
        out.println("<h1>Error</h1>");
    }

%>
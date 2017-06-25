<%@page import="com.leapfrog.entity.Course"%>
<%@page import="com.leapfrog.entity.dao.impl.CourseDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.CourseDAO"%>
<%@page import="com.leapfrog.entity.Faculty"%>
<%@page import="com.leapfrog.entity.dao.impl.FacultyDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.FacultyDAO"%>
<%@page import="com.leapfrog.entity.Student"%>
<%@page import="com.leapfrog.entity.dao.impl.StudentDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.StudentDAO"%>
<%@include file="../shared/header.jsp" %>

<h1>Add Course</h1>
<form method="post" action="save.jsp">

    



    <div class="form-group">
        <label>Course Name</label>
        <input type="text" name="course_name" required="required"
               placeholder="Enter Course Name" >
    </div>


    <div class="form-group">
        <label>Code</label>

        
        <input type="text" name="course_code" required="required" placeholder="Enter code">
        
    </div>  






    <div class="form-group">
        <label>Status</label>
        <label>
            <input type="checkbox" name="status" class=""/>
            Active
        </label>
    </div>
    <button type="submit" class="btn btn-success">Save</button>
    <a href="course.jsp" class="btn btn-danger">Back</a>


</form>
<%@include file="../shared/footer.jsp" %>

<%@page import="com.leapfrog.entity.Course"%>
<%@page import="com.leapfrog.entity.dao.impl.CourseDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.CourseDAO"%>
<%

    CourseDAO courseDAO = new CourseDAOimpl();
    Course c = new Course();

    if (request.getParameter("id") != null) {

        int id = Integer.parseInt(request.getParameter("id"));
        c = courseDAO.getById(id);
        if (c == null) {
            c = new Course();
            response.sendRedirect("course.jsp");
        }
    } else {
        response.sendRedirect("course.jsp");
    }


%>

<%@include file="../shared/header.jsp" %>

<h1>Edit Course</h1>
<form method="post" action="save.jsp">
    <div class="form-group">
        <label>Course Name</label>
        <input type="text" name="course_name" required="required"
               placeholder="Enter Course Name" value="<%=c.getName()%>">

    </div>

    <div class="form-group">
        <label>Course Code</label>
        <input type="text" name="course_code" required="required"
               placeholder="Enter Course Code" value="<%=c.getCode()%>">

    </div>

    <div class="form-inline">
        <label>Status</label>
        <label>
            <input type="checkbox" name="status" <% out.println((c.isStatus()) ? "checked='checked'" : "");%>>
            Active
        </label>
    </div>          

    <input type="hidden" name="course_id" value="<%=c.getId()%>"/>
    <button type="submit" class="btn btn-success">Save</button>
    <a href="course.jsp" class="btn btn-danger">Back</a>

</form>

<%@include file="../shared/footer.jsp" %>
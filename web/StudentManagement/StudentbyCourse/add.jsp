<%@page import="com.leapfrog.entity.Student"%>
<%@page import="com.leapfrog.entity.dao.impl.StudentDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.impl.CourseDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.CourseDAO"%>
<%@page import="com.leapfrog.entity.Course"%>
<%@include file="../shared/header.jsp" %>

<%
    CourseDAO courseDAO = new CourseDAOimpl();
    StudentDAO studentDAO = new StudentDAOimpl();


%>

<h1>Add Student By Course</h1>
<form method="post" action="save.jsp">

    <div class="form-group">
        <label>Select Course</label>
        <select  name="course_id" required="required">
            <option>Please select..</option>
            <%                for (Course c : courseDAO.getAll()) {
            %>
            <option value="<%=c.getId()%>"><%=c.getName()%></option>
            <%}%>


        </select>

    </div>

    <div class="form-group">
        <label>Select Student</label>
        <select  name="student_id" required="required">
            <option>Please select..</option>
            <%
                for (Student s : studentDAO.getAll()) {
            %>
            <option value="<%=s.getId()%>"><%=s.getFirstName()%> <%=s.getLastName()%></option>
            <%}%>


        </select>

    </div>


    
    <button type="submit" class="btn btn-success">Save</button>
    <a href="Studentbyfcourse.jsp" class="btn btn-danger">Back</a>

</form>

<%@include file="../shared/footer.jsp" %>
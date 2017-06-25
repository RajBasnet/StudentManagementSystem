<%@page import="com.leapfrog.entity.Student"%>
<%@page import="com.leapfrog.entity.dao.impl.StudentDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.impl.FacultyDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.FacultyDAO"%>
<%@page import="com.leapfrog.entity.Faculty"%>
<%@include file="../shared/header.jsp" %>

<%
    FacultyDAO facultyDAO = new FacultyDAOimpl();
    StudentDAO studentDAO = new StudentDAOimpl();


%>

<h1>Add Student By Faculty</h1>
<form method="post" action="save.jsp">

    <div class="form-group">
        <label>Select Faculty</label>
        <select  name="faculty_id" required="required">
            <option>Please select..</option>
            <%                for (Faculty f : facultyDAO.getAll()) {
            %>
            <option value="<%=f.getId()%>"><%=f.getName()%></option>
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
    <a href="Studentbyfaculty.jsp" class="btn btn-danger">Back</a>

</form>

<%@include file="../shared/footer.jsp" %>
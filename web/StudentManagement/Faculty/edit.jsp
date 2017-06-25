<%@page import="com.leapfrog.entity.Faculty"%>
<%@page import="com.leapfrog.entity.dao.impl.FacultyDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.FacultyDAO"%>
<%
    FacultyDAO facultyDAO = new FacultyDAOimpl();
    Faculty faculty = new Faculty();
    if (request.getParameter("id") != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        faculty = facultyDAO.getById(id);
        if (faculty == null) {
            faculty = new Faculty();
            response.sendRedirect("faculty.jsp");
        }
    } else {
        response.sendRedirect("faculty.jsp");
    }


%>
<%@include file="../shared/header.jsp" %>

<h1>Edit Faculty</h1>
<form method="post" action="save.jsp">
    <div class="form-group">
        <label>Faculty Name</label>
        <input type="text" name="faculty_name" required="required" 
               placeholder="Enter Faculty Name" 
               value="<%=faculty.getName()%>">


    </div>
    <div class="form-inline">
        <label>Status</label>
        <label>
            <input type="checkbox" name="status"  
                   class="" <% out.println((faculty.isStatus()) ? "checked='checked'" : "");%>>
            Active
        </label>

    </div>
            <input type="hidden" name="faculty_id" value="<%=faculty.getId()%>"/>
    <button type="submit" class="btn btn-success">Save</button>
    <a href="faculty.jsp" class="btn btn-danger">Back</a>

</form>

<%@include file="../shared/footer.jsp" %>
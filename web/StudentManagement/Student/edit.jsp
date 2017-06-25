<%@page import="com.leapfrog.entity.Student"%>
<%@page import="com.leapfrog.entity.dao.impl.StudentDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.StudentDAO"%>
<%
    StudentDAO studentDAO = new StudentDAOimpl();
    Student student = new Student();
    if (request.getParameter("id") != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        student = studentDAO.getById(id);
        if (student == null) {
            student = new Student();
            response.sendRedirect("student.jsp");
        }
    } else {
        response.sendRedirect("student.jsp");
    }


%>
<%@include file="../shared/header.jsp" %>

<h1>Edit Student</h1>
<form method="post" action="save.jsp">
    <div class="form-group">
        <label>First Name</label>
        <input type="text" name="first_name" required="required" 
               placeholder="Enter First Name"
               value="<%=student.getFirstName()%>">


    </div>
               <div class="form-group">
        <label>Last Name</label>
        <input type="text" name="last_name" required="required" 
               placeholder="Enter last Name"
               value="<%=student.getLastName()%>">


    </div>
    <div class="form-inline">
        <label>Status</label>
        <label>
            <input type="checkbox" name="status"  
                   class="" <% out.println((student.isStatus()) ? "checked='checked'" : "");%>>
            Active
        </label>

    </div>
            <input type="hidden" name="student_id" value="<%=student.getId()%>"/>
    <button type="submit" class="btn btn-success">Save</button>
    <a href="student.jsp" class="btn btn-danger">Back</a>

</form>

<%@include file="../shared/footer.jsp" %>
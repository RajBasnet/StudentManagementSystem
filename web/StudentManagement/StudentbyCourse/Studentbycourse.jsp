
<%@page import="com.leapfrog.entity.dao.impl.StudentbyCourseDAOimpl"%>
<%@page import="com.leapfrog.entity.StudentbyCourse"%>
<%@page import="com.leapfrog.entity.dao.StudentbyCourseDAO"%>
<%@page import="com.leapfrog.entity.Course"%>
<%@page import="com.leapfrog.entity.dao.impl.CourseDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.CourseDAO"%>
<%@include file="../shared/header.jsp"%>


<div class="form-group">
    <form method="post" action="Studentbycourse.jsp">
        <h3 id="h1a" align="center"><span style="color:#FFFFFF"><label>Search by Course: </label></span></h3><br><br>
        <div class="pull-right">
            <a href="add.jsp" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span></a>
        </div>
        <br><br>
        <select id="list" class="form-group" onchange="changeFunc()">

            <%
                CourseDAO courseDAO = new CourseDAOimpl();
                for (Course c : courseDAO.getAll()) {
            %>

            <option  value="<%=c.getName()%>"><%=c.getId()%> - <%=c.getName()%></option>
            <%}%>


        </select>
    </form>
</div>

<script>
    function $(key) {
        return document.getElementById(key);
    }
    window.onload = function () {
        $(list.options[0].value).style.display = "table";
    }
    function changeFunc() {
        var list = document.getElementById("list");
        for (var i = 0; i < list.length; i++) {
            if (i !== list.selectedIndex) {
                $(list.options[i].value).style.display = "none";
            }
        }
        $(list.options[list.selectedIndex].value).style.display = "table";
    }

</script>

<%
    for (Course c : courseDAO.getAll()) {
%>

<table id="<%=c.getName()%>" class="table table-bordered table-striped table-hover" style="display:none">
    <tr> 
        <th>Student Id</th>    
        <th>Student Name</th>
        <th>Course</th>
        <th>Enroll Date</th>
    </tr>


    <%
        StudentbyCourseDAO scdao = new StudentbyCourseDAOimpl();

        for (StudentbyCourse sc : scdao.getAll2(c.getId())) {
    %>
    <tr>
        <td><%=sc.getId()%></td>
        <td><%=sc.getStudent().getFirstName()%> <%=sc.getStudent().getLastName()%></td>
        <td><%=sc.getCourse().getName()%></td>
        <td><%=sc.getEnrollDate()%></td>

    </tr>
    <%
            }
        }
    %>
</table>

<%@include file="../shared/footer.jsp" %>
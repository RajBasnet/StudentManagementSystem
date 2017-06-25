
<%@page import="com.leapfrog.entity.dao.impl.StudentbyFacultyDAOimpl"%>
<%@page import="com.leapfrog.entity.StudentbyFaculty"%>
<%@page import="com.leapfrog.entity.dao.StudentbyFacultyDAO"%>
<%@page import="com.leapfrog.entity.Faculty"%>
<%@page import="com.leapfrog.entity.dao.impl.FacultyDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.FacultyDAO"%>

<%@include file="../shared/header.jsp"%>


<div class="form-group">
    <form method="post" action="Studentbyfaculty.jsp">
        <h3 id="h1a" align="center"><span style="color:#FFFFFF"><label>Search by Faculty: </label></span></h3><br><br>
        <div class="pull-right">
            <a href="add.jsp" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span></a>
        </div>
        <br><br>
        <select id="list" class="form-group" onchange="changeFunc()">

            <%
                FacultyDAO facultyDAO = new FacultyDAOimpl();
                for (Faculty f : facultyDAO.getAll()) {
            %>

            <option  value="<%=f.getName()%>"><%=f.getId()%> - <%=f.getName()%></option>
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
    for (Faculty f : facultyDAO.getAll()) {
%>

<table id="<%=f.getName()%>" class="table table-bordered table-striped table-hover" style="display:none">
    <tr> 
        <th>Student Id</th>    
        <th>Student Name</th>
        <th>Faculty</th>
        <th>Join Date</th>
    </tr>


    <%
        StudentbyFacultyDAO sfdao = new StudentbyFacultyDAOimpl();

        for (StudentbyFaculty sf : sfdao.getAll2(f.getId())) {
    %>
    <tr>
        <td><%=sf.getId()%></td>
        <td><%=sf.getStudent().getFirstName()%> <%=sf.getStudent().getLastName()%></td>
        <td><%=sf.getFaculty().getName()%></td>
        <td><%=sf.getJoinDate()%></td>

    </tr>
    <%
            }
        }
    %>
</table>

<%@include file="../shared/footer.jsp" %>
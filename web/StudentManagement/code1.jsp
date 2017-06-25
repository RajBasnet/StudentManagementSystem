
<%@page import="com.leapfrog.entity.StudentbyFaculty"%>
<%@page import="com.leapfrog.entity.dao.impl.StudentbyFacultyDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.StudentbyFacultyDAO"%>
<%@page import="com.leapfrog.entity.Faculty"%>
<%@page import="com.leapfrog.entity.dao.impl.FacultyDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.FacultyDAO"%>
<%@include file="shared/header.jsp"%>

<%
    FacultyDAO facultyDAO = new FacultyDAOimpl();
%>
<div class="form-group">
    <form method="post" action="studentFaculty.jsp">
        <label>Faculty: </label>
        <select id="list" class="form-group" onchange="changeFunc()">
            <%
                for (Faculty f : facultyDAO.getAll()) {
            %>
            <option id="<%=f.getId()%>" value="<%=f.getName()%>"><%=f.getName()%></option>>
            <%
                }
            %>

        </select>
    </form>
</div>
<script>
    function $(key) {
        return document.getElementById(key);
    }
    window.onload=function(){
        $(list.options[0].value).style.display = "table";
    }
    function changeFunc() {
        var list = document.getElementById("list");
        for(var i=0; i<list.length;i++){
            if(i!==list.selectedIndex){
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
    </tr>


    <%
        StudentbyFacultyDAO sfdao = new StudentbyFacultyDAOimpl();
        int j = 1;
        for (StudentbyFaculty sf : sfdao.getAll()) {
    %>
    <tr>
        <td><%=j%></td>
        <td><%=sf.getStudent().getFirstName()%> <%=sf.getStudent().getLastName()%></td>
        <td><%=sf.getFaculty().getName()%></td>

    </tr>
    <%
                j++;
            }
        }
    %>
</table>

<%@include file="shared/footer.jsp" %>
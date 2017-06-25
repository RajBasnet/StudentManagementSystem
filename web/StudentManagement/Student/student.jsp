
<%@page import="com.leapfrog.entity.Student"%>
<%@page import="com.leapfrog.entity.dao.impl.StudentDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.StudentDAO"%>
<%@include file="../shared/header.jsp" %>



<h1 id="h1a" align="center"><span style="color:#FFFFFF"><strong>Students</strong></span></h1>
<form>
    <input type="text" name="search" placeholder="Search.." id="input1" class="light-table-filter" data-table="order-table">


</form>
<br>
<br>
<p align="right">
    <a href="add.jsp" class="btn btn-success btn-xs" role="button"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
</p>
<table class="order-table table table table-bordered table-hover table-striped">
    <tr>
        <th>Id</th>
        <th>Name</th>
        
        <th>Action</th>
    </tr>
    <% StudentDAO studentDAO = new StudentDAOimpl();
        for (Student s : studentDAO.getAll()) {%>
    <tr class="<%=(s.isStatus()) ? "success" : "danger"%>">
        <td><%=s.getId()%></td>
        <td><%=s.getFirstName()%> <%=s.getLastName()%> </td>
        

        <td> <a href="edit.jsp?id=<%=s.getId()%>" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
            <a href="delete.jsp?id=<%=s.getId()%>" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')"><span class="glyphicon glyphicon-trash"></span></a></td>
    </tr>

    <%}%>


</table>


<%@include file="../shared/footer.jsp" %>
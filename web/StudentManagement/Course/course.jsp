<%@page import="com.leapfrog.entity.Course"%>
<%@page import="com.leapfrog.entity.dao.impl.CourseDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.CourseDAO"%>
<%@include file="../shared/header.jsp" %>

<h1 id="h1a" align="center"><span style="color:#FFFFFF"><strong>Course</strong></span></h1>


<form>
    <input type="text" name="search" placeholder="Search.." id="input1" class="light-table-filter" data-table="order-table"><br>
    <br>

    <p align="right">
        <a href="add.jsp" class="btn btn-success btn-xs" role="button">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        </a>
    </p>

    <table class="order-table table table-bordered table-hover table-striped">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Code</th>
            
            <th>Action</th>
        </tr>

        <%
            CourseDAO courseDAO = new CourseDAOimpl();
            for (Course c : courseDAO.getAll()) {%>

        <tr class="<%=(c.isStatus()) ? "success" : "danger"%>">
            <td><%=c.getId()%></td>
            <td><%=c.getName()%></td>
            <td><%=c.getCode()%></td>
            

            <td>


                <a href="edit.jsp?id=<%=c.getId()%>" class="btn btn-success btn-xs">
                    <span class="glyphicon glyphicon-pencil"></span>
                </a> 
                <a href="delete.jsp?id=<%=c.getId()%>" class="btn btn-danger btn-xs" onclick="return confirm('Are you confirm to delete?')">
                    <span class="glyphicon glyphicon-trash"></span>
                </a>
            </td>
        </tr>

        <%}%>

    </table>
</form>





<%@include file="../shared/header.jsp"%>

<%@page import="com.leapfrog.entity.Faculty"%>
<%@page import="com.leapfrog.entity.dao.impl.FacultyDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.FacultyDAO"%>



<h1 id="h1a" align="center"><span style="color:#FFFFFF"><strong>Faculty</strong></span></h1>
<form>
    <input  type="text" name="search" placeholder="Search.." id="input1" class="light-table-filter" data-table="order-table">
    <br>
    <br>
</form>
<p align="right">
    <a href="add.jsp" class="btn btn-success btn-xs" role="button"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
</p>

<table class="order-table table table-bordered table-hover table-striped" id="faculty_table">

    <tr>
        <th>Id</th>
        <th>Name</th>
        
        <th>Action</th>
    </tr>
    <% FacultyDAO facultyDAO = new FacultyDAOimpl();
        for (Faculty f : facultyDAO.getAll()) {%>
    <tr class="<%=(f.isStatus()) ? "success" : "danger"%>">

        <td><%=f.getId()%></td>
        <td><%=f.getName()%></td>
        
        <td>
            <a href="edit.jsp?id=<%=f.getId()%>" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-pencil"></span></a>
            <a href="delete.jsp?id=<%=f.getId()%>" class="btn btn-danger btn-xs" onclick="return confirm('Are you sure to delete?')">
                <span class="glyphicon glyphicon-trash"></span></a></td>
    </tr>

    <% }%>


</table>
<div class="w3-content w3-display-container">

    <img class="slide" style="display:inline" src="http://www.news1india.in/img/news_image/post25678168_image0.jpg" height=500px width=100%>
    <img class="slide" style="display:inline" src="http://inovatechnc.com/wp-content/images/2109471_Faculty_Management_Team.jpg" height=500px width=100%>

    <img class="slide" style="display:inline" src="http://www.becbgk.edu/department/physics/physics1.jpg" height=500px width=100%>
    <img class="slide" style="display:inline" src="https://staff.imsa.edu/math/pictures/logos/MathLogo.png" height=500px width=100%>


    <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
    <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
</div>


<%@include file="../shared/footer.jsp" %>
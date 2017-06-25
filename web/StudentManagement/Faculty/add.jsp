<%@include file="../shared/header.jsp" %>

<h1>Add Faculty</h1>
<form method="post" action="save.jsp">
    <div class="form-group">
        <label>Faculty Name</label>
        <input type="text" name="faculty_name" required="required" 
               placeholder="Enter Faculty Name">

    </div>
    <div class="form-inline">
        <label>Status</label>
        <label>
            <input type="checkbox" name="status"  
                   class=""/>
            Active
        </label>

    </div>
    <button type="submit" class="btn btn-success">Save</button>
    <a href="faculty.jsp" class="btn btn-danger">Back</a>

</form>

<%@include file="../shared/footer.jsp" %>
<%@include file="../shared/header.jsp" %>

<h1>Add Student</h1>
<form method="post" action="save.jsp">
    <div class="form-group">
        <label>Student First Name</label>
        <input type="text" name="first_name" required="required" 
               placeholder="Enter First Name">

    </div>
    <div class="form-group">
        <label>Student Last Name</label>
        <input type="text" name="last_name" required="required" 
               placeholder="Enter Last Name">

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
    <a href="student.jsp" class="btn btn-danger">Back</a>

</form>

<%@include file="../shared/footer.jsp" %>
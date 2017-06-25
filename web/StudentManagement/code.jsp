<%@page import="com.leapfrog.entity.dao.StudentDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.leapfrog.entity.Faculty"%>
<%@page import="com.leapfrog.entity.dao.impl.FacultyDAOimpl"%>
<%@page import="com.leapfrog.entity.dao.FacultyDAO"%>
<%@page import="com.leapfrog.entity.Student"%>
<%@page import="com.leapfrog.entity.dao.impl.StudentDAOimpl"%>

<script type="text/javascript">
        <% FacultyDAO fcltDAO = new FacultyDAOimpl();
            Faculty facultyList = new Faculty();
        %>
        <% StudentDAO stdDAO = new StudentDAOimpl();
            Student studentList = new Student();
        %>
        function  populate(f, s) {
            var f = document.getElementById(f);
            var s = document.getElementById(s);
            s.innerHTML = "";
            ;
            if (f.value = "<%=facultyList.getId()%> - <%=facultyList.getName()%>") {
                        var optionArray = ["", "studentnamewithId | <%=studentList.getId()%> - <%=studentList.getFirstName()%> <%=studentList.getLastName()%>"];
                    }

                    for (var option in optionArray) {
                        var pair = optionArray[option].split("|");
                        var newOption = document.createElement("option");
                        newOption.value = pair[0];
                        newOption.innerHTML = pair[1];
                        s.options.add(newOption);
                    }


                }
    </script>
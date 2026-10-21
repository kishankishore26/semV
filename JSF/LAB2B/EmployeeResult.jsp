
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Employee Information Result</title>
</head>
<body>

<h2>Employee Information Result</h2>

<%
    String employeeID = request.getParameter("employeeID");
    String employeeName = request.getParameter("employeeName");
    String employeeAge = request.getParameter("employeeAge");
    String employeeDept = request.getParameter("department");
    String employeeEmail = request.getParameter("employeeEmail");

    String idError = "";
    String nameError = "";
    String ageError = "";
    String deptError = "";
    String emailError = "";

    boolean isValid = true;

    if (employeeID == null || employeeID.trim().isEmpty()) {
        idError = "Employee ID is required!";
        isValid = false;
    }

    if (employeeName == null ||
            !employeeName.matches("^[a-zA-Z\\s]+$")) {
        nameError = "Name must contain only letters and spaces!";
        isValid = false;
    }

   int ageInt = 0;

   if (employeeAge == null || !employeeAge.matches("\\d+")) {
	    ageError = "Age must be a valid numeric value.";
	    isValid = false;
	} else {
	    ageInt = Integer.parseInt(employeeAge);

        if (ageInt < 18 || ageInt > 65) {
            ageError = "Age should be between 18 and 65.";
            isValid = false;
        }
    }

    if (employeeDept == null || employeeDept.trim().isEmpty()) {
        deptError = "Department cannot be empty!";
        isValid = false;

    } else if (!employeeDept.matches("HR|Finance|IT|Sales")) {
        deptError = "Invalid department selected!";
        isValid = false;
    }

    if (employeeEmail == null || !employeeEmail.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
        emailError = "Invalid email address!";
        isValid = false;
    }

    int birthYear = 0;
    String nameAndDepartment = "";
    String formattedEmail = "";

    if (isValid) {
        Calendar calendar = Calendar.getInstance();
        int currentYear = calendar.get(Calendar.YEAR);
        birthYear = currentYear - ageInt;
        nameAndDepartment = employeeName + " (" + employeeDept + ")";
        formattedEmail = employeeEmail.toLowerCase();
    }
%>

<% if (isValid) { %>

    <h3>Employee Details</h3>
    <table border="1">
        <tr>
            <th>Employee ID</th>
            <td><%= employeeID %></td>
        </tr>
        <tr>
            <th>Employee Name and Department</th>
            <td><%= nameAndDepartment %></td>
        </tr>
        <tr>
            <th>Estimated Birth Year</th>
            <td><%= birthYear %></td>
        </tr>
        <tr>
            <th>Email ID</th>
            <td><%= formattedEmail %></td>
        </tr>
    </table>

<% } else { %>

    <h3>Validation Errors</h3>
    <ul>
        <% if (!idError.isEmpty()) { %>
            <li><b>Employee ID:</b> <%= idError %></li>
        <% } %>
        
        <% if (!nameError.isEmpty()) { %>
            <li><b>Name:</b> <%= nameError %></li>
        <% } %>

        <% if (!ageError.isEmpty()) { %>
            <li><b>Age:</b> <%= ageError %></li>
        <% } %>

        <% if (!deptError.isEmpty()) { %>
            <li><b>Department:</b> <%= deptError %></li>
        <% } %>

        <% if (!emailError.isEmpty()) { %>
            <li><b>Email:</b> <%= emailError %></li>
        <% } %>
    </ul>
    <a href="EmployeeForm.jsp">Go Back to Form</a>

<% } %>

</body>
</html>

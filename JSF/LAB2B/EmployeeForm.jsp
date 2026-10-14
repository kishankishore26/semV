
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Employee Form</title>
</head>
<body>
	<h2>Employee Information Form</h2>
    <form action="EmployeeResult.jsp" method="POST">
        Employee ID:<input type="text" name="employeeID" required><br><br>
        Employee Name:<input type="text" name="employeeName" required><br><br>
        Employee Age:<input type="number" name="employeeAge" required><br><br>
        Department:
        <select name="department" required>
            <option value="">Select Department</option>
            <option value="HR">HR</option>
            <option value="Finance">Finance</option>
            <option value="IT">IT</option>
            <option value="Sales">Sales</option>
        </select>
        <br><br>
        Email:<input type="email" name="employeeEmail" required><br><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>

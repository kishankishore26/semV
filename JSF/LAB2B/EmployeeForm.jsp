<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Form</title>
</head>
<body>
    <h2>Enter Employee Details:</h2>

    <form method="POST" action="EmployeeResult.jsp">
        Name: <input type="text" name="employeeName" required><br>

        ID: <input type="text" name="employeeID" required><br>

        Age: <input type="number" name="employeeAge" required><br>

        Email: <input type="text" name="employeeEmail" required><br>

        Department:
        <select name="department" required>
            <option value="">Select</option>
            <option value="HR">HR</option>
            <option value="Finance">Finance</option>
            <option value="IT">IT</option>
            <option value="Sales">Sales</option>
        </select>
        <br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>

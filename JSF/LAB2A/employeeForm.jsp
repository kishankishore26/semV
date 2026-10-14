<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Form</title>
</head>
<body>
	<h2>Employee Information: </h2>
	<form action="employeeResult.jsp" method="POST">
		<table>
			<tr>
				<td>Employee ID: </td>
				<td><input type="text" name="employeeID" required></td>
			</tr>
			<tr>
				<td>Employee Name: </td>
				<td><input type="text" name="employeeName" required></td>
			</tr>
			<tr>
				<td>Employee Age: </td>
				<td><input type="number" name="employeeAge" required></td>
			</tr>
			<tr>
				<td>Department: </td>
				<td><input type="text" name="employeeDepartment" required></td>
			</tr>
			<tr>
				<td>Email: </td>
				<td><input type="email" name="employeeEmail" required></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" value="Submit">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

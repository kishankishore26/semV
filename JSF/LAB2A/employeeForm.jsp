<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Form</title>
</head>
<body>
	<h2>Employee Form</h2>
	<form method='POST' action='employeeResult2a.jsp'>
		<table>
			<tr>
				<td>Employee ID:</td>
				<td><input type='text' name='id' required></td>
			</tr>
			<tr>
				<td>Employee Name:</td>
				<td><input type='text' name='name' required></td>
			</tr>
			<tr>
				<td>Employee Age:</td>
				<td><input type='number' name='age' required></td>
			</tr>
			<tr>
				<td>Employee department:</td>
				<td><input type='text' name='department' required></td>
			</tr>
			<tr>
				<td>Employee Email:</td>
				<td><input type='text' name='email' required></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
				<input type='submit' value='Submit'></td>
			</tr>
		</table>
	</form>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Form</title>
</head>
<body>
	<h2>Employee Form</h2>
	<form method='POST' action='employeeResult2b.jsp'>
		Name: <input type='text' name='name' required></br>
		Id: <input type='text' name='id' required></br>
		Age: <input type='number' name='age' required></br>
		Email: <input type='email' name='email' required></br>
		Department: 
		<select name='department' required>
			<option value="">Select</option>
			<option value="HR">HR</option>
			<option value="Sales">Sales</option>
			<option value="Finance">Finance</option>
			<option value="IT">IT</option>
		</select>
		</br>
		<input type='submit' value='Submit'>
	</form>
</body>
</html>

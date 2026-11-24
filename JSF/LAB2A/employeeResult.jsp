<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Result</title>
</head>
<body>
	<h2>Employee Result:</h2>
	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String department = request.getParameter("department");
		String email = request.getParameter("email");
		
		Calendar calendar = Calendar.getInstance();
		int currentYear = calendar.get(Calendar.YEAR);
		int ageInt = Integer.parseInt(age);
		int birthYear = currentYear-ageInt;
		String formattedEmail = email.toLowerCase();
		String nameAndDept = name +"(" +department +")";
	%>
	
	<table border="1">
		<tr>
			<th>Employee ID</th>
			<td><%=id %></td>
		</tr>
		<tr>
			<th>Employee Name and Department</th>
			<td><%=nameAndDept %></td>
		</tr>
		<tr>
			<th>Employee Age</th>
			<td><%=ageInt %></td>
		</tr>
		<tr>
			<th>Employee Email</th>
			<td><%=formattedEmail %></td>
		</tr>
	</table>
</body>
</html>

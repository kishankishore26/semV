<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Information:</title>
</head>
<body>
	<h2>Employee Results Information: </h2>
	<%
		String employeeId = request.getParameter("employeeID");
		String employeeName = request.getParameter("employeeName");
		String employeeAge = request.getParameter("employeeAge");
		String employeeDepartment = request.getParameter("employeeDepartment");
		String employeeEmail = request.getParameter("employeeEmail");
		
		int age = Integer.parseInt(employeeAge);
		Calendar calendar = Calendar.getInstance();
		int currentYear = calendar.get(Calendar.YEAR);
		int birthYear = currentYear - age;
		String nameAndDepartment = employeeName + "("+ employeeDepartment + ")";
		
		String formattedEmail = employeeEmail.toLowerCase();
	%>
	
	<table border="1">
		<tr>
			<th>Employee ID</th>
			<td><%=employeeId %></td>
		</tr>
		<tr>
			<th>Name and Department</th>
			<td><%=nameAndDepartment %></td>
		</tr>
		<tr>
			<th>Birth Year</th>
			<td><%=birthYear %></td>
		</tr>
		<tr>
			<th>Email</th>
			<td><%=formattedEmail %></td>
		</tr>
	</table>
</body>
</html>

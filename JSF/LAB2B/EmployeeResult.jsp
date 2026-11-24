<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Employee Result</h2>
	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String email = request.getParameter("email");
		String department = request.getParameter("department");
		
		String idError = "";
		String nameError = "";
		String ageError = "";
		String emailError = "";
		String deptError = "";
		
		boolean isValid=true;
		
		if(id==null || id.trim().isEmpty()){
			idError = "Employee ID is required!";
			isValid=false;
		}
		
		if(name==null || !name.matches("[a-zA-Z ]+")){
			nameError = "Name should consist only letters and spaces!";
			isValid=false;
		}
		
		int ageInt = 0;
		try{
			ageInt = Integer.parseInt(age);
			if(ageInt<18 || ageInt>60){
				ageError = "Age should be between 18 and 60!";
				isValid=false;
			}
		}catch(Exception e){
			ageError = "Age should be a number!";
			isValid=false;
		}
		
		if(email==null || !email.contains("@")){
			emailError = "Email is invalid!";
			isValid=false;
		}
		
		if(department==null || department.trim().isEmpty()){
			deptError = "Department cannot be empty!";
			isValid=false;
		}else if(!department.matches("HR|Finance|Sales|IT")){
			deptError = "Invalid department selected!";
			isValid=false;
		}
		
		int birthYear=0;
		String formattedEmail="";
		String nameAndDept="";
		
		if(isValid){
			Calendar calendar = Calendar.getInstance();
			int currentYear = calendar.get(Calendar.YEAR);
			birthYear = currentYear-ageInt;
			formattedEmail = email.toLowerCase();
			nameAndDept = name+"("+department+")";			
		}
	%>
	
	<% if(isValid){ %>
		<h3>Employee Details:</h3>
		<table border="1">
			<tr>
				<th>Employee ID:</th>
				<td><%=id %></td>
			</tr>
			<tr>
				<th>Employee Name and Department:</th>
				<td><%=nameAndDept %></td>
			</tr>
			<tr>
				<th>Employee Birth Year:</th>
				<td><%=birthYear %></td>
			</tr>
			<tr>
				<th>Employee Email:</th>
				<td><%=formattedEmail %></td>
			</tr>
		</table>
	<% }else{ %>
		<h2>Validation Error</h2>
		<ul>
			<% if(!idError.isEmpty()){ %>
				<li><b>ID Error: </b><%=idError %></li>
			<% } %>
			<% if(!nameError.isEmpty()){ %>
				<li><b>Name Error: </b><%=nameError %></li>
			<% } %>
			<% if(!ageError.isEmpty()){ %>
				<li><b>Age Error: </b><%=ageError %></li>
			<% } %>
			<% if(!deptError.isEmpty()){ %>
				<li><b>Department Error: </b><%=deptError %></li>
			<% } %>
			<% if(!emailError.isEmpty()){ %>
				<li><b>Email Error: </b><%=emailError %></li>
			<% } %>
		</ul>
		<a href="employeeForm2b.jsp">Go back to Form</a>
	<% } %>
</body>
</html>

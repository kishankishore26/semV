<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.student.model.Student" %>
<%@ page import="com.student.dao.StudentDAO" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>
</head>
<body>
	<h1>Add Student</h1>
	<form method="POST" action="add-students.jsp">
		Roll No: <input type="text" name="rollNo"><br>
		Name: <input type="text" name="name"><br>
		Email: <input type="text" name="email"><br>
		Age: <input type="number" name="age"><br>
		<input type="submit" value="Add Student">
	</form>
	
	<%
		if(request.getMethod().equals("POST")){
			int rollNo=Integer.parseInt(request.getParameter("rollNo"));
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			int age=Integer.parseInt(request.getParameter("age"));
			
			Student student = new Student(rollNo, name, email, age);
			StudentDAO dao = new StudentDAO();
			
			try {
			    dao.addStudent(student);
			    out.println("<p>Student Added Successfully</p>");
			} catch (SQLException e) {
			    e.printStackTrace();
			    out.println("<p>Error adding student: "
			        + e.getMessage() + "</p>");
			}	
		}
	%>
	<a href="index.jsp">Back to Home</a>
</body>
</html>

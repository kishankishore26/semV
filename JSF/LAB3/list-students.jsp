<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.student.model.Student" %>
<%@ page import="com.student.dao.StudentDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Students</title>
</head>
<body>
	<h2>Student List</h2>
	<table border="1">
		<tr>
			<th>Roll No</th>
			<th>Name</th>
			<th>Email</th>
			<th>Age</th>
			<th>Action</th>
		</tr>
		
		<%
			StudentDAO dao = new StudentDAO();
			List<Student> students = null;
			
			try{
				students=dao.getAllStudents();
			}catch(SQLException e){
				out.println("<p>Error retrieveing students!");
			}
			
			if(students!=null){
				for(Student student:students){
		%>			
		
		<tr>
			<td><%=student.getRollNo() %></td>
			<td><%=student.getName() %></td>
			<td><%=student.getEmail() %></td>
			<td><%=student.getAge() %></td>
			<td>
				<a href="update-students.jsp?rollNo=<%=student.getRollNo() %>">Update</a>
				|
				<a href="delete-students.jsp?rollNo=<%=student.getRollNo() %>">Delete</a>
			</td>
		</tr>
		<%
				}
			}
		%>
	</table>
	<br>
	<a href="index.jsp">Back to Home</a>
</body>
</html>

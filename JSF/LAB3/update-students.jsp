<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.student.model.Student" %>
<%@ page import="com.student.dao.StudentDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Students</title>
</head>
<body>
	<h2>Update Students</h2>
	<%
		int rollNo=Integer.parseInt(request.getParameter("rollNo"));
		StudentDAO dao = new StudentDAO();
		Student student = dao.getAllStudents().stream().filter(s->s.getRollNo()==rollNo).findFirst().orElse(null);
	%>
	
	<form method="POST" action="update-students.jsp">
		RollNo: <%=student.getRollNo() %>(readonly)<br>
		Name: <input type="text" name="name" value="<%=student.getName() %>"><br>
		Email: <input type="text" name="email" value="<%=student.getEmail() %>"><br>
		Age: <input type="text" name="age" value="<%=student.getAge() %>"><br>
		<input type="hidden" name="rollNo" value="<%=student.getRollNo() %>"><br>
		<input type="submit" value="Update Student">
	</form>
	
	<%
		if(request.getMethod().equals("POST")){
			int updatedrollNo=Integer.parseInt(request.getParameter("rollNo"));
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			int age=Integer.parseInt(request.getParameter("age"));
			
			Student updatedStudent = new Student(rollNo, name, email, age);
			
			try {
			    dao.updateStudent(updatedStudent);
			    out.println("<p>Student updated successfully!</p>");
			} catch (SQLException e) {
			    e.printStackTrace();
			    out.println("<p>Update failed: " + e.getMessage() + "</p>");
			}
		}
	%>
	<br>
	<a href="index.jsp">Back to Home</a>
</body>
</html>

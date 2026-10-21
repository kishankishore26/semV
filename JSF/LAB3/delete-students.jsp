```jsp
<%@page import="com.student.dao.StudentDAO"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
</head>
<body>

    <h2>Delete Student</h2>

    Enter Roll No (USN) of the student to delete:

    <form method="POST">
        <input type="number" name="rollNo" required>
        <input type="submit" value="Delete Student">
    </form>

    <%
        // Handle form submission
        if (request.getMethod().equals("POST")) {
            String rollNoStr = request.getParameter("rollNo");

            if (rollNoStr != null && !rollNoStr.trim().isEmpty()) {
                int rollNo = Integer.parseInt(rollNoStr);

                StudentDAO dao = new StudentDAO();

                try {
                    dao.deleteStudent(rollNo);

                    out.println("<p>Student with Roll No " + rollNo
                        + " has been deleted successfully!</p>");

                } catch (SQLException e) {
                    out.println("<p>Error occurred while deleting the student. Please try again.</p>");
                    e.printStackTrace();
                }

            } else {
                out.println("<p>Please enter a valid Roll No.</p>");
            }
        }
    %>

    <br>
    <a href="index.jsp">Back to Home</a>

</body>
</html>
```

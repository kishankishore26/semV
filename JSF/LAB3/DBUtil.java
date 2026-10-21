
package com.student.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    public static final String URL = "jdbc:mysql://localhost:3306/student";

    private static final String USERNAME = "student";
    private static final String PASSWORD = "student";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC driver not found.", e);
        }

        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
}

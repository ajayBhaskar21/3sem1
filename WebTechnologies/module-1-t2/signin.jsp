<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign In</title>
    <meta http-equiv="refresh" content="2;url=event-admin.html"> <!-- Add this line for automatic redirection after 2 seconds -->
</head>
<body>
    <%
        // Get form data
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // JDBC connection parameters
        String url = "jdbc:mysql://localhost:3306/EventManagement";
        String user = "root";
        String pass = "root";

        // Check user credentials in the database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, user, pass);
            String query = "SELECT * FROM signup WHERE username = ? AND password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
    %>
                <p>Successfully Logged In! Redirecting to <a href="event-admin.html">Event Organizer</a>...</p>
    <%
            } else {
                out.println("Login failed.");
            }
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    %>
</body>
</html>

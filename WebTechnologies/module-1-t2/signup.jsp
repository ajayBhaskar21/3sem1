<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <!-- Redirect after 3 seconds -->
</head>
<body>
    <%
        // Get form data
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // JDBC connection parameters
        String url = "jdbc:mysql://localhost:3306/EventManagement";
        String user = "root";
        String pass = "root";

        // Check if the username or email already exists
        boolean userExists = false;
        boolean emailExists = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, user, pass);

            // Check for existing username
            String checkUsernameQuery = "SELECT * FROM signup WHERE username = ?";
            PreparedStatement checkUsernameStatement = connection.prepareStatement(checkUsernameQuery);
            checkUsernameStatement.setString(1, username);
            ResultSet usernameResultSet = checkUsernameStatement.executeQuery();
            if (usernameResultSet.next()) {
                // Username already exists
                userExists = true;
            }
            usernameResultSet.close();
            checkUsernameStatement.close();

            // Check for existing email
            String checkEmailQuery = "SELECT * FROM signup WHERE email = ?";
            PreparedStatement checkEmailStatement = connection.prepareStatement(checkEmailQuery);
            checkEmailStatement.setString(1, email);
            ResultSet emailResultSet = checkEmailStatement.executeQuery();
            if (emailResultSet.next()) {
                // Email already exists
                emailExists = true;
            }
            emailResultSet.close();
            checkEmailStatement.close();

            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        if (userExists || emailExists) {
    %>
            <script>
                alert("Username or email already exists. Please choose a different username or email.");
                window.location.href = "signup.html"; // Redirect back to signup page
            </script>
    <%
        } else {
            // Insert user data into the database
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(url, user, pass);
                String insertQuery = "INSERT INTO signup (username, email, password) VALUES (?, ?, ?)";
                PreparedStatement insertStatement = connection.prepareStatement(insertQuery);
                insertStatement.setString(1, username);
                insertStatement.setString(2, email);
                insertStatement.setString(3, password);
                int rowsInserted = insertStatement.executeUpdate();
                if (rowsInserted > 0) {
    %>
                    <p>Sign up successful! Redirecting to <a href="signin.html">Sign In</a>...</p>
                    <script>
                        alert("successfully registered into database");
                        window.location.href = "signin.html";
                    </script>
    <%
                } else {
                    out.println("Sign up failed.");
                }
                insertStatement.close();
                connection.close();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>

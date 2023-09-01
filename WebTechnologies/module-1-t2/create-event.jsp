<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Event</title>
    <script>
        function showAlert(message) {
            alert(message);
            // Redirect back to the event-organizer page
            window.location.href = "event-admin.html";
        }
    </script>
</head>
<body>
    <%
        String eventName = request.getParameter("event-name");
        String eventDate = request.getParameter("event-date");
        String eventLocation = request.getParameter("event-location");
        String eventType = request.getParameter("event-type");
        String eventDescription = request.getParameter("event-description");
        String eventCost = request.getParameter("event-cost");
        String eventCostAmount = request.getParameter("event-cost-amount");

        // JDBC connection parameters
        String url = "jdbc:mysql://localhost:3306/EventManagement";
        String user = "root";
        String pass = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, user, pass);
            String query = "INSERT INTO events (event_name, event_date, event_location, event_type, event_description, event_cost, event_cost_amount) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, eventName);
            preparedStatement.setString(2, eventDate);
            preparedStatement.setString(3, eventLocation);
            preparedStatement.setString(4, eventType);
            preparedStatement.setString(5, eventDescription);
            preparedStatement.setString(6, eventCost);
            preparedStatement.setString(7, eventCostAmount);
            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                // Display success alert
                out.println("<script>showAlert('Event created successfully!');</script>");
            } else {
                // Display failure alert
                out.println("<script>showAlert('Failed to create event.');</script>");
            }
            preparedStatement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Display failure alert
            out.println("<script>showAlert('An error occurred while creating the event.');</script>");
        }
    %>
</body>
</html>

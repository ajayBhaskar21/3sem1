<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
    <title>View Events</title>
    
    <style>
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background-color: #222;
            color: #fff;
            padding: 1em 0;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 0 auto;
            max-width: 1200px;
            padding: 0 20px;
        }

        .logo a {
            color: #fff;
            text-decoration: none;
            font-size: 1.5em;
            font-weight: bold;
        }

        .nav-links {
            list-style: none;
            display: flex;
        }

        .nav-links li {
            margin-right: 20px;
        }

        .nav-links a {
            color: #6bed3b;
            text-decoration: none;
            transition: color 0.3s ease-in-out, background-color 0.3s ease-in-out;
            padding: 8px 15px;
            border-radius: 4px;
            font-weight: 700;
        }

        .nav-links a:hover {
            color: #fff;
            background-color: blue;
        }
        .container {
            width: 600px;
            margin: 40px auto;
            padding: 20px;
            text-align: center;
            flex: 1;
            background-color: #fff;
            border-radius: 6px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        }
        /* events page */


        .container ul.event-list {
            list-style: none;
            padding: 0;
        }
    
        .container .event {
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 6px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
        }
    
        .container .event h2 {
            margin-bottom: 10px;
        }
    
        .container .event p {
            margin-bottom: 5px;
        }
    
        /* Adjust the link color on this page */
        .container .event a {
            color: #6bed3b;
            text-decoration: none;
            font-weight: bold;
        }
    
        .container .event a:hover {
            color: #4fad29;
        }
        .logo span {
            color: #6bed3b;
        }
    </style>
</head>

<body>
    <header>
        <nav class="navbar">
            <div class="logo">
                <a href="home.jsp">Event<span>Hub</span></a>
            </div>
            <ul class="nav-links">
                
                <li><a href="signup.html">Sign Up</a></li>
                <li><a href="signin.html">Sign In</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h1>Upcoming Events</h1>
        <ul class="event-list">
            <% 
                // JDBC connection parameters
                String url = "jdbc:mysql://localhost:3306/EventManagement";
                String user = "root";
                String pass = "root";

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(url, user, pass);
                    String query = "SELECT * FROM events";
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery(query);

                    while (resultSet.next()) {
                        String eventName = resultSet.getString("event_name");
                        String eventDate = resultSet.getString("event_date");
                        String eventLocation = resultSet.getString("event_location");
                        String eventDescription = resultSet.getString("event_description");
            %>
            <li class="event">
                <h2><%= eventName %></h2>
                <p>Date: <%= eventDate %></p>
                <p>Location: <%= eventLocation %></p>
                <p>Description: <%= eventDescription %></p>
            </li>
            <% 
                    }
                    resultSet.close();
                    statement.close();
                    connection.close();
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
            %>
        </ul>
    </div>

    <footer>
        <p>&copy; 2023 EventHub. All rights reserved.</p>
    </footer>
</body>

</html>
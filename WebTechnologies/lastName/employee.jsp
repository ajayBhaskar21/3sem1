<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employee Details</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 70vh;
        }
        
        h1 {
            color: #333;
        }
        
        .details {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            padding: 20px;
            margin-top: 20px;
            text-align: left;
        }
        
        .details ul {
            list-style-type: none;
            padding: 0;
        }
        
        .details ul li {
            margin-bottom: 10px;
        }
        
        .details strong {
            font-weight: bold;
            color: green; /* Blue color for strong elements */
        }
        
        .no-record {
            color: #ff5555;
            margin-top: 20px;
        }
        
        a {
            text-decoration: none;
            color: blue;
            font-weight: bold;
            margin-top: 20px;
            background-color : white;
            padding : 10px;
            border-radius: 7px;
            box-shadow: 1px 1px 5px black;
        }
        
        a:hover {
            color: green;
        }
    </style>
    
</head>
<body>
    <h1>Employee Details</h1>

    <%
        // Get the last name from the form submission
        String lastName = request.getParameter("lastName");
        
        // JDBC connection parameters
        String url = "jdbc:mysql://localhost:3306/DB";
        String user = "root";
        String pass = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, user, pass);

            // Use a prepared statement to retrieve employee details based on last name
            String query = "SELECT * FROM employee WHERE lastName = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, lastName);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // Display the employee details
                
    %>
                <div class="details">
                    <ul>
                        <li><strong>First Name:</strong> <%= resultSet.getString("firstName") %></li>
                        <li><strong>Last Name:</strong> <%= resultSet.getString("lastName") %></li>
                        <li><strong>Age:</strong> <%= resultSet.getString("age") %></li>
                        <li><strong>Work:</strong> <%= resultSet.getString("work") %></li>
                        <!-- Add more details as needed -->
                    </ul>
                </div>
    <%
            } else {
                // No records found
    %>
                <p class="no-record">No employee records available for the last name "<%= lastName %>".</p>
    <%
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    %>

    <a href="index.html">Home</a>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Event Management Platform</title>
    <style>
        /* Reset default margin and padding */
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
            max-width: 800px;
            margin: 40px auto;
            padding: 40px;
            text-align: center;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .container h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: #333;
        }

        .container p {
            font-size: 1.25rem;
            color: #666;
        }

        .container a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #6bed3b;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            transition: background-color 0.3s ease-in-out;
        }

        .container a:hover {
            background-color: #4fad29;
        }

        footer {
            background-color: #222;
            color: #fff;
            text-align: center;
            padding: 1em 0;
            position: absolute;
            bottom: 0;
            width: 100%;
            margin-top: auto;
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
        <h1>Welcome to Event Management Platform</h1>
        <p>Organize and manage your events with ease.</p>

        <a href="signup.html" >Create Event</a><br>
        <a href="events.jsp" >Events Available</a>
    </div>

    <footer>
        <p>&copy; 2023 EventHub. All rights reserved.</p>
    </footer>
</body>

</html>
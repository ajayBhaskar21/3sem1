<?php
    // Database connection settings
    $servername = "localhost";
    $username = "root";
    $password = "root";
    $dbname = "mydb";
    // Create a connection
    $conn = mysqli_connect($servername, $username, $password, $dbname);
    // Check the connection
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    // Process the sign-in data
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $username = mysqli_real_escape_string($conn, $_POST["username"]);
        $password = mysqli_real_escape_string($conn, $_POST["password"]);

        // Retrieve the password from the database
        $sql = "SELECT password FROM `user` WHERE username='$username'";
        $result = mysqli_query($conn, $sql);

        if ($result) {
            if (mysqli_num_rows($result) == 1) {
                $row = mysqli_fetch_assoc($result);
                $stored_password = $row["password"];

                // Compare the stored password with the input password
                if ($password === $stored_password) {
                    echo "Login successful!";
                } else {
                    echo "Username or Password is incorrect.";
                }
            } else {
                echo "Username or Password is incorrect.";
            }
        } else {
            echo "Error: " . mysqli_error($conn);
        }
    }

    // Close the database connection
    mysqli_close($conn);
?>

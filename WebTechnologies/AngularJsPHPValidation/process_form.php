<?php
// Take the data from the user and store them in a MySQL database
$servername = "localhost"; // server name
$username = "root"; // username
$password = "root"; // password
$dbname = "db"; // replace with your actual database name

// Create a connection to the database
$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Retrieve data from the POST request
$data = json_decode(file_get_contents("php://input"));

if (isset($data->username) && isset($data->password)) {
    $uname = mysqli_real_escape_string($conn, $data->username);
    $pwd = mysqli_real_escape_string($conn, $data->password);

    $sql = "INSERT INTO user (username, password) VALUES ('$uname', '$pwd')";

    if (mysqli_query($conn, $sql)) {
        $response = array('success' => true);
    } else {
        $response = array('success' => false, 'message' => "Error: " . $sql . "<br>" . mysqli_error($conn));
    }
} else {
    $response = array('success' => false, 'message' => "Invalid data received.");
}

mysqli_close($conn);

header('Content-Type: application/json');
echo json_encode($response);
?>
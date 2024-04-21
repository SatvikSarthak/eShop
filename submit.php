<?php
// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Establish database connection
    $servername = "localhost:3307";
    $username = "root";
    $password = "";
    $dbname = "ecommerce";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Get form data
    $username = $_POST['username'];
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT); // Hash password

    // Check if the username already exists
    $checkUsernameQuery = "SELECT * FROM customers WHERE username = '$username'";
    $checkUsernameResult = $conn->query($checkUsernameQuery);

    if ($checkUsernameResult->num_rows > 0) {
        echo "Username already exists. Please choose a different username.";
        exit(); // Stop further execution
    }

    // Insert data into customers table
    $sql = "INSERT INTO customers (username, first_name, last_name, Email, password) VALUES ('$username', '$firstName', '$lastName', '$email', '$password')";

    if ($conn->query($sql) === TRUE) {
        // Redirect to another webpage after successful registration
        header("Location: index.php");
        exit(); // Stop further execution
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}
?>
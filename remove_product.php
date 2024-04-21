<?php
// Start or resume session
session_start();

// Establish database connection
$servername = "localhost:3307";
$username = "root";
$password = "";
$dbname = "ecommerce";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if product_id is set in the POST request
if (isset($_POST['product_id'])) {
    $productId = $_POST['product_id'];

    // Check if the product is in the cart
    if (isset($_SESSION['cart'][$productId])) {
        // Increase the stock quantity of the product in the database
        $sql_update = "UPDATE products SET stock_quantity = stock_quantity + 1 WHERE product_id = $productId";
        $conn->query($sql_update);

        // Remove the product from the cart
        unset($_SESSION['cart'][$productId]);

        // Redirect the user to another webpage
        header("Location: shippingAddress.php");
        exit();
    } else {
        echo "Product not found in the cart.";
    }
} else {
    echo "Product ID not provided.";
}

$conn->close();
?>

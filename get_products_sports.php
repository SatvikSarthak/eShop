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

// Check if product is added to cart
if (isset($_POST['product_id'])) {
    $productId = $_POST['product_id'];
    
    // Check if product is already in cart, if not, add it
    if (!isset($_SESSION['cart'][$productId])) {
        $_SESSION['cart'][$productId] = 1;
        
        // Decrease the stock quantity of the product in the database
        $sql_update = "UPDATE products SET stock_quantity = stock_quantity - 1 WHERE product_id = $productId";
        $conn->query($sql_update);
    }
}

// Retrieve products from the "Sports" category from the database
$sql = "SELECT * FROM products WHERE Category = 'Sports' AND stock_quantity > 0";
$result = $conn->query($sql);

// Output each product
while ($row = $result->fetch_assoc()) {
    echo '<div class="product">';
    echo '<img src="' . $row['img_url'] . '" alt="' . $row['NAME'] . '" width="200">';
    echo '<h3>Product Name: ' . $row['NAME'] . '</h3>';
    echo '<p>Price: $' . $row['price'] . '</p>';
    echo '<p>Stock Quantity: ' . $row['stock_quantity'] . '</p>';
    // If stock is available, show order button
    echo '<button class="orderButton" data-product-id="' . $row['product_id'] . '">Add to Cart</button>';
    echo '</div>';
}

$conn->close();
?>

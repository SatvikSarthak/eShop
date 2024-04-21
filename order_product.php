<?php
$servername = "localhost:3307";
$username = "root";
$password = "";
$dbname = "ecommerce";

$conn = new mysqli($servername, $username, $password, $dbname);
$product_id = $_POST['product_id'];

// Fetch product details from the database (already done)

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();

    // Check if there is enough stock
    if ($row['stock_quantity'] > 0) {
        // Update stock quantity
        $new_stock_quantity = $row['stock_quantity'] - 1;
        $update_sql = "UPDATE products SET stock_quantity = $new_stock_quantity WHERE product_id = $product_id";
        $conn->query($update_sql);

        // Redirect to another webpage after successful order
        header("Location: shipto.html");
        exit(); // Ensure that no further output is sent after redirection
    } else {
        // Respond with error message if stock is not available
        echo json_encode(array('success' => false, 'message' => 'Product out of stock.'));
    }
} else {
    // Respond with error message if product ID is invalid
    echo json_encode(array('success' => false, 'message' => 'Invalid product ID.'));
}

// Close database connection (already done)
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <link rel="apple-touch-icon" sizes="180x180" href="favicon_io/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon_io//favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon_io//favicon-16x16.png">
    <link rel="manifest" href="/site.webmanifest">
    <link rel="stylesheet" href="style_index.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=M+PLUS+1+Code:wght@100..700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style_category.css">
    <link rel="stylesheet" href="style_customer_registration.css">
</head>
<body class="font" style="background-color: #e4e6e6;">
    <div class="headcontent">
        <h1>Your Orders</h1>
        <h2>Products in Cart:</h2>
    </div>
    <?php
    // Start or resume session
    session_start();

    if (isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
        // Establish database connection
        $servername = "localhost:3307";
        $username = "root";
        $password = "";
        $dbname = "ecommerce";

        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // Initialize total price
        $totalPrice = 0;

        // Retrieve and display product images for each product in the cart
        foreach ($_SESSION['cart'] as $productId => $quantity) {
            $sql = "SELECT img_url, NAME, price FROM products WHERE product_id = $productId";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $imgUrl = $row['img_url'];
                $productName = $row['NAME'];
                $price = $row['price'];
                $totalPrice += $price * $quantity; // Increment total price
                echo '<div class="container">';
                echo '<div class="product">';
                echo '<img src="' . $row['img_url'] . '" alt="' . $row['NAME'] . '" width="200">';
                echo '<h3>Product Name: ' . $row['NAME'] . '</h3>';
                echo '<p>Price: $' . $row['price'] . '</p>';
                echo '<form action="remove_product.php" method="POST">';
                echo '<input type="hidden" name="product_id" value="' . $productId . '">';
                echo '<input type="submit" class="remove-button" value="Remove">';
                echo '</form>';
                echo '</div>';
                echo '</div>';
            }
        }

        echo "<div class='headcontent'>";
        echo "<p>Total Price: $" . $totalPrice . "</p>";
        echo "</div>";

        $conn->close();
    } else {
        echo "<p>No products in cart.</p>";
    }
    ?>
</body>
</html>

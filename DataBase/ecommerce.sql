-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Apr 15, 2024 at 03:56 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `username`, `first_name`, `last_name`, `password`, `Email`) VALUES
(6, 'Shashank_Kumar', 'Shashank', 'Kumar', '$2y$10$eklHlvuaAEdi8nsnmW.vUe3R1kmQoa1v9h1gZRT8OJ6DHSSDzlmee', 'shashank.229301440@muj.manipal.edu'),
(12, 'Shashank_Kumar14', 'Shashank', 'Kumar', '$2y$10$/M0TZd3oHFQz89LOtmqRM.57a4yKnT5JwPxIHFXdK/eth3nEiLAGu', 'remyou99@gmail.com'),
(14, 'Shashank_Kumar1605', 'Shashank', 'Kumar', '$2y$10$aJB8Y0uwrjAzb9ArqQDzduE6ckvMcl1V3conwB/NC/WX3XPiyJ0/W', 'remyou99@gmail.com'),
(15, 'Test User', 'TryOne', 'TryTwo', '$2y$10$53h8JqNGH.DtEiJvUdAKveuZ4BRtUFUdH1BZ72aXuEhIubk5g.Pfi', 'remyou99@gmail.com'),
(16, 'Spectre_1690', 'Harvey', 'Specter', '$2y$10$nwagwVLf0ngmIrHnhyoT0.lU6W.XQlOBvm6gy8JokGATcoflhCICC', 'bztmavl914@iemail.one'),
(17, 'DarkMage', 'First name', 'Last name', '$2y$10$EOlrlhyH4kASzYuvlcjc1emZZ45A3LWNR3fqtJnfqj.aNhFaXwQZu', 'remyou99@gmail.com'),
(20, 'Shashank_Kumar1009', 'Shashank', 'Kumar', '$2y$10$.shLb2g1Oc3hYmk/drbqpO3uC4q0H2jvJ54Y1761Z7v762PO3Q5b6', 'shashank.229301440@muj.manipal.edu');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `total_amount`) VALUES
(1, 6, '2024-04-14 09:09:57', 199.99),
(2, 15, '2024-04-14 09:18:28', 399.99),
(3, 14, '2024-04-14 09:24:25', 749.99),
(4, 17, '2024-04-15 09:32:19', 259.00),
(5, 16, '2024-04-15 09:33:30', 159.98);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 15, 1),
(2, 2, 12, 1),
(3, 3, 11, 1),
(4, 3, 13, 1),
(5, 4, 30, 1),
(6, 5, 25, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `payment_method_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `payment_type` enum('Credit Card','Debit Card','PayPal','Stripe') DEFAULT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `card_expiry_date` date DEFAULT NULL,
  `card_cvv` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`payment_method_id`, `customer_id`, `payment_type`, `card_number`, `card_expiry_date`, `card_cvv`) VALUES
(1, 15, 'Credit Card', '0987', '2027-09-10', '667'),
(2, 6, '', NULL, NULL, NULL),
(3, 14, '', NULL, NULL, NULL),
(4, 17, '', NULL, NULL, NULL),
(5, 16, 'Debit Card', '3458', '2026-06-10', '123');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `Category` enum('Electronics','Health and Beauty','Fashion','Industrial Equipment','Home and Garden','Sports') DEFAULT NULL,
  `img_url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `NAME`, `price`, `stock_quantity`, `Category`, `img_url`) VALUES
(1, 'Test Product', 10.00, 9, 'Electronics', 'Images\\img_for_electronic\\main2.jpg'),
(7, 'ASUS ZenScreen MB16AC 15.6\" FullHD 1920x1080 USB-C LCD IPS Portable Monitor', 65.00, 25, 'Electronics', 'Images\\img_for_electronic\\zenscreen_MB16AC.jpg'),
(8, 'Portable Monitor 15.6\'\' FHD 1080P Ultra-Slim IPS Display w/Smart Cover & Speaker', 75.99, 30, 'Electronics', 'Images\\img_for_electronic\\PortableMonitor.jpg'),
(9, 'ASUS ROG Strix XG17AHP 17.3\" IPS LED Portable Monitor - Black', 579.99, 4, 'Electronics', 'Images\\img_for_electronic\\ROG_monitor.png'),
(10, 'ASUS 27 1080P TUF Gaming Curved HDR Monitor (VG27VQM)', 297.18, 7, 'Electronics', 'Images\\img_for_electronic\\ASUS_monitor.jpg'),
(11, 'Sony Playstation 5 Disc Edition 825GB - CFI-1115A', 344.99, 2, 'Electronics', 'Images\\img_for_electronic\\Playstation5.jpg'),
(12, 'AMD Gaming PC Components Lot. Motherboard, 16GB RAM, CPU, GTX GPU, Liquid Cooled', 399.99, 1, 'Electronics', 'Images\\img_for_electronic\\PC_components.jpg'),
(13, 'Dell Latitude 7400 Gaming Laptop PC Intel Core i7 4.2GHz 64GB RAM 2TB SSD Win 11', 405.00, 5, 'Electronics', 'Images\\img_for_electronic\\dell_gaming_laptop.png'),
(14, 'Apple iPhone 13 Pro Max 128GB Unlocked Smartphone', 563.95, 1, 'Electronics', 'Images\\img_for_electronic\\iphone13.jpg'),
(15, 'Apple AirPods Pro (2nd Generation) Wireless Ear Buds USB-C Charging MTJV3AM/A', 199.99, 4, 'Electronics', 'Images\\img_for_electronic\\airpods.jpg'),
(17, 'MEDI PEEL Vegan Vitamin Deep Tox Cleansing Oil 200ml Deep Cleanser K-Beauty', 26.98, 30, 'Health and Beauty', 'Images\\img_for_healthandbeauty\\head.jpg'),
(18, 'SKIN1004 Madagascar Centella Light Cleansing Oil 200mL', 16.49, 25, 'Health and Beauty', 'Images\\img_for_healthandbeauty\\cleansingOil.jpg'),
(19, 'Beauugreen Coffee Hydrogel Eye Patch 60pcs Brightening Whitening K-Beauty', 19.98, 45, 'Health and Beauty', 'Images\\img_for_healthandbeauty\\hydrogelEye.jpg'),
(20, 'LOT OF 3 Mary Kay Oil-Free Eye Makeup Remover 3.75 fl. oz. Each Free Shipping', 54.80, 12, 'Health and Beauty', 'Images\\img_for_healthandbeauty\\eyemakeup.jpg'),
(21, 'Borghese Gel Delicato Gentle Makeup Remover - 8 oz (517867)', 23.50, 15, 'Health and Beauty', 'Images\\img_for_healthandbeauty\\gentleMakeup.jpg'),
(22, 'Shiseido ELIXIR WHITE Brightening Purify Cleansing Oil 145ml Makeup Remover', 37.99, 15, 'Health and Beauty', 'Images\\img_for_healthandbeauty\\purifyCleansing.jpg'),
(23, 'Shu Uemura Ultime 8 Sublime Beauty Cleansing Oil 150ml', 69.88, 32, 'Health and Beauty', 'Images\\img_for_healthandbeauty\\SublimeBeauty.jpg'),
(24, 'Waterdrop Refurbished G3P600 Reverse Osmosis Water Filter, Tankless, 600 GPD', 399.00, 35, 'Home and Garden', 'Images\\img_for_homeandgarden\\waterDrop.jpg'),
(25, 'eufy Security 3G/4G LTE Celluar Security Camera Outdoor 2K HD Starlight Color', 79.99, 5, 'Home and Garden', 'Images\\img_for_homeandgarden\\camera.png'),
(26, '4 Pack 4FT Linkable LED Shop Light for Garage, 4400lm, 42W Utility Light - White', 49.99, 13, 'Home and Garden', 'Images\\img_for_homeandgarden\\light.jpg'),
(27, 'Women Mesh Panel 3/4 Bell Sleeve Chiffon Casual Loose Kimono Cardigan Black', 21.48, 5, 'Fashion', 'Images\\img_for_fashion\\clothes.jpg'),
(28, 'Nike Premier III 3 FG Soccer Cleats Black White AT5889-010 Men\'s Size 8 Leather', 89.99, 5, 'Fashion', 'Images\\img_for_fashion\\nike_shoes.jpg'),
(29, 'Air Force 1 \'07 White/ Black CT2302-100 Fashion Shoes', 83.16, 7, 'Fashion', 'Images\\img_for_fashion\\airForce.jpg'),
(30, 'Dooney & Bourke Florentine Selina Crossbody Shoulder Bag', 259.00, 11, 'Fashion', 'Images\\img_for_fashion\\Bag.jpg'),
(31, 'POTENZA “ROSSO+” Pro Pickleball Paddle (Carbon Fiber, 21mm COREx3 Open Throat)', 145.95, 14, 'Sports', 'Images\\img_for_sports\\pickleball.png'),
(32, 'Sram XX1 Eagle AXS Rear Derailleur, Long Cage 12-Speed NO BATTERY OR CHARGER', 399.95, 8, 'Sports', 'Images\\img_for_sports\\rearDerailleur.jpg'),
(33, 'Snack Vending Machine', 950.00, 3, 'Industrial Equipment', 'Images\\img_for_industrialequipment\\vendingMaachine.jpg'),
(34, 'Snack Vending Machine', 950.00, 3, 'Industrial Equipment', 'Images\\img_for_industrialequipment\\vendingMaachine.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `shipping_address_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`shipping_address_id`, `customer_id`, `address`, `city`, `state`, `country`, `postal_code`, `phone`) VALUES
(1, 6, '153, Maa Hinglaj Nagar-B, Gandhi Path Road West, Lalarpura, Vaishali Nagar', 'Jaipur', 'Rajasthan', 'India', '302020', '8306580636'),
(2, 12, '104, Luhadia Tower, C-Scheme Ashok Marg', 'Jaipur', 'Rajasthan', 'India', '302001', '8306580636'),
(3, 15, 'Near Jain Temple, Osian', 'Jodhpur', 'Rajasthan', 'India', '342303', '8306580636');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`payment_method_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`shipping_address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `payment_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `shipping_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD CONSTRAINT `payment_methods_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD CONSTRAINT `shipping_addresses_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

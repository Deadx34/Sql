-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2024 at 02:43 PM
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
-- Database: `emspos`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `usertype` varchar(255) NOT NULL DEFAULT '2',
  `password` varchar(191) NOT NULL,
  `is_ban` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `usertype`, `password`, `is_ban`, `created_at`) VALUES
(8, 'Admin', 'Atheeqazeem125@gmail.com', '01234567890', '1', '$2y$10$6yJMA7pkaILhOQKT21.KD.mfoaE4cxD00Sp.gFKtVUAdof3BUgQ8O', 0, '2023-11-09 08:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `Description`) VALUES
(1, 'asdasd', 'dasd asdasd asdasdasdas das dasdas');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `brand_id` varchar(255) NOT NULL DEFAULT '0',
  `description` tinytext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0=Visible; 1=Hidden'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `brand_id`, `description`, `status`) VALUES
(1, 'sadasd', '0', 'asdasdasd', 0);

-- --------------------------------------------------------

--
-- Table structure for table `credit_history`
--

CREATE TABLE `credit_history` (
  `id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `payed` varchar(255) NOT NULL,
  `date_payed` varchar(255) NOT NULL,
  `time_payed` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `credit_history`
--

INSERT INTO `credit_history` (`id`, `order_id`, `payed`, `date_payed`, `time_payed`) VALUES
(1, '1', '100', '2024-08-10', '14:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `address` tinytext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Visible; 1=Hidden',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `status`, `created_at`) VALUES
(1, 'Dinesh Kumar', '', '0710675874', '', 0, '2024-08-10 12:16:35'),
(2, 'Dinesh Kumar', '', '1111', '', 0, '2024-08-10 12:16:41');

-- --------------------------------------------------------

--
-- Table structure for table `melimit`
--

CREATE TABLE `melimit` (
  `id` int(11) NOT NULL,
  `val_1` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tracking_no` varchar(100) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `total_amount` varchar(100) NOT NULL,
  `net_total` varchar(100) NOT NULL,
  `order_date` date NOT NULL,
  `order_status` varchar(100) DEFAULT NULL,
  `payed_amount` varchar(255) NOT NULL DEFAULT '0',
  `pending_amount` varchar(255) NOT NULL DEFAULT '0',
  `payment_mode` varchar(100) NOT NULL,
  `cash_payed` varchar(255) NOT NULL DEFAULT '0',
  `online_payed` varchar(255) NOT NULL DEFAULT '0',
  `card_payed` int(11) NOT NULL DEFAULT 0,
  `order_placed_by_id` int(11) NOT NULL,
  `discount` int(11) DEFAULT 0,
  `on_scrap_discount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `tracking_no`, `invoice_no`, `total_amount`, `net_total`, `order_date`, `order_status`, `payed_amount`, `pending_amount`, `payment_mode`, `cash_payed`, `online_payed`, `card_payed`, `order_placed_by_id`, `discount`, `on_scrap_discount`) VALUES
(1, 2, '62726', 'INV-115385', '140', '100', '2024-08-10', 'Booked', '100', '0', 'Cash Payment', '0', '0', 0, 8, 40, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `profit` int(11) NOT NULL DEFAULT 0,
  `date_trans` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `price`, `quantity`, `profit`, `date_trans`) VALUES
(1, 1, 10, '140', 1, 0, '2024-08-10');

-- --------------------------------------------------------

--
-- Table structure for table `order_retail`
--

CREATE TABLE `order_retail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `profit` int(11) NOT NULL DEFAULT 0,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_scrap`
--

CREATE TABLE `order_scrap` (
  `id` int(11) NOT NULL,
  `scrapname` varchar(255) NOT NULL,
  `amp` varchar(255) NOT NULL,
  `discount` varchar(25) NOT NULL,
  `unit_price` varchar(255) NOT NULL DEFAULT '0',
  `profit` varchar(255) NOT NULL DEFAULT '0',
  `date_trans` varchar(255) NOT NULL DEFAULT '0',
  `order_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `price` int(11) NOT NULL,
  `buying_price` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Visible; 1=Hidden',
  `exactdate` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `brand` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `barcode`, `description`, `price`, `buying_price`, `quantity`, `image`, `status`, `exactdate`, `created_at`, `brand`, `Type`) VALUES
(1, 0, '45498787566', '', '', 120, 100, 0, '/images/prods', 1, '2024-08-10', '2024-08-10 10:11:25', '', '0'),
(2, 0, '12313413212', '', '', 1233, 123, 0, '/images/prods', 1, '2024-08-10', '2024-08-10 10:12:32', '', '0'),
(3, 0, '', '456979989889', '', 1500, 12000, 1000, '/images/prods', 1, '2024-08-10', '2024-08-10 10:18:51', '1', '0'),
(4, 0, '456979989889', '', '', 1500, 12000, 0, '/images/prods', 1, '2024-08-10', '2024-08-10 10:18:51', '', '0'),
(5, 0, '12121212', '', '', 11, 12, 0, '/images/prods', 1, '2024-08-10', '2024-08-10 10:20:18', '', '0'),
(6, 0, '12121212adasdas', '', '', 11, 12, 0, '/images/prods', 1, '2024-08-10', '2024-08-10 10:21:48', '', '0'),
(7, 0, 'Test', '2598841636855', '', 120, 100, 1200, '/images/prods', 1, '2024-08-10', '2024-08-10 10:27:52', '1', '0'),
(8, 0, 'Test1', '2564633', '', 120, 100, 100, '/images/prods', 1, '2024-08-10', '2024-08-10 10:28:46', '1', '0'),
(10, 1, 'testy', '150', '', 140, 0, 99, '/images/prods', 1, '2024-08-10', '2024-08-10 10:59:25', '1', '0'),
(11, 1, 'asdqqw', '125478665', '', 150, 120, 100, '/images/prods', 1, '2024-08-10', '2024-08-10 11:00:10', '1', '0'),
(12, 1, 'asdqqwSAAS', '', '', 150, 120, 100, '/images/prods', 1, '2024-08-10', '2024-08-10 11:01:30', '1', '0'),
(13, 1, 'asdqqwSAAS266', '', '', 150, 120, 100, '/images/prods', 1, '2024-08-10', '2024-08-10 11:01:55', '1', '0'),
(14, 1, 'asdqqwSAAS266w', '', '', 150, 120, 100, '/images/prods', 1, '2024-08-10', '2024-08-10 11:02:18', '1', '0'),
(15, 1, 'asdasd', '200', '', 150, 0, 100, '/images/prods', 1, '2024-08-10', '2024-08-10 11:03:29', '1', '0'),
(16, 1, 'asdasd8744', '', '', 150, 0, 100, '/images/prods', 1, '2024-08-10', '2024-08-10 11:04:35', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `retail_products`
--

CREATE TABLE `retail_products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `buy_price` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `updated_at` date NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` int(11) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `received_item` varchar(255) NOT NULL,
  `released_item` varchar(255) NOT NULL,
  `released_name` varchar(255) NOT NULL,
  `return_comment` text DEFAULT NULL,
  `tr_date` varchar(255) NOT NULL,
  `wrdate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scrapsmaster`
--

CREATE TABLE `scrapsmaster` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rate_type` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scrap_rate`
--

CREATE TABLE `scrap_rate` (
  `id` int(11) NOT NULL,
  `rateType` varchar(255) NOT NULL,
  `rate_` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scrap_weights`
--

CREATE TABLE `scrap_weights` (
  `id` int(11) NOT NULL,
  `scrap_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `weight` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `store_id` int(11) NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tr_items`
--

CREATE TABLE `tr_items` (
  `id` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL DEFAULT '0',
  `Description` text DEFAULT NULL,
  `buying_price` varchar(255) NOT NULL,
  `selling_price` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `amp` varchar(255) NOT NULL DEFAULT '0',
  `tbatch` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_history`
--
ALTER TABLE `credit_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `melimit`
--
ALTER TABLE `melimit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_scrap`
--
ALTER TABLE `order_scrap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `retail_products`
--
ALTER TABLE `retail_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scrapsmaster`
--
ALTER TABLE `scrapsmaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scrap_rate`
--
ALTER TABLE `scrap_rate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scrap_weights`
--
ALTER TABLE `scrap_weights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tr_items`
--
ALTER TABLE `tr_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `credit_history`
--
ALTER TABLE `credit_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `melimit`
--
ALTER TABLE `melimit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_scrap`
--
ALTER TABLE `order_scrap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `retail_products`
--
ALTER TABLE `retail_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scrapsmaster`
--
ALTER TABLE `scrapsmaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scrap_rate`
--
ALTER TABLE `scrap_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scrap_weights`
--
ALTER TABLE `scrap_weights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tr_items`
--
ALTER TABLE `tr_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

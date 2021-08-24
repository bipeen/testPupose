-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2021 at 05:52 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_kunyo`
--
CREATE DATABASE IF NOT EXISTS `test_kunyo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `test_kunyo`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

DROP TABLE IF EXISTS `tbl_orders`;
CREATE TABLE `tbl_orders` (
  `order_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `sales_type` enum('Normal','Promotion','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_orders`
--

INSERT INTO `tbl_orders` (`order_id`, `order_date`, `sales_type`) VALUES
(1001, '2007-05-01 12:10:10', 'Normal'),
(1002, '2007-05-07 05:28:55', 'Normal'),
(1003, '2007-05-19 17:17:00', 'Promotion'),
(1004, '2007-05-22 22:47:16', 'Promotion'),
(1005, '2007-05-27 08:15:07', 'Promotion'),
(1006, '2007-06-01 06:35:59', 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_products`
--

DROP TABLE IF EXISTS `tbl_order_products`;
CREATE TABLE `tbl_order_products` (
  `order_product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `item_name` text DEFAULT NULL,
  `normal_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_order_products`
--

INSERT INTO `tbl_order_products` (`order_product_id`, `order_id`, `item_name`, `normal_price`, `promotion_price`) VALUES
(2000, 1001, 'Radio', 800, 712.99),
(2001, 1002, 'Portable Audio', 16, 15),
(2002, 1002, 'THE SIMS', 9.99, 8.79),
(2003, 1003, 'Radio', 800, 712.99),
(2004, 1004, 'Scanner', 124, 120),
(2005, 1005, 'Portable Audio', 16, 15),
(2006, 1005, 'Radio', 800, 712.99),
(2007, 1006, 'Camcorders', 359, 303),
(2008, 1006, 'Radio', 800, 712.99);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reward_customer`
--

DROP TABLE IF EXISTS `tbl_reward_customer`;
CREATE TABLE `tbl_reward_customer` (
  `reward_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `reward_amount` float DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `awarded_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_reward_customer`
--

INSERT INTO `tbl_reward_customer` (`reward_id`, `order_id`, `customer_id`, `reward_amount`, `expiry_date`, `awarded_date`) VALUES
(1, 23111, 23, 2.31, '2022-08-24', '2021-08-24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tbl_reward_customer`
--
ALTER TABLE `tbl_reward_customer`
  ADD PRIMARY KEY (`reward_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1007;

--
-- AUTO_INCREMENT for table `tbl_reward_customer`
--
ALTER TABLE `tbl_reward_customer`
  MODIFY `reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

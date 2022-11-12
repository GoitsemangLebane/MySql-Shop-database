-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2022 at 12:11 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `reg_date` date NOT NULL,
  `address` text NOT NULL,
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `reg_date`, `address`, `city`) VALUES
(1, 'Austin Lebane', '2022-11-13', 'Kgale view, Plot 51374', 'Gaboorone'),
(3, 'Poloko Rankwane', '2022-11-10', 'Ramotswa, Plot 443', 'Ramotswa');

--
-- Triggers `customer`
--
DROP TRIGGER IF EXISTS `record_delete`;
DELIMITER $$
CREATE TRIGGER `record_delete` AFTER DELETE ON `customer` FOR EACH ROW delete from orders where orders.id = customer.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `onumber` int(11) NOT NULL,
  `prod` varchar(30) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`onumber`, `prod`, `quantity`, `price`, `total_price`, `id`, `date`, `discount`) VALUES
(1, 'folderable chair', 4, 11, 44, 1, '2022-11-01', 5),
(2, 'tents', 5, 11, 66, 2, '2022-11-15', 5),
(3, 'camp chairs', 3, 11, 33, 3, '2022-11-10', 5);

--
-- Triggers `orders`
--
DROP TRIGGER IF EXISTS `delete_record`;
DELIMITER $$
CREATE TRIGGER `delete_record` AFTER DELETE ON `orders` FOR EACH ROW delete from orders where orders.id=customer.id
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`onumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `onumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

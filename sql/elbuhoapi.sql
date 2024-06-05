-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2024 at 04:24 AM
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
-- Database: `elbuhoapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `emailVerified` tinyint(1) NOT NULL DEFAULT 0,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `resetPasswordExpires` datetime DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `email` varchar(255) NOT NULL,
  `activationToken` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `username`, `password`, `createdAt`, `updatedAt`, `firstName`, `lastName`, `emailVerified`, `resetPasswordToken`, `resetPasswordExpires`, `isActive`, `email`, `activationToken`) VALUES
(45, 'admin', '$2b$10$VxXKFcncrvtvyFEWPrNUvuhqoRw4oWMw5M1XrXhJ0/e8WRLA37Xlq', '2024-06-04 04:33:28', '2024-06-04 05:30:09', 'qwer', 'ty', 0, NULL, NULL, 1, 'ss@gmail.com', NULL),
(46, 'adminki', '$2b$10$y2JWuAMgb1xFLIF64mF38Oed4Q/Vcyo17QGBHrt3hCQCIBb4Swlsy', '2024-06-05 01:11:19', '2024-06-05 02:22:16', 'depan', 'terakhir', 1, '3010764404e7ed0de16dcf512ee1bd8fff122a1a', '2024-06-05 03:22:16', 1, 'firzastory@gmail.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

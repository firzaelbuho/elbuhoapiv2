-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2024 at 05:36 PM
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
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `activityId` int(11) NOT NULL,
  `activityName` varchar(100) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`activityId`, `activityName`, `createdAt`, `updatedAt`) VALUES
(1, 'fighting', '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(2, 'training', '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(3, 'studying', '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(4, 'reading', '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(5, 'casting spells', '2024-07-16 07:44:36', '2024-07-16 07:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `characterjobs`
--

CREATE TABLE `characterjobs` (
  `charId` int(11) NOT NULL,
  `jobId` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `characterjobs`
--

INSERT INTO `characterjobs` (`charId`, `jobId`, `createdAt`, `updatedAt`) VALUES
(1, 1, '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(1, 2, '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(2, 3, '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(2, 4, '2024-07-16 07:44:36', '2024-07-16 07:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `charId` int(11) NOT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `isDateAble` tinyint(1) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`charId`, `fullName`, `nickname`, `birthday`, `age`, `gender`, `origin`, `isDateAble`, `description`, `createdAt`, `updatedAt`) VALUES
(1, 'John Doe', 'Johnny', '2000-01-01', 24, 'Male', 'New York', 1, 'A brave warrior from New York.', '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(2, 'Jane Doe', 'Janie', '2002-05-15', 22, 'Female', 'New York', 0, 'A wise mage with vast knowledge of spells.', '2024-07-16 07:44:36', '2024-07-16 07:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `dislikesactivities`
--

CREATE TABLE `dislikesactivities` (
  `charId` int(11) NOT NULL,
  `activityId` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dislikesfoods`
--

CREATE TABLE `dislikesfoods` (
  `charId` int(11) NOT NULL,
  `foodId` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dislikesfoods`
--

INSERT INTO `dislikesfoods` (`charId`, `foodId`, `createdAt`, `updatedAt`) VALUES
(1, 1, '2024-07-16 08:49:18', '2024-07-16 08:49:18'),
(1, 4, '2024-07-16 08:49:18', '2024-07-16 08:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `dislikesgoods`
--

CREATE TABLE `dislikesgoods` (
  `charId` int(11) NOT NULL,
  `goodId` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dislikesgoods`
--

INSERT INTO `dislikesgoods` (`charId`, `goodId`, `createdAt`, `updatedAt`) VALUES
(2, 1, '2024-07-16 08:48:28', '2024-07-16 08:48:28');

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `foodId` int(11) NOT NULL,
  `foodName` varchar(100) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`foodId`, `foodName`, `createdAt`, `updatedAt`) VALUES
(1, 'meat', '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(2, 'bread', '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(3, 'vegetables', '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(4, 'fruits', '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(5, 'salads', '2024-07-16 07:44:36', '2024-07-16 07:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `goods`
--

CREATE TABLE `goods` (
  `goodId` int(11) NOT NULL,
  `goodName` varchar(100) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `goods`
--

INSERT INTO `goods` (`goodId`, `goodName`, `createdAt`, `updatedAt`) VALUES
(1, 'sword', '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(2, 'shield', '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(3, 'books', '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(4, 'wand', '2024-07-16 07:44:36', '2024-07-16 07:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `jobId` int(11) NOT NULL,
  `jobName` varchar(100) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`jobId`, `jobName`, `createdAt`, `updatedAt`) VALUES
(1, 'Warrior', '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(2, 'Blacksmith', '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(3, 'Mage', '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(4, 'Scholar', '2024-07-16 07:44:36', '2024-07-16 07:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `likesactivities`
--

CREATE TABLE `likesactivities` (
  `charId` int(11) NOT NULL,
  `activityId` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likesactivities`
--

INSERT INTO `likesactivities` (`charId`, `activityId`, `createdAt`, `updatedAt`) VALUES
(1, 1, '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(1, 2, '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(2, 4, '2024-07-16 07:44:36', '2024-07-16 07:44:36'),
(2, 5, '2024-07-16 07:44:36', '2024-07-16 07:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `likesfoods`
--

CREATE TABLE `likesfoods` (
  `charId` int(11) NOT NULL,
  `foodId` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likesfoods`
--

INSERT INTO `likesfoods` (`charId`, `foodId`, `createdAt`, `updatedAt`) VALUES
(1, 2, '2024-07-16 08:32:18', '2024-07-16 08:32:18'),
(1, 3, '2024-07-16 08:32:18', '2024-07-16 08:32:18');

-- --------------------------------------------------------

--
-- Table structure for table `likesgoods`
--

CREATE TABLE `likesgoods` (
  `charId` int(11) NOT NULL,
  `goodId` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relatives`
--

CREATE TABLE `relatives` (
  `charId` int(11) NOT NULL,
  `relativeCharId` int(11) NOT NULL,
  `relativeStatus` varchar(50) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `relatives`
--

INSERT INTO `relatives` (`charId`, `relativeCharId`, `relativeStatus`, `createdAt`, `updatedAt`) VALUES
(1, 2, 'sibling', '2024-07-16 08:33:29', '2024-07-16 08:33:29'),
(2, 1, 'sibling', '2024-07-16 08:33:29', '2024-07-16 08:33:29');

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
(46, 'adminki', '$2b$10$y2JWuAMgb1xFLIF64mF38Oed4Q/Vcyo17QGBHrt3hCQCIBb4Swlsy', '2024-06-05 01:11:19', '2024-06-05 05:12:10', 'depan', 'terakhir', 1, '3010764404e7ed0de16dcf512ee1bd8fff122a1a', '2024-06-05 03:22:16', 1, 'firzastory@gmail.com', 'fb20fed3fbcc164203d36913fa26a55eca56d6b9');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activityId`);

--
-- Indexes for table `characterjobs`
--
ALTER TABLE `characterjobs`
  ADD PRIMARY KEY (`charId`,`jobId`),
  ADD KEY `jobId` (`jobId`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`charId`);

--
-- Indexes for table `dislikesactivities`
--
ALTER TABLE `dislikesactivities`
  ADD PRIMARY KEY (`charId`,`activityId`),
  ADD KEY `activityId` (`activityId`);

--
-- Indexes for table `dislikesfoods`
--
ALTER TABLE `dislikesfoods`
  ADD PRIMARY KEY (`charId`,`foodId`),
  ADD KEY `foodId` (`foodId`);

--
-- Indexes for table `dislikesgoods`
--
ALTER TABLE `dislikesgoods`
  ADD PRIMARY KEY (`charId`,`goodId`),
  ADD KEY `goodId` (`goodId`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`foodId`);

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`goodId`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`jobId`);

--
-- Indexes for table `likesactivities`
--
ALTER TABLE `likesactivities`
  ADD PRIMARY KEY (`charId`,`activityId`),
  ADD KEY `activityId` (`activityId`);

--
-- Indexes for table `likesfoods`
--
ALTER TABLE `likesfoods`
  ADD PRIMARY KEY (`charId`,`foodId`),
  ADD KEY `foodId` (`foodId`);

--
-- Indexes for table `likesgoods`
--
ALTER TABLE `likesgoods`
  ADD PRIMARY KEY (`charId`,`goodId`),
  ADD KEY `goodId` (`goodId`);

--
-- Indexes for table `relatives`
--
ALTER TABLE `relatives`
  ADD PRIMARY KEY (`charId`,`relativeCharId`),
  ADD KEY `relativeCharId` (`relativeCharId`);

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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `characterjobs`
--
ALTER TABLE `characterjobs`
  ADD CONSTRAINT `characterjobs_ibfk_1` FOREIGN KEY (`charId`) REFERENCES `characters` (`charId`),
  ADD CONSTRAINT `characterjobs_ibfk_2` FOREIGN KEY (`jobId`) REFERENCES `jobs` (`jobId`);

--
-- Constraints for table `dislikesactivities`
--
ALTER TABLE `dislikesactivities`
  ADD CONSTRAINT `dislikesactivities_ibfk_1` FOREIGN KEY (`charId`) REFERENCES `characters` (`charId`),
  ADD CONSTRAINT `dislikesactivities_ibfk_2` FOREIGN KEY (`activityId`) REFERENCES `activities` (`activityId`);

--
-- Constraints for table `dislikesfoods`
--
ALTER TABLE `dislikesfoods`
  ADD CONSTRAINT `dislikesfoods_ibfk_1` FOREIGN KEY (`charId`) REFERENCES `characters` (`charId`),
  ADD CONSTRAINT `dislikesfoods_ibfk_2` FOREIGN KEY (`foodId`) REFERENCES `foods` (`foodId`);

--
-- Constraints for table `dislikesgoods`
--
ALTER TABLE `dislikesgoods`
  ADD CONSTRAINT `dislikesgoods_ibfk_1` FOREIGN KEY (`charId`) REFERENCES `characters` (`charId`),
  ADD CONSTRAINT `dislikesgoods_ibfk_2` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodId`);

--
-- Constraints for table `likesactivities`
--
ALTER TABLE `likesactivities`
  ADD CONSTRAINT `likesactivities_ibfk_1` FOREIGN KEY (`charId`) REFERENCES `characters` (`charId`),
  ADD CONSTRAINT `likesactivities_ibfk_2` FOREIGN KEY (`activityId`) REFERENCES `activities` (`activityId`);

--
-- Constraints for table `likesfoods`
--
ALTER TABLE `likesfoods`
  ADD CONSTRAINT `likesfoods_ibfk_1` FOREIGN KEY (`charId`) REFERENCES `characters` (`charId`),
  ADD CONSTRAINT `likesfoods_ibfk_2` FOREIGN KEY (`foodId`) REFERENCES `foods` (`foodId`);

--
-- Constraints for table `likesgoods`
--
ALTER TABLE `likesgoods`
  ADD CONSTRAINT `likesgoods_ibfk_1` FOREIGN KEY (`charId`) REFERENCES `characters` (`charId`),
  ADD CONSTRAINT `likesgoods_ibfk_2` FOREIGN KEY (`goodId`) REFERENCES `goods` (`goodId`);

--
-- Constraints for table `relatives`
--
ALTER TABLE `relatives`
  ADD CONSTRAINT `relatives_ibfk_1` FOREIGN KEY (`charId`) REFERENCES `characters` (`charId`),
  ADD CONSTRAINT `relatives_ibfk_2` FOREIGN KEY (`relativeCharId`) REFERENCES `characters` (`charId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

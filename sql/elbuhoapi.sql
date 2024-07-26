-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2024 at 04:36 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `charId` int(11) NOT NULL,
  `fullName` varchar(50) DEFAULT NULL,
  `nickName` varchar(50) DEFAULT NULL,
  `callName` varchar(50) NOT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `origin` varchar(50) DEFAULT NULL,
  `isDateAble` tinyint(1) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`charId`, `fullName`, `nickName`, `callName`, `birthday`, `age`, `gender`, `origin`, `isDateAble`, `description`, `createdAt`, `updatedAt`) VALUES
(1, 'Viona', 'Viona', 'Viona', '14 July', 23, 'Female', 'Immigrant', 1, 'Perawat, datang dari kota bersama ayahnya untuk membantu orang-orang di daerah terpencil', '2024-07-26 00:14:40', '2024-07-26 00:14:40'),
(2, 'Heri', 'Heri', 'dr. Heri', '17 November', 44, 'Male', 'Immigrant', 0, 'Dokter, membangun klinik di pulau dengan dananya sendiri. dibantu putrinya Viona', '2024-07-26 00:14:40', '2024-07-26 00:15:10'),
(3, 'Joni', 'Joni', 'Joni', '14 April', 20, 'Male', 'Native', 1, 'Anak sebatangkara, yang kemudian diangkat menjadi anak oleh Jeki. bekerja bersama Jeki sebagai petugas keamanan', '2024-07-26 00:19:40', '2024-07-26 00:19:40'),
(4, 'Jeki', 'Jeki', 'Mr. Jeki', '11 Feburary', 50, 'Male', 'Native', 0, 'Petugas keamanan desa. tidak dikaruniai anak, akhirnya menemukan Joni dan mengangkatnya sebagai anak', '2024-07-26 00:19:40', '2024-07-26 00:19:40'),
(5, 'Tono', 'Tono', 'Mr. Tono', '24 September', 50, 'Male', 'Native', 0, 'Kepala desa yang bijaksana dan selalu mendukung warganya.', '2024-07-26 00:23:38', '2024-07-26 00:43:58'),
(6, 'Tini', 'Tini', 'Mrs. Tini', '2 April', 45, 'Female', 'Native', 0, 'istri kepala desa', '2024-07-26 00:23:38', '2024-07-26 02:18:36'),
(7, 'Dewi', 'Dewi', 'Dewi', '12 November', 22, 'Female', 'Immigrant', 1, 'Guru junior dari kota. baik dan pinter', '2024-07-26 00:34:05', '2024-07-26 00:34:05'),
(8, 'Budi', 'Budi', 'Mr. Budi', '11 July', 36, 'Male', 'Native', 0, 'Guru Senior. baik, tulus dan bijaksana', '2024-07-26 00:34:05', '2024-07-26 00:34:05'),
(9, 'Henry', 'Henry', 'Henry', '11 October', 27, 'Male', 'Native', 1, 'Manajer yang mengelola hotel untuk wisatawan / pendatang', '2024-07-26 00:37:36', '2024-07-26 00:37:36'),
(10, 'Yuki', 'Yuki', 'Yuki', '17 March', 21, 'Female', 'Native', 1, 'Resepsionis Hotel. penduduk asli', '2024-07-26 00:37:36', '2024-07-26 00:37:36'),
(11, 'Kezio', 'Kezio', 'Kezio', '5 May', 23, 'Male', 'Immigrant', 1, 'Pengurus peternakan, bersama dengan kembarannya, Kezia', '2024-07-26 00:42:59', '2024-07-26 01:30:00'),
(12, 'Kezia', 'Kezia', 'Kezia', '5 May', 23, 'Female', 'Immigrant', 1, 'Pengurus peternakan, bersama dengan kembarannya, Kezio', '2024-07-26 00:42:59', '2024-07-26 01:30:00'),
(13, 'Lim', 'Lim', 'Lim', '12 December', 26, 'Male', 'Immigrant', 1, 'Seorang merchant, menangani keluar masuknya barang. juga menyediakan pemesanan barang dari luar desa dan pulau', '2024-07-26 00:49:04', '2024-07-26 00:49:04'),
(14, 'Lino', 'Lino', 'Mr. X', '1 January', 25, 'Male', 'Immigrant', 1, 'Teknisi, ahli dalam bidang komputer. bertugas mengoperasikan pembangkit listrik dan bertanggungjawab perihal kelistrikan', '2024-07-26 00:49:04', '2024-07-26 01:17:38'),
(15, 'Helisma', 'Helisma', 'Helisma', '15 June', 24, 'Female', 'Immigrant', 1, 'Mantan idol terkenal, setelah memutuskan berhenti sebagai idol. untuk menenagkan diri memutuskan sementara pindah ke Desa. ia juga sering menghibur warga desa dengan Suaranya', '2024-07-26 00:54:24', '2024-07-26 00:54:24'),
(16, 'Max', 'Max', 'Max', '3 April', 28, 'Male', 'Native', 1, 'Penjaga pantai, adik dari Mr. Yunus. juga suka mengajar gymnastic. atletis', '2024-07-26 00:54:24', '2024-07-26 00:54:24'),
(17, 'Albert', 'Albert', 'Mr. Albert', '2 December', 48, 'Male', 'Immigrant', 0, 'Pemilik Cafe, pengusaha besar. membawa keluarganya ke desa untuk mengurangi stress. berasal dari negeri barat', '2024-07-26 01:05:10', '2024-07-26 01:05:10'),
(18, 'May', 'May', 'Mrs. May', '10 October', 47, 'Female', NULL, 0, 'Istri dari Albert, bekerja di Cafe milik nya', '2024-07-26 01:05:10', '2024-07-26 01:05:10'),
(19, 'Melissa', 'Melissa', 'Melissa', '1 April', 19, 'Female', 'Immigrant', 1, 'Anak dari May dan Albert. ikut pindah orang tuanya untuk mencari suasana tenang demi melakukan hobbynya bermain musik. terampil bermain berbagai alat musik seperti biola dan Keyboard', '2024-07-26 01:05:10', '2024-07-26 01:05:10'),
(20, 'Yunus', 'Yunus', 'Mr. Yunus', '7 June', 39, 'Male', 'Native', 0, 'Nelayan di desa. ', '2024-07-26 01:09:12', '2024-07-26 01:09:12'),
(21, 'Lina', 'Lina', 'Mrs. Lina', '11 February', 39, 'Female', 'Native', 0, 'Istri yunus, pandai memasak berbagai olahan seafood', '2024-07-26 01:09:12', '2024-07-26 01:09:12'),
(22, 'Deri', 'Deri', 'Deri', '3 September', 19, 'Male', 'Native', 1, 'Putra Yunus dan Lina, suka ikut mencari ikan bersama ayahnya', '2024-07-26 01:09:12', '2024-07-26 01:09:12'),
(23, 'Siska', 'Siska', 'Siska', '1 November', 29, 'Female', 'Native', 1, 'anak bungsu Nani dan Sanjaya, bibi dari nana, sekarang bekerja sebagai sekretaris di kantor Relife. galak', '2024-07-26 01:16:12', '2024-07-26 01:31:18'),
(24, 'Linda', 'Linda', 'Linda', '7 April', 18, 'Female', 'Native', 1, 'Putri Kepala Desa. baik hati. kini membantu pekerjaan orang tuanya dalam mengurus administrasi dan hubungan dengan para warga', '2024-07-26 01:16:12', '2024-07-26 01:16:12'),
(25, 'Andi', 'Andi', 'Mr. Andi', '16 January', 38, 'Male', 'Immigrant', 0, 'Pekerja keras, bekerja di pelabuhan. jarang pulang. dulnya dari luar, dan menikah dengan warga desa', '2024-07-26 01:22:42', '2024-07-26 01:22:42'),
(26, 'Riani', 'Riani', 'Mrs. Riani', '11 August', 38, 'Female', 'Native', 0, 'istri Andi, ibu rumah tangga', '2024-07-26 01:22:42', '2024-07-26 02:19:44'),
(27, 'Ria', 'Ria', 'Ria', '28 May', 12, 'Female', 'Native', 0, 'Putri Andi dan Riani, lucu dan hormat kepada semua orang, periang', '2024-07-26 01:22:42', '2024-07-26 01:22:42'),
(28, 'Sanjaya', 'Sanjaya', 'Grandpa Sanjaya', '23 August', 67, 'Male', 'Native', 0, 'Sepuh di desa. sangat dihormati. suami dari Nani dan kakek dari Nana', '2024-07-26 01:29:30', '2024-07-26 01:29:30'),
(29, 'Nina', 'Nina', 'Grandma Nina', '11 June', 65, 'Female', 'Native', 0, 'Istri dari Sanjaya. nenek dari Nana.', '2024-07-26 01:29:30', '2024-07-26 01:29:30'),
(30, 'Nana', 'Nana', 'Nana', '10 April', 6, 'Female', 'Native', 0, 'Cucu dari Nani dan Sanjaya. memilih tinggal bersama kakek dan neneknya dibanding kedua orang tuanya di kota', '2024-07-26 01:29:30', '2024-07-26 01:29:30'),
(31, 'Lia', 'Lia', 'Lia', '16 Desember', 12, 'Female', 'Native', 0, 'Anak kepala desa, adik linda. suka seni', '2024-07-26 02:03:21', '2024-07-26 02:03:21'),
(32, 'Leonardo', 'Leo', 'Leo', '11 January', 20, 'Male', 'Immigrant', 1, 'Pelukis pendatang, ingin mengabadikan keindahan di desa', '2024-07-26 02:03:21', '2024-07-26 02:03:21'),
(33, 'Cindy', 'Cindy', 'Cindy', '1 October', 25, 'Female', 'Native', 1, 'seorang biologist dan botanist, mengurus museum keanekaragaman. suka meneliti berbagai makhluk hidup yang ada. sering bekerja sama dengan Karl', '2024-07-26 02:03:21', '2024-07-26 02:03:21'),
(34, 'Karl', 'Karl', 'Karl', '26 December', 25, 'Male', 'Immigrant', 1, 'Geologist, Explorer, suka menjelajah dan meneliti alam, sering bekerja sama dengan Cindy', '2024-07-26 02:03:21', '2024-07-26 02:03:21'),
(35, 'Deri', 'Deri', 'Mr, Deri', '18 January', 40, 'Male', 'Native', 0, 'Petani , bertanggung jawab mengelola lahan persawahan', '2024-07-26 02:17:12', '2024-07-26 02:17:12'),
(36, 'Diana', 'Diana', 'Mrs. Diana', '17 January', 40, 'Female', 'Native', 0, 'istri Deri. membantu mengurus pertanian', '2024-07-26 02:17:12', '2024-07-26 02:17:12'),
(37, 'Lilia', NULL, '', '20 January', 11, 'Female', 'Native', 0, 'putri keluarga petani, teman Lia', '2024-07-26 02:17:12', '2024-07-26 02:17:12'),
(38, 'Elly', 'Elly', 'Elly', '20 September', 20, 'Female', 'Native', 1, 'Kasir di mart', '2024-07-26 02:17:12', '2024-07-26 02:17:12'),
(39, 'Tomy', 'Tomy', 'Tomy', '22 November', 23, 'Male', 'Native', 1, 'Staff di mart, mengurusi seperti stok barang, mengantar barang dan sebagainya', '2024-07-26 02:17:12', '2024-07-26 02:17:12'),
(40, 'Flora', 'Flora', 'Flora', '29 April', 19, 'Female', 'Native', 1, 'Gadis Penyuka bunga, memiliki taman bunga, suka menjual bunganya kepada para wisatawan', '2024-07-26 02:30:11', '2024-07-26 02:30:11'),
(41, 'Lani', 'Lani', 'Mrs. Lani', '30 March', 42, 'Female', 'Native', 0, 'Single Parent, bekerja sebagai penjahit. ibu dari Flora', '2024-07-26 02:30:11', '2024-07-26 02:30:11'),
(42, 'Gani', 'Gani', 'Mr. Gani', '11 January', 43, 'Male', 'Native', 0, 'Pengrajin, bisa membuat berbagai bentuk bangunan maupun perabotan dan perkakas dari kayu , batu, dsb, single parent.', '2024-07-26 02:30:11', '2024-07-26 02:30:11'),
(43, 'Kim', 'Kim', 'Kim', '12 October', 18, 'Male', 'Native', 1, 'putra Gani, suka membantu pekerjaan orang tuanya. juka suka membuat berbagai macam kerajinan tangan untuk dijual ', '2024-07-26 02:30:11', '2024-07-26 02:30:11');

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
(1, 'Mayor', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(2, 'Chief', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(3, 'Businessman', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(4, 'Merchant', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(5, 'Officer', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(6, 'Staff', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(7, 'Fisherman', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(8, 'Coast Guard', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(9, 'Athlete', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(10, 'Florist', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(11, 'Farmer', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(12, 'Teacher', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(13, 'Student', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(14, 'Manager', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(15, 'Security Guard', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(16, 'Singer', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(17, 'Idol', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(18, 'Dancer', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(19, 'Tourist', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(20, 'Chef', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(21, 'Cafe Owner', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(22, 'Dorm Staff', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(23, 'Hotel Staff', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(24, 'Waiters', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(25, 'Housekeeper', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(26, 'Maid', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(27, 'Nurse', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(28, 'Doctor', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(29, 'Musician', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(30, 'Painter', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(31, 'Botanist', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(32, 'Geologist', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(33, 'Fish Farmer', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(34, 'Livestock Farmer', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(35, 'Engineer', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(36, 'Admin', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(37, 'Assistant', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(38, 'Secretary', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(39, 'Driver', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(40, 'Entrepeneur', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(41, 'Trader', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(42, 'Broker', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(43, 'Cashier', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(44, 'Shop Owner', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(45, 'Harbour Staff', '2024-07-25 06:03:54', '2024-07-25 06:03:54'),
(46, 'Explorer', '2024-07-25 06:03:54', '2024-07-25 06:03:54');

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
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `charId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `jobId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

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

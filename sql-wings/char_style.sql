-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 31, 2020 at 07:09 PM
-- Server version: 10.5.6-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `topaz`
--

-- --------------------------------------------------------

--
-- Table structure for table `char_style`
--

DROP TABLE IF EXISTS `char_style`;
CREATE TABLE `char_style` (
  `charid` int(10) UNSIGNED NOT NULL,
  `head` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `body` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `hands` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `legs` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `feet` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `main` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `sub` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `ranged` smallint(5) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM AVG_ROW_LENGTH=20 DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `char_style`
--
ALTER TABLE `char_style`
  ADD PRIMARY KEY (`charid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

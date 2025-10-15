-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2025 at 06:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Table structure for table `autore`
--

CREATE TABLE `autore` (
  `id` int(11) NOT NULL,
  `Nome_Autore` varchar(20) NOT NULL,
  `Cognome_Autore` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `autore`
--

INSERT INTO `autore` (`id`, `Nome_Autore`, `Cognome_Autore`) VALUES(43, 'agostino', 'lorenzi');
INSERT INTO `autore` (`id`, `Nome_Autore`, `Cognome_Autore`) VALUES(42, 'feuder', 'dostoysky');

-- --------------------------------------------------------

--
-- Table structure for table `libro`
--

CREATE TABLE `libro` (
  `id` int(11) NOT NULL,
  `isbn` varchar(10) NOT NULL,
  `titolo` varchar(20) NOT NULL,
  `prezzo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `libro`
--

INSERT INTO `libro` (`id`, `isbn`, `titolo`, `prezzo`) VALUES(25, 'a', 'delitto e castigo', 10);
INSERT INTO `libro` (`id`, `isbn`, `titolo`, `prezzo`) VALUES(26, 'b', 'python', 15);
INSERT INTO `libro` (`id`, `isbn`, `titolo`, `prezzo`) VALUES(27, 'c', 'protech-c++', 34);

-- --------------------------------------------------------

--
-- Table structure for table `scritto`
--

CREATE TABLE `scritto` (
  `id` int(11) NOT NULL,
  `codaut` int(10) DEFAULT NULL,
  `codlib` int(11) DEFAULT NULL,
  `data` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `scritto`
--

INSERT INTO `scritto` (`id`, `codaut`, `codlib`, `data`) VALUES(22, 42, 25, '12/12/1866');
INSERT INTO `scritto` (`id`, `codaut`, `codlib`, `data`) VALUES(23, 43, 26, '');
INSERT INTO `scritto` (`id`, `codaut`, `codlib`, `data`) VALUES(25, 43, 27, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autore`
--
ALTER TABLE `autore`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Nome_Autore_2` (`Nome_Autore`,`Cognome_Autore`);

--
-- Indexes for table `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `titolo` (`titolo`);

--
-- Indexes for table `scritto`
--
ALTER TABLE `scritto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codaut` (`codaut`),
  ADD KEY `codlib` (`codlib`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autore`
--
ALTER TABLE `autore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `libro`
--
ALTER TABLE `libro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `scritto`
--
ALTER TABLE `scritto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `scritto`
--
ALTER TABLE `scritto`
  ADD CONSTRAINT `scritto_ibfk_1` FOREIGN KEY (`codlib`) REFERENCES `libro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scritto_ibfk_2` FOREIGN KEY (`codaut`) REFERENCES `autore` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

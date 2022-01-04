-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2022 at 05:16 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `second_lab`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `id` int(13) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `agent_works`
--

CREATE TABLE `agent_works` (
  `id` int(13) NOT NULL,
  `agent_id` int(13) NOT NULL,
  `compliants_id` int(13) NOT NULL,
  `employees_id` int(13) NOT NULL,
  `agent_status` enum('Assigned','Closed','','') NOT NULL,
  `compliants_correction` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `compliants`
--

CREATE TABLE `compliants` (
  `id` int(13) NOT NULL,
  `user_id` int(13) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `compliants` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(13) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employees_works`
--

CREATE TABLE `employees_works` (
  `id` int(13) NOT NULL,
  `compliants_id` int(13) NOT NULL,
  `employees_id` int(13) NOT NULL,
  `compliants_status` enum('inprogress','stuck','completed','') DEFAULT NULL,
  `compliants_correction` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Reg_Id` int(12) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Username` varchar(25) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agent_works`
--
ALTER TABLE `agent_works`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compliants_id` (`compliants_id`),
  ADD KEY `employees_id` (`employees_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `compliants`
--
ALTER TABLE `compliants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees_works`
--
ALTER TABLE `employees_works`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compliants_id` (`compliants_id`),
  ADD KEY `employees_id` (`employees_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Reg_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compliants`
--
ALTER TABLE `compliants`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees_works`
--
ALTER TABLE `employees_works`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Reg_Id` int(12) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agent_works`
--
ALTER TABLE `agent_works`
  ADD CONSTRAINT `agent_works_ibfk_1` FOREIGN KEY (`compliants_id`) REFERENCES `compliants` (`id`),
  ADD CONSTRAINT `agent_works_ibfk_2` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `agent_works_ibfk_3` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

--
-- Constraints for table `compliants`
--
ALTER TABLE `compliants`
  ADD CONSTRAINT `compliants_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`Reg_Id`);

--
-- Constraints for table `employees_works`
--
ALTER TABLE `employees_works`
  ADD CONSTRAINT `employees_works_ibfk_1` FOREIGN KEY (`compliants_id`) REFERENCES `compliants` (`id`),
  ADD CONSTRAINT `employees_works_ibfk_2` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

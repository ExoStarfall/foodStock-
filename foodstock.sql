-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 07, 2021 at 03:24 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodstock`
--

-- --------------------------------------------------------

--
-- Table structure for table `aliment`
--

CREATE TABLE `aliment` (
  `id` int(11) NOT NULL,
  `nom` text COLLATE utf8_unicode_ci NOT NULL,
  `dt_achat` datetime NOT NULL,
  `prix_achat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `aliment`
--

INSERT INTO `aliment` (`id`, `nom`, `dt_achat`, `prix_achat`, `id_stock`) VALUES
(1, 'Pomme', '2021-01-07 14:57:07', '1.5', 1),
(2, 'Courgette', '2021-01-01 00:00:00', '1.50', 2),
(3, 'lentilles', '2021-01-05 00:00:00', '2', 2),
(4, 'Quinoa', '2020-12-24 00:00:00', '3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `assoc_alim_type_sais`
--

CREATE TABLE `assoc_alim_type_sais` (
  `id` int(11) NOT NULL,
  `alim_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `sais_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assoc_alim_type_sais`
--

INSERT INTO `assoc_alim_type_sais` (`id`, `alim_id`, `type_id`, `sais_id`) VALUES
(1, 2, 2, 2),
(2, 3, 3, 2),
(3, 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sais`
--

CREATE TABLE `sais` (
  `id` int(11) NOT NULL,
  `sais` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sais`
--

INSERT INTO `sais` (`id`, `sais`) VALUES
(1, 'Automne'),
(2, 'Hiver'),
(3, 'Printemps'),
(4, 'Été');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `stock` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `stock`) VALUES
(1, 0),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id`, `type`) VALUES
(1, 'Fruit'),
(2, 'Legume'),
(3, 'Legumineuse'),
(4, 'Autre');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aliment`
--
ALTER TABLE `aliment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_stock` (`id_stock`);

--
-- Indexes for table `assoc_alim_type_sais`
--
ALTER TABLE `assoc_alim_type_sais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alim_id` (`alim_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `sais_id` (`sais_id`);

--
-- Indexes for table `sais`
--
ALTER TABLE `sais`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock` (`stock`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assoc_alim_type_sais`
--
ALTER TABLE `assoc_alim_type_sais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aliment`
--
ALTER TABLE `aliment`
  ADD CONSTRAINT `aliment_ibfk_1` FOREIGN KEY (`id_stock`) REFERENCES `stock` (`id`);

--
-- Constraints for table `assoc_alim_type_sais`
--
ALTER TABLE `assoc_alim_type_sais`
  ADD CONSTRAINT `assoc_alim_type_sais_ibfk_1` FOREIGN KEY (`sais_id`) REFERENCES `sais` (`id`),
  ADD CONSTRAINT `assoc_alim_type_sais_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  ADD CONSTRAINT `assoc_alim_type_sais_ibfk_3` FOREIGN KEY (`alim_id`) REFERENCES `aliment` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

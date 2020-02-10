-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2020 at 01:25 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `practicabcnactiva`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `codi-postal` varchar(20) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `adreça-postal` varchar(50) NOT NULL,
  `email` varchar(300) NOT NULL,
  `data-registre` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `recomenat-per` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `nom`, `codi-postal`, `telefono`, `adreça-postal`, `email`, `data-registre`, `recomenat-per`) VALUES
(1, 'client1', '08007', '656565656', 'Avinguda Margall 12', 'client1@gmail.com', '2020-02-07 12:08:48', 'Amic'),
(3, 'client2', '08005', '656565657', 'Avinguda Margall 15', 'example@example.com', '2020-02-07 12:10:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `empleat`
--

CREATE TABLE `empleat` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `empleat`
--

INSERT INTO `empleat` (`id`, `nom`) VALUES
(1, 'empleat1'),
(2, 'empleat2');

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `id-ulleres` int(11) NOT NULL,
  `id-empleat` int(11) NOT NULL,
  `id-client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factura`
--

INSERT INTO `factura` (`id`, `id-ulleres`, `id-empleat`, `id-client`) VALUES
(1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `id-proveidor` int(11) NOT NULL,
  `nom-marca` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marca`
--

INSERT INTO `marca` (`id`, `id-proveidor`, `nom-marca`) VALUES
(1, 1, 'Lacoste'),
(2, 2, 'Burger King');

-- --------------------------------------------------------

--
-- Table structure for table `proveidor`
--

CREATE TABLE `proveidor` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `carrer` varchar(50) NOT NULL,
  `numero` smallint(6) NOT NULL,
  `pis` smallint(6) NOT NULL,
  `porta` smallint(6) NOT NULL,
  `ciutat` varchar(50) NOT NULL,
  `codi-postal` varchar(20) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `NIF` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proveidor`
--

INSERT INTO `proveidor` (`id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi-postal`, `pais`, `telefon`, `fax`, `NIF`) VALUES
(1, 'proveidor1', 'Urzaiz', 1, 25, 1, 'Barcelona', '08005', 'Spain', '65665929', '65665929', '4545454H'),
(2, 'proveidor2', 'Mallorca', 22, 3, 1, 'Barcelona', '08027', 'Spain', '65665930', '65665930', '4545454H');

-- --------------------------------------------------------

--
-- Table structure for table `ulleres`
--

CREATE TABLE `ulleres` (
  `id` int(11) NOT NULL,
  `id-marca` int(11) NOT NULL,
  `muntura` enum('flotant','pasta','metalica') NOT NULL,
  `color-muntura` varchar(20) NOT NULL,
  `color-vidre` varchar(20) NOT NULL,
  `preu` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ulleres`
--

INSERT INTO `ulleres` (`id`, `id-marca`, `muntura`, `color-muntura`, `color-vidre`, `preu`) VALUES
(1, 2, 'pasta', 'blanc', 'negre', 12),
(2, 1, 'metalica', 'vermell', 'verd', 5.25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-factura-client` (`id-client`),
  ADD KEY `fk-factura-empleat` (`id-empleat`),
  ADD KEY `fk-factura-ulleres` (`id-ulleres`);

--
-- Indexes for table `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-proveidor-marca` (`id-proveidor`);

--
-- Indexes for table `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-marca-proveidor` (`id-marca`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `empleat`
--
ALTER TABLE `empleat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proveidor`
--
ALTER TABLE `proveidor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk-factura-client` FOREIGN KEY (`id-client`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `fk-factura-empleat` FOREIGN KEY (`id-empleat`) REFERENCES `empleat` (`id`),
  ADD CONSTRAINT `fk-factura-ulleres` FOREIGN KEY (`id-ulleres`) REFERENCES `ulleres` (`id`);

--
-- Constraints for table `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `fk-proveidor-marca` FOREIGN KEY (`id-proveidor`) REFERENCES `proveidor` (`id`);

--
-- Constraints for table `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `fk-marca-proveidor` FOREIGN KEY (`id-marca`) REFERENCES `marca` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

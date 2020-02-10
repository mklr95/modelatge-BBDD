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
-- Database: `basededadesbcnactiva`
--

-- --------------------------------------------------------

--
-- Table structure for table `amistat`
--

CREATE TABLE `amistat` (
  `id` int(11) NOT NULL,
  `usuari1` int(11) NOT NULL,
  `usuari2` int(11) NOT NULL,
  `comesconeixen` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `autor`
--

CREATE TABLE `autor` (
  `nom` varchar(50) NOT NULL,
  `direccio` varchar(50) NOT NULL,
  `mesdeunllibre` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `avions`
--

CREATE TABLE `avions` (
  `id-avio` int(100) NOT NULL,
  `capacitat` int(11) NOT NULL,
  `model` varchar(100) NOT NULL,
  `seients` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comprador`
--

CREATE TABLE `comprador` (
  `dni-client` varchar(10) NOT NULL,
  `nom-comprador` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `id-cliente` int(50) NOT NULL,
  `data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id-libro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fotografies`
--

CREATE TABLE `fotografies` (
  `codi` int(11) NOT NULL,
  `adreça` varchar(300) NOT NULL,
  `url` varchar(2000) NOT NULL,
  `usuari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `llibres`
--

CREATE TABLE `llibres` (
  `id` int(11) NOT NULL,
  `titol` varchar(50) NOT NULL,
  `preu` decimal(10,0) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quadres`
--

CREATE TABLE `quadres` (
  `identificador` varchar(50) NOT NULL,
  `preu` decimal(10,0) NOT NULL,
  `autor` int(50) DEFAULT NULL,
  `comprador` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuari`
--

CREATE TABLE `usuari` (
  `nom` varchar(50) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuari-llibres`
--

CREATE TABLE `usuari-llibres` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuari-xarxasocial`
--

CREATE TABLE `usuari-xarxasocial` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `identificador` int(11) NOT NULL,
  `descripcio` varchar(300) NOT NULL,
  `titol` varchar(50) NOT NULL,
  `url` varchar(300) NOT NULL,
  `usuario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amistat`
--
ALTER TABLE `amistat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-amistat-usuari1` (`usuari1`),
  ADD KEY `fk-amistat-usuari2` (`usuari2`);

--
-- Indexes for table `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`nom`);

--
-- Indexes for table `avions`
--
ALTER TABLE `avions`
  ADD PRIMARY KEY (`id-avio`),
  ADD UNIQUE KEY `capacity` (`capacitat`);

--
-- Indexes for table `comprador`
--
ALTER TABLE `comprador`
  ADD PRIMARY KEY (`dni-client`);

--
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk-factura-libro` (`id-libro`),
  ADD KEY `fk-factura-usuari` (`id-cliente`);

--
-- Indexes for table `fotografies`
--
ALTER TABLE `fotografies`
  ADD KEY `fk-foto-usuari` (`usuari`);

--
-- Indexes for table `llibres`
--
ALTER TABLE `llibres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quadres`
--
ALTER TABLE `quadres`
  ADD PRIMARY KEY (`identificador`),
  ADD KEY `fk-comprador-client` (`comprador`);

--
-- Indexes for table `usuari`
--
ALTER TABLE `usuari`
  ADD PRIMARY KEY (`nom`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `usuari-llibres`
--
ALTER TABLE `usuari-llibres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuari-xarxasocial`
--
ALTER TABLE `usuari-xarxasocial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`identificador`),
  ADD KEY `fk-usuario-video` (`usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amistat`
--
ALTER TABLE `amistat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuari-llibres`
--
ALTER TABLE `usuari-llibres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuari-xarxasocial`
--
ALTER TABLE `usuari-xarxasocial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `identificador` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amistat`
--
ALTER TABLE `amistat`
  ADD CONSTRAINT `fk-amistat-usuari1` FOREIGN KEY (`usuari1`) REFERENCES `usuari-xarxasocial` (`id`),
  ADD CONSTRAINT `fk-amistat-usuari2` FOREIGN KEY (`usuari2`) REFERENCES `usuari-xarxasocial` (`id`);

--
-- Constraints for table `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk-factura-libro` FOREIGN KEY (`id-libro`) REFERENCES `llibres` (`id`),
  ADD CONSTRAINT `fk-factura-usuari` FOREIGN KEY (`id-cliente`) REFERENCES `usuari-llibres` (`id`);

--
-- Constraints for table `fotografies`
--
ALTER TABLE `fotografies`
  ADD CONSTRAINT `fk-foto-usuari` FOREIGN KEY (`usuari`) REFERENCES `usuari-xarxasocial` (`id`);

--
-- Constraints for table `quadres`
--
ALTER TABLE `quadres`
  ADD CONSTRAINT `fk-comprador-client` FOREIGN KEY (`comprador`) REFERENCES `comprador` (`dni-client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `fk-usuario-video` FOREIGN KEY (`usuario`) REFERENCES `usuari` (`nom`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

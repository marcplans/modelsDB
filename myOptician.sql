-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 03, 2019 at 10:51 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myOptician`
--

-- --------------------------------------------------------

--
-- Table structure for table `Brand`
--

CREATE TABLE `Brand` (
  `idBrand` int(11) NOT NULL,
  `nameBrand` varchar(45) NOT NULL,
  `Provider_idProvider` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Brand`
--

INSERT INTO `Brand` (`idBrand`, `nameBrand`, `Provider_idProvider`) VALUES
(1, 'Woody Glasses', 3),
(2, 'Oculus', 2),
(3, 'Salamandra\'s', 1),
(4, 'Sunshine', 3),
(5, 'Bonavista', 1),
(6, 'Kalidoscopic', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `idCustomer` int(11) NOT NULL,
  `nameCustomer` varchar(45) NOT NULL,
  `addressCustomer` varchar(45) NOT NULL,
  `telephoneNumberCustomer` varchar(45) NOT NULL,
  `emailCustomer` varchar(45) NOT NULL,
  `registerDate` date DEFAULT NULL,
  `idFriendRecommendation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`idCustomer`, `nameCustomer`, `addressCustomer`, `telephoneNumberCustomer`, `emailCustomer`, `registerDate`, `idFriendRecommendation`) VALUES
(1, 'Anna Puig', 'Ull de poll, 67, 3r 2a, 08045 Barcelona', '932 548 986', 'annapuig@gmail.com', '2019-02-06', 3),
(2, 'Miquel Garcia', 'Albers, 67, 4t 2a, 08012 Barcelona', '932 233 548', 'mgarcia@gmail.com', '2019-03-05', 1),
(3, 'Max Lopes', 'Verdaguer 7, 08034 Barcelona', '932 668 754', 'lopesmax@gmail.com', '2019-04-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `idEmployee` int(11) NOT NULL,
  `nameEmployee` varchar(45) NOT NULL,
  `lastNameEmployee` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`idEmployee`, `nameEmployee`, `lastNameEmployee`) VALUES
(1, 'Joan', 'Garriga'),
(2, 'Jessica', 'Santaló'),
(3, 'Pep', 'Pérez');

-- --------------------------------------------------------

--
-- Table structure for table `Glasses`
--

CREATE TABLE `Glasses` (
  `idGlasses` int(11) NOT NULL,
  `Brand_idBrand` int(11) NOT NULL,
  `dioptersLeft` decimal(10,4) NOT NULL,
  `dioptersRight` decimal(10,4) NOT NULL,
  `colorLeft` varchar(10) NOT NULL,
  `colorRight` varchar(10) NOT NULL,
  `frameType` enum('Floating','Plastic','Metal') NOT NULL,
  `frameColor` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Glasses`
--

INSERT INTO `Glasses` (`idGlasses`, `Brand_idBrand`, `dioptersLeft`, `dioptersRight`, `colorLeft`, `colorRight`, `frameType`, `frameColor`, `price`) VALUES
(1, 6, '0.7500', '1.2500', 'Groc', 'Groc', 'Plastic', 'Negre', '120.30'),
(2, 2, '2.5000', '2.0000', 'Gris', 'Gris', 'Metal', 'Crom', '152.50'),
(3, 4, '0.0000', '0.0000', 'Negre', 'Negre', 'Floating', 'Blanc', '199.99'),
(4, 1, '1.5000', '1.7500', 'Vermell', 'Vermell', 'Plastic', 'Vermell', '250.35');

-- --------------------------------------------------------

--
-- Table structure for table `itemSale`
--

CREATE TABLE `itemSale` (
  `idItemSale` int(11) NOT NULL,
  `Sale_idSale` int(11) NOT NULL,
  `Glasses_idGlasses` int(11) NOT NULL,
  `itemUnitPrice` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `itemTotalAmount` decimal(10,2) NOT NULL,
  `Employee_idEmployee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itemSale`
--

INSERT INTO `itemSale` (`idItemSale`, `Sale_idSale`, `Glasses_idGlasses`, `itemUnitPrice`, `quantity`, `itemTotalAmount`, `Employee_idEmployee`) VALUES
(1, 1, 1, '120.30', 2, '240.60', 2),
(2, 1, 3, '199.99', 1, '199.99', 2),
(3, 3, 4, '250.35', 2, '500.70', 3),
(4, 2, 2, '152.50', 1, '152.50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Provider`
--

CREATE TABLE `Provider` (
  `idProvider` int(11) NOT NULL,
  `nameProvider` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `streetNumber` int(11) NOT NULL,
  `floor` int(11) DEFAULT NULL,
  `doorNumber` int(11) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `postalCode` int(11) NOT NULL,
  `country` varchar(45) NOT NULL,
  `telephoneNumber` varchar(45) NOT NULL,
  `faxNumber` varchar(45) DEFAULT NULL,
  `taxIdNumber` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Provider`
--

INSERT INTO `Provider` (`idProvider`, `nameProvider`, `street`, `streetNumber`, `floor`, `doorNumber`, `city`, `postalCode`, `country`, `telephoneNumber`, `faxNumber`, `taxIdNumber`) VALUES
(1, 'Optics Bcn', 'Puigmal', 7, 1, 2, 'Barcelona', 8011, 'Spain', '+34 932 142 635', NULL, 'C45858974'),
(2, 'Shiny Glasses', 'Muntaner', 145, 6, 2, 'Barcelona', 8022, 'Spain', '+34 932 562 737', NULL, 'A42734976'),
(3, 'Acme Inc', 'Coyote', 899, NULL, NULL, 'El Paso', 79901, 'US', '+1 915 625 8967', NULL, '87-2876319');

-- --------------------------------------------------------

--
-- Table structure for table `Sale`
--

CREATE TABLE `Sale` (
  `idSale` int(11) NOT NULL,
  `Customer_idCustomer` int(11) NOT NULL,
  `saleDate` date NOT NULL,
  `saleTotalAmount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Sale`
--

INSERT INTO `Sale` (`idSale`, `Customer_idCustomer`, `saleDate`, `saleTotalAmount`) VALUES
(1, 3, '2019-04-01', '440.59'),
(2, 2, '2019-03-27', '152.50'),
(3, 1, '2019-02-04', '500.70');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Brand`
--
ALTER TABLE `Brand`
  ADD PRIMARY KEY (`idBrand`),
  ADD KEY `fk_Brand_Provider1_idx` (`Provider_idProvider`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`idCustomer`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`idEmployee`);

--
-- Indexes for table `Glasses`
--
ALTER TABLE `Glasses`
  ADD PRIMARY KEY (`idGlasses`) USING BTREE,
  ADD KEY `fk_Glasses_Brand_idx` (`Brand_idBrand`);

--
-- Indexes for table `itemSale`
--
ALTER TABLE `itemSale`
  ADD PRIMARY KEY (`idItemSale`) USING BTREE,
  ADD KEY `fk_itemSale_Sale1_idx` (`Sale_idSale`),
  ADD KEY `fk_itemSale_Glasses1_idx` (`Glasses_idGlasses`),
  ADD KEY `fk_itemSale_Employee1_idx` (`Employee_idEmployee`);

--
-- Indexes for table `Provider`
--
ALTER TABLE `Provider`
  ADD PRIMARY KEY (`idProvider`);

--
-- Indexes for table `Sale`
--
ALTER TABLE `Sale`
  ADD PRIMARY KEY (`idSale`),
  ADD KEY `fk_Sale_Customer1_idx` (`Customer_idCustomer`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Brand`
--
ALTER TABLE `Brand`
  MODIFY `idBrand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `idCustomer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `idEmployee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Glasses`
--
ALTER TABLE `Glasses`
  MODIFY `idGlasses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `itemSale`
--
ALTER TABLE `itemSale`
  MODIFY `idItemSale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Provider`
--
ALTER TABLE `Provider`
  MODIFY `idProvider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Sale`
--
ALTER TABLE `Sale`
  MODIFY `idSale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Brand`
--
ALTER TABLE `Brand`
  ADD CONSTRAINT `fk_Brand_Provider1` FOREIGN KEY (`Provider_idProvider`) REFERENCES `Provider` (`idProvider`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Glasses`
--
ALTER TABLE `Glasses`
  ADD CONSTRAINT `fk_Glasses_Brand` FOREIGN KEY (`Brand_idBrand`) REFERENCES `Brand` (`idBrand`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `itemSale`
--
ALTER TABLE `itemSale`
  ADD CONSTRAINT `fk_itemSale_Employee1` FOREIGN KEY (`Employee_idEmployee`) REFERENCES `Employee` (`idEmployee`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_itemSale_Sale1` FOREIGN KEY (`Sale_idSale`) REFERENCES `Sale` (`idSale`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `itemSale_ibfk_1` FOREIGN KEY (`Glasses_idGlasses`) REFERENCES `Glasses` (`idGlasses`);

--
-- Constraints for table `Sale`
--
ALTER TABLE `Sale`
  ADD CONSTRAINT `fk_Sale_Customer1` FOREIGN KEY (`Customer_idCustomer`) REFERENCES `Customer` (`idCustomer`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

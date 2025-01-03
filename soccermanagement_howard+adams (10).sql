-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2020 at 10:59 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soccermanagement_adamshoward`
--

-- --------------------------------------------------------

--
-- Table structure for table `basicseat`
--

CREATE TABLE `basicseat` (
  `BasicID` int(3) NOT NULL,
  `SeatNum` int(2) NOT NULL,
  `SectionNum` int(2) NOT NULL,
  `SeatID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `clubmanagement`
--

CREATE TABLE `clubmanagement` (
  `FranchiseID` int(1) NOT NULL,
  `Experience` int(2) NOT NULL,
  `Title` varchar(20) NOT NULL,
  `Salary` int(7) NOT NULL,
  `EmployeeID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `coach`
--

CREATE TABLE `coach` (
  `CoachID` int(6) NOT NULL,
  `Experience` int(2) NOT NULL,
  `Title` varchar(20) NOT NULL,
  `Salary` int(7) NOT NULL,
  `EmployeeID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustID` int(8) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `SeasonTicketHolder` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` int(6) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `Telephone` int(10) NOT NULL,
  `SSN` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `foodvendor`
--

CREATE TABLE `foodvendor` (
  `VendorID` int(4) NOT NULL,
  `LotID` int(2) NOT NULL,
  `CompanyName` varchar(20) NOT NULL,
  `FoodQty` int(3) NOT NULL,
  `DrinksQty` int(3) NOT NULL,
  `NapkinsQty` int(3) NOT NULL,
  `UtensilsQty` int(3) NOT NULL,
  `CondimentsQty` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `PlayerID` int(6) NOT NULL,
  `CoachID` int(6) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` int(20) NOT NULL,
  `Jersey` int(2) NOT NULL,
  `Hometown` int(20) NOT NULL,
  `Height` varchar(4) NOT NULL,
  `Weight` int(3) NOT NULL,
  `Age` int(2) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `DateAquired` varchar(10) NOT NULL,
  `Salary` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `SeatID` int(5) NOT NULL,
  `CustID` int(8) NOT NULL,
  `TicketID` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `suite`
--

CREATE TABLE `suite` (
  `SuiteID` int(2) NOT NULL,
  `SuiteNum` int(2) NOT NULL,
  `SectionNum` int(2) NOT NULL,
  `SeatID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `TicketID` int(7) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `Time` int(4) NOT NULL,
  `Authentic` tinyint(1) NOT NULL,
  `CustID` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vendorlocation`
--

CREATE TABLE `vendorlocation` (
  `LotID` int(2) NOT NULL,
  `NumEmployees` int(2) NOT NULL,
  `EmployeeId` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basicseat`
--
ALTER TABLE `basicseat`
  ADD PRIMARY KEY (`BasicID`),
  ADD KEY `SeatID` (`SeatID`);

--
-- Indexes for table `clubmanagement`
--
ALTER TABLE `clubmanagement`
  ADD PRIMARY KEY (`FranchiseID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `coach`
--
ALTER TABLE `coach`
  ADD PRIMARY KEY (`CoachID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `foodvendor`
--
ALTER TABLE `foodvendor`
  ADD PRIMARY KEY (`VendorID`),
  ADD KEY `LotID` (`LotID`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`PlayerID`),
  ADD KEY `CoachID` (`CoachID`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`SeatID`),
  ADD UNIQUE KEY `CustID` (`CustID`),
  ADD UNIQUE KEY `TicketID` (`TicketID`);

--
-- Indexes for table `suite`
--
ALTER TABLE `suite`
  ADD PRIMARY KEY (`SuiteID`),
  ADD KEY `SeatID` (`SeatID`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`TicketID`),
  ADD KEY `CustID` (`CustID`);

--
-- Indexes for table `vendorlocation`
--
ALTER TABLE `vendorlocation`
  ADD PRIMARY KEY (`LotID`),
  ADD UNIQUE KEY `EmployeeId` (`EmployeeId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

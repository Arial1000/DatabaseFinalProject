-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2020 at 05:27 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loyalhospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE `channel` (
  `channelno` varchar(255) NOT NULL,
  `doctorname` varchar(255) NOT NULL,
  `patientname` varchar(255) NOT NULL,
  `roomno` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `channel`
--

INSERT INTO `channel` (`channelno`, `doctorname`, `patientname`, `roomno`, `date`) VALUES
('CH001', 'DS001', 'PS002', 1, '2019-07-17');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorno` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `channelfee` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `room` int(11) NOT NULL,
  `log_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorno`, `name`, `special`, `qualification`, `channelfee`, `phone`, `room`, `log_id`) VALUES
('11', 'sdsf', 'sdf', 'dsf', 23, 233, 2, 5),
('1222', 'ddd', 'sss', 'weee', 1233, 22333, 3, 5),
('222', 'dfds', 'fdsf', 'dsf', 2323, 2233, 1, 5),
('2233', 'sss', 'arrr', 'qqww', 112, 111, 2, 5),
('324', 'dsf', 'sdf', 'sdf', 3434, 3434, 6, 5),
('D0001', 'Kishan', '23232', 'dsfsd', 12000, 1111, 1, 5),
('DS001', 'Raja', 'Ca', 'MBBS', 12000, 232323, 1, 5),
('DS002', 'Hari', 'Ca', 'MBBS', 13000, 23232, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `itemid` varchar(255) NOT NULL,
  `itemname` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `sellprice` int(11) NOT NULL,
  `buyprice` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`itemid`, `itemname`, `description`, `sellprice`, `buyprice`, `qty`) VALUES
('IU001', 'Panadol', 'Panadol', 15, 10, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientno` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientno`, `name`, `phone`, `address`) VALUES
('0001', 'sdas', 0, 'badulla'),
('0002', 'sd', 4545, 'dsf'),
('0003', 'kobinath', 715487240, 'sadas'),
('0004', 'ewr', 43534, 'dsfsd sfds');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `pid` varchar(255) NOT NULL,
  `channelid` varchar(255) NOT NULL,
  `doctorname` varchar(255) NOT NULL,
  `detype` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`pid`, `channelid`, `doctorname`, `detype`, `description`) VALUES
('PC001', 'CH001', 'Raja', 'Fever', 'Fever asdasd pandal');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `subtotal` int(11) NOT NULL,
  `pay` int(11) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `date`, `subtotal`, `pay`, `balance`) VALUES
(36, '2019-07-21', 300, 500, 200);

-- --------------------------------------------------------

--
-- Table structure for table `sale_product`
--

CREATE TABLE `sale_product` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `prod_id` varchar(255) NOT NULL,
  `qty` int(255) NOT NULL,
  `sellprice` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_product`
--

INSERT INTO `sale_product` (`id`, `sales_id`, `prod_id`, `qty`, `sellprice`, `total`) VALUES
(8, 36, 'IU001', 20, 15, 300);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `utype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `utype`) VALUES
(4, 'John', 'John', '321', 'Receptionst'),
(5, 'Raja', 'Raja', '123', 'Doctor'),
(6, 'Peter', 'Peteer', '123', 'Pharmacist'),
(8, 'Hari', 'Hari', '123', 'Doctor'),
(9, 'Maven', 'Maven', '123', 'Receptionst');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`channelno`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorno`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientno`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_product`
--
ALTER TABLE `sale_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `sale_product`
--
ALTER TABLE `sale_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

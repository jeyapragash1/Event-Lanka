-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2024 at 09:37 AM
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
-- Database: `event01`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `userId`, `password`, `username`) VALUES
(4, 5, '$2y$10$PK/HCKPbL/MH6p8VMQNwhuz3cYU.fIZ1bAB2ZAnPYW8sjDIEoe5nO', 'jeyapragash');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `eventId` int(11) NOT NULL,
  `eventName` varchar(100) NOT NULL,
  `eventType` varchar(50) DEFAULT NULL,
  `eventDescription` text DEFAULT NULL,
  `eventDate` date DEFAULT NULL,
  `eventVenue` varchar(255) DEFAULT NULL,
  `noOfGuests` int(11) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`eventId`, `eventName`, `eventType`, `eventDescription`, `eventDate`, `eventVenue`, `noOfGuests`, `adminId`) VALUES
(4, 'Beach Wedding Ceremony', 'Wedding', 'Romantic beach wedding at sunset', '2024-12-31', 'Mount Lavinia Hotel', 150, NULL),
(5, 'Uva Tea Industry Summit', 'Corporate', 'Annual meeting of Uva province tea estate owners and exporters', '2024-11-20', 'Grand Monarch Badulla', 200, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedbackId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comments` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notificationId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` tinyint(1) NOT NULL DEFAULT 0,
  `serviceProviderId` int(11) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notificationId`, `userId`, `message`, `createdAt`, `isRead`, `serviceProviderId`, `adminId`) VALUES
(20, 54, 'Your payment of LKR 100,000.00 has been received and confirmed.', '2024-10-21 02:22:06', 0, NULL, NULL),
(21, 54, 'Your payment of LKR 700,000.00 has been received and confirmed.', '2024-10-21 02:53:06', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `packageId` int(11) NOT NULL,
  `packageName` varchar(100) NOT NULL,
  `packageDetails` text NOT NULL,
  `packagePrice` decimal(10,2) NOT NULL,
  `packagetype` varchar(100) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `packageImage` varchar(255) DEFAULT NULL,
  `providerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`packageId`, `packageName`, `packageDetails`, `packagePrice`, `packagetype`, `adminId`, `packageImage`, `providerId`) VALUES
(66, 'Basic Package', 'Person 600-650,\r\nWelcome Drinks ,\r\nPhotography and Videography (5hrs),\r\n3 currys,non veg curry ,\r\nCostume,\r\nCar only (5hrs),', 750000.00, 'Basic', 4, 'https://th.bing.com/th/id/OIP.AesXds749DiNxl1iP9yckQHaEK?rs=1&pid=ImgDetMain', 27),
(79, 'Standard Package', 'Person 800-850,\r\nWelcome Drinks,\r\nPhotography and Videography (8hrs),\r\n5 currys with two rice & non veg curry,\r\nCostume, Luxury Car (7hrs)', 850000.00, 'Standard', 4, 'https://th.bing.com/th/id/R.a006085e89b9e34f3e675d2dd56028ee?rik=2yKAgqkBFlU2Ag&riu=http%3a%2f%2finspiredluv.com%2fwp-content%2fuploads%2f2016%2f08%2f4-wedding-hall-decoration.jpg&ehk=eu%2bT3XjWHFx49jmkKghzI2u0E9FIDHArFCD0E3NZEA4%3d&risl=&pid=ImgRaw&r=0', 27),
(80, 'Premium Package', 'Person 1400-1500,\r\nWelcome Drinks, \r\nPhotography and Videography (12hrs),\r\n7currys with two rice &non veg curry, \r\nCostume &make up,\r\nDecoration,\r\nLuxury Car and Van (1day),', 1000000.00, 'Premium', 4, 'https://th.bing.com/th/id/OIP.ImfME2Aaf-NFuXfmxGFU-wHaE8?w=750&h=500&rs=1&pid=ImgDetMain', 27);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentId` int(11) NOT NULL,
  `paymentDate` date NOT NULL,
  `paymentMethod` varchar(50) NOT NULL,
  `userId` int(11) NOT NULL,
  `packageId` int(11) NOT NULL,
  `paymentType` varchar(50) DEFAULT NULL,
  `amount` float NOT NULL,
  `advanceAmount` float DEFAULT NULL,
  `dueAmount` float DEFAULT NULL,
  `eventDate` date DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip_code` varchar(20) NOT NULL,
  `card_name` varchar(100) NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `exp_month` varchar(10) NOT NULL,
  `exp_year` varchar(10) NOT NULL,
  `cvv` varchar(10) NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `otp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentId`, `paymentDate`, `paymentMethod`, `userId`, `packageId`, `paymentType`, `amount`, `advanceAmount`, `dueAmount`, `eventDate`, `first_name`, `last_name`, `email`, `city`, `zip_code`, `card_name`, `card_number`, `exp_month`, `exp_year`, `cvv`, `status`, `otp`) VALUES
(30, '2024-10-21', 'card', 54, 0, 'advance', 700000, 280000, 420000, '2024-10-21', 'jp', 'gtvmh', 'yuvashankar258@gmail.com', 'assds', '123444', 'yuvan', '1111', '12', '2026', '123', 'Completed', '$2y$10$PKESH7diOYNdSXn.7RTWmOdD4u84h7WSk7dEQEJWFaJDFDHGvBany'),
(31, '2024-10-21', 'card', 54, 0, 'advance', 100000, 40000, 60000, '2024-10-21', 'jp', 'gtvmh', 'yuvashankar258@gmail.com', 'assds', '123444', 'yuvan', '1111', '12', '2026', '123', 'Completed', '$2y$10$49zo94OHT14AE.UlG2jmg.8F2nzZDKIBomeTVgHLub7JvQU4I6VAK'),
(38, '2024-10-21', 'card', 54, 0, 'full', 700000, 0, 0, '2024-10-21', 'jp', 'gtvmh', 'baanu1@gmail.com', 'assds', '123444', 'yuvan', '1111', '12', '2026', '123', 'Completed', '$2y$10$Eta3PzkdlbAW4NMAeD9c4Oika1KVCm5/sgs8QYsg/H7Rm.EuvGOIa');

-- --------------------------------------------------------

--
-- Table structure for table `registereduser`
--

CREATE TABLE `registereduser` (
  `userId` int(11) NOT NULL,
  `contactNumber` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `NICNumber` varchar(20) DEFAULT NULL,
  `NICFrontPhoto` varchar(255) DEFAULT NULL,
  `NICBackPhoto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serviceprovider`
--

CREATE TABLE `serviceprovider` (
  `providerId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `providerName` varchar(100) NOT NULL,
  `contactInfo` varchar(50) NOT NULL,
  `serviceDetails` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serviceprovider`
--

INSERT INTO `serviceprovider` (`providerId`, `userId`, `providerName`, `contactInfo`, `serviceDetails`, `status`) VALUES
(27, 55, 'thanu', '075632985', 'Catering', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `serviceId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `serviceName` varchar(100) NOT NULL,
  `serviceDescription` text DEFAULT NULL,
  `tier` enum('Basic','Standard','Premium') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `serviceImage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`serviceId`, `userId`, `serviceName`, `serviceDescription`, `tier`, `price`, `status`, `serviceImage`) VALUES
(8, 55, 'Catering ', 'Professional event planning services', 'Standard', 2033.00, 'approved', 'https://th.bing.com/th/id/R.9ab03429e72c7ba35189c58e7d0501a7?rik=dcDR3HmS6jY4lg&pid=ImgRaw&r=0'),
(10, 55, 'Decorations', 'Event decorations for all occasions', 'Basic', 2033.00, 'approved', 'https://th.bing.com/th/id/OIP.TZQiI8H2Ocq9v3pdP6HbLgHaHW?rs=1&pid=ImgDetMain'),
(30, 55, 'Photography', '100 Photos,Digital Images,High quality Editing,', '', 30000.00, 'pending', 'https://th.bing.com/th/id/R.8802d58250e0e8207a6cf335b7bf1876?rik=lSGuKRkM1qVKvQ&pid=ImgRaw&r=0');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `userType` enum('guest','registered','admin','serviceProvider') NOT NULL DEFAULT 'guest',
  `profilePicture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `username`, `password`, `email`, `userType`, `profilePicture`, `created_at`, `updated_at`, `status`) VALUES
(5, 'jeyapragash', '$2y$10$PK/HCKPbL/MH6p8VMQNwhuz3cYU.fIZ1bAB2ZAnPYW8sjDIEoe5nO', 'jeyapragash@gmail.com', 'admin', NULL, '2024-10-04 07:30:00', '2024-10-05 06:14:55', 'approved'),
(54, 'baanu', '$2y$10$7z.6VkNsT0HcnNFEIHVFgeuKycdsS1oT9YWI43TzkJXd9mVezdF7W', 'baanu@gmail.com', 'registered', NULL, '2024-10-19 13:10:06', '2024-10-20 13:08:23', 'approved'),
(55, 'thanu', '$2y$10$h.rplFgYwzyS9d9UXb.HnuDG/RWKuy/Gu0l3ELHORBRI4V453LwyK', 'thanus@gmail.com', 'serviceProvider', 'https://th.bing.com/th/id/OIP.YnYwmNJLWRsuqKDb-hxm-AHaE7?rs=1&pid=ImgDetMain', '2024-10-19 13:21:19', '2024-10-21 08:00:11', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `usereventbooking`
--

CREATE TABLE `usereventbooking` (
  `bookingId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `eventId` int(11) NOT NULL,
  `bookingDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`),
  ADD UNIQUE KEY `userId` (`userId`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`eventId`),
  ADD KEY `adminId` (`adminId`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notificationId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `serviceProviderId` (`serviceProviderId`),
  ADD KEY `adminId` (`adminId`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`packageId`),
  ADD KEY `fk_adminId` (`adminId`),
  ADD KEY `fk_providerId` (`providerId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `registereduser`
--
ALTER TABLE `registereduser`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `serviceprovider`
--
ALTER TABLE `serviceprovider`
  ADD PRIMARY KEY (`providerId`),
  ADD UNIQUE KEY `userId` (`userId`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`serviceId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userName` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `usereventbooking`
--
ALTER TABLE `usereventbooking`
  ADD PRIMARY KEY (`bookingId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `eventId` (`eventId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `eventId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notificationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `packageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `serviceprovider`
--
ALTER TABLE `serviceprovider`
  MODIFY `providerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `serviceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `usereventbooking`
--
ALTER TABLE `usereventbooking`
  MODIFY `bookingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`) ON DELETE SET NULL;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `registereduser` (`userId`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_admin` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_serviceProvider` FOREIGN KEY (`serviceProviderId`) REFERENCES `serviceprovider` (`providerId`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `fk_adminId` FOREIGN KEY (`adminId`) REFERENCES `admin` (`adminId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_providerId` FOREIGN KEY (`providerId`) REFERENCES `serviceprovider` (`providerId`) ON DELETE CASCADE;

--
-- Constraints for table `registereduser`
--
ALTER TABLE `registereduser`
  ADD CONSTRAINT `registereduser_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE;

--
-- Constraints for table `serviceprovider`
--
ALTER TABLE `serviceprovider`
  ADD CONSTRAINT `serviceprovider_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE;

--
-- Constraints for table `usereventbooking`
--
ALTER TABLE `usereventbooking`
  ADD CONSTRAINT `usereventbooking_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `registereduser` (`userId`) ON DELETE CASCADE,
  ADD CONSTRAINT `usereventbooking_ibfk_2` FOREIGN KEY (`eventId`) REFERENCES `event` (`eventId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

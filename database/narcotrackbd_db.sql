-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 15, 2026 at 03:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `NARCOTRACKBD`
--

-- --------------------------------------------------------

--
-- Table structure for table `ADMIN_ZONE`
--

CREATE TABLE `ADMIN_ZONE` (
  `ZoneID` int(11) NOT NULL,
  `ZoneName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ADMIN_ZONE`
--

INSERT INTO `ADMIN_ZONE` (`ZoneID`, `ZoneName`) VALUES
(1, 'Dhaka North City Corporation'),
(2, 'Dhaka South City Corporation'),
(3, 'Outside Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `ANALYST_DETAILS`
--

CREATE TABLE `ANALYST_DETAILS` (
  `AnalystID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AnalystCode` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ANALYST_DETAILS`
--

INSERT INTO `ANALYST_DETAILS` (`AnalystID`, `UserID`, `AnalystCode`) VALUES
(1, 80, 'ANL-POL-001'),
(2, 81, 'ANL-DNC-001'),
(3, 82, 'ANL-NAT-001'),
(4, 83, 'ANL-DNC-002');

-- --------------------------------------------------------

--
-- Table structure for table `ANALYST_REPORT`
--

CREATE TABLE `ANALYST_REPORT` (
  `AnalystReportID` int(11) NOT NULL,
  `AnalystID` int(11) NOT NULL,
  `CaseID` int(11) NOT NULL,
  `RouteID` int(11) DEFAULT NULL,
  `AnalysisResult` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ANALYST_REPORT`
--

INSERT INTO `ANALYST_REPORT` (`AnalystReportID`, `AnalystID`, `CaseID`, `RouteID`, `AnalysisResult`) VALUES
(1, 73, 31, 1, 'Repeated short-distance trafficking detected within Dhaka.'),
(2, 74, 36, 2, 'Night-time transportation pattern observed.'),
(3, 80, 76, 3, 'Courier-based movement indicates organized network.'),
(4, 82, 10, 4, 'Retail-level distribution across multiple zones.'),
(5, 86, 15, 5, 'Inter-thana redistribution pattern identified.'),
(6, 87, 55, 6, 'Recurring route confirms stable trafficking corridor.'),
(7, 88, 93, 7, 'Local network with limited external linkage.'),
(8, 89, 98, 8, 'Warehouse-to-street movement shows high activity.'),
(9, 90, 34, 9, 'Occasional trafficking suggests opportunistic behavior.'),
(10, 91, 39, 10, 'High-frequency route indicates major distribution channel.');

-- --------------------------------------------------------

--
-- Table structure for table `AUDITOR_DETAILS`
--

CREATE TABLE `AUDITOR_DETAILS` (
  `AuditorID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AuditorCode` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `AUDITOR_DETAILS`
--

INSERT INTO `AUDITOR_DETAILS` (`AuditorID`, `UserID`, `AuditorCode`) VALUES
(1, 106, 'AUD-POL-106'),
(2, 107, 'AUD-POL-107'),
(3, 108, 'AUD-POL-108'),
(4, 109, 'AUD-POL-109'),
(5, 110, 'AUD-POL-110'),
(6, 121, 'AUD-POL-121'),
(7, 122, 'AUD-POL-122');

-- --------------------------------------------------------

--
-- Table structure for table `AUDIT_LOG`
--

CREATE TABLE `AUDIT_LOG` (
  `AuditID` int(11) NOT NULL,
  `CaseID` int(11) NOT NULL,
  `AuditorID` int(11) NOT NULL,
  `Comments` text DEFAULT NULL,
  `AuditStatus` varchar(20) NOT NULL,
  `AuditTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `AUDIT_LOG`
--

INSERT INTO `AUDIT_LOG` (`AuditID`, `CaseID`, `AuditorID`, `Comments`, `AuditStatus`, `AuditTime`) VALUES
(1, 31, 72, 'All evidence and custody records verified.', 'Approved', '2026-01-15 20:28:06'),
(2, 36, 73, 'Minor documentation issues found.', 'Pending', '2026-01-15 20:28:06'),
(3, 76, 74, 'Chain of custody is complete and valid.', 'Approved', '2026-01-15 20:28:06'),
(4, 10, 80, 'Lab report pending verification.', 'In Review', '2026-01-15 20:28:06'),
(5, 15, 72, 'Suspect linkage requires clarification.', 'Pending', '2026-01-15 20:28:06'),
(6, 55, 73, 'No discrepancies detected.', 'Approved', '2026-01-15 20:28:06'),
(7, 93, 74, 'Route analysis data cross-checked.', 'Approved', '2026-01-15 20:28:06'),
(8, 98, 80, 'Awaiting final legal review.', 'In Review', '2026-01-15 20:28:06');

-- --------------------------------------------------------

--
-- Table structure for table `BGB_DETAILS`
--

CREATE TABLE `BGB_DETAILS` (
  `BgbID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BadgeNumber` varchar(50) NOT NULL,
  `BattalionNumber` varchar(30) NOT NULL,
  `Sector` varchar(50) NOT NULL,
  `BorderArea` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `BGB_DETAILS`
--

INSERT INTO `BGB_DETAILS` (`BgbID`, `UserID`, `BadgeNumber`, `BattalionNumber`, `Sector`, `BorderArea`) VALUES
(1, 50, 'BGB-001', 'BGB-1', 'Dhaka Sector', 'Benapole Border'),
(2, 51, 'BGB-002', 'BGB-2', 'Jessore Sector', 'Benapole Border'),
(3, 52, 'BGB-003', 'BGB-4', 'Sylhet Sector', 'Tamabil Border'),
(4, 53, 'BGB-004', 'BGB-5', 'Moulvibazar Sector', 'Srimangal Border'),
(5, 54, 'BGB-005', 'BGB-7', 'Chattogram Sector', 'Teknaf Border'),
(6, 55, 'BGB-006', 'BGB-8', 'Cox’s Bazar Sector', 'Teknaf–Naf River'),
(7, 56, 'BGB-007', 'BGB-10', 'Rajshahi Sector', 'Chapainawabganj Border'),
(8, 57, 'BGB-008', 'BGB-12', 'Dinajpur Sector', 'Hili Border'),
(9, 58, 'BGB-009', 'BGB-15', 'Khagrachhari Sector', 'Ramgarh Border'),
(10, 59, 'BGB-010', 'BGB-17', 'Bandarban Sector', 'Naikhongchhari Border');

-- --------------------------------------------------------

--
-- Table structure for table `CASE_FILE`
--

CREATE TABLE `CASE_FILE` (
  `CaseID` int(11) NOT NULL,
  `CaseNumber` varchar(50) NOT NULL,
  `CreatedBy` int(11) NOT NULL,
  `Description` text DEFAULT NULL,
  `CaseStatus` varchar(30) NOT NULL,
  `CreatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CASE_FILE`
--

INSERT INTO `CASE_FILE` (`CaseID`, `CaseNumber`, `CreatedBy`, `Description`, `CaseStatus`, `CreatedAt`) VALUES
(1, 'NTB-00001', 51, 'Narcotics investigation initiated by Nafisa Islam', 'OPEN', '2026-01-15 00:05:34'),
(2, 'NTB-00002', 49, 'Narcotics investigation initiated by Rasel Khan', 'OPEN', '2026-01-15 00:05:34'),
(3, 'NTB-00003', 17, 'Narcotics investigation initiated by Zubair Khan', 'OPEN', '2026-01-15 00:05:34'),
(4, 'NTB-00004', 55, 'Narcotics investigation initiated by Parvez Mahmud', 'OPEN', '2026-01-15 00:05:34'),
(5, 'NTB-00005', 33, 'Narcotics investigation initiated by Anika Tasnim', 'OPEN', '2026-01-15 00:05:34'),
(6, 'NTB-00006', 21, 'Narcotics investigation initiated by Rashed Mahmud', 'OPEN', '2026-01-15 00:05:34'),
(7, 'NTB-00007', 59, 'Narcotics investigation initiated by Adnan Kabir', 'OPEN', '2026-01-15 00:05:34'),
(8, 'NTB-00008', 37, 'Narcotics investigation initiated by Mahfuz Alam', 'OPEN', '2026-01-15 00:05:34'),
(9, 'NTB-00009', 25, 'Narcotics investigation initiated by Kamrul Hasan', 'OPEN', '2026-01-15 00:05:34'),
(10, 'NTB-00010', 3, 'Narcotics investigation initiated by Nafis Ahmed', 'OPEN', '2026-01-15 00:05:34'),
(11, 'NTB-00011', 41, 'Narcotics investigation initiated by Faisal Ahmed', 'OPEN', '2026-01-15 00:05:34'),
(12, 'NTB-00012', 29, 'Narcotics investigation initiated by Sajid Rahman', 'OPEN', '2026-01-15 00:05:34'),
(13, 'NTB-00013', 7, 'Narcotics investigation initiated by Samiul Hasan', 'OPEN', '2026-01-15 00:05:34'),
(14, 'NTB-00014', 45, 'Narcotics investigation initiated by Asif Mahmud', 'OPEN', '2026-01-15 00:05:34'),
(15, 'NTB-00015', 3, 'Narcotics investigation initiated by Nafis Ahmed', 'OPEN', '2026-01-15 00:05:34'),
(16, 'NTB-00016', 11, 'Narcotics investigation initiated by Tahmid Kabir', 'OPEN', '2026-01-15 00:05:34'),
(17, 'NTB-00017', 49, 'Narcotics investigation initiated by Rasel Khan', 'OPEN', '2026-01-15 00:05:34'),
(18, 'NTB-00018', 7, 'Narcotics investigation initiated by Samiul Hasan', 'OPEN', '2026-01-15 00:05:34'),
(19, 'NTB-00019', 15, 'Narcotics investigation initiated by Adnan Rahim', 'OPEN', '2026-01-15 00:05:34'),
(20, 'NTB-00020', 33, 'Narcotics investigation initiated by Anika Tasnim', 'OPEN', '2026-01-15 00:05:34'),
(21, 'NTB-00021', 11, 'Narcotics investigation initiated by Tahmid Kabir', 'OPEN', '2026-01-15 00:05:34'),
(22, 'NTB-00022', 19, 'Narcotics investigation initiated by Arman Rashid', 'OPEN', '2026-01-15 00:05:34'),
(23, 'NTB-00023', 37, 'Narcotics investigation initiated by Mahfuz Alam', 'OPEN', '2026-01-15 00:05:34'),
(24, 'NTB-00024', 15, 'Narcotics investigation initiated by Adnan Rahim', 'OPEN', '2026-01-15 00:05:34'),
(25, 'NTB-00025', 23, 'Narcotics investigation initiated by Shamim Reza', 'OPEN', '2026-01-15 00:05:34'),
(26, 'NTB-00026', 41, 'Narcotics investigation initiated by Faisal Ahmed', 'OPEN', '2026-01-15 00:05:34'),
(27, 'NTB-00027', 19, 'Narcotics investigation initiated by Arman Rashid', 'OPEN', '2026-01-15 00:05:34'),
(28, 'NTB-00028', 27, 'Narcotics investigation initiated by Sabbir Ahmed', 'OPEN', '2026-01-15 00:05:34'),
(29, 'NTB-00029', 45, 'Narcotics investigation initiated by Asif Mahmud', 'OPEN', '2026-01-15 00:05:34'),
(30, 'NTB-00030', 23, 'Narcotics investigation initiated by Shamim Reza', 'OPEN', '2026-01-15 00:05:34'),
(31, 'NTB-00031', 1, 'Narcotics investigation initiated by Ayaan Rahman', 'OPEN', '2026-01-15 00:05:34'),
(32, 'NTB-00032', 49, 'Narcotics investigation initiated by Rasel Khan', 'OPEN', '2026-01-15 00:05:34'),
(33, 'NTB-00033', 27, 'Narcotics investigation initiated by Sabbir Ahmed', 'OPEN', '2026-01-15 00:05:34'),
(34, 'NTB-00034', 5, 'Narcotics investigation initiated by Raiyan Hossain', 'OPEN', '2026-01-15 00:05:34'),
(35, 'NTB-00035', 53, 'Narcotics investigation initiated by Zahid Hasan', 'OPEN', '2026-01-15 00:05:34'),
(36, 'NTB-00036', 1, 'Narcotics investigation initiated by Ayaan Rahman', 'OPEN', '2026-01-15 00:05:34'),
(37, 'NTB-00037', 9, 'Narcotics investigation initiated by Fahim Sarker', 'OPEN', '2026-01-15 00:05:34'),
(38, 'NTB-00038', 57, 'Narcotics investigation initiated by Tahsin Noor', 'OPEN', '2026-01-15 00:05:34'),
(39, 'NTB-00039', 5, 'Narcotics investigation initiated by Raiyan Hossain', 'OPEN', '2026-01-15 00:05:34'),
(40, 'NTB-00040', 13, 'Narcotics investigation initiated by Shakib Mahmud', 'OPEN', '2026-01-15 00:05:34'),
(41, 'NTB-00041', 51, 'Narcotics investigation initiated by Nafisa Islam', 'OPEN', '2026-01-15 00:05:34'),
(42, 'NTB-00042', 9, 'Narcotics investigation initiated by Fahim Sarker', 'OPEN', '2026-01-15 00:05:34'),
(43, 'NTB-00043', 17, 'Narcotics investigation initiated by Zubair Khan', 'OPEN', '2026-01-15 00:05:34'),
(44, 'NTB-00044', 55, 'Narcotics investigation initiated by Parvez Mahmud', 'OPEN', '2026-01-15 00:05:34'),
(45, 'NTB-00045', 13, 'Narcotics investigation initiated by Shakib Mahmud', 'OPEN', '2026-01-15 00:05:34'),
(46, 'NTB-00046', 21, 'Narcotics investigation initiated by Rashed Mahmud', 'OPEN', '2026-01-15 00:05:34'),
(47, 'NTB-00047', 59, 'Narcotics investigation initiated by Adnan Kabir', 'OPEN', '2026-01-15 00:05:34'),
(48, 'NTB-00048', 17, 'Narcotics investigation initiated by Zubair Khan', 'OPEN', '2026-01-15 00:05:34'),
(49, 'NTB-00049', 25, 'Narcotics investigation initiated by Kamrul Hasan', 'OPEN', '2026-01-15 00:05:34'),
(50, 'NTB-00050', 53, 'Narcotics investigation initiated by Zahid Hasan', 'OPEN', '2026-01-15 00:05:34'),
(51, 'NTB-00051', 21, 'Narcotics investigation initiated by Rashed Mahmud', 'OPEN', '2026-01-15 00:05:34'),
(52, 'NTB-00052', 29, 'Narcotics investigation initiated by Sajid Rahman', 'OPEN', '2026-01-15 00:05:34'),
(53, 'NTB-00053', 57, 'Narcotics investigation initiated by Tahsin Noor', 'OPEN', '2026-01-15 00:05:34'),
(54, 'NTB-00054', 25, 'Narcotics investigation initiated by Kamrul Hasan', 'OPEN', '2026-01-15 00:05:34'),
(55, 'NTB-00055', 3, 'Narcotics investigation initiated by Nafis Ahmed', 'OPEN', '2026-01-15 00:05:34'),
(56, 'NTB-00056', 61, 'Narcotics investigation initiated by Masud Rana', 'OPEN', '2026-01-15 00:05:34'),
(57, 'NTB-00057', 29, 'Narcotics investigation initiated by Sajid Rahman', 'OPEN', '2026-01-15 00:05:34'),
(58, 'NTB-00058', 7, 'Narcotics investigation initiated by Samiul Hasan', 'OPEN', '2026-01-15 00:05:34'),
(59, 'NTB-00059', 65, 'Narcotics investigation initiated by Fahim Ahmed', 'OPEN', '2026-01-15 00:05:34'),
(60, 'NTB-00060', 33, 'Narcotics investigation initiated by Anika Tasnim', 'OPEN', '2026-01-15 00:05:34'),
(61, 'NTB-00061', 11, 'Narcotics investigation initiated by Tahmid Kabir', 'OPEN', '2026-01-15 00:05:34'),
(62, 'NTB-00062', 64, 'Narcotics investigation initiated by Shahidul Islam', 'OPEN', '2026-01-15 00:05:34'),
(63, 'NTB-00063', 37, 'Narcotics investigation initiated by Mahfuz Alam', 'OPEN', '2026-01-15 00:05:34'),
(64, 'NTB-00064', 15, 'Narcotics investigation initiated by Adnan Rahim', 'OPEN', '2026-01-15 00:05:34'),
(65, 'NTB-00065', 63, 'Narcotics investigation initiated by Abdur Rahman', 'OPEN', '2026-01-15 00:05:34'),
(66, 'NTB-00066', 41, 'Narcotics investigation initiated by Faisal Ahmed', 'OPEN', '2026-01-15 00:05:34'),
(67, 'NTB-00067', 19, 'Narcotics investigation initiated by Arman Rashid', 'OPEN', '2026-01-15 00:05:34'),
(68, 'NTB-00068', 67, 'Narcotics investigation initiated by Asif Karim', 'OPEN', '2026-01-15 00:05:34'),
(69, 'NTB-00069', 45, 'Narcotics investigation initiated by Asif Mahmud', 'OPEN', '2026-01-15 00:05:34'),
(70, 'NTB-00070', 23, 'Narcotics investigation initiated by Shamim Reza', 'OPEN', '2026-01-15 00:05:34'),
(71, 'NTB-00071', 66, 'Narcotics investigation initiated by Raihan Chowdhury', 'OPEN', '2026-01-15 00:05:34'),
(72, 'NTB-00072', 49, 'Narcotics investigation initiated by Rasel Khan', 'OPEN', '2026-01-15 00:05:34'),
(73, 'NTB-00073', 27, 'Narcotics investigation initiated by Sabbir Ahmed', 'OPEN', '2026-01-15 00:05:34'),
(74, 'NTB-00074', 70, 'Narcotics investigation initiated by Tanvir Ahmed', 'OPEN', '2026-01-15 00:05:34'),
(75, 'NTB-00075', 33, 'Narcotics investigation initiated by Anika Tasnim', 'OPEN', '2026-01-15 00:05:34'),
(76, 'NTB-00076', 1, 'Narcotics investigation initiated by Ayaan Rahman', 'OPEN', '2026-01-15 00:05:34'),
(77, 'NTB-00077', 69, 'Narcotics investigation initiated by Nazmul Haque', 'OPEN', '2026-01-15 00:05:34'),
(78, 'NTB-00078', 37, 'Narcotics investigation initiated by Mahfuz Alam', 'OPEN', '2026-01-15 00:05:34'),
(79, 'NTB-00079', 5, 'Narcotics investigation initiated by Raiyan Hossain', 'OPEN', '2026-01-15 00:05:34'),
(80, 'NTB-00080', 41, 'Narcotics investigation initiated by Faisal Ahmed', 'OPEN', '2026-01-15 00:05:34'),
(81, 'NTB-00081', 9, 'Narcotics investigation initiated by Fahim Sarker', 'OPEN', '2026-01-15 00:05:34'),
(82, 'NTB-00082', 45, 'Narcotics investigation initiated by Asif Mahmud', 'OPEN', '2026-01-15 00:05:34'),
(83, 'NTB-00083', 13, 'Narcotics investigation initiated by Shakib Mahmud', 'OPEN', '2026-01-15 00:05:34'),
(84, 'NTB-00084', 52, 'Narcotics investigation initiated by Sharmin Akter', 'OPEN', '2026-01-15 00:05:34'),
(85, 'NTB-00085', 50, 'Narcotics investigation initiated by Moinul Islam', 'OPEN', '2026-01-15 00:05:34'),
(86, 'NTB-00086', 18, 'Narcotics investigation initiated by Sadia Sultana', 'OPEN', '2026-01-15 00:05:34'),
(87, 'NTB-00087', 56, 'Narcotics investigation initiated by Sohana Akter', 'OPEN', '2026-01-15 00:05:34'),
(88, 'NTB-00088', 34, 'Narcotics investigation initiated by Fahad Karim', 'OPEN', '2026-01-15 00:05:34'),
(89, 'NTB-00089', 22, 'Narcotics investigation initiated by Farhan Ali', 'OPEN', '2026-01-15 00:05:34'),
(90, 'NTB-00090', 60, 'Narcotics investigation initiated by Faria Sultana', 'OPEN', '2026-01-15 00:05:34'),
(91, 'NTB-00091', 38, 'Narcotics investigation initiated by Saiful Islam', 'OPEN', '2026-01-15 00:05:34'),
(92, 'NTB-00092', 26, 'Narcotics investigation initiated by Mehedi Rahman', 'OPEN', '2026-01-15 00:05:34'),
(93, 'NTB-00093', 4, 'Narcotics investigation initiated by Tasmia Noor', 'OPEN', '2026-01-15 00:05:34'),
(94, 'NTB-00094', 42, 'Narcotics investigation initiated by Jahid Hasan', 'OPEN', '2026-01-15 00:05:34'),
(95, 'NTB-00095', 30, 'Narcotics investigation initiated by Tanvir Islam', 'OPEN', '2026-01-15 00:05:34'),
(96, 'NTB-00096', 8, 'Narcotics investigation initiated by Nabila Akter', 'OPEN', '2026-01-15 00:05:34'),
(97, 'NTB-00097', 46, 'Narcotics investigation initiated by Sohan Mia', 'OPEN', '2026-01-15 00:05:34'),
(98, 'NTB-00098', 4, 'Narcotics investigation initiated by Tasmia Noor', 'OPEN', '2026-01-15 00:05:34'),
(99, 'NTB-00099', 12, 'Narcotics investigation initiated by Rumana Haque', 'OPEN', '2026-01-15 00:05:34'),
(100, 'NTB-00100', 50, 'Narcotics investigation initiated by Moinul Islam', 'OPEN', '2026-01-15 00:05:34');

--
-- Triggers `CASE_FILE`
--
DELIMITER $$
CREATE TRIGGER `trg_case_creator_check` BEFORE INSERT ON `CASE_FILE` FOR EACH ROW BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM USERS u
    JOIN ROLE_FORCE rf 
      ON u.RoleID = rf.RoleID AND u.ForceID = rf.ForceID
    JOIN ROLE_PERMISSIONS rp 
      ON rf.RoleForceID = rp.RoleForceID
    JOIN PERMISSIONS p 
      ON rp.PermissionID = p.PermissionID
    WHERE u.UserID = NEW.CreatedBy
      AND p.PermissionCode = 'CREATE_CASE'
  ) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'User is not authorized to create a case';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `CASE_LOCATION`
--

CREATE TABLE `CASE_LOCATION` (
  `LocationID` int(11) NOT NULL,
  `CaseID` int(11) NOT NULL,
  `DivisionID` int(11) NOT NULL,
  `DistrictID` int(11) NOT NULL,
  `ThanaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CASE_LOCATION`
--

INSERT INTO `CASE_LOCATION` (`LocationID`, `CaseID`, `DivisionID`, `DistrictID`, `ThanaID`) VALUES
(1, 45, 1, 1, 9),
(2, 94, 1, 1, 15),
(3, 63, 1, 5, 26),
(4, 85, 1, 1, 10),
(5, 30, 1, 3, 27),
(6, 84, 1, 1, 1),
(7, 37, 1, 1, 12),
(8, 19, 1, 1, 20),
(9, 97, 1, 1, 4),
(10, 42, 1, 1, 9),
(11, 94, 1, 2, 25),
(12, 65, 1, 1, 9),
(13, 39, 1, 3, 27),
(14, 9, 1, 2, 25),
(15, 31, 1, 1, 16),
(16, 58, 1, 1, 23),
(17, 53, 1, 1, 17),
(18, 58, 1, 1, 24),
(19, 35, 1, 1, 5),
(20, 42, 1, 1, 5),
(21, 8, 1, 1, 2),
(22, 61, 1, 1, 15),
(23, 22, 1, 1, 1),
(24, 38, 1, 1, 22),
(25, 30, 1, 1, 23),
(26, 85, 1, 2, 25),
(27, 36, 1, 5, 26),
(28, 12, 1, 1, 14),
(29, 23, 1, 1, 13),
(30, 55, 1, 1, 20),
(31, 63, 1, 1, 12),
(32, 58, 1, 2, 25),
(33, 97, 1, 1, 22),
(34, 14, 1, 1, 14),
(35, 80, 1, 1, 19),
(36, 73, 1, 1, 14),
(37, 42, 1, 1, 12),
(38, 47, 1, 1, 22),
(39, 68, 1, 1, 8),
(40, 79, 1, 1, 18),
(41, 8, 1, 5, 26),
(42, 63, 1, 1, 4),
(43, 9, 1, 3, 27),
(44, 27, 1, 1, 13),
(45, 62, 1, 2, 25),
(46, 100, 1, 1, 5),
(47, 29, 1, 3, 27),
(48, 10, 1, 1, 16),
(49, 66, 1, 1, 8),
(50, 6, 1, 1, 4),
(51, 7, 1, 1, 16),
(52, 1, 1, 2, 25),
(53, 35, 1, 3, 27),
(54, 93, 1, 1, 19),
(55, 63, 1, 1, 16),
(56, 66, 1, 1, 10),
(57, 44, 1, 5, 26),
(58, 36, 1, 3, 27),
(59, 22, 1, 1, 19),
(60, 85, 1, 1, 11),
(61, 7, 1, 1, 5),
(62, 78, 1, 1, 11),
(63, 37, 1, 1, 17),
(64, 43, 1, 1, 18),
(65, 31, 1, 1, 23),
(66, 28, 1, 1, 20),
(67, 97, 1, 1, 15),
(68, 49, 1, 5, 26),
(69, 84, 1, 1, 18),
(70, 79, 1, 1, 12),
(71, 96, 1, 1, 21),
(72, 46, 1, 1, 18),
(73, 57, 1, 1, 15),
(74, 7, 1, 1, 6),
(75, 66, 1, 1, 3),
(76, 70, 1, 1, 15),
(77, 62, 1, 1, 24),
(78, 10, 1, 1, 7),
(79, 3, 1, 1, 3),
(80, 55, 1, 1, 21),
(81, 1, 1, 1, 14),
(82, 23, 1, 1, 5),
(83, 2, 1, 1, 12),
(84, 35, 1, 1, 24),
(85, 46, 1, 1, 4),
(86, 98, 1, 1, 1),
(87, 96, 1, 1, 14),
(88, 98, 1, 1, 3),
(89, 62, 1, 1, 20),
(90, 100, 1, 1, 12),
(91, 45, 1, 1, 14),
(92, 83, 1, 1, 21),
(93, 21, 1, 1, 23),
(94, 83, 1, 3, 27),
(95, 81, 1, 1, 20),
(96, 51, 1, 5, 26),
(97, 4, 1, 1, 10),
(98, 58, 1, 3, 27),
(99, 62, 1, 1, 19),
(100, 26, 1, 3, 27);

-- --------------------------------------------------------

--
-- Table structure for table `CASE_SUSPECT`
--

CREATE TABLE `CASE_SUSPECT` (
  `CaseSuspectID` int(11) NOT NULL,
  `CaseID` int(11) NOT NULL,
  `SuspectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CASE_SUSPECT`
--

INSERT INTO `CASE_SUSPECT` (`CaseSuspectID`, `CaseID`, `SuspectID`) VALUES
(1, 31, 1),
(2, 31, 2),
(3, 36, 3),
(4, 36, 4),
(5, 76, 5),
(6, 76, 6),
(7, 10, 7),
(8, 10, 8),
(9, 15, 9),
(10, 15, 10),
(11, 55, 1),
(12, 55, 3),
(13, 93, 2),
(14, 93, 4),
(15, 98, 5),
(16, 34, 6),
(17, 39, 7),
(18, 79, 8),
(19, 13, 9),
(20, 18, 10),
(21, 58, 1),
(22, 96, 2),
(23, 37, 3),
(24, 42, 4),
(25, 81, 5),
(26, 16, 6),
(27, 21, 7),
(28, 61, 8),
(29, 99, 9),
(30, 40, 10);

-- --------------------------------------------------------

--
-- Table structure for table `CHAIN_OF_CUSTODY`
--

CREATE TABLE `CHAIN_OF_CUSTODY` (
  `TransferID` int(11) NOT NULL,
  `EvidenceID` int(11) NOT NULL,
  `FromUser` int(11) NOT NULL,
  `ToUser` int(11) NOT NULL,
  `TransferTime` datetime NOT NULL,
  `Location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CHAIN_OF_CUSTODY`
--

INSERT INTO `CHAIN_OF_CUSTODY` (`TransferID`, `EvidenceID`, `FromUser`, `ToUser`, `TransferTime`, `Location`) VALUES
(1, 1, 8, 111, '2026-01-15 20:06:24', 'DNC Laboratory'),
(2, 2, 9, 112, '2026-01-15 20:06:24', 'DNC Laboratory'),
(3, 3, 10, 113, '2026-01-15 20:06:24', 'DNC Laboratory'),
(4, 4, 11, 114, '2026-01-15 20:06:24', 'DNC Laboratory'),
(5, 5, 12, 115, '2026-01-15 20:06:24', 'DNC Laboratory');

-- --------------------------------------------------------

--
-- Table structure for table `COAST_GUARD_DETAILS`
--

CREATE TABLE `COAST_GUARD_DETAILS` (
  `CoastGuardID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BadgeNumber` varchar(50) NOT NULL,
  `PostingUnit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `COAST_GUARD_DETAILS`
--

INSERT INTO `COAST_GUARD_DETAILS` (`CoastGuardID`, `UserID`, `BadgeNumber`, `PostingUnit`) VALUES
(1, 60, 'CG-PO-101', 'Cox’s Bazar Station'),
(2, 61, 'CG-PO-102', 'Bhola Station'),
(3, 62, 'CG-OPS-201', 'Chattogram Flotilla'),
(4, 63, 'CG-OPS-202', 'Mongla Station'),
(5, 64, 'CG-CMD-301', 'Dhaka Headquarters'),
(6, 65, 'CG-CMD-302', 'Khulna Regional Command');

-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMS_DETAILS`
--

CREATE TABLE `CUSTOMS_DETAILS` (
  `CustomsID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BadgeNumber` varchar(50) NOT NULL,
  `PostingStation` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CUSTOMS_DETAILS`
--

INSERT INTO `CUSTOMS_DETAILS` (`CustomsID`, `UserID`, `BadgeNumber`, `PostingStation`) VALUES
(1, 70, 'CST-PO-101', 'Chattogram Port'),
(2, 71, 'CST-PO-102', 'Benapole Land Port'),
(3, 72, 'CST-SUP-201', 'Dhaka Customs House'),
(4, 73, 'CST-SUP-202', 'Mongla Port'),
(5, 74, 'CST-COM-301', 'NBR Headquarters'),
(6, 75, 'CST-COM-302', 'Chattogram Customs Zone');

-- --------------------------------------------------------

--
-- Table structure for table `DIGITAL_EVIDENCE`
--

CREATE TABLE `DIGITAL_EVIDENCE` (
  `DigitalEvidenceID` int(11) NOT NULL,
  `EvidenceID` int(11) NOT NULL,
  `FilePath` varchar(255) NOT NULL,
  `FileType` varchar(30) NOT NULL,
  `HashValue` varchar(255) NOT NULL,
  `UploadedBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DIGITAL_EVIDENCE`
--

INSERT INTO `DIGITAL_EVIDENCE` (`DigitalEvidenceID`, `EvidenceID`, `FilePath`, `FileType`, `HashValue`, `UploadedBy`) VALUES
(1, 1, '/evidence/1/photo1.jpg', 'image/jpeg', 'HASH001A', 11),
(2, 1, '/evidence/1/video1.mp4', 'video/mp4', 'HASH002B', 11),
(3, 2, '/evidence/2/photo1.jpg', 'image/jpeg', 'HASH003C', 14),
(4, 3, '/evidence/3/report.pdf', 'application/pdf', 'HASH004D', 48),
(5, 4, '/evidence/4/photo1.jpg', 'image/jpeg', 'HASH005E', 88),
(6, 5, '/evidence/5/video1.mp4', 'video/mp4', 'HASH006F', 48),
(7, 6, '/evidence/6/photo1.jpg', 'image/jpeg', 'HASH007G', 14),
(8, 7, '/evidence/7/report.pdf', 'application/pdf', 'HASH008H', 11),
(9, 8, '/evidence/8/photo1.jpg', 'image/jpeg', 'HASH009I', 88),
(10, 9, '/evidence/9/video1.mp4', 'video/mp4', 'HASH010J', 48),
(11, 10, '/evidence/10/photo1.jpg', 'image/jpeg', 'HASH011K', 11),
(12, 11, '/evidence/11/report.pdf', 'application/pdf', 'HASH012L', 14),
(13, 12, '/evidence/12/photo1.jpg', 'image/jpeg', 'HASH013M', 88),
(14, 13, '/evidence/13/video1.mp4', 'video/mp4', 'HASH014N', 48),
(15, 14, '/evidence/14/photo1.jpg', 'image/jpeg', 'HASH015O', 11),
(16, 15, '/evidence/15/report.pdf', 'application/pdf', 'HASH016P', 14),
(17, 16, '/evidence/16/photo1.jpg', 'image/jpeg', 'HASH017Q', 88),
(18, 16, '/evidence/16/video1.mp4', 'video/mp4', 'HASH018R', 88),
(19, 17, '/evidence/17/photo1.jpg', 'image/jpeg', 'HASH019S', 14),
(20, 18, '/evidence/18/report.pdf', 'application/pdf', 'HASH020T', 11),
(21, 19, '/evidence/19/photo1.jpg', 'image/jpeg', 'HASH021U', 48),
(22, 20, '/evidence/20/video1.mp4', 'video/mp4', 'HASH022V', 48),
(23, 21, '/evidence/21/photo1.jpg', 'image/jpeg', 'HASH023W', 88),
(24, 22, '/evidence/22/report.pdf', 'application/pdf', 'HASH024X', 14),
(25, 23, '/evidence/23/photo1.jpg', 'image/jpeg', 'HASH025Y', 11),
(26, 24, '/evidence/24/video1.mp4', 'video/mp4', 'HASH026Z', 88),
(27, 25, '/evidence/25/photo1.jpg', 'image/jpeg', 'HASH027AA', 48),
(28, 26, '/evidence/26/report.pdf', 'application/pdf', 'HASH028AB', 14),
(29, 27, '/evidence/27/photo1.jpg', 'image/jpeg', 'HASH029AC', 11),
(30, 28, '/evidence/28/video1.mp4', 'video/mp4', 'HASH030AD', 48),
(31, 29, '/evidence/29/photo1.jpg', 'image/jpeg', 'HASH031AE', 88),
(32, 30, '/evidence/30/report.pdf', 'application/pdf', 'HASH032AF', 14);

-- --------------------------------------------------------

--
-- Table structure for table `DISTRICT`
--

CREATE TABLE `DISTRICT` (
  `DistrictID` int(11) NOT NULL,
  `DivisionID` int(11) NOT NULL,
  `DistrictName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DISTRICT`
--

INSERT INTO `DISTRICT` (`DistrictID`, `DivisionID`, `DistrictName`) VALUES
(1, 1, 'Dhaka'),
(2, 1, 'Gazipur'),
(3, 1, 'Narayanganj'),
(4, 1, 'Narsingdi'),
(5, 1, 'Munshiganj'),
(6, 1, 'Manikganj'),
(7, 1, 'Tangail'),
(8, 1, 'Kishoreganj'),
(9, 1, 'Faridpur'),
(10, 1, 'Gopalganj'),
(11, 1, 'Madaripur'),
(12, 1, 'Rajbari'),
(13, 1, 'Shariatpur'),
(14, 2, 'Chattogram'),
(15, 2, 'Coxs Bazar'),
(16, 2, 'Cumilla'),
(17, 2, 'Feni'),
(18, 2, 'Noakhali'),
(19, 2, 'Lakshmipur'),
(20, 2, 'Brahmanbaria'),
(21, 2, 'Chandpur'),
(22, 2, 'Rangamati'),
(23, 2, 'Khagrachhari'),
(24, 2, 'Bandarban'),
(25, 3, 'Rajshahi'),
(26, 3, 'Bogura'),
(27, 3, 'Pabna'),
(28, 3, 'Sirajganj'),
(29, 3, 'Naogaon'),
(30, 3, 'Joypurhat'),
(31, 3, 'Chapainawabganj'),
(32, 3, 'Natore'),
(33, 4, 'Khulna'),
(34, 4, 'Jessore'),
(35, 4, 'Satkhira'),
(36, 4, 'Bagerhat'),
(37, 4, 'Narail'),
(38, 4, 'Jhenaidah'),
(39, 4, 'Magura'),
(40, 4, 'Chuadanga'),
(41, 4, 'Meherpur'),
(42, 4, 'Kushtia'),
(43, 5, 'Barishal'),
(44, 5, 'Bhola'),
(45, 5, 'Patuakhali'),
(46, 5, 'Pirojpur'),
(47, 5, 'Jhalokathi'),
(48, 5, 'Barguna'),
(49, 6, 'Sylhet'),
(50, 6, 'Moulvibazar'),
(51, 6, 'Habiganj'),
(52, 6, 'Sunamganj'),
(53, 7, 'Rangpur'),
(54, 7, 'Dinajpur'),
(55, 7, 'Kurigram'),
(56, 7, 'Gaibandha'),
(57, 7, 'Nilphamari'),
(58, 7, 'Lalmonirhat'),
(59, 7, 'Thakurgaon'),
(60, 7, 'Panchagarh'),
(61, 8, 'Mymensingh'),
(62, 8, 'Jamalpur'),
(63, 8, 'Netrokona'),
(64, 8, 'Sherpur');

-- --------------------------------------------------------

--
-- Table structure for table `DISTRICT_ADMIN`
--

CREATE TABLE `DISTRICT_ADMIN` (
  `DistrictAdminID` int(11) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `DistrictID` int(11) NOT NULL,
  `AuthorityOffice` varchar(100) NOT NULL,
  `CreatedBySuperAdmin` int(11) NOT NULL,
  `CreatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DISTRICT_ADMIN`
--

INSERT INTO `DISTRICT_ADMIN` (`DistrictAdminID`, `FullName`, `DistrictID`, `AuthorityOffice`, `CreatedBySuperAdmin`, `CreatedAt`) VALUES
(1, 'Sabrina Noor', 1, 'Dhaka District Office', 1, '2026-01-15 20:37:02'),
(2, 'Iftekhar Ahmed', 2, 'Dhaka North Admin', 2, '2026-01-15 20:37:02'),
(3, 'Nazia Chowdhury', 3, 'Dhaka South Admin', 3, '2026-01-15 20:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `DIVISION`
--

CREATE TABLE `DIVISION` (
  `DivisionID` int(11) NOT NULL,
  `DivisionName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DIVISION`
--

INSERT INTO `DIVISION` (`DivisionID`, `DivisionName`) VALUES
(5, 'Barishal'),
(2, 'Chattogram'),
(1, 'Dhaka'),
(4, 'Khulna'),
(8, 'Mymensingh'),
(3, 'Rajshahi'),
(7, 'Rangpur'),
(6, 'Sylhet');

-- --------------------------------------------------------

--
-- Table structure for table `DNC_DETAILS`
--

CREATE TABLE `DNC_DETAILS` (
  `DncID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Designation` varchar(50) NOT NULL,
  `BadgeNumber` varchar(50) NOT NULL,
  `PostingUnit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DNC_DETAILS`
--

INSERT INTO `DNC_DETAILS` (`DncID`, `UserID`, `Designation`, `BadgeNumber`, `PostingUnit`) VALUES
(1, 40, 'Inspector', 'DNC-INSP-001', 'Field Investigation Unit'),
(2, 41, 'Inspector', 'DNC-INSP-002', 'Field Investigation Unit'),
(3, 42, 'Inspector', 'DNC-INSP-003', 'Enforcement Wing'),
(4, 43, 'Inspector', 'DNC-INSP-004', 'Enforcement Wing'),
(5, 44, 'Assistant Director', 'DNC-AD-005', 'Head Office, Dhaka'),
(6, 45, 'Assistant Director', 'DNC-AD-006', 'Intelligence / Anti-Drug Unit'),
(7, 46, 'Assistant Director', 'DNC-AD-007', 'Field Investigation Unit'),
(8, 47, 'Deputy Director', 'DNC-DD-008', 'Dhaka Regional Office'),
(9, 48, 'Deputy Director', 'DNC-DD-009', 'Central Enforcement Command'),
(10, 49, 'Director', 'DNC-DIR-010', 'Head Office, Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `EVIDENCE`
--

CREATE TABLE `EVIDENCE` (
  `EvidenceID` int(11) NOT NULL,
  `CaseID` int(11) NOT NULL,
  `DrugType` varchar(50) NOT NULL,
  `Quantity` float NOT NULL,
  `Weight` float NOT NULL,
  `SealNumber` varchar(30) NOT NULL,
  `PackagingDetails` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `EVIDENCE`
--

INSERT INTO `EVIDENCE` (`EvidenceID`, `CaseID`, `DrugType`, `Quantity`, `Weight`, `SealNumber`, `PackagingDetails`) VALUES
(1, 1, 'Yaba', 500, 45.5, 'SEAL-YB-001', 'Plastic sachet'),
(2, 1, 'Heroin', 200, 120, 'SEAL-HR-002', 'Foil wrapped'),
(3, 2, 'Cannabis', 15, 15000, 'SEAL-CN-003', 'Gunny bag'),
(4, 2, 'Yaba', 300, 27.3, 'SEAL-YB-004', 'Plastic container'),
(5, 3, 'Ice', 50, 500, 'SEAL-IC-005', 'Vacuum sealed'),
(6, 3, 'Heroin', 100, 60, 'SEAL-HR-006', 'Foil packet'),
(7, 4, 'Cannabis', 25, 25000, 'SEAL-CN-007', 'Polythene wrap'),
(8, 5, 'Yaba', 800, 72, 'SEAL-YB-008', 'Plastic bag'),
(9, 6, 'Ice', 40, 410.5, 'SEAL-IC-009', 'Glass jar'),
(10, 7, 'Heroin', 90, 55.2, 'SEAL-HR-010', 'Foil wrap'),
(11, 8, 'Cannabis', 10, 10000, 'SEAL-CN-011', 'Jute sack'),
(12, 9, 'Yaba', 600, 54, 'SEAL-YB-012', 'Plastic pouch'),
(13, 10, 'Ice', 30, 305, 'SEAL-IC-013', 'Vacuum pack'),
(14, 11, 'Heroin', 120, 70.5, 'SEAL-HR-014', 'Foil'),
(15, 12, 'Cannabis', 18, 18000, 'SEAL-CN-015', 'Plastic wrap'),
(16, 13, 'Yaba', 350, 31.5, 'SEAL-YB-016', 'Plastic pouch'),
(17, 14, 'Ice', 60, 610, 'SEAL-IC-017', 'Vacuum sealed'),
(18, 15, 'Heroin', 75, 46, 'SEAL-HR-018', 'Foil wrap'),
(19, 16, 'Cannabis', 22, 22000, 'SEAL-CN-019', 'Jute bag'),
(20, 17, 'Yaba', 900, 81.2, 'SEAL-YB-020', 'Plastic container'),
(21, 18, 'Ice', 35, 355, 'SEAL-IC-021', 'Glass jar'),
(22, 19, 'Heroin', 140, 83.5, 'SEAL-HR-022', 'Foil packet'),
(23, 20, 'Cannabis', 30, 30000, 'SEAL-CN-023', 'Gunny sack'),
(24, 1, 'Yaba', 250, 23.4, 'SEAL-YB-024', 'Plastic wrap'),
(25, 2, 'Ice', 45, 460, 'SEAL-IC-025', 'Vacuum pack'),
(26, 3, 'Heroin', 60, 38, 'SEAL-HR-026', 'Foil'),
(27, 4, 'Cannabis', 12, 12000, 'SEAL-CN-027', 'Polythene'),
(28, 5, 'Yaba', 700, 63.5, 'SEAL-YB-028', 'Plastic pouch'),
(29, 6, 'Ice', 55, 560, 'SEAL-IC-029', 'Vacuum sealed'),
(30, 7, 'Heroin', 110, 66.8, 'SEAL-HR-030', 'Foil wrap');

-- --------------------------------------------------------

--
-- Table structure for table `FORCES`
--

CREATE TABLE `FORCES` (
  `ForceID` int(11) NOT NULL,
  `ForceName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `FORCES`
--

INSERT INTO `FORCES` (`ForceID`, `ForceName`) VALUES
(1, 'Bangladesh Police'),
(2, 'Rapid Action Battalion (RAB)'),
(3, 'Department of Narcotics Control (DNC)'),
(4, 'Border Guard Bangladesh (BGB)'),
(5, 'Bangladesh Coast Guard'),
(6, 'Customs Intelligence & Investigation'),
(7, 'Administrative Authority');

-- --------------------------------------------------------

--
-- Table structure for table `GANG`
--

CREATE TABLE `GANG` (
  `GangID` int(11) NOT NULL,
  `GangName` varchar(50) NOT NULL,
  `Area` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `GANG`
--

INSERT INTO `GANG` (`GangID`, `GangName`, `Area`) VALUES
(1, 'Mirpur Syndicate', 'Mirpur'),
(2, 'Uttara Cartel', 'Uttara'),
(3, 'Old Dhaka Network', 'Old Dhaka'),
(4, 'Jatrabari Crew', 'Jatrabari'),
(5, 'Dhanmondi Circle', 'Dhanmondi');

-- --------------------------------------------------------

--
-- Table structure for table `GANG_MEMBER`
--

CREATE TABLE `GANG_MEMBER` (
  `GangMemberID` int(11) NOT NULL,
  `GangID` int(11) NOT NULL,
  `SuspectID` int(11) NOT NULL,
  `RoleInGang` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `GANG_MEMBER`
--

INSERT INTO `GANG_MEMBER` (`GangMemberID`, `GangID`, `SuspectID`, `RoleInGang`) VALUES
(1, 1, 1, 'Leader'),
(2, 1, 2, 'Distributor'),
(3, 1, 3, 'Courier'),
(4, 2, 4, 'Leader'),
(5, 2, 5, 'Supplier'),
(6, 3, 6, 'Leader'),
(7, 3, 7, 'Distributor'),
(8, 3, 8, 'Courier'),
(9, 4, 9, 'Leader'),
(10, 4, 10, 'Retail Seller'),
(11, 5, 1, 'Associate'),
(12, 5, 4, 'Financier');

-- --------------------------------------------------------

--
-- Table structure for table `LAB_OFFICER_DETAILS`
--

CREATE TABLE `LAB_OFFICER_DETAILS` (
  `LabOfficerID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `LabName` varchar(100) NOT NULL,
  `PostingCityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `LAB_OFFICER_DETAILS`
--

INSERT INTO `LAB_OFFICER_DETAILS` (`LabOfficerID`, `UserID`, `LabName`, `PostingCityID`) VALUES
(1, 111, 'DNC Central Drug Testing Laboratory', 1),
(2, 112, 'DNC Central Drug Testing Laboratory', 1),
(3, 113, 'DNC Forensic Analysis Unit', 1),
(4, 114, 'DNC Narcotics Chemical Lab', 1),
(5, 115, 'DNC Evidence Examination Lab', 1),
(6, 123, 'DNC Drug Profiling Laboratory', 1),
(7, 124, 'DNC Forensic Analysis Unit', 1),
(8, 125, 'DNC Central Drug Testing Laboratory', 1);

-- --------------------------------------------------------

--
-- Table structure for table `LAB_REPORT`
--

CREATE TABLE `LAB_REPORT` (
  `LabReportID` int(11) NOT NULL,
  `EvidenceID` int(11) NOT NULL,
  `LabOfficerID` int(11) NOT NULL,
  `Result` text NOT NULL,
  `Purity` float DEFAULT NULL,
  `ReportTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `LAB_REPORT`
--

INSERT INTO `LAB_REPORT` (`LabReportID`, `EvidenceID`, `LabOfficerID`, `Result`, `Purity`, `ReportTime`) VALUES
(6, 1, 111, 'Chemical analysis completed. Narcotic substance confirmed.', 94.08, '2026-01-15 20:20:19'),
(7, 2, 112, 'Chemical analysis completed. Narcotic substance confirmed.', 77.27, '2026-01-15 20:20:19'),
(8, 3, 113, 'Chemical analysis completed. Narcotic substance confirmed.', 78.73, '2026-01-15 20:20:19'),
(9, 4, 114, 'Chemical analysis completed. Narcotic substance confirmed.', 71.33, '2026-01-15 20:20:19'),
(10, 5, 115, 'Chemical analysis completed. Narcotic substance confirmed.', 88.38, '2026-01-15 20:20:19'),
(11, 6, 111, 'Chemical analysis completed. Narcotic substance confirmed.', 70.49, '2026-01-15 20:20:19'),
(12, 7, 112, 'Chemical analysis completed. Narcotic substance confirmed.', 75.04, '2026-01-15 20:20:19'),
(13, 8, 113, 'Chemical analysis completed. Narcotic substance confirmed.', 71.39, '2026-01-15 20:20:19'),
(14, 9, 114, 'Chemical analysis completed. Narcotic substance confirmed.', 80.96, '2026-01-15 20:20:19'),
(15, 10, 115, 'Chemical analysis completed. Narcotic substance confirmed.', 85.82, '2026-01-15 20:20:19'),
(16, 11, 111, 'Chemical analysis completed. Narcotic substance confirmed.', 91.96, '2026-01-15 20:20:19'),
(17, 12, 112, 'Chemical analysis completed. Narcotic substance confirmed.', 96.13, '2026-01-15 20:20:19'),
(18, 13, 113, 'Chemical analysis completed. Narcotic substance confirmed.', 74.77, '2026-01-15 20:20:19'),
(19, 14, 114, 'Chemical analysis completed. Narcotic substance confirmed.', 75.48, '2026-01-15 20:20:19'),
(20, 15, 115, 'Chemical analysis completed. Narcotic substance confirmed.', 83.07, '2026-01-15 20:20:19'),
(21, 16, 111, 'Chemical analysis completed. Narcotic substance confirmed.', 88.93, '2026-01-15 20:20:19'),
(22, 17, 112, 'Chemical analysis completed. Narcotic substance confirmed.', 95.44, '2026-01-15 20:20:19'),
(23, 18, 113, 'Chemical analysis completed. Narcotic substance confirmed.', 80.38, '2026-01-15 20:20:19'),
(24, 19, 114, 'Chemical analysis completed. Narcotic substance confirmed.', 75.61, '2026-01-15 20:20:19'),
(25, 20, 115, 'Chemical analysis completed. Narcotic substance confirmed.', 96.92, '2026-01-15 20:20:19'),
(26, 21, 111, 'Chemical analysis completed. Narcotic substance confirmed.', 97.74, '2026-01-15 20:20:19'),
(27, 22, 112, 'Chemical analysis completed. Narcotic substance confirmed.', 97.97, '2026-01-15 20:20:19'),
(28, 23, 113, 'Chemical analysis completed. Narcotic substance confirmed.', 96.62, '2026-01-15 20:20:19'),
(29, 24, 114, 'Chemical analysis completed. Narcotic substance confirmed.', 94.11, '2026-01-15 20:20:19'),
(30, 25, 115, 'Chemical analysis completed. Narcotic substance confirmed.', 80.48, '2026-01-15 20:20:19'),
(31, 26, 111, 'Chemical analysis completed. Narcotic substance confirmed.', 77.3, '2026-01-15 20:20:19'),
(32, 27, 112, 'Chemical analysis completed. Narcotic substance confirmed.', 73.3, '2026-01-15 20:20:19'),
(33, 28, 113, 'Chemical analysis completed. Narcotic substance confirmed.', 97.02, '2026-01-15 20:20:19'),
(34, 29, 114, 'Chemical analysis completed. Narcotic substance confirmed.', 73.74, '2026-01-15 20:20:19'),
(35, 30, 115, 'Chemical analysis completed. Narcotic substance confirmed.', 77.88, '2026-01-15 20:20:19');

-- --------------------------------------------------------

--
-- Table structure for table `LEGAL_REPORT`
--

CREATE TABLE `LEGAL_REPORT` (
  `ReportID` int(11) NOT NULL,
  `CaseID` int(11) NOT NULL,
  `GeneratedBy` int(11) NOT NULL,
  `PDFPath` varchar(255) NOT NULL,
  `GeneratedTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `LEGAL_REPORT`
--

INSERT INTO `LEGAL_REPORT` (`ReportID`, `CaseID`, `GeneratedBy`, `PDFPath`, `GeneratedTime`) VALUES
(1, 31, 73, '/reports/case_31_final.pdf', '2026-01-15 20:28:21'),
(2, 36, 74, '/reports/case_36_final.pdf', '2026-01-15 20:28:21'),
(3, 76, 80, '/reports/case_76_final.pdf', '2026-01-15 20:28:21'),
(4, 10, 72, '/reports/case_10_final.pdf', '2026-01-15 20:28:21'),
(5, 15, 73, '/reports/case_15_final.pdf', '2026-01-15 20:28:21'),
(6, 55, 74, '/reports/case_55_final.pdf', '2026-01-15 20:28:21'),
(7, 93, 80, '/reports/case_93_final.pdf', '2026-01-15 20:28:21'),
(8, 98, 72, '/reports/case_98_final.pdf', '2026-01-15 20:28:21');

-- --------------------------------------------------------

--
-- Table structure for table `PERMISSIONS`
--

CREATE TABLE `PERMISSIONS` (
  `PermissionID` int(11) NOT NULL,
  `PermissionCode` varchar(50) NOT NULL,
  `Description` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PERMISSIONS`
--

INSERT INTO `PERMISSIONS` (`PermissionID`, `PermissionCode`, `Description`) VALUES
(1, 'CREATE_GD', 'Create General Diary entry'),
(2, 'CREATE_FIR', 'Create First Information Report'),
(3, 'SEIZE_EVIDENCE', 'Perform drug or evidence seizure during operation'),
(4, 'ADD_SUSPECT', 'Add suspect to a case'),
(5, 'ADD_WITNESS', 'Add witness to a case'),
(6, 'CHAIN_OF_CUSTODY', 'Handle transfer and custody of seized evidence'),
(7, 'VERIFY_EVIDENCE', 'Verify seized evidence authenticity'),
(8, 'SEND_LAB_REQUEST', 'Send evidence to laboratory for testing'),
(9, 'UPLOAD_LAB_REPORT', 'Upload forensic laboratory report'),
(10, 'APPROVE_CASE', 'Approve and authorize case files'),
(11, 'AUDIT_CASE', 'Audit case for legal and procedural compliance'),
(12, 'LINK_GANG', 'Link gangs and trafficking networks'),
(13, 'CREATE_CASE', 'Create case'),
(14, 'VIEW_ROUTE', 'View trafficking routes'),
(15, 'VIEW_CASE', 'Read-only access to view case data'),
(16, 'AUDIT_CHAIN_OF_CUSTODY', 'Audit and review evidence custody trail'),
(17, 'VERIFY_USER_ACCOUNT', 'Verify, approve, suspend, or deactivate user accounts');

-- --------------------------------------------------------

--
-- Table structure for table `POLICE_DETAILS`
--

CREATE TABLE `POLICE_DETAILS` (
  `PoliceID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BadgeNumber` varchar(50) NOT NULL,
  `PostingDivisionID` int(11) NOT NULL,
  `ThanaID` int(11) NOT NULL,
  `ZoneID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `POLICE_DETAILS`
--

INSERT INTO `POLICE_DETAILS` (`PoliceID`, `UserID`, `BadgeNumber`, `PostingDivisionID`, `ThanaID`, `ZoneID`) VALUES
(1, 1, 'BD-P-001', 1, 1, 1),
(2, 2, 'BD-P-002', 1, 2, 1),
(3, 3, 'BD-P-003', 1, 3, 1),
(4, 4, 'BD-P-004', 1, 4, 1),
(5, 5, 'BD-P-005', 1, 5, 1),
(6, 6, 'BD-P-006', 1, 6, 1),
(7, 7, 'BD-P-007', 1, 13, 2),
(8, 8, 'BD-P-008', 1, 14, 2),
(9, 9, 'BD-P-009', 1, 15, 2),
(10, 10, 'BD-P-010', 1, 16, 2),
(11, 11, 'BD-P-011', 1, 17, 2),
(12, 12, 'BD-P-012', 1, 18, 2),
(13, 13, 'BD-P-013', 1, 19, 2),
(14, 14, 'BD-P-014', 1, 20, 2),
(15, 15, 'BD-P-015', 1, 21, 2),
(16, 16, 'BD-P-016', 1, 22, 2),
(17, 17, 'BD-P-017', 1, 23, 2),
(18, 18, 'BD-P-018', 1, 24, 2),
(19, 19, 'BD-P-019', 1, 7, 1),
(20, 20, 'BD-P-020', 1, 8, 1),
(21, 21, 'BD-P-021', 1, 9, 1),
(22, 22, 'BD-P-022', 1, 10, 1),
(23, 23, 'BD-P-023', 1, 11, 1),
(24, 24, 'BD-P-024', 1, 12, 1),
(25, 25, 'BD-P-025', 1, 13, 2);

-- --------------------------------------------------------

--
-- Table structure for table `RAB_DETAILS`
--

CREATE TABLE `RAB_DETAILS` (
  `RabID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `RankName` varchar(50) NOT NULL,
  `RabBadgeNumber` varchar(50) NOT NULL,
  `Battalion` varchar(20) NOT NULL,
  `Wing` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `RAB_DETAILS`
--

INSERT INTO `RAB_DETAILS` (`RabID`, `UserID`, `RankName`, `RabBadgeNumber`, `Battalion`, `Wing`) VALUES
(1, 25, 'Director General (DG)', 'RAB-DG-001', 'RAB-1', 'Intelligence'),
(2, 26, 'Additional Director General (ADG)', 'RAB-ADG-002', 'RAB-1', 'Intelligence'),
(3, 27, 'Deputy Inspector General (DIG)', 'RAB-DIG-003', 'RAB-1', 'Operations'),
(4, 28, 'Superintendent of Police (SP)', 'RAB-SP-004', 'RAB-1', 'Operations'),
(5, 29, 'Additional SP / Deputy CO', 'RAB-ASP-005', 'RAB-1', 'Evidence'),
(6, 30, 'Assistant Superintendent of Police (ASP)', 'RAB-ASP-006', 'RAB-1', 'Evidence'),
(7, 31, 'Inspector', 'RAB-INSP-007', 'RAB-1', 'Commanding'),
(8, 32, 'Sub-Inspector (SI)', 'RAB-SI-008', 'RAB-1', 'Commanding'),
(9, 33, 'Assistant Sub-Inspector (ASI)', 'RAB-ASI-009', 'RAB-1', 'Intelligence'),
(10, 34, 'Inspector', 'RAB-INSP-010', 'RAB-1', 'Operations'),
(11, 35, 'Sub-Inspector (SI)', 'RAB-SI-011', 'RAB-1', 'Evidence'),
(12, 36, 'Assistant Sub-Inspector (ASI)', 'RAB-ASI-012', 'RAB-1', 'Commanding'),
(13, 37, 'Inspector', 'RAB-INSP-013', 'RAB-1', 'Intelligence'),
(14, 38, 'Sub-Inspector (SI)', 'RAB-SI-014', 'RAB-1', 'Operations'),
(15, 39, 'Assistant Sub-Inspector (ASI)', 'RAB-ASI-015', 'RAB-1', 'Evidence'),
(16, 40, 'Inspector', 'RAB-INSP-016', 'RAB-1', 'Commanding');

-- --------------------------------------------------------

--
-- Table structure for table `ROLES`
--

CREATE TABLE `ROLES` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ROLES`
--

INSERT INTO `ROLES` (`RoleID`, `RoleName`) VALUES
(1, 'Officer'),
(2, 'Analyst'),
(3, 'Lab Officer'),
(4, 'Auditor'),
(5, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `ROLE_FORCE`
--

CREATE TABLE `ROLE_FORCE` (
  `RoleForceID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `ForceID` int(11) NOT NULL,
  `RankName` varchar(50) NOT NULL,
  `CanCreateAccount` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ROLE_FORCE`
--

INSERT INTO `ROLE_FORCE` (`RoleForceID`, `RoleID`, `ForceID`, `RankName`, `CanCreateAccount`) VALUES
(1, 1, 1, 'ASI', 1),
(2, 1, 1, 'SI', 1),
(3, 1, 1, 'Inspector', 1),
(4, 1, 1, 'ASP', 1),
(5, 1, 1, 'SP', 1),
(6, 1, 1, 'DIG', 1),
(7, 1, 2, 'Intelligence Officer', 1),
(8, 1, 2, 'Operations Officer', 1),
(9, 1, 2, 'Evidence Officer', 1),
(10, 1, 2, 'Commanding Officer', 1),
(11, 1, 3, 'Inspector', 1),
(12, 1, 3, 'Assistant Director', 1),
(13, 1, 3, 'Deputy Director', 1),
(14, 1, 3, 'Director', 1),
(15, 1, 4, 'Field Intelligence Officer', 1),
(16, 1, 4, 'Operations Officer', 1),
(17, 1, 4, 'Battalion Commander', 1),
(18, 1, 5, 'Patrol Officer', 1),
(19, 1, 5, 'Operations Officer', 1),
(20, 1, 5, 'Command Officer', 1),
(21, 1, 6, 'Preventive Officer', 1),
(22, 1, 6, 'Superintendent', 1),
(23, 1, 6, 'Commissioner', 1),
(24, 2, 1, 'Police Intelligence Analyst', 1),
(25, 2, 3, 'DNC Intelligence Analyst', 1),
(26, 2, 7, 'Government Intelligence Analyst', 1),
(27, 3, 3, 'DNC Laboratory Officer', 1),
(28, 4, 1, 'Police Compliance Auditor', 1),
(29, 4, 3, 'DNC Compliance Auditor', 1),
(30, 4, 7, 'Government Compliance Auditor', 1),
(31, 5, 7, 'Unit Administrator', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ROLE_PERMISSIONS`
--

CREATE TABLE `ROLE_PERMISSIONS` (
  `RolePermissionID` int(11) NOT NULL,
  `RoleForceID` int(11) NOT NULL,
  `PermissionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ROLE_PERMISSIONS`
--

INSERT INTO `ROLE_PERMISSIONS` (`RolePermissionID`, `RoleForceID`, `PermissionID`) VALUES
(4, 1, 1),
(3, 1, 2),
(5, 1, 3),
(1, 1, 4),
(2, 1, 5),
(93, 1, 13),
(8, 2, 4),
(9, 2, 5),
(10, 2, 6),
(12, 2, 7),
(11, 2, 8),
(94, 2, 13),
(16, 3, 7),
(15, 3, 10),
(95, 3, 13),
(18, 4, 10),
(96, 4, 13),
(19, 5, 11),
(97, 5, 13),
(20, 6, 12),
(98, 6, 13),
(51, 7, 3),
(49, 7, 4),
(50, 7, 12),
(99, 7, 13),
(53, 8, 3),
(52, 8, 6),
(100, 8, 13),
(55, 9, 6),
(56, 9, 7),
(101, 9, 13),
(58, 10, 10),
(102, 10, 13),
(24, 11, 3),
(21, 11, 4),
(22, 11, 5),
(25, 11, 8),
(23, 11, 13),
(29, 12, 6),
(30, 12, 7),
(28, 12, 10),
(103, 12, 13),
(31, 12, 14),
(35, 13, 10),
(36, 13, 11),
(37, 13, 12),
(104, 13, 13),
(38, 13, 14),
(42, 14, 10),
(43, 14, 11),
(44, 14, 12),
(105, 14, 13),
(45, 14, 14),
(59, 15, 3),
(106, 15, 13),
(67, 15, 25),
(60, 16, 7),
(107, 16, 13),
(68, 16, 25),
(108, 17, 13),
(66, 17, 25),
(61, 18, 3),
(109, 18, 13),
(71, 18, 25),
(62, 19, 7),
(110, 19, 13),
(70, 19, 25),
(111, 20, 13),
(69, 20, 25),
(63, 21, 3),
(112, 21, 13),
(64, 22, 10),
(113, 22, 13),
(65, 23, 11),
(114, 23, 13),
(78, 24, 12),
(81, 24, 14),
(79, 25, 12),
(82, 25, 14),
(80, 26, 12),
(83, 26, 14),
(76, 27, 7),
(75, 27, 9),
(85, 28, 11),
(88, 28, 16),
(72, 28, 25),
(86, 29, 11),
(89, 29, 16),
(73, 29, 25),
(87, 30, 11),
(90, 30, 16),
(74, 30, 25),
(92, 31, 17);

-- --------------------------------------------------------

--
-- Table structure for table `SEIZURE`
--

CREATE TABLE `SEIZURE` (
  `SeizureID` int(11) NOT NULL,
  `CaseID` int(11) NOT NULL,
  `SeizedByUserID` int(11) NOT NULL,
  `SeizedTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SEIZURE`
--

INSERT INTO `SEIZURE` (`SeizureID`, `CaseID`, `SeizedByUserID`, `SeizedTime`) VALUES
(1, 25, 29, '2025-11-17 00:18:02'),
(2, 64, 13, '2025-12-18 00:18:02'),
(3, 100, 31, '2025-11-03 00:18:02'),
(4, 3, 39, '2025-11-03 00:18:02'),
(5, 76, 7, '2025-12-16 00:18:02'),
(6, 15, 48, '2025-12-20 00:18:02'),
(7, 14, 54, '2025-12-23 00:18:02'),
(8, 90, 23, '2025-12-04 00:18:02'),
(9, 8, 30, '2025-12-23 00:18:02'),
(10, 58, 65, '2025-12-25 00:18:02'),
(11, 18, 1, '2025-11-17 00:18:02'),
(12, 36, 49, '2025-11-22 00:18:02'),
(13, 1, 17, '2025-12-31 00:18:02'),
(14, 82, 21, '2025-11-17 00:18:02'),
(15, 48, 62, '2025-12-16 00:18:02'),
(16, 16, 54, '2025-12-09 00:18:02'),
(17, 87, 46, '2025-11-30 00:18:02'),
(18, 48, 34, '2025-12-15 00:18:02'),
(19, 55, 27, '2025-12-30 00:18:02'),
(20, 43, 65, '2025-11-11 00:18:02'),
(21, 67, 57, '2025-12-17 00:18:02'),
(22, 95, 40, '2026-01-06 00:18:02'),
(23, 69, 47, '2025-12-17 00:18:02'),
(24, 6, 54, '2025-12-30 00:18:02'),
(25, 83, 34, '2025-10-22 00:18:02'),
(26, 63, 41, '2025-10-30 00:18:02'),
(27, 53, 57, '2026-01-09 00:18:02'),
(28, 48, 9, '2025-12-25 00:18:02'),
(29, 80, 38, '2025-11-16 00:18:02'),
(30, 54, 67, '2025-11-14 00:18:02'),
(31, 40, 64, '2025-11-06 00:18:02'),
(32, 28, 42, '2025-12-19 00:18:02'),
(33, 84, 3, '2025-12-04 00:18:02'),
(34, 59, 67, '2025-12-23 00:18:02'),
(35, 63, 61, '2025-11-07 00:18:02'),
(36, 17, 15, '2025-11-14 00:18:02'),
(37, 86, 50, '2025-12-07 00:18:02'),
(38, 22, 70, '2025-12-24 00:18:02'),
(39, 100, 65, '2026-01-14 00:18:02'),
(40, 23, 32, '2025-12-30 00:18:02'),
(41, 93, 3, '2025-10-22 00:18:02'),
(42, 2, 52, '2026-01-01 00:18:02'),
(43, 41, 64, '2025-10-19 00:18:02'),
(44, 39, 67, '2025-12-01 00:18:02'),
(45, 64, 50, '2025-10-24 00:18:02'),
(46, 43, 16, '2025-11-17 00:18:02'),
(47, 86, 24, '2025-12-20 00:18:02'),
(48, 1, 22, '2025-11-03 00:18:02'),
(49, 60, 52, '2026-01-07 00:18:02'),
(50, 38, 44, '2025-11-24 00:18:02'),
(51, 16, 43, '2025-12-28 00:18:02'),
(52, 56, 29, '2025-12-27 00:18:02'),
(53, 89, 51, '2026-01-02 00:18:02'),
(54, 54, 31, '2025-11-13 00:18:02'),
(55, 36, 63, '2025-11-15 00:18:02'),
(56, 78, 36, '2025-11-04 00:18:02'),
(57, 12, 53, '2026-01-13 00:18:02'),
(58, 69, 37, '2025-11-23 00:18:02'),
(59, 97, 46, '2025-12-01 00:18:02'),
(60, 59, 26, '2025-11-24 00:18:02'),
(61, 53, 34, '2025-12-29 00:18:02'),
(62, 17, 41, '2025-12-22 00:18:02'),
(63, 29, 12, '2025-10-26 00:18:02'),
(64, 70, 1, '2025-12-08 00:18:02'),
(65, 94, 6, '2026-01-11 00:18:02'),
(66, 26, 49, '2025-12-03 00:18:02'),
(67, 16, 69, '2025-10-26 00:18:02'),
(68, 52, 6, '2025-11-28 00:18:02'),
(69, 91, 31, '2025-12-30 00:18:02'),
(70, 48, 47, '2025-11-01 00:18:02'),
(71, 40, 28, '2025-12-02 00:18:02'),
(72, 46, 17, '2026-01-07 00:18:02'),
(73, 68, 32, '2026-01-03 00:18:02'),
(74, 10, 61, '2025-12-01 00:18:02'),
(75, 28, 54, '2025-12-26 00:18:02'),
(76, 53, 63, '2025-12-20 00:18:02'),
(77, 60, 48, '2025-12-24 00:18:02'),
(78, 16, 36, '2026-01-14 00:18:02'),
(79, 97, 40, '2025-11-06 00:18:02'),
(80, 31, 37, '2025-11-07 00:18:02'),
(81, 55, 24, '2025-12-10 00:18:02'),
(82, 93, 13, '2025-10-21 00:18:02'),
(83, 12, 55, '2025-11-18 00:18:02'),
(84, 48, 56, '2026-01-03 00:18:02'),
(85, 77, 40, '2025-11-16 00:18:02'),
(86, 3, 52, '2025-12-23 00:18:02'),
(87, 56, 16, '2025-11-28 00:18:02'),
(88, 1, 5, '2025-12-26 00:18:02'),
(89, 37, 22, '2025-12-09 00:18:02'),
(90, 83, 57, '2025-12-17 00:18:02'),
(91, 9, 2, '2025-11-22 00:18:02'),
(92, 19, 1, '2025-12-25 00:18:02'),
(93, 22, 68, '2025-11-16 00:18:02'),
(94, 80, 16, '2025-10-25 00:18:02'),
(95, 27, 16, '2025-11-11 00:18:02'),
(96, 2, 38, '2025-12-02 00:18:02'),
(97, 85, 70, '2025-12-22 00:18:02'),
(98, 50, 14, '2025-12-07 00:18:02'),
(99, 52, 43, '2025-12-23 00:18:02'),
(100, 66, 54, '2025-12-30 00:18:02');

-- --------------------------------------------------------

--
-- Table structure for table `SUPER_ADMIN`
--

CREATE TABLE `SUPER_ADMIN` (
  `SuperAdminID` int(11) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `AuthorityName` varchar(100) NOT NULL,
  `CreatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SUPER_ADMIN`
--

INSERT INTO `SUPER_ADMIN` (`SuperAdminID`, `FullName`, `AuthorityName`, `CreatedAt`) VALUES
(1, 'Md. Aminul Islam', 'Home Ministry HQ', '2026-01-01 09:00:00'),
(2, 'Selina Akter', 'Police HQ', '2026-01-01 09:00:00'),
(3, 'Rashed Khan', 'DNC HQ', '2026-01-01 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `SUSPECT`
--

CREATE TABLE `SUSPECT` (
  `SuspectID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` varchar(20) NOT NULL,
  `NID` varchar(30) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SUSPECT`
--

INSERT INTO `SUSPECT` (`SuspectID`, `Name`, `Age`, `Gender`, `NID`, `Address`) VALUES
(1, 'Md. Rahim Uddin', 28, 'Male', '1996123456789', 'Mirpur, Dhaka'),
(2, 'Ayesha Akter', 24, 'Female', '2000123456790', 'Uttara, Dhaka'),
(3, 'Tanvir Hasan', 31, 'Male', '1993123456791', 'Dhanmondi, Dhaka'),
(4, 'Sadia Islam', 27, 'Female', '1997123456792', 'Mohammadpur, Dhaka'),
(5, 'Imran Hossain', 35, 'Male', '1989123456793', 'Gazipur'),
(6, 'Nusrat Jahan', 22, 'Female', '2002123456794', 'Narayanganj'),
(7, 'Rashed Mahmud', 40, 'Male', '1984123456795', 'Keraniganj, Dhaka'),
(8, 'Farzana Yasmin', 29, 'Female', '1995123456796', 'Badda, Dhaka'),
(9, 'Shakil Ahmed', 33, 'Male', '1990123456797', 'Savar, Dhaka'),
(10, 'Mehedi Hasan', 26, 'Male', '1998123456798', 'Jatrabari, Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `THANA`
--

CREATE TABLE `THANA` (
  `ThanaID` int(11) NOT NULL,
  `DistrictID` int(11) NOT NULL,
  `ZoneID` int(11) NOT NULL,
  `ThanaName` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `THANA`
--

INSERT INTO `THANA` (`ThanaID`, `DistrictID`, `ZoneID`, `ThanaName`) VALUES
(1, 1, 1, 'Uttara West'),
(2, 1, 1, 'Uttara East'),
(3, 1, 1, 'Airport (Bimanbandar)'),
(4, 1, 1, 'Khilkhet'),
(5, 1, 1, 'Gulshan'),
(6, 1, 1, 'Banani'),
(7, 1, 1, 'Badda'),
(8, 1, 1, 'Tejgaon'),
(9, 1, 1, 'Tejgaon Industrial Area'),
(10, 1, 1, 'Mirpur'),
(11, 1, 1, 'Pallabi'),
(12, 1, 1, 'Mohammadpur'),
(13, 1, 2, 'Motijheel'),
(14, 1, 2, 'Paltan'),
(15, 1, 2, 'Shahbag'),
(16, 1, 2, 'Ramna'),
(17, 1, 2, 'Dhanmondi'),
(18, 1, 2, 'New Market'),
(19, 1, 2, 'Lalbagh'),
(20, 1, 2, 'Kotwali'),
(21, 1, 2, 'Sutrapur'),
(22, 1, 2, 'Jatrabari'),
(23, 1, 2, 'Demra'),
(24, 1, 2, 'Sabujbagh'),
(25, 2, 3, 'Savar'),
(26, 5, 3, 'Keraniganj'),
(27, 3, 3, 'Narayanganj');

-- --------------------------------------------------------

--
-- Table structure for table `TRAFFICKING_ROUTE`
--

CREATE TABLE `TRAFFICKING_ROUTE` (
  `RouteID` int(11) NOT NULL,
  `CaseID` int(11) NOT NULL,
  `FromDistrictID` int(11) NOT NULL,
  `ToDistrictID` int(11) NOT NULL,
  `FrequencyScore` int(11) DEFAULT NULL,
  `PatternType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `TRAFFICKING_ROUTE`
--

INSERT INTO `TRAFFICKING_ROUTE` (`RouteID`, `CaseID`, `FromDistrictID`, `ToDistrictID`, `FrequencyScore`, `PatternType`) VALUES
(1, 31, 1, 2, 8, 'Street Distribution'),
(2, 36, 3, 1, 6, 'Night Transport'),
(3, 76, 5, 4, 7, 'Courier Based'),
(4, 10, 2, 5, 9, 'Retail Supply'),
(5, 15, 4, 3, 5, 'Inter-Thana Transfer'),
(6, 55, 1, 3, 8, 'Repeat Route'),
(7, 93, 2, 4, 6, 'Local Network'),
(8, 98, 5, 1, 7, 'Warehouse to Street'),
(9, 34, 3, 2, 4, 'Occasional Movement'),
(10, 39, 4, 5, 9, 'High Frequency');

-- --------------------------------------------------------

--
-- Table structure for table `UNIT_ADMIN`
--

CREATE TABLE `UNIT_ADMIN` (
  `UnitAdminID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ForceID` int(11) NOT NULL,
  `UnitType` varchar(30) NOT NULL,
  `UnitID` int(11) NOT NULL,
  `CreatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `UNIT_ADMIN`
--

INSERT INTO `UNIT_ADMIN` (`UnitAdminID`, `UserID`, `ForceID`, `UnitType`, `UnitID`, `CreatedAt`) VALUES
(1, 73, 1, 'Police Station', 101, '2026-01-15 20:36:04'),
(2, 74, 1, 'Police Station', 102, '2026-01-15 20:36:04'),
(3, 80, 1, 'Police Station', 103, '2026-01-15 20:36:04'),
(4, 82, 2, 'DNC Zone', 201, '2026-01-15 20:36:04'),
(5, 86, 2, 'DNC Zone', 202, '2026-01-15 20:36:04');

-- --------------------------------------------------------

--
-- Table structure for table `USERS`
--

CREATE TABLE `USERS` (
  `UserID` int(11) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `ForceID` int(11) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `CreatedAt` datetime NOT NULL,
  `AssignedRoleForceID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `USERS`
--

INSERT INTO `USERS` (`UserID`, `FullName`, `Phone`, `Email`, `RoleID`, `ForceID`, `Status`, `CreatedAt`, `AssignedRoleForceID`) VALUES
(1, 'Ayaan Rahman', '01760000001', 'ayaan.rahman@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 1),
(2, 'Zarin Islam', '01760000002', 'zarin.islam@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 1),
(3, 'Nafis Ahmed', '01760000003', 'nafis.ahmed@gov.bd', 1, 1, 'pending', '2026-01-11 22:18:38', 1),
(4, 'Tasmia Noor', '01760000004', 'tasmia.noor@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 1),
(5, 'Raiyan Hossain', '01760000005', 'raiyan.hossain@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 1),
(6, 'Mahin Chowdhury', '01760000006', 'mahin.chowdhury@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 1),
(7, 'Samiul Hasan', '01760000007', 'samiul.hasan@gov.bd', 1, 1, 'pending', '2026-01-11 22:18:38', 1),
(8, 'Nabila Akter', '01760000008', 'nabila.akter@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 2),
(9, 'Fahim Sarker', '01760000009', 'fahim.sarker@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 2),
(10, 'Ishrat Jahan', '01760000010', 'ishrat.jahan@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 2),
(11, 'Tahmid Kabir', '01760000011', 'tahmid.kabir@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 2),
(12, 'Rumana Haque', '01760000012', 'rumana.haque@gov.bd', 1, 1, 'pending', '2026-01-11 22:18:38', 2),
(13, 'Shakib Mahmud', '01760000013', 'shakib.mahmud@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 2),
(14, 'Nusrat Farin', '01760000014', 'nusrat.farin@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 2),
(15, 'Adnan Rahim', '01760000015', 'adnan.rahim@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 3),
(16, 'Fariha Alam', '01760000016', 'fariha.alam@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 3),
(17, 'Zubair Khan', '01760000017', 'zubair.khan@gov.bd', 1, 1, 'pending', '2026-01-11 22:18:38', 3),
(18, 'Sadia Sultana', '01760000018', 'sadia.sultana@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 3),
(19, 'Arman Rashid', '01760000019', 'arman.rashid@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 3),
(20, 'Maliha Nawar', '01760000020', 'maliha.nawar@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 3),
(21, 'Rashed Mahmud', '01760000021', 'rashed.mahmud@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 4),
(22, 'Farhan Ali', '01760000022', 'farhan.ali@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 4),
(23, 'Shamim Reza', '01760000023', 'shamim.reza@gov.bd', 1, 1, 'pending', '2026-01-11 22:18:38', 4),
(24, 'Imran Siddique', '01760000024', 'imran.siddique@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 4),
(25, 'Kamrul Hasan', '01760000025', 'kamrul.hasan@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 5),
(26, 'Mehedi Rahman', '01760000026', 'mehedi.rahman@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 5),
(27, 'Sabbir Ahmed', '01760000027', 'sabbir.ahmed@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 5),
(28, 'Arif Hossain', '01760000028', 'arif.hossain@gov.bd', 1, 1, 'pending', '2026-01-11 22:18:38', 6),
(29, 'Sajid Rahman', '01760000029', 'sajid.rahman@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 6),
(30, 'Tanvir Islam', '01760000030', 'tanvir.islam@gov.bd', 1, 1, 'approved', '2026-01-11 22:18:38', 6),
(31, 'Mahira Khan', '01760000031', 'mahira.khan@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(32, 'Samin Chowdhury', '01760000032', 'samin.chowdhury@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(33, 'Anika Tasnim', '01760000033', 'anika.tasnim@gov.bd', 1, 2, 'pending', '2026-01-11 22:18:38', 8),
(34, 'Fahad Karim', '01760000034', 'fahad.karim@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(35, 'Hasib Anwar', '01760000035', 'hasib.anwar@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(36, 'Riyad Kabir', '01760000036', 'riyad.kabir@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(37, 'Mahfuz Alam', '01760000037', 'mahfuz.alam@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(38, 'Saiful Islam', '01760000038', 'saiful.islam@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(39, 'Tanvir Hossain', '01760000039', 'tanvir.hossain@gov.bd', 1, 2, 'pending', '2026-01-11 22:18:38', 8),
(40, 'Shafiqur Rahman', '01760000040', 'shafiqur.rahman@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(41, 'Faisal Ahmed', '01760000041', 'faisal.ahmed@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(42, 'Jahid Hasan', '01760000042', 'jahid.hasan@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(43, 'Nayeem Islam', '01760000043', 'nayeem.islam@gov.bd', 1, 2, 'pending', '2026-01-11 22:18:38', 8),
(44, 'Rafiul Karim', '01760000044', 'rafiul.karim@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(45, 'Asif Mahmud', '01760000045', 'asif.mahmud@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(46, 'Sohan Mia', '01760000046', 'sohan.mia@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(47, 'Nadim Uddin', '01760000047', 'nadim.uddin@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(48, 'Imtiaz Hossain', '01760000048', 'imtiaz.hossain@gov.bd', 1, 2, 'pending', '2026-01-11 22:18:38', 8),
(49, 'Rasel Khan', '01760000049', 'rasel.khan@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(50, 'Moinul Islam', '01760000050', 'moinul.islam@gov.bd', 1, 2, 'approved', '2026-01-11 22:18:38', 8),
(51, 'Nafisa Islam', '01760000051', 'nafisa.islam@gov.bd', 1, 3, 'approved', '2026-01-11 22:18:38', 11),
(52, 'Sharmin Akter', '01760000052', 'sharmin.akter@gov.bd', 1, 3, 'approved', '2026-01-11 22:18:38', 11),
(53, 'Zahid Hasan', '01760000053', 'zahid.hasan@gov.bd', 1, 3, 'approved', '2026-01-11 22:18:38', 11),
(54, 'Rakibul Islam', '01760000054', 'rakibul.islam@gov.bd', 1, 3, 'approved', '2026-01-11 22:18:38', 11),
(55, 'Parvez Mahmud', '01760000055', 'parvez.mahmud@gov.bd', 1, 3, 'pending', '2026-01-11 22:18:38', 11),
(56, 'Sohana Akter', '01760000056', 'sohana.akter@gov.bd', 1, 3, 'approved', '2026-01-11 22:18:38', 12),
(57, 'Tahsin Noor', '01760000057', 'tahsin.noor@gov.bd', 1, 3, 'approved', '2026-01-11 22:18:38', 12),
(58, 'Mahira Tasnim', '01760000058', 'mahira.tasnim@gov.bd', 1, 3, 'approved', '2026-01-11 22:18:38', 12),
(59, 'Adnan Kabir', '01760000059', 'adnan.kabir@gov.bd', 1, 3, 'pending', '2026-01-11 22:18:38', 13),
(60, 'Faria Sultana', '01760000060', 'faria.sultana@gov.bd', 1, 3, 'approved', '2026-01-11 22:18:38', 13),
(61, 'Masud Rana', '01760000061', 'masud.rana@gov.bd', 1, 4, 'approved', '2026-01-11 22:18:38', 14),
(62, 'Anik Hossain', '01760000062', 'anik.hossain@gov.bd', 1, 4, 'pending', '2026-01-11 22:18:38', 14),
(63, 'Abdur Rahman', '01760000063', 'abdur.rahman@gov.bd', 1, 4, 'approved', '2026-01-11 22:18:38', 15),
(64, 'Shahidul Islam', '01760000064', 'shahidul.islam@gov.bd', 1, 4, 'approved', '2026-01-11 22:18:38', 15),
(65, 'Fahim Ahmed', '01760000065', 'fahim.ahmed@gov.bd', 1, 4, 'pending', '2026-01-11 22:18:38', 15),
(66, 'Raihan Chowdhury', '01760000066', 'raihan.chowdhury@gov.bd', 1, 5, 'approved', '2026-01-11 22:18:38', 18),
(67, 'Asif Karim', '01760000067', 'asif.karim@gov.bd', 1, 5, 'approved', '2026-01-11 22:18:38', 18),
(68, 'Sakib Islam', '01760000068', 'sakib.islam@gov.bd', 1, 5, 'approved', '2026-01-11 22:18:38', 18),
(69, 'Nazmul Haque', '01760000069', 'nazmul.haque@gov.bd', 1, 5, 'approved', '2026-01-11 22:18:38', 18),
(70, 'Tanvir Ahmed', '01760000070', 'tanvir.ahmed@gov.bd', 1, 5, 'pending', '2026-01-11 22:18:38', 18),
(71, 'Mehedi Hasan', '01760000071', 'mehedi.hasan@gov.bd', 2, 7, 'approved', '2026-01-11 22:18:38', 26),
(72, 'Sabrina Noor', '01760000072', 'sabrina.noor@gov.bd', 2, 3, 'approved', '2026-01-11 22:18:38', 25),
(73, 'Ayesha Rahman', '01760000073', 'ayesha.rahman@gov.bd', 2, 1, 'approved', '2026-01-11 22:18:38', 24),
(74, 'Iftekhar Ahmed', '01760000074', 'iftekhar.ahmed@gov.bd', 2, 1, 'approved', '2026-01-11 22:18:38', 24),
(75, 'Nabila Khan', '01760000075', 'nabila.khan@gov.bd', 2, 7, 'approved', '2026-01-11 22:18:38', 26),
(76, 'Rumana Haque', '01760000076', 'rumana.haque2@gov.bd', 3, 3, 'approved', '2026-01-11 22:18:38', 27),
(77, 'Farhan Iqbal', '01760000077', 'farhan.iqbal@gov.bd', 3, 3, 'approved', '2026-01-11 22:18:38', 27),
(78, 'Tanjila Rumi', '01760000078', 'tanjila.rumi@gov.bd', 3, 3, 'pending', '2026-01-11 22:18:38', 27),
(79, 'Sabbir Uddin', '01760000079', 'sabbir.uddin@gov.bd', 4, 7, 'approved', '2026-01-11 22:18:38', 30),
(80, 'Nazia Chowdhury', '01760000080', 'nazia.chowdhury@gov.bd', 2, 1, 'approved', '2026-01-11 22:18:38', 24),
(81, 'Kamal Uddin', '01760000081', 'kamal.uddin@gov.bd', 2, 3, 'approved', '2026-01-11 22:18:38', 25),
(82, 'Farzana Islam', '01760000082', 'farzana.islam@gov.bd', 2, 1, 'approved', '2026-01-11 22:18:38', 24),
(83, 'Mahid Bin Mahmud', '01760000083', 'mahid.bin@gmail.com', 2, 3, 'approved', '2026-01-11 22:18:38', 25),
(84, 'Jahid Bin Mahmud', '01760000084', 'Jahid.bin@gmail.com', 5, 7, 'approved', '2026-01-11 22:18:38', 31),
(85, 'Jakir Bin Mahmud', '01760000085', 'Jakir.bin@gmail.com', 5, 7, 'approved', '2026-01-11 22:18:38', 31),
(86, 'Nazia Rahman', '01710000086', 'nrahman@police.gov.bd', 2, 1, 'ACTIVE', '2026-01-14 15:23:24', 24),
(87, 'Imran Hossain', '01710000087', 'ihossain@police.gov.bd', 2, 1, 'ACTIVE', '2026-01-14 15:23:24', 24),
(88, 'Farzana Akter', '01710000088', 'fakter@police.gov.bd', 2, 1, 'ACTIVE', '2026-01-14 15:23:24', 24),
(89, 'Shamim Ahmed', '01710000089', 'sahmed@police.gov.bd', 2, 1, 'ACTIVE', '2026-01-14 15:23:24', 24),
(90, 'Tahmina Islam', '01710000090', 'tislam@police.gov.bd', 2, 1, 'ACTIVE', '2026-01-14 15:23:24', 24),
(91, 'Rafid Hasan', '01710000091', 'rhasan@police.gov.bd', 2, 1, 'ACTIVE', '2026-01-14 15:23:24', 24),
(92, 'Mahbub Karim', '01710000092', 'mkarim@police.gov.bd', 2, 1, 'ACTIVE', '2026-01-14 15:23:24', 24),
(93, 'Nusrat Jahan', '01710000093', 'njahan@police.gov.bd', 2, 1, 'ACTIVE', '2026-01-14 15:23:24', 24),
(94, 'Aminul Haque', '01710000094', 'ahaque@police.gov.bd', 2, 1, 'ACTIVE', '2026-01-14 15:23:24', 24),
(95, 'Sadman Chowdhury', '01710000095', 'schowdhury@police.gov.bd', 2, 1, 'ACTIVE', '2026-01-14 15:23:24', 24),
(96, 'Sabrina Sultana', '01710000096', 'ssultana@dnc.gov.bd', 2, 3, 'ACTIVE', '2026-01-14 15:23:24', 25),
(97, 'Arif Mahmud', '01710000097', 'amahmud@dnc.gov.bd', 2, 3, 'ACTIVE', '2026-01-14 15:23:24', 25),
(98, 'Tanjila Noor', '01710000098', 'tnoor@dnc.gov.bd', 2, 3, 'ACTIVE', '2026-01-14 15:23:24', 25),
(99, 'Rasel Khan', '01710000099', 'rkhan@dnc.gov.bd', 2, 3, 'ACTIVE', '2026-01-14 15:23:24', 25),
(100, 'Mithila Roy', '01710000100', 'mroy@dnc.gov.bd', 2, 3, 'ACTIVE', '2026-01-14 15:23:24', 25),
(101, 'Shahriar Alam', '01710000101', 'salam@dnc.gov.bd', 2, 3, 'ACTIVE', '2026-01-14 15:23:24', 25),
(102, 'Fahim Reza', '01710000102', 'freza@dnc.gov.bd', 2, 3, 'ACTIVE', '2026-01-14 15:23:24', 25),
(103, 'Nabila Tasnim', '01710000103', 'ntasnim@dnc.gov.bd', 2, 3, 'ACTIVE', '2026-01-14 15:23:24', 25),
(104, 'Anik Paul', '01710000104', 'apaul@dnc.gov.bd', 2, 3, 'ACTIVE', '2026-01-14 15:23:24', 25),
(105, 'Ishrat Jahan', '01710000105', 'ijahan@dnc.gov.bd', 2, 3, 'ACTIVE', '2026-01-14 15:23:24', 25),
(106, 'Kamrul Hasan', '01710000106', 'khasan@police.gov.bd', 4, 1, 'ACTIVE', '2026-01-14 15:23:24', 28),
(107, 'Sharmin Akhter', '01710000107', 'sakhter@police.gov.bd', 4, 1, 'ACTIVE', '2026-01-14 15:23:24', 28),
(108, 'Rezaul Karim', '01710000108', 'rkarim@police.gov.bd', 4, 1, 'ACTIVE', '2026-01-14 15:23:24', 28),
(109, 'Farid Uddin', '01710000109', 'fuddin@police.gov.bd', 4, 1, 'ACTIVE', '2026-01-14 15:23:24', 28),
(110, 'Sadia Rahman', '01710000110', 'srahman@police.gov.bd', 4, 1, 'ACTIVE', '2026-01-14 15:23:24', 28),
(111, 'Dr. Asif Rahman', '01710000111', 'arahman@dnc.gov.bd', 3, 3, 'ACTIVE', '2026-01-14 15:23:24', 27),
(112, 'Dr. Rukaiya Begum', '01710000112', 'rbegum@dnc.gov.bd', 3, 3, 'ACTIVE', '2026-01-14 15:23:24', 27),
(113, 'Dr. Hasan Ali', '01710000113', 'hali@dnc.gov.bd', 3, 3, 'ACTIVE', '2026-01-14 15:23:24', 27),
(114, 'Dr. Sumaiya Khan', '01710000114', 'skhan@dnc.gov.bd', 3, 3, 'ACTIVE', '2026-01-14 15:23:24', 27),
(115, 'Dr. Tanvir Ahmed', '01710000115', 'tahmed@dnc.gov.bd', 3, 3, 'ACTIVE', '2026-01-14 15:23:24', 27),
(116, 'Riad Mahfuz', '01710000116', 'rmahfuz@police.gov.bd', 2, 1, 'ACTIVE', '2026-01-14 15:23:24', 24),
(117, 'Nayeem Islam', '01710000117', 'nislam@dnc.gov.bd', 2, 3, 'ACTIVE', '2026-01-14 15:23:24', 25),
(118, 'Sohana Afrin', '01710000118', 'safrin@police.gov.bd', 2, 1, 'ACTIVE', '2026-01-14 15:23:24', 24),
(119, 'Adnan Kabir', '01710000119', 'akabir@dnc.gov.bd', 2, 3, 'ACTIVE', '2026-01-14 15:23:24', 25),
(120, 'Purnima Das', '01710000120', 'pdas@police.gov.bd', 2, 1, 'ACTIVE', '2026-01-14 15:23:24', 24),
(121, 'Masud Rana', '01710000121', 'mrana@police.gov.bd', 4, 1, 'ACTIVE', '2026-01-14 15:23:24', 28),
(122, 'Shaila Parvin', '01710000122', 'sparvin@police.gov.bd', 4, 1, 'ACTIVE', '2026-01-14 15:23:24', 28),
(123, 'Dr. Omar Faruk', '01710000123', 'ofaruk@dnc.gov.bd', 3, 3, 'ACTIVE', '2026-01-14 15:23:24', 27),
(124, 'Dr. Jannatul Ferdous', '01710000124', 'jferdous@dnc.gov.bd', 3, 3, 'ACTIVE', '2026-01-14 15:23:24', 27),
(125, 'Dr. Mahin Kabir', '01710000125', 'mkabir@dnc.gov.bd', 3, 3, 'ACTIVE', '2026-01-14 15:23:24', 27);

-- --------------------------------------------------------

--
-- Table structure for table `USER_CREDENTIALS`
--

CREATE TABLE `USER_CREDENTIALS` (
  `CredentialID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `IsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `USER_CREDENTIALS`
--

INSERT INTO `USER_CREDENTIALS` (`CredentialID`, `UserID`, `Username`, `PasswordHash`, `IsActive`) VALUES
(1, 1, 'ayaan.rahman', '$2y$hash001', 1),
(2, 2, 'zarin.islam', '$2y$hash002', 1),
(3, 3, 'nafis.ahmed', '$2y$hash003', 1),
(4, 4, 'tasmia.noor', '$2y$hash004', 1),
(5, 5, 'raiyan.hossain', '$2y$hash005', 1),
(6, 6, 'mahin.chowdhury', '$2y$hash006', 1),
(7, 7, 'samiul.hasan', '$2y$hash007', 1),
(8, 8, 'nabila.akter', '$2y$hash008', 1),
(9, 9, 'fahim.sarker', '$2y$hash009', 1),
(10, 10, 'ishrat.jahan', '$2y$hash010', 1),
(11, 11, 'tahmid.kabir', '$2y$hash011', 1),
(12, 12, 'rumana.haque', '$2y$hash012', 1),
(13, 13, 'shakib.mahmud', '$2y$hash013', 1),
(14, 14, 'nusrat.farin', '$2y$hash014', 1),
(15, 15, 'adnan.rahim', '$2y$hash015', 1),
(16, 16, 'fariha.alam', '$2y$hash016', 1),
(17, 17, 'zubair.khan', '$2y$hash017', 1),
(18, 18, 'sadia.sultana', '$2y$hash018', 1),
(19, 19, 'arman.rashid', '$2y$hash019', 1),
(20, 20, 'maliha.nawar', '$2y$hash020', 1),
(21, 21, 'rashed.mahmud', '$2y$hash021', 1),
(22, 22, 'farhan.ali', '$2y$hash022', 1),
(23, 23, 'shamim.reza', '$2y$hash023', 1),
(24, 24, 'imran.siddique', '$2y$hash024', 1),
(25, 25, 'kamrul.hasan', '$2y$hash025', 1),
(26, 26, 'mehedi.rahman', '$2y$hash026', 1),
(27, 27, 'sabbir.ahmed', '$2y$hash027', 1),
(28, 28, 'arif.hossain', '$2y$hash028', 1),
(29, 29, 'sajid.rahman', '$2y$hash029', 1),
(30, 30, 'tanvir.islam', '$2y$hash030', 1),
(31, 31, 'mahira.khan', '$2y$hash031', 1),
(32, 32, 'samin.chowdhury', '$2y$hash032', 1),
(33, 33, 'anika.tasnim', '$2y$hash033', 1),
(34, 34, 'fahad.karim', '$2y$hash034', 1),
(35, 35, 'hasib.anwar', '$2y$hash035', 1),
(36, 36, 'riyad.kabir', '$2y$hash036', 1),
(37, 37, 'mahfuz.alam', '$2y$hash037', 1),
(38, 38, 'saiful.islam', '$2y$hash038', 1),
(39, 39, 'tanvir.hossain', '$2y$hash039', 1),
(40, 40, 'shafiqur.rahman', '$2y$hash040', 1),
(41, 41, 'faisal.ahmed', '$2y$hash041', 1),
(42, 42, 'jahid.hasan', '$2y$hash042', 1),
(43, 43, 'nayeem.islam', '$2y$hash043', 1),
(44, 44, 'rafiul.karim', '$2y$hash044', 1),
(45, 45, 'asif.mahmud', '$2y$hash045', 1),
(46, 46, 'sohan.mia', '$2y$hash046', 1),
(47, 47, 'nadim.uddin', '$2y$hash047', 1),
(48, 48, 'imtiaz.hossain', '$2y$hash048', 1),
(49, 49, 'rasel.khan', '$2y$hash049', 1),
(50, 50, 'moinul.islam', '$2y$hash050', 1),
(51, 51, 'nafisa.islam', '$2y$hash051', 1),
(52, 52, 'sharmin.akter', '$2y$hash052', 1),
(53, 53, 'zahid.hasan', '$2y$hash053', 1),
(54, 54, 'rakibul.islam', '$2y$hash054', 1),
(55, 55, 'parvez.mahmud', '$2y$hash055', 1),
(56, 56, 'sohana.akter', '$2y$hash056', 1),
(57, 57, 'tahsin.noor', '$2y$hash057', 1),
(58, 58, 'mahira.tasnim', '$2y$hash058', 1),
(59, 59, 'adnan.kabir', '$2y$hash059', 1),
(60, 60, 'faria.sultana', '$2y$hash060', 1),
(61, 61, 'masud.rana', '$2y$hash061', 1),
(62, 62, 'anik.hossain', '$2y$hash062', 1),
(63, 63, 'abdur.rahman', '$2y$hash063', 1),
(64, 64, 'shahidul.islam', '$2y$hash064', 1),
(65, 65, 'fahim.ahmed', '$2y$hash065', 1),
(66, 66, 'raihan.chowdhury', '$2y$hash066', 1),
(67, 67, 'asif.karim', '$2y$hash067', 1),
(68, 68, 'sakib.islam', '$2y$hash068', 1),
(69, 69, 'nazmul.haque', '$2y$hash069', 1),
(70, 70, 'tanvir.ahmed', '$2y$hash070', 1),
(71, 71, 'mehedi.hasan', '$2y$hash071', 1),
(72, 72, 'sabrina.noor', '$2y$hash072', 1),
(73, 73, 'ayesha.rahman', '$2y$hash073', 1),
(74, 74, 'iftekhar.ahmed', '$2y$hash074', 1),
(75, 75, 'nabila.khan', '$2y$hash075', 1),
(76, 76, 'rumana.haque2', '$2y$hash076', 1),
(77, 77, 'farhan.iqbal', '$2y$hash077', 1),
(78, 78, 'tanjila.rumi', '$2y$hash078', 1),
(79, 79, 'sabbir.uddin', '$2y$hash079', 1),
(80, 80, 'nazia.chowdhury', '$2y$hash080', 1),
(81, 81, 'kamal.uddin', '$2y$hash081', 1),
(82, 82, 'farzana.islam', '$2y$hash082', 1),
(83, 83, 'system.admin', '$2y$hash083', 1),
(84, 84, 'deputy.admin', '$2y$hash084', 1),
(85, 85, 'security.admin', '$2y$hash085', 1);

-- --------------------------------------------------------

--
-- Table structure for table `USER_DOCUMENTS`
--

CREATE TABLE `USER_DOCUMENTS` (
  `DocumentID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `DocumentType` varchar(50) NOT NULL,
  `FilePath` varchar(255) NOT NULL,
  `UploadedAt` datetime NOT NULL,
  `VerificationStatus` varchar(20) NOT NULL,
  `VerifiedBy` int(11) DEFAULT NULL,
  `VerifiedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `USER_DOCUMENTS`
--

INSERT INTO `USER_DOCUMENTS` (`DocumentID`, `UserID`, `DocumentType`, `FilePath`, `UploadedAt`, `VerificationStatus`, `VerifiedBy`, `VerifiedAt`) VALUES
(1, 1, 'ID_CARD', '/uploads/docs/user_1_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(2, 2, 'ID_CARD', '/uploads/docs/user_2_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(3, 3, 'ID_CARD', '/uploads/docs/user_3_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(4, 4, 'ID_CARD', '/uploads/docs/user_4_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(5, 5, 'ID_CARD', '/uploads/docs/user_5_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(6, 6, 'ID_CARD', '/uploads/docs/user_6_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(7, 7, 'ID_CARD', '/uploads/docs/user_7_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(8, 8, 'ID_CARD', '/uploads/docs/user_8_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(9, 9, 'ID_CARD', '/uploads/docs/user_9_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(10, 10, 'ID_CARD', '/uploads/docs/user_10_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(11, 11, 'ID_CARD', '/uploads/docs/user_11_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(12, 12, 'ID_CARD', '/uploads/docs/user_12_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(13, 13, 'ID_CARD', '/uploads/docs/user_13_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(14, 14, 'ID_CARD', '/uploads/docs/user_14_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(15, 15, 'ID_CARD', '/uploads/docs/user_15_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(16, 16, 'ID_CARD', '/uploads/docs/user_16_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(17, 17, 'ID_CARD', '/uploads/docs/user_17_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(18, 18, 'ID_CARD', '/uploads/docs/user_18_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(19, 19, 'ID_CARD', '/uploads/docs/user_19_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(20, 20, 'ID_CARD', '/uploads/docs/user_20_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(21, 21, 'ID_CARD', '/uploads/docs/user_21_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(22, 22, 'ID_CARD', '/uploads/docs/user_22_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(23, 23, 'ID_CARD', '/uploads/docs/user_23_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(24, 24, 'ID_CARD', '/uploads/docs/user_24_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(25, 25, 'ID_CARD', '/uploads/docs/user_25_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(26, 26, 'ID_CARD', '/uploads/docs/user_26_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(27, 27, 'ID_CARD', '/uploads/docs/user_27_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(28, 28, 'ID_CARD', '/uploads/docs/user_28_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(29, 29, 'ID_CARD', '/uploads/docs/user_29_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(30, 30, 'ID_CARD', '/uploads/docs/user_30_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(31, 31, 'ID_CARD', '/uploads/docs/user_31_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(32, 32, 'ID_CARD', '/uploads/docs/user_32_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(33, 33, 'ID_CARD', '/uploads/docs/user_33_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(34, 34, 'ID_CARD', '/uploads/docs/user_34_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(35, 35, 'ID_CARD', '/uploads/docs/user_35_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(36, 36, 'ID_CARD', '/uploads/docs/user_36_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(37, 37, 'ID_CARD', '/uploads/docs/user_37_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(38, 38, 'ID_CARD', '/uploads/docs/user_38_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(39, 39, 'ID_CARD', '/uploads/docs/user_39_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(40, 40, 'ID_CARD', '/uploads/docs/user_40_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(41, 41, 'ID_CARD', '/uploads/docs/user_41_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(42, 42, 'ID_CARD', '/uploads/docs/user_42_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(43, 43, 'ID_CARD', '/uploads/docs/user_43_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(44, 44, 'ID_CARD', '/uploads/docs/user_44_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(45, 45, 'ID_CARD', '/uploads/docs/user_45_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(46, 46, 'ID_CARD', '/uploads/docs/user_46_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(47, 47, 'ID_CARD', '/uploads/docs/user_47_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(48, 48, 'ID_CARD', '/uploads/docs/user_48_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(49, 49, 'ID_CARD', '/uploads/docs/user_49_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(50, 50, 'ID_CARD', '/uploads/docs/user_50_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(51, 51, 'ID_CARD', '/uploads/docs/user_51_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(52, 52, 'ID_CARD', '/uploads/docs/user_52_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(53, 53, 'ID_CARD', '/uploads/docs/user_53_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(54, 54, 'ID_CARD', '/uploads/docs/user_54_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(55, 55, 'ID_CARD', '/uploads/docs/user_55_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(56, 56, 'ID_CARD', '/uploads/docs/user_56_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(57, 57, 'ID_CARD', '/uploads/docs/user_57_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(58, 58, 'ID_CARD', '/uploads/docs/user_58_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(59, 59, 'ID_CARD', '/uploads/docs/user_59_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(60, 60, 'ID_CARD', '/uploads/docs/user_60_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(61, 61, 'ID_CARD', '/uploads/docs/user_61_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(62, 62, 'ID_CARD', '/uploads/docs/user_62_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(63, 63, 'ID_CARD', '/uploads/docs/user_63_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(64, 64, 'ID_CARD', '/uploads/docs/user_64_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(65, 65, 'ID_CARD', '/uploads/docs/user_65_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(66, 66, 'ID_CARD', '/uploads/docs/user_66_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(67, 67, 'ID_CARD', '/uploads/docs/user_67_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(68, 68, 'ID_CARD', '/uploads/docs/user_68_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(69, 69, 'ID_CARD', '/uploads/docs/user_69_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(70, 70, 'ID_CARD', '/uploads/docs/user_70_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(71, 71, 'ID_CARD', '/uploads/docs/user_71_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(72, 72, 'ID_CARD', '/uploads/docs/user_72_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(73, 73, 'ID_CARD', '/uploads/docs/user_73_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(74, 74, 'ID_CARD', '/uploads/docs/user_74_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(75, 75, 'ID_CARD', '/uploads/docs/user_75_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(76, 76, 'ID_CARD', '/uploads/docs/user_76_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(77, 77, 'ID_CARD', '/uploads/docs/user_77_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(78, 78, 'ID_CARD', '/uploads/docs/user_78_id.jpg', '2026-01-11 23:05:37', 'pending', NULL, NULL),
(79, 79, 'ID_CARD', '/uploads/docs/user_79_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(80, 80, 'ID_CARD', '/uploads/docs/user_80_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(81, 81, 'ID_CARD', '/uploads/docs/user_81_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(82, 82, 'ID_CARD', '/uploads/docs/user_82_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(83, 83, 'ID_CARD', '/uploads/docs/user_83_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(84, 84, 'ID_CARD', '/uploads/docs/user_84_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37'),
(85, 85, 'ID_CARD', '/uploads/docs/user_85_id.jpg', '2026-01-11 23:05:37', 'verified', 83, '2026-01-11 23:05:37');

-- --------------------------------------------------------

--
-- Table structure for table `WITNESS`
--

CREATE TABLE `WITNESS` (
  `WitnessID` int(11) NOT NULL,
  `CaseID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Statement` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `WITNESS`
--

INSERT INTO `WITNESS` (`WitnessID`, `CaseID`, `Name`, `Phone`, `Statement`) VALUES
(1, 31, 'Abdul Karim', '01712345678', 'Saw the suspect exchanging packets late at night.'),
(2, 36, 'Rina Akter', '01823456789', 'Heard loud arguments before the police arrived.'),
(3, 76, 'Shahidul Islam', '01934567890', 'Noticed suspicious movement near the warehouse.'),
(4, 10, 'Nasima Begum', '01645678901', 'Identified the accused from a close distance.'),
(5, 15, 'Sohel Rana', '01756789012', 'Saw drugs being handed over in a black bag.'),
(6, 55, 'Mizanur Rahman', '01867890123', 'Provided CCTV footage from nearby shop.'),
(7, 93, 'Farzana Yasmin', '01978901234', 'Heard the suspect confess during an argument.'),
(8, 98, 'Al Amin', '01689012345', 'Saw police recover substances from the scene.'),
(9, 34, 'Sharmin Sultana', '01790123456', 'Witnessed the arrest directly.'),
(10, 39, 'Kamrul Hasan', '01801234567', 'Confirmed regular suspicious visits by the accused.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ADMIN_ZONE`
--
ALTER TABLE `ADMIN_ZONE`
  ADD PRIMARY KEY (`ZoneID`),
  ADD UNIQUE KEY `ZoneName` (`ZoneName`);

--
-- Indexes for table `ANALYST_DETAILS`
--
ALTER TABLE `ANALYST_DETAILS`
  ADD PRIMARY KEY (`AnalystID`),
  ADD UNIQUE KEY `UserID` (`UserID`),
  ADD UNIQUE KEY `AnalystCode` (`AnalystCode`);

--
-- Indexes for table `ANALYST_REPORT`
--
ALTER TABLE `ANALYST_REPORT`
  ADD PRIMARY KEY (`AnalystReportID`),
  ADD KEY `AnalystID` (`AnalystID`),
  ADD KEY `CaseID` (`CaseID`),
  ADD KEY `RouteID` (`RouteID`);

--
-- Indexes for table `AUDITOR_DETAILS`
--
ALTER TABLE `AUDITOR_DETAILS`
  ADD PRIMARY KEY (`AuditorID`),
  ADD UNIQUE KEY `UserID` (`UserID`),
  ADD UNIQUE KEY `AuditorCode` (`AuditorCode`);

--
-- Indexes for table `AUDIT_LOG`
--
ALTER TABLE `AUDIT_LOG`
  ADD PRIMARY KEY (`AuditID`),
  ADD KEY `CaseID` (`CaseID`),
  ADD KEY `AuditorID` (`AuditorID`);

--
-- Indexes for table `BGB_DETAILS`
--
ALTER TABLE `BGB_DETAILS`
  ADD PRIMARY KEY (`BgbID`),
  ADD UNIQUE KEY `UserID` (`UserID`),
  ADD UNIQUE KEY `BadgeNumber` (`BadgeNumber`);

--
-- Indexes for table `CASE_FILE`
--
ALTER TABLE `CASE_FILE`
  ADD PRIMARY KEY (`CaseID`),
  ADD UNIQUE KEY `CaseNumber` (`CaseNumber`),
  ADD KEY `CreatedBy` (`CreatedBy`);

--
-- Indexes for table `CASE_LOCATION`
--
ALTER TABLE `CASE_LOCATION`
  ADD PRIMARY KEY (`LocationID`),
  ADD KEY `CaseID` (`CaseID`),
  ADD KEY `DivisionID` (`DivisionID`),
  ADD KEY `DistrictID` (`DistrictID`),
  ADD KEY `ThanaID` (`ThanaID`);

--
-- Indexes for table `CASE_SUSPECT`
--
ALTER TABLE `CASE_SUSPECT`
  ADD PRIMARY KEY (`CaseSuspectID`),
  ADD KEY `CaseID` (`CaseID`),
  ADD KEY `SuspectID` (`SuspectID`);

--
-- Indexes for table `CHAIN_OF_CUSTODY`
--
ALTER TABLE `CHAIN_OF_CUSTODY`
  ADD PRIMARY KEY (`TransferID`),
  ADD KEY `EvidenceID` (`EvidenceID`),
  ADD KEY `FromUser` (`FromUser`),
  ADD KEY `ToUser` (`ToUser`);

--
-- Indexes for table `COAST_GUARD_DETAILS`
--
ALTER TABLE `COAST_GUARD_DETAILS`
  ADD PRIMARY KEY (`CoastGuardID`),
  ADD UNIQUE KEY `UserID` (`UserID`),
  ADD UNIQUE KEY `BadgeNumber` (`BadgeNumber`);

--
-- Indexes for table `CUSTOMS_DETAILS`
--
ALTER TABLE `CUSTOMS_DETAILS`
  ADD PRIMARY KEY (`CustomsID`),
  ADD UNIQUE KEY `UserID` (`UserID`),
  ADD UNIQUE KEY `BadgeNumber` (`BadgeNumber`);

--
-- Indexes for table `DIGITAL_EVIDENCE`
--
ALTER TABLE `DIGITAL_EVIDENCE`
  ADD PRIMARY KEY (`DigitalEvidenceID`),
  ADD UNIQUE KEY `HashValue` (`HashValue`),
  ADD KEY `EvidenceID` (`EvidenceID`),
  ADD KEY `UploadedBy` (`UploadedBy`);

--
-- Indexes for table `DISTRICT`
--
ALTER TABLE `DISTRICT`
  ADD PRIMARY KEY (`DistrictID`),
  ADD KEY `DivisionID` (`DivisionID`);

--
-- Indexes for table `DISTRICT_ADMIN`
--
ALTER TABLE `DISTRICT_ADMIN`
  ADD PRIMARY KEY (`DistrictAdminID`),
  ADD KEY `DistrictID` (`DistrictID`),
  ADD KEY `CreatedBySuperAdmin` (`CreatedBySuperAdmin`);

--
-- Indexes for table `DIVISION`
--
ALTER TABLE `DIVISION`
  ADD PRIMARY KEY (`DivisionID`),
  ADD UNIQUE KEY `DivisionName` (`DivisionName`);

--
-- Indexes for table `DNC_DETAILS`
--
ALTER TABLE `DNC_DETAILS`
  ADD PRIMARY KEY (`DncID`),
  ADD UNIQUE KEY `UserID` (`UserID`),
  ADD UNIQUE KEY `BadgeNumber` (`BadgeNumber`);

--
-- Indexes for table `EVIDENCE`
--
ALTER TABLE `EVIDENCE`
  ADD PRIMARY KEY (`EvidenceID`),
  ADD UNIQUE KEY `SealNumber` (`SealNumber`),
  ADD KEY `CaseID` (`CaseID`);

--
-- Indexes for table `FORCES`
--
ALTER TABLE `FORCES`
  ADD PRIMARY KEY (`ForceID`);

--
-- Indexes for table `GANG`
--
ALTER TABLE `GANG`
  ADD PRIMARY KEY (`GangID`),
  ADD UNIQUE KEY `GangName` (`GangName`);

--
-- Indexes for table `GANG_MEMBER`
--
ALTER TABLE `GANG_MEMBER`
  ADD PRIMARY KEY (`GangMemberID`),
  ADD KEY `GangID` (`GangID`),
  ADD KEY `SuspectID` (`SuspectID`);

--
-- Indexes for table `LAB_OFFICER_DETAILS`
--
ALTER TABLE `LAB_OFFICER_DETAILS`
  ADD PRIMARY KEY (`LabOfficerID`),
  ADD UNIQUE KEY `UserID` (`UserID`),
  ADD KEY `fk_lab_posting_city` (`PostingCityID`);

--
-- Indexes for table `LAB_REPORT`
--
ALTER TABLE `LAB_REPORT`
  ADD PRIMARY KEY (`LabReportID`),
  ADD UNIQUE KEY `EvidenceID` (`EvidenceID`),
  ADD KEY `LabOfficerID` (`LabOfficerID`);

--
-- Indexes for table `LEGAL_REPORT`
--
ALTER TABLE `LEGAL_REPORT`
  ADD PRIMARY KEY (`ReportID`),
  ADD KEY `CaseID` (`CaseID`),
  ADD KEY `GeneratedBy` (`GeneratedBy`);

--
-- Indexes for table `PERMISSIONS`
--
ALTER TABLE `PERMISSIONS`
  ADD PRIMARY KEY (`PermissionID`),
  ADD UNIQUE KEY `PermissionCode` (`PermissionCode`);

--
-- Indexes for table `POLICE_DETAILS`
--
ALTER TABLE `POLICE_DETAILS`
  ADD PRIMARY KEY (`PoliceID`),
  ADD UNIQUE KEY `UserID` (`UserID`),
  ADD UNIQUE KEY `BadgeNumber` (`BadgeNumber`),
  ADD KEY `ThanaID` (`ThanaID`),
  ADD KEY `fk_police_division` (`PostingDivisionID`),
  ADD KEY `fk_police_zone` (`ZoneID`);

--
-- Indexes for table `RAB_DETAILS`
--
ALTER TABLE `RAB_DETAILS`
  ADD PRIMARY KEY (`RabID`),
  ADD UNIQUE KEY `UserID` (`UserID`),
  ADD UNIQUE KEY `RabBadgeNumber` (`RabBadgeNumber`);

--
-- Indexes for table `ROLES`
--
ALTER TABLE `ROLES`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `ROLE_FORCE`
--
ALTER TABLE `ROLE_FORCE`
  ADD PRIMARY KEY (`RoleForceID`),
  ADD UNIQUE KEY `uq_force_rank` (`ForceID`,`RankName`),
  ADD UNIQUE KEY `uq_role_force_rank` (`RoleID`,`ForceID`,`RankName`);

--
-- Indexes for table `ROLE_PERMISSIONS`
--
ALTER TABLE `ROLE_PERMISSIONS`
  ADD PRIMARY KEY (`RolePermissionID`),
  ADD UNIQUE KEY `RoleForceID` (`RoleForceID`,`PermissionID`),
  ADD KEY `PermissionID` (`PermissionID`);

--
-- Indexes for table `SEIZURE`
--
ALTER TABLE `SEIZURE`
  ADD PRIMARY KEY (`SeizureID`),
  ADD KEY `CaseID` (`CaseID`),
  ADD KEY `SeizedByUserID` (`SeizedByUserID`);

--
-- Indexes for table `SUPER_ADMIN`
--
ALTER TABLE `SUPER_ADMIN`
  ADD PRIMARY KEY (`SuperAdminID`);

--
-- Indexes for table `SUSPECT`
--
ALTER TABLE `SUSPECT`
  ADD PRIMARY KEY (`SuspectID`),
  ADD UNIQUE KEY `NID` (`NID`);

--
-- Indexes for table `THANA`
--
ALTER TABLE `THANA`
  ADD PRIMARY KEY (`ThanaID`),
  ADD KEY `DistrictID` (`DistrictID`),
  ADD KEY `fk_thana_zone` (`ZoneID`);

--
-- Indexes for table `TRAFFICKING_ROUTE`
--
ALTER TABLE `TRAFFICKING_ROUTE`
  ADD PRIMARY KEY (`RouteID`),
  ADD KEY `CaseID` (`CaseID`),
  ADD KEY `FromDistrictID` (`FromDistrictID`),
  ADD KEY `ToDistrictID` (`ToDistrictID`);

--
-- Indexes for table `UNIT_ADMIN`
--
ALTER TABLE `UNIT_ADMIN`
  ADD PRIMARY KEY (`UnitAdminID`),
  ADD UNIQUE KEY `UserID` (`UserID`),
  ADD KEY `ForceID` (`ForceID`);

--
-- Indexes for table `USERS`
--
ALTER TABLE `USERS`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `uq_users_email` (`Email`),
  ADD KEY `RoleID` (`RoleID`),
  ADD KEY `ForceID` (`ForceID`),
  ADD KEY `idx_users_roleforce` (`AssignedRoleForceID`);

--
-- Indexes for table `USER_CREDENTIALS`
--
ALTER TABLE `USER_CREDENTIALS`
  ADD PRIMARY KEY (`CredentialID`),
  ADD UNIQUE KEY `UserID` (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `USER_DOCUMENTS`
--
ALTER TABLE `USER_DOCUMENTS`
  ADD PRIMARY KEY (`DocumentID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `FK_USER_DOCUMENTS_VerifiedBy` (`VerifiedBy`);

--
-- Indexes for table `WITNESS`
--
ALTER TABLE `WITNESS`
  ADD PRIMARY KEY (`WitnessID`),
  ADD KEY `CaseID` (`CaseID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ADMIN_ZONE`
--
ALTER TABLE `ADMIN_ZONE`
  MODIFY `ZoneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ANALYST_DETAILS`
--
ALTER TABLE `ANALYST_DETAILS`
  MODIFY `AnalystID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ANALYST_REPORT`
--
ALTER TABLE `ANALYST_REPORT`
  MODIFY `AnalystReportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `AUDITOR_DETAILS`
--
ALTER TABLE `AUDITOR_DETAILS`
  MODIFY `AuditorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `AUDIT_LOG`
--
ALTER TABLE `AUDIT_LOG`
  MODIFY `AuditID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `BGB_DETAILS`
--
ALTER TABLE `BGB_DETAILS`
  MODIFY `BgbID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `CASE_FILE`
--
ALTER TABLE `CASE_FILE`
  MODIFY `CaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `CASE_LOCATION`
--
ALTER TABLE `CASE_LOCATION`
  MODIFY `LocationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `CASE_SUSPECT`
--
ALTER TABLE `CASE_SUSPECT`
  MODIFY `CaseSuspectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `CHAIN_OF_CUSTODY`
--
ALTER TABLE `CHAIN_OF_CUSTODY`
  MODIFY `TransferID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `COAST_GUARD_DETAILS`
--
ALTER TABLE `COAST_GUARD_DETAILS`
  MODIFY `CoastGuardID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `CUSTOMS_DETAILS`
--
ALTER TABLE `CUSTOMS_DETAILS`
  MODIFY `CustomsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `DIGITAL_EVIDENCE`
--
ALTER TABLE `DIGITAL_EVIDENCE`
  MODIFY `DigitalEvidenceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `DISTRICT`
--
ALTER TABLE `DISTRICT`
  MODIFY `DistrictID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `DISTRICT_ADMIN`
--
ALTER TABLE `DISTRICT_ADMIN`
  MODIFY `DistrictAdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `DIVISION`
--
ALTER TABLE `DIVISION`
  MODIFY `DivisionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `DNC_DETAILS`
--
ALTER TABLE `DNC_DETAILS`
  MODIFY `DncID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `EVIDENCE`
--
ALTER TABLE `EVIDENCE`
  MODIFY `EvidenceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `FORCES`
--
ALTER TABLE `FORCES`
  MODIFY `ForceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `GANG`
--
ALTER TABLE `GANG`
  MODIFY `GangID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `GANG_MEMBER`
--
ALTER TABLE `GANG_MEMBER`
  MODIFY `GangMemberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `LAB_OFFICER_DETAILS`
--
ALTER TABLE `LAB_OFFICER_DETAILS`
  MODIFY `LabOfficerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `LAB_REPORT`
--
ALTER TABLE `LAB_REPORT`
  MODIFY `LabReportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `LEGAL_REPORT`
--
ALTER TABLE `LEGAL_REPORT`
  MODIFY `ReportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `PERMISSIONS`
--
ALTER TABLE `PERMISSIONS`
  MODIFY `PermissionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `POLICE_DETAILS`
--
ALTER TABLE `POLICE_DETAILS`
  MODIFY `PoliceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `RAB_DETAILS`
--
ALTER TABLE `RAB_DETAILS`
  MODIFY `RabID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ROLES`
--
ALTER TABLE `ROLES`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ROLE_FORCE`
--
ALTER TABLE `ROLE_FORCE`
  MODIFY `RoleForceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `ROLE_PERMISSIONS`
--
ALTER TABLE `ROLE_PERMISSIONS`
  MODIFY `RolePermissionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `SEIZURE`
--
ALTER TABLE `SEIZURE`
  MODIFY `SeizureID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `SUPER_ADMIN`
--
ALTER TABLE `SUPER_ADMIN`
  MODIFY `SuperAdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `SUSPECT`
--
ALTER TABLE `SUSPECT`
  MODIFY `SuspectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `THANA`
--
ALTER TABLE `THANA`
  MODIFY `ThanaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `TRAFFICKING_ROUTE`
--
ALTER TABLE `TRAFFICKING_ROUTE`
  MODIFY `RouteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `UNIT_ADMIN`
--
ALTER TABLE `UNIT_ADMIN`
  MODIFY `UnitAdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `USERS`
--
ALTER TABLE `USERS`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `USER_CREDENTIALS`
--
ALTER TABLE `USER_CREDENTIALS`
  MODIFY `CredentialID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `USER_DOCUMENTS`
--
ALTER TABLE `USER_DOCUMENTS`
  MODIFY `DocumentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `WITNESS`
--
ALTER TABLE `WITNESS`
  MODIFY `WitnessID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ANALYST_DETAILS`
--
ALTER TABLE `ANALYST_DETAILS`
  ADD CONSTRAINT `analyst_details_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `ANALYST_REPORT`
--
ALTER TABLE `ANALYST_REPORT`
  ADD CONSTRAINT `analyst_report_ibfk_1` FOREIGN KEY (`AnalystID`) REFERENCES `USERS` (`UserID`),
  ADD CONSTRAINT `analyst_report_ibfk_2` FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`),
  ADD CONSTRAINT `analyst_report_ibfk_3` FOREIGN KEY (`RouteID`) REFERENCES `TRAFFICKING_ROUTE` (`RouteID`);

--
-- Constraints for table `AUDITOR_DETAILS`
--
ALTER TABLE `AUDITOR_DETAILS`
  ADD CONSTRAINT `fk_auditor_user` FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `AUDIT_LOG`
--
ALTER TABLE `AUDIT_LOG`
  ADD CONSTRAINT `audit_log_ibfk_1` FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`),
  ADD CONSTRAINT `audit_log_ibfk_2` FOREIGN KEY (`AuditorID`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `BGB_DETAILS`
--
ALTER TABLE `BGB_DETAILS`
  ADD CONSTRAINT `bgb_details_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `CASE_FILE`
--
ALTER TABLE `CASE_FILE`
  ADD CONSTRAINT `case_file_ibfk_1` FOREIGN KEY (`CreatedBy`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `CASE_LOCATION`
--
ALTER TABLE `CASE_LOCATION`
  ADD CONSTRAINT `case_location_ibfk_1` FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`),
  ADD CONSTRAINT `case_location_ibfk_2` FOREIGN KEY (`DivisionID`) REFERENCES `DIVISION` (`DivisionID`),
  ADD CONSTRAINT `case_location_ibfk_3` FOREIGN KEY (`DistrictID`) REFERENCES `DISTRICT` (`DistrictID`),
  ADD CONSTRAINT `case_location_ibfk_4` FOREIGN KEY (`ThanaID`) REFERENCES `THANA` (`ThanaID`);

--
-- Constraints for table `CASE_SUSPECT`
--
ALTER TABLE `CASE_SUSPECT`
  ADD CONSTRAINT `case_suspect_ibfk_1` FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`),
  ADD CONSTRAINT `case_suspect_ibfk_2` FOREIGN KEY (`SuspectID`) REFERENCES `SUSPECT` (`SuspectID`);

--
-- Constraints for table `CHAIN_OF_CUSTODY`
--
ALTER TABLE `CHAIN_OF_CUSTODY`
  ADD CONSTRAINT `chain_of_custody_ibfk_1` FOREIGN KEY (`EvidenceID`) REFERENCES `EVIDENCE` (`EvidenceID`),
  ADD CONSTRAINT `chain_of_custody_ibfk_2` FOREIGN KEY (`FromUser`) REFERENCES `USERS` (`UserID`),
  ADD CONSTRAINT `chain_of_custody_ibfk_3` FOREIGN KEY (`ToUser`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `COAST_GUARD_DETAILS`
--
ALTER TABLE `COAST_GUARD_DETAILS`
  ADD CONSTRAINT `coast_guard_details_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `CUSTOMS_DETAILS`
--
ALTER TABLE `CUSTOMS_DETAILS`
  ADD CONSTRAINT `customs_details_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `DIGITAL_EVIDENCE`
--
ALTER TABLE `DIGITAL_EVIDENCE`
  ADD CONSTRAINT `digital_evidence_ibfk_1` FOREIGN KEY (`EvidenceID`) REFERENCES `EVIDENCE` (`EvidenceID`),
  ADD CONSTRAINT `digital_evidence_ibfk_2` FOREIGN KEY (`UploadedBy`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `DISTRICT`
--
ALTER TABLE `DISTRICT`
  ADD CONSTRAINT `district_ibfk_1` FOREIGN KEY (`DivisionID`) REFERENCES `DIVISION` (`DivisionID`);

--
-- Constraints for table `DISTRICT_ADMIN`
--
ALTER TABLE `DISTRICT_ADMIN`
  ADD CONSTRAINT `district_admin_ibfk_1` FOREIGN KEY (`DistrictID`) REFERENCES `DISTRICT` (`DistrictID`),
  ADD CONSTRAINT `district_admin_ibfk_2` FOREIGN KEY (`CreatedBySuperAdmin`) REFERENCES `SUPER_ADMIN` (`SuperAdminID`);

--
-- Constraints for table `DNC_DETAILS`
--
ALTER TABLE `DNC_DETAILS`
  ADD CONSTRAINT `dnc_details_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `EVIDENCE`
--
ALTER TABLE `EVIDENCE`
  ADD CONSTRAINT `evidence_ibfk_1` FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`);

--
-- Constraints for table `GANG_MEMBER`
--
ALTER TABLE `GANG_MEMBER`
  ADD CONSTRAINT `gang_member_ibfk_1` FOREIGN KEY (`GangID`) REFERENCES `GANG` (`GangID`),
  ADD CONSTRAINT `gang_member_ibfk_2` FOREIGN KEY (`SuspectID`) REFERENCES `SUSPECT` (`SuspectID`);

--
-- Constraints for table `LAB_OFFICER_DETAILS`
--
ALTER TABLE `LAB_OFFICER_DETAILS`
  ADD CONSTRAINT `fk_lab_posting_city` FOREIGN KEY (`PostingCityID`) REFERENCES `DIVISION` (`DivisionID`),
  ADD CONSTRAINT `lab_officer_details_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `LAB_REPORT`
--
ALTER TABLE `LAB_REPORT`
  ADD CONSTRAINT `lab_report_ibfk_1` FOREIGN KEY (`EvidenceID`) REFERENCES `EVIDENCE` (`EvidenceID`),
  ADD CONSTRAINT `lab_report_ibfk_2` FOREIGN KEY (`LabOfficerID`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `LEGAL_REPORT`
--
ALTER TABLE `LEGAL_REPORT`
  ADD CONSTRAINT `legal_report_ibfk_1` FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`),
  ADD CONSTRAINT `legal_report_ibfk_2` FOREIGN KEY (`GeneratedBy`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `POLICE_DETAILS`
--
ALTER TABLE `POLICE_DETAILS`
  ADD CONSTRAINT `fk_police_division` FOREIGN KEY (`PostingDivisionID`) REFERENCES `DIVISION` (`DivisionID`),
  ADD CONSTRAINT `fk_police_zone` FOREIGN KEY (`ZoneID`) REFERENCES `ADMIN_ZONE` (`ZoneID`),
  ADD CONSTRAINT `police_details_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`),
  ADD CONSTRAINT `police_details_ibfk_2` FOREIGN KEY (`ThanaID`) REFERENCES `THANA` (`ThanaID`);

--
-- Constraints for table `RAB_DETAILS`
--
ALTER TABLE `RAB_DETAILS`
  ADD CONSTRAINT `rab_details_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `ROLE_FORCE`
--
ALTER TABLE `ROLE_FORCE`
  ADD CONSTRAINT `role_force_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `ROLES` (`RoleID`),
  ADD CONSTRAINT `role_force_ibfk_2` FOREIGN KEY (`ForceID`) REFERENCES `FORCES` (`ForceID`);

--
-- Constraints for table `ROLE_PERMISSIONS`
--
ALTER TABLE `ROLE_PERMISSIONS`
  ADD CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`RoleForceID`) REFERENCES `ROLE_FORCE` (`RoleForceID`),
  ADD CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`PermissionID`) REFERENCES `PERMISSIONS` (`PermissionID`);

--
-- Constraints for table `SEIZURE`
--
ALTER TABLE `SEIZURE`
  ADD CONSTRAINT `seizure_ibfk_1` FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`),
  ADD CONSTRAINT `seizure_ibfk_2` FOREIGN KEY (`SeizedByUserID`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `THANA`
--
ALTER TABLE `THANA`
  ADD CONSTRAINT `fk_thana_zone` FOREIGN KEY (`ZoneID`) REFERENCES `ADMIN_ZONE` (`ZoneID`),
  ADD CONSTRAINT `thana_ibfk_1` FOREIGN KEY (`DistrictID`) REFERENCES `DISTRICT` (`DistrictID`),
  ADD CONSTRAINT `thana_ibfk_2` FOREIGN KEY (`ZoneID`) REFERENCES `ADMIN_ZONE` (`ZoneID`);

--
-- Constraints for table `TRAFFICKING_ROUTE`
--
ALTER TABLE `TRAFFICKING_ROUTE`
  ADD CONSTRAINT `trafficking_route_ibfk_1` FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`),
  ADD CONSTRAINT `trafficking_route_ibfk_2` FOREIGN KEY (`FromDistrictID`) REFERENCES `DISTRICT` (`DistrictID`),
  ADD CONSTRAINT `trafficking_route_ibfk_3` FOREIGN KEY (`ToDistrictID`) REFERENCES `DISTRICT` (`DistrictID`);

--
-- Constraints for table `UNIT_ADMIN`
--
ALTER TABLE `UNIT_ADMIN`
  ADD CONSTRAINT `unit_admin_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`),
  ADD CONSTRAINT `unit_admin_ibfk_2` FOREIGN KEY (`ForceID`) REFERENCES `FORCES` (`ForceID`);

--
-- Constraints for table `USERS`
--
ALTER TABLE `USERS`
  ADD CONSTRAINT `fk_users_assigned_roleforce` FOREIGN KEY (`AssignedRoleForceID`) REFERENCES `ROLE_FORCE` (`RoleForceID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `ROLES` (`RoleID`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`ForceID`) REFERENCES `FORCES` (`ForceID`);

--
-- Constraints for table `USER_CREDENTIALS`
--
ALTER TABLE `USER_CREDENTIALS`
  ADD CONSTRAINT `user_credentials_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `USER_DOCUMENTS`
--
ALTER TABLE `USER_DOCUMENTS`
  ADD CONSTRAINT `FK_USER_DOCUMENTS_VerifiedBy` FOREIGN KEY (`VerifiedBy`) REFERENCES `UNIT_ADMIN` (`UnitAdminID`),
  ADD CONSTRAINT `user_documents_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `USERS` (`UserID`);

--
-- Constraints for table `WITNESS`
--
ALTER TABLE `WITNESS`
  ADD CONSTRAINT `witness_ibfk_1` FOREIGN KEY (`CaseID`) REFERENCES `CASE_FILE` (`CaseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

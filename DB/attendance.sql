-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Mar 20, 2020 at 03:46 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(130) NOT NULL,
  `admin_email` varchar(60) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `username`, `password`, `admin_email`) VALUES
(3, 'admin', 'admin', 'admin123', 'admin@a.com');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(20) NOT NULL,
  `course_incharge` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `description` varchar(60) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `course_incharge`, `department_id`, `description`, `active`) VALUES
(1, 'BCA', 45, 3, 'Bachelor in Computer Applications', 1);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(20) NOT NULL,
  `department_head` int(11) NOT NULL,
  `description` varchar(60) NOT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_name` (`department_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `department_head`, `description`) VALUES
(3, 'Computer Science', 0, 'computer'),
(4, 'Social Work', 0, 'Social'),
(6, 'IoT', 0, 'Internet of Things');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `student_id` bigint(11) NOT NULL,
  `subject` varchar(60) NOT NULL,
  `message` text NOT NULL,
  `date_of_feedback` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`feedback_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `teacher_id`, `student_id`, `subject`, `message`, `date_of_feedback`) VALUES
(1, 45, 21414817330, 'Hello', 'sdfsdf', '2020-03-03 09:20:07'),
(2, 45, 21414817330, 'Hello', 'sdfsdf', '2020-03-03 09:23:20'),
(3, 45, 21414817330, 'dftg', 'art', '2020-03-05 10:41:10');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RFID` varchar(60) NOT NULL,
  `time_scanned` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `current_scanned` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `RFID`, `current_scanned`) VALUES
(1, '1312166330', 1),
(2, '21414817330', 0),
(3, '1988920726', 0),
(4, '21420616226', 0),
(5, '1672152398', 0),
(6, '23019120826', 0),
(7, '13718980162', 0),
(8, '21421918226', 0),
(9, '21466330', 0),
(10, '16713325327', 0),
(11, '214206162', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notify`
--

DROP TABLE IF EXISTS `notify`;
CREATE TABLE IF NOT EXISTS `notify` (
  `notify_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `subject` varchar(60) NOT NULL,
  `message` text NOT NULL,
  `sent_to_teacher` int(11) DEFAULT NULL,
  `sent_to_student` int(11) DEFAULT NULL,
  `notify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notify_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notify`
--

INSERT INTO `notify` (`notify_id`, `student_id`, `teacher_id`, `admin_id`, `subject`, `message`, `sent_to_teacher`, `sent_to_student`, `notify_time`) VALUES
(1, NULL, 45, NULL, 'asd', '', NULL, 2147483647, '2020-02-29 14:25:28'),
(2, NULL, 45, NULL, 'asd', 'asdas', NULL, 2147483647, '2020-02-29 14:25:55'),
(3, NULL, NULL, 3, 'ssd', 'asdfasfdasf', NULL, 2147483647, '2020-03-03 07:03:23'),
(4, NULL, NULL, 3, 'Hello', 'dfsdf', 45, NULL, '2020-03-03 07:11:53'),
(5, NULL, NULL, 3, 'Hello', 'dfsdf', 45, NULL, '2020-03-03 07:12:58');

-- --------------------------------------------------------

--
-- Table structure for table `period`
--

DROP TABLE IF EXISTS `period`;
CREATE TABLE IF NOT EXISTS `period` (
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `timstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`from_date`,`to_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `student_id` bigint(20) NOT NULL,
  `flname` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contact_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email_id` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `gender` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mothers_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fathers_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `display_photo` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '/images/students/default.png',
  `course_id` int(11) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `rfid_status` int(11) NOT NULL,
  `mother_tongue` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fathers_contact_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fathers_address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `mothers_contact_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(11) NOT NULL,
  `date_of_join` date NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `students`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_attendance`
--

DROP TABLE IF EXISTS `student_attendance`;
CREATE TABLE IF NOT EXISTS `student_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) NOT NULL,
  `taptime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student_attendance`
--

INSERT INTO `student_attendance` (`id`, `student_id`, `taptime`, `type`) VALUES
(20, 21420616226, '2020-02-27 23:36:19', 'IN'),
(21, 21420616226, '2020-02-27 23:36:22', 'OUT'),
(22, 21420616226, '2020-02-27 23:36:26', 'IN'),
(23, 21420616226, '2020-02-27 23:41:39', 'OUT'),
(24, 21420616226, '2020-02-27 23:59:48', 'IN'),
(25, 21420616226, '2020-02-27 23:59:54', 'OUT'),
(26, 21420616226, '2020-02-28 00:05:22', 'IN'),
(27, 21420616226, '2020-02-28 00:05:55', 'IN'),
(28, 21420616226, '2020-02-28 11:14:07', 'IN'),
(29, 21420616226, '2020-02-28 11:14:18', 'IN'),
(30, 21420616226, '2020-02-28 11:14:24', 'IN'),
(31, 21420616226, '2020-02-28 11:14:30', 'IN'),
(32, 21420616226, '2020-02-28 11:15:42', 'IN'),
(33, 21420616226, '2020-02-28 11:15:45', 'IN'),
(34, 21420616226, '2020-02-28 11:16:12', 'IN'),
(35, 21420616226, '2020-02-28 11:16:16', 'IN'),
(36, 21420616226, '2020-02-28 11:16:17', 'IN'),
(37, 21420616226, '2020-02-28 11:16:18', 'IN'),
(38, 21420616226, '2020-02-28 11:18:04', 'OUT'),
(39, 21420616226, '2020-02-28 11:18:06', 'IN'),
(40, 21420616226, '2020-02-28 11:18:06', 'OUT'),
(41, 21420616226, '2020-02-28 11:18:07', 'IN'),
(42, 21420616226, '2020-02-28 11:18:07', 'OUT'),
(43, 21420616226, '2020-02-28 11:18:08', 'IN'),
(44, 21420616226, '2020-02-28 11:18:08', 'OUT'),
(45, 21420616226, '2020-02-28 11:18:16', 'IN'),
(46, 21420616226, '2020-02-28 11:18:32', 'OUT'),
(47, 21420616226, '2020-02-28 11:18:55', 'IN'),
(48, 21420616226, '2020-02-28 11:19:01', 'OUT'),
(49, 21420616226, '2020-02-28 11:19:06', 'IN'),
(50, 21420616226, '2020-02-28 11:27:48', 'OUT'),
(51, 21420616226, '2020-02-28 11:40:10', 'IN'),
(52, 21420616226, '2020-02-28 11:43:51', 'OUT'),
(53, 21420616226, '2020-02-28 11:45:13', 'IN'),
(54, 21420616226, '2020-02-28 11:45:19', 'OUT'),
(55, 21420616226, '2020-02-28 11:50:48', 'IN'),
(56, 21420616226, '2020-02-28 11:51:05', 'OUT'),
(57, 21420616226, '2020-02-28 11:51:11', 'IN'),
(58, 21420616226, '2020-02-28 11:52:55', 'OUT'),
(59, 21420616226, '2020-02-28 15:15:07', 'IN'),
(60, 21420616226, '2020-02-28 15:15:30', 'OUT'),
(61, 21420616226, '2020-02-28 15:17:24', 'IN'),
(62, 21420616226, '2020-02-28 15:18:01', 'OUT'),
(63, 21420616226, '2020-02-28 15:19:38', 'IN'),
(64, 21420616226, '2020-02-28 15:21:24', 'OUT'),
(65, 21420616226, '2020-02-28 15:22:04', 'IN'),
(66, 21414817330, '2020-02-28 15:25:18', 'IN'),
(67, 21414817330, '2020-02-29 21:35:13', 'IN'),
(68, 21414817330, '2020-02-29 21:35:34', 'OUT'),
(69, 21414817330, '2020-02-29 21:35:48', 'IN'),
(70, 21414817330, '2020-02-29 21:35:56', 'OUT'),
(71, 21414817330, '2020-02-29 21:36:01', 'IN'),
(72, 21414817330, '2020-02-29 21:36:09', 'OUT'),
(73, 21414817330, '2020-03-01 22:20:52', 'IN'),
(74, 21420616226, '2020-03-01 22:21:01', 'IN'),
(75, 21420616226, '2020-03-01 22:21:09', 'OUT'),
(76, 21420616226, '2020-03-01 22:23:50', 'IN'),
(77, 21414817330, '2020-03-02 12:43:44', 'IN'),
(78, 21414817330, '2020-03-02 12:43:58', 'OUT'),
(79, 21420616226, '2020-03-05 12:44:12', 'IN'),
(80, 21420616226, '2020-03-02 19:49:13', 'OUT'),
(81, 21420616226, '2020-03-26 19:49:13', 'IN'),
(82, 21420616226, '2020-03-09 19:49:13', 'OUT'),
(83, 21420616226, '2020-03-10 19:49:13', 'IN'),
(84, 21414817330, '2020-03-03 16:19:09', 'IN'),
(85, 21414817330, '2020-03-03 16:19:15', 'OUT'),
(86, 21420616226, '2020-03-03 16:19:44', 'IN'),
(87, 21420616226, '2020-03-03 16:19:52', 'OUT');

-- --------------------------------------------------------

--
-- Table structure for table `studies`
--

DROP TABLE IF EXISTS `studies`;
CREATE TABLE IF NOT EXISTS `studies` (
  `student_id` int(11) NOT NULL,
  `subject_code` varchar(10) NOT NULL,
  PRIMARY KEY (`student_id`,`subject_code`),
  KEY `subject_code` (`subject_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `subject_code` varchar(10) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`subject_code`),
  KEY `teacher_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_code`, `subject_name`, `teacher_id`, `course_id`) VALUES
('CS101', 'IoT', 45, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(130) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(6) NOT NULL,
  `department_id` int(11) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;



--
-- Constraints for dumped tables
--

--
-- Constraints for table `studies`
--
ALTER TABLE `studies`
  ADD CONSTRAINT `studies_ibfk_1` FOREIGN KEY (`subject_code`) REFERENCES `subject` (`subject_code`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2018 at 11:06 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ase2`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `a_verified` (IN `email_id` VARCHAR(100), IN `password_id` VARCHAR(100))  BEGIN  
    select * from cop_admin where cop_admin.email=email_id and cop_admin.password=password_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `course_assign_mix` (IN `fac_id` INT)  BEGIN  
    SELECT * 
    FROM cop_assignments INNER join cop_course 
    ON cop_course.course_id = cop_assignments.course_id_id 
    where cop_course.faculty_id_id=fac_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `f_verified` (IN `email_id` VARCHAR(100), IN `password_id` VARCHAR(100))  BEGIN  
    select * from cop_faculty where cop_faculty.email=email_id and cop_faculty.password=password_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_course_id` (IN `cou_id` INT)  BEGIN  
    select cop_course.course_name from cop_course where cop_course.course_id=cou_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mix_classreschedule_course` ()  BEGIN  
    select * from cop_classreschedules inner join cop_course ON cop_classreschedules.course_id_id = cop_course.course_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mix_mapper_preclassreq_course` (IN `stu_id` VARCHAR(20))  BEGIN  
    select * from cop_course join cop_s_c_mapper ON cop_course.course_id = cop_s_c_mapper.cid_id
    						JOIN cop_preclassreq ON cop_preclassreq.course_id_id = cop_course.course_id where cop_s_c_mapper.student_id=stu_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mix_preclassreq_course` (IN `fac_id` INT)  BEGIN  
    select * from cop_preclassreq inner join cop_course ON cop_preclassreq.course_id_id = cop_course.course_id where cop_course.faculty_id_id=fac_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add Token', 6, 'add_token'),
(22, 'Can change Token', 6, 'change_token'),
(23, 'Can delete Token', 6, 'delete_token'),
(24, 'Can view Token', 6, 'view_token'),
(25, 'Can add site', 7, 'add_site'),
(26, 'Can change site', 7, 'change_site'),
(27, 'Can delete site', 7, 'delete_site'),
(28, 'Can view site', 7, 'view_site'),
(29, 'Can add social application', 8, 'add_socialapp'),
(30, 'Can change social application', 8, 'change_socialapp'),
(31, 'Can delete social application', 8, 'delete_socialapp'),
(32, 'Can view social application', 8, 'view_socialapp'),
(33, 'Can add social account', 9, 'add_socialaccount'),
(34, 'Can change social account', 9, 'change_socialaccount'),
(35, 'Can delete social account', 9, 'delete_socialaccount'),
(36, 'Can view social account', 9, 'view_socialaccount'),
(37, 'Can add social application token', 10, 'add_socialtoken'),
(38, 'Can change social application token', 10, 'change_socialtoken'),
(39, 'Can delete social application token', 10, 'delete_socialtoken'),
(40, 'Can view social application token', 10, 'view_socialtoken'),
(41, 'Can add email address', 11, 'add_emailaddress'),
(42, 'Can change email address', 11, 'change_emailaddress'),
(43, 'Can delete email address', 11, 'delete_emailaddress'),
(44, 'Can view email address', 11, 'view_emailaddress'),
(45, 'Can add email confirmation', 12, 'add_emailconfirmation'),
(46, 'Can change email confirmation', 12, 'change_emailconfirmation'),
(47, 'Can delete email confirmation', 12, 'delete_emailconfirmation'),
(48, 'Can view email confirmation', 12, 'view_emailconfirmation'),
(49, 'Can add user', 13, 'add_customuser'),
(50, 'Can change user', 13, 'change_customuser'),
(51, 'Can delete user', 13, 'delete_customuser'),
(52, 'Can view user', 13, 'view_customuser'),
(53, 'Can add admin', 14, 'add_admin'),
(54, 'Can change admin', 14, 'change_admin'),
(55, 'Can delete admin', 14, 'delete_admin'),
(56, 'Can view admin', 14, 'view_admin'),
(57, 'Can add assignments', 15, 'add_assignments'),
(58, 'Can change assignments', 15, 'change_assignments'),
(59, 'Can delete assignments', 15, 'delete_assignments'),
(60, 'Can view assignments', 15, 'view_assignments'),
(61, 'Can add classreschedules', 16, 'add_classreschedules'),
(62, 'Can change classreschedules', 16, 'change_classreschedules'),
(63, 'Can delete classreschedules', 16, 'delete_classreschedules'),
(64, 'Can view classreschedules', 16, 'view_classreschedules'),
(65, 'Can add course', 17, 'add_course'),
(66, 'Can change course', 17, 'change_course'),
(67, 'Can delete course', 17, 'delete_course'),
(68, 'Can view course', 17, 'view_course'),
(69, 'Can add day_parts', 18, 'add_day_parts'),
(70, 'Can change day_parts', 18, 'change_day_parts'),
(71, 'Can delete day_parts', 18, 'delete_day_parts'),
(72, 'Can view day_parts', 18, 'view_day_parts'),
(73, 'Can add department', 19, 'add_department'),
(74, 'Can change department', 19, 'change_department'),
(75, 'Can delete department', 19, 'delete_department'),
(76, 'Can view department', 19, 'view_department'),
(77, 'Can add events', 20, 'add_events'),
(78, 'Can change events', 20, 'change_events'),
(79, 'Can delete events', 20, 'delete_events'),
(80, 'Can view events', 20, 'view_events'),
(81, 'Can add faculty', 21, 'add_faculty'),
(82, 'Can change faculty', 21, 'change_faculty'),
(83, 'Can delete faculty', 21, 'delete_faculty'),
(84, 'Can view faculty', 21, 'view_faculty'),
(85, 'Can add favourites', 22, 'add_favourites'),
(86, 'Can change favourites', 22, 'change_favourites'),
(87, 'Can delete favourites', 22, 'delete_favourites'),
(88, 'Can view favourites', 22, 'view_favourites'),
(89, 'Can add feeschedules', 23, 'add_feeschedules'),
(90, 'Can change feeschedules', 23, 'change_feeschedules'),
(91, 'Can delete feeschedules', 23, 'delete_feeschedules'),
(92, 'Can view feeschedules', 23, 'view_feeschedules'),
(93, 'Can add grades', 24, 'add_grades'),
(94, 'Can change grades', 24, 'change_grades'),
(95, 'Can delete grades', 24, 'delete_grades'),
(96, 'Can view grades', 24, 'view_grades'),
(97, 'Can add preclassreq', 25, 'add_preclassreq'),
(98, 'Can change preclassreq', 25, 'change_preclassreq'),
(99, 'Can delete preclassreq', 25, 'delete_preclassreq'),
(100, 'Can view preclassreq', 25, 'view_preclassreq'),
(101, 'Can add s_c_mapper', 26, 'add_s_c_mapper'),
(102, 'Can change s_c_mapper', 26, 'change_s_c_mapper'),
(103, 'Can delete s_c_mapper', 26, 'delete_s_c_mapper'),
(104, 'Can view s_c_mapper', 26, 'view_s_c_mapper'),
(105, 'Can add student', 27, 'add_student'),
(106, 'Can change student', 27, 'change_student'),
(107, 'Can delete student', 27, 'delete_student'),
(108, 'Can view student', 27, 'view_student'),
(109, 'Can add timetable', 28, 'add_timetable'),
(110, 'Can change timetable', 28, 'change_timetable'),
(111, 'Can delete timetable', 28, 'delete_timetable'),
(112, 'Can view timetable', 28, 'view_timetable');

-- --------------------------------------------------------

--
-- Table structure for table `cop_admin`
--

CREATE TABLE `cop_admin` (
  `slno` int(11) NOT NULL,
  `admin_id` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `mobilenum` varchar(12) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cop_admin`
--

INSERT INTO `cop_admin` (`slno`, `admin_id`, `dob`, `name`, `email`, `category`, `mobilenum`, `password`) VALUES
(1, 'A00', '0000-00-00', 'ALL', 'alladmin@iiits.in', 'all', '0000000000', 'all'),
(2, 'A01', '1999-06-30', 'Siribabu', 'siribabu.g@iiits.in', 'staff', '1234567890', 'siribabu');

-- --------------------------------------------------------

--
-- Table structure for table `cop_assignments`
--

CREATE TABLE `cop_assignments` (
  `slno` int(11) NOT NULL,
  `studentdegree` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `post_time` datetime(6) NOT NULL,
  `deadline` varchar(20) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `course_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cop_assignments`
--

INSERT INTO `cop_assignments` (`slno`, `studentdegree`, `type`, `name`, `post_time`, `deadline`, `description`, `course_id_id`) VALUES
(1, '3', 'assignment', 'assignment1', '2018-10-24 03:14:24.000000', '2018-10-28 11:00:00.', 'ase use-case diagrams', 2),
(2, '3', 'assignment', 'assignment2', '0000-00-00 00:00:00.000000', '2018-10-26 08:00:00.', 'ase test-case diagrams', 2),
(3, '3', 'assignment', 'assignment1', '0000-00-00 00:00:00.000000', '2018-10-29 00:00:00.', 'class problems practice', 3),
(4, 'All', 'Project', 'PC assignment -1', '2018-10-26 07:30:16.626272', '2018-11-08 01:59:00.', 'Code  a Hash tree', 3),
(5, 'All', 'Project', 'PC assignment -1', '2018-10-26 07:30:17.173765', '2018-11-08 01:59:00.', 'Code  a Hash tree', 3),
(6, 'ug', 'assignment', 'Assignment 10', '2018-11-10 10:51:55.213757', '2018-11-16  17:30', 'please complete the survey..', 4),
(7, 'ug', 'assignment', 'Assignment 10', '2018-11-10 15:38:54.632985', '2018-11-16  21:30', 'finish the assignment', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cop_classreschedules`
--

CREATE TABLE `cop_classreschedules` (
  `slno` int(11) NOT NULL,
  `post_time` datetime(6) NOT NULL,
  `old_time` varchar(100) NOT NULL,
  `new_time` varchar(100) NOT NULL,
  `old_date` varchar(100) NOT NULL,
  `new_date` varchar(100) NOT NULL,
  `old_room` int(11) NOT NULL,
  `new_room` varchar(100) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `course_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cop_classreschedules`
--

INSERT INTO `cop_classreschedules` (`slno`, `post_time`, `old_time`, `new_time`, `old_date`, `new_date`, `old_room`, `new_room`, `description`, `course_id_id`) VALUES
(1, '2018-10-24 03:14:24.000000', '09:00:00.000000', '10:00:00.000000', '2018-10-24', '2018-10-25', 113, '115', 'dueto placement interviews', 2),
(2, '2018-10-26 05:53:18.047522', 'd', 'e', 'a', 'sd', 314, 'f', 'g', 3),
(3, '2018-11-10 11:06:08.272087', '17:30', '18:30', '2018-11-11', '2018-11-13', 105, '105', 'change of room', 4);

-- --------------------------------------------------------

--
-- Table structure for table `cop_course`
--

CREATE TABLE `cop_course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `credits` int(11) NOT NULL,
  `faculty_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cop_course`
--

INSERT INTO `cop_course` (`course_id`, `course_name`, `credits`, `faculty_id_id`) VALUES
(1, 'all', 0, 1),
(2, 'ASE2', 4, 2),
(3, 'sds', 4, 3),
(4, 'You and the World', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cop_customuser`
--

CREATE TABLE `cop_customuser` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cop_customuser_groups`
--

CREATE TABLE `cop_customuser_groups` (
  `id` int(11) NOT NULL,
  `customuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cop_customuser_user_permissions`
--

CREATE TABLE `cop_customuser_user_permissions` (
  `id` int(11) NOT NULL,
  `customuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cop_day_parts`
--

CREATE TABLE `cop_day_parts` (
  `slno` int(11) NOT NULL,
  `slot_no` varchar(100) NOT NULL,
  `start_time` varchar(100) NOT NULL,
  `end_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cop_department`
--

CREATE TABLE `cop_department` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cop_department`
--

INSERT INTO `cop_department` (`dept_id`, `dept_name`) VALUES
(1, 'ALL'),
(2, 'CSE'),
(3, 'ECE');

-- --------------------------------------------------------

--
-- Table structure for table `cop_events`
--

CREATE TABLE `cop_events` (
  `slno` int(11) NOT NULL,
  `studentdegree` varchar(100) NOT NULL,
  `event_datetime` varchar(100) NOT NULL,
  `post_time` datetime(6) NOT NULL,
  `event_name` varchar(100) NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `course_id_id` int(11) NOT NULL,
  `department_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cop_events`
--

INSERT INTO `cop_events` (`slno`, `studentdegree`, `event_datetime`, `post_time`, `event_name`, `event_type`, `description`, `course_id_id`, `department_id_id`) VALUES
(1, 'btech', '2018-10-27', '2018-10-24 03:14:24.000000', 'trecking', 'co-curricular', 'There is a trek on sunday.', 1, 1),
(2, '2', 'today evening 6pm', '2018-10-25 18:00:00.000000', 'pc club', 'academic', 'come all', 1, 1),
(3, 'MS', '2018-10-18T20:30:02.000Z', '2018-10-26 03:30:03.653707', 'sahithihbderhyseg', 'hduhsdygw', 'srilekhahdusgyuhyg5', 3, 2),
(19, '', 'i', '2018-11-03 16:36:06.792029', 'Abhisarga...', 'cultural', 'everybody attend and enjoy', 1, 1),
(20, '', 'i', '2018-11-03 16:36:19.279379', 'Abhisarga...', 'cultural', 'everybody attend and enjoy', 1, 1),
(21, '', 'i', '2018-11-03 16:36:52.256735', 'Abhisarga...', 'cultural', 'Happy', 1, 1),
(22, '', 'i', '2018-11-03 16:36:58.400889', 'Abhisarga...', 'cultural', 'Happy', 1, 1),
(23, '', 'iooooooo', '2018-11-03 16:37:34.048826', 'Abhisarga...', 'cultural', 'Happy', 1, 1),
(24, '', 'iooooooo', '2018-11-03 16:40:34.050331', 'Abhisarga...', 'cultural', 'Happy', 1, 1),
(25, '', 'hehehehe', '2018-11-03 23:39:32.490661', 'Abhisarga...', 'cultural', 'Lalala', 1, 1),
(26, '', 'hehehehe', '2018-11-04 00:29:09.819978', 'Abhisarga...', 'cultural', 'Lalala', 1, 1),
(27, '', 'hehehehellllll', '2018-11-04 00:29:48.899157', 'Abhisarga...', 'cultural', 'Lalala', 1, 1),
(28, 'All', '2018-11-07', '2018-11-05 23:32:25.316779', 'Diwali', 'cultural', 'Everybody please attend and enjoy.', 1, 1),
(29, 'UG-4', '90:00', '2018-11-06 00:04:33.614712', 'Diwali', 'fdf', 'd', 1, 1),
(30, 'UG-1', '90:00', '2018-11-06 00:08:42.824158', 'Diwali', 'Diwali', 'Dj', 1, 1),
(31, 'All', '90:00', '2018-11-06 00:18:41.459187', 'fdf', 'fdf', 'hi', 2, 1),
(32, 'All', '{this.state.date + this.state.time}', '2018-11-06 00:23:09.127102', 'rreyter', 'cvxv', 'gy', 1, 3),
(33, 'All', '2018-09-08 04:30', '2018-11-06 00:27:35.153548', 'cvxv', 'rreyter', 'Come on time. else no Dj', 3, 1),
(34, 'All', '2018-09-08 16:30', '2018-11-06 00:28:35.185648', 'cvxv', 'rreyter', 'Come on time. else no Dj', 3, 1),
(35, 'All', 'undefined 16:05', '2018-11-06 00:35:29.700048', 'eeee', 'fdf', 'uiiiiiiiii', 1, 1),
(36, 'All', 'undefined 16:05', '2018-11-06 00:35:54.547549', 'eeee', 'fdf', 'uiiiiiiiii', 1, 1),
(37, 'All', '2018-11-22 undefined', '2018-11-06 00:36:50.102143', 'eeee', 'eeee', 'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj', 1, 1),
(38, 'All', 'undefined undefined', '2018-11-06 00:37:59.889288', 'eeee', 'cvxv', 'io', 3, 2),
(39, 'All', '2018-11-06 undefined', '2018-11-06 00:38:14.212555', 'eeee', 'cvxv', 'io', 3, 2),
(40, 'All', '2018-11-05T19:12:46.328Z', '2018-11-06 00:42:45.894713', 'Diwali', 'rreyter', 'hioooooooooooo', 2, 2),
(41, 'UG-1', '2018-11-05T19:21:07.194Z', '2018-11-06 00:51:06.801192', 'rreyter', 'rreyter', 'pp', 1, 1),
(42, 'UG-1', '2018-11-05T19:24:59.609Z', '2018-11-06 00:54:59.181312', 'rreyter', 'Dj', 'tyt', 1, 2),
(43, 'All', '2018-11-05T19:27:25.401Z', '2018-11-06 00:57:25.288278', 'fdf', 'eeee', 'hi', 2, 1),
(44, 'All', '2018-11-05T19:27:27.840Z', '2018-11-06 00:57:27.393675', 'fdf', 'eeee', 'hi', 2, 1),
(45, 'UG-4', '2018-11-05T19:51:59.197Z', '2018-11-06 01:21:58.745632', 'fdf', 'fdf', 'io', 2, 1),
(46, 'UG-1', '2018-11-08T18:32:28.790Z', '2018-11-09 00:02:30.393791', 'Diwali', 'rreyter', 'sdfghjksfdghjkl dfghjkdfghj dfghj', 2, 2),
(47, 'UG-2', '2018-12-12 + \' \' + 17:06', '2018-11-09 00:39:56.659057', 'IR workshop', 'Academics', 'asdfghjk sdfghjk', 2, 2),
(48, 'All', '2018-12-14   09:10', '2018-11-09 00:41:46.218852', 'Talk on search engine', 'Academics', 'dsfghjk sbfdyuasbd nsavdgasvd', 3, 1),
(49, 'All', '2018-12-14 , 12:30', '2018-11-09 00:47:16.367694', 'Diwali', 'eeee', 'sdfg sfdghk sdfghj asgdfgjkil esrdtfygui dfghj rthyj', 1, 1),
(50, 'UG-2', '2018-12-14 , 14:57', '2018-11-09 01:06:20.207812', 'Diwali', 'fdf', 'azewdrghbjk zsxdcfgvbh sxdcfgvb', 2, 2),
(51, 'All', '2018-12-27 , 01:03', '2018-11-09 01:23:04.484986', 'rreyter', 'fdf', 'etjdxyfyku', 1, 1),
(52, 'UG-2', '2018-12-06 , 21:07', '2018-11-10 15:13:19.463278', 'Diwali', 'Culturals', 'sthyuio gfhjk', 2, 2),
(53, 'All', '2018-11-22 , 07:07', '2018-11-10 15:18:06.165596', 'Diwali', 'Diwali', 'diwaliiii', 1, 1),
(54, 'All', '2018-11-23 , 21:03', '2018-11-10 15:31:12.849664', 'Abhisarga', 'Culturals', 'everyone attend the party', 3, 1),
(55, 'All', '2018-11-17 , 03:50', '2018-11-16 12:13:30.286779', 'Gol Gol', 'Crime', 'Murder plan..', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cop_faculty`
--

CREATE TABLE `cop_faculty` (
  `slno` int(11) NOT NULL,
  `faculty_id` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobilenum` varchar(12) NOT NULL,
  `deptid_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cop_faculty`
--

INSERT INTO `cop_faculty` (`slno`, `faculty_id`, `dob`, `email`, `password`, `name`, `mobilenum`, `deptid_id`) VALUES
(1, 'F00', '0000-00-00', 'all@iiits.in', 'all', 'all', '0000000000', 1),
(2, 'F01', '1957-06-30', 'umagarimella@iiits.in', 'i', 'uma', '9999999999', 2),
(3, 'F02', '1983-05-06', 'mainak.t@iiits.in', 'sds', 'mainak thakur', '2222222222', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cop_favourites`
--

CREATE TABLE `cop_favourites` (
  `slno` int(11) NOT NULL,
  `event_datetime` varchar(100) NOT NULL,
  `post_time` datetime(6) NOT NULL,
  `event_name` varchar(100) NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `event_id` int(11) NOT NULL,
  `student_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cop_favourites`
--

INSERT INTO `cop_favourites` (`slno`, `event_datetime`, `post_time`, `event_name`, `event_type`, `description`, `event_id`, `student_id_id`) VALUES
(21, '2018-10-27', '2018-10-24 03:14:24.000000', 'trecking', 'co-curricular', 'There is a trek on sunday.', 1, 1),
(23, '2018-10-18T20:30:02.000Z', '2018-10-26 03:30:03.653707', 'sahithihbderhyseg', 'hduhsdygw', 'srilekhahdusgyuhyg5', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cop_feeschedules`
--

CREATE TABLE `cop_feeschedules` (
  `slno` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `studentdegree` varchar(100) NOT NULL,
  `due_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cop_feeschedules`
--

INSERT INTO `cop_feeschedules` (`slno`, `title`, `description`, `studentdegree`, `due_date`) VALUES
(1, 'version 10.0.5', 'student fee: 1,00,000\n\nmess fee: 20,000', 'UG-1', '2018-11-22'),
(2, 'version 10.0.6', 'fdxg', 'UG-1', '2018-11-17'),
(3, 'version 10.0.6', 'fee: 10,00,000\n\nhostel fee: 20,000', 'UG-1', '2018-11-23');

-- --------------------------------------------------------

--
-- Table structure for table `cop_grades`
--

CREATE TABLE `cop_grades` (
  `slno` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `weightage` int(11) NOT NULL,
  `marks` int(11) NOT NULL,
  `total_marks` int(11) NOT NULL,
  `assignment_id_id` int(11) NOT NULL,
  `course_id_id` int(11) NOT NULL,
  `student_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cop_grades`
--

INSERT INTO `cop_grades` (`slno`, `type`, `weightage`, `marks`, `total_marks`, `assignment_id_id`, `course_id_id`, `student_id_id`) VALUES
(1, 'assignment', 5, 8, 10, 1, 2, 3),
(2, 'assignment', 10, 17, 20, 2, 2, 3),
(3, 'assignment', 15, 25, 30, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cop_preclassreq`
--

CREATE TABLE `cop_preclassreq` (
  `slno` int(11) NOT NULL,
  `post_time` datetime(6) NOT NULL,
  `need_day` varchar(100) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `course_id_id` int(11) NOT NULL,
  `faculty_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cop_preclassreq`
--

INSERT INTO `cop_preclassreq` (`slno`, `post_time`, `need_day`, `content`, `course_id_id`, `faculty_id_id`) VALUES
(1, '2018-10-25 08:20:00.000000', '2018-10-26', 'get your laptop today', 2, 2),
(3, '2018-10-26 06:37:09.339115', 'Thursday', 'Class schedule', 2, 2),
(4, '2018-11-10 11:20:38.210243', '2018-11-16 , 09:30', 'please bring your laptops and HDMI cables', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cop_student`
--

CREATE TABLE `cop_student` (
  `slno` int(11) NOT NULL,
  `student_id` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  `yoj` date NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mobilenum` varchar(12) NOT NULL,
  `studentdegree` varchar(100) NOT NULL,
  `grade` double NOT NULL,
  `deptid_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cop_student`
--

INSERT INTO `cop_student` (`slno`, `student_id`, `dob`, `yoj`, `name`, `email`, `password`, `mobilenum`, `studentdegree`, `grade`, `deptid_id`) VALUES
(1, 'S00', '0000-00-00', '0000-00-00', 'all', 'allstudent@iiits.in', 'all', '0000000000', 'all', 0, 1),
(2, 'S20160010055', '1999-06-30', '2016-08-08', 'N.Srilekha', 'srilekha.n16@iiits.in', 'srilekha123', '7331182668', '3', 0, 2),
(3, 'S20160020142', '1999-06-03', '2016-08-08', 'N.V.Vaishnavi', 'venkatavaishnavi.n16@iiits.in', 'assslv', '8374632025', '3', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cop_s_c_mapper`
--

CREATE TABLE `cop_s_c_mapper` (
  `slno` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `cid_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cop_s_c_mapper`
--

INSERT INTO `cop_s_c_mapper` (`slno`, `student_id`, `cid_id`) VALUES
(1, 'S20160010055', 2),
(2, 'S20160010055', 3);

-- --------------------------------------------------------

--
-- Table structure for table `cop_timetable`
--

CREATE TABLE `cop_timetable` (
  `slno` int(11) NOT NULL,
  `day` varchar(100) NOT NULL,
  `room_no` int(11) NOT NULL,
  `course_id_id` int(11) NOT NULL,
  `slot_no_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(11, 'account', 'emailaddress'),
(12, 'account', 'emailconfirmation'),
(1, 'admin', 'logentry'),
(9, 'allauth', 'socialaccount'),
(8, 'allauth', 'socialapp'),
(10, 'allauth', 'socialtoken'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(6, 'authtoken', 'token'),
(4, 'contenttypes', 'contenttype'),
(14, 'cop', 'admin'),
(15, 'cop', 'assignments'),
(16, 'cop', 'classreschedules'),
(17, 'cop', 'course'),
(13, 'cop', 'customuser'),
(18, 'cop', 'day_parts'),
(19, 'cop', 'department'),
(20, 'cop', 'events'),
(21, 'cop', 'faculty'),
(22, 'cop', 'favourites'),
(23, 'cop', 'feeschedules'),
(24, 'cop', 'grades'),
(25, 'cop', 'preclassreq'),
(27, 'cop', 'student'),
(26, 'cop', 's_c_mapper'),
(28, 'cop', 'timetable'),
(5, 'sessions', 'session'),
(7, 'sites', 'site');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-11-16 14:06:23.514617'),
(2, 'contenttypes', '0002_remove_content_type_name', '2018-11-16 14:06:24.359361'),
(3, 'auth', '0001_initial', '2018-11-16 14:06:24.633629'),
(4, 'auth', '0002_alter_permission_name_max_length', '2018-11-16 14:06:24.701566'),
(5, 'auth', '0003_alter_user_email_max_length', '2018-11-16 14:06:24.713414'),
(6, 'auth', '0004_alter_user_username_opts', '2018-11-16 14:06:24.726378'),
(7, 'auth', '0005_alter_user_last_login_null', '2018-11-16 14:06:24.739448'),
(8, 'auth', '0006_require_contenttypes_0002', '2018-11-16 14:06:24.744329'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2018-11-16 14:06:24.757396'),
(10, 'auth', '0008_alter_user_username_max_length', '2018-11-16 14:06:24.772322'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2018-11-16 14:06:24.787215'),
(12, 'cop', '0001_initial', '2018-11-16 14:06:26.966790'),
(13, 'account', '0001_initial', '2018-11-16 14:06:27.118456'),
(14, 'account', '0002_email_max_length', '2018-11-16 14:06:27.180223'),
(15, 'admin', '0001_initial', '2018-11-16 14:06:27.331815'),
(16, 'admin', '0002_logentry_remove_auto_add', '2018-11-16 14:06:27.371708'),
(17, 'admin', '0003_logentry_add_action_flag_choices', '2018-11-16 14:06:27.405811'),
(18, 'authtoken', '0001_initial', '2018-11-16 14:06:27.495377'),
(19, 'authtoken', '0002_auto_20160226_1747', '2018-11-16 14:06:27.660934'),
(20, 'sessions', '0001_initial', '2018-11-16 14:06:27.713794'),
(21, 'sites', '0001_initial', '2018-11-16 14:06:27.749744'),
(22, 'sites', '0002_alter_domain_unique', '2018-11-16 14:06:27.777622');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_emailaddress_user_id_2c513194_fk_cop_customuser_id` (`user_id`);

--
-- Indexes for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`);

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `cop_admin`
--
ALTER TABLE `cop_admin`
  ADD PRIMARY KEY (`slno`);

--
-- Indexes for table `cop_assignments`
--
ALTER TABLE `cop_assignments`
  ADD PRIMARY KEY (`slno`),
  ADD KEY `cop_assignments_course_id_id_c9557e4f_fk_cop_course_course_id` (`course_id_id`);

--
-- Indexes for table `cop_classreschedules`
--
ALTER TABLE `cop_classreschedules`
  ADD PRIMARY KEY (`slno`),
  ADD KEY `cop_classreschedules_course_id_id_a55fb5c3_fk_cop_cours` (`course_id_id`);

--
-- Indexes for table `cop_course`
--
ALTER TABLE `cop_course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `cop_course_faculty_id_id_75a70d8b_fk_cop_faculty_slno` (`faculty_id_id`);

--
-- Indexes for table `cop_customuser`
--
ALTER TABLE `cop_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `cop_customuser_groups`
--
ALTER TABLE `cop_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cop_customuser_groups_customuser_id_group_id_39656ce3_uniq` (`customuser_id`,`group_id`),
  ADD KEY `cop_customuser_groups_group_id_f65ae155_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `cop_customuser_user_permissions`
--
ALTER TABLE `cop_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cop_customuser_user_perm_customuser_id_permission_f6ac6a8e_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `cop_customuser_user__permission_id_7abb7fe8_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cop_day_parts`
--
ALTER TABLE `cop_day_parts`
  ADD PRIMARY KEY (`slno`);

--
-- Indexes for table `cop_department`
--
ALTER TABLE `cop_department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `cop_events`
--
ALTER TABLE `cop_events`
  ADD PRIMARY KEY (`slno`),
  ADD KEY `cop_events_course_id_id_c82ee9f5_fk_cop_course_course_id` (`course_id_id`),
  ADD KEY `cop_events_department_id_id_46d73acb_fk_cop_department_dept_id` (`department_id_id`);

--
-- Indexes for table `cop_faculty`
--
ALTER TABLE `cop_faculty`
  ADD PRIMARY KEY (`slno`),
  ADD KEY `cop_faculty_deptid_id_9a9f0d33_fk_cop_department_dept_id` (`deptid_id`);

--
-- Indexes for table `cop_favourites`
--
ALTER TABLE `cop_favourites`
  ADD PRIMARY KEY (`slno`),
  ADD KEY `cop_favourites_event_id_fcff41b7_fk_cop_events_slno` (`event_id`),
  ADD KEY `cop_favourites_student_id_id_3e12ca8b_fk_cop_student_slno` (`student_id_id`);

--
-- Indexes for table `cop_feeschedules`
--
ALTER TABLE `cop_feeschedules`
  ADD PRIMARY KEY (`slno`);

--
-- Indexes for table `cop_grades`
--
ALTER TABLE `cop_grades`
  ADD PRIMARY KEY (`slno`),
  ADD KEY `cop_grades_assignment_id_id_e561ec0f_fk_cop_assignments_slno` (`assignment_id_id`),
  ADD KEY `cop_grades_course_id_id_2b5ef50f_fk_cop_course_course_id` (`course_id_id`),
  ADD KEY `cop_grades_student_id_id_87cf3cde_fk_cop_student_slno` (`student_id_id`);

--
-- Indexes for table `cop_preclassreq`
--
ALTER TABLE `cop_preclassreq`
  ADD PRIMARY KEY (`slno`),
  ADD KEY `cop_preclassreq_course_id_id_ce84c151_fk_cop_course_course_id` (`course_id_id`),
  ADD KEY `cop_preclassreq_faculty_id_id_1df4991d_fk_cop_faculty_slno` (`faculty_id_id`);

--
-- Indexes for table `cop_student`
--
ALTER TABLE `cop_student`
  ADD PRIMARY KEY (`slno`),
  ADD KEY `cop_student_deptid_id_3d754e0b_fk_cop_department_dept_id` (`deptid_id`);

--
-- Indexes for table `cop_s_c_mapper`
--
ALTER TABLE `cop_s_c_mapper`
  ADD PRIMARY KEY (`slno`),
  ADD KEY `cop_s_c_mapper_cid_id_b32e6c75_fk_cop_course_course_id` (`cid_id`);

--
-- Indexes for table `cop_timetable`
--
ALTER TABLE `cop_timetable`
  ADD PRIMARY KEY (`slno`),
  ADD KEY `cop_timetable_course_id_id_ba91ae31_fk_cop_course_course_id` (`course_id_id`),
  ADD KEY `cop_timetable_slot_no_id_96a6f15e_fk_cop_day_parts_slno` (`slot_no_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_cop_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `cop_admin`
--
ALTER TABLE `cop_admin`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cop_assignments`
--
ALTER TABLE `cop_assignments`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cop_classreschedules`
--
ALTER TABLE `cop_classreschedules`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cop_course`
--
ALTER TABLE `cop_course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cop_customuser`
--
ALTER TABLE `cop_customuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cop_customuser_groups`
--
ALTER TABLE `cop_customuser_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cop_customuser_user_permissions`
--
ALTER TABLE `cop_customuser_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cop_day_parts`
--
ALTER TABLE `cop_day_parts`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cop_department`
--
ALTER TABLE `cop_department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cop_events`
--
ALTER TABLE `cop_events`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `cop_faculty`
--
ALTER TABLE `cop_faculty`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cop_favourites`
--
ALTER TABLE `cop_favourites`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `cop_feeschedules`
--
ALTER TABLE `cop_feeschedules`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cop_grades`
--
ALTER TABLE `cop_grades`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cop_preclassreq`
--
ALTER TABLE `cop_preclassreq`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cop_student`
--
ALTER TABLE `cop_student`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cop_s_c_mapper`
--
ALTER TABLE `cop_s_c_mapper`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cop_timetable`
--
ALTER TABLE `cop_timetable`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_cop_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `cop_customuser` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_cop_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `cop_customuser` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `cop_assignments`
--
ALTER TABLE `cop_assignments`
  ADD CONSTRAINT `cop_assignments_course_id_id_c9557e4f_fk_cop_course_course_id` FOREIGN KEY (`course_id_id`) REFERENCES `cop_course` (`course_id`);

--
-- Constraints for table `cop_classreschedules`
--
ALTER TABLE `cop_classreschedules`
  ADD CONSTRAINT `cop_classreschedules_course_id_id_a55fb5c3_fk_cop_cours` FOREIGN KEY (`course_id_id`) REFERENCES `cop_course` (`course_id`);

--
-- Constraints for table `cop_course`
--
ALTER TABLE `cop_course`
  ADD CONSTRAINT `cop_course_faculty_id_id_75a70d8b_fk_cop_faculty_slno` FOREIGN KEY (`faculty_id_id`) REFERENCES `cop_faculty` (`slno`);

--
-- Constraints for table `cop_customuser_groups`
--
ALTER TABLE `cop_customuser_groups`
  ADD CONSTRAINT `cop_customuser_group_customuser_id_56596323_fk_cop_custo` FOREIGN KEY (`customuser_id`) REFERENCES `cop_customuser` (`id`),
  ADD CONSTRAINT `cop_customuser_groups_group_id_f65ae155_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `cop_customuser_user_permissions`
--
ALTER TABLE `cop_customuser_user_permissions`
  ADD CONSTRAINT `cop_customuser_user__customuser_id_ebb13dbf_fk_cop_custo` FOREIGN KEY (`customuser_id`) REFERENCES `cop_customuser` (`id`),
  ADD CONSTRAINT `cop_customuser_user__permission_id_7abb7fe8_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `cop_events`
--
ALTER TABLE `cop_events`
  ADD CONSTRAINT `cop_events_course_id_id_c82ee9f5_fk_cop_course_course_id` FOREIGN KEY (`course_id_id`) REFERENCES `cop_course` (`course_id`),
  ADD CONSTRAINT `cop_events_department_id_id_46d73acb_fk_cop_department_dept_id` FOREIGN KEY (`department_id_id`) REFERENCES `cop_department` (`dept_id`);

--
-- Constraints for table `cop_faculty`
--
ALTER TABLE `cop_faculty`
  ADD CONSTRAINT `cop_faculty_deptid_id_9a9f0d33_fk_cop_department_dept_id` FOREIGN KEY (`deptid_id`) REFERENCES `cop_department` (`dept_id`);

--
-- Constraints for table `cop_favourites`
--
ALTER TABLE `cop_favourites`
  ADD CONSTRAINT `cop_favourites_event_id_fcff41b7_fk_cop_events_slno` FOREIGN KEY (`event_id`) REFERENCES `cop_events` (`slno`),
  ADD CONSTRAINT `cop_favourites_student_id_id_3e12ca8b_fk_cop_student_slno` FOREIGN KEY (`student_id_id`) REFERENCES `cop_student` (`slno`);

--
-- Constraints for table `cop_grades`
--
ALTER TABLE `cop_grades`
  ADD CONSTRAINT `cop_grades_assignment_id_id_e561ec0f_fk_cop_assignments_slno` FOREIGN KEY (`assignment_id_id`) REFERENCES `cop_assignments` (`slno`),
  ADD CONSTRAINT `cop_grades_course_id_id_2b5ef50f_fk_cop_course_course_id` FOREIGN KEY (`course_id_id`) REFERENCES `cop_course` (`course_id`),
  ADD CONSTRAINT `cop_grades_student_id_id_87cf3cde_fk_cop_student_slno` FOREIGN KEY (`student_id_id`) REFERENCES `cop_student` (`slno`);

--
-- Constraints for table `cop_preclassreq`
--
ALTER TABLE `cop_preclassreq`
  ADD CONSTRAINT `cop_preclassreq_course_id_id_ce84c151_fk_cop_course_course_id` FOREIGN KEY (`course_id_id`) REFERENCES `cop_course` (`course_id`),
  ADD CONSTRAINT `cop_preclassreq_faculty_id_id_1df4991d_fk_cop_faculty_slno` FOREIGN KEY (`faculty_id_id`) REFERENCES `cop_faculty` (`slno`);

--
-- Constraints for table `cop_student`
--
ALTER TABLE `cop_student`
  ADD CONSTRAINT `cop_student_deptid_id_3d754e0b_fk_cop_department_dept_id` FOREIGN KEY (`deptid_id`) REFERENCES `cop_department` (`dept_id`);

--
-- Constraints for table `cop_s_c_mapper`
--
ALTER TABLE `cop_s_c_mapper`
  ADD CONSTRAINT `cop_s_c_mapper_cid_id_b32e6c75_fk_cop_course_course_id` FOREIGN KEY (`cid_id`) REFERENCES `cop_course` (`course_id`);

--
-- Constraints for table `cop_timetable`
--
ALTER TABLE `cop_timetable`
  ADD CONSTRAINT `cop_timetable_course_id_id_ba91ae31_fk_cop_course_course_id` FOREIGN KEY (`course_id_id`) REFERENCES `cop_course` (`course_id`),
  ADD CONSTRAINT `cop_timetable_slot_no_id_96a6f15e_fk_cop_day_parts_slno` FOREIGN KEY (`slot_no_id`) REFERENCES `cop_day_parts` (`slno`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_cop_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `cop_customuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

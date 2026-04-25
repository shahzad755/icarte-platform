-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2017 at 09:29 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_type`
--

CREATE TABLE IF NOT EXISTS `account_type` (
  `ACCOUNT_TYPE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(50) NOT NULL,
  `LAST_UPDATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  `IS_ACTIVE` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ACCOUNT_TYPE_ID`),
  UNIQUE KEY `NAME_UNIQUE` (`NAME`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `account_type`
--

INSERT INTO `account_type` (`ACCOUNT_TYPE_ID`, `NAME`, `DESCRIPTION`, `DATE_CREATED`, `CREATED_BY`, `LAST_UPDATED`, `UPDATED_BY`, `VERSION`, `IS_ACTIVE`) VALUES
(1, 'Silver', 'Normal Default Account Mode', '2017-12-24 16:48:48', '1', '2017-01-15 18:48:39', '1', 3, b'1'),
(2, 'Gold', 'Gold Account Type', '2017-12-24 16:48:48', '1', '2017-07-03 03:35:58', 'admin', 5, b'1'),
(3, 'Platinum', 'Platinum Account Type', '2017-12-24 16:48:48', '1', '2017-01-14 16:10:31', '1', 2, b'1'),
(4, 'Test', 'sajdkas', '2017-01-14 16:09:18', '1', '2017-07-03 03:40:31', 'admin', 2, b'0'),
(6, 'Test 3', 'يبيسبسي', '2017-01-16 04:30:05', '1', '2017-07-03 03:40:15', 'admin', 4, b'0'),
(7, 'Test 4', NULL, '2017-01-16 04:30:30', '1', '2017-01-16 04:30:30', NULL, 0, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `addon`
--

CREATE TABLE IF NOT EXISTS `addon` (
  `ADDON_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  `DEFAULT_PRICE` decimal(7,2) NOT NULL,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `IMAGE_URL` varchar(255) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDTAED_BY` varchar(50) DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ADDON_ID`),
  KEY `FK_ADDON_REST` (`RESTAURANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `addon`
--

INSERT INTO `addon` (`ADDON_ID`, `IS_ACTIVE`, `DEFAULT_PRICE`, `RESTAURANT_ID`, `IMAGE_URL`, `DATE_CREATED`, `CREATED_BY`, `UPDTAED_BY`, `LAST_UPDATED`, `VERSION`) VALUES
(1, b'1', '12.00', 1, 'URL', '2017-01-15 18:48:39', '1', 'owner', '2017-07-05 05:14:01', 5),
(13, b'1', '50.00', 2, NULL, '2017-02-09 00:16:53', '1', '1', '2017-02-09 00:18:24', 1),
(14, b'1', '8.00', 1, NULL, '2017-02-22 19:45:52', 'staff1', 'owner', '2017-08-19 20:17:50', 3),
(15, b'1', '6.00', 1, NULL, '2017-05-27 23:11:36', 'admin', 'owner', '2017-07-05 05:08:05', 1),
(16, b'1', '10.00', 1, NULL, '2017-07-09 18:59:40', 'owner', 'owner', '2017-07-09 21:42:30', 1),
(17, b'1', '8.00', 1, NULL, '2017-07-09 19:01:45', 'owner', NULL, '2017-07-09 19:01:45', 0),
(18, b'1', '4.00', 1, NULL, '2017-07-09 21:41:35', 'owner', NULL, '2017-07-09 21:41:35', 0),
(19, b'1', '24.00', 1, NULL, '2017-07-09 22:37:42', 'owner', NULL, '2017-07-09 22:37:42', 0),
(20, b'1', '12.00', 1, NULL, '2017-07-09 22:38:30', 'owner', NULL, '2017-07-09 22:38:30', 0),
(21, b'1', '16.00', 1, NULL, '2017-07-13 21:52:08', 'owner', NULL, '2017-07-13 21:52:08', 0);

-- --------------------------------------------------------

--
-- Table structure for table `addon_translation`
--

CREATE TABLE IF NOT EXISTS `addon_translation` (
  `ADDON_TRNASLATION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `SHOW_DESCRIPTION` bit(1) DEFAULT b'0',
  `ADDON_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  `IS_DEFAULT` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ADDON_TRNASLATION_ID`),
  UNIQUE KEY `UK_ADDON_TRANS_LANG` (`LANGUAGE_ID`,`ADDON_ID`),
  UNIQUE KEY `unique_language_id` (`ADDON_ID`,`LANGUAGE_ID`),
  KEY `FK_ADDONTRA_LAN` (`LANGUAGE_ID`),
  KEY `FK_ADDONTRA_ADON_idx` (`ADDON_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `addon_translation`
--

INSERT INTO `addon_translation` (`ADDON_TRNASLATION_ID`, `TITLE`, `DESCRIPTION`, `LANGUAGE_ID`, `SHOW_DESCRIPTION`, `ADDON_ID`, `VERSION`, `IS_DEFAULT`) VALUES
(2, 'Chicken or Beef', 'Add Chicken or Beef', 1, b'1', 1, 10, b'1'),
(18, 'Pizza Toppings', 'Extra Cheesy for your taste buds', 1, b'1', 13, 0, b'1'),
(25, 'asd', NULL, 2, b'0', 13, 0, b'0'),
(27, 'سيشستسشني', NULL, 3, b'0', 13, 0, b'0'),
(33, 'دجاج أو لحم', 'إضافة دجاج أو لحم', 2, b'1', 1, 2, NULL),
(34, 'Chilli', 'Add Chilli', 1, b'1', 14, 1, b'1'),
(35, 'Guacamole', 'Add Guacamole', 1, b'1', 15, 1, b'1'),
(36, 'جواكامولي', 'إضافة جواكامولي', 2, b'1', 15, 1, NULL),
(37, 'Crispy Beef Bacon', 'Add Crispy beef bacon', 1, b'1', 16, 1, b'1'),
(38, 'لحم البيكون البقري', 'لإضافة لحم البيكون البقري', 2, b'1', 16, 0, NULL),
(39, 'NEW avocado slices', 'Add NEW avocado slices', 1, b'1', 17, 0, b'1'),
(40, 'جديد جربها مع قطع أفوكادو', 'لإضافة جديد جربها مع قطع أفوكادو', 2, b'1', 17, 0, NULL),
(41, 'Cheese', 'Add Cheese', 1, b'1', 18, 0, b'1'),
(42, 'الجبنة', 'جربها مع الجبنة', 2, b'1', 18, 0, NULL),
(43, 'تشىلي', 'لإضافة جديد جربها مع تشىلي', 2, b'1', 14, 0, NULL),
(44, 'Garlic and lime shrimp', 'Add Garlic and lime shrimp', 1, b'1', 19, 0, b'1'),
(45, 'روبيان مشوي', 'روبيان مشوي', 2, b'1', 19, 0, NULL),
(46, 'Sautéed Mushrooms or Peppercorn and Mushroom sauce', 'Sautéed Mushrooms or Peppercorn and Mushroom sauce', 1, b'1', 20, 0, b'1'),
(47, 'روبيان مشوي', 'مشروم مقلي أو صلصة المشروم أو صلصة البيبر', 2, b'1', 20, 0, NULL),
(48, 'Cadillac style with rice and black beans or Make it a Mushroom Jack Fajita', 'Try it as Cadillac style with rice and black beans or Make it a Mushroom Jack Fajita', 1, b'1', 21, 0, b'1'),
(49, 'إلضافة األرز والفاصولياء السوداء أوجربها مع مشروم جاك فاهيتا', 'إلضافة األرز والفاصولياء السوداء أوجربها مع مشروم جاك فاهيتا', 2, b'1', 21, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `ADDRESS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BRANCH_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `STREET` varchar(255) DEFAULT NULL,
  `AREA` varchar(255) DEFAULT NULL,
  `CITY_ID` bigint(20) DEFAULT NULL,
  `COUNTRY_ID` bigint(20) DEFAULT NULL,
  `PO_BOX` varchar(15) DEFAULT NULL,
  `PHONE1` varchar(20) DEFAULT NULL,
  `PHONE2` varchar(20) DEFAULT NULL,
  `PHONE3` varchar(20) DEFAULT NULL,
  `PHONE4` varchar(20) DEFAULT NULL,
  `LAT` varchar(25) DEFAULT NULL,
  `LON` varchar(25) DEFAULT NULL,
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  `EMAIL` varchar(100) DEFAULT NULL,
  `MAPS_URL` varchar(2000) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ADDRESS_ID`),
  KEY `FK_BRANCH_idx` (`BRANCH_ID`),
  KEY `FK_ADDR_COUNTRY_idx` (`COUNTRY_ID`),
  KEY `FK_fglr19v76iy4kjip6nf33q99b` (`CITY_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`ADDRESS_ID`, `BRANCH_ID`, `DESCRIPTION`, `STREET`, `AREA`, `CITY_ID`, `COUNTRY_ID`, `PO_BOX`, `PHONE1`, `PHONE2`, `PHONE3`, `PHONE4`, `LAT`, `LON`, `IS_ACTIVE`, `EMAIL`, `MAPS_URL`, `VERSION`) VALUES
(1, 1, 'Plaza Level, \r\nBahar Tower 1\r\nThe Walk, Al Sufouh Road\r\nHours: Saturdays to Thursdays\r\n11:00 a.m. to 11:00 p.m.\r\nFridays\r\n1:00 p.m. to 1:00 a.m', NULL, 'contact@chilis.com', 1, 1, NULL, '04-7059670', '04-4233814 (Fax)', NULL, NULL, '25.301099', '55.368659', b'0', 'contact@chilis.com', NULL, 2),
(6, 10, 'Mezzanine Level,\r\nKhalid Al Attar Building \r\nSaturdays to Thursdays 11:00 a.m. to 11:00 p.m. \r\nFridays 1:00 p.m. to 1:00 a.m', NULL, 'contact@chilis.com', 1, 1, NULL, '04-7059667', '04-3315749 (Fax)', NULL, NULL, '25.301099', '55.368659', b'1', 'contact@chilis.com', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE IF NOT EXISTS `branch` (
  `BRANCH_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MANAGER_ID` bigint(20) DEFAULT NULL,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `ADDRESS_ID_DEPRECATED` bigint(20) DEFAULT NULL,
  `IS_ACTIVE` bit(1) DEFAULT NULL,
  `BRANCH_CODE` varchar(50) DEFAULT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`BRANCH_ID`),
  UNIQUE KEY `UK_REST_BRANCH` (`RESTAURANT_ID`,`BRANCH_CODE`),
  UNIQUE KEY `unique_branch_code` (`RESTAURANT_ID`,`BRANCH_CODE`),
  KEY `FK_BR_REST` (`RESTAURANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`BRANCH_ID`, `MANAGER_ID`, `RESTAURANT_ID`, `ADDRESS_ID_DEPRECATED`, `IS_ACTIVE`, `BRANCH_CODE`, `NAME`, `DATE_CREATED`, `CREATED_BY`, `UPDATED_BY`, `LAST_UPDATED`, `VERSION`) VALUES
(1, NULL, 1, 1, b'1', 'BR_001', 'Jumeirah Beach Residence', '2017-01-16 06:31:00', 'admin', 'owner', '2017-07-04 09:11:10', 3),
(10, NULL, 1, NULL, b'1', 'BR_002', 'Sheikh Zayed Road', '2017-07-03 05:44:51', 'admin', 'owner', '2017-09-21 22:38:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE IF NOT EXISTS `configurations` (
  `configuration_id` bigint(9) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `account_id` mediumint(9) NOT NULL,
  `configuration_name` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `num_rows_generated` mediumint(9) DEFAULT '0',
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`configuration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`configuration_id`, `status`, `date_created`, `last_updated`, `account_id`, `configuration_name`, `content`, `num_rows_generated`, `VERSION`) VALUES
(1, 'private', '2017-03-16 00:00:00', '2017-03-19 00:00:00', 8294050, 'jVJNmlLqHgvrNYoKzkPscrExvhBqQDOkOfqJuQqkeXmqXXtaJRJfBXLyjtAXlCvTxgRxoTvDMyEVEmQoPEYZzmsOUPchFaCrNjEm', 'zysvAgUSpkXaGvLFMXKBPHpkENRTiRbiJkxEHuZDkmLfrVbDkLEGEbMgHNPQQUJhMBDKByEjotUNQbZuyDwHIXaqRKeEUTSgWTuWGTYoqkMpRLAlDHSIBocqOTBeUKwdkqiFzMJBlRNbmvVSGIgcKBOJFGEiPLEkeoDjvGoOODwQIZpZUCcPNCHJLxWLQOGxtRLMyxsk', 1907071, 1),
(2, 'private', '2017-03-18 00:00:00', '2017-03-20 00:00:00', 6469952, 'HjHGzlBaDjHdlvVAZqKgXRSxTJgSEwnYKZEUpNDjHEBEuTIrVPxGojWgVLYfCOHdawIlEpwDTmbQXYJtsyguuqrDioFEclbdOAel', 'fJVqCpOhfoeWGgpBQzNrzhdpdsrYIxlYtnwdPdGvSoFWALekKItHtIlWlvLBGxWytmWIXnrxNltqhZMChgpENboWkgaaOsJlgbWDDLsEiqKEdWISDnqNDyUyFaZdzMerXVbSnkhPvrQkjZuLhqXQSYgmJYbMjLBVBNJEnGBbzMoIwGumtxbJQEXIJhCghZyeaWrsqKVG', 4510762, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cuisine_translation`
--

CREATE TABLE IF NOT EXISTS `cuisine_translation` (
  `CUISINE_TRANS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CUISINE_TYPE_ID` bigint(20) NOT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `SHOW_DESCRIPTION` bit(1) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`CUISINE_TRANS_ID`),
  UNIQUE KEY `UNQ_CUSTRA` (`CUISINE_TYPE_ID`,`LANGUAGE_ID`),
  UNIQUE KEY `unique_language_id` (`CUISINE_TYPE_ID`,`LANGUAGE_ID`),
  KEY `FK_CUSTRA_LNG` (`LANGUAGE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `cuisine_translation`
--

INSERT INTO `cuisine_translation` (`CUISINE_TRANS_ID`, `TITLE`, `DESCRIPTION`, `CUISINE_TYPE_ID`, `LANGUAGE_ID`, `SHOW_DESCRIPTION`, `VERSION`) VALUES
(1, 'American Cuisine', 'American cuisines', 1, 1, b'1', 9),
(2, 'Lebanese', 'Lebanese description', 3, 1, NULL, 0),
(3, 'المطبخ الأمريكي', 'المطبخ الأمريكي', 1, 2, b'1', 0),
(4, 'Mexican', 'Mexican Cuisine.', 4, 1, NULL, 1),
(5, 'المكسيكي', 'المكسيكي', 4, 2, b'0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cuisine_type`
--

CREATE TABLE IF NOT EXISTS `cuisine_type` (
  `CUISINE_TYPE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `IMAGE_URL` varchar(255) DEFAULT NULL,
  `SMALL_ICON_URL` varchar(255) DEFAULT NULL,
  `ORIGINAL_IMAGE_NAME` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  `DATE_CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`CUISINE_TYPE_ID`),
  KEY `FK_CT_REST` (`RESTAURANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `cuisine_type`
--

INSERT INTO `cuisine_type` (`CUISINE_TYPE_ID`, `RESTAURANT_ID`, `IMAGE_URL`, `SMALL_ICON_URL`, `ORIGINAL_IMAGE_NAME`, `IS_ACTIVE`, `DATE_CREATED`, `CREATED_BY`, `UPDATED_BY`, `LAST_UPDATED`, `VERSION`) VALUES
(1, 1, '7f417cab-7899-4bd6-803a-08f6743a61a2.png', '7f417cab-7899-4bd6-803a-08f6743a61a2-thumbnail.png', 'Juice_Opt_2_60x60.png', b'1', '2017-01-16 06:31:00', 'admin', 'admin', '2017-03-11 03:54:15', 10),
(3, 2, NULL, NULL, NULL, b'1', '2017-03-11 01:59:25', 'admin', 'admin', '2017-03-11 03:39:02', 2),
(4, 1, '7516e366-4979-4e44-8853-99c42e046e9c.png', '7516e366-4979-4e44-8853-99c42e046e9c-thumbnail.png', 'Hot_Coffee_Opt_2_48x48.png', b'1', '2017-03-11 03:57:52', 'staff1', 'staff1', '2017-03-11 04:01:04', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `CUSTOMER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(20) NOT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `MOBILE` varchar(15) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `SUBSCRIBE_NEWS_LETTER` bit(1) DEFAULT b'0',
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  `LAST_UPDATED` datetime NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  `DATE_CREATED` datetime DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  UNIQUE KEY `CODE` (`CODE`),
  KEY `FK_CUST_REST` (`RESTAURANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUSTOMER_ID`, `CODE`, `FIRST_NAME`, `LAST_NAME`, `MOBILE`, `EMAIL`, `ADDRESS_ID`, `SUBSCRIBE_NEWS_LETTER`, `RESTAURANT_ID`, `IS_ACTIVE`, `LAST_UPDATED`, `CREATED_BY`, `UPDATED_BY`, `VERSION`, `DATE_CREATED`) VALUES
(1, '', 'DEFAULT CUSTOMER', NULL, '0509936162', '', NULL, NULL, 1, b'1', '2017-01-16 06:31:00', '0', NULL, 1, NULL),
(2, '3uDx8v33HZ', 'Mh', 'Ali', '0559866810', 'm.alie@armedialab.com', NULL, NULL, 1, b'1', '2017-09-19 23:58:00', 'SYSTEM', NULL, 0, NULL),
(3, '9dJUoVkQCo', 'SALIM', 'KHAN', '0516132123', 'imr@haokjd.com', NULL, b'0', 1, b'1', '2017-09-20 01:13:25', 'SYSTEM', NULL, 0, '2017-09-20 01:13:25'),
(4, 'QzT9GGC3Ed', 'SAHIL', 'MUNIR', '0556758901', 'sahil.munir@abc.com', NULL, b'0', 1, b'1', '2017-09-20 23:59:13', 'SYSTEM', NULL, 0, '2017-09-20 23:59:13');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_config`
--

CREATE TABLE IF NOT EXISTS `feedback_config` (
  `FEEDBACK_CONFIG_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `FEEDBACK_TYPE_ID` bigint(20) NOT NULL,
  `IS_REQUIRED` bit(1) DEFAULT b'0',
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  `DATE_CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`FEEDBACK_CONFIG_ID`),
  KEY `FK_FEEDBKCONF_REST` (`RESTAURANT_ID`),
  KEY `FK_FEEDBKCONF_FDBKTYPE` (`FEEDBACK_TYPE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `feedback_config`
--

INSERT INTO `feedback_config` (`FEEDBACK_CONFIG_ID`, `RESTAURANT_ID`, `FEEDBACK_TYPE_ID`, `IS_REQUIRED`, `DESCRIPTION`, `IS_ACTIVE`, `DATE_CREATED`, `CREATED_BY`, `UPDATED_BY`, `LAST_UPDATED`, `VERSION`) VALUES
(1, 1, 1, b'1', NULL, b'0', '2017-04-19 14:44:04', 'admin', 'owner', '2017-07-04 04:58:50', 13),
(2, 1, 1, b'0', NULL, b'0', '2017-04-19 14:44:47', 'admin', NULL, NULL, 1),
(3, 1, 1, b'0', NULL, b'0', '2017-04-19 14:45:09', 'admin', NULL, NULL, 1),
(4, 1, 1, b'0', NULL, b'0', '2017-04-19 20:31:25', 'admin', NULL, NULL, 1),
(5, 1, 2, b'1', NULL, b'0', '2017-04-19 20:32:09', 'admin', NULL, NULL, 1),
(6, 1, 2, b'0', NULL, b'0', '2017-04-19 20:33:04', 'admin', NULL, NULL, 1),
(7, 1, 3, b'0', NULL, b'0', '2017-04-19 20:38:37', 'admin', NULL, NULL, 1),
(8, 1, 3, b'1', NULL, b'0', '2017-04-19 20:39:14', 'admin', NULL, NULL, 1),
(9, 2, 1, b'1', NULL, b'0', '2017-04-19 20:42:18', 'admin', NULL, NULL, 1),
(10, 2, 1, b'1', NULL, b'0', '2017-04-19 20:42:58', 'admin', NULL, NULL, 1),
(11, 2, 3, b'1', NULL, b'0', '2017-04-19 20:42:58', 'admin', NULL, NULL, 1),
(30, 1, 1, b'0', NULL, b'1', '2017-07-04 06:34:27', 'owner', 'owner', '2017-07-04 06:39:50', 3),
(31, 1, 1, b'0', NULL, b'1', '2017-07-04 06:41:31', 'owner', 'owner', '2017-07-04 06:41:58', 2),
(32, 1, 1, b'1', NULL, b'1', '2017-07-04 06:42:29', 'owner', 'owner', '2017-09-18 20:24:15', 3),
(33, 1, 2, b'0', NULL, b'1', '2017-07-04 06:43:16', 'owner', NULL, '2017-07-04 06:43:16', 0),
(34, 1, 2, b'0', NULL, b'1', '2017-07-04 06:44:18', 'owner', 'owner', '2017-07-04 06:44:29', 2),
(35, 1, 3, b'0', NULL, b'1', '2017-07-04 06:45:42', 'owner', NULL, '2017-07-04 06:45:42', 0);

-- --------------------------------------------------------

--
-- Table structure for table `feedback_config_translation`
--

CREATE TABLE IF NOT EXISTS `feedback_config_translation` (
  `FEEDBACK_CONFIG_TRANSLATION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FEEDBACK_CONFIG_ID` bigint(20) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `SHOW_DESCRIPTION` bit(1) DEFAULT b'0',
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  `IS_DEFAULT` bit(1) DEFAULT b'0',
  PRIMARY KEY (`FEEDBACK_CONFIG_TRANSLATION_ID`),
  UNIQUE KEY `UK_FEEDBKCONF_TR` (`FEEDBACK_CONFIG_ID`,`LANGUAGE_ID`),
  UNIQUE KEY `unique_language_id` (`FEEDBACK_CONFIG_ID`,`LANGUAGE_ID`),
  KEY `FK_FEEDBKCONF_LANG` (`LANGUAGE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `feedback_config_translation`
--

INSERT INTO `feedback_config_translation` (`FEEDBACK_CONFIG_TRANSLATION_ID`, `FEEDBACK_CONFIG_ID`, `TITLE`, `DESCRIPTION`, `LANGUAGE_ID`, `SHOW_DESCRIPTION`, `VERSION`, `IS_DEFAULT`) VALUES
(1, 1, 'Question 1', 'Question 1 decription', 1, b'0', 4, b'1'),
(3, 2, 'Question 2', '', 1, b'0', 1, b'1'),
(4, 2, 'سؤال اثنين', '', 2, b'0', 1, b'0'),
(5, 3, 'Question 3', '', 1, b'0', 1, b'1'),
(6, 3, 'سؤال ثلاثة', '', 2, b'0', 1, b'0'),
(7, 4, 'Question 4', '', 1, b'0', 1, b'1'),
(8, 4, 'سؤال اربعة', '', 2, b'0', 1, b'0'),
(9, 5, 'Question 5', '', 1, b'0', 1, b'1'),
(10, 6, 'Question 6', '', 1, b'0', 1, b'1'),
(11, 7, 'Question 7', '', 1, b'0', 1, b'1'),
(12, 8, 'Question 8', '', 1, b'0', 1, b'1'),
(13, 9, 'Question 9', '', 1, b'0', 1, b'1'),
(14, 10, 'Question 10', '', 1, b'0', 1, b'1'),
(15, 11, 'Question 11', '', 1, b'0', 1, b'1'),
(22, 1, 'سوال واحد', NULL, 2, b'1', 1, b'0'),
(29, 30, 'Quantity of the food', 'Quantity of the food', 1, b'0', 1, b'1'),
(30, 30, 'كمية من المواد الغذائية', 'كمية من المواد الغذائية', 2, b'0', 0, b'0'),
(31, 31, 'Taste of the food', 'Taste of the food', 1, b'0', 1, b'1'),
(32, 31, 'جودة الطعام', 'جودة الطعام', 2, b'0', 0, b'0'),
(33, 32, 'Our Hospitality', 'Our Hospitality', 1, b'0', 1, b'1'),
(34, 32, 'حسن الضيافة', 'حسن الضيافة', 2, b'0', 0, b'0'),
(35, 33, 'How was your Overall experience?', 'How was your Overall experience', 1, b'0', 0, b'1'),
(36, 33, 'كيف كانت تجربتك؟', 'كيف كانت تجربتك؟', 2, b'0', 0, b'0'),
(37, 34, 'Service Timing', 'Service Timing', 1, b'0', 1, b'1'),
(38, 34, 'التوقيت الخدمة', 'التوقيت الخدمة', 2, b'0', 0, b'0'),
(39, 35, 'Would you like to give us any suggestions?', 'Would you like to give us any suggestions?', 1, b'0', 0, b'1'),
(40, 35, 'هل لديكم اقتراحات؟', 'هل لديكم اقتراحات؟', 2, b'0', 0, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_customer`
--

CREATE TABLE IF NOT EXISTS `feedback_customer` (
  `FEEDBACK_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  `CUSTOMER_CONTACT` varchar(255) DEFAULT NULL,
  `FEEDBACK_CONFIG_ID` bigint(20) DEFAULT NULL,
  `VALUE` varchar(1000) DEFAULT NULL,
  `FEEDBACK_CONTEXT` varchar(20) DEFAULT NULL,
  `REFERENCE_ID` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT CURRENT_TIMESTAMP,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`FEEDBACK_ID`),
  KEY `FK_FEEDBK_CUSTID` (`CUSTOMER_ID`),
  KEY `FK_FEEDBK_FEEDBK_CONF` (`FEEDBACK_CONFIG_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `feedback_customer`
--

INSERT INTO `feedback_customer` (`FEEDBACK_ID`, `CUSTOMER_ID`, `CUSTOMER_CONTACT`, `FEEDBACK_CONFIG_ID`, `VALUE`, `FEEDBACK_CONTEXT`, `REFERENCE_ID`, `DATE_CREATED`, `VERSION`) VALUES
(31, 3, '0516132123', 30, '1', 'GENERAL', NULL, '2017-09-20 01:13:25', 0),
(32, 3, '0516132123', 31, '3', 'GENERAL', NULL, '2017-09-20 01:13:25', 0),
(33, 3, '0516132123', 32, '2', 'GENERAL', NULL, '2017-09-20 01:13:25', 0),
(34, 3, '0516132123', 33, '1.0', 'GENERAL', NULL, '2017-09-20 01:13:25', 0),
(35, 3, '0516132123', 34, '4.0', 'GENERAL', NULL, '2017-09-20 01:13:25', 0),
(36, 3, '0516132123', 35, 'Test suggestion', 'GENERAL', NULL, '2017-09-20 01:13:25', 0),
(37, 4, '0556758901', 30, '1', 'GENERAL', NULL, '2017-09-20 23:59:13', 0),
(38, 4, '0556758901', 31, '1', 'GENERAL', NULL, '2017-09-20 23:59:13', 0),
(39, 4, '0556758901', 32, '1', 'GENERAL', NULL, '2017-09-20 23:59:13', 0),
(40, 4, '0556758901', 33, '5.0', 'GENERAL', NULL, '2017-09-20 23:59:13', 0),
(41, 4, '0556758901', 34, '3.0', 'GENERAL', NULL, '2017-09-20 23:59:13', 0),
(42, 4, '0556758901', 35, 'Testing suggestions', 'GENERAL', NULL, '2017-09-20 23:59:13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `feedback_type`
--

CREATE TABLE IF NOT EXISTS `feedback_type` (
  `FEEDBACK_TYPE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`FEEDBACK_TYPE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `feedback_type`
--

INSERT INTO `feedback_type` (`FEEDBACK_TYPE_ID`, `IS_ACTIVE`, `NAME`, `DESCRIPTION`, `DATE_CREATED`, `CREATED_BY`, `UPDATED_BY`, `LAST_UPDATED`, `VERSION`) VALUES
(1, b'1', 'Happiness Meter', 'Rating based on happiness (Happy, Sad, Neutral)', '2017-12-24 15:45:46', 'admin', NULL, NULL, 1),
(2, b'1', 'Star Rating', 'Rating based on stars', '2017-12-24 15:45:46', 'admin', NULL, NULL, 1),
(3, b'1', 'Comments', 'Free text comments, e.g. To collect feedback', '2017-12-24 15:45:46', 'admin', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE IF NOT EXISTS `ingredient` (
  `INGREDIENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IMAGE_URL` varchar(255) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `LAST_UPDATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` bigint(20) NOT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`INGREDIENT_ID`),
  KEY `FK_ING_REST` (`RESTAURANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`INGREDIENT_ID`, `IMAGE_URL`, `IS_ACTIVE`, `RESTAURANT_ID`, `LAST_UPDATED`, `CREATED_BY`, `UPDATED_BY`, `DATE_CREATED`, `VERSION`) VALUES
(1, 'Image URL', 1, 1, '2017-12-24 16:38:02', 0, NULL, '2017-12-24 16:38:02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_translation`
--

CREATE TABLE IF NOT EXISTS `ingredient_translation` (
  `INGREDIENT_TRANSLATION_ID` bigint(20) NOT NULL,
  `INGREDIENT_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `SHOW_DESCRIPTION` int(11) DEFAULT '0',
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`INGREDIENT_TRANSLATION_ID`),
  UNIQUE KEY `UNQ_INGTRAN` (`INGREDIENT_ID`,`LANGUAGE_ID`),
  KEY `FK_INGTRA_LNG` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ingredient_translation`
--

INSERT INTO `ingredient_translation` (`INGREDIENT_TRANSLATION_ID`, `INGREDIENT_ID`, `DESCRIPTION`, `LANGUAGE_ID`, `TITLE`, `SHOW_DESCRIPTION`, `VERSION`) VALUES
(1, 1, 'Eng Description', 1, 'Eng Title', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(45) NOT NULL,
  `MAPPING_CODE` varchar(75) DEFAULT NULL,
  `ITEM_CATEGORY_ID` bigint(20) NOT NULL,
  `CUISINE_TYPE_ID` bigint(20) DEFAULT NULL,
  `SPICE_TYPE_ID` bigint(20) DEFAULT NULL,
  `TAGS` varchar(500) DEFAULT NULL,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` bit(1) NOT NULL DEFAULT b'1',
  `IS_DELETED` bit(1) DEFAULT b'0',
  `DATE_CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(100) DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(100) DEFAULT NULL,
  `ACTION_TYPE` varchar(50) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  `IS_NEW` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ITEM_ID`),
  UNIQUE KEY `CODE` (`CODE`,`RESTAURANT_ID`),
  UNIQUE KEY `unique_code` (`RESTAURANT_ID`,`CODE`),
  KEY `FK_ITEM_CT` (`CUISINE_TYPE_ID`),
  KEY `FK_ITEM_SPICE` (`SPICE_TYPE_ID`),
  KEY `FK_ITEM_CAT` (`ITEM_CATEGORY_ID`,`CUISINE_TYPE_ID`,`SPICE_TYPE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=164 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ITEM_ID`, `CODE`, `MAPPING_CODE`, `ITEM_CATEGORY_ID`, `CUISINE_TYPE_ID`, `SPICE_TYPE_ID`, `TAGS`, `RESTAURANT_ID`, `IS_ACTIVE`, `IS_DELETED`, `DATE_CREATED`, `CREATED_BY`, `LAST_UPDATED`, `UPDATED_BY`, `ACTION_TYPE`, `VERSION`, `IS_NEW`) VALUES
(89, 'ASB-001', 'DGTYJUKHJB', 1, NULL, NULL, NULL, 1, b'0', b'0', '2017-03-23 20:23:40', 'admin', '2017-07-04 07:31:53', 'owner', NULL, 6, b'0'),
(90, 'IT002', NULL, 1, NULL, NULL, NULL, 1, b'0', b'0', '2017-04-20 21:07:14', 'admin', '2017-08-19 18:27:51', 'owner', NULL, 4, b'0'),
(91, 'APP_001', NULL, 1, 1, 2, NULL, 1, b'1', b'0', '2017-07-04 07:29:03', 'owner', '2017-07-04 07:52:55', 'owner', NULL, 2, b'0'),
(92, 'APP_002', NULL, 1, 1, 2, NULL, 1, b'1', b'0', '2017-07-05 05:18:03', 'owner', '2017-07-09 20:52:05', 'owner', NULL, 1, b'0'),
(93, 'APP_003', NULL, 1, 1, 1, NULL, 1, b'1', b'0', '2017-07-05 05:21:08', 'owner', '2017-07-05 05:21:33', 'owner', NULL, 1, b'0'),
(94, 'APP_004', NULL, 1, 1, 1, NULL, 1, b'1', b'0', '2017-07-05 06:09:32', 'owner', '2017-07-09 20:36:30', 'owner', NULL, 1, b'0'),
(95, 'APP_005', NULL, 1, 1, 1, NULL, 1, b'1', b'0', '2017-07-08 11:55:42', 'owner', '2017-07-09 21:01:27', 'owner', NULL, 1, b'0'),
(96, 'APP_006', NULL, 1, 1, 1, NULL, 1, b'1', b'0', '2017-07-08 11:58:38', 'owner', '2017-07-09 20:38:30', 'owner', NULL, 3, b'0'),
(97, 'APP_007', NULL, 1, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 01:03:27', 'owner', '2017-07-09 01:03:27', NULL, NULL, 0, b'0'),
(98, 'APP_008', NULL, 1, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 01:16:42', 'owner', '2017-07-09 01:17:34', 'owner', NULL, 1, b'0'),
(99, 'SNS_001', NULL, 7, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 02:06:48', 'owner', '2017-07-09 02:14:16', 'owner', NULL, 2, b'0'),
(100, 'SNS_002', NULL, 7, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 02:13:07', 'owner', '2017-07-09 02:13:07', NULL, NULL, 0, b'0'),
(101, 'SNS_003', NULL, 7, 1, NULL, NULL, 1, b'1', b'0', '2017-07-09 02:17:38', 'owner', '2017-07-09 02:17:38', NULL, NULL, 0, b'0'),
(102, 'SNS_004', NULL, 7, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 16:39:38', 'owner', '2017-07-09 16:41:19', 'owner', NULL, 1, b'0'),
(103, 'SNS_005', NULL, 7, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 16:42:15', 'owner', '2017-07-09 16:42:15', NULL, NULL, 0, b'0'),
(104, 'SNS_006', NULL, 7, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 16:44:15', 'owner', '2017-07-09 16:44:15', NULL, NULL, 0, b'0'),
(105, 'SNS_007', NULL, 7, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 16:51:20', 'owner', '2017-07-09 16:52:33', 'owner', NULL, 2, b'0'),
(106, 'SNS_008', NULL, 7, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 16:54:19', 'owner', '2017-07-09 16:54:19', NULL, NULL, 0, b'0'),
(107, 'SAN_001', NULL, 9, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 17:38:12', 'owner', '2017-07-09 17:38:12', NULL, NULL, 0, b'0'),
(108, 'SAN_002', NULL, 9, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 18:44:29', 'owner', '2017-09-06 20:44:07', 'owner', NULL, 1, b'0'),
(109, 'SAN_003', NULL, 9, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 18:46:35', 'owner', '2017-07-09 18:46:35', NULL, NULL, 0, b'0'),
(110, 'SAN_004', NULL, 9, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 18:48:25', 'owner', '2017-07-09 18:48:25', NULL, NULL, 0, b'0'),
(111, 'SAN_005', NULL, 9, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 18:57:48', 'owner', '2017-07-09 18:57:48', NULL, NULL, 0, b'0'),
(112, 'BIG_001', NULL, 4, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 19:40:37', 'owner', '2017-07-09 19:43:20', 'owner', NULL, 1, b'0'),
(113, 'BIG_002', NULL, 4, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 19:44:21', 'owner', '2017-07-09 19:51:52', 'owner', NULL, 1, b'0'),
(114, 'BIG_003', NULL, 4, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 21:05:01', 'owner', '2017-07-09 21:05:01', NULL, NULL, 0, b'0'),
(115, 'BIG_004', NULL, 4, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 21:35:11', 'owner', '2017-07-09 21:35:11', NULL, NULL, 0, b'0'),
(116, 'BIG_005', NULL, 4, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 21:38:14', 'owner', '2017-07-09 21:38:14', NULL, NULL, 0, b'0'),
(117, 'BIG_006', NULL, 4, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 22:21:07', 'owner', '2017-07-09 22:21:07', NULL, NULL, 0, b'0'),
(118, 'STK_001', NULL, 8, 1, 1, NULL, 1, b'1', b'0', '2017-07-09 22:36:43', 'owner', '2017-07-09 22:36:43', NULL, NULL, 0, b'0'),
(119, 'STK_002', NULL, 8, 1, 1, NULL, 1, b'1', b'0', '2017-07-10 21:53:03', 'owner', '2017-07-10 21:53:03', NULL, NULL, 0, b'0'),
(120, 'STK_003', NULL, 8, 1, 1, NULL, 1, b'1', b'0', '2017-07-10 21:57:25', 'owner', '2017-07-10 21:57:25', NULL, NULL, 0, b'0'),
(121, 'STK_004', NULL, 8, 1, 1, NULL, 1, b'1', b'0', '2017-07-10 22:00:18', 'owner', '2017-07-10 22:01:36', 'owner', NULL, 1, b'0'),
(122, 'STK_005', NULL, 8, 1, 1, NULL, 1, b'1', b'0', '2017-07-10 22:03:31', 'owner', '2017-07-10 22:04:48', 'owner', NULL, 1, b'0'),
(123, 'SWP_001', NULL, 10, 1, 1, NULL, 1, b'1', b'0', '2017-07-10 22:08:51', 'owner', '2017-07-10 22:08:51', NULL, NULL, 0, b'0'),
(124, 'SWP_002', NULL, 10, 1, 1, NULL, 1, b'1', b'0', '2017-07-10 22:12:18', 'owner', '2017-07-10 22:12:18', NULL, NULL, 0, b'0'),
(125, 'SWP_003', NULL, 10, 1, 1, NULL, 1, b'1', b'0', '2017-07-10 22:14:40', 'owner', '2017-07-10 22:15:51', 'owner', NULL, 1, b'0'),
(126, 'SWP_004', NULL, 10, 1, 1, NULL, 1, b'1', b'0', '2017-07-10 22:16:49', 'owner', '2017-07-10 22:16:49', NULL, NULL, 0, b'0'),
(127, 'SWP_005', NULL, 10, 1, 1, NULL, 1, b'1', b'0', '2017-07-11 00:29:30', 'owner', '2017-07-11 00:29:30', NULL, NULL, 0, b'0'),
(128, 'SWP_006', NULL, 10, 1, 1, NULL, 1, b'1', b'0', '2017-07-11 00:37:02', 'owner', '2017-07-11 00:37:02', NULL, NULL, 0, b'0'),
(129, 'SWF_001', NULL, 11, 1, 1, NULL, 1, b'1', b'0', '2017-07-13 20:33:16', 'owner', '2017-07-13 20:33:16', NULL, NULL, 0, b'0'),
(130, 'SWF_002', NULL, 11, 1, 1, NULL, 1, b'1', b'0', '2017-07-13 20:35:32', 'owner', '2017-07-13 20:35:32', NULL, NULL, 0, b'0'),
(131, 'SWF_003', NULL, 11, 1, 1, NULL, 1, b'1', b'0', '2017-07-13 20:37:34', 'owner', '2017-07-13 20:37:34', NULL, NULL, 0, b'0'),
(132, 'SWF_004', NULL, 11, 1, 1, NULL, 1, b'1', b'0', '2017-07-13 20:40:11', 'owner', '2017-07-13 20:40:11', NULL, NULL, 0, b'0'),
(133, 'SWF_005', NULL, 11, 1, 1, NULL, 1, b'1', b'0', '2017-07-13 20:42:20', 'owner', '2017-07-13 20:42:20', NULL, NULL, 0, b'0'),
(134, 'SWF_006', NULL, 11, 1, 1, NULL, 1, b'1', b'0', '2017-07-13 20:44:03', 'owner', '2017-07-13 20:44:03', NULL, NULL, 0, b'0'),
(135, 'SWF_007', NULL, 11, 1, 1, NULL, 1, b'1', b'0', '2017-07-13 21:25:49', 'owner', '2017-07-13 21:45:30', 'owner', NULL, 1, b'0'),
(136, 'SWF_008', NULL, 11, 1, 1, NULL, 1, b'1', b'0', '2017-07-13 21:53:50', 'owner', '2017-07-13 21:53:50', NULL, NULL, 0, b'0'),
(137, 'CHS_001', NULL, 12, 1, 1, NULL, 1, b'1', b'0', '2017-07-13 23:13:51', 'owner', '2017-07-13 23:13:51', NULL, NULL, 0, b'0'),
(138, 'CHS_002', NULL, 12, 1, 1, NULL, 1, b'1', b'0', '2017-09-06 22:31:03', 'owner', '2017-09-06 22:31:03', NULL, NULL, 0, b'0'),
(139, 'CHS_003', NULL, 12, 1, 1, NULL, 1, b'1', b'0', '2017-09-06 22:42:44', 'owner', '2017-09-06 22:42:44', NULL, NULL, 0, b'0'),
(140, 'CHS_004', NULL, 12, 1, 2, NULL, 1, b'1', b'0', '2017-09-06 22:46:06', 'owner', '2017-09-06 22:46:06', NULL, NULL, 0, b'0'),
(141, 'CHS_005', NULL, 12, 1, 1, NULL, 1, b'1', b'0', '2017-09-06 22:48:50', 'owner', '2017-09-06 22:48:50', NULL, NULL, 0, b'0'),
(142, 'CHS_006', NULL, 12, 1, 1, NULL, 1, b'1', b'0', '2017-09-06 22:50:43', 'owner', '2017-09-06 22:50:43', NULL, NULL, 0, b'0'),
(143, 'CHS_007', NULL, 12, 1, 1, NULL, 1, b'1', b'0', '2017-09-06 22:52:42', 'owner', '2017-09-06 22:52:42', NULL, NULL, 0, b'0'),
(144, 'CHS_008', NULL, 12, 1, 1, NULL, 1, b'1', b'0', '2017-09-06 22:55:39', 'owner', '2017-09-06 22:55:39', NULL, NULL, 0, b'0'),
(145, 'CHS_009', NULL, 12, 1, 1, NULL, 1, b'1', b'0', '2017-09-06 22:58:14', 'owner', '2017-09-06 22:58:14', NULL, NULL, 0, b'0'),
(146, 'SW_001', NULL, 13, 1, 1, NULL, 1, b'1', b'0', '2017-09-06 23:08:37', 'owner', '2017-09-06 23:08:37', NULL, NULL, 0, b'0'),
(147, 'SW_002', NULL, 13, 1, 1, NULL, 1, b'1', b'0', '2017-09-06 23:10:44', 'owner', '2017-09-06 23:10:44', NULL, NULL, 0, b'0'),
(148, 'SW_003', NULL, 13, 1, 1, NULL, 1, b'1', b'0', '2017-09-06 23:13:25', 'owner', '2017-09-06 23:13:25', NULL, NULL, 0, b'0'),
(149, 'SW_004', NULL, 13, 1, 1, NULL, 1, b'1', b'0', '2017-09-06 23:15:22', 'owner', '2017-09-06 23:15:22', NULL, NULL, 0, b'0'),
(150, 'SW_005', NULL, 13, 1, 1, NULL, 1, b'1', b'0', '2017-09-06 23:17:24', 'owner', '2017-09-06 23:17:24', NULL, NULL, 0, b'0'),
(151, 'SW_006', NULL, 13, 1, 1, NULL, 1, b'1', b'0', '2017-09-06 23:19:27', 'owner', '2017-09-06 23:19:27', NULL, NULL, 0, b'0'),
(152, 'BEV_001', NULL, 14, NULL, NULL, NULL, 1, b'1', b'0', '2017-09-06 23:22:14', 'owner', '2017-09-06 23:22:14', NULL, NULL, 0, b'0'),
(153, 'BEV_002', NULL, 14, NULL, NULL, NULL, 1, b'1', b'0', '2017-09-06 23:24:04', 'owner', '2017-09-06 23:24:04', NULL, NULL, 0, b'0'),
(154, 'BEV_003', NULL, 14, NULL, NULL, NULL, 1, b'1', b'0', '2017-09-06 23:25:10', 'owner', '2017-09-06 23:25:10', NULL, NULL, 0, b'0'),
(155, 'BEV_004', NULL, 14, NULL, NULL, NULL, 1, b'1', b'0', '2017-09-06 23:26:39', 'owner', '2017-09-06 23:28:41', 'owner', NULL, 2, b'0'),
(157, 'BEV_005', NULL, 14, NULL, NULL, NULL, 1, b'1', b'0', '2017-09-06 23:27:39', 'owner', '2017-09-06 23:27:39', NULL, NULL, 0, b'0'),
(158, 'BEV_006', NULL, 14, NULL, NULL, NULL, 1, b'1', b'0', '2017-09-06 23:31:24', 'owner', '2017-09-06 23:31:24', NULL, NULL, 0, b'0'),
(159, 'BEV_007', NULL, 14, NULL, NULL, NULL, 1, b'1', b'0', '2017-09-06 23:32:34', 'owner', '2017-09-06 23:32:34', NULL, NULL, 0, b'0'),
(160, 'BEV_008', NULL, 14, NULL, NULL, NULL, 1, b'1', b'0', '2017-09-06 23:33:52', 'owner', '2017-09-06 23:33:52', NULL, NULL, 0, b'0'),
(161, 'BEV_009', NULL, 14, NULL, NULL, NULL, 1, b'1', b'0', '2017-09-06 23:35:26', 'owner', '2017-09-06 23:35:26', NULL, NULL, 0, b'0'),
(162, 'BEV_10', NULL, 14, NULL, NULL, NULL, 1, b'1', b'0', '2017-09-06 23:37:00', 'owner', '2017-09-06 23:37:00', NULL, NULL, 0, b'0'),
(163, 'BEV_11', NULL, 14, NULL, NULL, NULL, 1, b'1', b'0', '2017-09-06 23:38:46', 'owner', '2017-09-06 23:38:46', NULL, NULL, 0, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `item_addon`
--

CREATE TABLE IF NOT EXISTS `item_addon` (
  `ITEM_ADDON_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ADDON_ID` bigint(20) NOT NULL,
  `ITEM_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) NOT NULL,
  `IS_DELETED` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ITEM_ADDON_ID`),
  KEY `IS_DELETED` (`IS_DELETED`),
  KEY `FK_ITEMADDON_ADDON_idx` (`ADDON_ID`),
  KEY `FK_ITEMADDON_ITEM_idx` (`ITEM_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=192 ;

--
-- Dumping data for table `item_addon`
--

INSERT INTO `item_addon` (`ITEM_ADDON_ID`, `ADDON_ID`, `ITEM_ID`, `VERSION`, `IS_DELETED`) VALUES
(160, 13, 89, 0, b'1'),
(161, 14, 89, 0, b'1'),
(163, 13, 89, 0, b'1'),
(164, 14, 89, 0, b'1'),
(165, 1, 89, 0, b'1'),
(166, 13, 89, 0, b'1'),
(167, 14, 89, 0, b'1'),
(168, 1, 89, 0, b'1'),
(169, 1, 90, 0, b'0'),
(170, 1, 89, 0, b'0'),
(171, 13, 89, 0, b'0'),
(172, 14, 89, 0, b'0'),
(173, 1, 96, 0, b'0'),
(174, 15, 96, 0, b'0'),
(175, 16, 111, 0, b'0'),
(176, 17, 111, 0, b'0'),
(177, 16, 117, 0, b'0'),
(178, 17, 117, 0, b'0'),
(179, 18, 117, 0, b'0'),
(180, 19, 118, 0, b'0'),
(181, 20, 118, 0, b'0'),
(182, 19, 119, 0, b'0'),
(183, 20, 119, 0, b'0'),
(184, 19, 120, 0, b'0'),
(185, 20, 120, 0, b'0'),
(186, 19, 121, 0, b'0'),
(187, 20, 121, 0, b'0'),
(188, 15, 132, 0, b'0'),
(189, 21, 135, 0, b'0'),
(190, 1, 91, 0, b'1'),
(191, 14, 91, 0, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE IF NOT EXISTS `item_category` (
  `ITEM_CATEGORY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IMAGE_URL` varchar(255) DEFAULT NULL,
  `SMALL_ICON_URL` varchar(255) DEFAULT NULL,
  `ORIGINAL_IMAGE_NAME` varchar(255) DEFAULT NULL,
  `PARENT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  `TAGS` varchar(500) DEFAULT NULL,
  `MENU_ID` bigint(20) NOT NULL,
  `AVAILABLE_DURATION_START` datetime DEFAULT NULL,
  `AVAILABLE_DURATION_END` datetime DEFAULT NULL,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `MAPPING_CODE` varchar(75) DEFAULT NULL,
  `IS_ACTIVE` bit(1) DEFAULT NULL,
  `DISPLAY_ORDER` int(4) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(50) NOT NULL,
  `LAST_UPDATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `ACTION_TYPE` varchar(50) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ITEM_CATEGORY_ID`),
  KEY `FK_ITEMCAT_MENU_idx` (`MENU_ID`),
  KEY `FK_ITEMCAT_REST_idx` (`RESTAURANT_ID`),
  KEY `FK_skk02s77ypl4qdwarrupbyb5y` (`PARENT_CATEGORY_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `item_category`
--

INSERT INTO `item_category` (`ITEM_CATEGORY_ID`, `IMAGE_URL`, `SMALL_ICON_URL`, `ORIGINAL_IMAGE_NAME`, `PARENT_CATEGORY_ID`, `TAGS`, `MENU_ID`, `AVAILABLE_DURATION_START`, `AVAILABLE_DURATION_END`, `RESTAURANT_ID`, `MAPPING_CODE`, `IS_ACTIVE`, `DISPLAY_ORDER`, `DATE_CREATED`, `CREATED_BY`, `LAST_UPDATED`, `UPDATED_BY`, `ACTION_TYPE`, `VERSION`) VALUES
(1, '11efb28d-a572-4fc9-9305-92a50459cd69.jpg', '11efb28d-a572-4fc9-9305-92a50459cd69-thumbnail.png', '1.jpg', NULL, 'spicy', 1, '2017-02-19 01:00:00', '2017-02-19 01:07:00', 1, NULL, b'1', 1, '2017-12-24 17:32:16', '0', '2017-07-03 20:33:24', 'owner', NULL, 40),
(4, 'f13d8aa1-d774-4c38-b9f2-c529c8542aad.jpg', 'f13d8aa1-d774-4c38-b9f2-c529c8542aad-thumbnail.png', '4.jpg', NULL, NULL, 1, '2017-01-05 13:00:00', '2017-02-09 13:16:00', 1, NULL, b'1', 4, '2017-02-12 22:07:40', '1', '2017-07-03 20:42:02', 'owner', NULL, 24),
(5, 'ece87a3a-76a6-4d26-bd30-53082bddd2ac.jpg', 'ece87a3a-76a6-4d26-bd30-53082bddd2ac-thumbnail.png', 'BIG_MOUTH_BURGER_BITES_2.jpg', NULL, NULL, 2, NULL, NULL, 2, '123546-AS', b'1', 1, '2017-02-16 20:47:31', '1', '2017-05-14 01:00:00', 'admin', NULL, 16),
(6, '228b2e26-947b-40c2-90a9-d1fc9322b48c.jpg', '228b2e26-947b-40c2-90a9-d1fc9322b48c-thumbnail.png', '12.jpg', NULL, NULL, 2, NULL, NULL, 2, NULL, b'1', 6, '2017-02-22 19:11:06', 'staff1', '2017-05-14 01:00:00', NULL, NULL, 5),
(7, 'b39dffbb-0cbb-4eab-aee8-6bce58c0fa87.jpg', 'b39dffbb-0cbb-4eab-aee8-6bce58c0fa87-thumbnail.png', '2.jpg', NULL, NULL, 1, NULL, NULL, 1, NULL, b'1', 2, '2017-04-13 21:50:44', 'staff1', '2017-07-03 20:35:11', 'owner', NULL, 11),
(8, 'b4dc222a-cde8-4840-8295-54e5392e6f4a.jpg', 'b4dc222a-cde8-4840-8295-54e5392e6f4a-thumbnail.png', '5.jpg', NULL, NULL, 1, NULL, NULL, 1, NULL, b'1', 5, '2017-04-13 22:28:47', 'staff1', '2017-07-03 20:44:29', 'owner', NULL, 18),
(9, '1a32e7fb-f638-4246-8b22-e05b47a44bb1.jpg', '1a32e7fb-f638-4246-8b22-e05b47a44bb1-thumbnail.png', '3.jpg', NULL, NULL, 1, NULL, NULL, 1, NULL, b'1', 3, '2017-04-16 19:24:38', 'admin', '2017-07-03 20:36:11', 'owner', NULL, 18),
(10, 'c4dbb13e-5746-464e-b07d-e85056665474.jpg', 'c4dbb13e-5746-464e-b07d-e85056665474-thumbnail.png', '7.jpg', NULL, NULL, 1, NULL, NULL, 1, NULL, b'1', 9, '2017-07-03 20:45:24', 'owner', '2017-07-03 20:47:19', 'owner', NULL, 2),
(11, '44115afd-0e71-4e67-816f-0ee171dfa57a.jpg', '44115afd-0e71-4e67-816f-0ee171dfa57a-thumbnail.png', '8.jpg', NULL, NULL, 1, NULL, NULL, 1, NULL, b'1', 10, '2017-07-03 20:46:47', 'owner', '2017-07-03 20:50:15', 'owner', NULL, 3),
(12, 'd4bcad44-ef75-459e-8b27-3bc7b16468f6.jpg', 'd4bcad44-ef75-459e-8b27-3bc7b16468f6-thumbnail.png', '9.jpg', NULL, NULL, 1, NULL, NULL, 1, NULL, b'1', 11, '2017-07-03 20:50:42', 'owner', '2017-07-03 20:51:17', NULL, NULL, 1),
(13, '57946c85-55cc-4dd1-af92-8192f0c207d7.jpg', '57946c85-55cc-4dd1-af92-8192f0c207d7-thumbnail.png', '10.jpg', NULL, NULL, 1, NULL, NULL, 1, NULL, b'1', 12, '2017-07-03 20:51:37', 'owner', '2017-07-03 20:52:27', 'owner', NULL, 2),
(14, '536fc223-3720-49b4-90fd-6b9a5ebb78c3.jpg', '536fc223-3720-49b4-90fd-6b9a5ebb78c3-thumbnail.png', '11.jpg', NULL, NULL, 1, NULL, NULL, 1, NULL, b'1', 13, '2017-07-03 20:52:43', 'owner', '2017-07-03 20:53:25', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `item_category_translation`
--

CREATE TABLE IF NOT EXISTS `item_category_translation` (
  `ITEM_CATEGORY_TRANS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `ITEM_CATEGORY_ID` bigint(20) NOT NULL,
  `SHOW_DESCRIPTION` bit(1) DEFAULT b'0',
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ITEM_CATEGORY_TRANS_ID`),
  UNIQUE KEY `UNQ_ICT` (`LANGUAGE_ID`,`ITEM_CATEGORY_ID`),
  UNIQUE KEY `unique_language_id` (`ITEM_CATEGORY_ID`,`LANGUAGE_ID`),
  KEY `FK_ITEM_CAT_TR` (`ITEM_CATEGORY_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `item_category_translation`
--

INSERT INTO `item_category_translation` (`ITEM_CATEGORY_TRANS_ID`, `TITLE`, `DESCRIPTION`, `LANGUAGE_ID`, `ITEM_CATEGORY_ID`, `SHOW_DESCRIPTION`, `VERSION`) VALUES
(1, 'Appetizers', 'Appetizers', 1, 1, b'0', 5),
(2, 'Big Mouth Burgers', 'Big Mouth Burgers', 1, 4, b'1', 6),
(4, 'Appetizer', 'Apetizer Description', 1, 5, b'0', 2),
(5, 'Salads', 's', 1, 6, NULL, 0),
(6, 'سلاد', NULL, 3, 6, b'1', 0),
(8, 'المقبلات', 'المقبلات', 2, 1, b'1', 2),
(9, 'سشاتياشلستيلاتشسالتيشس', 'سيبتغفعف بلايل', 2, 5, b'1', 0),
(10, 'سشي', 'عحهخعغه', 3, 5, b'0', 0),
(11, 'Soups & Salads', 'Soups & Salads', 1, 7, NULL, 1),
(12, 'Steaks', 'All of our grilled steaks are cooked to order and served with garlic toast and your choice of two sides.', 1, 8, NULL, 1),
(13, 'Sandwiches', 'Sandwiches', 1, 9, NULL, 2),
(14, 'الشوربات والسلطات', 'الشوربات والسلطات', 2, 7, b'0', 2),
(15, 'سندويتش', 'سندويتش', 2, 9, b'0', 0),
(16, 'بيج ماوث برجرز', 'بيج ماوث برجرز', 2, 4, b'0', 0),
(17, 'شريحة لحم', 'يتم شواء جميع أطباق الستيك بحسب الطلب، وتقدم مع طبقين جانبيين من إختيارك وخبز التوست بالثوم', 2, 8, b'0', 1),
(18, 'Southwestern Pastas', 'Southwestern Pastas', 1, 10, NULL, 0),
(19, 'ساوثوسترن باستا', 'ساوثوسترن باستا', 2, 10, b'0', 0),
(20, 'Southwest Favorites', 'Southwest Favorites', 1, 11, NULL, 0),
(21, 'مشاوي ساوثويست', 'مشاوي ساوثويست', 2, 11, b'0', 0),
(22, 'Chicken & Seafood', 'Chicken & Seafood', 1, 12, NULL, 0),
(23, 'الدجاج والمأكولات البحرية', 'الدجاج والمأكولات البحرية', 2, 12, b'0', 0),
(24, 'Sweet Endings', 'Shhh...listen. We’re pretty sure one of these is calling your name.', 1, 13, NULL, 1),
(25, 'ختامها حلو', 'أووووه... هل تسمعها؟  نحن واثقون تماماً من أن إحداها تناديك.', 2, 13, b'0', 0),
(26, 'Beverages', 'Beverages', 1, 14, NULL, 0),
(27, 'المشروبات', 'المشروبات', 2, 14, b'0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_discount`
--

CREATE TABLE IF NOT EXISTS `item_discount` (
  `ITEM_DISCOUNT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_PRICE` decimal(5,3) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `ITEM_VARIANT_ID` bigint(20) DEFAULT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` bigint(20) NOT NULL,
  `LAST_UPDATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ITEM_DISCOUNT_ID`),
  KEY `FK_ITDIS_VAR` (`ITEM_VARIANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `item_ingredient`
--

CREATE TABLE IF NOT EXISTS `item_ingredient` (
  `ITEM_INGREDIENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `INGREDIENT_ID` bigint(20) NOT NULL,
  `ITEM_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ITEM_INGREDIENT_ID`),
  KEY `FK_II_ITEM` (`ITEM_ID`),
  KEY `FK_II_ING` (`INGREDIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `item_media_content`
--

CREATE TABLE IF NOT EXISTS `item_media_content` (
  `ITEM_MEDIA_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEM_ID` bigint(20) NOT NULL,
  `IMAGE_NAME` varchar(255) DEFAULT NULL,
  `IMAGE_NAME_SMALL` varchar(255) DEFAULT NULL,
  `IMAGE_NAME_ORIGINAL` varchar(255) DEFAULT NULL,
  `VIDEO_URL` varchar(255) DEFAULT NULL,
  `VIDEO_SOURCE_TYPE_ID` bigint(2) DEFAULT NULL,
  `DISPLAY_ORDER` int(4) DEFAULT NULL,
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  `DATE_CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(100) DEFAULT NULL,
  `LAST_UPDATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(100) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ITEM_MEDIA_ID`),
  KEY `FK_IMC_IT` (`ITEM_ID`),
  KEY `FK_IMC_VS` (`VIDEO_SOURCE_TYPE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=161 ;

--
-- Dumping data for table `item_media_content`
--

INSERT INTO `item_media_content` (`ITEM_MEDIA_ID`, `ITEM_ID`, `IMAGE_NAME`, `IMAGE_NAME_SMALL`, `IMAGE_NAME_ORIGINAL`, `VIDEO_URL`, `VIDEO_SOURCE_TYPE_ID`, `DISPLAY_ORDER`, `IS_ACTIVE`, `DATE_CREATED`, `CREATED_BY`, `LAST_UPDATED`, `UPDATED_BY`, `VERSION`) VALUES
(15, 89, '2169afd2-ab7b-4353-8dfc-89c4f84aa1f1.jpg', '2169afd2-ab7b-4353-8dfc-89c4f84aa1f1-thumbnail.png', 'GRILLED_CHICKEN_SANDWICH_1.jpg', NULL, 1, 1, b'1', '2017-04-14 00:50:32', 'admin', '2017-07-02 05:18:33', NULL, 2),
(17, 89, '85407ab7-d95e-4c8d-8ab9-c02bb516fc37.jpg', '85407ab7-d95e-4c8d-8ab9-c02bb516fc37-thumbnail.png', 'GRILLED_CHICKEN_SANDWICH_2.jpg', NULL, 1, 3, b'1', '2017-04-14 00:52:12', 'admin', '2017-04-14 00:53:13', NULL, 1),
(18, 89, '4fc0ffb2-f2a8-4d28-b610-42cde7f88ed4.jpg', '4fc0ffb2-f2a8-4d28-b610-42cde7f88ed4-thumbnail.png', 'NEW_BACON_AVOCADO_CHICKEN_SANDWICH_1.jpg', NULL, 1, 2, b'1', '2017-04-14 00:52:13', 'admin', '2017-07-02 05:18:33', NULL, 2),
(19, 90, '6bde91a6-21e2-49f8-8e43-8603614900a4.jpg', '6bde91a6-21e2-49f8-8e43-8603614900a4-thumbnail.png', 'CHICKEN_CRISPERS_2.jpg', NULL, 1, 18, b'1', '2017-07-02 05:40:48', 'owner', '2017-07-02 05:40:48', NULL, 0),
(20, 90, 'd33f9a06-4e2a-45cc-9c78-53043f582475.jpg', 'd33f9a06-4e2a-45cc-9c78-53043f582475-thumbnail.png', 'CHICKEN_CRISPERS_3.jpg', NULL, 1, 19, b'1', '2017-07-02 05:40:49', 'owner', '2017-07-02 05:40:49', NULL, 0),
(21, 90, '2ec79bf5-6cb1-4b4e-b18f-e0268f71ec94.jpg', '2ec79bf5-6cb1-4b4e-b18f-e0268f71ec94-thumbnail.png', 'CHICKEN_CRISPERS_1.jpg', NULL, 1, 20, b'1', '2017-07-02 05:40:50', 'owner', '2017-07-02 05:40:50', NULL, 0),
(22, 90, '2c886aa5-da03-4edc-8875-971ef7c4f91b.jpg', '2c886aa5-da03-4edc-8875-971ef7c4f91b-thumbnail.png', 'COUNTRY-FRIED_CHICKEN_1.jpg', NULL, 1, 21, b'1', '2017-07-02 05:41:06', 'owner', '2017-07-02 05:41:06', NULL, 0),
(23, 91, 'd8f91b31-0856-4c20-ba28-0ec08cece3bc.jpg', 'd8f91b31-0856-4c20-ba28-0ec08cece3bc-thumbnail.png', 'SOUTHWESTERN_EGGROLLS_2.jpg', NULL, 1, 3, b'1', '2017-07-04 07:31:07', 'owner', '2017-07-04 08:56:24', NULL, 2),
(24, 91, '9d790abd-c914-49c9-84b9-ce87532b8419.jpg', '9d790abd-c914-49c9-84b9-ce87532b8419-thumbnail.png', 'SOUTHWESTERN_EGGROLLS_3.jpg', NULL, 1, 1, b'1', '2017-07-04 07:31:08', 'owner', '2017-07-04 08:56:24', NULL, 2),
(25, 91, '021b9e5f-8473-48ee-9563-2f3eaf97508f.jpg', '021b9e5f-8473-48ee-9563-2f3eaf97508f-thumbnail.png', 'SOUTHWESTERN_EGGROLLS_1.jpg', NULL, 1, 2, b'1', '2017-07-04 07:31:10', 'owner', '2017-07-04 08:56:24', NULL, 2),
(26, 92, '4531a590-dbe8-41fe-84a5-ab37ad9540bd.jpg', '4531a590-dbe8-41fe-84a5-ab37ad9540bd-thumbnail.png', 'TEXAS_CHEESE_FRIES_1.jpg', NULL, 1, 25, b'1', '2017-07-05 05:19:24', 'owner', '2017-07-05 05:19:24', NULL, 0),
(27, 92, '3f9bf594-f284-45c9-89d5-be32221ff8cb.jpg', '3f9bf594-f284-45c9-89d5-be32221ff8cb-thumbnail.png', 'TEXAS_CHEESE_FRIES_2.jpg', NULL, 1, 26, b'1', '2017-07-05 05:19:25', 'owner', '2017-07-05 05:19:25', NULL, 0),
(28, 93, '3761e805-b589-4b4a-8047-8dcd0ffe346f.jpg', '3761e805-b589-4b4a-8047-8dcd0ffe346f-thumbnail.png', 'BONELESS_BUFFALO_WINGS_3.jpg', NULL, 1, 27, b'1', '2017-07-05 05:23:40', 'owner', '2017-07-05 05:23:40', NULL, 0),
(29, 93, 'af86c435-a8f4-4b55-a8f9-3a5a5edfb724.jpg', 'af86c435-a8f4-4b55-a8f9-3a5a5edfb724-thumbnail.png', 'BONELESS_BUFFALO_WINGS_1.jpg', NULL, 1, 28, b'1', '2017-07-05 05:23:41', 'owner', '2017-07-05 05:23:41', NULL, 0),
(30, 93, 'fdc03e8a-f904-4503-8313-cd01d1e64988.jpg', 'fdc03e8a-f904-4503-8313-cd01d1e64988-thumbnail.png', 'BONELESS_BUFFALO_WINGS_2.jpg', NULL, 1, 29, b'1', '2017-07-05 05:23:42', 'owner', '2017-07-05 05:23:42', NULL, 0),
(31, 94, 'e81e7479-468a-48bb-9932-63cfa6fa58de.jpg', 'e81e7479-468a-48bb-9932-63cfa6fa58de-thumbnail.png', 'WINGS_OVER_BUFFALO_1.jpg', NULL, 1, 30, b'1', '2017-07-05 06:10:19', 'owner', '2017-07-05 06:10:19', NULL, 0),
(32, 94, '26a345bb-f121-4336-a939-83f65ccbd0da.jpg', '26a345bb-f121-4336-a939-83f65ccbd0da-thumbnail.png', 'WINGS_OVER_BUFFALO_2.jpg', NULL, 1, 31, b'1', '2017-07-05 06:10:20', 'owner', '2017-07-05 06:10:20', NULL, 0),
(33, 94, 'a740754b-e970-4e36-845d-fb0040d5c1f0.jpg', 'a740754b-e970-4e36-845d-fb0040d5c1f0-thumbnail.png', 'WINGS_OVER_BUFFALO_3.jpg', NULL, 1, 32, b'1', '2017-07-05 06:10:21', 'owner', '2017-07-05 06:10:21', NULL, 0),
(34, 95, '34063108-cfdf-4854-86b0-7823c9936fd0.jpg', '34063108-cfdf-4854-86b0-7823c9936fd0-thumbnail.png', 'FRIED_CHEESE_1.jpg', NULL, 1, 33, b'1', '2017-07-08 11:56:43', 'owner', '2017-07-08 11:56:43', NULL, 0),
(35, 95, '28ce7f41-0f18-4c26-8230-704644b8ee7b.jpg', '28ce7f41-0f18-4c26-8230-704644b8ee7b-thumbnail.png', 'FRIED_CHEESE_2.jpg', NULL, 1, 34, b'1', '2017-07-08 11:56:44', 'owner', '2017-07-08 11:56:44', NULL, 0),
(36, 96, '834696c4-10cd-4f0f-b15a-672f2aa11548.jpg', '834696c4-10cd-4f0f-b15a-672f2aa11548-thumbnail.png', 'CLASSIC_NACHOS_3.jpg', NULL, 1, 35, b'1', '2017-07-08 11:59:52', 'owner', '2017-07-08 11:59:52', NULL, 0),
(37, 96, '6be385f3-c9a3-4f40-81e0-f7855515f72c.jpg', '6be385f3-c9a3-4f40-81e0-f7855515f72c-thumbnail.png', 'CLASSIC_NACHOS_1.jpg', NULL, 1, 36, b'1', '2017-07-08 11:59:53', 'owner', '2017-07-08 11:59:53', NULL, 0),
(38, 96, '318c10af-1902-4b55-b756-14b3c8634504.jpg', '318c10af-1902-4b55-b756-14b3c8634504-thumbnail.png', 'CLASSIC_NACHOS_2.jpg', NULL, 1, 37, b'1', '2017-07-08 11:59:55', 'owner', '2017-07-08 11:59:55', NULL, 0),
(39, 98, 'a23a0b48-65cb-4658-87bc-d1e8a5ade3bb.jpg', 'a23a0b48-65cb-4658-87bc-d1e8a5ade3bb-thumbnail.png', 'SKILLET_QUESO_1.jpg', NULL, 1, 38, b'1', '2017-07-09 01:17:19', 'owner', '2017-07-09 01:17:19', NULL, 0),
(40, 98, '8e0acbf2-2373-4f6b-9f5f-89a9b9b10ee0.jpg', '8e0acbf2-2373-4f6b-9f5f-89a9b9b10ee0-thumbnail.png', 'SKILLET_QUESO_2.jpg', NULL, 1, 39, b'1', '2017-07-09 01:17:20', 'owner', '2017-07-09 01:17:20', NULL, 0),
(41, 98, 'cb85e818-e2bc-4b6c-a7f1-71f2164b879d.jpg', 'cb85e818-e2bc-4b6c-a7f1-71f2164b879d-thumbnail.png', 'SKILLET_QUESO_3.jpg', NULL, 1, 40, b'1', '2017-07-09 01:17:21', 'owner', '2017-07-09 01:17:21', NULL, 0),
(42, 97, '55530035-8981-47dd-8f46-cd0ee833aced.jpg', '55530035-8981-47dd-8f46-cd0ee833aced-thumbnail.png', 'BOTTOMLESS_TOSTADA_CHIPS_2.jpg', NULL, 1, 41, b'1', '2017-07-09 01:18:06', 'owner', '2017-07-09 01:18:06', NULL, 0),
(43, 97, '666f2619-bf0c-40fd-aa63-0317c0500f12.jpg', '666f2619-bf0c-40fd-aa63-0317c0500f12-thumbnail.png', 'BOTTOMLESS_TOSTADA_CHIPS_1.jpg', NULL, 1, 42, b'1', '2017-07-09 01:18:07', 'owner', '2017-07-09 01:18:07', NULL, 0),
(44, 99, '273e3e41-c1e3-48fd-8a38-6fa228bf6167.jpg', '273e3e41-c1e3-48fd-8a38-6fa228bf6167-thumbnail.png', 'NEW_SANTA_FE_CHICKEN_SALAD_3.jpg', NULL, 1, 43, b'1', '2017-07-09 02:07:55', 'owner', '2017-07-09 02:07:55', NULL, 0),
(45, 99, 'a4fe6323-4166-4c30-9bcb-9124c29be93a.jpg', 'a4fe6323-4166-4c30-9bcb-9124c29be93a-thumbnail.png', 'NEW_SANTA_FE_CHICKEN_SALAD_2.jpg', NULL, 1, 43, b'1', '2017-07-09 02:07:55', 'owner', '2017-07-09 02:07:55', NULL, 0),
(46, 100, 'dc63e329-0d54-415c-9eaf-b3755f862a3c.jpg', 'dc63e329-0d54-415c-9eaf-b3755f862a3c-thumbnail.png', 'BBQ_CHICKEN_SALAD_1.jpg', NULL, 1, 45, b'1', '2017-07-09 02:13:47', 'owner', '2017-07-09 02:13:47', NULL, 0),
(47, 100, 'eb9b5f0d-acf2-43da-a3eb-ad5fcf917c16.jpg', 'eb9b5f0d-acf2-43da-a3eb-ad5fcf917c16-thumbnail.png', 'BBQ_CHICKEN_SALAD_2.jpg', NULL, 1, 46, b'1', '2017-07-09 02:13:49', 'owner', '2017-07-09 02:13:49', NULL, 0),
(48, 102, '10f3bd5a-cb0c-41b6-94a3-b3321be1a89a.jpg', '10f3bd5a-cb0c-41b6-94a3-b3321be1a89a-thumbnail.png', 'QUESADILLA_EXPLOSION_SALAD_3.jpg', NULL, 1, 47, b'1', '2017-07-09 16:40:29', 'owner', '2017-07-09 16:40:29', NULL, 0),
(49, 102, '98b14dc2-d991-4771-a271-c539b4f4bb10.jpg', '98b14dc2-d991-4771-a271-c539b4f4bb10-thumbnail.png', 'QUESADILLA_EXPLOSION_SALAD_1.jpg', NULL, 1, 48, b'1', '2017-07-09 16:40:30', 'owner', '2017-07-09 16:40:30', NULL, 0),
(50, 102, '8b312ac0-be77-4048-be2f-3c9e1649d782.jpg', '8b312ac0-be77-4048-be2f-3c9e1649d782-thumbnail.png', 'QUESADILLA_EXPLOSION_SALAD_2.jpg', NULL, 1, 49, b'1', '2017-07-09 16:40:31', 'owner', '2017-07-09 16:40:31', NULL, 0),
(51, 104, 'c18264bd-4bbe-48b6-a901-7b26966cc768.jpg', 'c18264bd-4bbe-48b6-a901-7b26966cc768-thumbnail.png', 'SOUP_AND_SIDE_SALAD_2.jpg', NULL, 1, 50, b'1', '2017-07-09 16:47:05', 'owner', '2017-07-09 16:47:05', NULL, 0),
(52, 104, 'e766cc58-95e1-4b57-af39-d21e77a0bef3.jpg', 'e766cc58-95e1-4b57-af39-d21e77a0bef3-thumbnail.png', 'SOUP_AND_SIDE_SALAD_1.jpg', NULL, 1, 51, b'1', '2017-07-09 16:47:06', 'owner', '2017-07-09 16:47:06', NULL, 0),
(53, 105, '823fc39c-0fa8-4d79-8dd8-c40bb64fee76.jpg', '823fc39c-0fa8-4d79-8dd8-c40bb64fee76-thumbnail.png', 'SIDE_SALAD_2.jpg', NULL, 1, 52, b'1', '2017-07-09 16:52:11', 'owner', '2017-07-09 16:52:11', NULL, 0),
(54, 105, '3701f7c9-b6be-4bd9-bde8-fbf9e781e68d.jpg', '3701f7c9-b6be-4bd9-bde8-fbf9e781e68d-thumbnail.png', 'SIDE_SALAD_1.jpg', NULL, 1, 53, b'1', '2017-07-09 16:52:12', 'owner', '2017-07-09 16:52:12', NULL, 0),
(55, 106, '5f2d0bb9-38a0-435a-bb5c-12142094de99.jpg', '5f2d0bb9-38a0-435a-bb5c-12142094de99-thumbnail.png', 'SOUP_OF_THE_DAY_3.jpg', NULL, 1, 54, b'1', '2017-07-09 16:55:00', 'owner', '2017-07-09 16:55:00', NULL, 0),
(56, 106, 'e2371414-3d9f-46dc-86fe-612003da0d55.jpg', 'e2371414-3d9f-46dc-86fe-612003da0d55-thumbnail.png', 'SOUP_OF_THE_DAY_1.jpg', NULL, 1, 55, b'1', '2017-07-09 16:55:01', 'owner', '2017-07-09 16:55:01', NULL, 0),
(57, 106, '8181b68b-05ba-4560-8605-baa44411f994.jpg', '8181b68b-05ba-4560-8605-baa44411f994-thumbnail.png', 'SOUP_OF_THE_DAY_2.jpg', NULL, 1, 56, b'1', '2017-07-09 16:55:02', 'owner', '2017-07-09 16:55:02', NULL, 0),
(58, 107, '1eb735a7-08d1-4fdd-8046-0cb46fe411e4.jpg', '1eb735a7-08d1-4fdd-8046-0cb46fe411e4-thumbnail.png', 'CAJUN_CHICKEN_SANDWICH_2.jpg', NULL, 1, 57, b'1', '2017-07-09 17:38:50', 'owner', '2017-07-09 17:38:50', NULL, 0),
(59, 107, 'bb10e54c-489b-4a1f-8ae2-f1316ca8b3aa.jpg', 'bb10e54c-489b-4a1f-8ae2-f1316ca8b3aa-thumbnail.png', 'CAJUN_CHICKEN_SANDWICH_1.jpg', NULL, 1, 58, b'1', '2017-07-09 17:38:51', 'owner', '2017-07-09 17:38:51', NULL, 0),
(60, 108, 'b6ff3278-71e5-4f1c-9ec2-91a975b032c2.jpg', 'b6ff3278-71e5-4f1c-9ec2-91a975b032c2-thumbnail.png', 'BUFFALO_CHICKEN_RANCH_SANDWICH_1.jpg', NULL, 1, 59, b'1', '2017-07-09 18:45:05', 'owner', '2017-07-09 18:45:05', NULL, 0),
(61, 108, '422dd207-1279-46af-9f86-61662678771e.jpg', '422dd207-1279-46af-9f86-61662678771e-thumbnail.png', 'BUFFALO_CHICKEN_RANCH_SANDWICH_2.jpg', NULL, 1, 60, b'1', '2017-07-09 18:45:06', 'owner', '2017-07-09 18:45:06', NULL, 0),
(62, 109, 'b70ccec2-69c5-469b-8a3c-db60f4731151.jpg', 'b70ccec2-69c5-469b-8a3c-db60f4731151-thumbnail.png', 'NEW_CALIFORNIA_TURKEY_CLUB_TOASTED_SANDWICH_1.jpg', NULL, 1, 61, b'1', '2017-07-09 18:47:27', 'owner', '2017-07-09 18:47:27', NULL, 0),
(63, 110, '5b43d0f9-f1b1-4e22-9e47-8f6a35ef76e3.jpg', '5b43d0f9-f1b1-4e22-9e47-8f6a35ef76e3-thumbnail.png', 'GRILLED_CHICKEN_SANDWICH_1.jpg', NULL, 1, 62, b'1', '2017-07-09 18:55:26', 'owner', '2017-07-09 18:55:26', NULL, 0),
(64, 110, '2e56cfd9-eebf-459a-b99e-dfb3d96d36f8.jpg', '2e56cfd9-eebf-459a-b99e-dfb3d96d36f8-thumbnail.png', 'GRILLED_CHICKEN_SANDWICH_2.jpg', NULL, 1, 63, b'1', '2017-07-09 18:55:27', 'owner', '2017-07-09 18:55:27', NULL, 0),
(65, 111, '16da1374-1bb3-4a0a-b72f-65e1a1cd2079.jpg', '16da1374-1bb3-4a0a-b72f-65e1a1cd2079-thumbnail.png', 'NEW_BACON_AVOCADO_CHICKEN_SANDWICH_1.jpg', NULL, 1, 64, b'1', '2017-07-09 18:59:08', 'owner', '2017-07-09 18:59:08', NULL, 0),
(66, 111, '4333ed3b-def9-43d8-be8c-144a8f4eab2d.jpg', '4333ed3b-def9-43d8-be8c-144a8f4eab2d-thumbnail.png', 'NEW_BACON_AVOCADO_CHICKEN_SANDWICH_2.jpg', NULL, 1, 65, b'1', '2017-07-09 18:59:09', 'owner', '2017-07-09 18:59:09', NULL, 0),
(67, 112, 'ab1ba1f2-3c53-496f-a41c-b26c131b141c.jpg', 'ab1ba1f2-3c53-496f-a41c-b26c131b141c-thumbnail.png', 'OLDTIMER_2.jpg', NULL, 1, 66, b'1', '2017-07-09 19:41:20', 'owner', '2017-07-09 19:41:20', NULL, 0),
(68, 112, '6d1cc06c-c539-4261-b063-0f3ec5c56654.jpg', '6d1cc06c-c539-4261-b063-0f3ec5c56654-thumbnail.png', 'OLDTIMER_11.jpg', NULL, 1, 67, b'1', '2017-07-09 19:41:21', 'owner', '2017-07-09 19:41:21', NULL, 0),
(69, 113, '615626b0-a9e9-4210-9dab-f0a0d145ac72.JPG', '615626b0-a9e9-4210-9dab-f0a0d145ac72-thumbnail.png', 'MUSHROOM_SWISS_1.JPG', NULL, 1, 68, b'1', '2017-07-09 19:51:21', 'owner', '2017-07-09 19:51:21', NULL, 0),
(70, 114, '22b4c0e3-4dc3-465f-a6b9-0256b7ff59cb.JPG', '22b4c0e3-4dc3-465f-a6b9-0256b7ff59cb-thumbnail.png', 'BEEF_BACON_BURGER_1.JPG', NULL, 1, 69, b'1', '2017-07-09 21:05:39', 'owner', '2017-07-09 21:05:39', NULL, 0),
(71, 114, 'ea02c43d-46d2-41bf-9df7-db0072be919b.JPG', 'ea02c43d-46d2-41bf-9df7-db0072be919b-thumbnail.png', 'BEEF_BACON_BURGER_2.JPG', NULL, 1, 70, b'1', '2017-07-09 21:05:40', 'owner', '2017-07-09 21:05:40', NULL, 0),
(72, 115, 'df91389f-feae-408f-8253-210bc4782a74.jpg', 'df91389f-feae-408f-8253-210bc4782a74-thumbnail.png', 'BBQ_RANCH_BURGER_1.jpg', NULL, 1, 71, b'1', '2017-07-09 21:35:56', 'owner', '2017-07-09 21:35:56', NULL, 0),
(73, 115, 'd60a1a42-2f46-4588-a5d1-bd94ce02de10.jpg', 'd60a1a42-2f46-4588-a5d1-bd94ce02de10-thumbnail.png', 'BBQ_RANCH_BURGER_2.jpg', NULL, 1, 72, b'1', '2017-07-09 21:35:57', 'owner', '2017-07-09 21:35:57', NULL, 0),
(74, 116, 'b6168b17-89d2-4423-a37a-d71b644ee144.jpg', 'b6168b17-89d2-4423-a37a-d71b644ee144-thumbnail.png', 'NEW_GUACAMOLE_BURGER_1.jpg', NULL, 1, 73, b'1', '2017-07-09 21:40:41', 'owner', '2017-07-09 21:40:41', NULL, 0),
(75, 117, 'd337ce90-4721-4532-bb28-9adcf3ab7947.jpg', 'd337ce90-4721-4532-bb28-9adcf3ab7947-thumbnail.png', 'BIG_MOUTH_BURGER_BITES_1.jpg', NULL, 1, 74, b'1', '2017-07-09 22:26:03', 'owner', '2017-07-09 22:26:03', NULL, 0),
(76, 117, '72de8fa3-b366-4d91-962a-5cd482aecfd1.jpg', '72de8fa3-b366-4d91-962a-5cd482aecfd1-thumbnail.png', 'BIG_MOUTH_BURGER_BITES_2.jpg', NULL, 1, 75, b'1', '2017-07-09 22:26:04', 'owner', '2017-07-09 22:26:04', NULL, 0),
(77, 118, '3d46351c-2935-4b28-a673-92681c2449a0.jpg', '3d46351c-2935-4b28-a673-92681c2449a0-thumbnail.png', 'GRILLED_BEEF_TENDERLOIN_1.jpg', NULL, 1, 76, b'1', '2017-07-09 22:39:55', 'owner', '2017-07-09 22:39:55', NULL, 0),
(78, 118, '120fbbe5-dc85-4076-b7bf-7b871f90301c.jpg', '120fbbe5-dc85-4076-b7bf-7b871f90301c-thumbnail.png', 'GRILLED_BEEF_TENDERLOIN_2.jpg', NULL, 1, 77, b'1', '2017-07-09 22:39:56', 'owner', '2017-07-09 22:39:56', NULL, 0),
(79, 119, '353d7d45-8274-43bf-ab44-d2a44cad4647.jpg', '353d7d45-8274-43bf-ab44-d2a44cad4647-thumbnail.png', 'NEW_YORK_STRIPS_2.jpg', NULL, 1, 78, b'1', '2017-07-10 21:54:42', 'owner', '2017-07-10 21:54:42', NULL, 0),
(80, 119, '2849eede-c563-438e-8f1f-11324b7aa172.jpg', '2849eede-c563-438e-8f1f-11324b7aa172-thumbnail.png', 'NEW_YORK_STRIPS_1.jpg', NULL, 1, 78, b'1', '2017-07-10 21:54:42', 'owner', '2017-07-10 21:54:42', NULL, 0),
(81, 119, '2e7a0078-24dd-4a8c-8a48-c00842eb54a0.jpg', '2e7a0078-24dd-4a8c-8a48-c00842eb54a0-thumbnail.png', 'NEW_YORK_STRIPS_3.jpg', NULL, 1, 80, b'1', '2017-07-10 21:54:43', 'owner', '2017-07-10 21:54:43', NULL, 0),
(82, 120, 'e68eebf0-b16e-4e6f-abef-e2d37de3a676.jpg', 'e68eebf0-b16e-4e6f-abef-e2d37de3a676-thumbnail.png', 'FLAMED-_GRILLED_RIBEYE_2.jpg', NULL, 1, 81, b'1', '2017-07-10 21:58:39', 'owner', '2017-07-10 21:58:39', NULL, 0),
(83, 120, 'cd6faa2b-2cad-4093-bc03-4d33170d2966.jpg', 'cd6faa2b-2cad-4093-bc03-4d33170d2966-thumbnail.png', 'FLAMED-_GRILLED_RIBEYE_1.jpg', NULL, 1, 82, b'1', '2017-07-10 21:58:40', 'owner', '2017-07-10 21:58:40', NULL, 0),
(84, 121, 'bfaf10ad-6dbb-417b-9e64-f0408976a4b8.jpg', 'bfaf10ad-6dbb-417b-9e64-f0408976a4b8-thumbnail.png', 'COUNTRY-FRIED_STEAK_1.jpg', NULL, 1, 83, b'1', '2017-07-10 22:01:18', 'owner', '2017-07-10 22:01:18', NULL, 0),
(85, 122, '643c860d-0c88-4507-b849-17bba5618b19.jpg', '643c860d-0c88-4507-b849-17bba5618b19-thumbnail.png', 'NEW_MELTED_PEPPER_JACK_RIBEYE_1.jpg', NULL, 1, 84, b'1', '2017-07-10 22:04:27', 'owner', '2017-07-10 22:04:27', NULL, 0),
(86, 123, 'a3bedb93-ddd2-4512-877c-f98473469f51.jpg', 'a3bedb93-ddd2-4512-877c-f98473469f51-thumbnail.png', 'CHICKEN_ENCHILADA_PASTA_2.jpg', NULL, 1, 85, b'1', '2017-07-10 22:10:06', 'owner', '2017-07-10 22:10:06', NULL, 0),
(87, 123, '3af7cb7f-2dcf-4445-8e4d-298edae3640c.jpg', '3af7cb7f-2dcf-4445-8e4d-298edae3640c-thumbnail.png', 'CHICKEN_ENCHILADA_PASTA_1.jpg', NULL, 1, 86, b'1', '2017-07-10 22:10:11', 'owner', '2017-07-10 22:10:11', NULL, 0),
(88, 124, '56742318-0834-4eb8-ab37-055f343bd2f3.jpg', '56742318-0834-4eb8-ab37-055f343bd2f3-thumbnail.png', 'CAJUN_CHICKEN_PASTA_2.jpg', NULL, 1, 87, b'1', '2017-07-10 22:12:40', 'owner', '2017-07-10 22:12:40', NULL, 0),
(89, 124, 'd1f7be79-8f70-4648-9cf8-57edfadf3800.jpg', 'd1f7be79-8f70-4648-9cf8-57edfadf3800-thumbnail.png', 'CAJUN_CHICKEN_PASTA_1.jpg', NULL, 1, 88, b'1', '2017-07-10 22:12:41', 'owner', '2017-07-10 22:12:41', NULL, 0),
(90, 125, 'be9745a6-9c47-4625-9179-8ba81871ab4f.jpg', 'be9745a6-9c47-4625-9179-8ba81871ab4f-thumbnail.png', 'NEW_SMOKED_CHICKEN_CHEESE_1.jpg', NULL, 1, 89, b'1', '2017-07-10 22:15:37', 'owner', '2017-07-10 22:15:37', NULL, 0),
(91, 126, 'b20a05b2-361c-4e1e-8684-dba28315d9e3.jpg', 'b20a05b2-361c-4e1e-8684-dba28315d9e3-thumbnail.png', 'GRILLED_SHRIMP_ALFREDO_1.jpg', NULL, 1, 90, b'1', '2017-07-10 22:17:06', 'owner', '2017-07-10 22:17:06', NULL, 0),
(92, 126, 'f6df299f-2451-4af1-ab35-7c52cdc85e4b.jpg', 'f6df299f-2451-4af1-ab35-7c52cdc85e4b-thumbnail.png', 'GRILLED_SHRIMP_ALFREDO_2.jpg', NULL, 1, 91, b'1', '2017-07-10 22:17:07', 'owner', '2017-07-10 22:17:07', NULL, 0),
(93, 127, '78427a0f-5875-4890-90b6-b5d47ade9874.jpg', '78427a0f-5875-4890-90b6-b5d47ade9874-thumbnail.png', 'CHIPOTLE_PESTO_PASTA_1.jpg', NULL, 1, 92, b'1', '2017-07-11 00:30:36', 'owner', '2017-07-11 00:30:36', NULL, 0),
(94, 127, '8cb281ce-9de1-4f3b-9b62-62d872996417.jpg', '8cb281ce-9de1-4f3b-9b62-62d872996417-thumbnail.png', 'CHIPOTLE_PESTO_PASTA_2.jpg', NULL, 1, 93, b'1', '2017-07-11 00:30:37', 'owner', '2017-07-11 00:30:37', NULL, 0),
(95, 128, '8b5b6073-1e81-424c-9074-0c6ec5a2b4c6.jpg', '8b5b6073-1e81-424c-9074-0c6ec5a2b4c6-thumbnail.png', 'CILANTRO_PESTO_PASTA_2.jpg', NULL, 1, 94, b'1', '2017-07-11 00:37:25', 'owner', '2017-07-11 00:37:25', NULL, 0),
(96, 128, '1c1dfe2d-cf8d-443d-8349-26cdee0ea6a8.jpg', '1c1dfe2d-cf8d-443d-8349-26cdee0ea6a8-thumbnail.png', 'CILANTRO_PESTO_PASTA_1.jpg', NULL, 1, 95, b'1', '2017-07-11 00:37:27', 'owner', '2017-07-11 00:37:27', NULL, 0),
(97, 129, '17dce234-5dc6-44c6-8566-1bc64f902517.jpg', '17dce234-5dc6-44c6-8566-1bc64f902517-thumbnail.png', 'CHICKEN_CLUB_TACOS_1.jpg', NULL, 1, 96, b'1', '2017-07-13 20:34:16', 'owner', '2017-07-13 20:34:16', NULL, 0),
(98, 129, 'eb2e071f-0106-445d-94ae-35c8baecfceb.jpg', 'eb2e071f-0106-445d-94ae-35c8baecfceb-thumbnail.png', 'CHICKEN_CLUB_TACOS_2.jpg', NULL, 1, 97, b'1', '2017-07-13 20:34:18', 'owner', '2017-07-13 20:34:18', NULL, 0),
(99, 130, '23286dca-091d-4866-8ee8-2e3eb0c0eb0d.jpg', '23286dca-091d-4866-8ee8-2e3eb0c0eb0d-thumbnail.png', 'CRISPY_CHICKEN_TACOS_1.jpg', NULL, 1, 98, b'1', '2017-07-13 20:35:53', 'owner', '2017-07-13 20:35:53', NULL, 0),
(100, 130, '873fcdc3-565d-4023-9e82-7803c66ecaa0.jpg', '873fcdc3-565d-4023-9e82-7803c66ecaa0-thumbnail.png', 'CRISPY_CHICKEN_TACOS_2.jpg', NULL, 1, 99, b'1', '2017-07-13 20:35:54', 'owner', '2017-07-13 20:35:54', NULL, 0),
(101, 131, 'c671d23c-3f31-4266-99b8-5a24028b3982.jpg', 'c671d23c-3f31-4266-99b8-5a24028b3982-thumbnail.png', 'NEW_SPICY_GRILLED_SHRIMP_TACOS_2.jpg', NULL, 1, 100, b'1', '2017-07-13 20:39:16', 'owner', '2017-07-13 20:39:16', NULL, 0),
(102, 131, 'cd6caf5a-37ae-42c4-82dd-b785a59ab2a3.jpg', 'cd6caf5a-37ae-42c4-82dd-b785a59ab2a3-thumbnail.png', 'NEW_SPICY_GRILLED_SHRIMP_TACOS_1.jpg', NULL, 1, 101, b'1', '2017-07-13 20:39:18', 'owner', '2017-07-13 20:39:18', NULL, 0),
(103, 132, '67d03784-4c1b-46e1-9b52-ecbfa67d86d6.jpg', '67d03784-4c1b-46e1-9b52-ecbfa67d86d6-thumbnail.png', 'CLASSIC_QUESADILLA_STEAK_1.jpg', NULL, 1, 102, b'1', '2017-07-13 20:41:20', 'owner', '2017-07-13 20:41:20', NULL, 0),
(104, 132, 'ce671608-1134-4bc0-aaad-e69d3264a285.jpg', 'ce671608-1134-4bc0-aaad-e69d3264a285-thumbnail.png', 'CLASSIC_QUESADILLA_STEAK_2.jpg', NULL, 1, 103, b'1', '2017-07-13 20:41:22', 'owner', '2017-07-13 20:41:22', NULL, 0),
(105, 133, '347b2dfc-6df8-47da-b14a-1f22ef190e96.jpg', '347b2dfc-6df8-47da-b14a-1f22ef190e96-thumbnail.png', 'CLASSIC_FAJITA_1.jpg', NULL, 1, 104, b'1', '2017-07-13 20:43:01', 'owner', '2017-07-13 20:43:01', NULL, 0),
(106, 134, '2625672b-13cb-4fcc-a024-495994f56445.jpg', '2625672b-13cb-4fcc-a024-495994f56445-thumbnail.png', 'FAJITA_TRIO_1.jpg', NULL, 1, 105, b'1', '2017-07-13 20:48:38', 'owner', '2017-07-13 20:48:38', NULL, 0),
(107, 135, '0f524731-c709-4cf7-a0a8-e3f60c014188.jpg', '0f524731-c709-4cf7-a0a8-e3f60c014188-thumbnail.png', 'SOUTHWESTERN_GRILLED_SHRIMP_1.jpg', NULL, 1, 106, b'1', '2017-07-13 21:46:50', 'owner', '2017-07-13 21:46:50', NULL, 0),
(108, 135, '39334ad1-84c6-46b5-b5ad-a414e2c981a4.jpg', '39334ad1-84c6-46b5-b5ad-a414e2c981a4-thumbnail.png', 'SOUTHWESTERN_GRILLED_SHRIMP_2.jpg', NULL, 1, 107, b'1', '2017-07-13 21:46:51', 'owner', '2017-07-13 21:46:51', NULL, 0),
(109, 136, '7e49a1c4-4e88-48bf-813d-3ba412fee907.jpg', '7e49a1c4-4e88-48bf-813d-3ba412fee907-thumbnail.png', 'NEW_CHILE_SHRIMP_QUESADILLA_1.jpg', NULL, 1, 108, b'1', '2017-07-13 21:54:30', 'owner', '2017-07-13 21:54:30', NULL, 0),
(110, 136, '3ec6dd0c-2ce7-45f5-a11a-22ad8a94b454.jpg', '3ec6dd0c-2ce7-45f5-a11a-22ad8a94b454-thumbnail.png', 'NEW_CHILE_SHRIMP_QUESADILLA_2.jpg', NULL, 1, 109, b'1', '2017-07-13 21:54:31', 'owner', '2017-07-13 21:54:31', NULL, 0),
(111, 137, 'bbc76a63-4155-4475-b03d-98b7fea18eb6.jpg', 'bbc76a63-4155-4475-b03d-98b7fea18eb6-thumbnail.png', 'NEW_CHIPOTLE_SALMON_1.jpg', NULL, 1, 110, b'1', '2017-07-13 23:14:34', 'owner', '2017-07-13 23:14:34', NULL, 0),
(112, 137, '0c5ce030-fbdc-4b9d-9906-e6b0a1b52121.jpg', '0c5ce030-fbdc-4b9d-9906-e6b0a1b52121-thumbnail.png', 'NEW_CHIPOTLE_SALMON_2.jpg', NULL, 1, 111, b'1', '2017-07-13 23:14:35', 'owner', '2017-07-13 23:14:35', NULL, 0),
(113, 137, '19740eda-1c6b-41f9-a3e9-b24aa4d78f29.jpg', '19740eda-1c6b-41f9-a3e9-b24aa4d78f29-thumbnail.png', 'NEW_CHIPOTLE_SALMON_3.jpg', NULL, 1, 112, b'1', '2017-07-13 23:14:37', 'owner', '2017-07-13 23:14:37', NULL, 0),
(114, 101, 'c56eb7b4-2417-44af-af8e-f281747660d7.jpg', 'c56eb7b4-2417-44af-af8e-f281747660d7-thumbnail.png', 'CAESAR_SALAD_2.jpg', NULL, 1, 113, b'1', '2017-09-05 00:05:56', 'owner', '2017-09-05 00:05:56', NULL, 0),
(115, 101, 'ea4c825a-ea01-4b11-984b-a655664d18ae.JPG', 'ea4c825a-ea01-4b11-984b-a655664d18ae-thumbnail.png', 'CAESAR_SALAD_1.JPG', NULL, 1, 114, b'1', '2017-09-05 00:05:58', 'owner', '2017-09-05 00:05:58', NULL, 0),
(116, 103, '726780a1-b3a3-4edb-adf1-3355d10ad249.jpg', '726780a1-b3a3-4edb-adf1-3355d10ad249-thumbnail.png', 'SOUTHWESTERN_COBB_SALAD_2.jpg', NULL, 1, 115, b'1', '2017-09-05 00:06:24', 'owner', '2017-09-05 00:06:24', NULL, 0),
(117, 103, '23b87dca-5e2d-4fcf-be74-432580ca9dac.jpg', '23b87dca-5e2d-4fcf-be74-432580ca9dac-thumbnail.png', 'SOUTHWESTERN_COBB_SALAD_1.jpg', NULL, 1, 116, b'1', '2017-09-05 00:06:25', 'owner', '2017-09-05 00:06:25', NULL, 0),
(118, 138, '0a165fd2-3dd2-486d-9168-ddf7a3e66d5b.jpg', '0a165fd2-3dd2-486d-9168-ddf7a3e66d5b-thumbnail.png', 'NEW_BACON_JACK_GRILLED_CHICKEN_1.jpg', NULL, 1, 117, b'1', '2017-09-06 22:32:37', 'owner', '2017-09-06 22:32:37', NULL, 0),
(119, 138, '8122b761-d959-49c3-8483-35f33ceab777.jpg', '8122b761-d959-49c3-8483-35f33ceab777-thumbnail.png', 'NEW_BACON_JACK_GRILLED_CHICKEN_2.jpg', NULL, 1, 118, b'1', '2017-09-06 22:32:43', 'owner', '2017-09-06 22:32:43', NULL, 0),
(120, 139, '0c417780-b13c-467e-bffc-cd7cb07cc19b.jpg', '0c417780-b13c-467e-bffc-cd7cb07cc19b-thumbnail.png', 'CHICKEN_CRISPERS_3.jpg', NULL, 1, 119, b'1', '2017-09-06 22:44:12', 'owner', '2017-09-06 22:44:12', NULL, 0),
(121, 139, 'a79f69d3-2789-4886-803d-839ec1b216ab.jpg', 'a79f69d3-2789-4886-803d-839ec1b216ab-thumbnail.png', 'CHICKEN_CRISPERS_1.jpg', NULL, 1, 120, b'1', '2017-09-06 22:44:13', 'owner', '2017-09-06 22:44:13', NULL, 0),
(122, 139, 'fdb1474b-bcbb-4b39-b110-e1b406d6708a.jpg', 'fdb1474b-bcbb-4b39-b110-e1b406d6708a-thumbnail.png', 'CHICKEN_CRISPERS_2.jpg', NULL, 1, 121, b'1', '2017-09-06 22:44:14', 'owner', '2017-09-06 22:44:14', NULL, 0),
(123, 140, 'ed3e5f15-4ddb-4369-94b2-fcc55109c955.jpg', 'ed3e5f15-4ddb-4369-94b2-fcc55109c955-thumbnail.png', 'CRISPY_HONEY-CHIPOTLE_CHICKEN_CRISPERS_1.jpg', NULL, 1, 122, b'1', '2017-09-06 22:46:56', 'owner', '2017-09-06 22:46:56', NULL, 0),
(124, 140, '350fe899-c6c7-45b9-aba9-fb4b8fbeb733.jpg', '350fe899-c6c7-45b9-aba9-fb4b8fbeb733-thumbnail.png', 'CRISPY_HONEY-CHIPOTLE_CHICKEN_CRISPERS_2.jpg', NULL, 1, 123, b'1', '2017-09-06 22:46:57', 'owner', '2017-09-06 22:46:57', NULL, 0),
(125, 141, '7feb043a-02b4-4564-ab64-2a051394a238.jpg', '7feb043a-02b4-4564-ab64-2a051394a238-thumbnail.png', 'CRISPY_CHICKEN_CRISPERS_2.jpg', NULL, 1, 124, b'1', '2017-09-06 22:49:30', 'owner', '2017-09-06 22:49:30', NULL, 0),
(126, 141, '48db8876-6de2-4cbb-8427-cd957fad1ad6.jpg', '48db8876-6de2-4cbb-8427-cd957fad1ad6-thumbnail.png', 'CRISPY_CHICKEN_CRISPERS_1.jpg', NULL, 1, 125, b'1', '2017-09-06 22:49:31', 'owner', '2017-09-06 22:49:31', NULL, 0),
(127, 142, '80067096-840d-47d7-b6b7-dc1b3238bd94.jpg', '80067096-840d-47d7-b6b7-dc1b3238bd94-thumbnail.png', 'MONTEREY_CHICKEN_2.jpg', NULL, 1, 126, b'1', '2017-09-06 22:51:48', 'owner', '2017-09-06 22:51:48', NULL, 0),
(128, 142, 'ea7f8a6e-6b02-4f7a-b2e4-0a83c33ffa7f.jpg', 'ea7f8a6e-6b02-4f7a-b2e4-0a83c33ffa7f-thumbnail.png', 'MONTEREY_CHICKEN_1.jpg', NULL, 1, 127, b'1', '2017-09-06 22:51:49', 'owner', '2017-09-06 22:51:49', NULL, 0),
(129, 143, 'd4b74950-02f8-49f9-af20-c701909c4457.jpg', 'd4b74950-02f8-49f9-af20-c701909c4457-thumbnail.png', 'COUNTRY-FRIED_CHICKEN_3.jpg', NULL, 1, 128, b'1', '2017-09-06 22:53:29', 'owner', '2017-09-06 22:53:29', NULL, 0),
(130, 143, 'e9dd2290-07b3-4124-9382-2c9f66224acd.jpg', 'e9dd2290-07b3-4124-9382-2c9f66224acd-thumbnail.png', 'COUNTRY-FRIED_CHICKEN_1.jpg', NULL, 1, 129, b'1', '2017-09-06 22:53:30', 'owner', '2017-09-06 22:53:30', NULL, 0),
(131, 143, 'd8ef8a2d-de42-407a-98d8-f7caee658d26.jpg', 'd8ef8a2d-de42-407a-98d8-f7caee658d26-thumbnail.png', 'COUNTRY-FRIED_CHICKEN_2.jpg', NULL, 1, 130, b'1', '2017-09-06 22:53:31', 'owner', '2017-09-06 22:53:31', NULL, 0),
(132, 144, '51396805-66c3-4928-b6a5-dafffca122b3.jpg', '51396805-66c3-4928-b6a5-dafffca122b3-thumbnail.png', 'MARGARITA_GRILLED_CHICKEN_1.jpg', NULL, 1, 131, b'1', '2017-09-06 22:56:59', 'owner', '2017-09-06 22:56:59', NULL, 0),
(133, 145, 'ebc7016a-3525-41e5-93aa-7708a99051b1.jpg', 'ebc7016a-3525-41e5-93aa-7708a99051b1-thumbnail.png', 'SOUTHWESTERN_WHITE_FISH_3.jpg', NULL, 1, 132, b'1', '2017-09-06 22:58:48', 'owner', '2017-09-06 22:58:48', NULL, 0),
(134, 145, '65f27b6c-76c8-4171-9fff-b840a0e23c6a.jpg', '65f27b6c-76c8-4171-9fff-b840a0e23c6a-thumbnail.png', 'SOUTHWESTERN_WHITE_FISH_1.jpg', NULL, 1, 133, b'1', '2017-09-06 22:58:49', 'owner', '2017-09-06 22:58:49', NULL, 0),
(135, 145, 'cbde1422-835c-47de-9611-b2392138e965.jpg', 'cbde1422-835c-47de-9611-b2392138e965-thumbnail.png', 'SOUTHWESTERN_WHITE_FISH_2.jpg', NULL, 1, 134, b'1', '2017-09-06 22:58:50', 'owner', '2017-09-06 22:58:50', NULL, 0),
(136, 146, 'e046fc1a-9951-404c-b9b5-f8ab5159cbff.jpg', 'e046fc1a-9951-404c-b9b5-f8ab5159cbff-thumbnail.png', 'CHEESE_CAKE_1.jpg', NULL, 1, 135, b'1', '2017-09-06 23:09:29', 'owner', '2017-09-06 23:09:29', NULL, 0),
(137, 146, '98b87aa9-1bf8-4188-a1d4-d0abc798942f.jpg', '98b87aa9-1bf8-4188-a1d4-d0abc798942f-thumbnail.png', 'CHEESE_CAKE_2.jpg', NULL, 1, 136, b'1', '2017-09-06 23:09:30', 'owner', '2017-09-06 23:09:30', NULL, 0),
(138, 147, '3a757107-c2fa-4a9b-a4ab-3512a4bb1e01.jpg', '3a757107-c2fa-4a9b-a4ab-3512a4bb1e01-thumbnail.png', 'MOLTEN_CHOCOLATE_CAKE_2.jpg', NULL, 1, 137, b'1', '2017-09-06 23:11:19', 'owner', '2017-09-06 23:11:19', NULL, 0),
(139, 147, 'ff16af9d-b60d-4c1c-9e8c-f0a6b3155082.jpg', 'ff16af9d-b60d-4c1c-9e8c-f0a6b3155082-thumbnail.png', 'MOLTEN_CHOCOLATE_CAKE_1.jpg', NULL, 1, 138, b'1', '2017-09-06 23:11:20', 'owner', '2017-09-06 23:11:20', NULL, 0),
(140, 148, '1a78d1da-5a68-45ed-94ff-04fafd77d38e.jpg', '1a78d1da-5a68-45ed-94ff-04fafd77d38e-thumbnail.png', 'CHOCOLATE_CHIP_PARADISE_PIE_1.jpg', NULL, 1, 139, b'1', '2017-09-06 23:14:37', 'owner', '2017-09-06 23:14:37', NULL, 0),
(141, 148, '0c299a79-5048-49ad-8b9d-c13cbe0eaeb7.jpg', '0c299a79-5048-49ad-8b9d-c13cbe0eaeb7-thumbnail.png', 'CHOCOLATE_CHIP_PARADISE_PIE_2.jpg', NULL, 1, 140, b'1', '2017-09-06 23:14:38', 'owner', '2017-09-06 23:14:38', NULL, 0),
(142, 149, '8830ed2d-b394-4326-9b31-543655b77524.JPG', '8830ed2d-b394-4326-9b31-543655b77524-thumbnail.png', 'CARAMEL_APPLE_TART_1.JPG', NULL, 1, 141, b'1', '2017-09-06 23:16:30', 'owner', '2017-09-06 23:16:30', NULL, 0),
(143, 149, '98f9897c-a1a1-4783-beb6-864d95d24d87.jpg', '98f9897c-a1a1-4783-beb6-864d95d24d87-thumbnail.png', 'CARAMEL_APPLE_TART_2.jpg', NULL, 1, 142, b'1', '2017-09-06 23:16:31', 'owner', '2017-09-06 23:16:31', NULL, 0),
(144, 150, '0eff1e77-7bc1-4741-a71b-07c26122cdd7.jpg', '0eff1e77-7bc1-4741-a71b-07c26122cdd7-thumbnail.png', 'CHOCOLATE_BROWNIE_SUNDAE_1.jpg', NULL, 1, 143, b'1', '2017-09-06 23:18:09', 'owner', '2017-09-06 23:18:09', NULL, 0),
(145, 150, '480f59eb-e6e9-4a29-8be2-7554a2ca3483.jpg', '480f59eb-e6e9-4a29-8be2-7554a2ca3483-thumbnail.png', 'CHOCOLATE_BROWNIE_SUNDAE_2.jpg', NULL, 1, 144, b'1', '2017-09-06 23:18:10', 'owner', '2017-09-06 23:18:10', NULL, 0),
(146, 151, 'b8723b55-8187-4a77-8fab-199df5670db1.jpg', 'b8723b55-8187-4a77-8fab-199df5670db1-thumbnail.png', 'OLD_FASHIONED_CHOCOLATE_SHAKE_1.jpg', NULL, 1, 145, b'1', '2017-09-06 23:20:04', 'owner', '2017-09-06 23:20:04', NULL, 0),
(147, 151, '00fdafa1-480f-47e9-bac1-e9851d4c5d74.jpg', '00fdafa1-480f-47e9-bac1-e9851d4c5d74-thumbnail.png', 'OLD_FASHIONED_CHOCOLATE_SHAKE_2.jpg', NULL, 1, 146, b'1', '2017-09-06 23:20:05', 'owner', '2017-09-06 23:20:05', NULL, 0),
(148, 152, 'f6040460-dc4b-4140-b7c9-59ab45681e7f.jpg', 'f6040460-dc4b-4140-b7c9-59ab45681e7f-thumbnail.png', 'COKE.jpg', NULL, 1, 147, b'1', '2017-09-06 23:23:10', 'owner', '2017-09-06 23:23:10', NULL, 0),
(150, 153, '6b6a87ad-5c49-4d52-9d92-a63db2abbbfb.jpg', '6b6a87ad-5c49-4d52-9d92-a63db2abbbfb-thumbnail.png', 'COKE_LIGHT.jpg', NULL, 1, 149, b'1', '2017-09-06 23:24:37', 'owner', '2017-09-06 23:24:37', NULL, 0),
(151, 154, 'e018c637-fc46-4571-a0d7-2320c8432542.jpg', 'e018c637-fc46-4571-a0d7-2320c8432542-thumbnail.png', 'SPRITE.jpg', NULL, 1, 150, b'1', '2017-09-06 23:26:12', 'owner', '2017-09-06 23:26:12', NULL, 0),
(152, 155, '134db936-ebc2-4100-a1e1-d4863e2467e4.jpg', '134db936-ebc2-4100-a1e1-d4863e2467e4-thumbnail.png', 'SPRITE_LIGHT.jpg', NULL, 1, 151, b'1', '2017-09-06 23:27:01', 'owner', '2017-09-06 23:27:01', NULL, 0),
(153, 157, '77a17f2d-a6b0-4146-85ce-00d9da2816e8.jpg', '77a17f2d-a6b0-4146-85ce-00d9da2816e8-thumbnail.png', 'Fanta.jpg', NULL, 1, 152, b'1', '2017-09-06 23:28:05', 'owner', '2017-09-06 23:28:05', NULL, 0),
(154, 158, 'dad914fc-e152-41ba-82f3-ab1d218b6d6d.jpg', 'dad914fc-e152-41ba-82f3-ab1d218b6d6d-thumbnail.png', 'LEMONADE.jpg', NULL, 1, 153, b'1', '2017-09-06 23:31:41', 'owner', '2017-09-06 23:31:41', NULL, 0),
(155, 159, 'd9416b28-f68b-430e-add8-2f32cb1c7ead.jpg', 'd9416b28-f68b-430e-add8-2f32cb1c7ead-thumbnail.png', 'STRAWBERRY_LAMONADE.jpg', NULL, 1, 154, b'1', '2017-09-06 23:33:02', 'owner', '2017-09-06 23:33:02', NULL, 0),
(157, 161, 'a53edfbb-af85-485f-af03-eee3202d13a1.jpg', 'a53edfbb-af85-485f-af03-eee3202d13a1-thumbnail.png', 'FLAVOURED_ICED_TEA.jpg', NULL, 1, 156, b'1', '2017-09-06 23:35:59', 'owner', '2017-09-06 23:35:59', NULL, 0),
(158, 160, '80cb7490-2f79-4a3f-ada3-4018fb116407.jpg', '80cb7490-2f79-4a3f-ada3-4018fb116407-thumbnail.png', 'ORANGE_JUICE.jpg', NULL, 1, 157, b'1', '2017-09-06 23:36:13', 'owner', '2017-09-06 23:36:13', NULL, 0),
(159, 162, '93fef395-f2de-4ab9-ac2d-64360935bc3a.jpg', '93fef395-f2de-4ab9-ac2d-64360935bc3a-thumbnail.png', 'ARWA_LARGE.jpg', NULL, 1, 158, b'1', '2017-09-06 23:37:32', 'owner', '2017-09-06 23:37:32', NULL, 0),
(160, 163, '204bcedc-11f5-43c8-9429-af1cb8b9d794.jpg', '204bcedc-11f5-43c8-9429-af1cb8b9d794-thumbnail.png', 'ARWA_SMALL.jpg', NULL, 1, 159, b'1', '2017-09-06 23:39:07', 'owner', '2017-09-06 23:39:07', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_variant`
--

CREATE TABLE IF NOT EXISTS `item_variant` (
  `ITEM_VARIANT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEM_ID` bigint(20) NOT NULL,
  `VARIANT_ID` bigint(20) NOT NULL,
  `PRICE` decimal(7,2) NOT NULL,
  `APPROX_PREPERATION_TIME` int(11) DEFAULT '15',
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  `IS_PRIMARY` bit(1) DEFAULT b'0',
  `DATE_CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(100) NOT NULL,
  `LAST_UPDATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(100) DEFAULT NULL,
  `ACTION_TYPE` varchar(50) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ITEM_VARIANT_ID`),
  UNIQUE KEY `UNQ_ITMVAR` (`ITEM_ID`,`VARIANT_ID`),
  UNIQUE KEY `unique_variant_id` (`ITEM_ID`,`VARIANT_ID`),
  KEY `FK_ITEM_VAR_VARID_idx` (`VARIANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=132 ;

--
-- Dumping data for table `item_variant`
--

INSERT INTO `item_variant` (`ITEM_VARIANT_ID`, `ITEM_ID`, `VARIANT_ID`, `PRICE`, `APPROX_PREPERATION_TIME`, `IS_ACTIVE`, `IS_PRIMARY`, `DATE_CREATED`, `CREATED_BY`, `LAST_UPDATED`, `UPDATED_BY`, `ACTION_TYPE`, `VERSION`) VALUES
(31, 89, 1, '23.00', 10, b'1', b'1', '2017-03-23 20:23:40', 'admin', '2017-03-23 20:23:40', NULL, NULL, 0),
(57, 89, 92, '50.00', 15, b'1', b'0', '2017-03-25 22:52:24', 'staff1', '2017-03-27 22:57:56', 'staff1', NULL, 12),
(58, 90, 1, '50.00', NULL, b'1', b'1', '2017-04-20 21:07:14', 'admin', '2017-04-20 21:07:14', NULL, NULL, 0),
(59, 91, 1, '36.00', 30, b'1', b'1', '2017-07-04 07:29:03', 'owner', '2017-07-04 07:29:03', NULL, NULL, 0),
(60, 92, 1, '46.00', 20, b'1', b'1', '2017-07-05 05:18:04', 'owner', '2017-07-05 05:18:04', NULL, NULL, 0),
(61, 93, 1, '39.00', NULL, b'1', b'1', '2017-07-05 05:21:08', 'owner', '2017-07-05 05:21:08', NULL, NULL, 0),
(62, 94, 1, '39.00', 20, b'1', b'1', '2017-07-05 06:09:32', 'owner', '2017-07-05 06:09:32', NULL, NULL, 0),
(63, 95, 1, '36.00', NULL, b'1', b'1', '2017-07-08 11:55:42', 'owner', '2017-07-08 11:55:42', NULL, NULL, 0),
(64, 96, 1, '46.00', NULL, b'1', b'1', '2017-07-08 11:58:38', 'owner', '2017-07-08 11:58:38', NULL, NULL, 0),
(65, 97, 1, '19.00', 15, b'1', b'1', '2017-07-09 01:03:27', 'owner', '2017-07-09 01:03:27', NULL, NULL, 0),
(66, 98, 1, '32.00', NULL, b'1', b'1', '2017-07-09 01:16:42', 'owner', '2017-07-09 01:16:42', NULL, NULL, 0),
(67, 99, 1, '49.00', 10, b'1', b'1', '2017-07-09 02:06:48', 'owner', '2017-07-09 02:06:48', NULL, NULL, 0),
(68, 100, 1, '54.00', NULL, b'1', b'1', '2017-07-09 02:13:07', 'owner', '2017-07-09 02:13:07', NULL, NULL, 0),
(69, 101, 1, '56.00', 20, b'1', b'1', '2017-07-09 02:17:38', 'owner', '2017-07-09 02:17:38', NULL, NULL, 0),
(70, 102, 1, '52.00', 20, b'1', b'1', '2017-07-09 16:39:38', 'owner', '2017-07-09 16:39:38', NULL, NULL, 0),
(71, 103, 1, '52.00', NULL, b'1', b'1', '2017-07-09 16:42:15', 'owner', '2017-07-09 16:42:15', NULL, NULL, 0),
(72, 104, 1, '29.00', 10, b'1', b'1', '2017-07-09 16:44:15', 'owner', '2017-07-09 16:44:15', NULL, NULL, 0),
(73, 105, 1, '19.00', 5, b'1', b'1', '2017-07-09 16:51:20', 'owner', '2017-07-09 16:51:20', NULL, NULL, 0),
(74, 106, 1, '24.00', NULL, b'1', b'1', '2017-07-09 16:54:19', 'owner', '2017-07-09 16:54:19', NULL, NULL, 0),
(75, 107, 1, '42.00', 20, b'1', b'1', '2017-07-09 17:38:12', 'owner', '2017-07-09 17:38:12', NULL, NULL, 0),
(76, 108, 1, '44.00', 15, b'1', b'1', '2017-07-09 18:44:29', 'owner', '2017-07-09 18:44:29', NULL, NULL, 0),
(77, 109, 1, '44.00', 15, b'1', b'1', '2017-07-09 18:46:35', 'owner', '2017-07-09 18:46:35', NULL, NULL, 0),
(78, 110, 1, '39.00', 15, b'1', b'1', '2017-07-09 18:48:25', 'owner', '2017-07-09 18:48:25', NULL, NULL, 0),
(79, 111, 1, '44.00', NULL, b'1', b'1', '2017-07-09 18:57:48', 'owner', '2017-07-09 18:57:48', NULL, NULL, 0),
(80, 112, 1, '39.00', 15, b'1', b'1', '2017-07-09 19:40:37', 'owner', '2017-07-09 19:40:37', NULL, NULL, 0),
(81, 113, 1, '48.00', 15, b'1', b'1', '2017-07-09 19:44:21', 'owner', '2017-07-09 19:44:21', NULL, NULL, 0),
(82, 114, 1, '46.00', 15, b'1', b'1', '2017-07-09 21:05:01', 'owner', '2017-07-09 21:05:01', NULL, NULL, 0),
(83, 115, 1, '44.00', 15, b'1', b'1', '2017-07-09 21:35:11', 'owner', '2017-07-09 21:35:11', NULL, NULL, 0),
(84, 116, 1, '44.00', 15, b'1', b'1', '2017-07-09 21:38:14', 'owner', '2017-07-09 21:38:14', NULL, NULL, 0),
(85, 117, 1, '46.00', 15, b'1', b'1', '2017-07-09 22:21:07', 'owner', '2017-07-09 22:21:07', NULL, NULL, 0),
(86, 118, 1, '109.00', 30, b'1', b'1', '2017-07-09 22:36:43', 'owner', '2017-07-09 22:36:43', NULL, NULL, 0),
(87, 119, 1, '99.00', 30, b'1', b'1', '2017-07-10 21:53:03', 'owner', '2017-07-10 21:53:03', NULL, NULL, 0),
(88, 120, 1, '99.00', 30, b'1', b'1', '2017-07-10 21:57:25', 'owner', '2017-07-10 21:57:25', NULL, NULL, 0),
(89, 121, 1, '59.00', 20, b'1', b'1', '2017-07-10 22:00:18', 'owner', '2017-07-10 22:00:18', NULL, NULL, 0),
(90, 122, 1, '119.00', 30, b'1', b'1', '2017-07-10 22:03:31', 'owner', '2017-07-10 22:03:31', NULL, NULL, 0),
(91, 123, 1, '65.00', 15, b'1', b'1', '2017-07-10 22:08:51', 'owner', '2017-07-10 22:08:51', NULL, NULL, 0),
(92, 124, 1, '59.00', 20, b'1', b'1', '2017-07-10 22:12:18', 'owner', '2017-07-10 22:12:18', NULL, NULL, 0),
(93, 125, 1, '59.00', 20, b'1', b'1', '2017-07-10 22:14:40', 'owner', '2017-07-10 22:14:40', NULL, NULL, 0),
(94, 126, 1, '69.00', 20, b'1', b'1', '2017-07-10 22:16:49', 'owner', '2017-07-10 22:16:49', NULL, NULL, 0),
(95, 127, 1, '65.00', 15, b'1', b'1', '2017-07-11 00:29:30', 'owner', '2017-07-11 00:29:30', NULL, NULL, 0),
(96, 128, 1, '65.00', 15, b'1', b'1', '2017-07-11 00:37:02', 'owner', '2017-07-11 00:37:02', NULL, NULL, 0),
(97, 129, 1, '59.00', 15, b'1', b'1', '2017-07-13 20:33:16', 'owner', '2017-07-13 20:33:16', NULL, NULL, 0),
(98, 130, 1, '59.00', 15, b'1', b'1', '2017-07-13 20:35:32', 'owner', '2017-07-13 20:35:32', NULL, NULL, 0),
(99, 131, 1, '69.00', 15, b'1', b'1', '2017-07-13 20:37:34', 'owner', '2017-07-13 20:37:34', NULL, NULL, 0),
(100, 132, 1, '49.00', 15, b'1', b'1', '2017-07-13 20:40:11', 'owner', '2017-07-13 20:40:11', NULL, NULL, 0),
(101, 133, 1, '72.00', 15, b'1', b'1', '2017-07-13 20:42:20', 'owner', '2017-07-13 20:42:20', NULL, NULL, 0),
(102, 134, 1, '82.00', 20, b'1', b'1', '2017-07-13 20:44:03', 'owner', '2017-07-13 20:44:03', NULL, NULL, 0),
(103, 135, 1, '82.00', 30, b'1', b'1', '2017-07-13 21:25:49', 'owner', '2017-07-13 21:25:49', NULL, NULL, 0),
(104, 136, 1, '69.00', 25, b'1', b'1', '2017-07-13 21:53:50', 'owner', '2017-07-13 21:53:50', NULL, NULL, 0),
(105, 137, 1, '69.00', 30, b'1', b'1', '2017-07-13 23:13:51', 'owner', '2017-07-13 23:13:51', NULL, NULL, 0),
(106, 137, 95, '69.00', 25, b'1', b'0', '2017-07-14 00:17:17', 'owner', '2017-07-14 00:21:04', 'owner', NULL, 1),
(107, 138, 1, '66.00', 20, b'1', b'1', '2017-09-06 22:31:03', 'owner', '2017-09-06 22:31:03', NULL, NULL, 0),
(108, 139, 1, '56.00', 15, b'1', b'1', '2017-09-06 22:42:44', 'owner', '2017-09-06 22:42:44', NULL, NULL, 0),
(109, 140, 1, '56.00', 15, b'1', b'1', '2017-09-06 22:46:06', 'owner', '2017-09-06 22:46:06', NULL, NULL, 0),
(110, 141, 1, '56.00', 15, b'1', b'1', '2017-09-06 22:48:50', 'owner', '2017-09-06 22:48:50', NULL, NULL, 0),
(111, 142, 1, '66.00', 20, b'1', b'1', '2017-09-06 22:50:43', 'owner', '2017-09-06 22:50:43', NULL, NULL, 0),
(112, 143, 1, '56.00', 20, b'1', b'1', '2017-09-06 22:52:42', 'owner', '2017-09-06 22:52:42', NULL, NULL, 0),
(113, 144, 1, '59.00', NULL, b'1', b'1', '2017-09-06 22:55:39', 'owner', '2017-09-06 22:55:39', NULL, NULL, 0),
(114, 145, 1, '62.00', 20, b'1', b'1', '2017-09-06 22:58:14', 'owner', '2017-09-06 22:58:14', NULL, NULL, 0),
(115, 146, 1, '34.00', 10, b'1', b'1', '2017-09-06 23:08:37', 'owner', '2017-09-06 23:08:37', NULL, NULL, 0),
(116, 147, 1, '40.00', 10, b'1', b'1', '2017-09-06 23:10:44', 'owner', '2017-09-06 23:10:44', NULL, NULL, 0),
(117, 148, 1, '36.00', 10, b'1', b'1', '2017-09-06 23:13:25', 'owner', '2017-09-06 23:13:25', NULL, NULL, 0),
(118, 149, 1, '29.00', NULL, b'1', b'1', '2017-09-06 23:15:22', 'owner', '2017-09-06 23:15:22', NULL, NULL, 0),
(119, 150, 1, '29.00', 10, b'1', b'1', '2017-09-06 23:17:24', 'owner', '2017-09-06 23:17:24', NULL, NULL, 0),
(120, 151, 1, '19.00', 5, b'1', b'1', '2017-09-06 23:19:27', 'owner', '2017-09-06 23:19:27', NULL, NULL, 0),
(121, 152, 1, '6.00', NULL, b'1', b'1', '2017-09-06 23:22:14', 'owner', '2017-09-06 23:22:14', NULL, NULL, 0),
(122, 153, 1, '6.00', NULL, b'1', b'1', '2017-09-06 23:24:04', 'owner', '2017-09-06 23:24:04', NULL, NULL, 0),
(123, 154, 1, '6.00', NULL, b'1', b'1', '2017-09-06 23:25:10', 'owner', '2017-09-06 23:25:10', NULL, NULL, 0),
(124, 155, 1, '6.00', NULL, b'1', b'1', '2017-09-06 23:26:39', 'owner', '2017-09-06 23:26:39', NULL, NULL, 0),
(125, 157, 1, '6.00', NULL, b'1', b'1', '2017-09-06 23:27:39', 'owner', '2017-09-06 23:27:39', NULL, NULL, 0),
(126, 158, 1, '19.00', NULL, b'1', b'1', '2017-09-06 23:31:24', 'owner', '2017-09-06 23:31:24', NULL, NULL, 0),
(127, 159, 1, '19.00', NULL, b'1', b'1', '2017-09-06 23:32:34', 'owner', '2017-09-06 23:32:34', NULL, NULL, 0),
(128, 160, 1, '22.00', NULL, b'1', b'1', '2017-09-06 23:33:52', 'owner', '2017-09-06 23:33:52', NULL, NULL, 0),
(129, 161, 1, '15.00', NULL, b'1', b'1', '2017-09-06 23:35:26', 'owner', '2017-09-06 23:35:26', NULL, NULL, 0),
(130, 162, 1, '22.00', NULL, b'1', b'1', '2017-09-06 23:37:00', 'owner', '2017-09-06 23:37:00', NULL, NULL, 0),
(131, 163, 1, '14.00', NULL, b'1', b'1', '2017-09-06 23:38:46', 'owner', '2017-09-06 23:38:46', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_variant_translation`
--

CREATE TABLE IF NOT EXISTS `item_variant_translation` (
  `ITEM_VAR_TRANSLATION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `ITEM_VARIANT_ID` bigint(20) NOT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `DIETARY_INFORMATION` varchar(1000) DEFAULT NULL,
  `SHOW_DESCRIPTION` bit(1) DEFAULT b'1',
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  `IS_DEFAULT` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ITEM_VAR_TRANSLATION_ID`),
  UNIQUE KEY `UNQ_ITTRA` (`ITEM_VARIANT_ID`,`LANGUAGE_ID`),
  UNIQUE KEY `unique_language_id` (`ITEM_VARIANT_ID`,`LANGUAGE_ID`),
  KEY `FK_ITEM_TRANS` (`LANGUAGE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=193 ;

--
-- Dumping data for table `item_variant_translation`
--

INSERT INTO `item_variant_translation` (`ITEM_VAR_TRANSLATION_ID`, `TITLE`, `DESCRIPTION`, `ITEM_VARIANT_ID`, `LANGUAGE_ID`, `DIETARY_INFORMATION`, `SHOW_DESCRIPTION`, `VERSION`, `IS_DEFAULT`) VALUES
(28, 'Item 1', 'Item 1 description', 31, 1, NULL, b'1', 0, b'1'),
(41, 'Item 1 - Var 1', '41351', 57, 1, NULL, b'0', 0, b'0'),
(46, 'هفثة 1 فقشىسمشفهخى', 'يبلاتنلباتةو اتنىلاةو', 31, 2, NULL, b'1', 3, b'0'),
(47, 'Item 2', 'Item 2', 58, 1, NULL, b'1', 0, b'1'),
(48, 'SOUTHWESTERN EGGROLLS', 'Black beans, corn, jalapeno Jack cheese, red peppers and spinach wrapped inside a crispy flour tortilla. We serve it with our avocado-ranch dipping sauce.', 59, 1, NULL, b'1', 0, b'1'),
(49, 'ساوث ويسترن إيجرولز', 'فاصولياء سوداء، ذرة، جبنة جاك هالابينو، فلفل أحمر وسبانخ، ملفوفة بشرائح عجينة التورتيلا. تقدم مع صوص الأفوكادو رانش الخاصة بنا.', 59, 2, NULL, b'1', 0, b'0'),
(50, 'TEXAS CHEESE FRIES', 'Homestyle fries smothered in chili, melted cheese, jalapeňos and crispy beef bacon. Served with Chipotleranch dipping sauce.', 60, 1, NULL, b'1', 0, b'1'),
(51, 'تكساس تشيلي تشيز فرايز', 'بطاطا مقلية على الطريقة المنزلية، جبنة ذائبة مع لحم بقري متبل، هالابينو و بيكون لحم بقري مقرمش. يقدم مع صوص تشيبوتلي-رانش.', 60, 2, NULL, b'1', 0, b'0'),
(52, 'BONELESS BUFFALO WINGS', 'Breaded chicken breast tossed in spicy wing sauce.  Served with cool blue cheese dressing.', 61, 1, NULL, b'1', 0, b'1'),
(53, 'بونليس بوفالو وينجز', 'أجنحة دجاج بدون عظم متبلة بصوص بوفالو وينجز. تقدم مع صوص البلو تشيز.', 61, 2, NULL, b'1', 0, b'0'),
(54, 'WINGS OVER BUFFALO', 'Chicken wings tossed in our spicy buffalo wing sauce.  Served with cool blue cheese dressing.', 62, 1, NULL, b'1', 0, b'1'),
(55, 'وينجز أوفر بوفالو', 'قطع دجاج متبلة بصوص بوفالو وينجز. تقدم مع صوص بلو تشيز اللذيذة.', 62, 2, NULL, b'1', 0, b'0'),
(56, 'FRIED CHEESE', 'Crispy breaded mozzarella sticks served with marinara sauce for dipping.', 63, 1, NULL, b'1', 0, b'1'),
(57, 'فرايد تشيز', 'أصابع جبنة موزاريلا مغطاة بالدقيق مقلية ومقرمشة. تقدم مع صلصة المارينارا.', 63, 2, NULL, b'1', 0, b'0'),
(58, 'CLASSIC NACHOS', 'Our nachos have beans, queso with a hint of seasoned beef, cheese and jalapeños on every chip. Served with pico de gallo and sour cream.', 64, 1, NULL, b'1', 0, b'1'),
(59, 'كلاسيك ناتشوز', 'ناتشوز مع الفاصولياء، جبن الكازو مع اللحم البقري المتبل وهلابينو يقدم مع صوص بيكو دي جايو وكريمة حامضة.', 64, 2, NULL, b'1', 0, b'0'),
(60, 'BOTTOMLESS TOSTADA CHIPS', 'Warm and crispy tostada chips with our flavorful house-made salsa.', 65, 1, NULL, b'1', 0, b'1'),
(61, 'كلاسيك ناتشوز', 'رقائق كورن توستادا مقرمشة مع صلصتنا الخاصة المحضرة في مطعمنا.', 65, 2, NULL, b'1', 0, b'0'),
(62, 'SKILLET QUESO', 'Our appetizing cheese dip with seasoned beef is served with warm tostada chips and our house-made salsa.', 66, 1, NULL, b'1', 0, b'1'),
(63, 'سكيليت كازو', 'جبنة التغميس مع اللحم البقري المتبل. تقدم مع توستادا تشيبس الساخنة.', 66, 2, NULL, b'1', 0, b'0'),
(64, 'NEW SANTA FE CHICKEN SALAD', 'Grilled chili-rubbed chicken with spicy Santa Fe sauce, house-made pico de gallo, fresh diced avocado, chopped cilantro, crispy tortilla strips with house-made ranch dressing.', 67, 1, NULL, b'1', 0, b'1'),
(65, 'جديد سلطة سانتا في تشيكن', '.دجاج تشيلي مشوي مع صوص سانتا في الحارة، البيكو دي جايو، قطع أفوكادو، سيلانترو وشرائح التورتيلا المقرمشة مع صوص رانش المحضرة محلياً في مطعمنا', 67, 2, NULL, b'1', 0, b'0'),
(66, 'BBQ CHICKEN SALAD', 'Grilled chicken breast, crispy beef bacon, cheddar cheese, pico de gallo, corn relish, cilantro, crispy tortilla strips and a touch of BBQ sauce.  Served with ranch dressing.', 68, 1, NULL, b'1', 0, b'1'),
(67, 'سلطة الباربيكيو تشيكن', '.سلطة الباربيكيو تشيكن صدور دجاج مشوية، بيكون بقري مقرمش، جبنة شيدر، صوص بيكو دي جايو، خليط الذرة، سيلانترو، قطع التورتيلا المقرمشة وصوص الباربيكيو. تقدم مع صوص الرانش', 68, 2, NULL, b'1', 0, b'0'),
(68, 'CAESAR SALAD', 'Crisp romaine tossed in our special Caesar dressing with croutons and Parmesan cheese. \r\n(With Grilled Garlic-Lime Shrimp)', 69, 1, NULL, b'1', 0, b'1'),
(69, 'سلطة سيزر', '.قطع خس روماني مغطاة بصوص سيزر مع مكعبات خبز التوست المحمص و جبنة البارميزان', 69, 2, NULL, b'1', 2, b'0'),
(70, 'QUESADILLA EXPLOSION SALAD', 'Fajita-marinated chicken, corn relish, mixed cheeses, cilantro, diced tomato and crispy tortilla strips.  Garnished with an ancho-ranch drizzle and cheese quesadilla wedges.  Served with our citrus-balsamic dressing.', 70, 1, NULL, b'1', 0, b'1'),
(71, 'سلطة كاسادياز إكسبلوجن', '.شرائح من صدر الدجاج المتبل المشوي مع خليط الذرة. جبنة، سيلانترو، مكعبات طماطم وشرائح التورتيلا المقرمشة. مزينة بصوص تشيبوتلي - رانش وكاساديا بالجبنة. تقدم مع صوص البالساميك الحامض', 70, 2, NULL, b'1', 0, b'0'),
(72, 'SOUTHWESTERN COBB SALAD', 'Boneless crispy chicken breast with corn relish, crispy beef bacon, diced eggs, mixed cheeses and fresh pico de gallo.  Served with our avocado-ranch dressing.', 71, 1, NULL, b'1', 0, b'1'),
(73, 'سلطة الساوثويسترن كب', 'صدر دجاج مقرمش، خليط الذرة، بيكون بقري مقرمش، مكعبات بيض، خليط من الجبنة والبيكو دي جايو الطازجة. تقدم مع صوص أفوكادو رانش.', 71, 2, NULL, b'1', 1, b'0'),
(74, 'SOUP AND SIDE SALAD', 'A delicious bowl of soup with a Caesar or New House salad', 72, 1, NULL, b'1', 0, b'1'),
(75, 'الحساء وأطباق السلطات الجانبية', 'طبق من الحساء الشهي مع سلطة سيزر أو سلطة المطعم الجديدة.', 72, 2, NULL, b'1', 0, b'0'),
(76, 'SIDE SALAD', 'Caesar or New House salad', 73, 1, NULL, b'1', 1, b'1'),
(77, 'طبق سلطة جانبي', 'سلطة سيزر أو سلطة هاوس الجديدة.', 73, 2, NULL, b'1', 0, b'0'),
(78, 'SOUP OF THE DAY', 'SOUP OF THE DAY', 74, 1, NULL, b'1', 0, b'1'),
(79, 'الحساء اليومي', 'للإستفسار عن الطبق اليومي، يرجى مراجعة النادل القائم على الخدمة.', 74, 2, NULL, b'1', 0, b'0'),
(80, 'CAJUN CHICKEN SANDWICH', 'Spicy, Cajun-style grilled chicken breast with jalapeno Jack cheese, lettuce, tomato, pickle and chipotle-ranch dressing, topped with crispy onion strings.', 75, 1, NULL, b'1', 0, b'1'),
(81, 'كيجن تشيكن سندويتش', 'صدر الدجاج المشوي الحار مع جبنة جاك هالابينو، خس، طماطم، خيار مخلل وصوص تشيبوتلي- رانش، مزينة بحلقات البصل المقرمش.', 75, 2, NULL, b'1', 0, b'0'),
(82, 'BUFFALO CHICKEN RANCH SANDWICH', 'Crispy breaded chicken breast with tangy wing sauce, cool ranch dressing, lettuce and tomato.', 76, 1, NULL, b'1', 1, b'1'),
(83, 'بوفالو تشيكن رانش سندويتش', 'صدر دجاج مقرمش يقدم مع صوص شيليز الحار (وينجز صوص)، صوص الرانش الشهي مع الخس والطماطم.', 76, 2, NULL, b'1', 0, b'0'),
(84, 'NEW CALIFORNIA TURKEY CLUB TOASTED SANDWICH', 'Thinly sliced turkey, applewood smoked beef bacon, fresh sliced avocado, tomato, red onion,  Swiss cheese, lettuce and cilantro mayo on a toasted wheat bread.', 77, 1, NULL, b'1', 0, b'1'),
(85, 'جديد كاليفورنيا تركي كلوب توستد ساندويتش', 'شرائح تركي، بيكون اللحم البقري (آبل وود) شرائح الأفوكادو الطازجة، طماطم، بصل أحمر، جبنة سويسرية، خس ومايونيز سيلانترو على خبز القمح المحمص.', 77, 2, NULL, b'1', 0, b'0'),
(86, 'GRILLED CHICKEN SANDWICH', 'Marinated grilled chicken, crispy beef bacon, lettuce, tomato, Swiss cheese and honey-mustard dressing. Served with seasonal veggies.', 78, 1, NULL, b'1', 0, b'1'),
(87, 'جريلد تشيكن سندويتش', 'صدر الدجاج المتبل المشوي والبيكون البقري المقرمش مع الخس، الطماطم، الجبنة السويسرية وصوص الخردل بالعسل (هني ماسترد) .\r\nلإختيار قليل الدسم  أطلب صدر الدجاج مع صلصة الخردل بالعسل  منزوعة الدسم مع الخبز الأسمر وخضروات الموسم.', 78, 2, NULL, b'1', 1, b'0'),
(88, 'NEW BACON AVOCADO CHICKEN SANDWICH', 'Grilled chicken breast topped with applewood smoked bacon, Provolone, sliced avocado, sautéed onions, spring mix, tomato and cilantro pesto mayo on a toasted pretzel roll', 79, 1, NULL, b'1', 0, b'1'),
(89, 'جديد بيف بيكون أفوكادو تشيكن سندويتش', 'صدر دجاج مشوي مع اللحم البقري المتبل (آبل وود)، جبنة سويسرية، شرائح أفوكادو، بصل سوتيه، خس، طماطم وسيلانترو بيستو مايونيز على خبز فيلي رول محمص.', 79, 2, NULL, b'1', 0, b'0'),
(90, 'OLDTIMER', 'Our signature burger, made with hand-seasoned beef patty seared to perfection.  Served with mustard and onion.', 80, 1, NULL, b'1', 0, b'1'),
(91, 'أولد تايمر', 'برجر اللحم البقري مع الخردل، شرائح الطماطم ،الخس، المخلل والبصل.', 80, 2, NULL, b'1', 0, b'0'),
(92, 'MUSHROOM-SWISS', 'Fresh sautéed mushrooms with aged Swiss cheese.', 81, 1, NULL, b'1', 0, b'1'),
(93, 'مشروم- سويس برجر', 'برجر مشوي مع المشروم، الجبنة السويسرية، المايونيز، شرائح الطماطم، الخس والمخلل.', 81, 2, NULL, b'1', 0, b'0'),
(94, 'BEEF BACON BURGER', 'Topped with crispy beef bacon, aged cheddar cheese and mayo', 82, 1, NULL, b'1', 0, b'1'),
(95, 'برجر بيكون بقري', 'برجر مشوي يقدم مع بيكون البقري المقرمش، جبنة شيدر، المايونيز، شرائح الطماطم والخس والمخللات', 82, 2, NULL, b'1', 0, b'0'),
(96, 'BBQ RANCH BURGER', 'Crispy beef bacon, aged cheddar cheese, BBQ sauce and ranch dressing.', 83, 1, NULL, b'1', 0, b'1'),
(97, 'باربيكيو رانش برجر', 'برجر مشوي يقدم مع بيكون بقري، جبنة شيدر، صوص الباربيكيو، صوص الرانش، الخس، الطماطم والخيار المخلل.', 83, 2, NULL, b'1', 0, b'0'),
(98, 'NEW GUACAMOLE BURGER', 'Topped with fresh guacamole, melted Monterey Jack cheese, fire-roasted jalapeños, sautéed red and green bell peppers, caramelized onions and cumin-lime sour cream.', 84, 1, NULL, b'1', 0, b'1'),
(99, 'جديد برجر جواكامولي', 'برجر اللحم، أفوكادو طازج، بصل محمر، جبنة سويسرية، صوص أفوكادو رانش.', 84, 2, NULL, b'1', 0, b'0'),
(100, 'BIG MOUTH BURGER BITES', 'Four mini burgers with layers of flavor - applewood smoked beef bacon, American cheese, sautéed onions and ranch.  Served with crispy onion strings and ranch dressing.', 85, 1, NULL, b'1', 0, b'1'),
(101, 'بيج ماوث برجر بايتس', 'ربع قطع من البرجر الصغير مع شرائح من لحم بقر آبل وود المقدد والمدخن، جبنة أمريكية، بصل سوتيه وصوص الرانش. يقدم مع شرائح البصل المقرمشة وصوص الرانش.', 85, 2, NULL, b'1', 0, b'0'),
(102, 'GRILLED BEEF TENDERLOIN', '8 oz. filet with our own special seasonings and topped with garlic butter.', 86, 1, NULL, b'1', 0, b'1'),
(103, 'جريلد بيف تندرلوين', 'جرام فيليه ستيك متبلة بتتبيلة خاصة ومشوية، مغطاة بزبدة الثوم.', 86, 2, NULL, b'1', 0, b'0'),
(104, 'NEW YORK STRIPS', '12 oz. New York strip with our own special seasonings, topped with seasoned butter.', 87, 1, NULL, b'1', 0, b'1'),
(105, 'نيويورك ستريب', 'جرام ستريب ستيك. مغطاة بالزبدة مع توابلناالخاصة.', 87, 2, NULL, b'1', 0, b'0'),
(106, 'FLAMED- GRILLED RIBEYE', '12 oz. ribeye steak with our own special seasoning and topped with garlic butter.\\nFor spicy flavor, make it cajun ribeye.', 88, 1, NULL, b'1', 0, b'1'),
(107, 'جريلد ريب آي', 'جرام ستيك ريب آي البقري مع توابلنا الخاصة. مغطاة بزبدة الثوم والأعشاب. \\nلنكهة حارة، جربها مع كاجون ريب آي*', 88, 2, NULL, b'1', 0, b'0'),
(108, 'COUNTRY-FRIED STEAK', 'Our fork-tender hand battered beef steak with mashed potatoes and black pepper gravy, served with sweet corn on the cob and garlic toast.', 89, 1, NULL, b'1', 0, b'1'),
(109, 'كانتري فرايد ستيك"', 'ستيك اللحم البقري المقلي المميز، يقدم مع الذرة الحلوة، البطاطس المهروسة، الفلفل الأسود وخبز التوست بالثوم.', 89, 2, NULL, b'1', 0, b'0'),
(110, 'NEW MELTED PEPPER JACK RIBEYE', 'Ribeye seasoned with peppercorn spice and topped with melted pepper Jack Cheese, served with jalapeño mashed potatoes and steamed veggies.', 90, 1, NULL, b'1', 0, b'1'),
(111, 'ستيك ريب آي مع جبنة جاك الذائبة مع الفلفل الأسود', 'ستيك ريب آي متبل بالفلفل الأسود مع جبنة جاك بالفلفل الذائب، يقدم مع البطاطس المهروسة بالهالابينو والخضار المطهوة على البخار.', 90, 2, NULL, b'1', 0, b'0'),
(112, 'CHICKEN ENCHILADA PASTA', 'Penne pasta topped with tender strips of char-grilled chicken, corn, mushrooms and onions in a rich enchilada sauce with melted chipotle cheese. Sprinkled with crisp tortilla strips, pico de gallo and drizzled in a creamy cilantro aioli sauce.', 91, 1, NULL, b'1', 0, b'1'),
(113, 'تشيكن إنشيلادا باستا', 'باستا بيني مع قطع دجاج مشوي، الذرة، مشروم والبصل مع صوص التشيبوتلي والجبنة. تقدم مع خبز التورتيلا، بيكو دي جايو وصوص السيلانترو بالكريمة.', 91, 2, NULL, b'1', 0, b'0'),
(114, 'CAJUN CHICKEN PASTA', 'Sliced, Cajun-seasoned chicken breast on penne pasta with creamy Alfredo sauce, seasoned tomatoes, Parmesan cheese and garlic toast.', 92, 1, NULL, b'1', 0, b'1'),
(115, 'كاجون تشيكن باستا', 'شرائح صدر دجاج متبلة مشوية تقدم مع باستا بيني، صوص كريمة ألفريدو، طماطم متبلة، جبنة البارميزان و خبز التوست بالثوم.', 92, 2, NULL, b'1', 0, b'0'),
(116, 'NEW SMOKED CHICKEN JALAPEÑO MAC & CHEESE', 'Penne pasta in a creamy Alfredo sauce, sharp cheddar cheese, jalapeños and sliced tender pieces of smoked chicken seasoned with smoked paprika.  Topped with melted sharp cheddar and house-made pico de gallo.', 93, 1, NULL, b'1', 0, b'1'),
(117, 'جديد سموكد تشيكن هالابينو ماك آند تشيز', 'باستا بيني في صوص كريمة ألفريدو، جبنة شيدر، هالابينو وقطع دجاج متبلة بالبابريكا. تقدم مع جبنة شيدر وبيكو دي جايو المحضرة محلياً في مطعمنا.', 93, 2, NULL, b'1', 0, b'0'),
(118, 'GRILLED SHRIMP ALFREDO', 'Spicy garlic-lime shrimp over penne pasta tossed in creamy Alfredo sauce, seasoned tomatoes, parmesan cheese and garlic toast.', 94, 1, NULL, b'1', 0, b'1'),
(119, 'جريلد شريمب ألفريدو', 'روبيان حار مع باستا بيني في صوص كريمة ألفريدو. يقدم مع الطماطم، البارميزان تشيز وخبز التوست بالثوم.', 94, 2, NULL, b'1', 0, b'0'),
(120, 'CHIPOTLE PESTO PASTA', 'Penne pasta with chicken, beef or shrimp in a spicy chipotle pesto sauce and sprinkled with pico de gallo.', 95, 1, NULL, b'1', 0, b'1'),
(121, 'تشيبوتلي بيستو باستا', 'بيني باستا تقدم مع إختيارك من الدجاج، اللحم، روبيان وتقدم مع صوص التشيبوتلي الحارة و تغطى بالبيكو دي جايو.', 95, 2, NULL, b'1', 0, b'0'),
(122, 'CILANTRO PESTO PASTA', 'Penne pasta topped with chicken, beef or shrimp in a savory cilantro pesto sauce, sprinkled with pico de gallo.', 96, 1, NULL, b'1', 0, b'1'),
(123, 'سيلانترو باستا', 'بيني باستا تقدم مع إختيارك من الدجاج، اللحم، روبيان مع صوص البيستو وتغطى بالبيكو دي جايو.', 96, 2, NULL, b'1', 0, b'0'),
(124, 'CHICKEN CLUB TACOS', 'Grilled chicken breast, chopped crispy beef bacon, ancho-ranch dressing, diced tomatoes, mixed cheeses and lettuce.\r\nTry Club Tacos with Steak', 97, 1, NULL, b'1', 0, b'1'),
(125, 'تشيكن كلوب تاكوز', 'صدر دجاج مشوي، قطع بيكون بقري مقرمش، صوص رانش، قطع طماطم، أجبان مشكلة وخس في –أنشو خبز التورتيلا.\r\nجربها مع اللحم البقري', 97, 2, NULL, b'1', 0, b'0'),
(126, 'CRISPY CHICKEN TACOS', 'Three flour tortillas with applewood smoked beef bacon, tomatoes, cheese, lettuce, honey-chipotle drizzle and ranch dressing.', 98, 1, NULL, b'1', 0, b'1'),
(127, 'كريسبي تشيكن تاكوز', 'صدور دجاج كريسبي تشيكن مضافة على ثلاثة قطع من خبز التورتيلا، لحم بقر مقدد، طماطم، جبنة، خس، رشة من تشيبوتيلي بالعسل وصوص رانش.', 98, 2, NULL, b'1', 0, b'0'),
(128, 'NEW SPICY GRILLED SHRIMP TACOS', 'Grilled spicy chili-lime shrimp wrapped in three flour tortillas and topped with fresh cilantro-slaw, housemade pico de gallo and sliced avocado. Served with rice and black beans.\r\nAll tacos are served with rice and black beans.', 99, 1, NULL, b'1', 0, b'1'),
(129, 'جديد سبايسي جريلد شريمب تاكوز', 'روبيان حار مشوي ومتبل بالشيلي والحامض ملفوف بثلاث قطع من خبز التورتيلا ومضاف عليها سيلانترو طازج، بيكو دي جايو طازج، وشرائح من الأفوكادو.\r\nجميع أنواع تاكوز تقدم مع الأرز والفاصولياء السوداء.', 99, 2, NULL, b'1', 0, b'0'),
(130, 'CLASSIC QUESADILLA STEAK or CHICKEN', 'Marinated Fajita with bell peppers, grilled onions and jack cheese in buttery toasted tortillas. Served with rice, black beans, sour cream and pico de gallo.', 100, 1, NULL, b'1', 0, b'1'),
(131, 'كلاسيك كاسادياز ستيك أو تشيكن', 'متبلة مع البصل وجبنة جاك ملفوفة بالتورتيلا المحمصة. تقدم مع الأرز، الفاصولياء السوداء، الكريمة الحامضة والبيكو دي جايو', 100, 2, NULL, b'1', 0, b'0'),
(132, 'CLASSIC FAJITA', 'Fajita-marinated steak or chicken, grilled to perfection!  Served sizzling with onions and bell peppers.', 101, 1, NULL, b'1', 0, b'1'),
(133, 'كلاسيك فاهيتا', 'إختيارك من الدجاج أو الستيك البقري المتبل المشوي. يقدم مع البصل والفلفل.', 101, 2, NULL, b'1', 0, b'0'),
(134, 'FAJITA TRIO', 'Tender grilled steak, marinated grilled chicken and spicy garlic lime shrimp.  Served with onions and bell peppers.', 102, 1, NULL, b'1', 0, b'1'),
(135, 'فاهيتا تريو', 'تشكيلة من لحم الستيك البقري المتبل بالثوم الحار والليمون، الدجاج والروبيان. تقدم مع البصل والفلفل', 102, 2, NULL, b'1', 0, b'0'),
(136, 'SOUTHWESTERN GRILLED SHRIMP', 'Tender shrimp basted with garlic and lime marnade.\r\nJack cheese, applewood smoked beef bacon and fresh sautéed mushrooms. Served with onions, bell peppers and our house-made salsa.\r\nAll fajitas are served with warm tortillas, guacamole, pico de gallo, mixed cheese and sour cream.', 103, 1, NULL, b'1', 0, b'1'),
(137, 'ساوث ويسترن جريلد شريمب', 'الروبيان المشوي المتبل بالثوم والحامض.\r\nجربها مع مشروم جاك فاهيتا شرائح لحم بقري مشوي مع جبنة جاك، بيكون بقري مقرمش، ومشروم طازج سوتيه. يقدم مع البصل، الفلفل والصوص الخاصة بنا المحضرة محلياً في مطعمنا.\r\nتقدم جميع أنواع الفاهيتا مع خبز التورتيا الساخن، صوص الجواكامولي، البيكو دي جايو، الجبنة والكريمة الحامضة.', 103, 2, NULL, b'1', 0, b'0'),
(138, 'NEW CHILE SHRIMP QUESADILLA', 'Melted Jack cheese, shrimp and roasted jalapeño and corn salsa. Served with house-made pico de gallo and a side of our cumin sour cream.', 104, 1, NULL, b'1', 0, b'1'),
(139, 'جديد شيلي شريمب كاسادياز', 'جبنة جاك زائبة، الروبيان والهالابينو محمص في صوص الذرة. يقدم مع البيكو دي جايو بالطريقة المنزلية مع كريمة الكمون الحامضة.', 104, 2, NULL, b'1', 0, b'0'),
(140, 'NEW CHIPOTLE SALMON', 'Salmon filet seasoned with Southwestern spices with a smoky chipotle cream sauce. Served with rice and roasted jalapeño and corn salsa.', 105, 1, NULL, b'1', 0, b'1'),
(141, 'جديد تشيبوتلي سلمون', 'سلمون فيليه متبل بتتبيلة خفيفة يقدم مع الفاصولياء السوداء والخضروات مع جبنة البارميزان.', 105, 2, NULL, b'1', 0, b'0'),
(142, 'NEW CHIPOTLE SALMON (LIGHT)', 'For a lighter option, ask for lightly seasoned salmon filet with black beans and seasonal veggies with Parmesan cheese.', 106, 1, NULL, b'1', 0, b'1'),
(143, 'NEW BACON JACK GRILLED CHICKEN', 'Grilled chicken topped with apple-wood smoked beef bacon, mushroom, Monterrey Jack and fresh sliced avocado. Served with rice and steamed veggies.', 107, 1, NULL, b'1', 0, b'1'),
(144, 'جديد دجاج بيكون جاك المشوي', 'صدور الدجاج المغطاة بلحم البقر المقدد، وقطع من جبن مونتيري جاك وشرائح الأفوكادو. تقدم مع الأرز والخضروات المطهية على البخار.', 107, 2, NULL, b'1', 0, b'0'),
(145, 'CHICKEN CRISPERS', 'Strips of hand battered chicken fried to perfection.  Served with sweet corn on the cob, honey-mustard dressing and home-style fries.', 108, 1, NULL, b'1', 0, b'1'),
(146, 'تشيكن كريسبرز', 'قطع دجاج مقلية تقدم مع ذرة حلوة، صوص الخردل بالعسل (هني ماسترد) وبطاطا مقلية على الطريقة المنزلية', 108, 2, NULL, b'1', 1, b'0'),
(147, 'CRISPY HONEY-CHIPOTLE CHICKEN CRISPERS', 'Strips of hand battered chicken fried to perfection and glazed with sweet honey.  Served with sweet corn on the cob, honey-mustard dressing and home-style fries.', 109, 1, NULL, b'1', 0, b'1'),
(148, 'تشيكن كريسبرز بالعسل', 'قطع دجاج مقلية تقدم مع ذرة حلوة، صوص الخردل بالعسل (هني ماسترد) وبطاطا مقلية على الطريقة المنزلية', 109, 2, NULL, b'1', 0, b'0'),
(149, 'CRISPY CHICKEN CRISPERS', 'Extra crispy chicken with corn on the cob, home-style fries and your choice of honey-mustard or ranch dressing.', 110, 1, NULL, b'1', 0, b'1'),
(150, 'كريسبي تشيكن كرسبرز', 'قطع دجاج مقلية مقرمشة تقدم مع ذرة حلوة، صوص الخردل بالعسل (هني ماسترد) أو صوص الرانش وبطاطا مقلية على الطريقة المنزلية', 110, 2, NULL, b'1', 0, b'0'),
(151, 'MONTEREY CHICKEN', 'Marinated, grilled chicken breast with BBQ sauce, crispy beef bacon, cheese and tomatoes.  Served with mashed potatoes and seasonal veggies.', 111, 1, NULL, b'1', 0, b'1'),
(152, 'مونتراي تشيكن', 'قطعة من صدر الدجاج المتبلة مشوية مع صوص الباربيكيو، شرائح من اللحم البقري المقرمشة، جبنة وطماطم. تقدم مع البطاطا المهروسة والخضروات المتبلة المطهوة على البخار', 111, 2, NULL, b'1', 0, b'0'),
(153, 'COUNTRY-FRIED CHICKEN', 'Served with black pepper gravy, mashed potatoes, sweet corn on the cob and garlic toast.', 112, 1, NULL, b'1', 0, b'1'),
(154, 'كاونتري - فرايد تشيكن', 'صدر الدجاج المقلي يقدم مع صوص الجريفي بالفلفل الأسود، بطاطا مهروسة، ذرة حلوة وخبز توست بالثوم', 112, 2, NULL, b'1', 0, b'0'),
(155, 'MARGARITA GRILLED CHICKEN', 'Tender, juicy chicken breast, marinated with our classic margarita flavoring and grilled to perfection.  Served with rice, black beans, tortilla strips and pico de gallo.', 113, 1, NULL, b'1', 0, b'1'),
(156, 'مارجريتا جريلد تشيكن', 'صدر دجاج بتتبيلة مارجريتا الكلاسيكية الخاصة بنا. يقدم مع الأرز، الفاصولياء السوداء، شرائح التورتيلا وصوص بيكو دي جايو', 113, 2, NULL, b'1', 0, b'0'),
(157, 'SOUTHWESTERN WHITE FISH', 'Seasoned fish filet topped with chimichurri (cilantro, garlic and lime) sauce and pico de gallo، drizzled with cilantro aioli and garnished with lime wedge. Served with rice and seasonal veggies.', 114, 1, NULL, b'1', 0, b'1'),
(158, 'ساوسويستيرن وايت فيش', 'شريحة من السمك المتبلة بصوص شيميشوري (كزبرة خضراء، ثوم وليمون) مضاف عليها البيكو دي جايو مغطات بصوص الكزبرة أيولي ومزينة بالليمون تقدم مع الخضروات الطازجة المطهوة على البخار والأرز المكسيكي', 114, 2, NULL, b'1', 0, b'0'),
(159, 'CHEESE CAKE', 'Rich, smooth and creamy cheesecake over strawberry sauce.', 115, 1, NULL, b'1', 0, b'1'),
(160, 'تشيز كيك', 'كريمة كيك جبن غنية ومغطاة بصوص الفراولة', 115, 2, NULL, b'1', 0, b'0'),
(161, 'MOLTEN CHOCOLATE CAKE', 'Rich, smooth and creamy cheesecake over strawberry sauce.', 116, 1, NULL, b'1', 0, b'1'),
(162, 'مولتين شوكوليت كيك', 'كيك الشوكولاتة الساخن المحشو بشوكولاتة فادج. يقدم مع آيس كريم الفانيلا المغطاة بطبقة من الشوكولاتة المقرمشة', 116, 2, NULL, b'1', 0, b'0'),
(163, 'CHOCOLATE CHIP PARADISE PIE', 'A warm, chewy bar layered with chocolate chips, walnuts and coconut, topped with vanilla ice cream and drizzled with hot fudge and caramel.', 117, 1, NULL, b'1', 0, b'1'),
(164, 'شوكوليت تشب بارادايس باي', 'فطيرة من خليط رقائق وقطع الشوكولاتة وجوز الهند.  تقدم ساخنة مع آيس كريم الفانيلا مغطاة بالكاراميل والشوكولاتة الساخنة والمكسرات', 117, 2, NULL, b'1', 0, b'0'),
(165, 'CARAMEL APPLE TART', 'Skillet baked apple tart topped with vanilla ice cream, warm caramel sauce and cinnamon.', 118, 1, NULL, b'1', 0, b'1'),
(166, 'كاراميل أبل تارت', 'فطيرة التفاح تقدم ساخنة مع آيس كريم الفانيلا، ومغطاة بالكاراميل والقرفة', 118, 2, NULL, b'1', 0, b'0'),
(167, 'CHOCOLATE BROWNIE SUNDAE', 'Chocolate brownie, vanilla ice cream, hot fudge, chopped walnuts and cherries.', 119, 1, NULL, b'1', 0, b'1'),
(168, 'شوكوليت براوني صنداي', 'براوني الشوكولاتة، تقدم مع آيس كريم الفانيلا،  الفادج الساخن والمكسرات والكرز', 119, 2, NULL, b'1', 0, b'0'),
(169, 'OLD FASHIONED CHOCOLATE SHAKE', 'Thick and frosty home-made chocolate shake with chocolate sprinkles.', 120, 1, NULL, b'1', 0, b'1'),
(170, 'أولد فاشون شوكوليت شيك', 'الشوكولاتة المخفوقة بالحليب مزينة بالشوكولاتة المبشورة.', 120, 2, NULL, b'1', 0, b'0'),
(171, 'COKE', 'COKE', 121, 1, NULL, b'1', 0, b'1'),
(172, 'كوكاكولا', 'كوكاكولا', 121, 2, NULL, b'1', 0, b'0'),
(173, 'COKE LIGHT', 'COKE LIGHT', 122, 1, NULL, b'1', 0, b'1'),
(174, 'كوكاكولا لايت', 'كوكاكولا لايت', 122, 2, NULL, b'1', 0, b'0'),
(175, 'SPRITE', 'SPRITE', 123, 1, NULL, b'1', 0, b'1'),
(176, 'سبرايت', 'سبرايت', 123, 2, NULL, b'1', 0, b'0'),
(177, 'SPRITE LIGHT', 'SPRITE LIGHT', 124, 1, NULL, b'1', 1, b'1'),
(178, 'سبرايت لايت', 'سبرايت لايت', 124, 2, NULL, b'1', 0, b'0'),
(179, 'FANTA', 'FANTA', 125, 1, NULL, b'1', 0, b'1'),
(180, 'فانتا', 'فانتا', 125, 2, NULL, b'1', 0, b'0'),
(181, 'LEMONADE', 'LEMONADE', 126, 1, NULL, b'1', 0, b'1'),
(182, 'ليمونادة', 'ليمونادة', 126, 2, NULL, b'1', 0, b'0'),
(183, 'STRAWBERRY LAMONADE', 'STRAWBERRY LAMONADE', 127, 1, NULL, b'1', 0, b'1'),
(184, 'ليمونادة بالفراولة', 'ليمونادة بالفراولة', 127, 2, NULL, b'1', 0, b'0'),
(185, 'FRESH ORANGE JUICE', 'FRESH ORANGE JUICE', 128, 1, NULL, b'1', 0, b'1'),
(186, 'عصير برتقال طازج', 'عصير برتقال طازج', 128, 2, NULL, b'1', 0, b'0'),
(187, 'ICED TEA', 'ICED TEA', 129, 1, NULL, b'1', 0, b'1'),
(188, 'شاي مثلج', 'شاي مثلج', 129, 2, NULL, b'1', 0, b'0'),
(189, 'Arwa (Large)', 'Arwa (Large)', 130, 1, NULL, b'1', 0, b'1'),
(190, 'أروى  - حجم كبير', 'أروى  - حجم كبير', 130, 2, NULL, b'1', 0, b'0'),
(191, 'Arwa (Small)', 'أروى حجم - صغير', 131, 1, NULL, b'1', 0, b'1'),
(192, 'أروى حجم - صغير', 'أروى حجم - صغير', 131, 2, NULL, b'1', 0, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `MENU_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  `IS_DELETED` bit(1) DEFAULT b'0',
  `DATE_CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(50) NOT NULL,
  `LAST_UPDATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `ACTION_TYPE` varchar(50) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`MENU_ID`),
  KEY `FK_MENU_REST` (`RESTAURANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`MENU_ID`, `TITLE`, `RESTAURANT_ID`, `IS_ACTIVE`, `IS_DELETED`, `DATE_CREATED`, `CREATED_BY`, `LAST_UPDATED`, `UPDATED_BY`, `ACTION_TYPE`, `VERSION`) VALUES
(1, 'Default Menu', 1, b'1', b'0', '2017-12-24 19:14:34', 'owner', '2017-07-03 05:53:22', 'owner', 'MODIFIED', 7),
(2, 'Specials menu', 2, b'1', b'0', '2017-02-22 18:39:40', 'staff1', '2017-02-22 19:06:20', 'staff1', 'MODIFIED', 5),
(3, 'Happy Hour', 1, b'0', b'0', '2017-07-03 20:26:03', 'owner', '2017-07-04 07:14:22', 'owner', 'MODIFIED', 1);

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE IF NOT EXISTS `months` (
  `MONTH_NUM` int(2) NOT NULL,
  `NAME` varchar(25) DEFAULT NULL,
  `BAR_CHART_COLOR` varchar(7) DEFAULT '#00695C',
  PRIMARY KEY (`MONTH_NUM`),
  KEY `IDX_MONTH` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`MONTH_NUM`, `NAME`, `BAR_CHART_COLOR`) VALUES
(1, 'Jan', '#00695C'),
(2, 'Feb', '#4CAF50'),
(3, 'Mar', '#03A9F4'),
(4, 'Apr', '#FF9800'),
(5, 'May', '#EF4836'),
(6, 'Jun', '#E57373'),
(7, 'Jul', '#9C27B0'),
(8, 'Aug', '#2196F3'),
(9, 'Sep', '#AFB42B'),
(10, 'Oct', '#B71C1C'),
(11, 'Nov', '#FF8A65'),
(12, 'Dec', '#F06292');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `ORDER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REFERENCE_NUM` varchar(255) NOT NULL COMMENT 'Generated by application',
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `BRANCH_ID` bigint(20) NOT NULL,
  `ORDER_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SPECIAL_REMARKS` varchar(500) DEFAULT NULL,
  `SERVING_TABLE_ID` bigint(20) NOT NULL,
  `STATUS_TYPE_ID` bigint(20) NOT NULL,
  `CANCELLATION_REASON` varchar(500) DEFAULT NULL,
  `DISCOUNT_APPLIED_PCT` decimal(5,3) DEFAULT NULL,
  `TOTAL_PRICE` decimal(8,2) DEFAULT NULL,
  `STAFF_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  `IS_ACTIVE` bit(1) NOT NULL DEFAULT b'1',
  `DATE_CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `FK_ORD_CUST` (`CUSTOMER_ID`),
  KEY `FK_ORD_ST` (`SERVING_TABLE_ID`),
  KEY `FK_ORD_STF` (`STAFF_ID`),
  KEY `FK_ORD_BR` (`BRANCH_ID`),
  KEY `FK_ORD_REST_idx` (`RESTAURANT_ID`),
  KEY `FK_ORD_STATUS` (`STATUS_TYPE_ID`),
  KEY `idx_orders_ORDER_DATE` (`ORDER_DATE`),
  KEY `idx_ord_ref_num` (`REFERENCE_NUM`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ORDER_ID`, `REFERENCE_NUM`, `CUSTOMER_ID`, `RESTAURANT_ID`, `BRANCH_ID`, `ORDER_DATE`, `SPECIAL_REMARKS`, `SERVING_TABLE_ID`, `STATUS_TYPE_ID`, `CANCELLATION_REASON`, `DISCOUNT_APPLIED_PCT`, `TOTAL_PRICE`, `STAFF_ID`, `VERSION`, `IS_ACTIVE`, `DATE_CREATED`, `CREATED_BY`, `UPDATED_BY`, `LAST_UPDATED`) VALUES
(1, 'ORNKS092189', 1, 1, 1, '2017-05-19 21:41:38', NULL, 1, 1, NULL, NULL, '156.00', 2, 17, b'1', '2017-04-22 19:41:38', 'admin', 'admin', '2017-09-17 21:55:28'),
(2, 'ORNK2443121', 1, 1, 1, '2017-04-23 07:30:10', NULL, 3, 1, NULL, NULL, '103.00', 2, 26, b'1', '2017-04-22 19:41:38', 'admin', 'admin', '2017-09-17 21:55:25'),
(3, 'ORNK2487278', 1, 1, 1, '2017-04-22 05:10:56', NULL, 3, 1, NULL, NULL, '100.00', 3, 4, b'1', '2017-04-22 09:10:56', 'admin', 'admin', '2017-09-17 21:55:19'),
(6, 'ORNK2491234', 1, 1, 1, '2017-03-16 10:25:10', NULL, 7, 5, NULL, NULL, '36.00', 3, 8, b'1', '2017-05-16 14:25:10', 'owner', 'owner', '2017-09-17 21:55:06'),
(7, 'ORNK2658971', 1, 1, 1, '2017-04-20 13:01:10', NULL, 1, 4, NULL, NULL, '46.00', 2, 2, b'1', '2017-05-19 17:01:10', 'staff1', '', '2017-09-17 21:54:36');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `ORDER_ITEM` bigint(20) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` bigint(20) NOT NULL,
  `ITEM_ID` bigint(20) NOT NULL,
  `ITEM_VARIANT_ID` bigint(20) NOT NULL,
  `QUANTITY` bigint(20) NOT NULL,
  `SPECIAL_REMARKS` varchar(500) DEFAULT NULL,
  `ORDER_PRICE` decimal(5,2) NOT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ORDER_ITEM`),
  KEY `FK_OI_IV` (`ITEM_VARIANT_ID`),
  KEY `FK_OI_ORD` (`ORDER_ID`),
  KEY `FK_ORDER_ITEM_idx` (`ITEM_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`ORDER_ITEM`, `ORDER_ID`, `ITEM_ID`, `ITEM_VARIANT_ID`, `QUANTITY`, `SPECIAL_REMARKS`, `ORDER_PRICE`, `VERSION`) VALUES
(15, 2, 89, 57, 1, 'Testing', '50.00', 1),
(16, 1, 89, 57, 3, '', '150.00', 1),
(17, 3, 89, 57, 1, '', '50.00', 0),
(19, 7, 89, 31, 2, '', '46.00', 0),
(20, 6, 91, 59, 1, '', '36.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_item_addon`
--

CREATE TABLE IF NOT EXISTS `order_item_addon` (
  `ORDER_ITEM_ADDON_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ORDER_ITEM_ID` bigint(20) NOT NULL,
  `PRICE` decimal(7,2) NOT NULL,
  `SPECIAL_REMARKS` varchar(500) DEFAULT NULL,
  `QUANTITY` int(10) NOT NULL DEFAULT '1',
  `ITEM_ADDON_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ORDER_ITEM_ADDON_ID`),
  KEY `FK_OIA_IAD` (`ITEM_ADDON_ID`),
  KEY `FK_OIA_ORD` (`ORDER_ITEM_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `order_item_addon`
--

INSERT INTO `order_item_addon` (`ORDER_ITEM_ADDON_ID`, `ORDER_ITEM_ID`, `PRICE`, `SPECIAL_REMARKS`, `QUANTITY`, `ITEM_ADDON_ID`, `VERSION`) VALUES
(7, 15, '50.00', '', 1, 171, 0),
(8, 15, '3.00', '', 1, 172, 0),
(12, 16, '6.00', '', 2, 172, 1),
(13, 17, '50.00', '', 1, 171, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_special_deal_item`
--

CREATE TABLE IF NOT EXISTS `order_special_deal_item` (
  `ORDER_SPECIAL_DEAL_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` bigint(20) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `SPECIAL_REMARKS` varchar(255) DEFAULT NULL,
  `ORDER_PRICE` decimal(5,3) NOT NULL,
  `SPECIAL_DEAL_ITEM_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ORDER_SPECIAL_DEAL_ITEM_ID`),
  KEY `FK_OSDI_ORD` (`ORDER_ID`),
  KEY `FK_OSDI_MDI` (`SPECIAL_DEAL_ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ref_city`
--

CREATE TABLE IF NOT EXISTS `ref_city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `code` varchar(10) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `FK_CITY_COUNTRY` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ref_city`
--

INSERT INTO `ref_city` (`id`, `name`, `version`, `code`, `country_id`, `date_created`, `description`, `enabled`, `last_updated`) VALUES
(1, 'Dubai', 1, 'AEDXB', 1, '2017-02-27 00:00:00', NULL, b'1', NULL),
(2, 'Sharjah', 1, 'AESHJ', 1, '2017-02-27 00:00:00', NULL, b'1', NULL),
(3, 'Abu Dhabi', 1, 'AEAUH', 1, '2017-02-27 00:00:00', NULL, b'1', NULL),
(4, 'Umm al Qaiwain', 1, 'AEQIW', 1, '2017-02-27 00:00:00', NULL, b'1', NULL),
(5, 'Ajman', 1, 'AEAJM', 1, '2017-02-27 00:00:00', NULL, b'1', NULL),
(6, 'Al Ain', 1, 'AEAAN', 1, '2017-02-27 00:00:00', NULL, b'1', NULL),
(7, 'Ras al Khaimah', 1, 'AERKT', 1, '2017-02-27 00:00:00', NULL, b'1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ref_country`
--

CREATE TABLE IF NOT EXISTS `ref_country` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `enabled` bit(1) NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `un_code` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `un_code` (`un_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ref_country`
--

INSERT INTO `ref_country` (`id`, `version`, `date_created`, `enabled`, `last_updated`, `name`, `un_code`) VALUES
(1, 0, '2017-02-27 00:00:00', b'1', NULL, 'UNITED ARAB EMIRATES', 'AE');

-- --------------------------------------------------------

--
-- Table structure for table `ref_language`
--

CREATE TABLE IF NOT EXISTS `ref_language` (
  `LANGUAGE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(25) NOT NULL,
  `CODE` varchar(4) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`LANGUAGE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ref_language`
--

INSERT INTO `ref_language` (`LANGUAGE_ID`, `NAME`, `CODE`, `IS_ACTIVE`, `VERSION`) VALUES
(1, 'English', 'en', 1, 1),
(2, 'Arabic', 'ar', 1, 1),
(3, 'Urdu', 'ur', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `requestmap`
--

CREATE TABLE IF NOT EXISTS `requestmap` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `config_attribute` varchar(255) NOT NULL,
  `http_method` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_url` (`http_method`,`url`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `requestmap`
--

INSERT INTO `requestmap` (`id`, `version`, `config_attribute`, `http_method`, `url`) VALUES
(1, 0, 'IS_AUTHENTICATED_FULLY', NULL, '/'),
(2, 0, 'IS_AUTHENTICATED_FULLY', NULL, '/index'),
(3, 0, 'IS_AUTHENTICATED_FULLY', NULL, '/index.gsp'),
(4, 0, 'permitAll', NULL, '/**/favicon.ico'),
(5, 0, 'permitAll', NULL, '/assets/**'),
(6, 0, 'permitAll', NULL, '/**/js/**'),
(7, 0, 'permitAll', NULL, '/**/css/**'),
(8, 0, 'permitAll', NULL, '/**/images/**'),
(9, 0, 'permitAll', NULL, '/login'),
(10, 0, 'permitAll', NULL, '/login.*'),
(11, 0, 'permitAll', NULL, '/login/*'),
(12, 0, 'permitAll', NULL, '/logout'),
(13, 0, 'permitAll', NULL, '/logout.*'),
(14, 0, 'permitAll', NULL, '/logout/*'),
(15, 0, 'ROLE_USER', NULL, '/profile/**'),
(16, 0, 'ROLE_SUPERADMIN', NULL, '/admin/**'),
(17, 0, 'ROLE_RESTAURANT_OWNER', NULL, '/admin/role/**'),
(18, 0, 'ROLE_ADMIN,ROLE_RESTAURANT_OWNER', NULL, '/admin/user/**'),
(19, 0, 'ROLE_SWITCH_USER,isFullyAuthenticated()', NULL, '/j_spring_security_switch_user'),
(20, 0, 'ROLE_SUPERADMIN', NULL, '/accountType/**'),
(21, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/addon/**'),
(22, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/addonTranslation/**'),
(23, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/itemCategory/**'),
(24, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/itemCategoryTranslation/**'),
(25, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/menu/**'),
(26, 0, 'ROLE_SUPERADMIN', NULL, '/restaurant/**'),
(27, 0, 'ROLE_SUPERADMIN', NULL, '/statusType/**'),
(28, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/requestmapCache/clearCache'),
(29, 0, 'ROLE_RESTAURANT_OWNER', NULL, '/restaurant/show/**'),
(30, 0, 'ROLE_RESTAURANT_OWNER', NULL, '/restaurant/edit/**'),
(31, 0, 'ROLE_RESTAURANT_OWNER', NULL, '/restaurant/update/**'),
(32, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/restaurantTranslation/**'),
(33, 0, 'ROLE_RESTAURANT_OWNER', NULL, '/restaurant/loadImages/**'),
(34, 0, 'ROLE_RESTAURANT_OWNER', NULL, '/restaurant/uploadImage/**'),
(35, 0, 'ROLE_RESTAURANT_OWNER', NULL, '/restaurant/deleteImage/**'),
(36, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/branch/**'),
(37, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/cuisineType/**'),
(38, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/cuisineTranslation/**'),
(39, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/item/**'),
(40, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/itemTranslation/**'),
(41, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/servingTable/**'),
(42, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/feedbackConfig/**'),
(43, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/feedbackConfigTranslation/**'),
(44, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/orders/**'),
(45, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER', NULL, '/user/**'),
(46, 0, 'IS_AUTHENTICATED_FULLY', NULL, '/user/profile/**'),
(47, 0, 'IS_AUTHENTICATED_FULLY', NULL, '/user/updateProfile/**'),
(48, 0, 'IS_AUTHENTICATED_FULLY', NULL, '/user/changePassword/**'),
(49, 0, 'ROLE_RESTAURANT_OWNER', NULL, '/restaurant/index/**'),
(50, 0, 'ROLE_RESTAURANT_OWNER', NULL, '/statusType/show/**'),
(51, 0, 'ROLE_RESTAURANT_OWNER', NULL, '/statusType/index/**'),
(52, 0, 'ROLE_RESTAURANT_OWNER,ROLE_MANAGER', NULL, '/dashboard/loadDailySalesByBranch/**'),
(53, 0, 'ROLE_RESTAURANT_OWNER,ROLE_MANAGER', NULL, '/dashboard/loadCurrentMonthSalesByBranch/**'),
(54, 0, 'ROLE_RESTAURANT_OWNER', NULL, '/dashboard/loadDailySalesByRestaurant/**'),
(55, 0, 'ROLE_RESTAURANT_OWNER,ROLE_MANAGER', NULL, '/dashboard/loadDailyOrdersCountByBranch/**'),
(56, 0, 'ROLE_RESTAURANT_OWNER', NULL, '/dashboard/loadDailyOrdersCountByRestaurant/**'),
(57, 0, 'ROLE_RESTAURANT_OWNER,ROLE_MANAGER', NULL, '/dashboard/loadTotalItemCount/**'),
(58, 0, 'ROLE_RESTAURANT_OWNER,ROLE_MANAGER', NULL, '/dashboard/loadMonthlySalesByBranch/**'),
(59, 0, 'ROLE_RESTAURANT_OWNER,ROLE_MANAGER', NULL, '/dashboard/loadMonthlySalesByRestaurant/**'),
(60, 0, 'ROLE_RESTAURANT_OWNER,ROLE_MANAGER,ROLE_USER', NULL, '/servingTableRequestStatus/**'),
(61, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER', NULL, '/restaurantEvent/**'),
(62, 0, 'ROLE_SUPERADMIN,ROLE_RESTAURANT_OWNER,ROLE_MANAGER', NULL, '/restaurantEventTranslation/**'),
(63, 0, 'permitAll', NULL, '/verifyactivation/**'),
(64, 0, 'permitAll', NULL, '/registerdevice/**'),
(65, 0, 'permitAll', NULL, '/loaditems/**'),
(66, 0, 'permitAll', NULL, '/callwaiter/**'),
(67, 0, 'permitAll', NULL, '/submitFeedback/**'),
(68, 0, 'permitAll', NULL, '/stafflogin/**'),
(69, 0, 'permitAll', NULL, '/submitcomments/**');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE IF NOT EXISTS `restaurant` (
  `RESTAURANT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `RESTAURANT_CODE` varchar(50) NOT NULL,
  `LOGO_SMALL` varchar(255) DEFAULT NULL,
  `LOGO_LARGE` varchar(255) DEFAULT NULL,
  `THEME` varchar(100) DEFAULT NULL,
  `ACCOUNT_TYPE_ID` bigint(20) NOT NULL,
  `ACTIVATION_KEY` varchar(100) NOT NULL,
  `ACTIVATION_DATE` datetime DEFAULT NULL,
  `BILLING_PERIOD` int(1) DEFAULT NULL,
  `ACCOUNT_BLOCKED` bit(1) DEFAULT b'0',
  `ACCOUNT_CANCELLED` bit(1) DEFAULT b'0',
  `ACCOUNT_DELETED` bit(1) DEFAULT b'0',
  `DATE_CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  `ACTION_TYPE` varchar(50) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  `BG_IMAGE` varchar(100) DEFAULT NULL,
  `ORIGINAL_BG_IMAGE` varchar(100) DEFAULT NULL,
  `BG_IMAGE_THUMBNAIL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RESTAURANT_ID`),
  UNIQUE KEY `ACTIVATION_KEY` (`ACTIVATION_KEY`),
  UNIQUE KEY `RESTAURANT_CODE_UNIQUE` (`RESTAURANT_CODE`),
  KEY `FK_REST_ACCT` (`ACCOUNT_TYPE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`RESTAURANT_ID`, `NAME`, `RESTAURANT_CODE`, `LOGO_SMALL`, `LOGO_LARGE`, `THEME`, `ACCOUNT_TYPE_ID`, `ACTIVATION_KEY`, `ACTIVATION_DATE`, `BILLING_PERIOD`, `ACCOUNT_BLOCKED`, `ACCOUNT_CANCELLED`, `ACCOUNT_DELETED`, `DATE_CREATED`, `CREATED_BY`, `UPDATED_BY`, `LAST_UPDATED`, `ACTION_TYPE`, `VERSION`, `BG_IMAGE`, `ORIGINAL_BG_IMAGE`, `BG_IMAGE_THUMBNAIL`) VALUES
(1, 'Chilli''s', 'R001', '', '', 'Restaurant 1', 1, '123213123121ad', '2017-01-16 00:00:00', NULL, b'0', b'0', b'0', '2017-01-16 06:31:54', 'admin', 'admin', '2017-07-03 05:30:03', 'ACCOUNT UPDATED', 19, '9ab254f3-e8bb-4b06-a09c-9ecf4e8a65d6.jpg', 'japanese.jpg', '9ab254f3-e8bb-4b06-a09c-9ecf4e8a65d6-thumbnail.png'),
(2, 'Restaurant 2', 'RC2', '', '', '', 1, '123213123121ad2', '2017-01-16 06:31:54', NULL, b'0', b'0', b'0', '2017-01-16 06:31:54', '0', NULL, '2017-02-27 01:32:16', NULL, 4, '91952a50-2eb9-4df7-94f4-6207db9f8820.jpg', '4.jpg', '91952a50-2eb9-4df7-94f4-6207db9f8820-thumbnail.png');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_device`
--

CREATE TABLE IF NOT EXISTS `restaurant_device` (
  `RESTAURANT_DEVICE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` varchar(255) NOT NULL,
  `DEVICE_MANUFECTURER` varchar(255) NOT NULL,
  `REGISTRATION_CODE` varchar(45) NOT NULL,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `LAST_LOGIN_TIME` datetime DEFAULT NULL,
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  `IS_BLOCKED` bit(1) DEFAULT b'0',
  `ACTIVATED_ON` datetime DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  `BLOCKED_BY` varchar(100) DEFAULT NULL,
  `CREATED_BY` varchar(100) NOT NULL,
  `DATE_CREATED` datetime NOT NULL,
  `APPLICATION_MODE` int(1) DEFAULT '1' COMMENT 'Application mode can be 1=ROAMING, 2=FIXED, 3=KIOSK',
  `TABLE_REFERENCE` varchar(4) DEFAULT NULL COMMENT 'This field will be populated only if the application_mode is 2 or 3',
  `IS_CUST_CONTACT_MANDATORY` bit(1) DEFAULT b'0',
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RESTAURANT_DEVICE_ID`),
  KEY `FK_RESTD_REST` (`RESTAURANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `restaurant_device`
--

INSERT INTO `restaurant_device` (`RESTAURANT_DEVICE_ID`, `DEVICE_ID`, `DEVICE_MANUFECTURER`, `REGISTRATION_CODE`, `RESTAURANT_ID`, `LAST_LOGIN_TIME`, `IS_ACTIVE`, `IS_BLOCKED`, `ACTIVATED_ON`, `LAST_UPDATED`, `BLOCKED_BY`, `CREATED_BY`, `DATE_CREATED`, `APPLICATION_MODE`, `TABLE_REFERENCE`, `IS_CUST_CONTACT_MANDATORY`, `VERSION`, `updated_by`) VALUES
(1, '000000000000000', 'Google', '12345656343434', 1, '2017-09-21 23:11:27', b'1', b'0', '2017-03-19 00:00:00', '2017-06-20 23:47:03', NULL, 'admin', '2017-01-16 06:31:00', 1, NULL, b'0', 16, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_event`
--

CREATE TABLE IF NOT EXISTS `restaurant_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `original_image_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `small_icon_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `event_date` datetime NOT NULL,
  `show_event_end_date` datetime DEFAULT NULL,
  `show_event_start_date` datetime DEFAULT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `is_active` bit(1) DEFAULT b'1',
  `version` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_21i0bam9fg6v0utc0vla0if4j` (`restaurant_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `restaurant_event`
--

INSERT INTO `restaurant_event` (`id`, `image_url`, `original_image_name`, `small_icon_url`, `event_date`, `show_event_end_date`, `show_event_start_date`, `restaurant_id`, `created_by`, `date_created`, `last_updated`, `updated_by`, `is_active`, `version`) VALUES
(2, '5172c003-f176-4136-8687-f333bf206761.png', 'dubai_skyline1.png', '5172c003-f176-4136-8687-f333bf206761-thumbnail.png', '2017-05-28 02:18:00', '2017-06-01 00:00:00', '2017-05-06 00:00:00', 1, 'owner', '2017-05-28 02:18:56', '2017-07-04 07:38:43', 'owner', b'1', 4),
(3, '0bf9dbfc-627d-4286-9414-7fb6fe151d3b.png', 'dubai_skyline2.png', '0bf9dbfc-627d-4286-9414-7fb6fe151d3b-thumbnail.png', '2017-07-28 07:00:00', '2017-07-28 00:00:00', '2017-07-01 00:00:00', 1, 'owner', '2017-07-04 07:04:03', '2017-07-04 07:05:43', NULL, b'1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_event_translation`
--

CREATE TABLE IF NOT EXISTS `restaurant_event_translation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `restaurant_event_id` bigint(20) NOT NULL,
  `description` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  `show_description` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_language_id` (`restaurant_event_id`,`language_id`),
  KEY `FK_7s1gp6wmpex95xv20hc15kx7q` (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `restaurant_event_translation`
--

INSERT INTO `restaurant_event_translation` (`id`, `title`, `language_id`, `restaurant_event_id`, `description`, `version`, `show_description`) VALUES
(2, 'Dubai Frame to open for National Day', 1, 2, 'Back in July, it was revealed the highly-anticipated Dubai Frame was scheduled to open in December – and it looks like the project is right on track.', 1, b'1'),
(3, 'الإطار دبي لفتح لليوم الوطني', 2, 2, 'مرة أخرى في يوليو، تم الكشف عن أنه كان من المقرر أن الإطار دبي المرتقب لفتح في ديسمبر كانون الاول - ويبدو أن هذا المشروع هو على الطريق الصحيح.', 3, b'1'),
(5, 'Dubai theme park to have 56m freefall tower called ''Zombieland''', 1, 3, 'First out the blocks is Zombieland, which, in simple terms, is a 56-metre high free fall tower. Themed around the 2009 Sony Pictures smash hit film of the same name, which starred Woody Harrelson, Jesse Eisenberg and Emma Stone, it is set to be one of more stomach-flipping experiences at motiongate, one of six ''worlds'' at the whole resort.', 0, b'1'),
(6, 'متنزه دبي أن يكون 56M برج السقوط الحر يدعى \\"زومبي لاند\\"', 2, 3, 'لأول مرة لبنات غير زومبي لاند، والتي، بعبارات بسيطة، هي عالية برج السقوط الحر 56 مترا. تحت عنوان حول 2009 سوني بيكتشرز نجاح كبير الفيلم الذي يحمل نفس الاسم، والذي لعب بطولته وودي هارلسون، جيسي أيزنبرغ وإيما ستون، يتم تعيينها لتكون واحدة من أكثر التجارب ال', 0, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_language`
--

CREATE TABLE IF NOT EXISTS `restaurant_language` (
  `RESTAURANT_LANGUAGE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` int(11) DEFAULT '1',
  `DATE_CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` bigint(20) NOT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`RESTAURANT_LANGUAGE_ID`),
  UNIQUE KEY `UNQ_RESTLANG` (`RESTAURANT_ID`,`LANGUAGE_ID`),
  KEY `FK_RST_LNG` (`LANGUAGE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `restaurant_language`
--

INSERT INTO `restaurant_language` (`RESTAURANT_LANGUAGE_ID`, `RESTAURANT_ID`, `LANGUAGE_ID`, `IS_ACTIVE`, `DATE_CREATED`, `CREATED_BY`, `UPDATED_BY`, `LAST_UPDATED`, `VERSION`) VALUES
(1, 1, 1, 176678519, '2017-12-24 15:23:49', 0, NULL, '2017-12-24 15:23:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_translation`
--

CREATE TABLE IF NOT EXISTS `restaurant_translation` (
  `RESTAURANT_TRANS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(4000) DEFAULT NULL,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `SHOW_DESCRIPTION` bit(1) DEFAULT b'0',
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`RESTAURANT_TRANS_ID`),
  UNIQUE KEY `UNQ_RESTTRA` (`RESTAURANT_ID`,`LANGUAGE_ID`),
  UNIQUE KEY `unique_language_id` (`RESTAURANT_ID`,`LANGUAGE_ID`),
  KEY `FK_RESTTR_LNG` (`LANGUAGE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `restaurant_translation`
--

INSERT INTO `restaurant_translation` (`RESTAURANT_TRANS_ID`, `TITLE`, `DESCRIPTION`, `RESTAURANT_ID`, `LANGUAGE_ID`, `SHOW_DESCRIPTION`, `VERSION`) VALUES
(1, 'Serving you a world of taste', 'For over 35 years now (or over 1/3 of a century!), We have been welcoming guests with our sizzling personality and serving up a good time, every time with incredible appetizers and entrees, thirst-quenching drinks and decadent desserts. Along the way, we’ve fed a bunch of folks, hosted a ton of parties and had a lot of laughs.', 1, 1, NULL, 7),
(6, 'بخدمتكم عالم الذوق', 'مطاعم في 33 دولة حول العالم. لقد تغير الكثير منذ أيامنا الأولى في دالاس، تكساس، كشركة مساهمة همبرغر خدمة البرغر في سلة والأوعية حار تكساس الفلفل الحار الأحمر. ما زلنا جياعا لتجلب لك، النكهات جريئةكبيرة من لدينا الأصلي أسفل المنزل مستوحاة الأمريكية-جنوب غربي العلامة التجارية. حتى تتمكن من لا يزال يتمتع البرغر التي يسيل لها اللعاب ومرغريتا الجليد الباردة ال جعلتنا الشهيرة. أو يمكنك تلتزموا المفضلة الأمريكية أكثر جرأة لدينا مثل الأسطورية الأضلاع شواء لحوم البقر، الأزيز فاهيتا والنار مشوي شرائح اللحم. وبطبيعة الحال، جنبا إلى جنب مع الطعام غير المسددة، ونحن ما زلنا طبخ الكثير من المرح أيضا. لهذا السبب بعد كل هذا', 1, 2, b'1', 1),
(12, 'ashjdg', 'jkahsdjkas', 2, 1, b'0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `version` bigint(20) NOT NULL,
  `authority` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `UK_irsamgnera6angm0prq1kemt2` (`authority`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`ROLE_ID`, `NAME`, `version`, `authority`, `description`, `is_active`) VALUES
(1, 'Super Admin', 0, 'ROLE_SUPERADMIN', '', b'1'),
(3, 'Restaurant Owner', 0, 'ROLE_RESTAURANT_OWNER', '', b'1'),
(4, 'Restaurant Manager', 0, 'ROLE_MANAGER', '', b'1'),
(5, 'User', 0, 'ROLE_USER', '', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `sequence_holder`
--

CREATE TABLE IF NOT EXISTS `sequence_holder` (
  `ID` bigint(20) NOT NULL,
  `ENTITY_TYPE` int(11) NOT NULL,
  `SEQ_NAME` varchar(45) NOT NULL,
  `NEXT_VAL` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `ENTITY_TYPE_UNIQUE` (`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sequence_holder`
--

INSERT INTO `sequence_holder` (`ID`, `ENTITY_TYPE`, `SEQ_NAME`, `NEXT_VAL`) VALUES
(1, 1, 'ORDER_REFERENCE', 9);

-- --------------------------------------------------------

--
-- Table structure for table `serving_table`
--

CREATE TABLE IF NOT EXISTS `serving_table` (
  `SERVING_TABLE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TABLE_REF_NUMBER` varchar(3) NOT NULL,
  `FLOOR` int(2) NOT NULL DEFAULT '1',
  `BRANCH_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  PRIMARY KEY (`SERVING_TABLE_ID`),
  UNIQUE KEY `TABLE_REF_NUMBER` (`TABLE_REF_NUMBER`,`FLOOR`,`BRANCH_ID`),
  UNIQUE KEY `unique_table_ref_number` (`BRANCH_ID`,`FLOOR`,`TABLE_REF_NUMBER`),
  KEY `FK_ST_BR` (`BRANCH_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `serving_table`
--

INSERT INTO `serving_table` (`SERVING_TABLE_ID`, `DESCRIPTION`, `TABLE_REF_NUMBER`, `FLOOR`, `BRANCH_ID`, `IS_ACTIVE`) VALUES
(1, NULL, '1', 1, 1, b'1'),
(3, NULL, '2', 1, 1, b'1'),
(6, NULL, '4', 1, 1, b'1'),
(7, NULL, '5', 1, 1, b'1'),
(8, NULL, '6', 1, 1, b'1'),
(9, NULL, '7', 1, 1, b'1'),
(10, NULL, '8', 1, 1, b'1'),
(11, NULL, '9', 1, 1, b'1'),
(12, NULL, '10', 1, 1, b'1'),
(13, NULL, '11', 1, 1, b'1'),
(14, NULL, '12', 1, 1, b'1'),
(15, NULL, '13', 1, 1, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `serving_table_request_status`
--

CREATE TABLE IF NOT EXISTS `serving_table_request_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  `request_count` int(11) NOT NULL,
  `restaurant_device_id` bigint(20) NOT NULL,
  `serving_table_id` bigint(20) NOT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `status_type_id` bigint(20) NOT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g6b9ma93gs3tpu1wnshtl29n7` (`branch_id`),
  KEY `FK_2fsypw5qhvfovgc78vlfsibpw` (`customer_id`),
  KEY `FK_7tx5upee4c8areor6pthk3bwr` (`restaurant_device_id`),
  KEY `FK_dl6nletnjwhyhmthqks5opg0q` (`serving_table_id`),
  KEY `FK_kpqb6yn5c3rbwrvqiyjh0k7fu` (`staff_id`),
  KEY `FK_p6gjtriri71dj2p14hr8bbj88` (`status_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `serving_table_request_status`
--

INSERT INTO `serving_table_request_status` (`id`, `version`, `branch_id`, `created_by`, `customer_id`, `date_created`, `last_updated`, `request_count`, `restaurant_device_id`, `serving_table_id`, `staff_id`, `status_type_id`, `updated_by`) VALUES
(1, 2, 1, 'owner', 1, '2017-08-14 00:00:00', '2017-09-17 21:33:49', 1, 1, 1, 2, 5, 'owner'),
(2, 2, 1, 'owner', 1, '2017-08-14 00:00:00', '2017-09-17 21:33:52', 1, 1, 3, 3, 5, 'owner'),
(3, 2, 1, 'owner', 1, '2017-08-14 00:00:00', '2017-08-14 21:42:04', 1, 1, 7, 3, 5, 'owner'),
(5, 1, 1, 'SYSTEM', NULL, '2017-09-17 21:28:30', '2017-09-17 21:33:50', 1, 1, 12, 3, 5, 'owner'),
(6, 1, 1, 'SYSTEM', NULL, '2017-09-17 21:28:53', '2017-09-17 21:33:48', 1, 1, 12, 3, 5, 'owner'),
(7, 9, 1, 'SYSTEM', NULL, '2017-09-17 21:41:57', '2017-09-17 21:51:35', 9, 1, 12, 3, 5, 'owner'),
(8, 4, 1, 'SYSTEM', NULL, '2017-09-17 21:51:58', '2017-09-17 22:00:15', 4, 1, 12, 3, 5, 'owner'),
(9, 4, 1, 'SYSTEM', NULL, '2017-09-21 00:50:01', '2017-09-21 00:55:35', 5, 1, 12, NULL, 1, 'SYSTEM');

-- --------------------------------------------------------

--
-- Table structure for table `special_deal`
--

CREATE TABLE IF NOT EXISTS `special_deal` (
  `SPECIAL_DEAL_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `PRICE` decimal(5,3) NOT NULL,
  `IMAGE_URL` varchar(255) DEFAULT NULL,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`SPECIAL_DEAL_ID`),
  KEY `FK_SD_REST` (`RESTAURANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `special_deal`
--

INSERT INTO `special_deal` (`SPECIAL_DEAL_ID`, `START_DATE`, `END_DATE`, `PRICE`, `IMAGE_URL`, `RESTAURANT_ID`, `IS_ACTIVE`, `VERSION`) VALUES
(1, '2017-03-19', '2017-03-18', '3.100', 'Image URL', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `special_deal_item`
--

CREATE TABLE IF NOT EXISTS `special_deal_item` (
  `MEAL_DEAL_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SPECIAL_DEAL_ID` bigint(20) NOT NULL,
  `ITEM_ID` bigint(20) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`MEAL_DEAL_ITEM_ID`),
  KEY `FK_SDI_SD` (`SPECIAL_DEAL_ID`),
  KEY `FK_SDI_ITM` (`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `special_deal_translation`
--

CREATE TABLE IF NOT EXISTS `special_deal_translation` (
  `SPECIAL_DEAL_TRANSLATION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `SPECIAL_DEAL_ID` bigint(20) NOT NULL,
  `SHOW_DESCRIPTION` int(1) DEFAULT NULL,
  `OTHER_REMARKS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SPECIAL_DEAL_TRANSLATION_ID`),
  UNIQUE KEY `UNQ_SDT` (`SPECIAL_DEAL_ID`,`LANGUAGE_ID`),
  KEY `FK_SMT_LNG` (`LANGUAGE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `special_deal_translation`
--

INSERT INTO `special_deal_translation` (`SPECIAL_DEAL_TRANSLATION_ID`, `TITLE`, `DESCRIPTION`, `LANGUAGE_ID`, `SPECIAL_DEAL_ID`, `SHOW_DESCRIPTION`, `OTHER_REMARKS`) VALUES
(1, 'Eng Title', 'Eng Desc', 1, 1, 1, 'Remarks');

-- --------------------------------------------------------

--
-- Table structure for table `spice_type`
--

CREATE TABLE IF NOT EXISTS `spice_type` (
  `SPICE_TYPE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IMAGE_URL` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`SPICE_TYPE_ID`),
  KEY `FK_SPT_RST` (`RESTAURANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `spice_type`
--

INSERT INTO `spice_type` (`SPICE_TYPE_ID`, `IMAGE_URL`, `IS_ACTIVE`, `RESTAURANT_ID`, `VERSION`) VALUES
(1, 'spice type image', b'1', 1, 1),
(2, NULL, b'1', 1, 1),
(3, NULL, b'1', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `spice_type_translation`
--

CREATE TABLE IF NOT EXISTS `spice_type_translation` (
  `SPICE_TYPE_TRANS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SPICE_TYPE_ID` bigint(20) NOT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) NOT NULL,
  `SHOW_DESCRIPTION` bit(1) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`SPICE_TYPE_TRANS_ID`),
  UNIQUE KEY `UNQ_STT` (`LANGUAGE_ID`,`SPICE_TYPE_ID`),
  KEY `FK_SPT_SPI` (`SPICE_TYPE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `spice_type_translation`
--

INSERT INTO `spice_type_translation` (`SPICE_TYPE_TRANS_ID`, `SPICE_TYPE_ID`, `LANGUAGE_ID`, `DESCRIPTION`, `TITLE`, `SHOW_DESCRIPTION`, `VERSION`) VALUES
(1, 1, 1, 'Mild', 'Mild', b'1', 1),
(2, 2, 1, 'Jalapeno, Red Peppers', 'Spicy', b'1', 1),
(3, 3, 1, 'Non-Veg', 'Non-Veg', b'1', 1),
(4, 2, 2, 'هالبينو, الفلفل الأحمر', 'حار', b'1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `STAFF_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `STAFF_CODE` varchar(50) NOT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `MOBILE` varchar(20) DEFAULT NULL,
  `BRANCH_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  `DESIGNATION` varchar(255) DEFAULT NULL,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`STAFF_ID`),
  UNIQUE KEY `USER_ID` (`USER_ID`),
  UNIQUE KEY `STAFF_CODE` (`STAFF_CODE`),
  KEY `FK_STAFF_ADD` (`ADDRESS_ID`),
  KEY `FK_STAFF_BRN` (`BRANCH_ID`),
  KEY `FK_STAFF_REST_idx` (`RESTAURANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`STAFF_ID`, `USER_ID`, `STAFF_CODE`, `ADDRESS_ID`, `MOBILE`, `BRANCH_ID`, `IS_ACTIVE`, `DESIGNATION`, `RESTAURANT_ID`, `VERSION`) VALUES
(2, 4, 'ASHJ', 1, '0509936265', 1, b'1', 'SERVER', 1, 1),
(3, 13, 'ABC', NULL, '0556369854', 1, b'1', NULL, 1, 3),
(5, 15, 'ST004', NULL, '0516478966', 1, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `status_type`
--

CREATE TABLE IF NOT EXISTS `status_type` (
  `STATUS_TYPE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  `IS_ACTIVE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`STATUS_TYPE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `status_type`
--

INSERT INTO `status_type` (`STATUS_TYPE_ID`, `NAME`, `IS_ACTIVE`, `DESCRIPTION`, `VERSION`) VALUES
(1, 'New', b'1', 'New Status', 4),
(2, 'Approved', b'1', 'Approved Status', 3),
(3, 'In-Progress', b'1', 'Approved Status', 0),
(4, 'Cancelled', b'1', 'Cancel Status', 0),
(5, 'Completed', b'1', 'Completed Status', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `PASSWORD_RECOVERY_QST` varchar(255) DEFAULT NULL,
  `PASSWORD_RECOVERY_ANS` varchar(255) DEFAULT NULL,
  `LAST_LOGGED_IN` datetime DEFAULT NULL,
  `EXPIRES_ON` datetime DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(50) NOT NULL,
  `LAST_UPDATED` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `ACTION_TYPE` varchar(50) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  `account_expired` bit(1) DEFAULT b'0',
  `account_locked` bit(1) DEFAULT b'0',
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL DEFAULT b'1',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `password_expired` bit(1) DEFAULT b'0',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USERNAME` (`USERNAME`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`USER_ID`, `USERNAME`, `PASSWORD`, `PASSWORD_RECOVERY_QST`, `PASSWORD_RECOVERY_ANS`, `LAST_LOGGED_IN`, `EXPIRES_ON`, `DATE_CREATED`, `CREATED_BY`, `LAST_UPDATED`, `UPDATED_BY`, `ACTION_TYPE`, `VERSION`, `account_expired`, `account_locked`, `email`, `enabled`, `first_name`, `last_name`, `middle_name`, `password_expired`) VALUES
(2, 'admin_old', '$2a$10$dvWf2uajFJHleN01JHFcXOZj4u/AZ.t4olrD52RfX2BpaaceWSJ/S', NULL, NULL, NULL, NULL, '2017-02-20 19:48:36', 'SYSTEM', '2017-02-20 19:48:36', NULL, NULL, 0, b'0', b'0', NULL, b'1', 'SUPER', 'ADMIN', NULL, b'0'),
(3, 'admin', '$2a$10$YldYp1Nh3iae95M.WR9im.p3homQNbKQV61lNLOjoUlXMPdeD86ZS', NULL, NULL, NULL, NULL, '2017-02-20 21:49:02', 'SYSTEM', '2017-02-20 21:49:02', NULL, NULL, 0, b'0', b'0', NULL, b'1', 'SUPER', 'ADMIN', NULL, b'0'),
(4, 'owner', '$2a$10$YldYp1Nh3iae95M.WR9im.p3homQNbKQV61lNLOjoUlXMPdeD86ZS', NULL, NULL, NULL, NULL, '2017-02-20 21:49:02', 'SYSTEM', '2017-09-21 00:35:05', 'admin', NULL, 3, b'0', b'0', NULL, b'1', 'Jack', 'Rod', NULL, b'0'),
(13, 'abc', '$2a$10$YldYp1Nh3iae95M.WR9im.p3homQNbKQV61lNLOjoUlXMPdeD86ZS', NULL, NULL, NULL, NULL, '2017-05-06 04:42:11', 'admin', '2017-05-06 19:34:30', 'admin', NULL, 2, b'0', b'0', NULL, b'1', 'abc', 'def', NULL, b'0'),
(14, 'staff2', '$2a$10$YldYp1Nh3iae95M.WR9im.p3homQNbKQV61lNLOjoUlXMPdeD86ZS', NULL, NULL, NULL, NULL, '2017-05-06 17:59:35', 'admin', '2017-05-06 19:33:50', 'admin', NULL, 4, b'0', b'0', NULL, b'1', 'Staff', '2', NULL, b'0'),
(15, 'staff4', '$2a$10$dDd7kWrYKeV/BsShDmhp9ewagjiiDMnaLrygj/deTEHnyWVVYdGZC', NULL, NULL, NULL, NULL, '2017-05-06 19:36:43', 'admin', '2017-05-07 19:49:25', NULL, NULL, 6, b'0', b'0', 'staff_4@armedialab.com', b'1', 'Staff 4', 'Four', NULL, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_it77eq964jhfqtu54081ebtio` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(2, 1),
(3, 1),
(2, 3),
(3, 3),
(4, 3),
(2, 4),
(3, 4),
(2, 5),
(3, 5),
(15, 5);

-- --------------------------------------------------------

--
-- Table structure for table `variant`
--

CREATE TABLE IF NOT EXISTS `variant` (
  `VARIANT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IMAGE_URL` varchar(255) DEFAULT NULL,
  `RESTAURANT_ID` bigint(20) DEFAULT NULL,
  `VARIANT_TYPE_ID` bigint(20) NOT NULL,
  `IS_DEFAULT` bit(1) DEFAULT b'0',
  `DATE_CREATED` datetime DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  `CREATED_BY` varchar(100) DEFAULT NULL,
  `UPDATED_BY` varchar(100) DEFAULT NULL,
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`VARIANT_ID`),
  KEY `FK_VAR_REST` (`RESTAURANT_ID`),
  KEY `FK_VAR_VARTYPE_idx` (`VARIANT_TYPE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- Dumping data for table `variant`
--

INSERT INTO `variant` (`VARIANT_ID`, `IMAGE_URL`, `RESTAURANT_ID`, `VARIANT_TYPE_ID`, `IS_DEFAULT`, `DATE_CREATED`, `LAST_UPDATED`, `CREATED_BY`, `UPDATED_BY`, `IS_ACTIVE`, `VERSION`) VALUES
(1, '', 1, 1, b'1', '2017-03-21 23:44:58', NULL, 'admin', 'admin', b'1', 1),
(88, '', 2, 4, b'1', '2017-03-21 23:44:58', NULL, 'admin', 'admin', b'1', 1),
(92, '', 1, 8, b'0', '2017-03-24 18:33:00', NULL, 'admin', 'admin', b'1', 1),
(93, '', 1, 9, b'0', '2017-03-24 18:33:00', NULL, 'admin', 'admin', b'1', 1),
(94, '', 1, 10, b'0', '2017-03-24 18:33:00', NULL, 'admin', 'admin', b'1', 1),
(95, '', 1, 11, b'0', '2017-03-24 18:33:00', NULL, 'admin', 'admin', b'1', 1),
(96, '', 1, 12, b'0', '2017-03-24 18:33:00', NULL, 'admin', 'admin', b'1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `variant_translation`
--

CREATE TABLE IF NOT EXISTS `variant_translation` (
  `VARIANT_TRANS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `VARIANT_ID` bigint(20) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `SHOW_DESCRIPTION` bit(1) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  `IS_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`VARIANT_TRANS_ID`),
  UNIQUE KEY `UNQ_VARTRA` (`VARIANT_ID`,`LANGUAGE_ID`),
  KEY `FK_VARTRA_LNG` (`LANGUAGE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `variant_translation`
--

INSERT INTO `variant_translation` (`VARIANT_TRANS_ID`, `LANGUAGE_ID`, `VARIANT_ID`, `TITLE`, `DESCRIPTION`, `SHOW_DESCRIPTION`, `VERSION`, `IS_DEFAULT`) VALUES
(1, 1, 1, 'Regular', 'Regular Variant', b'0', 1, b'1'),
(6, 1, 88, 'Regular', 'Regular Variant', b'0', 1, b'1'),
(10, 1, 92, 'Quantity', 'Quantity Variant', b'0', 1, b'1'),
(11, 1, 93, 'Size', 'Size Variant', b'0', 1, b'1'),
(12, 1, 94, 'Flavour', 'Flavour Variant', b'0', 1, b'1'),
(13, 1, 95, 'Option', 'Option Variant', b'0', 1, b'1'),
(14, 1, 96, 'Meat', 'Meat Variant', b'0', 1, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `variant_type`
--

CREATE TABLE IF NOT EXISTS `variant_type` (
  `VARIANT_TYPE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  `DATE_CREATED` datetime NOT NULL,
  `CREATED_BY` varchar(50) NOT NULL,
  `UPDATED_BY` varchar(50) DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  `IS_DEFAULT` bit(1) DEFAULT b'0',
  PRIMARY KEY (`VARIANT_TYPE_ID`),
  KEY `FK_VAR_TYPE_REST` (`RESTAURANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `variant_type`
--

INSERT INTO `variant_type` (`VARIANT_TYPE_ID`, `NAME`, `DESCRIPTION`, `RESTAURANT_ID`, `IS_ACTIVE`, `DATE_CREATED`, `CREATED_BY`, `UPDATED_BY`, `LAST_UPDATED`, `VERSION`, `IS_DEFAULT`) VALUES
(1, 'Regular', NULL, 1, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'1'),
(4, 'Regular', NULL, 2, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'1'),
(8, 'Quantity', NULL, 1, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'0'),
(9, 'Size', 'Size of the item', 1, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'0'),
(10, 'Flavour', 'Flavour of the item', 1, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'0'),
(11, 'Option', 'Option of the item', 1, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'0'),
(12, 'Meat', 'Meat/Chicken and so on', 1, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `video_source_type`
--

CREATE TABLE IF NOT EXISTS `video_source_type` (
  `VIDEO_SOURCE_TYPE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `IS_ACTIVE` bit(1) DEFAULT b'1',
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`VIDEO_SOURCE_TYPE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `video_source_type`
--

INSERT INTO `video_source_type` (`VIDEO_SOURCE_TYPE_ID`, `NAME`, `DESCRIPTION`, `IS_ACTIVE`, `VERSION`) VALUES
(1, 'Image', 'Image Type', b'1', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_monthly_sales_branches`
--
CREATE TABLE IF NOT EXISTS `view_monthly_sales_branches` (
`RESTAURANT_ID` bigint(20)
,`RESTAURANT_NAME` varchar(255)
,`BRANCH_ID` bigint(20)
,`BRANCH_NAME` varchar(45)
,`MONTH_NUM` int(2)
,`MONTH` varchar(9)
,`YEAR` int(4)
,`TOTAL` decimal(30,2)
);
-- --------------------------------------------------------

--
-- Structure for view `view_monthly_sales_branches`
--
DROP TABLE IF EXISTS `view_monthly_sales_branches`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_monthly_sales_branches` AS select `rest`.`RESTAURANT_ID` AS `RESTAURANT_ID`,`rest`.`NAME` AS `RESTAURANT_NAME`,`ord`.`BRANCH_ID` AS `BRANCH_ID`,`br`.`NAME` AS `BRANCH_NAME`,month(`ord`.`ORDER_DATE`) AS `MONTH_NUM`,monthname(`ord`.`ORDER_DATE`) AS `MONTH`,year(`ord`.`ORDER_DATE`) AS `YEAR`,sum(`ord`.`TOTAL_PRICE`) AS `TOTAL` from ((`orders` `ord` join `restaurant` `rest`) join `branch` `br`) where ((`rest`.`RESTAURANT_ID` = `ord`.`RESTAURANT_ID`) and (`br`.`BRANCH_ID` = `ord`.`BRANCH_ID`) and (`ord`.`STATUS_TYPE_ID` <> 4) and (`ord`.`ORDER_DATE` >= (curdate() - interval 1 year))) group by month(`ord`.`ORDER_DATE`),`br`.`BRANCH_ID` order by month(`ord`.`ORDER_DATE`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addon`
--
ALTER TABLE `addon`
  ADD CONSTRAINT `FK_ADDON_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`);

--
-- Constraints for table `addon_translation`
--
ALTER TABLE `addon_translation`
  ADD CONSTRAINT `FK_ADDONTRA_ADON` FOREIGN KEY (`ADDON_ID`) REFERENCES `addon` (`ADDON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ADDONTRA_LAN` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_language` (`LANGUAGE_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_ADDR_BRANCH` FOREIGN KEY (`BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_fglr19v76iy4kjip6nf33q99b` FOREIGN KEY (`CITY_ID`) REFERENCES `ref_city` (`id`),
  ADD CONSTRAINT `FK_nyyg5dlcs74rm1girctd3mubi` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `ref_country` (`id`);

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `FK_BR_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`);

--
-- Constraints for table `cuisine_translation`
--
ALTER TABLE `cuisine_translation`
  ADD CONSTRAINT `FK_CUSTRA_CUS` FOREIGN KEY (`CUISINE_TYPE_ID`) REFERENCES `cuisine_type` (`CUISINE_TYPE_ID`),
  ADD CONSTRAINT `FK_CUSTRA_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_language` (`LANGUAGE_ID`);

--
-- Constraints for table `cuisine_type`
--
ALTER TABLE `cuisine_type`
  ADD CONSTRAINT `FK_CT_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_CUST_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`);

--
-- Constraints for table `feedback_config`
--
ALTER TABLE `feedback_config`
  ADD CONSTRAINT `FK_FEEDBKCONF_FDBKTYPE` FOREIGN KEY (`FEEDBACK_TYPE_ID`) REFERENCES `feedback_type` (`FEEDBACK_TYPE_ID`),
  ADD CONSTRAINT `FK_FEEDBKCONF_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`);

--
-- Constraints for table `feedback_config_translation`
--
ALTER TABLE `feedback_config_translation`
  ADD CONSTRAINT `FK_FEEDBKCONF_LANG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_language` (`LANGUAGE_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_FEEDBKCONF_TR` FOREIGN KEY (`FEEDBACK_CONFIG_ID`) REFERENCES `feedback_config` (`FEEDBACK_CONFIG_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback_customer`
--
ALTER TABLE `feedback_customer`
  ADD CONSTRAINT `FK_FEEDBK_CUSTID` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  ADD CONSTRAINT `FK_FEEDBK_FEEDBK_CONF` FOREIGN KEY (`FEEDBACK_CONFIG_ID`) REFERENCES `feedback_config` (`FEEDBACK_CONFIG_ID`);

--
-- Constraints for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `FK_ING_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`);

--
-- Constraints for table `ingredient_translation`
--
ALTER TABLE `ingredient_translation`
  ADD CONSTRAINT `FK_INGTRA_ING` FOREIGN KEY (`INGREDIENT_ID`) REFERENCES `ingredient` (`INGREDIENT_ID`),
  ADD CONSTRAINT `FK_INGTRA_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_language` (`LANGUAGE_ID`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_ITEM_CAT` FOREIGN KEY (`ITEM_CATEGORY_ID`) REFERENCES `item_category` (`ITEM_CATEGORY_ID`),
  ADD CONSTRAINT `FK_ITEM_CT` FOREIGN KEY (`CUISINE_TYPE_ID`) REFERENCES `cuisine_type` (`CUISINE_TYPE_ID`),
  ADD CONSTRAINT `FK_ITEM_SPICE` FOREIGN KEY (`SPICE_TYPE_ID`) REFERENCES `spice_type` (`SPICE_TYPE_ID`),
  ADD CONSTRAINT `FK_jftcodlbcnmda4e4a463wp3hx` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`);

--
-- Constraints for table `item_addon`
--
ALTER TABLE `item_addon`
  ADD CONSTRAINT `FK_ITEMADDON_ADDON` FOREIGN KEY (`ADDON_ID`) REFERENCES `addon` (`ADDON_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ITEMADDON_ITEM` FOREIGN KEY (`ITEM_ID`) REFERENCES `item` (`ITEM_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `item_category`
--
ALTER TABLE `item_category`
  ADD CONSTRAINT `FK_ITEMCAT_MENU` FOREIGN KEY (`MENU_ID`) REFERENCES `menu` (`MENU_ID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ITEMCAT_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_skk02s77ypl4qdwarrupbyb5y` FOREIGN KEY (`PARENT_CATEGORY_ID`) REFERENCES `item_category` (`ITEM_CATEGORY_ID`);

--
-- Constraints for table `item_category_translation`
--
ALTER TABLE `item_category_translation`
  ADD CONSTRAINT `FK_ITEM_CAT_LANG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_language` (`LANGUAGE_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ITEM_CAT_TR` FOREIGN KEY (`ITEM_CATEGORY_ID`) REFERENCES `item_category` (`ITEM_CATEGORY_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_discount`
--
ALTER TABLE `item_discount`
  ADD CONSTRAINT `FK_ITDIS_VAR` FOREIGN KEY (`ITEM_VARIANT_ID`) REFERENCES `item_variant` (`ITEM_VARIANT_ID`);

--
-- Constraints for table `item_ingredient`
--
ALTER TABLE `item_ingredient`
  ADD CONSTRAINT `FK_II_ING` FOREIGN KEY (`INGREDIENT_ID`) REFERENCES `ingredient` (`INGREDIENT_ID`),
  ADD CONSTRAINT `FK_II_ITEM` FOREIGN KEY (`ITEM_ID`) REFERENCES `item` (`ITEM_ID`);

--
-- Constraints for table `item_media_content`
--
ALTER TABLE `item_media_content`
  ADD CONSTRAINT `FK_IMC_IT` FOREIGN KEY (`ITEM_ID`) REFERENCES `item` (`ITEM_ID`),
  ADD CONSTRAINT `FK_IMC_VS` FOREIGN KEY (`VIDEO_SOURCE_TYPE_ID`) REFERENCES `video_source_type` (`VIDEO_SOURCE_TYPE_ID`);

--
-- Constraints for table `item_variant`
--
ALTER TABLE `item_variant`
  ADD CONSTRAINT `FK_ITEM_VAR_ITEM` FOREIGN KEY (`ITEM_ID`) REFERENCES `item` (`ITEM_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ITEM_VAR_VARID` FOREIGN KEY (`VARIANT_ID`) REFERENCES `variant` (`VARIANT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `item_variant_translation`
--
ALTER TABLE `item_variant_translation`
  ADD CONSTRAINT `FK_ITEM_LANG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_language` (`LANGUAGE_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ITEM_VAR` FOREIGN KEY (`ITEM_VARIANT_ID`) REFERENCES `item_variant` (`ITEM_VARIANT_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FK_MENU_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_ORD_BR` FOREIGN KEY (`BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ORD_CUST` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ORD_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ORD_ST` FOREIGN KEY (`SERVING_TABLE_ID`) REFERENCES `serving_table` (`SERVING_TABLE_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ORD_STATUS` FOREIGN KEY (`STATUS_TYPE_ID`) REFERENCES `status_type` (`STATUS_TYPE_ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ORD_STF` FOREIGN KEY (`STAFF_ID`) REFERENCES `staff` (`STAFF_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `FK_OI_IV` FOREIGN KEY (`ITEM_VARIANT_ID`) REFERENCES `item_variant` (`ITEM_VARIANT_ID`),
  ADD CONSTRAINT `FK_OI_ORD` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`),
  ADD CONSTRAINT `FK_ORDER_ITEM` FOREIGN KEY (`ITEM_ID`) REFERENCES `item` (`ITEM_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_item_addon`
--
ALTER TABLE `order_item_addon`
  ADD CONSTRAINT `FK_gyyr69vnl7nmrig62et7oilh1` FOREIGN KEY (`ITEM_ADDON_ID`) REFERENCES `item_addon` (`ITEM_ADDON_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OIA_IAD` FOREIGN KEY (`ITEM_ADDON_ID`) REFERENCES `item_addon` (`ITEM_ADDON_ID`),
  ADD CONSTRAINT `FK_OIA_ORD_ITM` FOREIGN KEY (`ORDER_ITEM_ID`) REFERENCES `order_items` (`ORDER_ITEM`) ON UPDATE CASCADE;

--
-- Constraints for table `order_special_deal_item`
--
ALTER TABLE `order_special_deal_item`
  ADD CONSTRAINT `FK_OSDI_MDI` FOREIGN KEY (`SPECIAL_DEAL_ITEM_ID`) REFERENCES `special_deal_item` (`MEAL_DEAL_ITEM_ID`),
  ADD CONSTRAINT `FK_OSDI_ORD` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`);

--
-- Constraints for table `ref_city`
--
ALTER TABLE `ref_city`
  ADD CONSTRAINT `FK_CITY_COUNTRY` FOREIGN KEY (`country_id`) REFERENCES `ref_country` (`id`);

--
-- Constraints for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `FK_REST_ACCT` FOREIGN KEY (`ACCOUNT_TYPE_ID`) REFERENCES `account_type` (`ACCOUNT_TYPE_ID`);

--
-- Constraints for table `restaurant_device`
--
ALTER TABLE `restaurant_device`
  ADD CONSTRAINT `FK_RESTD_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`);

--
-- Constraints for table `restaurant_event`
--
ALTER TABLE `restaurant_event`
  ADD CONSTRAINT `FK_21i0bam9fg6v0utc0vla0if4j` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`RESTAURANT_ID`);

--
-- Constraints for table `restaurant_event_translation`
--
ALTER TABLE `restaurant_event_translation`
  ADD CONSTRAINT `FK_4y29vwhawd9522k7ogej0ik1l` FOREIGN KEY (`restaurant_event_id`) REFERENCES `restaurant_event` (`id`),
  ADD CONSTRAINT `FK_7s1gp6wmpex95xv20hc15kx7q` FOREIGN KEY (`language_id`) REFERENCES `ref_language` (`LANGUAGE_ID`);

--
-- Constraints for table `restaurant_language`
--
ALTER TABLE `restaurant_language`
  ADD CONSTRAINT `FK_RSTLNG_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`),
  ADD CONSTRAINT `FK_RST_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_language` (`LANGUAGE_ID`);

--
-- Constraints for table `restaurant_translation`
--
ALTER TABLE `restaurant_translation`
  ADD CONSTRAINT `FK_RESTTR_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_language` (`LANGUAGE_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RESTTR_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `serving_table`
--
ALTER TABLE `serving_table`
  ADD CONSTRAINT `FK_ST_BR` FOREIGN KEY (`BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `serving_table_request_status`
--
ALTER TABLE `serving_table_request_status`
  ADD CONSTRAINT `FK_2fsypw5qhvfovgc78vlfsibpw` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`CUSTOMER_ID`),
  ADD CONSTRAINT `FK_7tx5upee4c8areor6pthk3bwr` FOREIGN KEY (`restaurant_device_id`) REFERENCES `restaurant_device` (`RESTAURANT_DEVICE_ID`),
  ADD CONSTRAINT `FK_dl6nletnjwhyhmthqks5opg0q` FOREIGN KEY (`serving_table_id`) REFERENCES `serving_table` (`SERVING_TABLE_ID`),
  ADD CONSTRAINT `FK_g6b9ma93gs3tpu1wnshtl29n7` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`BRANCH_ID`),
  ADD CONSTRAINT `FK_kpqb6yn5c3rbwrvqiyjh0k7fu` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`STAFF_ID`),
  ADD CONSTRAINT `FK_p6gjtriri71dj2p14hr8bbj88` FOREIGN KEY (`status_type_id`) REFERENCES `status_type` (`STATUS_TYPE_ID`);

--
-- Constraints for table `special_deal`
--
ALTER TABLE `special_deal`
  ADD CONSTRAINT `FK_SD_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`);

--
-- Constraints for table `special_deal_item`
--
ALTER TABLE `special_deal_item`
  ADD CONSTRAINT `FK_SDI_ITM` FOREIGN KEY (`ITEM_ID`) REFERENCES `item` (`ITEM_ID`),
  ADD CONSTRAINT `FK_SDI_SD` FOREIGN KEY (`SPECIAL_DEAL_ID`) REFERENCES `special_deal` (`SPECIAL_DEAL_ID`);

--
-- Constraints for table `special_deal_translation`
--
ALTER TABLE `special_deal_translation`
  ADD CONSTRAINT `FK_SMT_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_language` (`LANGUAGE_ID`),
  ADD CONSTRAINT `FK_SMT_SPD` FOREIGN KEY (`SPECIAL_DEAL_ID`) REFERENCES `special_deal` (`SPECIAL_DEAL_ID`);

--
-- Constraints for table `spice_type`
--
ALTER TABLE `spice_type`
  ADD CONSTRAINT `FK_SPT_RST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`);

--
-- Constraints for table `spice_type_translation`
--
ALTER TABLE `spice_type_translation`
  ADD CONSTRAINT `FK_SPT_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_language` (`LANGUAGE_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SPT_SPI` FOREIGN KEY (`SPICE_TYPE_ID`) REFERENCES `spice_type` (`SPICE_TYPE_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `FK_STAFF_ADD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `address` (`ADDRESS_ID`),
  ADD CONSTRAINT `FK_STAFF_BRN` FOREIGN KEY (`BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`),
  ADD CONSTRAINT `FK_STAFF_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_STAFF_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK_apcc8lxk2xnug8377fatvbn04` FOREIGN KEY (`user_id`) REFERENCES `user` (`USER_ID`),
  ADD CONSTRAINT `FK_it77eq964jhfqtu54081ebtio` FOREIGN KEY (`role_id`) REFERENCES `role` (`ROLE_ID`);

--
-- Constraints for table `variant`
--
ALTER TABLE `variant`
  ADD CONSTRAINT `FK_VAR_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`),
  ADD CONSTRAINT `FK_VAR_VARTYPE` FOREIGN KEY (`VARIANT_TYPE_ID`) REFERENCES `variant_type` (`VARIANT_TYPE_ID`) ON UPDATE NO ACTION;

--
-- Constraints for table `variant_translation`
--
ALTER TABLE `variant_translation`
  ADD CONSTRAINT `FK_VARTRA_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_language` (`LANGUAGE_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VARTRA_VAR` FOREIGN KEY (`VARIANT_ID`) REFERENCES `variant` (`VARIANT_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `variant_type`
--
ALTER TABLE `variant_type`
  ADD CONSTRAINT `FK_VAR_TYPE_REST` FOREIGN KEY (`RESTAURANT_ID`) REFERENCES `restaurant` (`RESTAURANT_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

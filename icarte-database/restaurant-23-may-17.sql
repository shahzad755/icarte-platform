-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2017 at 09:20 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  PRIMARY KEY (`ACCOUNT_TYPE_ID`),
  UNIQUE KEY `NAME_UNIQUE` (`NAME`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `account_type`
--

INSERT INTO `account_type` (`ACCOUNT_TYPE_ID`, `NAME`, `DESCRIPTION`, `DATE_CREATED`, `CREATED_BY`, `LAST_UPDATED`, `UPDATED_BY`, `VERSION`) VALUES
(1, 'Silver', 'Normal Default Account Mode', '2017-12-24 16:48:48', '1', '2017-01-15 18:48:39', '1', 3),
(2, 'Gold', 'Gold Account Type', '2017-12-24 16:48:48', '1', '2017-02-11 00:27:59', '1', 4),
(3, 'Platinum', 'Platinum Account Type', '2017-12-24 16:48:48', '1', '2017-01-14 16:10:31', '1', 2),
(4, 'Test', 'sajdkas', '2017-01-14 16:09:18', '1', '2017-01-14 16:09:53', '1', 1),
(6, 'Test 3', 'يبيسبسي', '2017-01-16 04:30:05', '1', '2017-02-09 00:44:42', '5', 1),
(7, 'Test 4', NULL, '2017-01-16 04:30:30', '1', '2017-01-16 04:30:30', NULL, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `addon`
--

INSERT INTO `addon` (`ADDON_ID`, `IS_ACTIVE`, `DEFAULT_PRICE`, `RESTAURANT_ID`, `IMAGE_URL`, `DATE_CREATED`, `CREATED_BY`, `UPDTAED_BY`, `LAST_UPDATED`, `VERSION`) VALUES
(1, b'1', '5.00', 1, 'URL', '2017-01-15 18:48:39', '1', 'staff1', '2017-02-22 19:50:06', 4),
(13, b'1', '50.00', 2, NULL, '2017-02-09 00:16:53', '1', '1', '2017-02-09 00:18:24', 1),
(14, b'1', '3.00', 1, NULL, '2017-02-22 19:45:52', 'staff1', NULL, '2017-02-22 19:45:52', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `addon_translation`
--

INSERT INTO `addon_translation` (`ADDON_TRNASLATION_ID`, `TITLE`, `DESCRIPTION`, `LANGUAGE_ID`, `SHOW_DESCRIPTION`, `ADDON_ID`, `VERSION`, `IS_DEFAULT`) VALUES
(2, 'English Title A', 'English desc A', 1, b'0', 1, 8, b'1'),
(18, 'Pizza Toppings', 'Extra Cheesy for your taste buds', 1, b'1', 13, 0, b'1'),
(25, 'asd', NULL, 2, b'0', 13, 0, b'0'),
(27, 'سيشستسشني', NULL, 3, b'0', 13, 0, b'0'),
(33, 'ssssss', 'f', 2, b'0', 1, 1, NULL),
(34, 'Masala', 'Masala Description', 1, NULL, 14, 0, b'1');

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
  KEY `FK_ADDR_COUNTRY_idx` (`COUNTRY_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`ADDRESS_ID`, `BRANCH_ID`, `DESCRIPTION`, `STREET`, `AREA`, `CITY_ID`, `COUNTRY_ID`, `PO_BOX`, `PHONE1`, `PHONE2`, `PHONE3`, `PHONE4`, `LAT`, `LON`, `IS_ACTIVE`, `EMAIL`, `MAPS_URL`, `VERSION`) VALUES
(1, 1, 'Address 1', 'Street 1', NULL, 1, 1, '', '', '', '', '', '', '', b'0', '', NULL, 0),
(2, 2, 'Adddress 2', 'Street 2', NULL, 1, 1, '', '', '', '', '', '', '', b'0', '', NULL, 1),
(3, 3, 'Address 3', 'Street 3', NULL, 1, 1, '', '', '', '', '', '', '', b'0', '', NULL, 1),
(4, 9, NULL, NULL, 'sasdasd@fsas.com', 1, 1, NULL, '055123215', NULL, NULL, NULL, NULL, NULL, b'1', 'sasdasd@fsas.com', '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14440.691916543086!2d55.2788487!3d25.1973884!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa5eda9fb3c93b69d!2sThe+Dubai+Mall!5e0!3m2!1sen!2sae!4v1456603122671" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>', 2),
(5, 4, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'1', NULL, NULL, 0);

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
  KEY `FK_BR_REST` (`RESTAURANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`BRANCH_ID`, `MANAGER_ID`, `RESTAURANT_ID`, `ADDRESS_ID_DEPRECATED`, `IS_ACTIVE`, `BRANCH_CODE`, `NAME`, `DATE_CREATED`, `CREATED_BY`, `UPDATED_BY`, `LAST_UPDATED`, `VERSION`) VALUES
(1, NULL, 1, 1, b'1', 'BR_001', 'Branch 1', '2017-01-16 06:31:00', 'admin', NULL, NULL, 1),
(2, NULL, 2, 1, b'1', 'BR_002', 'Branch 2', '2017-01-16 06:31:00', 'admin', NULL, '2017-02-27 02:48:54', 2),
(3, NULL, 1, 1, b'1', 'BR_003', 'Branch 3', '2017-01-16 06:31:00', 'admin', NULL, NULL, 1),
(4, NULL, 1, 1, b'1', 'BR-002', 'Branch 2', '2017-02-27 03:30:32', 'admin', 'admin', '2017-03-10 01:24:44', 2),
(5, NULL, 3, 2, b'1', 'BR-001', 'Branch 1', '2017-02-27 03:31:53', 'admin', NULL, '2017-02-27 03:31:53', 0),
(6, NULL, 2, 3, b'0', 'BR-002', 'Branch 2', '2017-02-27 03:49:10', 'admin', NULL, '2017-02-27 03:49:10', 0),
(7, NULL, 1, 1, b'1', 'BR-009', 'Branch 9', '2017-02-27 03:51:36', 'staff1', NULL, '2017-02-27 03:51:36', 0),
(9, NULL, 1, NULL, b'0', 'as', 'asds', '2017-02-27 21:33:38', 'admin', 'admin', '2017-03-08 22:48:55', 4);

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
  `CODE` varchar(10) NOT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `MOBILE` varchar(15) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `SUBSCRIBE_NEWS_LETTER` int(1) DEFAULT '0',
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT '1',
  `LAST_UPDATED` datetime NOT NULL,
  `CREATED_BY` bigint(20) NOT NULL,
  `UPDATED_BY` bigint(20) DEFAULT NULL,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  `DATE_CREATED` datetime DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  UNIQUE KEY `CODE` (`CODE`),
  KEY `FK_CUST_REST` (`RESTAURANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUSTOMER_ID`, `CODE`, `FIRST_NAME`, `LAST_NAME`, `MOBILE`, `ADDRESS_ID`, `SUBSCRIBE_NEWS_LETTER`, `RESTAURANT_ID`, `IS_ACTIVE`, `LAST_UPDATED`, `CREATED_BY`, `UPDATED_BY`, `VERSION`, `DATE_CREATED`) VALUES
(1, '', 'DEFAULT CUSTOMER', NULL, '0509936162', NULL, NULL, 1, 1, '2017-01-16 06:31:00', 0, NULL, 1, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `feedback_config`
--

INSERT INTO `feedback_config` (`FEEDBACK_CONFIG_ID`, `RESTAURANT_ID`, `FEEDBACK_TYPE_ID`, `IS_REQUIRED`, `DESCRIPTION`, `IS_ACTIVE`, `DATE_CREATED`, `CREATED_BY`, `UPDATED_BY`, `LAST_UPDATED`, `VERSION`) VALUES
(1, 1, 1, b'0', NULL, b'1', '2017-04-19 14:44:04', 'admin', 'admin', '2017-04-21 22:58:27', 11),
(2, 1, 1, b'0', NULL, b'1', '2017-04-19 14:44:47', 'admin', NULL, NULL, 1),
(3, 1, 1, b'0', NULL, b'1', '2017-04-19 14:45:09', 'admin', NULL, NULL, 1),
(4, 1, 1, b'0', NULL, b'1', '2017-04-19 20:31:25', 'admin', NULL, NULL, 1),
(5, 1, 2, b'1', NULL, b'1', '2017-04-19 20:32:09', 'admin', NULL, NULL, 1),
(6, 1, 2, b'0', NULL, b'1', '2017-04-19 20:33:04', 'admin', NULL, NULL, 1),
(7, 1, 3, b'0', NULL, b'1', '2017-04-19 20:38:37', 'admin', NULL, NULL, 1),
(8, 1, 3, b'1', NULL, b'1', '2017-04-19 20:39:14', 'admin', NULL, NULL, 1),
(9, 2, 1, b'1', NULL, b'1', '2017-04-19 20:42:18', 'admin', NULL, NULL, 1),
(10, 2, 1, b'1', NULL, b'1', '2017-04-19 20:42:58', 'admin', NULL, NULL, 1),
(11, 2, 3, b'1', NULL, b'1', '2017-04-19 20:42:58', 'admin', NULL, NULL, 1),
(12, 1, 1, b'0', NULL, b'0', '2017-04-21 00:19:19', 'staff1', NULL, '2017-04-21 00:19:19', 0);

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
  KEY `FK_FEEDBKCONF_LANG` (`LANGUAGE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

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
(16, 12, 'TETE', '', 1, b'0', 0, b'1'),
(22, 1, 'سوال واحد', NULL, 2, b'0', 0, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_customer`
--

CREATE TABLE IF NOT EXISTS `feedback_customer` (
  `FEEDBACK_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  `CUSTOMER_CONTACT` varchar(255) DEFAULT NULL,
  `FEEDBACK_CONFIG_ID` bigint(20) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `FEEDBACK_CONTEXT` varchar(20) DEFAULT NULL,
  `REFERENCE_ID` bigint(20) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT CURRENT_TIMESTAMP,
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`FEEDBACK_ID`),
  KEY `FK_FEEDBK_CUSTID` (`CUSTOMER_ID`),
  KEY `FK_FEEDBK_FEEDBK_CONF` (`FEEDBACK_CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  KEY `FK_ITEM_CT` (`CUISINE_TYPE_ID`),
  KEY `FK_ITEM_SPICE` (`SPICE_TYPE_ID`),
  KEY `FK_ITEM_CAT` (`ITEM_CATEGORY_ID`,`CUISINE_TYPE_ID`,`SPICE_TYPE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ITEM_ID`, `CODE`, `MAPPING_CODE`, `ITEM_CATEGORY_ID`, `CUISINE_TYPE_ID`, `SPICE_TYPE_ID`, `TAGS`, `RESTAURANT_ID`, `IS_ACTIVE`, `IS_DELETED`, `DATE_CREATED`, `CREATED_BY`, `LAST_UPDATED`, `UPDATED_BY`, `ACTION_TYPE`, `VERSION`, `IS_NEW`) VALUES
(89, 'ASB-001', 'DGTYJUKHJB', 1, NULL, NULL, NULL, 1, b'1', b'0', '2017-03-23 20:23:40', 'admin', '2017-04-26 01:27:48', 'admin', NULL, 5, b'0'),
(90, 'IT002', NULL, 5, 3, NULL, NULL, 1, b'1', b'0', '2017-04-20 21:07:14', 'admin', '2017-04-20 21:07:43', 'admin', NULL, 1, b'0');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=173 ;

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
(172, 14, 89, 0, b'0');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `item_category`
--

INSERT INTO `item_category` (`ITEM_CATEGORY_ID`, `IMAGE_URL`, `SMALL_ICON_URL`, `ORIGINAL_IMAGE_NAME`, `PARENT_CATEGORY_ID`, `TAGS`, `MENU_ID`, `AVAILABLE_DURATION_START`, `AVAILABLE_DURATION_END`, `RESTAURANT_ID`, `MAPPING_CODE`, `IS_ACTIVE`, `DISPLAY_ORDER`, `DATE_CREATED`, `CREATED_BY`, `LAST_UPDATED`, `UPDATED_BY`, `ACTION_TYPE`, `VERSION`) VALUES
(1, '07f6791d-952f-4ed6-9743-789b5fd97f65.jpg', '07f6791d-952f-4ed6-9743-789b5fd97f65-thumbnail.png', 'bg2.jpg', NULL, 'spicy', 1, '2017-02-19 01:00:00', '2017-02-19 01:07:00', 1, NULL, b'1', 7, '2017-12-24 17:32:16', '0', '2017-05-14 01:00:00', '1', NULL, 34),
(4, '7b2dfc0a-e794-459b-bb9c-778dd1e6b447.jpg', '7b2dfc0a-e794-459b-bb9c-778dd1e6b447-thumbnail.png', 'scan.jpg', NULL, NULL, 1, '2017-01-05 13:00:00', '2017-02-09 13:16:00', 1, NULL, b'1', 4, '2017-02-12 22:07:40', '1', '2017-05-14 01:00:00', 'staff1', NULL, 11),
(5, 'ece87a3a-76a6-4d26-bd30-53082bddd2ac.jpg', 'ece87a3a-76a6-4d26-bd30-53082bddd2ac-thumbnail.png', 'BIG_MOUTH_BURGER_BITES_2.jpg', NULL, NULL, 2, NULL, NULL, 2, '123546-AS', b'1', 1, '2017-02-16 20:47:31', '1', '2017-05-14 01:00:00', 'admin', NULL, 16),
(6, '228b2e26-947b-40c2-90a9-d1fc9322b48c.jpg', '228b2e26-947b-40c2-90a9-d1fc9322b48c-thumbnail.png', '12.jpg', NULL, NULL, 2, NULL, NULL, 2, NULL, b'1', 6, '2017-02-22 19:11:06', 'staff1', '2017-05-14 01:00:00', NULL, NULL, 5),
(7, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, 1, NULL, b'1', 2, '2017-04-13 21:50:44', 'staff1', '2017-05-14 01:00:00', NULL, NULL, 1),
(8, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, b'1', 5, '2017-04-13 22:28:47', 'staff1', '2017-05-14 01:00:00', NULL, NULL, 1),
(9, '166d1613-0b9c-4bf0-822f-1c6c0c0d7ad5.jpg', '166d1613-0b9c-4bf0-822f-1c6c0c0d7ad5-thumbnail.png', 'NEW_SANTA_FE_CHICKEN_SALAD_3.jpg', NULL, NULL, 1, NULL, NULL, 1, NULL, b'1', 3, '2017-04-16 19:24:38', 'admin', '2017-05-14 01:00:00', 'admin', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `item_category_translation`
--

CREATE TABLE IF NOT EXISTS `item_category_translation` (
  `ITEM_CATEGORY_TRANS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `ITEM_CATEGORY_ID` bigint(20) NOT NULL,
  `SHOW_DESCRIPTION` bit(1) DEFAULT b'0',
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ITEM_CATEGORY_TRANS_ID`),
  UNIQUE KEY `UNQ_ICT` (`LANGUAGE_ID`,`ITEM_CATEGORY_ID`),
  UNIQUE KEY `unique_language_id` (`ITEM_CATEGORY_ID`,`LANGUAGE_ID`),
  KEY `FK_ITEM_CAT_TR` (`ITEM_CATEGORY_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `item_category_translation`
--

INSERT INTO `item_category_translation` (`ITEM_CATEGORY_TRANS_ID`, `TITLE`, `DESCRIPTION`, `LANGUAGE_ID`, `ITEM_CATEGORY_ID`, `SHOW_DESCRIPTION`, `VERSION`) VALUES
(1, 'Starters', 'Starters Category', 1, 1, b'0', 4),
(2, 'hshs', 'hashj', 1, 4, b'1', 5),
(4, 'Appetizer', 'Apetizer Description', 1, 5, b'0', 2),
(5, 'Salads', 's', 1, 6, NULL, 0),
(6, 'سلاد', NULL, 3, 6, b'1', 0),
(8, 'sda', NULL, 2, 1, b'0', 0),
(9, 'سشاتياشلستيلاتشسالتيشس', 'سيبتغفعف بلايل', 2, 5, b'1', 0),
(10, 'سشي', 'عحهخعغه', 3, 5, b'0', 0),
(11, 'Chicken Dishes', 'Chicken Dishes', 1, 7, NULL, 0),
(12, 'sadjkbasjdhkasjh', 'sghjs', 1, 8, NULL, 0),
(13, 'ioujlk', 'oiijlk', 1, 9, NULL, 1),
(14, 'منتالتن', 'نمتالغعهنم', 2, 7, b'1', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `item_media_content`
--

INSERT INTO `item_media_content` (`ITEM_MEDIA_ID`, `ITEM_ID`, `IMAGE_NAME`, `IMAGE_NAME_SMALL`, `IMAGE_NAME_ORIGINAL`, `VIDEO_URL`, `VIDEO_SOURCE_TYPE_ID`, `DISPLAY_ORDER`, `IS_ACTIVE`, `DATE_CREATED`, `CREATED_BY`, `LAST_UPDATED`, `UPDATED_BY`, `VERSION`) VALUES
(15, 89, '2169afd2-ab7b-4353-8dfc-89c4f84aa1f1.jpg', '2169afd2-ab7b-4353-8dfc-89c4f84aa1f1-thumbnail.png', 'GRILLED_CHICKEN_SANDWICH_1.jpg', NULL, 1, 2, b'1', '2017-04-14 00:50:32', 'admin', '2017-04-14 00:53:13', NULL, 1),
(17, 89, '85407ab7-d95e-4c8d-8ab9-c02bb516fc37.jpg', '85407ab7-d95e-4c8d-8ab9-c02bb516fc37-thumbnail.png', 'GRILLED_CHICKEN_SANDWICH_2.jpg', NULL, 1, 3, b'1', '2017-04-14 00:52:12', 'admin', '2017-04-14 00:53:13', NULL, 1),
(18, 89, '4fc0ffb2-f2a8-4d28-b610-42cde7f88ed4.jpg', '4fc0ffb2-f2a8-4d28-b610-42cde7f88ed4-thumbnail.png', 'NEW_BACON_AVOCADO_CHICKEN_SANDWICH_1.jpg', NULL, 1, 1, b'1', '2017-04-14 00:52:13', 'admin', '2017-04-14 00:53:13', NULL, 1);

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
  KEY `FK_ITEM_VAR_VARID_idx` (`VARIANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `item_variant`
--

INSERT INTO `item_variant` (`ITEM_VARIANT_ID`, `ITEM_ID`, `VARIANT_ID`, `PRICE`, `APPROX_PREPERATION_TIME`, `IS_ACTIVE`, `IS_PRIMARY`, `DATE_CREATED`, `CREATED_BY`, `LAST_UPDATED`, `UPDATED_BY`, `ACTION_TYPE`, `VERSION`) VALUES
(31, 89, 1, '23.00', 10, b'1', b'1', '2017-03-23 20:23:40', 'admin', '2017-03-23 20:23:40', NULL, NULL, 0),
(57, 89, 92, '50.00', 15, b'1', b'0', '2017-03-25 22:52:24', 'staff1', '2017-03-27 22:57:56', 'staff1', NULL, 12),
(58, 90, 1, '50.00', NULL, b'1', b'1', '2017-04-20 21:07:14', 'admin', '2017-04-20 21:07:14', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_variant_translation`
--

CREATE TABLE IF NOT EXISTS `item_variant_translation` (
  `ITEM_VAR_TRANSLATION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  `ITEM_VARIANT_ID` bigint(20) NOT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `DIETARY_INFORMATION` varchar(1000) DEFAULT NULL,
  `SHOW_DESCRIPTION` bit(1) DEFAULT b'1',
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  `IS_DEFAULT` bit(1) DEFAULT b'0',
  PRIMARY KEY (`ITEM_VAR_TRANSLATION_ID`),
  UNIQUE KEY `UNQ_ITTRA` (`ITEM_VARIANT_ID`,`LANGUAGE_ID`),
  KEY `FK_ITEM_TRANS` (`LANGUAGE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `item_variant_translation`
--

INSERT INTO `item_variant_translation` (`ITEM_VAR_TRANSLATION_ID`, `TITLE`, `DESCRIPTION`, `ITEM_VARIANT_ID`, `LANGUAGE_ID`, `DIETARY_INFORMATION`, `SHOW_DESCRIPTION`, `VERSION`, `IS_DEFAULT`) VALUES
(28, 'Item 1', 'Item 1 description', 31, 1, NULL, b'1', 0, b'1'),
(41, 'Item 1 - Var 1', '41351', 57, 1, NULL, b'0', 0, b'0'),
(46, 'هفثة 1 فقشىسمشفهخى', 'يبلاتنلباتةو اتنىلاةو', 31, 2, NULL, b'1', 3, b'0'),
(47, 'Item 2', 'Item 2', 58, 1, NULL, b'1', 0, b'1');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`MENU_ID`, `TITLE`, `RESTAURANT_ID`, `IS_ACTIVE`, `IS_DELETED`, `DATE_CREATED`, `CREATED_BY`, `LAST_UPDATED`, `UPDATED_BY`, `ACTION_TYPE`, `VERSION`) VALUES
(1, 'Default Menu', 1, b'1', b'0', '2017-12-24 19:14:34', '1', '2017-02-12 02:34:23', '1', NULL, 6),
(2, 'Specials menu', 2, b'1', b'0', '2017-02-22 18:39:40', 'staff1', '2017-02-22 19:06:20', 'staff1', 'MODIFIED', 5);

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
(1, 'ORNKS092189', 1, 1, 1, '2017-05-19 21:41:38', NULL, 1, 1, NULL, NULL, '156.00', 2, 15, b'1', '2017-04-22 19:41:38', 'admin', 'admin', '2017-05-11 21:53:45'),
(2, 'ORNK2443121', 1, 1, 2, '2017-04-23 07:30:10', NULL, 3, 1, NULL, NULL, '103.00', 2, 24, b'1', '2017-04-22 19:41:38', 'admin', 'admin', '2017-05-11 21:17:06'),
(3, 'ORNK2487278', 1, 1, 2, '2017-04-22 05:10:56', NULL, 4, 1, NULL, NULL, '100.00', 3, 2, b'1', '2017-04-22 09:10:56', 'admin', 'admin', '2017-05-15 18:36:54'),
(6, 'ORNK2491234', 1, 1, 1, '2017-03-16 10:25:10', NULL, 7, 2, NULL, NULL, '150.00', 3, 1, b'1', '2017-05-16 14:25:10', 'admin', 'admin', '2017-05-15 20:17:30'),
(7, 'ORNK2658971', 1, 1, 1, '2017-04-20 13:01:10', NULL, 4, 2, NULL, NULL, '46.00', 2, 1, b'1', '2017-05-19 17:01:10', 'staff1', '', '2017-05-19 17:35:27');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`ORDER_ITEM`, `ORDER_ID`, `ITEM_ID`, `ITEM_VARIANT_ID`, `QUANTITY`, `SPECIAL_REMARKS`, `ORDER_PRICE`, `VERSION`) VALUES
(15, 2, 89, 57, 1, 'Testing', '50.00', 1),
(16, 1, 89, 57, 3, '', '150.00', 1),
(17, 3, 89, 57, 1, '', '50.00', 0),
(18, 6, 90, 58, 3, '', '150.00', 0),
(19, 7, 89, 31, 2, '', '46.00', 0);

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
(1, 'English', 'EN', 1, 1),
(2, 'Arabic', 'AR', 1, 1),
(3, 'Urdu', 'UR', 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=60 ;

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
(59, 0, 'ROLE_RESTAURANT_OWNER,ROLE_MANAGER', NULL, '/dashboard/loadMonthlySalesByRestaurant/**');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`RESTAURANT_ID`, `NAME`, `RESTAURANT_CODE`, `LOGO_SMALL`, `LOGO_LARGE`, `THEME`, `ACCOUNT_TYPE_ID`, `ACTIVATION_KEY`, `ACTIVATION_DATE`, `BILLING_PERIOD`, `ACCOUNT_BLOCKED`, `ACCOUNT_CANCELLED`, `ACCOUNT_DELETED`, `DATE_CREATED`, `CREATED_BY`, `UPDATED_BY`, `LAST_UPDATED`, `ACTION_TYPE`, `VERSION`, `BG_IMAGE`, `ORIGINAL_BG_IMAGE`, `BG_IMAGE_THUMBNAIL`) VALUES
(1, 'Restaurant 1', 'RC1', '', '', 'Restaurant 1', 1, '123213123121ad', '2017-01-16 00:00:00', NULL, b'0', b'0', b'0', '2017-01-16 06:31:54', '0', 'admin', '2017-05-07 23:29:15', NULL, 13, '029a340d-f0fb-4214-a982-8207bc1c822f.jpg', 'bg4.jpg', '029a340d-f0fb-4214-a982-8207bc1c822f-thumbnail.png'),
(2, 'Restaurant 2', 'RC2', '', '', '', 1, '123213123121ad2', '2017-01-16 06:31:54', NULL, b'0', b'0', b'0', '2017-01-16 06:31:54', '0', NULL, '2017-02-27 01:32:16', NULL, 4, '91952a50-2eb9-4df7-94f4-6207db9f8820.jpg', '4.jpg', '91952a50-2eb9-4df7-94f4-6207db9f8820-thumbnail.png'),
(3, 'Restaurant 3', 'RC3', '', '', '', 2, '123213123121ad3', '2017-01-16 06:31:54', NULL, b'0', b'0', b'0', '2017-01-16 06:31:54', '0', NULL, NULL, NULL, 1, '', NULL, NULL),
(4, 'asas', 'RC4', '', '', '', 4, '123213123121ad4', '2017-01-16 00:00:00', NULL, b'0', b'0', b'0', '2017-01-16 06:31:54', '0', NULL, '2017-02-23 21:05:49', NULL, 2, NULL, NULL, NULL),
(7, 'Chills', 'R-90', NULL, NULL, NULL, 3, '6e6c3d33-51bb-4b94-bc33-603ae872afe9', '2106-01-11 00:00:00', 1, b'0', b'0', b'0', '2017-02-24 00:37:28', 'superadmin', NULL, '2017-02-24 00:37:28', NULL, 0, NULL, NULL, NULL),
(8, 'My new restaurant', 'HGJS112', NULL, NULL, NULL, 1, '6cdfb6b0-5254-4976-90aa-c451809b4d70', NULL, NULL, b'0', b'0', b'0', '2017-03-21 23:44:58', 'admin', NULL, '2017-03-21 23:44:58', NULL, 0, NULL, NULL, NULL),
(9, 'ASDKJHH', 'KJAHD', NULL, NULL, NULL, 2, 'fdc006d8-72db-421f-a16d-c28f9267caf3', NULL, NULL, b'0', b'0', b'0', '2017-03-21 23:50:38', 'admin', NULL, '2017-03-21 23:50:38', NULL, 0, NULL, NULL, NULL);

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
  `IS_ACTIVE` int(1) DEFAULT '1',
  `IS_BLOCKED` int(1) DEFAULT NULL,
  `ACTIVATED_ON` datetime DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  `BLOCKED_BY` varchar(255) DEFAULT NULL,
  `CREATED_BY` bigint(20) NOT NULL,
  `DATE_CREATED` datetime NOT NULL,
  `APPLICATION_MODE` int(1) DEFAULT '1' COMMENT 'Application mode can be 1=ROAMING, 2=FIXED, 3=KIOSK',
  `TABLE_REFERENCE` varchar(4) DEFAULT NULL COMMENT 'This field will be populated only if the application_mode is 2 or 3',
  `IS_CUST_CONTACT_MANDATORY` int(1) DEFAULT '0',
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`RESTAURANT_DEVICE_ID`),
  KEY `FK_RESTD_REST` (`RESTAURANT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `restaurant_device`
--

INSERT INTO `restaurant_device` (`RESTAURANT_DEVICE_ID`, `DEVICE_ID`, `DEVICE_MANUFECTURER`, `REGISTRATION_CODE`, `RESTAURANT_ID`, `LAST_LOGIN_TIME`, `IS_ACTIVE`, `IS_BLOCKED`, `ACTIVATED_ON`, `LAST_UPDATED`, `BLOCKED_BY`, `CREATED_BY`, `DATE_CREATED`, `APPLICATION_MODE`, `TABLE_REFERENCE`, `IS_CUST_CONTACT_MANDATORY`, `VERSION`) VALUES
(1, '1', 'HTC', '12345656343434', 1, '2017-03-16 00:00:00', 1, 0, '2017-03-19 00:00:00', '2017-03-20 00:00:00', '', 0, '2017-01-16 06:31:00', 1, NULL, 0, 1);

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
  `DESCRIPTION` varchar(2000) DEFAULT NULL,
  `RESTAURANT_ID` bigint(20) NOT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `SHOW_DESCRIPTION` bit(1) DEFAULT b'0',
  `VERSION` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`RESTAURANT_TRANS_ID`),
  UNIQUE KEY `UNQ_RESTTRA` (`RESTAURANT_ID`,`LANGUAGE_ID`),
  KEY `FK_RESTTR_LNG` (`LANGUAGE_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `restaurant_translation`
--

INSERT INTO `restaurant_translation` (`RESTAURANT_TRANS_ID`, `TITLE`, `DESCRIPTION`, `RESTAURANT_ID`, `LANGUAGE_ID`, `SHOW_DESCRIPTION`, `VERSION`) VALUES
(1, 'Restaurant 1 title a', 'Restaurant 1 description a', 1, 1, NULL, 5),
(3, 'Best grill in the town', 'Authentic american steaks and grill', 7, 1, NULL, 0),
(5, 'اموہا موبپرم', 'قواکرپجھدتےعغ', 1, 3, b'1', 0),
(6, 'تنشسم', 'نمخهثى', 1, 2, b'0', 0),
(12, 'ashjdg', 'jkahsdjkas', 2, 1, b'0', 0),
(13, 'sd', 'dggg', 3, 1, b'0', 0),
(14, 'A fantastic restaurant', '', 8, 1, NULL, 0),
(15, 'ASKJDHK', '', 9, 1, NULL, 0);

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
  KEY `FK_ST_BR` (`BRANCH_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `serving_table`
--

INSERT INTO `serving_table` (`SERVING_TABLE_ID`, `DESCRIPTION`, `TABLE_REF_NUMBER`, `FLOOR`, `BRANCH_ID`, `IS_ACTIVE`) VALUES
(1, NULL, '1', 1, 1, b'1'),
(3, NULL, '2', 1, 1, b'1'),
(4, NULL, '3', 1, 4, b'1'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `spice_type`
--

INSERT INTO `spice_type` (`SPICE_TYPE_ID`, `IMAGE_URL`, `IS_ACTIVE`, `RESTAURANT_ID`, `VERSION`) VALUES
(1, 'spice type image', b'1', 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `spice_type_translation`
--

INSERT INTO `spice_type_translation` (`SPICE_TYPE_TRANS_ID`, `SPICE_TYPE_ID`, `LANGUAGE_ID`, `DESCRIPTION`, `TITLE`, `SHOW_DESCRIPTION`, `VERSION`) VALUES
(1, 1, 1, 'Mild', 'Mild', b'1', 1);

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
  `IS_ACTIVE` int(1) DEFAULT '1',
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
(2, 4, 'ASHJ', 1, '0509936265', 1, 1, 'SERVER', 1, 1),
(3, 13, 'ABC', NULL, '0556369854', 1, 1, NULL, 1, 3),
(4, 14, 'ST002', NULL, NULL, 2, NULL, NULL, 1, 1),
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
(4, 'staff1', '$2a$10$YldYp1Nh3iae95M.WR9im.p3homQNbKQV61lNLOjoUlXMPdeD86ZS', NULL, NULL, NULL, NULL, '2017-02-20 21:49:02', 'SYSTEM', '2017-02-20 21:49:02', NULL, NULL, 0, b'0', b'0', NULL, b'1', 'Jack', 'Rod', NULL, b'0'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=94 ;

--
-- Dumping data for table `variant`
--

INSERT INTO `variant` (`VARIANT_ID`, `IMAGE_URL`, `RESTAURANT_ID`, `VARIANT_TYPE_ID`, `IS_DEFAULT`, `DATE_CREATED`, `LAST_UPDATED`, `CREATED_BY`, `UPDATED_BY`, `IS_ACTIVE`, `VERSION`) VALUES
(1, '', 1, 1, b'1', '2017-03-21 23:44:58', NULL, 'admin', 'admin', b'1', 1),
(86, NULL, 8, 2, b'1', '2017-03-21 23:44:58', '2017-03-21 23:44:58', 'admin', NULL, b'1', 0),
(87, NULL, 9, 3, b'1', '2017-03-21 23:50:38', '2017-03-21 23:50:38', 'admin', NULL, b'1', 0),
(88, '', 2, 4, b'1', '2017-03-21 23:44:58', NULL, 'admin', 'admin', b'1', 1),
(89, '', 3, 5, b'1', '2017-03-21 23:44:58', NULL, 'admin', 'admin', b'1', 1),
(90, '', 4, 6, b'1', '2017-03-21 23:44:58', NULL, 'admin', 'admin', b'1', 1),
(91, '', 7, 7, b'1', '2017-03-21 23:44:58', NULL, 'admin', 'admin', b'1', 1),
(92, '', 1, 8, b'0', '2017-03-24 18:33:00', NULL, 'admin', 'admin', b'1', 1),
(93, '', 1, 9, b'0', '2017-03-24 18:33:00', NULL, 'admin', 'admin', b'1', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `variant_translation`
--

INSERT INTO `variant_translation` (`VARIANT_TRANS_ID`, `LANGUAGE_ID`, `VARIANT_ID`, `TITLE`, `DESCRIPTION`, `SHOW_DESCRIPTION`, `VERSION`, `IS_DEFAULT`) VALUES
(1, 1, 1, 'Regular', 'Regular Variant', b'0', 1, b'1'),
(2, 1, 86, 'Regular', 'Regular Variant', b'0', 1, b'1'),
(3, 1, 87, 'Regular', 'Regular Variant', b'0', 0, b'1'),
(6, 1, 88, 'Regular', 'Regular Variant', b'0', 1, b'1'),
(7, 1, 89, 'Regular', 'Regular Variant', b'0', 1, b'1'),
(8, 1, 90, 'Regular', 'Regular Variant', b'0', 1, b'1'),
(9, 1, 91, 'Regular', 'Regular Variant', b'0', 1, b'1'),
(10, 1, 92, 'Quantity', 'Quantity Variant', b'0', 1, b'1'),
(11, 1, 93, 'Size', 'Size Variant', b'0', 1, b'1');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `variant_type`
--

INSERT INTO `variant_type` (`VARIANT_TYPE_ID`, `NAME`, `DESCRIPTION`, `RESTAURANT_ID`, `IS_ACTIVE`, `DATE_CREATED`, `CREATED_BY`, `UPDATED_BY`, `LAST_UPDATED`, `VERSION`, `IS_DEFAULT`) VALUES
(1, 'Regular', NULL, 1, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'0'),
(2, 'Regular', NULL, 8, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'0'),
(3, 'Regular', NULL, 9, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'0'),
(4, 'Regular', NULL, 2, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'0'),
(5, 'Regular', NULL, 3, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'0'),
(6, 'Regular', NULL, 4, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'0'),
(7, 'Regular', NULL, 7, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'0'),
(8, 'Quantity', NULL, 1, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'0'),
(9, 'Size', 'Size of the item', 1, b'1', '2017-03-13 01:00:00', 'admin', NULL, NULL, 0, b'0');

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
  ADD CONSTRAINT `FK_ADDR_BRANCH` FOREIGN KEY (`BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `FK_ITEM_SPICE` FOREIGN KEY (`SPICE_TYPE_ID`) REFERENCES `spice_type` (`SPICE_TYPE_ID`);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

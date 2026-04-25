CREATE DATABASE  IF NOT EXISTS `resturant` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `resturant`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: resturant
-- ------------------------------------------------------
-- Server version	5.6.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_type` (
  `ACCOUNT_TYPE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACCOUNT_NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
INSERT INTO `account_type` VALUES (1,'xGyKVboFbtamWVVmKMCNLtuMGymzilUzEItQBsrvRVmtTwAogYrTarnuwJnmRxtTQjSqeDbtohcQRSIlKGfqMfbUvfbbCsPuNerHyZrXqORjsMoRNUucTFecEjlnrPNSiegDthvDQmiiGLTtaPPymBVdEPlcylhUekNhgAMBUANsXTBHIPyygQVvhRTuBXAmpYwMYWszOqDrisuRfIAfnGYFuxFWSYDKVMKwomBEyBGnqppIdBWpucoByuPztXh','RroudvnVYCnYaKzVAZbBIUbOZPcRiswNEhMgyUElrkVklNsyxPNULTeKXNaPrsTzKzfNaHHrBcYhsguqKLmcqjwcgMLcjyFzoRTWQPZeWnebyOPzyQEboWuFzIdNVMqhtjUUcDciJOYsUdtYYIDLoZCQfgIBtkugurStlgxCZsgAsmDBPLnCXKlDKLHycHiUfjgOgyudCNlBEOESBcxFTXlAWGHEdXesjFbrnDEbJEsVWfHxkAFysaxaAhAOUmJSHzrglBQESmWGqvtIDmxOqddJDcGrYjjLLqGPKRFZWozyWrlhsGwMydwXZCkdZhxNQTJPEbJQMUntGEqavmLACOoCfjAxzGHJIkhkXuGcrBbneatnKbKuEKmPonuEFJThrtMtfKoBGHpdFDPRbgCkiRKpIhBFOLodJqWBZnjpzbqzvsszMJjIJYyCixmuOhtqDDyPjopiXvdfSYFnFlBDyRUtyOOVRiaOpfZoPCfAcdgwfdBMlAeg'),(2,'OhtYZGmeScKqWOkmnUDMnwsxsdGMxqJEYPtWXvxlaulgSIbuJWnbFOVLzBjxtoFozyfqerlPNivHxiTfFEBqyFsAQksCewsIwvANEhfbbwKispdQGqotQTctMrBiLHapXEwACpjSmdYjytIBDgHtCQEgcJCdqaPqTbBYuDzlOZHpRojgsjJjkAFYOufmPFVOHTRrOUgFvwyqBuILDSBsogbqkmTkfhNMNVobWfuTjUGjKqLTfjItBbJmvvopAQa','GELWXpwTyrANBAJQhNdGCQPZvNSXwvmuNUjnmmEWonPJtTBRCllBOQGCpzbsDxxXuNjgrHdLhlXOfONSeXhQbgunZDMkFbMMWsEejtccxvYKEunqebcBqQNuMMDRzgMdYUKCOaLmYhLrBsgPAFTHRkBgmWNZLqhBgCpaLutmpIUokGFrieAppJClOIphAlUGQnCtFcuyglgInQbYCLkXobxpofNCfONXnQzIaYncFQVcWLwwNdDxPyailhoGGsVFzNPNlnXNeUqKEEkOayzDoYvLStZPPZVmSihnummpktZlMqZpKnQenZFdgnrKAMDqXBPNpnmihLrbhALOPAOISRxOtKHDqaLpXFGtgDtdmyQRHWaUiSVRUGepLbiSSWzhDYwRdlCIHIIMVXofKtvWnbStHvCmJRuWYcBSXPSWRCcPjKmTQTPibbGlzgkXDpyuqLutAkgEpGTxdSfleRBlETeZdnzgKhzmXkZLlMPMSlQUQjlsaJaU'),(3,'vwgCTCgmWHWCtvfWEAALJYktEeKlCWfNLWcrmeZQBrLdVCEKMgBsPEjlfFvKOYWAevtSZrFlYUBHptctLpvmzflhXBvxfSfxhXQTcOAZNsXruydOYJkmAnLqyRaveiebFwSPRFQbuIUNBVnLJUnQnVfynBdgKGExwOrencURRhNMqpCeWuyLdjjdslVGvlUHeURfGDghUUGTwTUlSqGSCQXqLdlUZboClYSyOWVvZoyHmEsxiWuVXueIrAMqalQ','JQszlVUKuCKxYcCcMvNoZePDoKrFALyAAyzRzDRGUUPMKAciqfuzoLODFxiwhegmcEuZceSBaselRcaKhLfhYPHhVxrVRQWHTDveEYuPcVRppPDNoMtTWnqyVcmsRjGmzPImyKqIKJHmBGASreBXeYkjoXizbrwpjuIVMLrJPqRWSojlrXMbwfUdqpkwXVFjkuaIsTToZHNhvAUvJfzqFjkerUgBJHojKsJDcOXBEtzEEQkAHTUbdpUFnHZXJxOtxNiICJIPCPRAGCXjxtQXteHctpDIsdmXGCFsKMHPKZXwHTSVRnnDNssCcWmPliZmCNJbbPJNbHFSifTjjVShqCitIGmqTqgUdjXdObBTHVteCuoelWQmJREplmdquBIDVZfCPMcwXThfEMQgNWwuUWaNgdMyEtMPrtHmYXOXOfYttwoljGLkAVUGyAEnbCmekzgiyzYXaFrOKuzxuwqihaaYOJAmArgXAmadzWzchqOjqbGELwvX');
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_translation`
--

DROP TABLE IF EXISTS `addon_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_translation` (
  `ADDON_TRNASLATION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `SHOW_DESCRIPTION` int(1) DEFAULT NULL,
  `ADDON_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ADDON_TRNASLATION_ID`),
  KEY `FK_ADDONTRA_LAN` (`LANGUAGE_ID`),
  CONSTRAINT `FK_ADDONTRA_LAN` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_languages` (`LANGUAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_translation`
--

LOCK TABLES `addon_translation` WRITE;
/*!40000 ALTER TABLE `addon_translation` DISABLE KEYS */;
INSERT INTO `addon_translation` VALUES (1,'ENG Title','ENGLISH',1,860556888,1),(2,'ARABIC Title','Arabic Desc',2,886338792,1),(3,'Urdu Title','Urdu Desc',3,1287610027,1);
/*!40000 ALTER TABLE `addon_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons` (
  `ADDON_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  `PRICE` decimal(5,3) NOT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  `IMAGE_URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ADDON_ID`),
  KEY `FK_ADDON_REST` (`RESTURANT_ID`),
  CONSTRAINT `FK_ADDON_REST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons`
--

LOCK TABLES `addons` WRITE;
/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
INSERT INTO `addons` VALUES (1,1,1.100,1,'URL'),(2,1,4.100,1,'URL'),(3,1,0.000,1,'URL');
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `ADDRESS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(255) NOT NULL,
  `STREET` varchar(255) DEFAULT NULL,
  `AREA` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `COUNTRY` varchar(50) DEFAULT NULL,
  `PO_BOX` varchar(15) DEFAULT NULL,
  `TEL1` varchar(20) DEFAULT NULL,
  `TEL2` varchar(20) DEFAULT NULL,
  `TEL3` varchar(20) DEFAULT NULL,
  `TEL4` varchar(20) DEFAULT NULL,
  `LAT` varchar(25) DEFAULT NULL,
  `LONGITUDE` varchar(25) DEFAULT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'clvJYnTgWGGDFBgBTXiNoQWpiqrwCggnZQUgtTpqaxjNvZckItLfBnHkfEvxrosjPmUezqUlfzIbmwQGghPznbOvGDqXzkwbnbJzHVjVSmpXyWConnJBGuPwVzlMDKmDaCPWZOQSplCZKHDdrRlnhFnbtkfMAOMDsZJMgFWFIBMYKNmyprKnWiiVgUjsTRqsSvXIkODnQOuhBpROjNavTbDrIrOYJgyVUCMXYmifcdhMRiIaRShWhyPSBmdfOPB','fuRZGcJEPgZqZQcTzgseSlxGuRObgYiVqrFPySRuZtvnRjRlUYtFpbaYatckVNEOGtrqMFCfaPhanDXbSIWEmgeAQQQmuQiYWiwVXGTCbjONqxlCYxuSviOeWshbXEgaBxgxaqpdWkWWwsENXkWSsNrpshMPvUTUhKtMvFJHzhuOPDcKFcviVlqYQmWDvDCpcaqbVZUmzfNYLUmlRkGNuScrbDzCPJBkotHrFnTmMcWEZZpFGCrNTIRfRjCfjkr','WadejQlPxDItEtAcCFmkXwzYobixqISfixKiEiRTcwUWthyTQiOYNCOApCyCLLKGvpEngWHhNdTvsvKhwcqyKLKjrOTaghYxfHCQAYsJYgyGvBfJNqgEooxNHTNhSUuIyaXRobewcypiBBWhDTYHpjaRvYlkVVCPlWngiEmfpCuhVvTELeUgBdZORWiiYYVWWrZPOasleOjJFFSSCsAMwYBxKWiHjvidwrfutbTvfRaiubSvqqXefPRMEJtuSee','tvHmYWhDkrqlzaExTXzAMWopivXInvAkUReKDPRCzpjLRIYfhbbWBGFGjhubuYsqnNEFjQKLOjHmdYLjrpinQROBccPOAWwRDtRvHWuyhkKYpVpveNpbXLANeGbpztKPkDZVCcSQxWBTULmhLJnpgbjehRfHIAeJmCxvSJwfbFCRKqEQqpaePUczHTrqAEirMfQauuKDPPmjQwDxfDvUaHfGBmXbxLMNGVgwhdroJqtjduKlUGQzxicVArWJcPZ','OZjsEAaZzUWvbUYcNwgYRaPkjvidJgkPguBUMupVqppOWwqxsu','JsEOFrypgKlYuyy','MWOCtNrIkDzRKBzeNZrB','EkJQRtvHqyxlqnoHFnur','bjGFxuPDzcCWaLTopWwm','lIqVDfdwoVRXKSkALBsK','OXQbvDDkaFHiFaolzAaEjtXIr','AFDBFeEynHrEnmeGSNkPiBUSf',112359469,'pSlINqiNBsqFxiIGuDBgTywGizgTtVkzkwgQTFUuuMVHSXLRWu'),(2,'msIfHHGSPiiHzgtsIIpLfrhlehkixnukfvrKstlrkuAcRyfaICQjcisVYERvjhsoBBGozetfTdaiTkugTSRwcdInqAywDhqTOgTsEKGWymXwFFAwDiwcgqusrkZbIHWoLthAWRBJawdoYLnjZBUsgVyPdTSmKoKXgVPzcfhGawRzIdylfuprbLxGjlollXvgyMrWxCdMLyNjXtrrKHBzZIoLSJyPPzXHewwUGhbAQUYneWDogUNsSBsEcHxWHBY','fXovRqUglMtPbTYuLlozCTtPRVpCysBmDKvVScHOnNYLuQnzJAQfRKaxgCmUSdHtbaqBMIjnKYFBktQIPWwFFRfFzYNOwthsMrUnyzguISKNJaLowLmOfQDkWzJKAeJfXOarcDUlExFjVALsxWwTRUqILujiLpIQzBzArxnLqXlrrKMstjZjiChQYGSgEhjoBYNowuIQXTMNrMFuzoLsjMBkXEJolGzgsAvperZWlAyIQmBEuENOsNJfyvHuJaN','YoGFuHdpHWGBkCZSBUlAttdHXuTOYSuDtwpqKmWLTOnkwTfxDUSfVnwLJyZCcyGcbwLbiPWCleIvwUofJbQClZopiVwEdlKKgecCGBvAuHYmFLYkFvjskexDbPptUDMEgVSTZwhtfhcbLwsQWxTZdIdiwEWACgvgMGdGozLPkBFoIZVLwhtctVMbVrQbDAAKBhswsUqNXquZkRZaIiukWlTKZQFlUuSTLybvhoaDKlyaYIJLwnRprQhLKZKGElZ','jRnacVOJFCTrpkZEdkMjNAhkUucBFuZstqEspJnjxPhiGVkcuinrVZCPoNQKgzpcMbkBtFINrROOEMmGyjPRCybXBYkfTSyTLzyhDHNSIRaVPsTZqjsZEhvCfbPhTMSWkaDOxKtdkNhjiWSZcAZTGXCwFphUossUgSIkXDRqZKJGIgOTCGzxoCgJFLmESwQbJsLeIJQBpIDIyzbjtJHIorKnSpjIYgGODnDCegjkMmjbZUGblUIiAOPKIzXrPDo','DepLoGBQVpZNnuTySabCZYoVuBUmaZZnpEylyLJolgJSDHafvO','qghhxGLPmiWCByM','SrCYDtfVaUkSOWRrNozG','UNtqqAfPcUFTTaFBfXwq','BQhXdeeDjNhvXsjBAzmv','yDXcABGuVIcdvukaZZzJ','uJUewgzCBMqrBBQSetKmgFHOW','JdfdVGDxHXmBwGSnadmFFnBue',1489748108,'UGhbtsiqEKKdcQmbVKejKcQCKOCyykOMfALWBEQKdApAetVOgX'),(3,'JEptTrtPeARMdKaWCRxdrLsXBLeedWCZofErBsCdcnEXaAOremrfAfwyRSwzpjJjefcfCdJGEeuGmWKjUlFSGLdOakOLHQhAjReTdHeWTRbaiWjICnttRnyPPFBPJVGysVbMoDMfdGMxKWtJFKQSNiOMIujQswFBWhJzNPyQAyLeLlaJgxNfhKNUorVPcYcDtIfxwIdrDqWRJDbJRNlzybCZLUZHxQydCMhaniYDRboZBOZiMcDKIZpdgXvBDBg','zUabyiiqNeujjvFWszBBFByqOhvQWDeYrlOmSJquCIhlTUSbdVJAzhwBiehjLkXHhzjlCBGZPJcffKEHbkIDSFlbdVdkPKLaHvZPYVqnybdqOohDqXQFCXNxyPMxGNjcCuVdXhnEETjUqpyASpOFwoIIaRGSzLPMJROFEwGjJJBwxNwktXUILSNJNaMSWjwYYqqWtwzcTPLqKuazmkWNMNVlusfHHxTPiPtHPXyLOlXMHpoVDpFETdcDSPRjHAy','bNhhpVvcVMIbQVFWURfGvUOvwlNrGrapmYfDDZWwUDAEOjSnKALDAwNQJEVkftygcuqPVnjwfrNmGXIIsvlorDYVObnVlgsjwALIRvKvnyRzDCTqhBTjRJarqyXhooPdSqoWAljheuTnOXFjtaMeYcnvtaDrFUQFrsnOVdsHqIxNgrYemMbJofwJKBkYxkFYXUTpFIaYnMhlAeDaDbEcGjqhkcNWUnyrtcWDLznhlJfLYXhAEwFMWZYgmwHeQdw','YAqELXKURSUGvfJgqQyOkEoESPIoNeMvwPisLnDBAjOJOsvWSPxWghHWnshldPEEfYhNDCuIjUyHeSUwCNPZIeABVioQKlYCHjOPSJnhfDYfnwUdOqBbnpKRihZbkdGsYqoWMnXWVApgKPdbvUCxJvOWWBjbPaelPeRiTOrKRhltWjudHJhKAaeesTtXQrgsXLYgXxbKzIuQKQtBVCYWrGBwERqXROJUyPaxCjNnswzWTnFCIHTWAejiCQiDFNA','WZeFLmZWyxCBbyVLntixjWkTZAVYBqwNknmaqXpwUyrDsjMXxm','axwOjycTPacGHiU','WvbKjFoHHFEPdGwDOohI','mOHGMBqIOdyrjxSKScdX','nTmXYdQKTDHfmerVXOVA','yrsToODLJrENJAkSgdVZ','FHuTINJlPtPNKshzLVIWyjjDm','vfxiSxhRTwMwhNwzmKhUmTDjQ',1977919842,'ohGlcHIFSSeWogKnJPXVNQrIlrObCaqtNwgwnmBbfqqNkGvsXd');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `BRANCH_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MANAGER_ID` bigint(20) NOT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  `ADDRESS_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  PRIMARY KEY (`BRANCH_ID`),
  KEY `FK_BR_REST` (`RESTURANT_ID`),
  KEY `FK_BR_ADD` (`ADDRESS_ID`),
  CONSTRAINT `FK_BR_ADD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `address` (`ADDRESS_ID`),
  CONSTRAINT `FK_BR_REST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,1717440605,1,1,1),(2,235109636,1,1,1),(3,177248646,1,1,1);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `configuration_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `status` enum('public','private') NOT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `account_id` mediumint(9) NOT NULL,
  `configuration_name` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `num_rows_generated` mediumint(9) DEFAULT '0',
  PRIMARY KEY (`configuration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` VALUES (1,'private','2017-03-16 00:00:00','2017-03-19 00:00:00',8294050,'jVJNmlLqHgvrNYoKzkPscrExvhBqQDOkOfqJuQqkeXmqXXtaJRJfBXLyjtAXlCvTxgRxoTvDMyEVEmQoPEYZzmsOUPchFaCrNjEm','zysvAgUSpkXaGvLFMXKBPHpkENRTiRbiJkxEHuZDkmLfrVbDkLEGEbMgHNPQQUJhMBDKByEjotUNQbZuyDwHIXaqRKeEUTSgWTuWGTYoqkMpRLAlDHSIBocqOTBeUKwdkqiFzMJBlRNbmvVSGIgcKBOJFGEiPLEkeoDjvGoOODwQIZpZUCcPNCHJLxWLQOGxtRLMyxsk',1907071),(2,'private','2017-03-18 00:00:00','2017-03-20 00:00:00',6469952,'HjHGzlBaDjHdlvVAZqKgXRSxTJgSEwnYKZEUpNDjHEBEuTIrVPxGojWgVLYfCOHdawIlEpwDTmbQXYJtsyguuqrDioFEclbdOAel','fJVqCpOhfoeWGgpBQzNrzhdpdsrYIxlYtnwdPdGvSoFWALekKItHtIlWlvLBGxWytmWIXnrxNltqhZMChgpENboWkgaaOsJlgbWDDLsEiqKEdWISDnqNDyUyFaZdzMerXVbSnkhPvrQkjZuLhqXQSYgmJYbMjLBVBNJEnGBbzMoIwGumtxbJQEXIJhCghZyeaWrsqKVG',4510762);
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisine_translation`
--

DROP TABLE IF EXISTS `cuisine_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuisine_translation` (
  `CUISINE_TRANS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `CUISINE_TYPE_ID` bigint(20) NOT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `SHOW_DESCRIPTION` int(1) DEFAULT NULL,
  PRIMARY KEY (`CUISINE_TRANS_ID`),
  UNIQUE KEY `UNQ_CUSTRA` (`CUISINE_TYPE_ID`,`LANGUAGE_ID`),
  KEY `FK_CUSTRA_LNG` (`LANGUAGE_ID`),
  CONSTRAINT `FK_CUSTRA_CUS` FOREIGN KEY (`CUISINE_TYPE_ID`) REFERENCES `cuisine_type` (`CUISINE_TYPE_ID`),
  CONSTRAINT `FK_CUSTRA_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_languages` (`LANGUAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine_translation`
--

LOCK TABLES `cuisine_translation` WRITE;
/*!40000 ALTER TABLE `cuisine_translation` DISABLE KEYS */;
INSERT INTO `cuisine_translation` VALUES (1,'ENG Title','ENG Description',1,1,1);
/*!40000 ALTER TABLE `cuisine_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuisine_type`
--

DROP TABLE IF EXISTS `cuisine_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuisine_type` (
  `CUISINE_TYPE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IMAGE_URL` varchar(255) NOT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CUISINE_TYPE_ID`),
  KEY `FK_CT_REST` (`RESTURANT_ID`),
  CONSTRAINT `FK_CT_REST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine_type`
--

LOCK TABLES `cuisine_type` WRITE;
/*!40000 ALTER TABLE `cuisine_type` DISABLE KEYS */;
INSERT INTO `cuisine_type` VALUES (1,'Image URL',1,1,'Cusine Type'),(2,'Image URL',1,1,'Cusinise Type 2');
/*!40000 ALTER TABLE `cuisine_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CUSTOMER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(10) NOT NULL,
  `FIRST_NAME` varchar(255) NOT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `MOBILE` varchar(15) DEFAULT NULL,
  `ADDRESS_ID` bigint(20) DEFAULT NULL,
  `SUBSCRIBE_NEWS_LETTER` int(1) DEFAULT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  UNIQUE KEY `CODE` (`CODE`),
  KEY `FK_CUST_REST` (`RESTURANT_ID`),
  CONSTRAINT `FK_CUST_REST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'DVFpTBpgIj','JIdDQxhtxFKczgRSoAIDjgmYNIkVnThNnPysTjsPfhTpynmgbIxGGQgcMRNZWSredsVXZWZPgbGnxOFzyYvqEIIZUEokBcHpJrQMvLHSxWEgxvwqkWtpNkgKLbKJVFtZBxjNKbVPPYmykClOPYhIsDtHUmyvTsjZUlzPEBdwYsVyvSVlPDRISWAoHSbptjFDuUdjrJYtbdNTzxPrYYlgVmoPHhILCbndjRyzsoIWzbfLQaCfuiDvltalEWVOGNe','kitvOJKTymJvdPPhrmrUlbUbjqmHXghQxKYoAEbZyyEDCRpfPqeeDauYsmXZgydVBMdYokClIjagDjwfEutcDDpsPhhmYfCyAeZhgBBFynWJQbvrDHyJeRFFWIChRntEVTzMfEXTnDSWSkiDwIHneOEmEDDgomDxikAcOqoAAqyzPSjESOAAQNVDWAtTavRkgMbDOvHNHHutEWwEVFFUdjJEgNnqfJgwIalWrTvuplWgJrMbuKbwjfQnIgDRiJP','ZjOghVaPuqKnnxs',1528938913,1640644326,1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `FEEDBACK_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RATING` int(11) NOT NULL,
  `REMARKS` varchar(255) DEFAULT NULL,
  `ORDER_ID` bigint(20) NOT NULL,
  `FEEDBACK_TYPE_ID` bigint(20) NOT NULL,
  `BRANCH_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FEEDBACK_ID`),
  KEY `FK_FB_ORD` (`ORDER_ID`),
  KEY `FK_FB_TYP` (`FEEDBACK_TYPE_ID`),
  KEY `FK_FB_BR` (`BRANCH_ID`),
  CONSTRAINT `FK_FB_BR` FOREIGN KEY (`BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`),
  CONSTRAINT `FK_FB_ORD` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`),
  CONSTRAINT `FK_FB_TYP` FOREIGN KEY (`FEEDBACK_TYPE_ID`) REFERENCES `feedback_type` (`FEEDBACK_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,864238816,'ZaHPpYygaNqjKYARfsSYLybQrlrsQRrhJgmBpgirJNonQZTwOHViuinXdRXggwqNwQOeRfoBOMezWoTvKlkSiJyOdFPyIgRkstAkznzFVAoeEYdDZWZnMMEEhCRuDyvnVhRDItzsLVsUbJgrUuJXcMuIHPVmNhgiaYrscFHrkvdPidFXdQrnDMbkBHCBiZYuTmNgyxKGMhAjjrrUrloDPYoClucVcaRaNXPJhaijearLWRnJMPdHGRJgiqUhWPH',1,1,1);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_translation`
--

DROP TABLE IF EXISTS `feedback_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_translation` (
  `FEEDBACK_TRANS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `FEEDBACK_TYPE_ID` bigint(20) NOT NULL,
  `SHOW_DESCRIPTION` int(1) DEFAULT NULL,
  PRIMARY KEY (`FEEDBACK_TRANS_ID`),
  UNIQUE KEY `UNQ_FBTRA` (`FEEDBACK_TYPE_ID`,`LANGUAGE_ID`),
  KEY `FK_FBT_LNG` (`LANGUAGE_ID`),
  CONSTRAINT `FK_FBT_FB` FOREIGN KEY (`FEEDBACK_TYPE_ID`) REFERENCES `feedback` (`FEEDBACK_ID`),
  CONSTRAINT `FK_FBT_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_languages` (`LANGUAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_translation`
--

LOCK TABLES `feedback_translation` WRITE;
/*!40000 ALTER TABLE `feedback_translation` DISABLE KEYS */;
INSERT INTO `feedback_translation` VALUES (1,'PohqWwFVsoXAzlHlCiJZWjAFTuuqJCYUmBqTvCaBbOpuENCcyEwVVxUEWTGuofVfoRSmyrBipJLargXqCTmItXLAxFznvQFHBQzheFpAaZEdpipbOLTtJRAsxedlQoUlxfrfkaqAsyslgxKzWUHNDijoLwIhpVYZCAQFjfwnvfjihMYiAJwWpoWFqDutcerqKdnzjjotKiSuoQrFdIZpNTWJQyRxfccRonoueWGZRCSFeZmtbkrgTkstBYeuwru','JLpUkmCNjjpjbQitwVItZVkjOyTQQWxfbuQpavaEoUMDIHDpswYUrPHCACAtboSoLEarOnreHsXlvOuftscDvrgdgsSeKJETbDwUMaweHPfBFtFGwNBtGkEFzfqVUeYBjQqdmLvAsEAoAcbhQyXjKxZqjDUIcBFsiwVNamDAJgZWNNzItHsTZnTPsROthbzZvifIYAxkNVYKsEnMaGPcBSEwgCQgSCXHJPlQBPMtnEaqxeSeaApRNNyoqBoYyav',1,1,280889636);
/*!40000 ALTER TABLE `feedback_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_type`
--

DROP TABLE IF EXISTS `feedback_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback_type` (
  `FEEDBACK_TYPE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`FEEDBACK_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_type`
--

LOCK TABLES `feedback_type` WRITE;
/*!40000 ALTER TABLE `feedback_type` DISABLE KEYS */;
INSERT INTO `feedback_type` VALUES (1,705382351,1329648048);
/*!40000 ALTER TABLE `feedback_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_translation`
--

DROP TABLE IF EXISTS `ingredient_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredient_translation` (
  `INGREDIENT_TRANS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `INGREDIENT_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `SHOW_DESCRIPTION` int(11) DEFAULT NULL,
  PRIMARY KEY (`INGREDIENT_TRANS_ID`),
  UNIQUE KEY `UNQ_INGTRAN` (`INGREDIENT_ID`,`LANGUAGE_ID`),
  KEY `FK_INGTRA_LNG` (`LANGUAGE_ID`),
  CONSTRAINT `FK_INGTRA_ING` FOREIGN KEY (`INGREDIENT_ID`) REFERENCES `ingredients` (`INGREDIENT_ID`),
  CONSTRAINT `FK_INGTRA_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_languages` (`LANGUAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_translation`
--

LOCK TABLES `ingredient_translation` WRITE;
/*!40000 ALTER TABLE `ingredient_translation` DISABLE KEYS */;
INSERT INTO `ingredient_translation` VALUES (1,1,'Eng Description',1,'Eng Title',1);
/*!40000 ALTER TABLE `ingredient_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredients` (
  `INGREDIENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IMAGE_URL` varchar(255) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`INGREDIENT_ID`),
  KEY `FK_ING_REST` (`RESTURANT_ID`),
  CONSTRAINT `FK_ING_REST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Image URL',1,1);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEM_CATEGORY_ID` bigint(20) NOT NULL,
  `CUISINE_TYPE_ID` bigint(20) NOT NULL,
  `SPICE_TYPE_ID` bigint(20) NOT NULL,
  `PRICE` decimal(5,3) NOT NULL,
  `TAGS` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ITEM_ID`),
  UNIQUE KEY `UNQ_ITM` (`ITEM_CATEGORY_ID`,`CUISINE_TYPE_ID`,`SPICE_TYPE_ID`),
  KEY `FK_ITEM_CT` (`CUISINE_TYPE_ID`),
  KEY `FK_ITEM_SPICE` (`SPICE_TYPE_ID`),
  CONSTRAINT `FK_ITEM_CAT` FOREIGN KEY (`ITEM_CATEGORY_ID`) REFERENCES `item_category` (`ITEM_CATEGORY_ID`),
  CONSTRAINT `FK_ITEM_CT` FOREIGN KEY (`CUISINE_TYPE_ID`) REFERENCES `cuisine_type` (`CUISINE_TYPE_ID`),
  CONSTRAINT `FK_ITEM_SPICE` FOREIGN KEY (`SPICE_TYPE_ID`) REFERENCES `spice_type` (`SPICE_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,1,1,1,3.200,'Item Tags');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_addon`
--

DROP TABLE IF EXISTS `item_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_addon` (
  `ITEM_ADDON_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ADDON_ID` bigint(20) NOT NULL,
  `PRICE` decimal(5,3) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  `ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ITEM_ADDON_ID`),
  UNIQUE KEY `UNQ_ITMAO` (`ITEM_ID`,`ADDON_ID`),
  KEY `FK_ITEMADDON_ADDON` (`ADDON_ID`),
  CONSTRAINT `FK_ITEMADDON_ADDON` FOREIGN KEY (`ADDON_ID`) REFERENCES `addons` (`ADDON_ID`),
  CONSTRAINT `FK_ITEMADDON_ITEM` FOREIGN KEY (`ITEM_ID`) REFERENCES `item` (`ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_addon`
--

LOCK TABLES `item_addon` WRITE;
/*!40000 ALTER TABLE `item_addon` DISABLE KEYS */;
INSERT INTO `item_addon` VALUES (1,1,1.200,1,1);
/*!40000 ALTER TABLE `item_addon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_category`
--

DROP TABLE IF EXISTS `item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_category` (
  `ITEM_CATEGORY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IMAGE_URL` varchar(255) NOT NULL,
  `SMALL_ICON_URL` varchar(255) NOT NULL,
  `LARGE_ICON_URL` varchar(255) NOT NULL,
  `PARENT_CATEGORY` bigint(20) NOT NULL,
  `TAGS` varchar(500) DEFAULT NULL,
  `MENU_ID` bigint(20) NOT NULL,
  `AVAILABLE_DURATION_START` time DEFAULT NULL,
  `AVAILABLE_DURATION_END` time DEFAULT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  `priority` int(9) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ITEM_CATEGORY_ID`),
  UNIQUE KEY `UNQ_ITECAT` (`RESTURANT_ID`,`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_category`
--

LOCK TABLES `item_category` WRITE;
/*!40000 ALTER TABLE `item_category` DISABLE KEYS */;
INSERT INTO `item_category` VALUES (1,'Image URL','SMALL ICON URL','Large ICON URL',1576528172,'12345',1,'19:56:47','19:52:02',1,400854744,1);
/*!40000 ALTER TABLE `item_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_category_translation`
--

DROP TABLE IF EXISTS `item_category_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_category_translation` (
  `ITEM_CATEGORY_TRANS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `MENU_CATEGORY_ID` bigint(20) NOT NULL,
  `SHOW_DESCRIPTION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ITEM_CATEGORY_TRANS_ID`),
  UNIQUE KEY `UNQ_ICT` (`LANGUAGE_ID`,`MENU_CATEGORY_ID`),
  KEY `FK_ICT_MC` (`MENU_CATEGORY_ID`),
  CONSTRAINT `FK_ICT_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_languages` (`LANGUAGE_ID`),
  CONSTRAINT `FK_ICT_MC` FOREIGN KEY (`MENU_CATEGORY_ID`) REFERENCES `item_category` (`ITEM_CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_category_translation`
--

LOCK TABLES `item_category_translation` WRITE;
/*!40000 ALTER TABLE `item_category_translation` DISABLE KEYS */;
INSERT INTO `item_category_translation` VALUES (1,'Cate_ENG','English translation for category 1',1,1,1);
/*!40000 ALTER TABLE `item_category_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_discount`
--

DROP TABLE IF EXISTS `item_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_discount` (
  `ITEM_DISCOUNT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DISCOUNT_PRICE` decimal(5,3) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `ITEM_VARIANT_ID` bigint(20) DEFAULT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  PRIMARY KEY (`ITEM_DISCOUNT_ID`),
  KEY `FK_ITDIS_VAR` (`ITEM_VARIANT_ID`),
  CONSTRAINT `FK_ITDIS_VAR` FOREIGN KEY (`ITEM_VARIANT_ID`) REFERENCES `item_variant` (`ITEM_VARIANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_discount`
--

LOCK TABLES `item_discount` WRITE;
/*!40000 ALTER TABLE `item_discount` DISABLE KEYS */;
INSERT INTO `item_discount` VALUES (1,2.200,'2017-03-21','2017-03-19',1,1);
/*!40000 ALTER TABLE `item_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_ingredient`
--

DROP TABLE IF EXISTS `item_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_ingredient` (
  `ITEM_INGREDIENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `INGREDIENT_ID` bigint(20) NOT NULL,
  `ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ITEM_INGREDIENT_ID`),
  KEY `FK_II_ITEM` (`ITEM_ID`),
  KEY `FK_II_ING` (`INGREDIENT_ID`),
  CONSTRAINT `FK_II_ING` FOREIGN KEY (`INGREDIENT_ID`) REFERENCES `ingredients` (`INGREDIENT_ID`),
  CONSTRAINT `FK_II_ITEM` FOREIGN KEY (`ITEM_ID`) REFERENCES `item` (`ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_ingredient`
--

LOCK TABLES `item_ingredient` WRITE;
/*!40000 ALTER TABLE `item_ingredient` DISABLE KEYS */;
INSERT INTO `item_ingredient` VALUES (1,1,1);
/*!40000 ALTER TABLE `item_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_media_content`
--

DROP TABLE IF EXISTS `item_media_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_media_content` (
  `ITEM_MEDIA_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEM_ID` bigint(20) NOT NULL,
  `IMAGE_URL` varchar(255) NOT NULL,
  `VEDIO_URL` varchar(255) DEFAULT NULL,
  `VEDIO_SOURCE_ID` bigint(20) DEFAULT NULL,
  `DISPLAY_ORDER` int(11) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  PRIMARY KEY (`ITEM_MEDIA_ID`),
  KEY `FK_IMC_IT` (`ITEM_ID`),
  KEY `FK_IMC_VS` (`VEDIO_SOURCE_ID`),
  CONSTRAINT `FK_IMC_IT` FOREIGN KEY (`ITEM_ID`) REFERENCES `item` (`ITEM_ID`),
  CONSTRAINT `FK_IMC_VS` FOREIGN KEY (`VEDIO_SOURCE_ID`) REFERENCES `vedio_source_type` (`VEDIO_SOURCE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_media_content`
--

LOCK TABLES `item_media_content` WRITE;
/*!40000 ALTER TABLE `item_media_content` DISABLE KEYS */;
INSERT INTO `item_media_content` VALUES (1,1,'Image URL','Vedio URL',1,1,1);
/*!40000 ALTER TABLE `item_media_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_translation`
--

DROP TABLE IF EXISTS `item_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_translation` (
  `ITEM_TRANSLATION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `ITEM_ID` bigint(20) NOT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `DIETARY_INFORMATION` varchar(255) DEFAULT NULL,
  `IS_SPICY` int(1) DEFAULT NULL,
  `SHOW_DESCRIPTION` int(1) DEFAULT NULL,
  PRIMARY KEY (`ITEM_TRANSLATION_ID`),
  UNIQUE KEY `UNQ_ITTRA` (`ITEM_ID`,`LANGUAGE_ID`),
  KEY `FK_ITTR_LNG` (`LANGUAGE_ID`),
  CONSTRAINT `FK_ITTR_IT` FOREIGN KEY (`ITEM_ID`) REFERENCES `item` (`ITEM_ID`),
  CONSTRAINT `FK_ITTR_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_languages` (`LANGUAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_translation`
--

LOCK TABLES `item_translation` WRITE;
/*!40000 ALTER TABLE `item_translation` DISABLE KEYS */;
INSERT INTO `item_translation` VALUES (1,'Eng Title','Eng Desc',1,1,'Eng Diet Information',1,1);
/*!40000 ALTER TABLE `item_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_variant`
--

DROP TABLE IF EXISTS `item_variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_variant` (
  `ITEM_VARIANT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ITEM_ID` bigint(20) NOT NULL,
  `VARIANT_ID` bigint(20) NOT NULL,
  `PRICE` decimal(5,3) NOT NULL,
  `APPROX_PREPERATION_TIME` int(11) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  PRIMARY KEY (`ITEM_VARIANT_ID`),
  UNIQUE KEY `UNQ_ITMVAR` (`ITEM_ID`,`VARIANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_variant`
--

LOCK TABLES `item_variant` WRITE;
/*!40000 ALTER TABLE `item_variant` DISABLE KEYS */;
INSERT INTO `item_variant` VALUES (1,1,1,3.100,30,1);
/*!40000 ALTER TABLE `item_variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `MENU_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`),
  KEY `FK_MENU_REST` (`RESTURANT_ID`),
  CONSTRAINT `FK_MENU_REST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Menu Titile',1,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_json`
--

DROP TABLE IF EXISTS `object_json`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_json` (
  `JSON_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `record_type` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `JSON_DATA` longtext NOT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `JSON_VERSION` bigint(20) NOT NULL,
  PRIMARY KEY (`JSON_ID`),
  KEY `FK_JSON_LNG` (`LANGUAGE_ID`),
  KEY `FK_JSON_REST` (`RESTURANT_ID`),
  CONSTRAINT `FK_JSON_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_languages` (`LANGUAGE_ID`),
  CONSTRAINT `FK_JSON_REST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_json`
--

LOCK TABLES `object_json` WRITE;
/*!40000 ALTER TABLE `object_json` DISABLE KEYS */;
INSERT INTO `object_json` VALUES (1,1,1,'[\n  {\n    \"menuId\": 1,\n    \"isActive\": false,\n    \"name\": \"sRkMAyAqEIUNBNqKShaooYRuRIpmKmzKiWLcLBLNSkMHIPxxVaBmSrYlpuWFnPxJrQmIuFSfFqHVLkDgbvxwOgFMOCxImleghGmdOamzXwloMXwbxzDaQzhYIooQSwcByVQWfhejZsWrktKhiBvpfNgOwzYqSuPdWhvWTSQcuZEXQipLRcwEzAghWyrxclthBuCjVwgXqxxupwHxCVXDApxPBlIwvcehybtGYHmsYhAjsqujgyldgkwMGeJWLsD\",\n    \"categories\": [\n      {\n        \"itemCategoryId\": 1,\n        \"imageUrl\": \"kAcDUeFKuLmjtgDDcQkTRjTCtDeZytKcGNuWsBzcgHWidBmzlQPunVEtsicnsNbyYdXmfBnQQUdGSVgfAuQNhCGDykyWTfgiDAZBPCrnJqLhByqvomxDqqYrEqVYmlqSJMhdgfRJICvTJSWVUlRWBztsjDJOpyeyMfgAlGjzvCvFIJalxLRvaTBGtOLqxgMdZrFPUledhEQDrNOXtPoCihZprvsEBiJZlbXiYkLcZdXogxNyUPkYmZYrIpFBetx\",\n        \"smallIconUrl\": \"gyEKQMWPEdXKoOTwLqwAIlrkYKEahkbuBGHrCvtlLatQuwhxUIMmCKekegvcAkHxeMuneSfBmFQUWiyDEGZUoKUqRBLozAzxtDXHurwJRcrtKIuDAhhozwcEvNCGpuznxVjhrZsTvZDVURRfJnMCGxcYYQqdgWGstmfpAMzxAwrMlPEIwWxtkLiRzwejRanwUKoieLqXXMjFZcCqRfaaGZgxPTKBJMOyrvhJMpFyvBMYSSblEHZIzxrNFssLqCN\",\n        \"largeIconUrl\": \"GfvbRevcqthRkIciIDPIEdAWBYsdnTEckrsilPIbZgBqgBjkgoKmNBlVUqoKuMAgGwKWTMrECuLqwhDBMoIMKvTdmupfvPhHjLlXAPlZxWQfLQxyecBRnuQvlDwomfkTMjmXLSKEbuvGgqRVplXdzBZOjgQVCMPobSmMwnUvozORTebOPbPsFTzdwEVYkImASfyRRHUcGOxaiBnLqIWnYhHixfYtIhhyFFdcDTQKOFFINWtZYnsrFWNgRimOytj\",\n        \"parentCategory\": 0,\n        \"tags\": \"bgkgDTHtOcKgrqVTIpOnYcjnfzGAfYvuyUxdeDQGxppKhCBJpArGiONHggTxJXhBFocDWvdrJBbZAlBkxuWeVcztnyVpKIJEXPsrZFdRGPVZIBYXoHvCdSAczulDIQWcLVhTISgenjkWjmJAHZYTUCGAJgYyrnwiSJTGBLEACnAtkyWhtDFzCUaQKGFhodnEgXrOmqYRIGQudLFshSzWpXAVsLemUzmcjMZUwWxBKCsUMadkTcYBqZbZmocgMcHSPeSWkleoWBNmxLbKufuZCVPWKpIviqfaXdONgyttKxFHFwwwxsoLhNPIBqVHUobrxmQyXKFlViDJgMYzUwuarIKGKCrkdMRSqWOFFKWeauNuirYdeAAGwMfiRfZUWNqzFllVTXOjFdOvhIjNluAjiaxIOqVFXVvNyqpGUitYKxXPsutcTbCJrnEuVcCBsEjCBOkPNfnjNebGsvPxBcfLpKVTHhsjhDtRbZhsJUcIBmZIFHNFUUrJ\",\n        \"availableDurationStart\": \"07:56:47 PM\",\n        \"availableDurationEnd\": \"07:52:02 PM\",\n        \"resturantId\": 0,\n        \"categoryTransList\": [\n          {\n            \"translationId\": 1,\n            \"title\": \"Cate_ENG\",\n            \"description\": \"English translation for category 1\",\n            \"languageId\": 1\n          }\n        ]\n      }\n    ]\n  }\n]',1,1,1),(2,3,1,'[\n  {\n    \"itemId\": 1,\n    \"price\": 3.200,\n    \"tags\": \"ZdCVWicguyZYGTSBtZRSpdfUjqleGDbhzzotTDmujflnFHCeiLZKEqRaxLTodocNYvjLAYFUFGxpXoKLsFBHBpXDizonPqwCdhYNniGbmaofZohnfBUTNSaLOcfFPqztbEbZXGeBwFaxmuyfCYvNmJadkVjrIASggehmWywtkiFrwgFfIzEOYIhGQMpgzbysnvyjduaoUrDRlvNGhxSRuUyjMnDjQJCFTDGKwrDshWNfTCVkxXjqesEqFjKODKuAXPNUsoeOGGSHJqoSosDzbENhxeNtsoQDCBdsGFpeHUPwFwwZBDHFcLOEnXDvKfWQwuXRwrkWJLnfClWEuoFkmslvBEJeErRgwPfRRmqKRoPYnokCMCupOpGweMggdnwTSTRwybBXCoFfAKLJXZkjBNQiowGpUxHvAfKnOYCcEleEUTDXXOGZyOlThUYfWUnxNgCQfDMJfOgUYyMvXYgeyLfbErXBzrcywgBGmIkkrqRxbIzUvHOJ\",\n    \"categoryId\": 1,\n    \"translations\": [\n      {\n        \"translationId\": 1,\n        \"title\": \"NoIaelqmDcbJvKpIaDTxuOSaHTIPRSNGgjwcakkAtlhvrkxvCybDPghvxfQwWpWdnRJIiVbVDNSowibfPxpctvsgpLgijaiEKygXKddAvtcpPAoetbvFlFfelqcaHsgwqEfluJtIuBmYtqdHMbHZidldiFRwmkwjmCONdacBRhnHwIaooCUDmPSINMAMpFAfLqsOxStXgQzjiNdFADSniTfwAvfJgYNKILbLnytVapGDUEmgmnOOUDzfpeQuSiS\",\n        \"description\": \"ftIfNMIbVrKgUflFPsXqiUWdQCqoAzIQZpABkQCeYUMjZxQfwPztRPPaTXshPWQvYQVIodBazdPIQYEdquNQksUYexNZcGCnekTxftieUvUHEZqPOeCHSXxzsqfEaCeHtbsVuuYzlYilwEPKmdDgMqWbqEEMpZbSQbuXFcvkyrasEjhzTEhVHzndOSINTsgDSeFySgybBCcSHaPgHKvUXUfAyMvWEuuayeMKDjkVKAPhZLIMyJEHVApXpKKitAu\",\n        \"languageId\": 1\n      }\n    ]\n  }\n]',1,1,1),(3,1,1,'[\n  {\n    \"menuId\": 1,\n    \"isActive\": false,\n    \"name\": \"Menu Titile\",\n    \"categories\": [\n      {\n        \"itemCategoryId\": 1,\n        \"imageUrl\": \"Image URL\",\n        \"smallIconUrl\": \"SMALL ICON URL\",\n        \"largeIconUrl\": \"Large ICON URL\",\n        \"parentCategory\": 0,\n        \"tags\": \"12345\",\n        \"availableDurationStart\": \"07:56:47 PM\",\n        \"availableDurationEnd\": \"07:52:02 PM\",\n        \"resturantId\": 0,\n        \"translations\": {\n          \"GGtZ\": {\n            \"translationId\": 1,\n            \"title\": \"Cate_ENG\",\n            \"description\": \"English translation for category 1\",\n            \"languageId\": 1\n          }\n        }\n      }\n    ]\n  }\n]',1,1,1),(4,3,1,'[\n  {\n    \"itemId\": 1,\n    \"price\": 3.200,\n    \"tags\": \"ZdCVWicguyZYGTSBtZRSpdfUjqleGDbhzzotTDmujflnFHCeiLZKEqRaxLTodocNYvjLAYFUFGxpXoKLsFBHBpXDizonPqwCdhYNniGbmaofZohnfBUTNSaLOcfFPqztbEbZXGeBwFaxmuyfCYvNmJadkVjrIASggehmWywtkiFrwgFfIzEOYIhGQMpgzbysnvyjduaoUrDRlvNGhxSRuUyjMnDjQJCFTDGKwrDshWNfTCVkxXjqesEqFjKODKuAXPNUsoeOGGSHJqoSosDzbENhxeNtsoQDCBdsGFpeHUPwFwwZBDHFcLOEnXDvKfWQwuXRwrkWJLnfClWEuoFkmslvBEJeErRgwPfRRmqKRoPYnokCMCupOpGweMggdnwTSTRwybBXCoFfAKLJXZkjBNQiowGpUxHvAfKnOYCcEleEUTDXXOGZyOlThUYfWUnxNgCQfDMJfOgUYyMvXYgeyLfbErXBzrcywgBGmIkkrqRxbIzUvHOJ\",\n    \"categoryId\": 1,\n    \"translations\": [\n      {\n        \"translationId\": 1,\n        \"title\": \"NoIaelqmDcbJvKpIaDTxuOSaHTIPRSNGgjwcakkAtlhvrkxvCybDPghvxfQwWpWdnRJIiVbVDNSowibfPxpctvsgpLgijaiEKygXKddAvtcpPAoetbvFlFfelqcaHsgwqEfluJtIuBmYtqdHMbHZidldiFRwmkwjmCONdacBRhnHwIaooCUDmPSINMAMpFAfLqsOxStXgQzjiNdFADSniTfwAvfJgYNKILbLnytVapGDUEmgmnOOUDzfpeQuSiS\",\n        \"description\": \"ftIfNMIbVrKgUflFPsXqiUWdQCqoAzIQZpABkQCeYUMjZxQfwPztRPPaTXshPWQvYQVIodBazdPIQYEdquNQksUYexNZcGCnekTxftieUvUHEZqPOeCHSXxzsqfEaCeHtbsVuuYzlYilwEPKmdDgMqWbqEEMpZbSQbuXFcvkyrasEjhzTEhVHzndOSINTsgDSeFySgybBCcSHaPgHKvUXUfAyMvWEuuayeMKDjkVKAPhZLIMyJEHVApXpKKitAu\",\n        \"languageId\": 1\n      }\n    ]\n  }\n]',1,1,1),(5,1,1,'[\n  {\n    \"menuId\": 1,\n    \"isActive\": false,\n    \"name\": \"Menu Titile\",\n    \"categories\": [\n      {\n        \"itemCategoryId\": 1,\n        \"imageUrl\": \"Image URL\",\n        \"smallIconUrl\": \"SMALL ICON URL\",\n        \"largeIconUrl\": \"Large ICON URL\",\n        \"parentCategory\": 0,\n        \"tags\": \"12345\",\n        \"availableDurationStart\": \"07:56:47 PM\",\n        \"availableDurationEnd\": \"07:52:02 PM\",\n        \"resturantId\": 0,\n        \"translations\": {\n          \"GGtZ\": {\n            \"translationId\": 1,\n            \"title\": \"Cate_ENG\",\n            \"description\": \"English translation for category 1\",\n            \"languageId\": 1\n          }\n        }\n      }\n    ]\n  }\n]',1,1,1),(6,3,1,'[\n  {\n    \"itemId\": 1,\n    \"price\": 3.200,\n    \"tags\": \"ZdCVWicguyZYGTSBtZRSpdfUjqleGDbhzzotTDmujflnFHCeiLZKEqRaxLTodocNYvjLAYFUFGxpXoKLsFBHBpXDizonPqwCdhYNniGbmaofZohnfBUTNSaLOcfFPqztbEbZXGeBwFaxmuyfCYvNmJadkVjrIASggehmWywtkiFrwgFfIzEOYIhGQMpgzbysnvyjduaoUrDRlvNGhxSRuUyjMnDjQJCFTDGKwrDshWNfTCVkxXjqesEqFjKODKuAXPNUsoeOGGSHJqoSosDzbENhxeNtsoQDCBdsGFpeHUPwFwwZBDHFcLOEnXDvKfWQwuXRwrkWJLnfClWEuoFkmslvBEJeErRgwPfRRmqKRoPYnokCMCupOpGweMggdnwTSTRwybBXCoFfAKLJXZkjBNQiowGpUxHvAfKnOYCcEleEUTDXXOGZyOlThUYfWUnxNgCQfDMJfOgUYyMvXYgeyLfbErXBzrcywgBGmIkkrqRxbIzUvHOJ\",\n    \"categoryId\": 1,\n    \"translations\": [\n      {\n        \"translationId\": 1,\n        \"title\": \"NoIaelqmDcbJvKpIaDTxuOSaHTIPRSNGgjwcakkAtlhvrkxvCybDPghvxfQwWpWdnRJIiVbVDNSowibfPxpctvsgpLgijaiEKygXKddAvtcpPAoetbvFlFfelqcaHsgwqEfluJtIuBmYtqdHMbHZidldiFRwmkwjmCONdacBRhnHwIaooCUDmPSINMAMpFAfLqsOxStXgQzjiNdFADSniTfwAvfJgYNKILbLnytVapGDUEmgmnOOUDzfpeQuSiS\",\n        \"description\": \"ftIfNMIbVrKgUflFPsXqiUWdQCqoAzIQZpABkQCeYUMjZxQfwPztRPPaTXshPWQvYQVIodBazdPIQYEdquNQksUYexNZcGCnekTxftieUvUHEZqPOeCHSXxzsqfEaCeHtbsVuuYzlYilwEPKmdDgMqWbqEEMpZbSQbuXFcvkyrasEjhzTEhVHzndOSINTsgDSeFySgybBCcSHaPgHKvUXUfAyMvWEuuayeMKDjkVKAPhZLIMyJEHVApXpKKitAu\",\n        \"languageId\": 1\n      }\n    ]\n  }\n]',1,1,1),(7,1,1,'[\n  {\n    \"menuId\": 1,\n    \"isActive\": false,\n    \"name\": \"Menu Titile\",\n    \"categories\": [\n      {\n        \"itemCategoryId\": 1,\n        \"imageUrl\": \"Image URL\",\n        \"smallIconUrl\": \"SMALL ICON URL\",\n        \"largeIconUrl\": \"Large ICON URL\",\n        \"parentCategory\": 0,\n        \"tags\": \"12345\",\n        \"availableDurationStart\": \"07:56:47 PM\",\n        \"availableDurationEnd\": \"07:52:02 PM\",\n        \"resturantId\": 0,\n        \"translations\": {\n          \"GGtZ\": {\n            \"translationId\": 1,\n            \"title\": \"Cate_ENG\",\n            \"description\": \"English translation for category 1\",\n            \"languageId\": 1\n          }\n        }\n      }\n    ]\n  }\n]',1,1,1),(8,3,1,'[\n  {\n    \"itemId\": 1,\n    \"price\": 3.200,\n    \"tags\": \"ZdCVWicguyZYGTSBtZRSpdfUjqleGDbhzzotTDmujflnFHCeiLZKEqRaxLTodocNYvjLAYFUFGxpXoKLsFBHBpXDizonPqwCdhYNniGbmaofZohnfBUTNSaLOcfFPqztbEbZXGeBwFaxmuyfCYvNmJadkVjrIASggehmWywtkiFrwgFfIzEOYIhGQMpgzbysnvyjduaoUrDRlvNGhxSRuUyjMnDjQJCFTDGKwrDshWNfTCVkxXjqesEqFjKODKuAXPNUsoeOGGSHJqoSosDzbENhxeNtsoQDCBdsGFpeHUPwFwwZBDHFcLOEnXDvKfWQwuXRwrkWJLnfClWEuoFkmslvBEJeErRgwPfRRmqKRoPYnokCMCupOpGweMggdnwTSTRwybBXCoFfAKLJXZkjBNQiowGpUxHvAfKnOYCcEleEUTDXXOGZyOlThUYfWUnxNgCQfDMJfOgUYyMvXYgeyLfbErXBzrcywgBGmIkkrqRxbIzUvHOJ\",\n    \"categoryId\": 1,\n    \"translations\": [\n      {\n        \"translationId\": 1,\n        \"title\": \"NoIaelqmDcbJvKpIaDTxuOSaHTIPRSNGgjwcakkAtlhvrkxvCybDPghvxfQwWpWdnRJIiVbVDNSowibfPxpctvsgpLgijaiEKygXKddAvtcpPAoetbvFlFfelqcaHsgwqEfluJtIuBmYtqdHMbHZidldiFRwmkwjmCONdacBRhnHwIaooCUDmPSINMAMpFAfLqsOxStXgQzjiNdFADSniTfwAvfJgYNKILbLnytVapGDUEmgmnOOUDzfpeQuSiS\",\n        \"description\": \"ftIfNMIbVrKgUflFPsXqiUWdQCqoAzIQZpABkQCeYUMjZxQfwPztRPPaTXshPWQvYQVIodBazdPIQYEdquNQksUYexNZcGCnekTxftieUvUHEZqPOeCHSXxzsqfEaCeHtbsVuuYzlYilwEPKmdDgMqWbqEEMpZbSQbuXFcvkyrasEjhzTEhVHzndOSINTsgDSeFySgybBCcSHaPgHKvUXUfAyMvWEuuayeMKDjkVKAPhZLIMyJEHVApXpKKitAu\",\n        \"languageId\": 1\n      }\n    ]\n  }\n]',1,1,1),(9,1,1,'[\n  {\n    \"menuId\": 1,\n    \"isActive\": false,\n    \"name\": \"Menu Titile\",\n    \"categories\": [\n      {\n        \"itemCategoryId\": 1,\n        \"imageUrl\": \"Image URL\",\n        \"smallIconUrl\": \"SMALL ICON URL\",\n        \"largeIconUrl\": \"Large ICON URL\",\n        \"parentCategory\": 0,\n        \"tags\": \"12345\",\n        \"availableDurationStart\": \"07:56:47 PM\",\n        \"availableDurationEnd\": \"07:52:02 PM\",\n        \"resturantId\": 0,\n        \"translations\": {\n          \"GGtZ\": {\n            \"translationId\": 1,\n            \"title\": \"Cate_ENG\",\n            \"description\": \"English translation for category 1\",\n            \"languageId\": 1\n          }\n        }\n      }\n    ]\n  }\n]',1,1,1),(10,3,1,'[\n  {\n    \"itemId\": 1,\n    \"price\": 3.200,\n    \"tags\": \"ZdCVWicguyZYGTSBtZRSpdfUjqleGDbhzzotTDmujflnFHCeiLZKEqRaxLTodocNYvjLAYFUFGxpXoKLsFBHBpXDizonPqwCdhYNniGbmaofZohnfBUTNSaLOcfFPqztbEbZXGeBwFaxmuyfCYvNmJadkVjrIASggehmWywtkiFrwgFfIzEOYIhGQMpgzbysnvyjduaoUrDRlvNGhxSRuUyjMnDjQJCFTDGKwrDshWNfTCVkxXjqesEqFjKODKuAXPNUsoeOGGSHJqoSosDzbENhxeNtsoQDCBdsGFpeHUPwFwwZBDHFcLOEnXDvKfWQwuXRwrkWJLnfClWEuoFkmslvBEJeErRgwPfRRmqKRoPYnokCMCupOpGweMggdnwTSTRwybBXCoFfAKLJXZkjBNQiowGpUxHvAfKnOYCcEleEUTDXXOGZyOlThUYfWUnxNgCQfDMJfOgUYyMvXYgeyLfbErXBzrcywgBGmIkkrqRxbIzUvHOJ\",\n    \"categoryId\": 1,\n    \"translations\": [\n      {\n        \"translationId\": 1,\n        \"title\": \"NoIaelqmDcbJvKpIaDTxuOSaHTIPRSNGgjwcakkAtlhvrkxvCybDPghvxfQwWpWdnRJIiVbVDNSowibfPxpctvsgpLgijaiEKygXKddAvtcpPAoetbvFlFfelqcaHsgwqEfluJtIuBmYtqdHMbHZidldiFRwmkwjmCONdacBRhnHwIaooCUDmPSINMAMpFAfLqsOxStXgQzjiNdFADSniTfwAvfJgYNKILbLnytVapGDUEmgmnOOUDzfpeQuSiS\",\n        \"description\": \"ftIfNMIbVrKgUflFPsXqiUWdQCqoAzIQZpABkQCeYUMjZxQfwPztRPPaTXshPWQvYQVIodBazdPIQYEdquNQksUYexNZcGCnekTxftieUvUHEZqPOeCHSXxzsqfEaCeHtbsVuuYzlYilwEPKmdDgMqWbqEEMpZbSQbuXFcvkyrasEjhzTEhVHzndOSINTsgDSeFySgybBCcSHaPgHKvUXUfAyMvWEuuayeMKDjkVKAPhZLIMyJEHVApXpKKitAu\",\n        \"languageId\": 1\n      }\n    ]\n  }\n]',1,1,1),(11,1,1,'[\n  {\n    \"menuId\": 1,\n    \"isActive\": false,\n    \"name\": \"Menu Titile\",\n    \"categories\": [\n      {\n        \"itemCategoryId\": 1,\n        \"imageUrl\": \"Image URL\",\n        \"smallIconUrl\": \"SMALL ICON URL\",\n        \"largeIconUrl\": \"Large ICON URL\",\n        \"parentCategory\": 0,\n        \"tags\": \"12345\",\n        \"availableDurationStart\": \"07:56:47 PM\",\n        \"availableDurationEnd\": \"07:52:02 PM\",\n        \"resturantId\": 0,\n        \"translations\": {\n          \"GGtZ\": {\n            \"translationId\": 1,\n            \"title\": \"Cate_ENG\",\n            \"description\": \"English translation for category 1\",\n            \"languageId\": 1\n          }\n        }\n      }\n    ]\n  }\n]',1,1,1),(12,3,1,'[\n  {\n    \"itemId\": 1,\n    \"price\": 3.200,\n    \"tags\": \"ZdCVWicguyZYGTSBtZRSpdfUjqleGDbhzzotTDmujflnFHCeiLZKEqRaxLTodocNYvjLAYFUFGxpXoKLsFBHBpXDizonPqwCdhYNniGbmaofZohnfBUTNSaLOcfFPqztbEbZXGeBwFaxmuyfCYvNmJadkVjrIASggehmWywtkiFrwgFfIzEOYIhGQMpgzbysnvyjduaoUrDRlvNGhxSRuUyjMnDjQJCFTDGKwrDshWNfTCVkxXjqesEqFjKODKuAXPNUsoeOGGSHJqoSosDzbENhxeNtsoQDCBdsGFpeHUPwFwwZBDHFcLOEnXDvKfWQwuXRwrkWJLnfClWEuoFkmslvBEJeErRgwPfRRmqKRoPYnokCMCupOpGweMggdnwTSTRwybBXCoFfAKLJXZkjBNQiowGpUxHvAfKnOYCcEleEUTDXXOGZyOlThUYfWUnxNgCQfDMJfOgUYyMvXYgeyLfbErXBzrcywgBGmIkkrqRxbIzUvHOJ\",\n    \"categoryId\": 1,\n    \"translations\": [\n      {\n        \"translationId\": 1,\n        \"title\": \"NoIaelqmDcbJvKpIaDTxuOSaHTIPRSNGgjwcakkAtlhvrkxvCybDPghvxfQwWpWdnRJIiVbVDNSowibfPxpctvsgpLgijaiEKygXKddAvtcpPAoetbvFlFfelqcaHsgwqEfluJtIuBmYtqdHMbHZidldiFRwmkwjmCONdacBRhnHwIaooCUDmPSINMAMpFAfLqsOxStXgQzjiNdFADSniTfwAvfJgYNKILbLnytVapGDUEmgmnOOUDzfpeQuSiS\",\n        \"description\": \"ftIfNMIbVrKgUflFPsXqiUWdQCqoAzIQZpABkQCeYUMjZxQfwPztRPPaTXshPWQvYQVIodBazdPIQYEdquNQksUYexNZcGCnekTxftieUvUHEZqPOeCHSXxzsqfEaCeHtbsVuuYzlYilwEPKmdDgMqWbqEEMpZbSQbuXFcvkyrasEjhzTEhVHzndOSINTsgDSeFySgybBCcSHaPgHKvUXUfAyMvWEuuayeMKDjkVKAPhZLIMyJEHVApXpKKitAu\",\n        \"languageId\": 1\n      }\n    ]\n  }\n]',1,1,1),(13,1,1,'[\n  {\n    \"menuId\": 1,\n    \"isActive\": false,\n    \"name\": \"Menu Titile\",\n    \"categories\": [\n      {\n        \"itemCategoryId\": 1,\n        \"imageUrl\": \"Image URL\",\n        \"smallIconUrl\": \"SMALL ICON URL\",\n        \"largeIconUrl\": \"Large ICON URL\",\n        \"parentCategory\": 0,\n        \"tags\": \"12345\",\n        \"availableDurationStart\": \"07:56:47 PM\",\n        \"availableDurationEnd\": \"07:52:02 PM\",\n        \"resturantId\": 0,\n        \"translations\": {\n          \"GGtZ\": {\n            \"translationId\": 1,\n            \"title\": \"Cate_ENG\",\n            \"description\": \"English translation for category 1\",\n            \"languageId\": 1\n          }\n        }\n      }\n    ]\n  }\n]',1,1,1),(14,3,1,'[\n  {\n    \"itemId\": 1,\n    \"price\": 3.200,\n    \"tags\": \"ZdCVWicguyZYGTSBtZRSpdfUjqleGDbhzzotTDmujflnFHCeiLZKEqRaxLTodocNYvjLAYFUFGxpXoKLsFBHBpXDizonPqwCdhYNniGbmaofZohnfBUTNSaLOcfFPqztbEbZXGeBwFaxmuyfCYvNmJadkVjrIASggehmWywtkiFrwgFfIzEOYIhGQMpgzbysnvyjduaoUrDRlvNGhxSRuUyjMnDjQJCFTDGKwrDshWNfTCVkxXjqesEqFjKODKuAXPNUsoeOGGSHJqoSosDzbENhxeNtsoQDCBdsGFpeHUPwFwwZBDHFcLOEnXDvKfWQwuXRwrkWJLnfClWEuoFkmslvBEJeErRgwPfRRmqKRoPYnokCMCupOpGweMggdnwTSTRwybBXCoFfAKLJXZkjBNQiowGpUxHvAfKnOYCcEleEUTDXXOGZyOlThUYfWUnxNgCQfDMJfOgUYyMvXYgeyLfbErXBzrcywgBGmIkkrqRxbIzUvHOJ\",\n    \"categoryId\": 1,\n    \"translations\": [\n      {\n        \"translationId\": 1,\n        \"title\": \"NoIaelqmDcbJvKpIaDTxuOSaHTIPRSNGgjwcakkAtlhvrkxvCybDPghvxfQwWpWdnRJIiVbVDNSowibfPxpctvsgpLgijaiEKygXKddAvtcpPAoetbvFlFfelqcaHsgwqEfluJtIuBmYtqdHMbHZidldiFRwmkwjmCONdacBRhnHwIaooCUDmPSINMAMpFAfLqsOxStXgQzjiNdFADSniTfwAvfJgYNKILbLnytVapGDUEmgmnOOUDzfpeQuSiS\",\n        \"description\": \"ftIfNMIbVrKgUflFPsXqiUWdQCqoAzIQZpABkQCeYUMjZxQfwPztRPPaTXshPWQvYQVIodBazdPIQYEdquNQksUYexNZcGCnekTxftieUvUHEZqPOeCHSXxzsqfEaCeHtbsVuuYzlYilwEPKmdDgMqWbqEEMpZbSQbuXFcvkyrasEjhzTEhVHzndOSINTsgDSeFySgybBCcSHaPgHKvUXUfAyMvWEuuayeMKDjkVKAPhZLIMyJEHVApXpKKitAu\",\n        \"languageId\": 1\n      }\n    ]\n  }\n]',1,1,1),(15,1,1,'[\n  {\n    \"menuId\": 1,\n    \"isActive\": false,\n    \"name\": \"Menu Titile\",\n    \"categories\": [\n      {\n        \"itemCategoryId\": 1,\n        \"imageUrl\": \"Image URL\",\n        \"smallIconUrl\": \"SMALL ICON URL\",\n        \"largeIconUrl\": \"Large ICON URL\",\n        \"parentCategory\": 0,\n        \"tags\": \"12345\",\n        \"availableDurationStart\": \"07:56:47 PM\",\n        \"availableDurationEnd\": \"07:52:02 PM\",\n        \"resturantId\": 0,\n        \"translations\": {\n          \"GGtZ\": {\n            \"translationId\": 1,\n            \"title\": \"Cate_ENG\",\n            \"description\": \"English translation for category 1\",\n            \"languageId\": 1\n          }\n        }\n      }\n    ]\n  }\n]',1,1,1),(16,3,1,'[\n  {\n    \"itemId\": 1,\n    \"price\": 3.200,\n    \"tags\": \"ZdCVWicguyZYGTSBtZRSpdfUjqleGDbhzzotTDmujflnFHCeiLZKEqRaxLTodocNYvjLAYFUFGxpXoKLsFBHBpXDizonPqwCdhYNniGbmaofZohnfBUTNSaLOcfFPqztbEbZXGeBwFaxmuyfCYvNmJadkVjrIASggehmWywtkiFrwgFfIzEOYIhGQMpgzbysnvyjduaoUrDRlvNGhxSRuUyjMnDjQJCFTDGKwrDshWNfTCVkxXjqesEqFjKODKuAXPNUsoeOGGSHJqoSosDzbENhxeNtsoQDCBdsGFpeHUPwFwwZBDHFcLOEnXDvKfWQwuXRwrkWJLnfClWEuoFkmslvBEJeErRgwPfRRmqKRoPYnokCMCupOpGweMggdnwTSTRwybBXCoFfAKLJXZkjBNQiowGpUxHvAfKnOYCcEleEUTDXXOGZyOlThUYfWUnxNgCQfDMJfOgUYyMvXYgeyLfbErXBzrcywgBGmIkkrqRxbIzUvHOJ\",\n    \"categoryId\": 1,\n    \"translations\": [\n      {\n        \"translationId\": 1,\n        \"title\": \"NoIaelqmDcbJvKpIaDTxuOSaHTIPRSNGgjwcakkAtlhvrkxvCybDPghvxfQwWpWdnRJIiVbVDNSowibfPxpctvsgpLgijaiEKygXKddAvtcpPAoetbvFlFfelqcaHsgwqEfluJtIuBmYtqdHMbHZidldiFRwmkwjmCONdacBRhnHwIaooCUDmPSINMAMpFAfLqsOxStXgQzjiNdFADSniTfwAvfJgYNKILbLnytVapGDUEmgmnOOUDzfpeQuSiS\",\n        \"description\": \"ftIfNMIbVrKgUflFPsXqiUWdQCqoAzIQZpABkQCeYUMjZxQfwPztRPPaTXshPWQvYQVIodBazdPIQYEdquNQksUYexNZcGCnekTxftieUvUHEZqPOeCHSXxzsqfEaCeHtbsVuuYzlYilwEPKmdDgMqWbqEEMpZbSQbuXFcvkyrasEjhzTEhVHzndOSINTsgDSeFySgybBCcSHaPgHKvUXUfAyMvWEuuayeMKDjkVKAPhZLIMyJEHVApXpKKitAu\",\n        \"languageId\": 1\n      }\n    ]\n  }\n]',1,1,1);
/*!40000 ALTER TABLE `object_json` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item_addon`
--

DROP TABLE IF EXISTS `order_item_addon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item_addon` (
  `ORDER_ITEM_ADDON_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` bigint(20) NOT NULL,
  `PRICE` decimal(5,3) NOT NULL,
  `SPECIAL_REMARKS` varchar(500) DEFAULT NULL,
  `QUANTITY` int(10) NOT NULL,
  `ITEM_ADDON_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM_ADDON_ID`),
  KEY `FK_OIA_IAD` (`ITEM_ADDON_ID`),
  KEY `FK_OIA_ORD` (`ORDER_ID`),
  CONSTRAINT `FK_OIA_IAD` FOREIGN KEY (`ITEM_ADDON_ID`) REFERENCES `item_addon` (`ITEM_ID`),
  CONSTRAINT `FK_OIA_ORD` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item_addon`
--

LOCK TABLES `order_item_addon` WRITE;
/*!40000 ALTER TABLE `order_item_addon` DISABLE KEYS */;
INSERT INTO `order_item_addon` VALUES (1,1,3.000,'1',1,1);
/*!40000 ALTER TABLE `order_item_addon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `ORDER_ITEM` bigint(20) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` bigint(20) NOT NULL,
  `ITEM_VARIANT_ID` bigint(20) NOT NULL,
  `QUANTITY` bigint(20) NOT NULL,
  `SPECIAL_REMARKS` varchar(500) DEFAULT NULL,
  `ORDER_PRICE` decimal(5,3) NOT NULL,
  PRIMARY KEY (`ORDER_ITEM`),
  KEY `FK_OI_IV` (`ITEM_VARIANT_ID`),
  KEY `FK_OI_ORD` (`ORDER_ID`),
  CONSTRAINT `FK_OI_IV` FOREIGN KEY (`ITEM_VARIANT_ID`) REFERENCES `item_variant` (`ITEM_VARIANT_ID`),
  CONSTRAINT `FK_OI_ORD` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,456210012,'Special Remarks',0.000),(2,4,1,1,'NA',1.000),(3,5,1,1,'NA',1.000),(4,6,1,1,'NA',1.000),(5,7,1,1,'NA',1.000),(6,8,1,1,'NA',1.000),(7,9,1,1,'NA',3.100),(8,10,1,1,'NA',3.100),(9,11,1,1,'NA',3.100),(10,12,1,1,'NA',3.100);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_special_deal_item`
--

DROP TABLE IF EXISTS `order_special_deal_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_special_deal_item` (
  `ORDER_SPECIAL_DEAL_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` bigint(20) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `SPECIAL_REMARKS` varchar(255) DEFAULT NULL,
  `ORDER_PRICE` decimal(5,3) NOT NULL,
  `MEAL_DEAL_ITEM_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_SPECIAL_DEAL_ITEM_ID`),
  KEY `FK_OSDI_ORD` (`ORDER_ID`),
  KEY `FK_OSDI_MDI` (`MEAL_DEAL_ITEM_ID`),
  CONSTRAINT `FK_OSDI_MDI` FOREIGN KEY (`MEAL_DEAL_ITEM_ID`) REFERENCES `special_deal_item` (`MEAL_DEAL_ITEM_ID`),
  CONSTRAINT `FK_OSDI_ORD` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_special_deal_item`
--

LOCK TABLES `order_special_deal_item` WRITE;
/*!40000 ALTER TABLE `order_special_deal_item` DISABLE KEYS */;
INSERT INTO `order_special_deal_item` VALUES (1,1,1678753024,'VlBnnkmOmXTrPQdwHoOpjHBwYmJjvkWnuzkjyQEwzphzItQSSBSROkfxpuefpGNLXgKErHztkplPrENrFtHoogXwIdTKhBPYPeVHOoYkTbaXQJBJPIDjvsgRHqgvWrEdCiJhTevVUHfezxGWoETpBVYIwfTOeTdXWtDRgoDgOaOSFQVwcbWRrYPcnuQsvCSsjojWvkPIIMclpYMCRBXpIGutOVLkKFTonhNvvRtqHULBUMmuMSQxqFEwZxNUxva',0.200,1);
/*!40000 ALTER TABLE `order_special_deal_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ORDER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `REFERENCE_NUM` varchar(255) NOT NULL,
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `ORDER_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SPECIAL_REMARKS` varchar(500) DEFAULT NULL,
  `SERVING_TABLE_ID` bigint(20) NOT NULL,
  `ORDER_STATUS` bigint(20) NOT NULL,
  `CANCELLATION_REASON` varchar(500) DEFAULT NULL,
  `DISCOUNT_APPLIED_PCT` decimal(5,3) DEFAULT NULL,
  `STAFF_ID` bigint(20) NOT NULL,
  `BRANCH_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `FK_ORD_CUST` (`CUSTOMER_ID`),
  KEY `FK_ORD_ST` (`SERVING_TABLE_ID`),
  KEY `FK_ORD_STF` (`STAFF_ID`),
  KEY `FK_ORD_BR` (`BRANCH_ID`),
  CONSTRAINT `FK_ORD_BR` FOREIGN KEY (`BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`),
  CONSTRAINT `FK_ORD_CUST` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  CONSTRAINT `FK_ORD_ST` FOREIGN KEY (`SERVING_TABLE_ID`) REFERENCES `serving_table` (`SERVING_TABLE_ID`),
  CONSTRAINT `FK_ORD_STF` FOREIGN KEY (`STAFF_ID`) REFERENCES `staff` (`STAFF_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'jSJgddzZkRVZgqKuFAqDPnTlYMTEmUirUPUIjyNoaUikliDkbBkktusNXjkmEibthcYYxdmncyHCyBgVVdubNrslFvUJYzdlTtlPRPluQxMsJWvvcvOibRZfGGIgRVjCCMXewskFakbdJiDJeFoNpTQTkoYXjitfFaMdIciBUUyipbjlgTTzvrHiLZAlpudRunErvxAQTvOKNntozKLKkJIqTIOappEuLdiigajCZtcJARyTzWpnUXRIKSijTjl',1,'2017-03-16 15:43:27','xUhwNrPKcWlOOAKjKgiBvBbbmuNnEGunUBzzsfsQlZAWFfjPOJdYPZYjkXZhtLzEtLzpbIAtEKFjoVoooFFzGXPPkgJFIxIWyctyrhHPwCIqBRQljXjCvhEnAJqywbNDQRufdnoJBWIyVuLwFjgNoAVwdhjMkbWOApMfhoMYgKqwvrQAewXbjRiJxuUBxVBFUNtDZJPRLfHAaLYrgSTntUXqtJIvxrfApExtcWKxatDNvVNnuBjbKqNlEVGpcERzXzBRNeZBQELDJvkNjeSRKEVauSTWSPWyGBwllYAEZpVmVtXkVdHgXaBDdBgOnBimHtcxiLjwMRGDgWyvjZmoAgQFnXTgcoYuQVFDMAWuGlBexovWoJdBxdXrnyRvMAxYnIDbKslYFIFrdjLjAYosfDNgtmQXqJzHccfmVyKAjxchYlPiMDCzppfTQIDeYpSsSfkBYOYlaxxcAGFwwkitvVMEsxYrAhPWsgtETQOLlUzZWwNirIQe',1,1230125889,'hNAKMBpAMzILcqZcCXtUrarweMCdPUTpVWWpBXQNKRPepKNqtGXlDpeYJRYzcufRHmcaFjIlilcvGiASnSfVlwkditZOtyyWNXGyTJNuUxIzziZnCHtcGppvLIWyxUpSIzXCZRkncDFeJJSUkmVYjbcbWsHUsyPSTtzqcgUpPTyLzbzZEeeeAjBqqftzvFbvqkgBCBzFhRQKgLHJQOgywQRaNwmBbXvhbtmCFxCPKRlKduySelsKrROiQOyGOVYNpNoMUrQhYbdUdcbsgZpcBPERvyBaSkrwomJIkTXrbcIERJhmUeCqByHLFYBUDGnWfxqADaTyXowUQleyiZEBWyTmxDxonmgpvWysIkrvsFFMpLKLjBzTidkxxJeJDsYGoPCHBTGQtEcnTDVgsCnDndNmkWwDxCcogBEHevaQfAmEKwpycuuvWkeWcGLJGVCFtUQDFkIrpTfmQjNXCIkwThbXoBiHDdvrAtrMfblzvJHKclUPEpxN',0.000,1,1),(4,'1437482674676',1,'2017-07-21 12:44:35',NULL,1,0,'',0.000,1,1),(5,'1',1,'2017-07-21 13:38:32',NULL,1,0,'',0.000,1,1),(6,'2',1,'2017-07-21 13:38:47',NULL,1,0,'',0.000,1,1),(7,'11562-3',1,'2017-07-21 13:43:56',NULL,1,0,'',0.000,1,1),(8,'20170721-4',1,'2017-07-21 13:48:16',NULL,1,0,'',0.000,1,1),(9,'20170726-5',1,'2017-07-26 12:15:36',NULL,1,0,'',0.000,1,1),(10,'20170726-6',1,'2017-07-26 12:17:59',NULL,1,0,'',0.000,1,1),(11,'20170726-7',1,'2017-07-26 14:03:53',NULL,1,0,'',0.000,1,1),(12,'20170727-8',1,'2017-07-27 11:45:03',NULL,1,0,'',0.000,1,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_languages`
--

DROP TABLE IF EXISTS `ref_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_languages` (
  `LANGUAGE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(25) NOT NULL,
  `CODE` varchar(4) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  PRIMARY KEY (`LANGUAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_languages`
--

LOCK TABLES `ref_languages` WRITE;
/*!40000 ALTER TABLE `ref_languages` DISABLE KEYS */;
INSERT INTO `ref_languages` VALUES (1,'OGwjuVaDKOPfJKBAYGcqvKxdc','EN',1),(2,'RvmmTjTOiTeuPHwMjMSTdBeku','AR',1),(3,'JGvPHkblDtNtrMycQUhMteSgh','UR',1);
/*!40000 ALTER TABLE `ref_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_device`
--

DROP TABLE IF EXISTS `restaurant_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant_device` (
  `RESTAURANT_DEVICE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` bigint(20) NOT NULL,
  `DEVICE_MANUFECTURER` varchar(255) NOT NULL,
  `LAST_LOGIN_TIME` date DEFAULT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  `ACTIVATED_ON` date DEFAULT NULL,
  `IS_BLOCKED` int(1) DEFAULT NULL,
  `BLOCKED_ON` date DEFAULT NULL,
  `ACTIVATED_BY` varchar(255) DEFAULT NULL,
  `BLOCKED_BY` varchar(255) DEFAULT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  `REGISTRATION_CODE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RESTAURANT_DEVICE_ID`),
  KEY `FK_RESTD_REST` (`RESTURANT_ID`),
  CONSTRAINT `FK_RESTD_REST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_device`
--

LOCK TABLES `restaurant_device` WRITE;
/*!40000 ALTER TABLE `restaurant_device` DISABLE KEYS */;
INSERT INTO `restaurant_device` VALUES (1,1,'HTC','2017-03-16',1,'2017-03-19',0,'2017-03-20','SAJID','',1,'12345656343434');
/*!40000 ALTER TABLE `restaurant_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resturant`
--

DROP TABLE IF EXISTS `resturant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resturant` (
  `RESTURANT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACTIVATION_KEY` varchar(25) NOT NULL,
  `CONTACT_PERSON` varchar(255) NOT NULL,
  `LOGO_SMALL` varchar(255) NOT NULL,
  `LOGO_LARGE` varchar(255) NOT NULL,
  `THEME` varchar(5) DEFAULT NULL,
  `ACCOUNT_TYPE_ID` bigint(20) NOT NULL,
  `BACKGROUND_IMAGE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RESTURANT_ID`),
  UNIQUE KEY `ACTIVATION_KEY` (`ACTIVATION_KEY`),
  KEY `FK_REST_ACCT` (`ACCOUNT_TYPE_ID`),
  CONSTRAINT `FK_REST_ACCT` FOREIGN KEY (`ACCOUNT_TYPE_ID`) REFERENCES `account_type` (`ACCOUNT_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resturant`
--

LOCK TABLES `resturant` WRITE;
/*!40000 ALTER TABLE `resturant` DISABLE KEYS */;
INSERT INTO `resturant` VALUES (1,'123213123121ad','SaJID','GOOGLE.COM','GOOGLE.COM','BL',1,'Google.com'),(2,'RmJgPxRzSccdbOzisZaUCGLin','pTbgPXOKtuLtIXfGLWbTvwKFBigLTtCGpMGytJusuZNpwVbToPALaueRLdmRnnEVdsykjLLltqzDHxsLHuyctcPPacAmtvjrICGqewWGQpGTElebFXJcHqMuQbfXRuRtGavGhqnqqzDMXZYiMfVHJTbzsjaDMKoEGybonVosHTFWBWpwRzGoMguzRRtSWJoAyIjDWpeRwkuSeyaNkpTSnRgtTyJEhllUJoeFIiOlbdvlBljwVRYbZkCMzScXaZh','hnHrttpJVYMWzNtXyODXapsKgtSLyjXYCvzVfRqEuDvmGBhOCuSOcHwFSaGLWrzqBJXEBxtiDeXSDIekMTAwYsFYRpYTeirOBGRBMxnBQJznsEjodooiyTjkHDvDzNKCQSzTKtKjOVloGpVNIUoybbbyXDbJXDpNpFDzOpCAdVASsczXxvRZzgLeYvBZeINeRYJVkwAVaxBGeoCnAqTutSOAGSigvjRdkVZSblBDezzTxksoUNvLBKVncumBsLb','PVDuSSFKowhUkxFONkvouepXQDKMbTnnTmTbKfDOLdnAieJyHTnRAosDZWgHAxOVpKLpZCVCdYvwPFZxENjcbanLZgUBSZWHEjWYnsfFwradnnhFxKYJprxJvOVrQoAApFUwDIJJAFdLVVaDatFdbASCZsjMdCaYrCzVhXoqgJpScnOGdLMTJpYzrZdRwQFArhcsXBSHGVKIixhzWdlynRkWUZBxzYPpDMFXPuOGoqAfIEmMHmCxRFeLyQlihnK','qPyqP',1,'YHebJsrsWQXjAzHnQRKhSSWABUhrxoPkICycjhfXLIbPgrkIOkYpTrfiCEUaGrdtbWcpiUkCcGBwgrhLDrLAEdAwPUpHiUOPERvwzeSCubHVDxEOjTYPznEUiDtZtEKoMZxZHFORfEZWFYmnlCkJlESEcchQGRMlJvlRroxYgzHnrySljXadJjULIKwAesGhhJOPBXYRNvZqOkWHXLJgsQFmEjDeyYVZFVQfzaqIDwRYGVXfmzmYTDhaYdfVLIM'),(3,'QhicgBKxSapylGaAobocmgaAJ','QezbfpkaRunvfRrtDERZakcwnWZZscBvHXmleRwcYPtUTQdPRBUGCTrPPJhOuzpZGOLZEqCDoiaSDuNaxudblLwwMGQbUxMolKzXsNclyDffLKFyxyWjNvdUzAoJowyHoRIdlPvMcXZBlTzEsIKEkjMupxpljCgjxhzOoXvUAGAsOPwKGtFOvtEmnCNFFQQufmMkprUmkCxbEEidXyXqYblbOjcEOYXFfKEJfheeDwKPdzyHleArgmwgcpqWmxr','RxfnhFETXfQrLMJMMAsDfKCOFggVSkFuqUtaZZUdBninpyrYFkURORLmEvHEMGUjBxWvcJShddHzYayeGqGDKWZJuRbOAfLsDWzStblTKGvkwcaCxQwYYOtcsHvKaeeWUnQnCexWnlZHbSPvCeSnKGgFJAXwAcMsQKrIYZRMWVdYorBFxidUawojXXmrRgqLuEgTvTzIsQZNqBQCiBwCryYihLZxbdzPoVxwGjOfIprWfGPYqvWCkmKFJPCwkiM','GDNvsdKwwGBdllyawmUxjefmnMPsGwjqnSQRxKcQjWqvPLfisoMBDoWWXAUdIruDKuSCgAmgiSEmzSbgdFYiUgRYdWhnMaNaDJZfpxiSjJwydhIDInGKPlxISuolLXgvWebxvgUpbtInTOVbOvudaxRUIIFyzJHZOqjzfAYQFxcQYXgREbdMYivhpCWTXdmlyIOoIxamzvMoIefeytohwWvqvVOpfBkTaHIfTiNYLefeGtPIRwLxsmQkFRbuMdI','xhQRu',1,'yOhjppmzYeZOjCfxFAuddJGjUAncegFhaFhOZdBzKpEIFinvTyMrRLtPDGMtArfSOjWHShatjgcvutyrQtpNcyqgJNecKGPAiyelXTiTaTNQErPGjJveOCdYsOoqixBTHtjvXGDWKrXgCmDEcwSCvKBCzTxIuTdRYqMLHAyMVpynUPLZEFyqOeflchynzcSnfyzcCjePqrKMrRgNtNpobWOxHnFlYvlrjFhoEDgPaMYdnvjpRXLaceslFouRPat');
/*!40000 ALTER TABLE `resturant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resturant_language`
--

DROP TABLE IF EXISTS `resturant_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resturant_language` (
  `RESTURANT_LANGUAGE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` int(11) DEFAULT NULL,
  PRIMARY KEY (`RESTURANT_LANGUAGE_ID`),
  UNIQUE KEY `UNQ_RESTLANG` (`RESTURANT_ID`,`LANGUAGE_ID`),
  KEY `FK_RST_LNG` (`LANGUAGE_ID`),
  CONSTRAINT `FK_RSTLNG_REST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`),
  CONSTRAINT `FK_RST_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_languages` (`LANGUAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resturant_language`
--

LOCK TABLES `resturant_language` WRITE;
/*!40000 ALTER TABLE `resturant_language` DISABLE KEYS */;
INSERT INTO `resturant_language` VALUES (1,1,1,176678519);
/*!40000 ALTER TABLE `resturant_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resturant_translation`
--

DROP TABLE IF EXISTS `resturant_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resturant_translation` (
  `RESTURANT_TRANS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `SHOW_DESCRIPTION` int(1) DEFAULT NULL,
  PRIMARY KEY (`RESTURANT_TRANS_ID`),
  UNIQUE KEY `UNQ_RESTTRA` (`RESTURANT_ID`,`LANGUAGE_ID`),
  KEY `FK_RESTTR_LNG` (`LANGUAGE_ID`),
  CONSTRAINT `FK_RESTTR_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_languages` (`LANGUAGE_ID`),
  CONSTRAINT `FK_RESTTR_REST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resturant_translation`
--

LOCK TABLES `resturant_translation` WRITE;
/*!40000 ALTER TABLE `resturant_translation` DISABLE KEYS */;
INSERT INTO `resturant_translation` VALUES (1,'xugQWAlXzCSZmDnRkhcIZtsGzYDZpwsUtlcTIeflPALMRczcKZGFiXIQtKQFthCvJUHlEfQcRdpohkhuQSduHmYoHJncOTkdVHcmUnugwRAHKcBgjTTFkLAWYFxaHmevfEzOhCXgIWdExBLamvyDKySbJZmStGNmfGzsUxtZMLJpwdpCDtVXfhWVpeVHaHVfdPnyzLknYXmxpszxmWkweLBquQIHesUxBykaymJtcXEhxApvWKqoNKBZZlYscos','zaHnndSIEKsQssjcoTgPfdLqYwSFmHhCmnZWIQDiKwtApGwqKjbeCMUmpeXLpdQTaHLoBQFOdTaebwqZxGBCDKXSGXCbDkjcOBYvnnblisFxDhjgdwrMuvrlrVaUaJbxmZFHmPXGgTYYVeoJMrjSyrLDLqUsNWGjNXRPtSEMzVZfSwWDdnnvFaFgDpFWYBjRyLeIsoRyVmvvyRsrAFQkyTemzGbqFNrzpIDsvGwlUaztONpKRgtBwaPlbddTmpn',1,1,1951030447);
/*!40000 ALTER TABLE `resturant_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`),
  KEY `FK_ROLE_REST` (`RESTURANT_ID`),
  CONSTRAINT `FK_ROLE_REST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'htJxLOZhhJtvNjpjjIHUufLZXBctvvbZRLRYTAeKjuvJTlOCpUerXJqelQKseHILuQxmtLVvInDjnCmdSBNCyRsTIJaCBNAcJWxmXUosArQGiBtWAVQUXKALhrOvBOMTIzAHoKwMZyCdIhGQhcGjIqNEQAkRzPLtZBtJgvefYNHmMHjCgUFtQcHXUZecxkPiaMiZFKjvSAzFCgolMbfRYdqVoHFHtcvSXQPnPWhiWiWhrTzQOtuQSbOnVDuULjM','ojQCSTlJATHGZHtFndVEZRcUcpHMGYawbQlOQdiPQGxUCzTwPMPKuhkpWooAFiuKCVQbsZCruMYaOAGEOjVFGbKFdjpSufSoOuiAmGMdtEXxkliEVUwWyWjwxVxWqUCOaWCQKkmdTFqPFmHxgavFKDJneAICcFpMFZEHWKokvcTZOgaXDXeIEsIbnHzJOddRtamMVlKbGnjotFNDVvyrfykUOEeMLrwvIDueeAkTVlCtVsidsiZKYNUyHodnTry',1,940500771);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_service`
--

DROP TABLE IF EXISTS `role_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_service` (
  `ROLE_SERVICE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(20) NOT NULL,
  `SERVICE_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  PRIMARY KEY (`ROLE_SERVICE_ID`),
  UNIQUE KEY `UNQ_RLSER` (`ROLE_ID`,`SERVICE_ID`),
  KEY `FK_RS_SERV` (`SERVICE_ID`),
  CONSTRAINT `FK_RS_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`),
  CONSTRAINT `FK_RS_SERV` FOREIGN KEY (`SERVICE_ID`) REFERENCES `service` (`SERVICE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_service`
--

LOCK TABLES `role_service` WRITE;
/*!40000 ALTER TABLE `role_service` DISABLE KEYS */;
INSERT INTO `role_service` VALUES (1,1,1,881228617);
/*!40000 ALTER TABLE `role_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_holder`
--

DROP TABLE IF EXISTS `sequence_holder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_holder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` int(11) NOT NULL,
  `SEQ_NAME` varchar(45) NOT NULL,
  `NEXT_VAL` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `ENTITY_TYPE_UNIQUE` (`ENTITY_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_holder`
--

LOCK TABLES `sequence_holder` WRITE;
/*!40000 ALTER TABLE `sequence_holder` DISABLE KEYS */;
INSERT INTO `sequence_holder` VALUES (1,1,'ORDER_REFERENCE',9);
/*!40000 ALTER TABLE `sequence_holder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `SERVICE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SERVICE_ID`),
  KEY `FK_SER_REST` (`RESTURANT_ID`),
  CONSTRAINT `FK_SER_REST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'jPWBteYnQUUbHFyYcJUKYvDNHAjclzZhyKQXAklEIhgWflmbdF','iSdUJUWnLwsWarwtAOfoNuHtIZXZKFcokROulNjHOoauHfBpus','PZVvYeVBeiZnlPpczvgpjVhRkkOsDotshxzQwrdmbnKYnTrjKgseakIWiHEyADKFqBFKQNHyZKGkdTemwaxvuEeCVBlqQMUHEJwpUcmnPMSMaEGnuTyEEwFAklNNvsOjjFBiMCyZStSsvHkZezNiRspAslYnbzzdknBnlIxHgghndwmuSnZOivYMteNwyvwcHaVESSolBcmqoVeaGrfMMgQDKqkwaUVWVNvmlpVusiEYidVXrpvRbZCqNuATOQX',2128773228,1);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serving_table`
--

DROP TABLE IF EXISTS `serving_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serving_table` (
  `SERVING_TABLE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TABLE_REF_NUMBER` varchar(10) NOT NULL,
  `BRANCH_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  PRIMARY KEY (`SERVING_TABLE_ID`),
  KEY `FK_ST_BR` (`BRANCH_ID`),
  CONSTRAINT `FK_ST_BR` FOREIGN KEY (`BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serving_table`
--

LOCK TABLES `serving_table` WRITE;
/*!40000 ALTER TABLE `serving_table` DISABLE KEYS */;
INSERT INTO `serving_table` VALUES (1,'aWXuhsYsDaNOPFhnaMINkQEYUuRdsbKxhevmLzZvzriGtWxrMuKHtGUsVARXEMIuyLSJKpwDMbkzJovfPTTqNSqajRUNwIozlcZPDQdEgplCFysZHITUdMcGysrEcoPFHilCBaqcLlnZXMtRomypuSjuWthLvigryLnnOfeCETMKEEZbTFWGCgcufWmzOfkogityCLnEKJaKFJEBvHrzNqtcBlBCBKaFYNNmzkklhVjIhxwXnJMGytRKHcHplXv','rTXHDIjNOS',1,656570293);
/*!40000 ALTER TABLE `serving_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_deal`
--

DROP TABLE IF EXISTS `special_deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_deal` (
  `SPECIAL_DEAL_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `PRICE` decimal(5,3) NOT NULL,
  `IMAGE_URL` varchar(255) DEFAULT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  PRIMARY KEY (`SPECIAL_DEAL_ID`),
  KEY `FK_SD_REST` (`RESTURANT_ID`),
  CONSTRAINT `FK_SD_REST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_deal`
--

LOCK TABLES `special_deal` WRITE;
/*!40000 ALTER TABLE `special_deal` DISABLE KEYS */;
INSERT INTO `special_deal` VALUES (1,'2017-03-19','2017-03-18',3.100,'Image URL',1,1);
/*!40000 ALTER TABLE `special_deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_deal_item`
--

DROP TABLE IF EXISTS `special_deal_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_deal_item` (
  `MEAL_DEAL_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SPECIAL_DEAL_ID` bigint(20) NOT NULL,
  `ITEM_ID` bigint(20) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  PRIMARY KEY (`MEAL_DEAL_ITEM_ID`),
  KEY `FK_SDI_SD` (`SPECIAL_DEAL_ID`),
  KEY `FK_SDI_ITM` (`ITEM_ID`),
  CONSTRAINT `FK_SDI_ITM` FOREIGN KEY (`ITEM_ID`) REFERENCES `item` (`ITEM_ID`),
  CONSTRAINT `FK_SDI_SD` FOREIGN KEY (`SPECIAL_DEAL_ID`) REFERENCES `special_deal` (`SPECIAL_DEAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_deal_item`
--

LOCK TABLES `special_deal_item` WRITE;
/*!40000 ALTER TABLE `special_deal_item` DISABLE KEYS */;
INSERT INTO `special_deal_item` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `special_deal_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_deal_translation`
--

DROP TABLE IF EXISTS `special_deal_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_deal_translation` (
  `SPECIAL_DEAL_TRANSLATION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `SPECIAL_DEAL_ID` bigint(20) NOT NULL,
  `SHOW_DESCRIPTION` int(1) DEFAULT NULL,
  `OTHER_REMARKS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SPECIAL_DEAL_TRANSLATION_ID`),
  UNIQUE KEY `UNQ_SDT` (`SPECIAL_DEAL_ID`,`LANGUAGE_ID`),
  KEY `FK_SMT_LNG` (`LANGUAGE_ID`),
  CONSTRAINT `FK_SMT_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_languages` (`LANGUAGE_ID`),
  CONSTRAINT `FK_SMT_SPD` FOREIGN KEY (`SPECIAL_DEAL_ID`) REFERENCES `special_deal` (`SPECIAL_DEAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_deal_translation`
--

LOCK TABLES `special_deal_translation` WRITE;
/*!40000 ALTER TABLE `special_deal_translation` DISABLE KEYS */;
INSERT INTO `special_deal_translation` VALUES (1,'Eng Title','Eng Desc',1,1,1,'Remarks');
/*!40000 ALTER TABLE `special_deal_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spice_type`
--

DROP TABLE IF EXISTS `spice_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spice_type` (
  `SPICE_TYPE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IMAGE_URL` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` int(11) DEFAULT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`SPICE_TYPE_ID`),
  KEY `FK_SPT_RST` (`RESTURANT_ID`),
  CONSTRAINT `FK_SPT_RST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spice_type`
--

LOCK TABLES `spice_type` WRITE;
/*!40000 ALTER TABLE `spice_type` DISABLE KEYS */;
INSERT INTO `spice_type` VALUES (1,'spice type image',1,1);
/*!40000 ALTER TABLE `spice_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spice_type_translation`
--

DROP TABLE IF EXISTS `spice_type_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spice_type_translation` (
  `SPICE_TYPE_TRANS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SPICE_TYPE_ID` bigint(20) NOT NULL,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) NOT NULL,
  `SHOW_DESCRIPTION` int(11) DEFAULT NULL,
  PRIMARY KEY (`SPICE_TYPE_TRANS_ID`),
  UNIQUE KEY `UNQ_STT` (`LANGUAGE_ID`,`SPICE_TYPE_ID`),
  KEY `FK_SPT_SPI` (`SPICE_TYPE_ID`),
  CONSTRAINT `FK_SPT_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_languages` (`LANGUAGE_ID`),
  CONSTRAINT `FK_SPT_SPI` FOREIGN KEY (`SPICE_TYPE_ID`) REFERENCES `spice_type` (`SPICE_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spice_type_translation`
--

LOCK TABLES `spice_type_translation` WRITE;
/*!40000 ALTER TABLE `spice_type_translation` DISABLE KEYS */;
INSERT INTO `spice_type_translation` VALUES (1,1,1,'Eng Desc','Eng Title',1);
/*!40000 ALTER TABLE `spice_type_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `STAFF_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `STAFF_CODE` varchar(10) NOT NULL,
  `FIRST_NAME` varchar(255) NOT NULL,
  `MIDDLE_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) NOT NULL,
  `ADDRESS_ID` bigint(20) NOT NULL,
  `MOBILE_ID` bigint(20) DEFAULT NULL,
  `BRANCH_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  PRIMARY KEY (`STAFF_ID`),
  UNIQUE KEY `USER_ID` (`USER_ID`),
  UNIQUE KEY `STAFF_CODE` (`STAFF_CODE`),
  KEY `FK_STAFF_ADD` (`ADDRESS_ID`),
  KEY `FK_STAFF_BRN` (`BRANCH_ID`),
  CONSTRAINT `FK_STAFF_ADD` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `address` (`ADDRESS_ID`),
  CONSTRAINT `FK_STAFF_BRN` FOREIGN KEY (`BRANCH_ID`) REFERENCES `branch` (`BRANCH_ID`),
  CONSTRAINT `FK_STAFF_USER` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,1,'vEBYAgJJTI','rjcEoxQjqEhBNPcaVeZljzbUQMXhLtngKmLLcpoPQTgvvrgQlUgmkAqKWDwoQEvkCrJXtyYihAWmlKreRVOdzevXxjwPQyNDUDfDGQxzeIAAEKyXUkcXcxBzunjIdvpIGqIhRZlsYQBNYukDnddlzZgrxbiwbScLVAACqWrvORttMcfeBoOdqAbYJRculKbsWgDOSNbbqtHRhIzIsAfHWKUKhsWZMxMwEacYoCqivzToSbhjJKuMihUeaJgpQAD','YxtuVstSOWMJbIaqBeMSyFGhBhgWOUVjpZPLjKAQmPqMRoVrJxclgajsgjtecqQeagOjkYpzpVQZVOKSEBfbcZAPlfbmEgbrRWoYWJJpwefiZKHtEkEsDptYjaBFWDwPeAQyGhXyYBQunwsLyoVesHotgEslwTvDNOwBGEBsvbjFPlvJklbEmYAYcdwxHXHlUkUMASdPIurwWnTomeGzWMDNJYeIcOOVHblOWsHzHOPtZFyWTSQSqUquYZvSCAT','KpePPlIJKbnCswrdqvyCwWHUfUNOBtKaYzBrWlNHioXAZYfltYctuLcEUPmKusIbEOWndqkoqYIaeJlFyVridREgITrSVjwEfGQBmEgFCkImYitbhSTRAmFQyGXSHGsRdPyxsbYuKFXjtKrtvKWFKOkLxEhAPQUnPGzKpapYejyaEoLkFqpAmLelngdOWYZCtJyksMjdCreOJTmmukGwxFkfbDbQxVuYgMYivNQsfRUGQVwjdqNjvcvxNqhKVik',1,2081522486,1,1813216229);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_accounts`
--

DROP TABLE IF EXISTS `user_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_accounts` (
  `account_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `last_logged_in` datetime DEFAULT NULL,
  `date_expires` datetime DEFAULT NULL,
  `account_type` enum('user','admin') NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `password_recovery_question` varchar(100) DEFAULT NULL,
  `password_recovery_answer` varchar(100) DEFAULT NULL,
  `num_rows_generated` mediumint(9) DEFAULT '0',
  `max_records` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_accounts`
--

LOCK TABLES `user_accounts` WRITE;
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
INSERT INTO `user_accounts` VALUES (1,'2017-03-16 16:13:09','2017-03-16 16:13:09',NULL,'2017-03-16 16:13:09','admin','','','','',NULL,NULL,0,NULL),(2,'2017-03-18 00:00:00','2017-03-20 00:00:00','2017-03-18 00:00:00','2017-03-17 00:00:00','admin','KtMAudPBlxtejJKyuZWlAsbRjGsPnDQRnZvfSxOIwNmShFQNxM','mIAfrPXlNXOUkixSKoLzGYiWItZyGFwsMYwTJAIiomEIuxTogZ','FBjARkNHwjjewXtzKfHjTsLLOdgGLoKiQjWLdozPoHdMQjqBZtIunSXIxbgZmlDKTMtjiquyFLNHPAwoEZDXTsVPlKPoCmSZtDCF','WFodaCUeKYMkUqCpfUJXlkHxKOBQChAimDoxvlaORbgaXdEzen','GCERzUvZpGJnIWeOtYICMifxtdkpyxvmRYaUFbWETKaRflzQbuIEVMMLDSkszVBFwgLjLBvrHzbpMCjtenEAHrkRZzzTlOZpoZhi','ffinwEBjRIDKpwRgCYyHLuzJVnFJZhWSLDIdjLDtmwwmuyIgqVjDdQIlSynryUrruqueeTOjkaxNmvrsQeCtoFVWvmluskvONgJN',157511,288543);
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `USER_ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  PRIMARY KEY (`USER_ROLE_ID`),
  UNIQUE KEY `UNQ_USRROLE` (`USER_ID`,`ROLE_ID`),
  KEY `FK_USR_USER` (`ROLE_ID`),
  CONSTRAINT `FK_USR_ROL` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`),
  CONSTRAINT `FK_USR_USER` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1,1254168987);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `IS_LOCKED` int(1) DEFAULT '0',
  `IS_ACTIVE` int(1) DEFAULT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `USERNAME` (`USERNAME`),
  KEY `FK_USR_REST` (`RESTURANT_ID`),
  CONSTRAINT `FK_USR_REST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'SUypHeeBpOlupBIiiGxlNHtbzkmqrmCvPnhfHfcJCWPAReSbNxdNuwGiXmRHauDKeaGXPMuvoNqADducBMhkVJWVdzsuOKHLyzGvoEQflryBqXFZOgvJdVluazbCucncGEuVdKvyERnboswBGgOPDdSCEPMCWBcSRvlavYhQpfGDEQUqQbcuHPfbNtCZGcktriHYPMncLURcKhHhPqawuhkTDoJENCTsKTdLfqkjHrLjOJpCXaPtlqvtjPhonmF','csLXFOcQQtMrskdGzZjCmUCLKZIIZDCKbwhASQOMXtvZtcYDEwfKxPHBoNSUQTwgnjrmscKYvvCAjHEVlDonPZCqxWnklmulmwXZHLNYfbbkBApgHoOYeOBOpJQKywvZMkYBYNCszRaPcwaEOHSFrAqEpWfUYVsznXuhXGqMYlWfvhzdDbRSGWBBdOWjwxQXZIbVXHqoMvlwtRUnUKBWvvqEWBhHMJSoafIOoYIwUmenmoVXGQngTVoDmWxWOrp',416166842,371163310,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant`
--

DROP TABLE IF EXISTS `variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variant` (
  `VARIANT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `IMAGE_URL` varchar(255) NOT NULL,
  `RESTURANT_ID` bigint(20) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  PRIMARY KEY (`VARIANT_ID`),
  KEY `FK_VAR_REST` (`RESTURANT_ID`),
  CONSTRAINT `FK_VAR_REST` FOREIGN KEY (`RESTURANT_ID`) REFERENCES `resturant` (`RESTURANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant`
--

LOCK TABLES `variant` WRITE;
/*!40000 ALTER TABLE `variant` DISABLE KEYS */;
INSERT INTO `variant` VALUES (1,'Image URL',1,1);
/*!40000 ALTER TABLE `variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant_translation`
--

DROP TABLE IF EXISTS `variant_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variant_translation` (
  `VARIANT_TRANS_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LANGUAGE_ID` bigint(20) NOT NULL,
  `VARIANT_ID` bigint(20) NOT NULL,
  `TITLE` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `SHOW_DESCRIPTION` int(1) DEFAULT NULL,
  PRIMARY KEY (`VARIANT_TRANS_ID`),
  UNIQUE KEY `UNQ_VARTRA` (`VARIANT_ID`,`LANGUAGE_ID`),
  KEY `FK_VARTRA_LNG` (`LANGUAGE_ID`),
  CONSTRAINT `FK_VARTRA_LNG` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `ref_languages` (`LANGUAGE_ID`),
  CONSTRAINT `FK_VARTRA_VAR` FOREIGN KEY (`VARIANT_ID`) REFERENCES `variant` (`VARIANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant_translation`
--

LOCK TABLES `variant_translation` WRITE;
/*!40000 ALTER TABLE `variant_translation` DISABLE KEYS */;
INSERT INTO `variant_translation` VALUES (1,1,1,'Eng Title','Eng Description',1);
/*!40000 ALTER TABLE `variant_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vedio_source_type`
--

DROP TABLE IF EXISTS `vedio_source_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vedio_source_type` (
  `VEDIO_SOURCE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL,
  `IS_ACTIVE` int(1) DEFAULT NULL,
  PRIMARY KEY (`VEDIO_SOURCE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vedio_source_type`
--

LOCK TABLES `vedio_source_type` WRITE;
/*!40000 ALTER TABLE `vedio_source_type` DISABLE KEYS */;
INSERT INTO `vedio_source_type` VALUES (1,'GytwNGHbjGWStaRKTgugaSwMHFmasMokldzWgxoxLktzTVANrsaAoOBHPRymtZOROtSkYlqBssjOxCesVqmZVqEKoeJDCtFphIcJXIhPtAoltmxULorOpYsgVutDdlQjDkNBLkEmxGJCxhEXwigNkvFTIIlJwZAfvDhgKzOgjNIQLhDwhQHgtjgsbAibmJohfhoWSKnDwEMqmchGmxYHqRUbwBslwoeVJKlrSnmVbGWWsxBxHlBNFbjVELfzwSA','CVTlQnytGMKyjyKwTdeylHBoApoGvHFqQLCnDncmsKdkxNjJkgwZmiGBlhoHKFWsIwOyEQMjSDXYqlMWsaHrREpTsMrRygpMtzUuGjCnJjRrzwdrVExOusfWZCMdZTaHzpzAyTbNRSMMGwJmgFzevhDiYWRmULPXuUZPpQxhYHqhOdYVrXszuhEVdAidchUpkTmzXcLOQQDVTlWeiKuiTMepuvsnXMucYrNTKLRhXZHUOCZvIUVKkaIURTqNHGW',250149906);
/*!40000 ALTER TABLE `vedio_source_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'resturant'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-12 19:16:54

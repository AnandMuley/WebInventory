-- MySQL dump 10.13  Distrib 5.5.60, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: web_inventory
-- ------------------------------------------------------
-- Server version	5.5.60-0ubuntu0.14.04.1

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
-- Table structure for table `CATEGORIES`
--

DROP TABLE IF EXISTS `CATEGORIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORIES` (
  `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `IS_ACTIVE` tinyint(1) NOT NULL DEFAULT '1',
  `CATEGORY_DESCIRPTION` longtext COLLATE utf8_bin,
  `CATEGORY_NAME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `INSERTION_DATE` date DEFAULT NULL,
  `LAST_MODIFIED_DATE` date DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CATEGORIES`
--

LOCK TABLES `CATEGORIES` WRITE;
/*!40000 ALTER TABLE `CATEGORIES` DISABLE KEYS */;
INSERT INTO `CATEGORIES` VALUES (7,0,'सर्व फळे','फळे',0,'2018-07-18','2018-07-18',0),(8,0,'फुलं','फुलं',0,'2018-07-18','2018-07-18',0);
/*!40000 ALTER TABLE `CATEGORIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IS_ACTIVE` tinyint(1) NOT NULL DEFAULT '1',
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `CUSTOMER_NAME` varchar(255) DEFAULT NULL,
  `DEFAULTER` tinyint(1) NOT NULL DEFAULT '0',
  `INSERTION_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED_DATE` datetime DEFAULT NULL,
  `MOBILE_NO` varchar(255) DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GODOWN`
--

DROP TABLE IF EXISTS `GODOWN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GODOWN` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IS_ACTIVE` tinyint(1) NOT NULL DEFAULT '1',
  `CREATED_BY` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `INSERTION_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED_DATE` datetime DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GODOWN`
--

LOCK TABLES `GODOWN` WRITE;
/*!40000 ALTER TABLE `GODOWN` DISABLE KEYS */;
/*!40000 ALTER TABLE `GODOWN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GST`
--

DROP TABLE IF EXISTS `GST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GST` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IS_ACTIVE` tinyint(1) NOT NULL DEFAULT '1',
  `CREATED_BY` int(11) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `GST_PERCENT` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GST`
--

LOCK TABLES `GST` WRITE;
/*!40000 ALTER TABLE `GST` DISABLE KEYS */;
INSERT INTO `GST` VALUES (1,1,0,'2018-07-18 09:03:20',0),(2,1,0,'2018-07-18 16:23:05',10);
/*!40000 ALTER TABLE `GST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ITEM`
--

DROP TABLE IF EXISTS `ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ITEM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATED_BY` int(11) DEFAULT NULL,
  `EXPIRY_DATE` date DEFAULT NULL,
  `INSERTION_DATE` date DEFAULT NULL,
  `LAST_MODIFIED_DATE` date DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `PRODUCT_CODE` varchar(255) DEFAULT NULL,
  `PURCHASE_DATE` date DEFAULT NULL,
  `PURCHASE_RATE` double DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `UNIT` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK22731328C62352` (`PRODUCT_ID`),
  CONSTRAINT `FK22731328C62352` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ITEM`
--

LOCK TABLES `ITEM` WRITE;
/*!40000 ALTER TABLE `ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANUFACTURED`
--

DROP TABLE IF EXISTS `MANUFACTURED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MANUFACTURED` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATED_BY` int(11) DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `INSERTION_DATE` date DEFAULT NULL,
  `LAST_MODIFIED_DATE` date DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `WORK_STATUS` varchar(255) DEFAULT NULL,
  `GODOWN_ID` int(11) DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK14BD0BC3487A2282` (`GODOWN_ID`),
  KEY `FK14BD0BC328C62352` (`PRODUCT_ID`),
  CONSTRAINT `FK14BD0BC328C62352` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`),
  CONSTRAINT `FK14BD0BC3487A2282` FOREIGN KEY (`GODOWN_ID`) REFERENCES `GODOWN` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANUFACTURED`
--

LOCK TABLES `MANUFACTURED` WRITE;
/*!40000 ALTER TABLE `MANUFACTURED` DISABLE KEYS */;
/*!40000 ALTER TABLE `MANUFACTURED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAYMENT_DETAILS`
--

DROP TABLE IF EXISTS `PAYMENT_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAYMENT_DETAILS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AMOUNT` double DEFAULT NULL,
  `BANK_NAME` varchar(255) DEFAULT NULL,
  `BRANCH_NAME` varchar(255) DEFAULT NULL,
  `CHEQUE_TRANSACTION_NO` varchar(255) DEFAULT NULL,
  `PAYMENT_DATE` datetime DEFAULT NULL,
  `PAYMENT_MODE` varchar(255) DEFAULT NULL,
  `PURCHASE_PAYMENT_DETAILS_ID` int(11) DEFAULT NULL,
  `SALE_PAYMENT_DETAILS_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKF48A9CC9DF9FF194` (`SALE_PAYMENT_DETAILS_ID`),
  KEY `FKF48A9CC95F0FA1D4` (`PURCHASE_PAYMENT_DETAILS_ID`),
  CONSTRAINT `FKF48A9CC95F0FA1D4` FOREIGN KEY (`PURCHASE_PAYMENT_DETAILS_ID`) REFERENCES `PURCHASE_PAYMENT_DETAILS` (`ID`),
  CONSTRAINT `FKF48A9CC9DF9FF194` FOREIGN KEY (`SALE_PAYMENT_DETAILS_ID`) REFERENCES `SALE_PAYMENT_DETAILS` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAYMENT_DETAILS`
--

LOCK TABLES `PAYMENT_DETAILS` WRITE;
/*!40000 ALTER TABLE `PAYMENT_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PAYMENT_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVITY_STATUS` tinyint(1) NOT NULL DEFAULT '1',
  `CREATED_BY` int(11) DEFAULT NULL,
  `GST_PERC` double DEFAULT NULL,
  `INSERTION_DATE` date DEFAULT NULL,
  `LAST_MODIFIED_DATE` date DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `PRODUCT_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PRODUCT_DESCR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PRODUCT_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `SALE_RATE` double DEFAULT NULL,
  `UNIT_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_ID` int(11) DEFAULT NULL,
  `GODWAN_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK185958CF54EAE264` (`GODWAN_ID`),
  KEY `FK185958CF4A8C1ABF` (`CATEGORY_ID`),
  CONSTRAINT `FK185958CF4A8C1ABF` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `CATEGORIES` (`CATEGORY_ID`),
  CONSTRAINT `FK185958CF54EAE264` FOREIGN KEY (`GODWAN_ID`) REFERENCES `GODOWN` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` VALUES (4,1,0,0,NULL,NULL,0,NULL,'पाम','पाम',400,20,'युनिट',7,NULL);
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PURCHASE`
--

DROP TABLE IF EXISTS `PURCHASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PURCHASE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATED_BY` int(11) DEFAULT NULL,
  `DISCOUNT_PERC` double DEFAULT NULL,
  `DISCOUNT_RS` double DEFAULT NULL,
  `INSERTION_DATE` date DEFAULT NULL,
  `LAST_MODIFIED_DATE` date DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `PURCHASE_BILL_NO` int(11) DEFAULT NULL,
  `PURCHASE_ORDER_NO` int(11) DEFAULT NULL,
  `PURCHASE_DATE` date DEFAULT NULL,
  `TOTAL_AMOUNT` double DEFAULT NULL,
  `VENDOR_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK968EF501A6B6F795` (`VENDOR_ID`),
  CONSTRAINT `FK968EF501A6B6F795` FOREIGN KEY (`VENDOR_ID`) REFERENCES `VENDOR` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PURCHASE`
--

LOCK TABLES `PURCHASE` WRITE;
/*!40000 ALTER TABLE `PURCHASE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PURCHASE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PURCHASE_DETAILS`
--

DROP TABLE IF EXISTS `PURCHASE_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PURCHASE_DETAILS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_CODE` varchar(255) DEFAULT NULL,
  `PRODUCT_NAME` varchar(255) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `SALE_RATE` double DEFAULT NULL,
  `SERVICE_TAX` double DEFAULT NULL,
  `UNIT` varchar(255) DEFAULT NULL,
  `VAT_PERC` double DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `PURCHASE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK4F4288E4125DB922` (`PURCHASE_ID`),
  KEY `FK4F4288E428C62352` (`PRODUCT_ID`),
  CONSTRAINT `FK4F4288E4125DB922` FOREIGN KEY (`PURCHASE_ID`) REFERENCES `PURCHASE` (`ID`),
  CONSTRAINT `FK4F4288E428C62352` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PURCHASE_DETAILS`
--

LOCK TABLES `PURCHASE_DETAILS` WRITE;
/*!40000 ALTER TABLE `PURCHASE_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PURCHASE_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PURCHASE_PAYMENT_DETAILS`
--

DROP TABLE IF EXISTS `PURCHASE_PAYMENT_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PURCHASE_PAYMENT_DETAILS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATED_BY` int(11) DEFAULT NULL,
  `INSERTION_DATE` date DEFAULT NULL,
  `LAST_MODIFIED_DATE` date DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `PURCHASE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK465AC58B125DB922` (`PURCHASE_ID`),
  CONSTRAINT `FK465AC58B125DB922` FOREIGN KEY (`PURCHASE_ID`) REFERENCES `PURCHASE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PURCHASE_PAYMENT_DETAILS`
--

LOCK TABLES `PURCHASE_PAYMENT_DETAILS` WRITE;
/*!40000 ALTER TABLE `PURCHASE_PAYMENT_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PURCHASE_PAYMENT_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PURCHASE_TAX_DETAILS`
--

DROP TABLE IF EXISTS `PURCHASE_TAX_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PURCHASE_TAX_DETAILS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TAX_AMOUNT` double DEFAULT NULL,
  `TAX_NAME` varchar(255) DEFAULT NULL,
  `TAX_PERC` double DEFAULT NULL,
  `PURCHASE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK4DA18730125DB922` (`PURCHASE_ID`),
  CONSTRAINT `FK4DA18730125DB922` FOREIGN KEY (`PURCHASE_ID`) REFERENCES `PURCHASE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PURCHASE_TAX_DETAILS`
--

LOCK TABLES `PURCHASE_TAX_DETAILS` WRITE;
/*!40000 ALTER TABLE `PURCHASE_TAX_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PURCHASE_TAX_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALE`
--

DROP TABLE IF EXISTS `SALE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BALANCE_AMOUNT` double DEFAULT NULL,
  `BILL_DATE` datetime DEFAULT NULL,
  `BILL_NO` int(11) DEFAULT NULL,
  `DELIVERY_DATE` datetime DEFAULT NULL,
  `DISCOUNT_PERC` double DEFAULT NULL,
  `DISCOUNT_RS` double DEFAULT NULL,
  `NET_AMOUNT` double DEFAULT NULL,
  `PAID_AMOUNT` double DEFAULT NULL,
  `SALE_ORDER_NO` int(11) DEFAULT NULL,
  `TOTAL_AMOUNT` double DEFAULT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK26B8473F37F002` (`CUSTOMER_ID`),
  CONSTRAINT `FK26B8473F37F002` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALE`
--

LOCK TABLES `SALE` WRITE;
/*!40000 ALTER TABLE `SALE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SALE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALE_DETAILS`
--

DROP TABLE IF EXISTS `SALE_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALE_DETAILS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GST_PERC` double DEFAULT NULL,
  `GST_RS` double DEFAULT NULL,
  `QUANTITY` double DEFAULT NULL,
  `SALE_RATE` double DEFAULT NULL,
  `SERVICE_TAX` double DEFAULT NULL,
  `UNIT` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `SALE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKDD1DA62A28C62352` (`PRODUCT_ID`),
  KEY `FKDD1DA62A5CC26F62` (`SALE_ID`),
  CONSTRAINT `FKDD1DA62A28C62352` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`),
  CONSTRAINT `FKDD1DA62A5CC26F62` FOREIGN KEY (`SALE_ID`) REFERENCES `SALE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALE_DETAILS`
--

LOCK TABLES `SALE_DETAILS` WRITE;
/*!40000 ALTER TABLE `SALE_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SALE_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALE_ORDER`
--

DROP TABLE IF EXISTS `SALE_ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALE_ORDER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATED_BY` int(11) DEFAULT NULL,
  `DELIVERY_DATE` date DEFAULT NULL,
  `DISCOUNT_PERC` double DEFAULT NULL,
  `DISCOUNT_RS` double DEFAULT NULL,
  `INSERTION_DATE` date DEFAULT NULL,
  `LAST_MODIFIED_DATE` date DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `ORDER_DATE` date DEFAULT NULL,
  `ORDER_STATUS` varchar(255) DEFAULT NULL,
  `SALE_ORDER_NO` int(11) DEFAULT NULL,
  `TOTAL_AMOUNT` double DEFAULT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK98B319363F37F002` (`CUSTOMER_ID`),
  CONSTRAINT `FK98B319363F37F002` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALE_ORDER`
--

LOCK TABLES `SALE_ORDER` WRITE;
/*!40000 ALTER TABLE `SALE_ORDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `SALE_ORDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALE_ORDER_DETAILS`
--

DROP TABLE IF EXISTS `SALE_ORDER_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALE_ORDER_DETAILS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_CODE` varchar(255) DEFAULT NULL,
  `PRODUCT_NAME` varchar(255) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `SALE_RATE` double DEFAULT NULL,
  `SERVICE_TAX` double DEFAULT NULL,
  `UNIT` varchar(255) DEFAULT NULL,
  `VAT_PERC` double DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `SALE_ORDER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK3F2DA8199AB929E3` (`SALE_ORDER_ID`),
  KEY `FK3F2DA81928C62352` (`PRODUCT_ID`),
  CONSTRAINT `FK3F2DA81928C62352` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`),
  CONSTRAINT `FK3F2DA8199AB929E3` FOREIGN KEY (`SALE_ORDER_ID`) REFERENCES `SALE_ORDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALE_ORDER_DETAILS`
--

LOCK TABLES `SALE_ORDER_DETAILS` WRITE;
/*!40000 ALTER TABLE `SALE_ORDER_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SALE_ORDER_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALE_PAYMENT_DETAILS`
--

DROP TABLE IF EXISTS `SALE_PAYMENT_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALE_PAYMENT_DETAILS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATED_BY` int(11) DEFAULT NULL,
  `INSERTION_DATE` datetime DEFAULT NULL,
  `LAST_MODIFIED_DATE` datetime DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `SALE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK147F3CD15CC26F62` (`SALE_ID`),
  CONSTRAINT `FK147F3CD15CC26F62` FOREIGN KEY (`SALE_ID`) REFERENCES `SALE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALE_PAYMENT_DETAILS`
--

LOCK TABLES `SALE_PAYMENT_DETAILS` WRITE;
/*!40000 ALTER TABLE `SALE_PAYMENT_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SALE_PAYMENT_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALE_TAX_DETAILS`
--

DROP TABLE IF EXISTS `SALE_TAX_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALE_TAX_DETAILS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TAX_AMOUNT` double DEFAULT NULL,
  `TAX_NAME` varchar(255) DEFAULT NULL,
  `TAX_PERC` double DEFAULT NULL,
  `SALE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK128091765CC26F62` (`SALE_ID`),
  CONSTRAINT `FK128091765CC26F62` FOREIGN KEY (`SALE_ID`) REFERENCES `SALE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALE_TAX_DETAILS`
--

LOCK TABLES `SALE_TAX_DETAILS` WRITE;
/*!40000 ALTER TABLE `SALE_TAX_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SALE_TAX_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICE_TAX`
--

DROP TABLE IF EXISTS `SERVICE_TAX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVICE_TAX` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IS_ACTIVE` tinyint(1) NOT NULL DEFAULT '1',
  `CREATED_DATE` date DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `SERVICE_TAX_PERCENT` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICE_TAX`
--

LOCK TABLES `SERVICE_TAX` WRITE;
/*!40000 ALTER TABLE `SERVICE_TAX` DISABLE KEYS */;
/*!40000 ALTER TABLE `SERVICE_TAX` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STATE_CITY`
--

DROP TABLE IF EXISTS `STATE_CITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STATE_CITY` (
  `ID` int(11) NOT NULL,
  `CITY_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `STATE_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATE_CITY`
--

LOCK TABLES `STATE_CITY` WRITE;
/*!40000 ALTER TABLE `STATE_CITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `STATE_CITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UNIT`
--

DROP TABLE IF EXISTS `UNIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UNIT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IS_ACTIVE` tinyint(1) NOT NULL DEFAULT '1',
  `DESCRIPTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `UNIT_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UNIT`
--

LOCK TABLES `UNIT` WRITE;
/*!40000 ALTER TABLE `UNIT` DISABLE KEYS */;
INSERT INTO `UNIT` VALUES (1,0,'carate','carate'),(2,0,'unit','unit'),(3,1,'युनिट','युनिट');
/*!40000 ALTER TABLE `UNIT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `USER_ROLL` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK27E3CB394BC6BC` (`USER_ROLL`),
  CONSTRAINT `FK27E3CB394BC6BC` FOREIGN KEY (`USER_ROLL`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'admin','admin',1);
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_PERMISSION`
--

DROP TABLE IF EXISTS `USER_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_PERMISSION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `permission` varchar(255) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKFE866C31C802225` (`USER_ID`),
  CONSTRAINT `FKFE866C31C802225` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_PERMISSION`
--

LOCK TABLES `USER_PERMISSION` WRITE;
/*!40000 ALTER TABLE `USER_PERMISSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_PERMISSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENDOR`
--

DROP TABLE IF EXISTS `VENDOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VENDOR` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IS_ACTIVE` tinyint(1) NOT NULL DEFAULT '1',
  `ADDRESS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CITY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `EMAIL_ID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `INSERTION_DATE` datetime DEFAULT NULL,
  `LANDLINE_NO` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_MODIFIED_DATE` datetime DEFAULT NULL,
  `MOBILE_NO` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `PINCODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `STATE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIN_NO` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VENDOR_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENDOR`
--

LOCK TABLES `VENDOR` WRITE;
/*!40000 ALTER TABLE `VENDOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `VENDOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-25 22:22:21

-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Current Database: `chamilo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `chamilo` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `chamilo`;

--
-- Table structure for table `access_url`
--

DROP TABLE IF EXISTS `access_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `tms` datetime DEFAULT NULL,
  `url_type` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url`
--

LOCK TABLES `access_url` WRITE;
/*!40000 ALTER TABLE `access_url` DISABLE KEYS */;
INSERT INTO `access_url` VALUES (1,'http://localhost/',' ',1,1,'2020-05-21 15:43:33',NULL);
/*!40000 ALTER TABLE `access_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_url_rel_course`
--

DROP TABLE IF EXISTS `access_url_rel_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url_rel_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `access_url_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8E97FC0891D79BD3` (`c_id`),
  KEY `IDX_8E97FC0873444FD5` (`access_url_id`),
  CONSTRAINT `FK_8E97FC0873444FD5` FOREIGN KEY (`access_url_id`) REFERENCES `access_url` (`id`),
  CONSTRAINT `FK_8E97FC0891D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url_rel_course`
--

LOCK TABLES `access_url_rel_course` WRITE;
/*!40000 ALTER TABLE `access_url_rel_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_url_rel_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_url_rel_course_category`
--

DROP TABLE IF EXISTS `access_url_rel_course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url_rel_course_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_url_id` int(11) NOT NULL,
  `course_category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url_rel_course_category`
--

LOCK TABLES `access_url_rel_course_category` WRITE;
/*!40000 ALTER TABLE `access_url_rel_course_category` DISABLE KEYS */;
INSERT INTO `access_url_rel_course_category` VALUES (1,1,1),(2,1,2),(3,1,3);
/*!40000 ALTER TABLE `access_url_rel_course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_url_rel_session`
--

DROP TABLE IF EXISTS `access_url_rel_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url_rel_session` (
  `access_url_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`access_url_id`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url_rel_session`
--

LOCK TABLES `access_url_rel_session` WRITE;
/*!40000 ALTER TABLE `access_url_rel_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_url_rel_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_url_rel_user`
--

DROP TABLE IF EXISTS `access_url_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url_rel_user` (
  `access_url_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`access_url_id`,`user_id`),
  KEY `idx_access_url_rel_user_user` (`user_id`),
  KEY `idx_access_url_rel_user_access_url` (`access_url_id`),
  KEY `idx_access_url_rel_user_access_url_user` (`user_id`,`access_url_id`),
  CONSTRAINT `FK_8557426373444FD5` FOREIGN KEY (`access_url_id`) REFERENCES `access_url` (`id`),
  CONSTRAINT `FK_85574263A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url_rel_user`
--

LOCK TABLES `access_url_rel_user` WRITE;
/*!40000 ALTER TABLE `access_url_rel_user` DISABLE KEYS */;
INSERT INTO `access_url_rel_user` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `access_url_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_url_rel_usergroup`
--

DROP TABLE IF EXISTS `access_url_rel_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_url_rel_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_url_id` int(11) NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_url_rel_usergroup`
--

LOCK TABLES `access_url_rel_usergroup` WRITE;
/*!40000 ALTER TABLE `access_url_rel_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_url_rel_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_rel_group`
--

DROP TABLE IF EXISTS `announcement_rel_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_rel_group` (
  `group_id` int(11) NOT NULL,
  `announcement_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_rel_group`
--

LOCK TABLES `announcement_rel_group` WRITE;
/*!40000 ALTER TABLE `announcement_rel_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_rel_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_sync`
--

DROP TABLE IF EXISTS `branch_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_sync` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `access_url_id` int(11) NOT NULL,
  `unique_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `branch_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `branch_ip` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` decimal(10,0) DEFAULT NULL,
  `longitude` decimal(10,0) DEFAULT NULL,
  `dwn_speed` int(11) DEFAULT NULL,
  `up_speed` int(11) DEFAULT NULL,
  `delay` int(11) DEFAULT NULL,
  `admin_mail` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_phone` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sync_trans_id` bigint(20) DEFAULT NULL,
  `last_sync_trans_date` datetime DEFAULT NULL,
  `last_sync_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ssl_pub_key` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch_type` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `lvl` int(11) DEFAULT NULL,
  `root` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F62F45EDE3C68343` (`unique_id`),
  KEY `IDX_F62F45ED727ACA70` (`parent_id`),
  CONSTRAINT `FK_F62F45ED727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `branch_sync` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_sync`
--

LOCK TABLES `branch_sync` WRITE;
/*!40000 ALTER TABLE `branch_sync` DISABLE KEYS */;
INSERT INTO `branch_sync` VALUES (1,NULL,1,'70fa888dac98c2150f780d436834224fbac4cfe6','localhost',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a4dc9b52c9c96f07d152ff35db6b0a304f2d91b1',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `branch_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_transaction`
--

DROP TABLE IF EXISTS `branch_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `transaction_id` bigint(20) NOT NULL,
  `action` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dest_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_insert` datetime NOT NULL,
  `time_update` datetime NOT NULL,
  `failed_attempts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FEFBA12B6BF700BD` (`status_id`),
  KEY `IDX_FEFBA12BDCD6CC49` (`branch_id`),
  CONSTRAINT `FK_FEFBA12B6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `branch_transaction_status` (`id`),
  CONSTRAINT `FK_FEFBA12BDCD6CC49` FOREIGN KEY (`branch_id`) REFERENCES `branch_sync` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_transaction`
--

LOCK TABLES `branch_transaction` WRITE;
/*!40000 ALTER TABLE `branch_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_transaction_status`
--

DROP TABLE IF EXISTS `branch_transaction_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_transaction_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_transaction_status`
--

LOCK TABLES `branch_transaction_status` WRITE;
/*!40000 ALTER TABLE `branch_transaction_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_transaction_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_announcement`
--

DROP TABLE IF EXISTS `c_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_announcement` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `end_date` date DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `email_sent` tinyint(1) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_announcement`
--

LOCK TABLES `c_announcement` WRITE;
/*!40000 ALTER TABLE `c_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_announcement_attachment`
--

DROP TABLE IF EXISTS `c_announcement_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_announcement_attachment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `size` int(11) NOT NULL,
  `announcement_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_announcement_attachment`
--

LOCK TABLES `c_announcement_attachment` WRITE;
/*!40000 ALTER TABLE `c_announcement_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_announcement_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance`
--

DROP TABLE IF EXISTS `c_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `active` tinyint(1) NOT NULL,
  `attendance_qualify_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attendance_qualify_max` int(11) NOT NULL,
  `attendance_weight` double NOT NULL,
  `session_id` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance`
--

LOCK TABLES `c_attendance` WRITE;
/*!40000 ALTER TABLE `c_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance_calendar`
--

DROP TABLE IF EXISTS `c_attendance_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance_calendar` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `done_attendance` tinyint(1) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `attendance_id` (`attendance_id`),
  KEY `done_attendance` (`done_attendance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance_calendar`
--

LOCK TABLES `c_attendance_calendar` WRITE;
/*!40000 ALTER TABLE `c_attendance_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance_calendar_rel_group`
--

DROP TABLE IF EXISTS `c_attendance_calendar_rel_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance_calendar_rel_group` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `calendar_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance_calendar_rel_group`
--

LOCK TABLES `c_attendance_calendar_rel_group` WRITE;
/*!40000 ALTER TABLE `c_attendance_calendar_rel_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance_calendar_rel_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance_result`
--

DROP TABLE IF EXISTS `c_attendance_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance_result` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `attendance_id` (`attendance_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance_result`
--

LOCK TABLES `c_attendance_result` WRITE;
/*!40000 ALTER TABLE `c_attendance_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance_sheet`
--

DROP TABLE IF EXISTS `c_attendance_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance_sheet` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `presence` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `attendance_calendar_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`),
  KEY `presence` (`presence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance_sheet`
--

LOCK TABLES `c_attendance_sheet` WRITE;
/*!40000 ALTER TABLE `c_attendance_sheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_attendance_sheet_log`
--

DROP TABLE IF EXISTS `c_attendance_sheet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_attendance_sheet_log` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `lastedit_date` datetime NOT NULL,
  `lastedit_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `lastedit_user_id` int(11) NOT NULL,
  `calendar_date_value` datetime DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_attendance_sheet_log`
--

LOCK TABLES `c_attendance_sheet_log` WRITE;
/*!40000 ALTER TABLE `c_attendance_sheet_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_attendance_sheet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog`
--

DROP TABLE IF EXISTS `c_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `blog_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `blog_subtitle` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `visibility` tinyint(1) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog`
--

LOCK TABLES `c_blog` WRITE;
/*!40000 ALTER TABLE `c_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_attachment`
--

DROP TABLE IF EXISTS `c_blog_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_attachment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `size` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `blog_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_attachment`
--

LOCK TABLES `c_blog_attachment` WRITE;
/*!40000 ALTER TABLE `c_blog_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_comment`
--

DROP TABLE IF EXISTS `c_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_comment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_creation` datetime NOT NULL,
  `blog_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `parent_comment_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_comment`
--

LOCK TABLES `c_blog_comment` WRITE;
/*!40000 ALTER TABLE `c_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_post`
--

DROP TABLE IF EXISTS `c_blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_post` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `full_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date_creation` datetime NOT NULL,
  `author_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_post`
--

LOCK TABLES `c_blog_post` WRITE;
/*!40000 ALTER TABLE `c_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_rating`
--

DROP TABLE IF EXISTS `c_blog_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_rating` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `rating_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `rating_type` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_rating`
--

LOCK TABLES `c_blog_rating` WRITE;
/*!40000 ALTER TABLE `c_blog_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_rel_user`
--

DROP TABLE IF EXISTS `c_blog_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_rel_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_rel_user`
--

LOCK TABLES `c_blog_rel_user` WRITE;
/*!40000 ALTER TABLE `c_blog_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_task`
--

DROP TABLE IF EXISTS `c_blog_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_task` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `system_task` tinyint(1) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_task`
--

LOCK TABLES `c_blog_task` WRITE;
/*!40000 ALTER TABLE `c_blog_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_blog_task_rel_user`
--

DROP TABLE IF EXISTS `c_blog_task_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_blog_task_rel_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `target_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`),
  KEY `task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_blog_task_rel_user`
--

LOCK TABLES `c_blog_task_rel_user` WRITE;
/*!40000 ALTER TABLE `c_blog_task_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_blog_task_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_calendar_event`
--

DROP TABLE IF EXISTS `c_calendar_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_calendar_event` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `parent_event_id` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `all_day` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `color` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `IDX_A062258154177093` (`room_id`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `FK_A062258154177093` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_calendar_event`
--

LOCK TABLES `c_calendar_event` WRITE;
/*!40000 ALTER TABLE `c_calendar_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_calendar_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_calendar_event_attachment`
--

DROP TABLE IF EXISTS `c_calendar_event_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_calendar_event_attachment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `size` int(11) NOT NULL,
  `agenda_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_calendar_event_attachment`
--

LOCK TABLES `c_calendar_event_attachment` WRITE;
/*!40000 ALTER TABLE `c_calendar_event_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_calendar_event_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_calendar_event_repeat`
--

DROP TABLE IF EXISTS `c_calendar_event_repeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_calendar_event_repeat` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `cal_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `cal_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cal_end` int(11) DEFAULT NULL,
  `cal_frequency` int(11) DEFAULT NULL,
  `cal_days` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_calendar_event_repeat`
--

LOCK TABLES `c_calendar_event_repeat` WRITE;
/*!40000 ALTER TABLE `c_calendar_event_repeat` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_calendar_event_repeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_calendar_event_repeat_not`
--

DROP TABLE IF EXISTS `c_calendar_event_repeat_not`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_calendar_event_repeat_not` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cal_id` int(11) NOT NULL,
  `cal_date` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_calendar_event_repeat_not`
--

LOCK TABLES `c_calendar_event_repeat_not` WRITE;
/*!40000 ALTER TABLE `c_calendar_event_repeat_not` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_calendar_event_repeat_not` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_chat_connected`
--

DROP TABLE IF EXISTS `c_chat_connected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_chat_connected` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `to_group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_connection` datetime NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`),
  KEY `char_connected_index` (`user_id`,`session_id`,`to_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_chat_connected`
--

LOCK TABLES `c_chat_connected` WRITE;
/*!40000 ALTER TABLE `c_chat_connected` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_chat_connected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_course_description`
--

DROP TABLE IF EXISTS `c_course_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_course_description` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `session_id` int(11) DEFAULT NULL,
  `description_type` int(11) NOT NULL,
  `progress` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_course_description`
--

LOCK TABLES `c_course_description` WRITE;
/*!40000 ALTER TABLE `c_course_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_course_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_course_setting`
--

DROP TABLE IF EXISTS `c_course_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_course_setting` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `variable` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subkey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subkeytext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_course_setting`
--

LOCK TABLES `c_course_setting` WRITE;
/*!40000 ALTER TABLE `c_course_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_course_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_document`
--

DROP TABLE IF EXISTS `c_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_document` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filetype` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `readonly` tinyint(1) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_document`
--

LOCK TABLES `c_document` WRITE;
/*!40000 ALTER TABLE `c_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_dropbox_category`
--

DROP TABLE IF EXISTS `c_dropbox_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_dropbox_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `cat_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `received` tinyint(1) NOT NULL,
  `sent` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_dropbox_category`
--

LOCK TABLES `c_dropbox_category` WRITE;
/*!40000 ALTER TABLE `c_dropbox_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_dropbox_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_dropbox_feedback`
--

DROP TABLE IF EXISTS `c_dropbox_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_dropbox_feedback` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `feedback_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `author_user_id` int(11) NOT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedback_date` datetime NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `file_id` (`file_id`),
  KEY `author_user_id` (`author_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_dropbox_feedback`
--

LOCK TABLES `c_dropbox_feedback` WRITE;
/*!40000 ALTER TABLE `c_dropbox_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_dropbox_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_dropbox_file`
--

DROP TABLE IF EXISTS `c_dropbox_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_dropbox_file` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `filename` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `filesize` int(11) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_date` datetime NOT NULL,
  `last_upload_date` datetime NOT NULL,
  `cat_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  UNIQUE KEY `UN_filename` (`filename`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_dropbox_file`
--

LOCK TABLES `c_dropbox_file` WRITE;
/*!40000 ALTER TABLE `c_dropbox_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_dropbox_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_dropbox_person`
--

DROP TABLE IF EXISTS `c_dropbox_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_dropbox_person` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_dropbox_person`
--

LOCK TABLES `c_dropbox_person` WRITE;
/*!40000 ALTER TABLE `c_dropbox_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_dropbox_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_dropbox_post`
--

DROP TABLE IF EXISTS `c_dropbox_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_dropbox_post` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_date` datetime NOT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci,
  `cat_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `dest_user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `dest_user` (`dest_user_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_dropbox_post`
--

LOCK TABLES `c_dropbox_post` WRITE;
/*!40000 ALTER TABLE `c_dropbox_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_dropbox_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_attachment`
--

DROP TABLE IF EXISTS `c_forum_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_attachment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `size` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_attachment`
--

LOCK TABLES `c_forum_attachment` WRITE;
/*!40000 ALTER TABLE `c_forum_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_category`
--

DROP TABLE IF EXISTS `c_forum_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `cat_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cat_comment` longtext COLLATE utf8_unicode_ci,
  `cat_order` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_category`
--

LOCK TABLES `c_forum_category` WRITE;
/*!40000 ALTER TABLE `c_forum_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_forum`
--

DROP TABLE IF EXISTS `c_forum_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_forum` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `forum_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `forum_comment` longtext COLLATE utf8_unicode_ci,
  `forum_threads` int(11) DEFAULT NULL,
  `forum_posts` int(11) DEFAULT NULL,
  `forum_last_post` int(11) DEFAULT NULL,
  `forum_category` int(11) DEFAULT NULL,
  `allow_anonymous` int(11) DEFAULT NULL,
  `allow_edit` int(11) DEFAULT NULL,
  `approval_direct_post` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_attachments` int(11) DEFAULT NULL,
  `allow_new_threads` int(11) DEFAULT NULL,
  `default_view` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_of_group` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_group_public_private` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_order` int(11) DEFAULT NULL,
  `locked` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `forum_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `lp_id` int(10) unsigned NOT NULL,
  `moderated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_forum`
--

LOCK TABLES `c_forum_forum` WRITE;
/*!40000 ALTER TABLE `c_forum_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_mailcue`
--

DROP TABLE IF EXISTS `c_forum_mailcue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_mailcue` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `thread` (`thread_id`),
  KEY `user` (`user_id`),
  KEY `post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_mailcue`
--

LOCK TABLES `c_forum_mailcue` WRITE;
/*!40000 ALTER TABLE `c_forum_mailcue` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_mailcue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_notification`
--

DROP TABLE IF EXISTS `c_forum_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_notification` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `forum_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `thread` (`thread_id`),
  KEY `post` (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_notification`
--

LOCK TABLES `c_forum_notification` WRITE;
/*!40000 ALTER TABLE `c_forum_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_post`
--

DROP TABLE IF EXISTS `c_forum_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_post` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `post_title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_text` longtext COLLATE utf8_unicode_ci,
  `thread_id` int(11) DEFAULT NULL,
  `forum_id` int(11) DEFAULT NULL,
  `poster_id` int(11) DEFAULT NULL,
  `poster_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `post_notification` tinyint(1) DEFAULT NULL,
  `post_parent_id` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `poster_id` (`poster_id`),
  KEY `forum_id` (`forum_id`),
  KEY `idx_forum_post_thread_id` (`thread_id`),
  KEY `idx_forum_post_visible` (`visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_post`
--

LOCK TABLES `c_forum_post` WRITE;
/*!40000 ALTER TABLE `c_forum_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_thread`
--

DROP TABLE IF EXISTS `c_forum_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_thread` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `thread_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forum_id` int(11) DEFAULT NULL,
  `thread_replies` int(10) unsigned NOT NULL DEFAULT '0',
  `thread_poster_id` int(11) DEFAULT NULL,
  `thread_poster_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thread_views` int(10) unsigned NOT NULL DEFAULT '0',
  `thread_last_post` int(11) DEFAULT NULL,
  `thread_date` datetime DEFAULT NULL,
  `thread_sticky` tinyint(1) DEFAULT NULL,
  `locked` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `thread_title_qualify` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thread_qualify_max` double NOT NULL,
  `thread_close_date` datetime DEFAULT NULL,
  `thread_weight` double NOT NULL,
  `thread_peer_qualify` tinyint(1) NOT NULL,
  `lp_item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `idx_forum_thread_forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_thread`
--

LOCK TABLES `c_forum_thread` WRITE;
/*!40000 ALTER TABLE `c_forum_thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_thread_qualify`
--

DROP TABLE IF EXISTS `c_forum_thread_qualify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_thread_qualify` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `qualify` double NOT NULL,
  `qualify_user_id` int(11) DEFAULT NULL,
  `qualify_time` datetime DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user_id` (`user_id`,`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_thread_qualify`
--

LOCK TABLES `c_forum_thread_qualify` WRITE;
/*!40000 ALTER TABLE `c_forum_thread_qualify` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_thread_qualify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_forum_thread_qualify_log`
--

DROP TABLE IF EXISTS `c_forum_thread_qualify_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_forum_thread_qualify_log` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `qualify` double NOT NULL,
  `qualify_user_id` int(11) DEFAULT NULL,
  `qualify_time` datetime DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user_id` (`user_id`,`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_forum_thread_qualify_log`
--

LOCK TABLES `c_forum_thread_qualify_log` WRITE;
/*!40000 ALTER TABLE `c_forum_thread_qualify_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_forum_thread_qualify_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_glossary`
--

DROP TABLE IF EXISTS `c_glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_glossary` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `glossary_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `display_order` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_glossary`
--

LOCK TABLES `c_glossary` WRITE;
/*!40000 ALTER TABLE `c_glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_group_category`
--

DROP TABLE IF EXISTS `c_group_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_group_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `doc_state` tinyint(1) NOT NULL,
  `calendar_state` tinyint(1) NOT NULL,
  `work_state` tinyint(1) NOT NULL,
  `announcements_state` tinyint(1) NOT NULL,
  `forum_state` tinyint(1) NOT NULL,
  `wiki_state` tinyint(1) NOT NULL,
  `chat_state` tinyint(1) NOT NULL,
  `max_student` int(11) NOT NULL,
  `self_reg_allowed` tinyint(1) NOT NULL,
  `self_unreg_allowed` tinyint(1) NOT NULL,
  `groups_per_user` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_group_category`
--

LOCK TABLES `c_group_category` WRITE;
/*!40000 ALTER TABLE `c_group_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_group_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_group_info`
--

DROP TABLE IF EXISTS `c_group_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_group_info` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `max_student` int(11) NOT NULL,
  `doc_state` tinyint(1) NOT NULL,
  `calendar_state` tinyint(1) NOT NULL,
  `work_state` tinyint(1) NOT NULL,
  `announcements_state` tinyint(1) NOT NULL,
  `forum_state` tinyint(1) NOT NULL,
  `wiki_state` tinyint(1) NOT NULL,
  `chat_state` tinyint(1) NOT NULL,
  `secret_directory` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `self_registration_allowed` tinyint(1) NOT NULL,
  `self_unregistration_allowed` tinyint(1) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_group_info`
--

LOCK TABLES `c_group_info` WRITE;
/*!40000 ALTER TABLE `c_group_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_group_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_group_rel_tutor`
--

DROP TABLE IF EXISTS `c_group_rel_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_group_rel_tutor` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_group_rel_tutor`
--

LOCK TABLES `c_group_rel_tutor` WRITE;
/*!40000 ALTER TABLE `c_group_rel_tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_group_rel_tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_group_rel_user`
--

DROP TABLE IF EXISTS `c_group_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_group_rel_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_group_rel_user`
--

LOCK TABLES `c_group_rel_user` WRITE;
/*!40000 ALTER TABLE `c_group_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_group_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_item_property`
--

DROP TABLE IF EXISTS `c_item_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_item_property` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `to_group_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `insert_user_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `tool` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `insert_date` datetime NOT NULL,
  `lastedit_date` datetime NOT NULL,
  `ref` int(11) NOT NULL,
  `lastedit_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lastedit_user_id` int(11) NOT NULL,
  `visibility` int(11) NOT NULL,
  `start_visible` datetime DEFAULT NULL,
  `end_visible` datetime DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `IDX_1D84C18191D79BD3` (`c_id`),
  KEY `IDX_1D84C181330D47E9` (`to_group_id`),
  KEY `IDX_1D84C18129F6EE60` (`to_user_id`),
  KEY `IDX_1D84C1819C859CC3` (`insert_user_id`),
  KEY `IDX_1D84C181613FECDF` (`session_id`),
  KEY `idx_item_property_toolref` (`tool`,`ref`),
  CONSTRAINT `FK_1D84C18129F6EE60` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_1D84C181330D47E9` FOREIGN KEY (`to_group_id`) REFERENCES `c_group_info` (`iid`),
  CONSTRAINT `FK_1D84C181613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_1D84C18191D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_1D84C1819C859CC3` FOREIGN KEY (`insert_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_item_property`
--

LOCK TABLES `c_item_property` WRITE;
/*!40000 ALTER TABLE `c_item_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_item_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_link`
--

DROP TABLE IF EXISTS `c_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_link` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `category_id` int(11) DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `on_homepage` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_link`
--

LOCK TABLES `c_link` WRITE;
/*!40000 ALTER TABLE `c_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_link_category`
--

DROP TABLE IF EXISTS `c_link_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_link_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `category_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `display_order` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_link_category`
--

LOCK TABLES `c_link_category` WRITE;
/*!40000 ALTER TABLE `c_link_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_link_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp`
--

DROP TABLE IF EXISTS `c_lp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `lp_type` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ref` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `path` longtext COLLATE utf8_unicode_ci NOT NULL,
  `force_commit` tinyint(1) NOT NULL,
  `default_view_mod` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'embedded',
  `default_encoding` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UTF-8',
  `display_order` int(11) NOT NULL DEFAULT '0',
  `content_maker` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_local` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `content_license` longtext COLLATE utf8_unicode_ci NOT NULL,
  `prevent_reinit` tinyint(1) NOT NULL DEFAULT '1',
  `js_lib` longtext COLLATE utf8_unicode_ci NOT NULL,
  `debug` tinyint(1) NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preview_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) NOT NULL,
  `prerequisite` int(11) NOT NULL,
  `hide_toc_frame` tinyint(1) NOT NULL,
  `seriousgame_mode` tinyint(1) NOT NULL,
  `use_max_score` int(11) NOT NULL DEFAULT '1',
  `autolaunch` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `max_attempts` int(11) NOT NULL,
  `subscribe_users` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `publicated_on` datetime DEFAULT NULL,
  `expired_on` datetime DEFAULT NULL,
  `accumulate_scorm_time` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp`
--

LOCK TABLES `c_lp` WRITE;
/*!40000 ALTER TABLE `c_lp` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_category`
--

DROP TABLE IF EXISTS `c_lp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_category`
--

LOCK TABLES `c_lp_category` WRITE;
/*!40000 ALTER TABLE `c_lp_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_category_user`
--

DROP TABLE IF EXISTS `c_lp_category_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_category_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_61F042712469DE2` (`category_id`),
  KEY `IDX_61F0427A76ED395` (`user_id`),
  CONSTRAINT `FK_61F042712469DE2` FOREIGN KEY (`category_id`) REFERENCES `c_lp_category` (`iid`),
  CONSTRAINT `FK_61F0427A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_category_user`
--

LOCK TABLES `c_lp_category_user` WRITE;
/*!40000 ALTER TABLE `c_lp_category_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_category_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_item`
--

DROP TABLE IF EXISTS `c_lp_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_item` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `lp_id` int(11) NOT NULL,
  `item_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ref` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(511) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(511) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` longtext COLLATE utf8_unicode_ci NOT NULL,
  `min_score` double NOT NULL,
  `max_score` double DEFAULT '100',
  `mastery_score` double DEFAULT NULL,
  `parent_item_id` int(11) NOT NULL,
  `previous_item_id` int(11) NOT NULL,
  `next_item_id` int(11) NOT NULL,
  `display_order` int(11) NOT NULL,
  `prerequisite` longtext COLLATE utf8_unicode_ci,
  `parameters` longtext COLLATE utf8_unicode_ci,
  `launch_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `max_time_allowed` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `terms` longtext COLLATE utf8_unicode_ci,
  `search_did` int(11) DEFAULT NULL,
  `audio` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prerequisite_min_score` double DEFAULT NULL,
  `prerequisite_max_score` double DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `lp_id` (`lp_id`),
  KEY `idx_c_lp_item_cid_lp_id` (`c_id`,`lp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_item`
--

LOCK TABLES `c_lp_item` WRITE;
/*!40000 ALTER TABLE `c_lp_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_item_view`
--

DROP TABLE IF EXISTS `c_lp_item_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_item_view` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `lp_item_id` int(11) NOT NULL,
  `lp_view_id` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `total_time` int(11) NOT NULL,
  `score` double NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'not attempted',
  `suspend_data` longtext COLLATE utf8_unicode_ci,
  `lesson_location` longtext COLLATE utf8_unicode_ci,
  `core_exit` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `max_score` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `lp_item_id` (`lp_item_id`),
  KEY `lp_view_id` (`lp_view_id`),
  KEY `idx_c_lp_item_view_cid_lp_view_id_lp_item_id` (`c_id`,`lp_view_id`,`lp_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_item_view`
--

LOCK TABLES `c_lp_item_view` WRITE;
/*!40000 ALTER TABLE `c_lp_item_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_item_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_iv_interaction`
--

DROP TABLE IF EXISTS `c_lp_iv_interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_iv_interaction` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `lp_iv_id` bigint(20) NOT NULL,
  `interaction_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `interaction_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `weighting` double NOT NULL,
  `completion_time` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `correct_responses` longtext COLLATE utf8_unicode_ci NOT NULL,
  `student_response` longtext COLLATE utf8_unicode_ci NOT NULL,
  `result` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latency` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `lp_iv_id` (`lp_iv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_iv_interaction`
--

LOCK TABLES `c_lp_iv_interaction` WRITE;
/*!40000 ALTER TABLE `c_lp_iv_interaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_iv_interaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_iv_objective`
--

DROP TABLE IF EXISTS `c_lp_iv_objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_iv_objective` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `lp_iv_id` bigint(20) NOT NULL,
  `order_id` int(11) NOT NULL,
  `objective_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `score_raw` double NOT NULL,
  `score_max` double NOT NULL,
  `score_min` double NOT NULL,
  `status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `lp_iv_id` (`lp_iv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_iv_objective`
--

LOCK TABLES `c_lp_iv_objective` WRITE;
/*!40000 ALTER TABLE `c_lp_iv_objective` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_iv_objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_lp_view`
--

DROP TABLE IF EXISTS `c_lp_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_lp_view` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `lp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `last_item` int(11) NOT NULL,
  `progress` int(11) DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `lp_id` (`lp_id`),
  KEY `user_id` (`user_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_lp_view`
--

LOCK TABLES `c_lp_view` WRITE;
/*!40000 ALTER TABLE `c_lp_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_lp_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_notebook`
--

DROP TABLE IF EXISTS `c_notebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_notebook` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `notebook_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_notebook`
--

LOCK TABLES `c_notebook` WRITE;
/*!40000 ALTER TABLE `c_notebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_notebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_online_connected`
--

DROP TABLE IF EXISTS `c_online_connected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_online_connected` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `last_connection` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_online_connected`
--

LOCK TABLES `c_online_connected` WRITE;
/*!40000 ALTER TABLE `c_online_connected` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_online_connected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_online_link`
--

DROP TABLE IF EXISTS `c_online_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_online_link` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_online_link`
--

LOCK TABLES `c_online_link` WRITE;
/*!40000 ALTER TABLE `c_online_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_online_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_permission_group`
--

DROP TABLE IF EXISTS `c_permission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_permission_group` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `group_id` int(11) NOT NULL,
  `tool` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_permission_group`
--

LOCK TABLES `c_permission_group` WRITE;
/*!40000 ALTER TABLE `c_permission_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_permission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_permission_task`
--

DROP TABLE IF EXISTS `c_permission_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_permission_task` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `task_id` int(11) NOT NULL,
  `tool` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_permission_task`
--

LOCK TABLES `c_permission_task` WRITE;
/*!40000 ALTER TABLE `c_permission_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_permission_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_permission_user`
--

DROP TABLE IF EXISTS `c_permission_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_permission_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `tool` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_permission_user`
--

LOCK TABLES `c_permission_user` WRITE;
/*!40000 ALTER TABLE `c_permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_permission_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz`
--

DROP TABLE IF EXISTS `c_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `sound` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `random` int(11) NOT NULL,
  `random_answers` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `results_disabled` int(11) NOT NULL,
  `access_condition` longtext COLLATE utf8_unicode_ci,
  `max_attempt` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `feedback_type` int(11) NOT NULL,
  `expired_time` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `propagate_neg` int(11) NOT NULL,
  `save_correct_answers` tinyint(1) NOT NULL,
  `review_answers` int(11) NOT NULL,
  `random_by_category` int(11) NOT NULL,
  `text_when_finished` longtext COLLATE utf8_unicode_ci,
  `display_category_name` int(11) NOT NULL,
  `pass_percentage` int(11) DEFAULT NULL,
  `question_selection_type` int(11) DEFAULT NULL,
  `hide_question_title` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz`
--

LOCK TABLES `c_quiz` WRITE;
/*!40000 ALTER TABLE `c_quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_answer`
--

DROP TABLE IF EXISTS `c_quiz_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_answer` (
  `iid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_auto` int(10) unsigned NOT NULL,
  `c_id` int(10) unsigned NOT NULL,
  `id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correct` int(11) DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `ponderation` double NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  `hotspot_coordinates` longtext COLLATE utf8_unicode_ci,
  `hotspot_type` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destination` longtext COLLATE utf8_unicode_ci,
  `answer_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `c_id` (`c_id`),
  KEY `idx_cqa_q` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_answer`
--

LOCK TABLES `c_quiz_answer` WRITE;
/*!40000 ALTER TABLE `c_quiz_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_question`
--

DROP TABLE IF EXISTS `c_quiz_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_question` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `question` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `ponderation` double NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `picture` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL,
  `extra` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_question`
--

LOCK TABLES `c_quiz_question` WRITE;
/*!40000 ALTER TABLE `c_quiz_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_question_category`
--

DROP TABLE IF EXISTS `c_quiz_question_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_question_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_question_category`
--

LOCK TABLES `c_quiz_question_category` WRITE;
/*!40000 ALTER TABLE `c_quiz_question_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_question_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_question_option`
--

DROP TABLE IF EXISTS `c_quiz_question_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_question_option` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_question_option`
--

LOCK TABLES `c_quiz_question_option` WRITE;
/*!40000 ALTER TABLE `c_quiz_question_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_question_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_question_rel_category`
--

DROP TABLE IF EXISTS `c_quiz_question_rel_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_question_rel_category` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `idx_qqrc_qid` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_question_rel_category`
--

LOCK TABLES `c_quiz_question_rel_category` WRITE;
/*!40000 ALTER TABLE `c_quiz_question_rel_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_question_rel_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_rel_category`
--

DROP TABLE IF EXISTS `c_quiz_rel_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_rel_category` (
  `iid` bigint(20) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `exercise_id` int(11) NOT NULL,
  `count_questions` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_rel_category`
--

LOCK TABLES `c_quiz_rel_category` WRITE;
/*!40000 ALTER TABLE `c_quiz_rel_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_rel_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_quiz_rel_question`
--

DROP TABLE IF EXISTS `c_quiz_rel_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_quiz_rel_question` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `question_order` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `exercice_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `question` (`question_id`),
  KEY `exercise` (`exercice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_quiz_rel_question`
--

LOCK TABLES `c_quiz_rel_question` WRITE;
/*!40000 ALTER TABLE `c_quiz_rel_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_quiz_rel_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_resource`
--

DROP TABLE IF EXISTS `c_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_resource` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `source_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `resource_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_resource`
--

LOCK TABLES `c_resource` WRITE;
/*!40000 ALTER TABLE `c_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_role`
--

DROP TABLE IF EXISTS `c_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_role` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `role_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role_comment` longtext COLLATE utf8_unicode_ci,
  `default_role` tinyint(1) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_role`
--

LOCK TABLES `c_role` WRITE;
/*!40000 ALTER TABLE `c_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_role_group`
--

DROP TABLE IF EXISTS `c_role_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_role_group` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `scope` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_role_group`
--

LOCK TABLES `c_role_group` WRITE;
/*!40000 ALTER TABLE `c_role_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_role_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_role_permissions`
--

DROP TABLE IF EXISTS `c_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_role_permissions` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `default_perm` tinyint(1) NOT NULL,
  `role_id` int(11) NOT NULL,
  `tool` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_role_permissions`
--

LOCK TABLES `c_role_permissions` WRITE;
/*!40000 ALTER TABLE `c_role_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_role_user`
--

DROP TABLE IF EXISTS `c_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_role_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `scope` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_role_user`
--

LOCK TABLES `c_role_user` WRITE;
/*!40000 ALTER TABLE `c_role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_student_publication`
--

DROP TABLE IF EXISTS `c_student_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_student_publication` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_correction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_correction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `post_group_id` int(11) NOT NULL,
  `sent_date` datetime DEFAULT NULL,
  `filetype` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `has_properties` int(11) NOT NULL,
  `view_properties` tinyint(1) DEFAULT NULL,
  `qualification` double NOT NULL,
  `date_of_qualification` datetime DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `qualificator_id` int(11) NOT NULL,
  `weight` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `allow_text_assignment` int(11) NOT NULL,
  `contains_file` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`),
  KEY `idx_csp_u` (`user_id`),
  CONSTRAINT `FK_5246F746613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_student_publication`
--

LOCK TABLES `c_student_publication` WRITE;
/*!40000 ALTER TABLE `c_student_publication` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_student_publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_student_publication_assignment`
--

DROP TABLE IF EXISTS `c_student_publication_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_student_publication_assignment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `expires_on` datetime DEFAULT NULL,
  `ends_on` datetime DEFAULT NULL,
  `add_to_calendar` int(11) NOT NULL,
  `enable_qualification` tinyint(1) NOT NULL,
  `publication_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_student_publication_assignment`
--

LOCK TABLES `c_student_publication_assignment` WRITE;
/*!40000 ALTER TABLE `c_student_publication_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_student_publication_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_student_publication_comment`
--

DROP TABLE IF EXISTS `c_student_publication_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_student_publication_comment` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `work_id` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `sent_at` datetime NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`),
  KEY `work` (`work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_student_publication_comment`
--

LOCK TABLES `c_student_publication_comment` WRITE;
/*!40000 ALTER TABLE `c_student_publication_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_student_publication_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_student_publication_rel_document`
--

DROP TABLE IF EXISTS `c_student_publication_rel_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_student_publication_rel_document` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `work_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `work` (`work_id`),
  KEY `document` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_student_publication_rel_document`
--

LOCK TABLES `c_student_publication_rel_document` WRITE;
/*!40000 ALTER TABLE `c_student_publication_rel_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_student_publication_rel_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_student_publication_rel_user`
--

DROP TABLE IF EXISTS `c_student_publication_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_student_publication_rel_user` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `work_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `work` (`work_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_student_publication_rel_user`
--

LOCK TABLES `c_student_publication_rel_user` WRITE;
/*!40000 ALTER TABLE `c_student_publication_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_student_publication_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey`
--

DROP TABLE IF EXISTS `c_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `subtitle` longtext COLLATE utf8_unicode_ci,
  `author` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avail_from` date DEFAULT NULL,
  `avail_till` date DEFAULT NULL,
  `is_shared` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `surveythanks` longtext COLLATE utf8_unicode_ci,
  `creation_date` datetime NOT NULL,
  `invited` int(11) NOT NULL,
  `answered` int(11) NOT NULL,
  `invite_mail` longtext COLLATE utf8_unicode_ci NOT NULL,
  `reminder_mail` longtext COLLATE utf8_unicode_ci NOT NULL,
  `mail_subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `anonymous` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `access_condition` longtext COLLATE utf8_unicode_ci,
  `shuffle` tinyint(1) NOT NULL,
  `one_question_per_page` tinyint(1) NOT NULL,
  `survey_version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `survey_type` int(11) NOT NULL,
  `show_form_profile` int(11) NOT NULL,
  `form_fields` longtext COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) NOT NULL,
  `visible_results` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey`
--

LOCK TABLES `c_survey` WRITE;
/*!40000 ALTER TABLE `c_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey_answer`
--

DROP TABLE IF EXISTS `c_survey_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey_answer` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_id` longtext COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  `user` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey_answer`
--

LOCK TABLES `c_survey_answer` WRITE;
/*!40000 ALTER TABLE `c_survey_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey_group`
--

DROP TABLE IF EXISTS `c_survey_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey_group` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `survey_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey_group`
--

LOCK TABLES `c_survey_group` WRITE;
/*!40000 ALTER TABLE `c_survey_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey_invitation`
--

DROP TABLE IF EXISTS `c_survey_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey_invitation` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `survey_invitation_id` int(11) NOT NULL,
  `survey_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `invitation_code` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `invitation_date` datetime NOT NULL,
  `reminder_date` datetime NOT NULL,
  `answered` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey_invitation`
--

LOCK TABLES `c_survey_invitation` WRITE;
/*!40000 ALTER TABLE `c_survey_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey_question`
--

DROP TABLE IF EXISTS `c_survey_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey_question` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `survey_question` longtext COLLATE utf8_unicode_ci NOT NULL,
  `survey_question_comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `display` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `shared_question_id` int(11) DEFAULT NULL,
  `max_value` int(11) DEFAULT NULL,
  `survey_group_pri` int(11) NOT NULL,
  `survey_group_sec1` int(11) NOT NULL,
  `survey_group_sec2` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey_question`
--

LOCK TABLES `c_survey_question` WRITE;
/*!40000 ALTER TABLE `c_survey_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_survey_question_option`
--

DROP TABLE IF EXISTS `c_survey_question_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_survey_question_option` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `question_option_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `option_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_survey_question_option`
--

LOCK TABLES `c_survey_question_option` WRITE;
/*!40000 ALTER TABLE `c_survey_question_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_survey_question_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_thematic`
--

DROP TABLE IF EXISTS `c_thematic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_thematic` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `display_order` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `active` (`active`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_thematic`
--

LOCK TABLES `c_thematic` WRITE;
/*!40000 ALTER TABLE `c_thematic` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_thematic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_thematic_advance`
--

DROP TABLE IF EXISTS `c_thematic_advance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_thematic_advance` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `thematic_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `start_date` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `done_advance` tinyint(1) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `IDX_62798E9754177093` (`room_id`),
  KEY `course` (`c_id`),
  KEY `thematic_id` (`thematic_id`),
  CONSTRAINT `FK_62798E9754177093` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_thematic_advance`
--

LOCK TABLES `c_thematic_advance` WRITE;
/*!40000 ALTER TABLE `c_thematic_advance` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_thematic_advance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_thematic_plan`
--

DROP TABLE IF EXISTS `c_thematic_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_thematic_plan` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `thematic_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `description_type` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `thematic_id` (`thematic_id`,`description_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_thematic_plan`
--

LOCK TABLES `c_thematic_plan` WRITE;
/*!40000 ALTER TABLE `c_thematic_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_thematic_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_tool`
--

DROP TABLE IF EXISTS `c_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_tool` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility` tinyint(1) DEFAULT NULL,
  `admin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added_tool` tinyint(1) DEFAULT NULL,
  `target` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'authoring',
  `session_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `custom_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_tool`
--

LOCK TABLES `c_tool` WRITE;
/*!40000 ALTER TABLE `c_tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_tool_intro`
--

DROP TABLE IF EXISTS `c_tool_intro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_tool_intro` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_tool_intro`
--

LOCK TABLES `c_tool_intro` WRITE;
/*!40000 ALTER TABLE `c_tool_intro` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_tool_intro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_userinfo_content`
--

DROP TABLE IF EXISTS `c_userinfo_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_userinfo_content` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `definition_id` int(11) NOT NULL,
  `editor_ip` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `edition_time` datetime DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_userinfo_content`
--

LOCK TABLES `c_userinfo_content` WRITE;
/*!40000 ALTER TABLE `c_userinfo_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_userinfo_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_userinfo_def`
--

DROP TABLE IF EXISTS `c_userinfo_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_userinfo_def` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `line_count` tinyint(1) NOT NULL,
  `rank` tinyint(1) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_userinfo_def`
--

LOCK TABLES `c_userinfo_def` WRITE;
/*!40000 ALTER TABLE `c_userinfo_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_userinfo_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_wiki`
--

DROP TABLE IF EXISTS `c_wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_wiki` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `reflink` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `dtime` datetime DEFAULT NULL,
  `addlock` int(11) NOT NULL,
  `editlock` int(11) NOT NULL,
  `visibility` int(11) NOT NULL,
  `addlock_disc` int(11) NOT NULL,
  `visibility_disc` int(11) NOT NULL,
  `ratinglock_disc` int(11) NOT NULL,
  `assignment` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `progress` longtext COLLATE utf8_unicode_ci NOT NULL,
  `score` int(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `is_editing` int(11) NOT NULL,
  `time_edit` datetime DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `linksto` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tag` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `reflink` (`reflink`),
  KEY `group_id` (`group_id`),
  KEY `page_id` (`page_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_wiki`
--

LOCK TABLES `c_wiki` WRITE;
/*!40000 ALTER TABLE `c_wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_wiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_wiki_conf`
--

DROP TABLE IF EXISTS `c_wiki_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_wiki_conf` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `task` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedback1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedback2` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedback3` longtext COLLATE utf8_unicode_ci NOT NULL,
  `fprogress1` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `fprogress2` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `fprogress3` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `max_size` int(11) DEFAULT NULL,
  `max_text` int(11) DEFAULT NULL,
  `max_version` int(11) DEFAULT NULL,
  `startdate_assig` datetime DEFAULT NULL,
  `enddate_assig` datetime DEFAULT NULL,
  `delayedsubmit` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_wiki_conf`
--

LOCK TABLES `c_wiki_conf` WRITE;
/*!40000 ALTER TABLE `c_wiki_conf` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_wiki_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_wiki_discuss`
--

DROP TABLE IF EXISTS `c_wiki_discuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_wiki_discuss` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `publication_id` int(11) NOT NULL,
  `userc_id` int(11) NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `p_score` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dtime` datetime NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_wiki_discuss`
--

LOCK TABLES `c_wiki_discuss` WRITE;
/*!40000 ALTER TABLE `c_wiki_discuss` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_wiki_discuss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_wiki_mailcue`
--

DROP TABLE IF EXISTS `c_wiki_mailcue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_wiki_mailcue` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `course` (`c_id`),
  KEY `user` (`user_id`),
  KEY `c_id` (`c_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_wiki_mailcue`
--

LOCK TABLES `c_wiki_mailcue` WRITE;
/*!40000 ALTER TABLE `c_wiki_mailcue` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_wiki_mailcue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `career`
--

DROP TABLE IF EXISTS `career`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `career` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `career`
--

LOCK TABLES `career` WRITE;
/*!40000 ALTER TABLE `career` DISABLE KEYS */;
/*!40000 ALTER TABLE `career` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sent` datetime NOT NULL,
  `recd` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_chat_to_user` (`to_user`),
  KEY `idx_chat_from_user` (`from_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_video`
--

DROP TABLE IF EXISTS `chat_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` int(11) NOT NULL,
  `to_user` int(11) NOT NULL,
  `room_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_chat_video_to_user` (`to_user`),
  KEY `idx_chat_video_from_user` (`from_user`),
  KEY `idx_chat_video_users` (`from_user`,`to_user`),
  KEY `idx_chat_video_room_name` (`room_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_video`
--

LOCK TABLES `chat_video` WRITE;
/*!40000 ALTER TABLE `chat_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_item`
--

DROP TABLE IF EXISTS `class_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_item`
--

LOCK TABLES `class_item` WRITE;
/*!40000 ALTER TABLE `class_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_user`
--

DROP TABLE IF EXISTS `class_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_user` (
  `class_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`class_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_user`
--

LOCK TABLES `class_user` WRITE;
/*!40000 ALTER TABLE `class_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `directory` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_language` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `category_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility` int(11) DEFAULT NULL,
  `show_score` int(11) DEFAULT NULL,
  `tutor_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visual_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_url` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disk_quota` bigint(20) DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `last_edit` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `subscribe` tinyint(1) DEFAULT NULL,
  `unsubscribe` tinyint(1) DEFAULT NULL,
  `registration_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `legal` longtext COLLATE utf8_unicode_ci,
  `activate_legal` int(11) DEFAULT NULL,
  `add_teachers_to_sessions_courses` tinyint(1) DEFAULT NULL,
  `course_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_169E6FB977153098` (`code`),
  KEY `IDX_169E6FB954177093` (`room_id`),
  KEY `category_code` (`category_code`),
  KEY `directory` (`directory`),
  CONSTRAINT `FK_169E6FB954177093` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_category`
--

DROP TABLE IF EXISTS `course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tree_pos` int(11) DEFAULT NULL,
  `children_count` smallint(6) DEFAULT NULL,
  `auth_course_child` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_cat_child` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parent_id` (`parent_id`),
  KEY `tree_pos` (`tree_pos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_category`
--

LOCK TABLES `course_category` WRITE;
/*!40000 ALTER TABLE `course_category` DISABLE KEYS */;
INSERT INTO `course_category` VALUES (1,'Language skills','LANG',NULL,1,0,'TRUE','TRUE'),(2,'PC Skills','PC',NULL,2,0,'TRUE','TRUE'),(3,'Projects','PROJ',NULL,3,0,'TRUE','TRUE');
/*!40000 ALTER TABLE `course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_module`
--

DROP TABLE IF EXISTS `course_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `row` int(11) NOT NULL,
  `column` int(11) NOT NULL,
  `position` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_module`
--

LOCK TABLES `course_module` WRITE;
/*!40000 ALTER TABLE `course_module` DISABLE KEYS */;
INSERT INTO `course_module` VALUES (1,'calendar_event','calendar/agenda.php','agenda.gif',1,1,'basic'),(2,'link','link/link.php','links.gif',4,1,'basic'),(3,'document','document/document.php','documents.gif',3,1,'basic'),(4,'student_publication','work/work.php','works.gif',3,2,'basic'),(5,'announcement','announcements/announcements.php','valves.gif',2,1,'basic'),(6,'user','user/user.php','members.gif',2,3,'basic'),(7,'forum','forum/index.php','forum.gif',1,2,'basic'),(8,'quiz','exercice/exercice.php','quiz.gif',2,2,'basic'),(9,'group','group/group.php','group.gif',3,3,'basic'),(10,'course_description','course_description/','info.gif',1,3,'basic'),(11,'chat','chat/chat.php','chat.gif',0,0,'external'),(12,'dropbox','dropbox/index.php','dropbox.gif',4,2,'basic'),(13,'tracking','tracking/courseLog.php','statistics.gif',1,3,'courseadmin'),(14,'homepage_link','link/link.php?action=addlink','npage.gif',1,1,'courseadmin'),(15,'course_setting','course_info/infocours.php','reference.gif',1,1,'courseadmin'),(16,'External','','external.gif',0,0,'external'),(17,'AddedLearnpath','','scormbuilder.gif',0,0,'external'),(18,'learnpath','lp/lp_controller.php','scorms.gif',5,1,'basic'),(19,'blog','blog/blog.php','blog.gif',1,2,'basic'),(20,'blog_management','blog/blog_admin.php','blog_admin.gif',1,2,'courseadmin'),(21,'course_maintenance','course_info/maintenance.php','backup.gif',2,3,'courseadmin'),(22,'survey','survey/survey_list.php','survey.gif',2,1,'basic'),(23,'wiki','wiki/index.php','wiki.gif',2,3,'basic'),(24,'gradebook','gradebook/index.php','gradebook.gif',2,2,'basic'),(25,'glossary','glossary/index.php','glossary.gif',2,1,'basic'),(26,'notebook','notebook/index.php','notebook.gif',2,1,'basic'),(27,'attendance','attendance/index.php','attendance.gif',2,1,'basic'),(28,'course_progress','course_progress/index.php','course_progress.gif',2,1,'basic');
/*!40000 ALTER TABLE `course_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_rel_class`
--

DROP TABLE IF EXISTS `course_rel_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_rel_class` (
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`course_code`,`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_rel_class`
--

LOCK TABLES `course_rel_class` WRITE;
/*!40000 ALTER TABLE `course_rel_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_rel_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_rel_user`
--

DROP TABLE IF EXISTS `course_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `relation_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_tutor` tinyint(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `user_course_cat` int(11) DEFAULT NULL,
  `legal_agreement` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_92CFD9FEA76ED395` (`user_id`),
  KEY `IDX_92CFD9FE91D79BD3` (`c_id`),
  CONSTRAINT `FK_92CFD9FE91D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_92CFD9FEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_rel_user`
--

LOCK TABLES `course_rel_user` WRITE;
/*!40000 ALTER TABLE `course_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_rel_user_catalogue`
--

DROP TABLE IF EXISTS `course_rel_user_catalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_rel_user_catalogue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `visible` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_79CA412EA76ED395` (`user_id`),
  KEY `IDX_79CA412E91D79BD3` (`c_id`),
  CONSTRAINT `FK_79CA412E91D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_79CA412EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_rel_user_catalogue`
--

LOCK TABLES `course_rel_user_catalogue` WRITE;
/*!40000 ALTER TABLE `course_rel_user_catalogue` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_rel_user_catalogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_request`
--

DROP TABLE IF EXISTS `course_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `directory` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `db_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `course_language` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `category_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tutor_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visual_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_date` datetime NOT NULL,
  `objetives` longtext COLLATE utf8_unicode_ci,
  `target_audience` longtext COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `info` int(11) NOT NULL,
  `exemplary_content` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_request`
--

LOCK TABLES `course_request` WRITE;
/*!40000 ALTER TABLE `course_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_type`
--

DROP TABLE IF EXISTS `course_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `translation_var` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `props` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_type`
--

LOCK TABLES `course_type` WRITE;
/*!40000 ALTER TABLE `course_type` DISABLE KEYS */;
INSERT INTO `course_type` VALUES (1,'All tools',NULL,NULL,NULL),(2,'Entry exam',NULL,NULL,NULL);
/*!40000 ALTER TABLE `course_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_email_template`
--

DROP TABLE IF EXISTS `event_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8_unicode_ci,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_type_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_name_index` (`event_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_email_template`
--

LOCK TABLES `event_email_template` WRITE;
/*!40000 ALTER TABLE `event_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_sent`
--

DROP TABLE IF EXISTS `event_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_sent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_from` int(11) NOT NULL,
  `user_to` int(11) DEFAULT NULL,
  `event_type_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_name_index` (`event_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_sent`
--

LOCK TABLES `event_sent` WRITE;
/*!40000 ALTER TABLE `event_sent` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_sent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field`
--

DROP TABLE IF EXISTS `extra_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `extra_field_type` int(11) NOT NULL,
  `field_type` int(11) NOT NULL,
  `variable` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_value` longtext COLLATE utf8_unicode_ci,
  `field_order` int(11) DEFAULT NULL,
  `visible_to_self` tinyint(1) DEFAULT NULL,
  `visible_to_others` tinyint(1) DEFAULT NULL,
  `changeable` tinyint(1) DEFAULT NULL,
  `filter` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field`
--

LOCK TABLES `extra_field` WRITE;
/*!40000 ALTER TABLE `extra_field` DISABLE KEYS */;
INSERT INTO `extra_field` VALUES (1,1,1,'legal_accept','Legal',NULL,NULL,0,NULL,0,NULL,'2020-05-21 15:43:32'),(2,1,1,'already_logged_in','Already logged in',NULL,NULL,0,NULL,0,NULL,'2020-05-21 15:43:32'),(3,1,1,'update_type','Update script type',NULL,NULL,0,NULL,0,NULL,'2020-05-21 15:43:32'),(4,1,10,'tags','tags',NULL,NULL,0,NULL,0,NULL,'2020-05-21 15:43:32'),(5,1,1,'rssfeeds','RSS',NULL,NULL,0,NULL,0,NULL,'2020-05-21 15:43:32'),(6,1,1,'dashboard','Dashboard',NULL,NULL,0,NULL,0,NULL,'2020-05-21 15:43:32'),(7,1,11,'timezone','Timezone',NULL,NULL,0,NULL,0,NULL,'2020-05-21 15:43:32'),(8,1,4,'mail_notify_invitation','MailNotifyInvitation','1',NULL,0,NULL,1,NULL,'2020-05-21 15:43:32'),(9,1,4,'mail_notify_message','MailNotifyMessage','1',NULL,0,NULL,1,NULL,'2020-05-21 15:43:32'),(10,1,4,'mail_notify_group_message','MailNotifyGroupMessage','1',NULL,0,NULL,1,NULL,'2020-05-21 15:43:32'),(11,1,1,'user_chat_status','User chat status',NULL,NULL,0,NULL,0,NULL,'2020-05-21 15:43:33'),(12,1,1,'google_calendar_url','Google Calendar URL',NULL,NULL,0,NULL,0,NULL,'2020-05-21 15:43:33'),(13,2,13,'special_course','Special course','',NULL,1,NULL,1,NULL,'2020-05-21 15:43:33'),(14,2,10,'tags','Tags',NULL,NULL,1,NULL,1,NULL,'2020-05-21 15:43:33'),(15,2,19,'video_url','VideoUrl',NULL,NULL,1,NULL,1,NULL,'2020-05-21 15:43:33'),(16,3,16,'image','Image',NULL,NULL,1,NULL,1,NULL,'2020-05-21 15:43:33'),(17,1,1,'captcha_blocked_until_date','Account locked until',NULL,NULL,0,NULL,0,NULL,'2020-05-21 15:43:33'),(18,1,1,'skype','Skype',NULL,NULL,1,NULL,1,NULL,'2020-05-21 15:43:33'),(19,1,1,'linkedin_url','LinkedInUrl',NULL,NULL,1,NULL,1,NULL,'2020-05-21 15:43:33'),(20,8,10,'tags','Tags',NULL,NULL,1,NULL,1,NULL,'2020-05-21 15:43:33'),(21,2,0,'plugin_bbb_course_users_limit','MaxUsersInConferenceRoom','0',1,1,0,1,NULL,'2020-05-21 15:59:31'),(22,3,0,'plugin_bbb_session_users_limit','MaxUsersInConferenceRoom','0',1,1,0,1,NULL,'2020-05-21 15:59:31');
/*!40000 ALTER TABLE `extra_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field_option_rel_field_option`
--

DROP TABLE IF EXISTS `extra_field_option_rel_field_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field_option_rel_field_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_option_id` int(11) DEFAULT NULL,
  `related_field_option_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx` (`field_id`,`role_id`,`field_option_id`,`related_field_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field_option_rel_field_option`
--

LOCK TABLES `extra_field_option_rel_field_option` WRITE;
/*!40000 ALTER TABLE `extra_field_option_rel_field_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra_field_option_rel_field_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field_options`
--

DROP TABLE IF EXISTS `extra_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `option_value` longtext COLLATE utf8_unicode_ci,
  `display_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A572E3AE443707B0` (`field_id`),
  CONSTRAINT `FK_A572E3AE443707B0` FOREIGN KEY (`field_id`) REFERENCES `extra_field` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field_options`
--

LOCK TABLES `extra_field_options` WRITE;
/*!40000 ALTER TABLE `extra_field_options` DISABLE KEYS */;
INSERT INTO `extra_field_options` VALUES (1,8,'1','AtOnce',NULL,NULL,1),(2,8,'8','Daily',NULL,NULL,2),(3,8,'0','No',NULL,NULL,3),(4,9,'1','AtOnce',NULL,NULL,1),(5,9,'8','Daily',NULL,NULL,2),(6,9,'0','No',NULL,NULL,3),(7,10,'1','AtOnce',NULL,NULL,1),(8,10,'8','Daily',NULL,NULL,2),(9,10,'0','No',NULL,NULL,3);
/*!40000 ALTER TABLE `extra_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field_rel_tag`
--

DROP TABLE IF EXISTS `extra_field_rel_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field_rel_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field` (`field_id`),
  KEY `item` (`item_id`),
  KEY `tag` (`tag_id`),
  KEY `field_item_tag` (`field_id`,`item_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field_rel_tag`
--

LOCK TABLES `extra_field_rel_tag` WRITE;
/*!40000 ALTER TABLE `extra_field_rel_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra_field_rel_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field_saved_search`
--

DROP TABLE IF EXISTS `extra_field_saved_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field_saved_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `value` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_16ABE32A443707B0` (`field_id`),
  KEY `IDX_16ABE32AA76ED395` (`user_id`),
  CONSTRAINT `FK_16ABE32A443707B0` FOREIGN KEY (`field_id`) REFERENCES `extra_field` (`id`),
  CONSTRAINT `FK_16ABE32AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field_saved_search`
--

LOCK TABLES `extra_field_saved_search` WRITE;
/*!40000 ALTER TABLE `extra_field_saved_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `extra_field_saved_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_field_values`
--

DROP TABLE IF EXISTS `extra_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_171DF924443707B0` (`field_id`),
  KEY `idx_efv_fiii` (`field_id`,`item_id`),
  CONSTRAINT `FK_171DF924443707B0` FOREIGN KEY (`field_id`) REFERENCES `extra_field` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_field_values`
--

LOCK TABLES `extra_field_values` WRITE;
/*!40000 ALTER TABLE `extra_field_values` DISABLE KEYS */;
INSERT INTO `extra_field_values` VALUES (1,18,'',1,'2020-05-21 15:43:33','2020-05-21 16:05:01',NULL),(2,19,'',1,'2020-05-21 15:43:33','2020-05-21 16:05:01',NULL),(3,2,'',1,'2020-05-21 15:43:33','2020-05-21 16:05:01',NULL),(4,18,'',2,'2020-05-21 15:43:33','2020-05-21 15:43:33',NULL),(5,19,'',2,'2020-05-21 15:43:33','2020-05-21 15:43:33',NULL),(6,2,'false',2,'2020-05-21 15:43:33','2020-05-21 15:43:33',NULL),(7,1,'',1,'2020-05-21 16:05:01','2020-05-21 16:05:01',NULL),(8,3,'',1,'2020-05-21 16:05:01','2020-05-21 16:05:01',NULL),(9,5,'',1,'2020-05-21 16:05:01','2020-05-21 16:05:01',NULL),(10,6,'',1,'2020-05-21 16:05:01','2020-05-21 16:05:01',NULL),(11,7,'',1,'2020-05-21 16:05:01','2020-05-21 16:05:01',NULL),(12,8,'',1,'2020-05-21 16:05:01','2020-05-21 16:05:01',NULL),(13,9,'',1,'2020-05-21 16:05:01','2020-05-21 16:05:01',NULL),(14,10,'',1,'2020-05-21 16:05:01','2020-05-21 16:05:01',NULL),(15,11,'',1,'2020-05-21 16:05:01','2020-05-21 16:05:01',NULL),(16,12,'',1,'2020-05-21 16:05:01','2020-05-21 16:05:01',NULL),(17,17,'',1,'2020-05-21 16:05:01','2020-05-21 16:05:01',NULL);
/*!40000 ALTER TABLE `extra_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_group`
--

DROP TABLE IF EXISTS `fos_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4B019DDB77153098` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_group`
--

LOCK TABLES `fos_group` WRITE;
/*!40000 ALTER TABLE `fos_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `fos_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user_user_group`
--

DROP TABLE IF EXISTS `fos_user_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_B3C77447A76ED395` (`user_id`),
  KEY `IDX_B3C77447FE54D947` (`group_id`),
  CONSTRAINT `FK_B3C77447A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_B3C77447FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user_user_group`
--

LOCK TABLES `fos_user_user_group` WRITE;
/*!40000 ALTER TABLE `fos_user_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `fos_user_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_components`
--

DROP TABLE IF EXISTS `grade_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `percentage` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `acronym` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `grade_model_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_components`
--

LOCK TABLES `grade_components` WRITE;
/*!40000 ALTER TABLE `grade_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_model`
--

DROP TABLE IF EXISTS `grade_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `default_lowest_eval_exclude` tinyint(1) DEFAULT NULL,
  `default_external_eval` tinyint(1) DEFAULT NULL,
  `default_external_eval_prefix` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_model`
--

LOCK TABLES `grade_model` WRITE;
/*!40000 ALTER TABLE `grade_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_category`
--

DROP TABLE IF EXISTS `gradebook_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `user_id` int(11) NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `weight` double NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `certif_min_score` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `locked` int(11) NOT NULL,
  `default_lowest_eval_exclude` tinyint(1) DEFAULT NULL,
  `generate_certificates` tinyint(1) NOT NULL,
  `grade_model_id` int(11) DEFAULT NULL,
  `is_requirement` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_category`
--

LOCK TABLES `gradebook_category` WRITE;
/*!40000 ALTER TABLE `gradebook_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_certificate`
--

DROP TABLE IF EXISTS `gradebook_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_certificate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score_certificate` double NOT NULL,
  `created_at` datetime NOT NULL,
  `path_certificate` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_gradebook_certificate_category_id` (`cat_id`),
  KEY `idx_gradebook_certificate_user_id` (`user_id`),
  KEY `idx_gradebook_certificate_category_id_user_id` (`cat_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_certificate`
--

LOCK TABLES `gradebook_certificate` WRITE;
/*!40000 ALTER TABLE `gradebook_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_evaluation`
--

DROP TABLE IF EXISTS `gradebook_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `user_id` int(11) NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `weight` double NOT NULL,
  `max` double NOT NULL,
  `visible` int(11) NOT NULL,
  `type` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `locked` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_evaluation`
--

LOCK TABLES `gradebook_evaluation` WRITE;
/*!40000 ALTER TABLE `gradebook_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_link`
--

DROP TABLE IF EXISTS `gradebook_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `weight` double NOT NULL,
  `visible` int(11) NOT NULL,
  `locked` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_link`
--

LOCK TABLES `gradebook_link` WRITE;
/*!40000 ALTER TABLE `gradebook_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_linkeval_log`
--

DROP TABLE IF EXISTS `gradebook_linkeval_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_linkeval_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_linkeval_log` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `weight` smallint(6) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_id_log` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_linkeval_log`
--

LOCK TABLES `gradebook_linkeval_log` WRITE;
/*!40000 ALTER TABLE `gradebook_linkeval_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_linkeval_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_result`
--

DROP TABLE IF EXISTS `gradebook_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_result`
--

LOCK TABLES `gradebook_result` WRITE;
/*!40000 ALTER TABLE `gradebook_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_result_log`
--

DROP TABLE IF EXISTS `gradebook_result_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_result_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_result` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `evaluation_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_result_log`
--

LOCK TABLES `gradebook_result_log` WRITE;
/*!40000 ALTER TABLE `gradebook_result_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_result_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_score_display`
--

DROP TABLE IF EXISTS `gradebook_score_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_score_display` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` double NOT NULL,
  `display` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `score_color_percent` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_score_display`
--

LOCK TABLES `gradebook_score_display` WRITE;
/*!40000 ALTER TABLE `gradebook_score_display` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_score_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradebook_score_log`
--

DROP TABLE IF EXISTS `gradebook_score_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradebook_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` double NOT NULL,
  `registered_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gradebook_score_log_user` (`user_id`),
  KEY `idx_gradebook_score_log_user_category` (`user_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradebook_score_log`
--

LOCK TABLES `gradebook_score_log` WRITE;
/*!40000 ALTER TABLE `gradebook_score_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `gradebook_score_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hook_call`
--

DROP TABLE IF EXISTS `hook_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hook_call` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hook_event_id` int(11) NOT NULL,
  `hook_observer_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `hook_order` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hook_call`
--

LOCK TABLES `hook_call` WRITE;
/*!40000 ALTER TABLE `hook_call` DISABLE KEYS */;
INSERT INTO `hook_call` VALUES (1,1,1,0,1,0),(2,1,1,1,1,0),(3,2,2,0,1,0),(4,2,2,1,1,0);
/*!40000 ALTER TABLE `hook_call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hook_event`
--

DROP TABLE IF EXISTS `hook_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hook_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hook_event`
--

LOCK TABLES `hook_event` WRITE;
/*!40000 ALTER TABLE `hook_event` DISABLE KEYS */;
INSERT INTO `hook_event` VALUES (1,'HookCreateUser','HookDescriptionHookCreateUser'),(2,'HookResubscribe','HookDescriptionHookResubscribe');
/*!40000 ALTER TABLE `hook_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hook_observer`
--

DROP TABLE IF EXISTS `hook_observer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hook_observer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plugin_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_name` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hook_observer`
--

LOCK TABLES `hook_observer` WRITE;
/*!40000 ALTER TABLE `hook_observer` DISABLE KEYS */;
INSERT INTO `hook_observer` VALUES (1,'HookCreateDrupalUser','plugin/createdrupaluser/src/CreateDrupalUser.php','drupaluser'),(2,'HookResubscription','plugin/resubscription/src/Resubscription.php','resubscription');
/*!40000 ALTER TABLE `hook_observer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `original_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `english_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isocode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dokeos_folder` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D4DB71B5727ACA70` (`parent_id`),
  KEY `idx_language_dokeos_folder` (`dokeos_folder`),
  CONSTRAINT `FK_D4DB71B5727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,NULL,'&#1575;&#1604;&#1593;&#1585;&#1576;&#1610;&#1577;','arabic','ar','arabic',0),(2,49,'Asturianu','asturian','ast','asturian',0),(3,NULL,'Euskara','basque','eu','basque',1),(4,NULL,'&#2476;&#2494;&#2434;&#2482;&#2494;','bengali','bn','bengali',0),(5,NULL,'Bosanski','bosnian','bs','bosnian',1),(6,40,'Portugu&ecirc;s do Brasil','brazilian','pt-BR','brazilian',1),(7,NULL,'&#1041;&#1098;&#1083;&#1075;&#1072;&#1088;&#1089;&#1082;&#1080;','bulgarian','bg','bulgarian',1),(8,49,'Catal&agrave;','catalan','ca','catalan',0),(9,NULL,'Hrvatski','croatian','hr','croatian',0),(10,NULL,'&#268;esky','czech','cs','czech',0),(11,NULL,'Dansk','danish','da','danish',0),(12,NULL,'&#1583;&#1585;&#1740;','dari','prs','dari',0),(13,NULL,'Nederlands','dutch','nl','dutch',1),(14,NULL,'English','english','en','english',1),(15,49,'Esperanto','esperanto','eo','esperanto',0),(16,NULL,'Føroyskt','faroese','fo','faroese',0),(17,NULL,'Suomi','finnish','fi','finnish',0),(18,NULL,'Fran&ccedil;ais','french','fr','french',1),(19,28,'Furlan','friulian','fur','friulian',0),(20,49,'Galego','galician','gl','galician',1),(21,NULL,'&#4325;&#4304;&#4320;&#4311;&#4323;&#4314;&#4312;','georgian','ka','georgian',0),(22,NULL,'Deutsch','german','de','german',1),(23,NULL,'&Epsilon;&lambda;&lambda;&eta;&nu;&iota;&kappa;&#940;','greek','el','greek',1),(24,NULL,'&#1506;&#1489;&#1512;&#1497;&#1514;','hebrew','he','hebrew',0),(25,NULL,'&#2361;&#2367;&#2344;&#2381;&#2342;&#2368;','hindi','hi','hindi',0),(26,NULL,'Magyar','hungarian','hu','hungarian',1),(27,NULL,'Bahasa Indonesia','indonesian','id','indonesian',1),(28,NULL,'Italiano','italian','it','italian',1),(29,NULL,'&#26085;&#26412;&#35486;','japanese','ja','japanese',0),(30,NULL,'&#54620;&#44397;&#50612;','korean','ko','korean',0),(31,NULL,'Latvie&scaron;u','latvian','lv','latvian',1),(32,NULL,'Lietuvi&#371;','lithuanian','lt','lithuanian',0),(33,NULL,'&#1052;&#1072;&#1082;&#1077;&#1076;&#1086;&#1085;&#1089;&#1082;&#1080;','macedonian','mk','macedonian',0),(34,NULL,'Bahasa Melayu','malay','ms','malay',0),(35,NULL,'Norsk','norwegian','no','norwegian',0),(36,18,'Occitan','occitan','oc','occitan',0),(37,NULL,'&#1662;&#1690;&#1578;&#1608;','pashto','ps','pashto',0),(38,NULL,'&#1601;&#1575;&#1585;&#1587;&#1740;','persian','fa','persian',0),(39,NULL,'Polski','polish','pl','polish',1),(40,NULL,'Portugu&ecirc;s europeu','portuguese','pt','portuguese',1),(41,49,'Runasimi','quechua_cusco','qu','quechua_cusco',0),(42,NULL,'Rom&acirc;n&#259;','romanian','ro','romanian',0),(43,NULL,'&#1056;&#1091;&#1089;&#1089;&#1082;&#1080;&#1081;','russian','ru','russian',0),(44,NULL,'Srpski','serbian','sr','serbian',0),(45,NULL,'&#20013;&#25991;&#65288;&#31616;&#20307;&#65289;','simpl_chinese','zh','simpl_chinese',0),(46,NULL,'Sloven&#269;ina','slovak','sk','slovak',1),(47,NULL,'Sloven&scaron;&#269;ina','slovenian','sl','slovenian',1),(48,NULL,'&#1575;&#1604;&#1589;&#1608;&#1605;&#1575;&#1604;&#1610;&#1577;','somali','so','somali',0),(49,NULL,'Espa&ntilde;ol','spanish','es','spanish',1),(50,NULL,'Kiswahili','swahili','sw','swahili',0),(51,NULL,'Svenska','swedish','sv','swedish',0),(52,NULL,'Tagalog','tagalog','tl','tagalog',1),(53,NULL,'&#3652;&#3607;&#3618;','thai','th','thai',0),(54,NULL,'Tibetan','tibetan','bo','tibetan',0),(55,45,'&#32321;&#39636;&#20013;&#25991;','trad_chinese','zh-TW','trad_chinese',0),(56,NULL,'T&uuml;rk&ccedil;e','turkish','tr','turkish',0),(57,NULL,'&#1059;&#1082;&#1088;&#1072;&#1111;&#1085;&#1089;&#1100;&#1082;&#1072;','ukrainian','uk','ukrainian',0),(58,NULL,'Ti&#7871;ng Vi&#7879;t','vietnamese','vi','vietnamese',0),(59,NULL,'isiXhosa','xhosa','xh','xhosa',0),(60,NULL,'Yor&ugrave;b&aacute;','yoruba','yo','yoruba',0);
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal`
--

DROP TABLE IF EXISTS `legal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `type` int(11) NOT NULL,
  `changes` longtext COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal`
--

LOCK TABLES `legal` WRITE;
/*!40000 ALTER TABLE `legal` DISABLE KEYS */;
/*!40000 ALTER TABLE `legal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_sender_id` int(11) NOT NULL,
  `user_receiver_id` int(11) NOT NULL,
  `msg_status` tinyint(1) NOT NULL,
  `send_date` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_message_user_sender` (`user_sender_id`),
  KEY `idx_message_user_receiver` (`user_receiver_id`),
  KEY `idx_message_user_sender_user_receiver` (`user_sender_id`,`user_receiver_id`),
  KEY `idx_message_user_receiver_status` (`user_receiver_id`,`msg_status`),
  KEY `idx_message_group` (`group_id`),
  KEY `idx_message_parent` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_attachment`
--

DROP TABLE IF EXISTS `message_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `size` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_attachment`
--

LOCK TABLES `message_attachment` WRITE;
/*!40000 ALTER TABLE `message_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dest_user_id` int(11) NOT NULL,
  `dest_mail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `send_freq` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `sent_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_notify_sent_index` (`sent_at`),
  KEY `mail_notify_freq_index` (`sent_at`,`send_freq`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openid_association`
--

DROP TABLE IF EXISTS `openid_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openid_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idp_endpoint_uri` longtext COLLATE utf8_unicode_ci NOT NULL,
  `session_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `assoc_handle` longtext COLLATE utf8_unicode_ci NOT NULL,
  `assoc_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expires_in` bigint(20) NOT NULL,
  `mac_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openid_association`
--

LOCK TABLES `openid_association` WRITE;
/*!40000 ALTER TABLE `openid_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `openid_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_agenda`
--

DROP TABLE IF EXISTS `personal_agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_agenda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `text` longtext COLLATE utf8_unicode_ci,
  `date` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `course` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_event_id` int(11) DEFAULT NULL,
  `all_day` int(11) NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_personal_agenda_user` (`user`),
  KEY `idx_personal_agenda_parent` (`parent_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_agenda`
--

LOCK TABLES `personal_agenda` WRITE;
/*!40000 ALTER TABLE `personal_agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_agenda_repeat`
--

DROP TABLE IF EXISTS `personal_agenda_repeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_agenda_repeat` (
  `cal_id` int(11) NOT NULL AUTO_INCREMENT,
  `cal_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cal_end` int(11) DEFAULT NULL,
  `cal_frequency` int(11) DEFAULT NULL,
  `cal_days` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_agenda_repeat`
--

LOCK TABLES `personal_agenda_repeat` WRITE;
/*!40000 ALTER TABLE `personal_agenda_repeat` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_agenda_repeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_agenda_repeat_not`
--

DROP TABLE IF EXISTS `personal_agenda_repeat_not`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_agenda_repeat_not` (
  `cal_id` int(11) NOT NULL,
  `cal_date` int(11) NOT NULL,
  PRIMARY KEY (`cal_id`,`cal_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_agenda_repeat_not`
--

LOCK TABLES `personal_agenda_repeat_not` WRITE;
/*!40000 ALTER TABLE `personal_agenda_repeat_not` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_agenda_repeat_not` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_bbb_meeting`
--

DROP TABLE IF EXISTS `plugin_bbb_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_bbb_meeting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `c_id` int(10) unsigned NOT NULL DEFAULT '0',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `meeting_name` varchar(255) NOT NULL DEFAULT '',
  `attendee_pw` varchar(255) NOT NULL DEFAULT '',
  `moderator_pw` varchar(255) NOT NULL DEFAULT '',
  `record` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` varchar(255) NOT NULL,
  `closed_at` varchar(255) NOT NULL,
  `calendar_id` int(11) DEFAULT '0',
  `welcome_msg` varchar(255) NOT NULL DEFAULT '',
  `session_id` int(10) unsigned DEFAULT '0',
  `remote_id` char(30) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT '1',
  `voice_bridge` int(11) NOT NULL DEFAULT '1',
  `access_url` int(11) NOT NULL DEFAULT '1',
  `video_url` text,
  `has_video_m4v` tinyint(4) NOT NULL DEFAULT '0',
  `interface` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_bbb_meeting`
--

LOCK TABLES `plugin_bbb_meeting` WRITE;
/*!40000 ALTER TABLE `plugin_bbb_meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_bbb_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_bbb_room`
--

DROP TABLE IF EXISTS `plugin_bbb_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_bbb_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `in_at` datetime DEFAULT NULL,
  `out_at` datetime DEFAULT NULL,
  `interface` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_bbb_room`
--

LOCK TABLES `plugin_bbb_room` WRITE;
/*!40000 ALTER TABLE `plugin_bbb_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_bbb_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `career_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C11D7DD1B58CDA09` (`career_id`),
  CONSTRAINT `FK_C11D7DD1B58CDA09` FOREIGN KEY (`career_id`) REFERENCES `career` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `geolocation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(39) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_mask` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_729F519BDCD6CC49` (`branch_id`),
  CONSTRAINT `FK_729F519BDCD6CC49` FOREIGN KEY (`branch_id`) REFERENCES `branch_sync` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_engine_ref`
--

DROP TABLE IF EXISTS `search_engine_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_engine_ref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `tool_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref_id_high_level` int(11) NOT NULL,
  `ref_id_second_level` int(11) DEFAULT NULL,
  `search_did` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_engine_ref`
--

LOCK TABLES `search_engine_ref` WRITE;
/*!40000 ALTER TABLE `search_engine_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_engine_ref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `graph` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_condition`
--

DROP TABLE IF EXISTS `sequence_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `mat_op` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `param` double NOT NULL,
  `act_true` int(11) NOT NULL,
  `act_false` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_condition`
--

LOCK TABLES `sequence_condition` WRITE;
/*!40000 ALTER TABLE `sequence_condition` DISABLE KEYS */;
INSERT INTO `sequence_condition` VALUES (1,'<= 100%','<=',100,2,'0'),(2,'>= 70%','>=',70,0,'');
/*!40000 ALTER TABLE `sequence_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_formula`
--

DROP TABLE IF EXISTS `sequence_formula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_formula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_method_id` int(11) DEFAULT NULL,
  `sequence_variable_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_533B9159B2D1386E` (`sequence_method_id`),
  KEY `IDX_533B915955C65E08` (`sequence_variable_id`),
  CONSTRAINT `FK_533B915955C65E08` FOREIGN KEY (`sequence_variable_id`) REFERENCES `sequence_variable` (`id`),
  CONSTRAINT `FK_533B9159B2D1386E` FOREIGN KEY (`sequence_method_id`) REFERENCES `sequence_method` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_formula`
--

LOCK TABLES `sequence_formula` WRITE;
/*!40000 ALTER TABLE `sequence_formula` DISABLE KEYS */;
INSERT INTO `sequence_formula` VALUES (1,1,2),(2,2,2),(3,2,3),(4,2,1),(5,3,3),(6,4,4),(7,5,5),(8,6,6),(9,7,7),(10,8,8),(11,9,3),(12,10,2),(13,11,1);
/*!40000 ALTER TABLE `sequence_formula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_method`
--

DROP TABLE IF EXISTS `sequence_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `formula` longtext COLLATE utf8_unicode_ci NOT NULL,
  `assign` int(11) NOT NULL,
  `met_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `act_false` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_method`
--

LOCK TABLES `sequence_method` WRITE;
/*!40000 ALTER TABLE `sequence_method` DISABLE KEYS */;
INSERT INTO `sequence_method` VALUES (1,'Add completed item','v#2 + $complete_items;',2,'add',''),(2,'Update progress by division','v#2 / v#3 * 100;',1,'div',''),(3,'Update items count','$total_items;',3,'update',''),(4,'Enable success','1;',4,'success',''),(5,'Store success date','(empty(v#5))? api_get_utc_datetime() : v#5;',5,'success',''),(6,'Enable availability','1;',6,'pre',''),(7,'Store availability start date','(empty(v#7))? api_get_utc_datetime() : v#7;',7,'pre',''),(8,'Store availability end date','(empty($available_end_date))? api_get_utc_datetime($available_end_date) : \"0000-00-00 00:00:00\";',8,'pre',''),(9,'Increase the items count','v#3 + $total_items;',3,'add',''),(10,'Update completed items','$complete_items;',2,'update',''),(11,'Update progress','$complete_items / $total_items * 100;',1,'update','');
/*!40000 ALTER TABLE `sequence_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_resource`
--

DROP TABLE IF EXISTS `sequence_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_34ADA43998FB19AE` (`sequence_id`),
  CONSTRAINT `FK_34ADA43998FB19AE` FOREIGN KEY (`sequence_id`) REFERENCES `sequence` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_resource`
--

LOCK TABLES `sequence_resource` WRITE;
/*!40000 ALTER TABLE `sequence_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_row_entity`
--

DROP TABLE IF EXISTS `sequence_row_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_row_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_type_entity_id` int(11) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `row_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2779761FAED14944` (`sequence_type_entity_id`),
  CONSTRAINT `FK_2779761FAED14944` FOREIGN KEY (`sequence_type_entity_id`) REFERENCES `sequence_type_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_row_entity`
--

LOCK TABLES `sequence_row_entity` WRITE;
/*!40000 ALTER TABLE `sequence_row_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_row_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_rule`
--

DROP TABLE IF EXISTS `sequence_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_rule`
--

LOCK TABLES `sequence_rule` WRITE;
/*!40000 ALTER TABLE `sequence_rule` DISABLE KEYS */;
INSERT INTO `sequence_rule` VALUES (1,'If user completes 70% of an entity or group of items, he will be able to access another entity or group of items');
/*!40000 ALTER TABLE `sequence_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_rule_condition`
--

DROP TABLE IF EXISTS `sequence_rule_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_rule_condition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_rule_id` int(11) DEFAULT NULL,
  `sequence_condition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F948EE6A4044CA89` (`sequence_rule_id`),
  KEY `IDX_F948EE6A8C0A7083` (`sequence_condition_id`),
  CONSTRAINT `FK_F948EE6A4044CA89` FOREIGN KEY (`sequence_rule_id`) REFERENCES `sequence_rule` (`id`),
  CONSTRAINT `FK_F948EE6A8C0A7083` FOREIGN KEY (`sequence_condition_id`) REFERENCES `sequence_condition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_rule_condition`
--

LOCK TABLES `sequence_rule_condition` WRITE;
/*!40000 ALTER TABLE `sequence_rule_condition` DISABLE KEYS */;
INSERT INTO `sequence_rule_condition` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `sequence_rule_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_rule_method`
--

DROP TABLE IF EXISTS `sequence_rule_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_rule_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_rule_id` int(11) DEFAULT NULL,
  `sequence_method_id` int(11) DEFAULT NULL,
  `method_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6336EA764044CA89` (`sequence_rule_id`),
  KEY `IDX_6336EA76B2D1386E` (`sequence_method_id`),
  CONSTRAINT `FK_6336EA764044CA89` FOREIGN KEY (`sequence_rule_id`) REFERENCES `sequence_rule` (`id`),
  CONSTRAINT `FK_6336EA76B2D1386E` FOREIGN KEY (`sequence_method_id`) REFERENCES `sequence_method` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_rule_method`
--

LOCK TABLES `sequence_rule_method` WRITE;
/*!40000 ALTER TABLE `sequence_rule_method` DISABLE KEYS */;
INSERT INTO `sequence_rule_method` VALUES (1,1,1,1),(2,1,2,3),(3,1,3,0),(4,1,4,0),(5,1,5,0),(6,1,6,0),(7,1,7,0),(8,1,8,0),(9,1,9,2),(10,1,10,0),(11,1,11,0);
/*!40000 ALTER TABLE `sequence_rule_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_type_entity`
--

DROP TABLE IF EXISTS `sequence_type_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_type_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ent_table` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_type_entity`
--

LOCK TABLES `sequence_type_entity` WRITE;
/*!40000 ALTER TABLE `sequence_type_entity` DISABLE KEYS */;
INSERT INTO `sequence_type_entity` VALUES (1,'Lp','Learning Path','c_lp'),(2,'Quiz','Quiz and Tests','c_quiz'),(3,'LpItem','Items of a Learning Path','c_lp_item');
/*!40000 ALTER TABLE `sequence_type_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_valid`
--

DROP TABLE IF EXISTS `sequence_valid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_valid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_variable_id` int(11) DEFAULT NULL,
  `sequence_condition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F78B9CE655C65E08` (`sequence_variable_id`),
  KEY `IDX_F78B9CE68C0A7083` (`sequence_condition_id`),
  CONSTRAINT `FK_F78B9CE655C65E08` FOREIGN KEY (`sequence_variable_id`) REFERENCES `sequence_variable` (`id`),
  CONSTRAINT `FK_F78B9CE68C0A7083` FOREIGN KEY (`sequence_condition_id`) REFERENCES `sequence_condition` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_valid`
--

LOCK TABLES `sequence_valid` WRITE;
/*!40000 ALTER TABLE `sequence_valid` DISABLE KEYS */;
INSERT INTO `sequence_valid` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `sequence_valid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_value`
--

DROP TABLE IF EXISTS `sequence_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sequence_row_entity_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `advance` double NOT NULL,
  `complete_items` int(11) NOT NULL,
  `total_items` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `success_date` datetime DEFAULT NULL,
  `available` tinyint(1) NOT NULL,
  `available_start_date` datetime DEFAULT NULL,
  `available_end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_66FBF12D218736B2` (`sequence_row_entity_id`),
  CONSTRAINT `FK_66FBF12D218736B2` FOREIGN KEY (`sequence_row_entity_id`) REFERENCES `sequence_row_entity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_value`
--

LOCK TABLES `sequence_value` WRITE;
/*!40000 ALTER TABLE `sequence_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequence_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence_variable`
--

DROP TABLE IF EXISTS `sequence_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence_variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `default_val` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence_variable`
--

LOCK TABLES `sequence_variable` WRITE;
/*!40000 ALTER TABLE `sequence_variable` DISABLE KEYS */;
INSERT INTO `sequence_variable` VALUES (1,'Percentile progress','advance','0.0'),(2,'Completed items','complete_items','0'),(3,'Items count','total_items','0'),(4,'Completed','success','0'),(5,'Completion date','success_date','0000-00-00 00:00:00'),(6,'Available','available','0'),(7,'Availability start date','available_start_date','0000-00-00 00:00:00'),(8,'Availability end date','available_end_date','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `sequence_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_coach` int(11) DEFAULT NULL,
  `session_category_id` int(11) DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `show_description` tinyint(1) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `nbr_courses` smallint(6) DEFAULT NULL,
  `nbr_users` int(11) DEFAULT NULL,
  `nbr_classes` int(11) DEFAULT NULL,
  `session_admin_id` int(11) DEFAULT NULL,
  `visibility` int(11) NOT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `display_start_date` datetime DEFAULT NULL,
  `display_end_date` datetime DEFAULT NULL,
  `access_start_date` datetime DEFAULT NULL,
  `access_end_date` datetime DEFAULT NULL,
  `coach_access_start_date` datetime DEFAULT NULL,
  `coach_access_end_date` datetime DEFAULT NULL,
  `send_subscription_notification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `IDX_D044D5D4EE1F8395` (`session_category_id`),
  KEY `idx_id_coach` (`id_coach`),
  KEY `idx_id_session_admin_id` (`session_admin_id`),
  CONSTRAINT `FK_D044D5D4D1DC2CFC` FOREIGN KEY (`id_coach`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_D044D5D4EE1F8395` FOREIGN KEY (`session_category_id`) REFERENCES `session_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_category`
--

DROP TABLE IF EXISTS `session_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_url_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8DE079A973444FD5` (`access_url_id`),
  CONSTRAINT `FK_8DE079A973444FD5` FOREIGN KEY (`access_url_id`) REFERENCES `access_url` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_category`
--

LOCK TABLES `session_category` WRITE;
/*!40000 ALTER TABLE `session_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_rel_course`
--

DROP TABLE IF EXISTS `session_rel_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_rel_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `nbr_users` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_12D110D3613FECDF` (`session_id`),
  KEY `idx_session_rel_course_course_id` (`c_id`),
  CONSTRAINT `FK_12D110D3613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_12D110D391D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_rel_course`
--

LOCK TABLES `session_rel_course` WRITE;
/*!40000 ALTER TABLE `session_rel_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_rel_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_rel_course_rel_user`
--

DROP TABLE IF EXISTS `session_rel_course_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_rel_course_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `visibility` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `legal_agreement` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_720167E613FECDF` (`session_id`),
  KEY `idx_session_rel_course_rel_user_id_user` (`user_id`),
  KEY `idx_session_rel_course_rel_user_course_id` (`c_id`),
  CONSTRAINT `FK_720167E613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_720167E91D79BD3` FOREIGN KEY (`c_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_720167EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_rel_course_rel_user`
--

LOCK TABLES `session_rel_course_rel_user` WRITE;
/*!40000 ALTER TABLE `session_rel_course_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_rel_course_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_rel_user`
--

DROP TABLE IF EXISTS `session_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `relation_type` int(11) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `moved_to` int(11) DEFAULT NULL,
  `moved_status` int(11) DEFAULT NULL,
  `moved_at` datetime DEFAULT NULL,
  `registered_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B0D7D4C0613FECDF` (`session_id`),
  KEY `IDX_B0D7D4C0A76ED395` (`user_id`),
  KEY `idx_session_rel_user_id_user_moved` (`user_id`,`moved_to`),
  CONSTRAINT `FK_B0D7D4C0613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_B0D7D4C0A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_rel_user`
--

LOCK TABLES `session_rel_user` WRITE;
/*!40000 ALTER TABLE `session_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_current`
--

DROP TABLE IF EXISTS `settings_current`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subkey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selected_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subkeytext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_url` int(11) NOT NULL DEFAULT '1',
  `access_url_changeable` int(11) NOT NULL,
  `access_url_locked` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_setting` (`variable`,`subkey`,`access_url`),
  KEY `access_url` (`access_url`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_current`
--

LOCK TABLES `settings_current` WRITE;
/*!40000 ALTER TABLE `settings_current` DISABLE KEYS */;
INSERT INTO `settings_current` VALUES (1,'Institution',NULL,'textfield','Platform','My Organisation','InstitutionTitle','InstitutionComment','platform',NULL,1,1,0),(2,'InstitutionUrl',NULL,'textfield','Platform','http://www.chamilo.org','InstitutionUrlTitle','InstitutionUrlComment',NULL,NULL,1,1,0),(3,'siteName',NULL,'textfield','Platform','My campus','SiteNameTitle','SiteNameComment',NULL,NULL,1,1,0),(4,'emailAdministrator',NULL,'textfield','Platform','webmaster@localhost.localdomain','emailAdministratorTitle','emailAdministratorComment',NULL,NULL,1,1,0),(5,'administratorSurname',NULL,'textfield','Platform','Doe','administratorSurnameTitle','administratorSurnameComment',NULL,NULL,1,1,0),(6,'administratorName',NULL,'textfield','Platform','John','administratorNameTitle','administratorNameComment',NULL,NULL,1,1,0),(7,'show_administrator_data',NULL,'radio','Platform','true','ShowAdministratorDataTitle','ShowAdministratorDataComment',NULL,NULL,1,1,0),(8,'show_tutor_data',NULL,'radio','Session','true','ShowTutorDataTitle','ShowTutorDataComment',NULL,NULL,1,1,0),(9,'show_teacher_data',NULL,'radio','Platform','true','ShowTeacherDataTitle','ShowTeacherDataComment',NULL,NULL,1,1,0),(10,'homepage_view',NULL,'radio','Course','activity_big','HomepageViewTitle','HomepageViewComment',NULL,NULL,1,1,0),(11,'show_toolshortcuts',NULL,'radio','Course','false','ShowToolShortcutsTitle','ShowToolShortcutsComment',NULL,NULL,1,0,0),(12,'allow_group_categories',NULL,'radio','Course','false','AllowGroupCategories','AllowGroupCategoriesComment',NULL,NULL,1,0,0),(13,'server_type',NULL,'radio','Platform','production','ServerStatusTitle','ServerStatusComment',NULL,NULL,1,0,1),(14,'platformLanguage',NULL,'link','Languages','brazilian','PlatformLanguageTitle','PlatformLanguageComment',NULL,NULL,1,0,0),(15,'showonline','world','checkbox','Platform','true','ShowOnlineTitle','ShowOnlineComment',NULL,'ShowOnlineWorld',1,0,0),(16,'showonline','users','checkbox','Platform','true','ShowOnlineTitle','ShowOnlineComment',NULL,'ShowOnlineUsers',1,0,0),(17,'showonline','course','checkbox','Platform','true','ShowOnlineTitle','ShowOnlineComment',NULL,'ShowOnlineCourse',1,0,0),(18,'profile','name','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'Name',1,0,0),(19,'profile','officialcode','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'OfficialCode',1,0,0),(20,'profile','email','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'Email',1,0,0),(21,'profile','picture','checkbox','User','true','ProfileChangesTitle','ProfileChangesComment',NULL,'UserPicture',1,0,0),(22,'profile','login','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'Login',1,0,0),(23,'profile','password','checkbox','User','true','ProfileChangesTitle','ProfileChangesComment',NULL,'UserPassword',1,0,0),(24,'profile','language','checkbox','User','true','ProfileChangesTitle','ProfileChangesComment',NULL,'Language',1,0,0),(25,'default_document_quotum',NULL,'textfield','Course','100000000','DefaultDocumentQuotumTitle','DefaultDocumentQuotumComment',NULL,NULL,1,0,0),(26,'registration','officialcode','checkbox','User','false','RegistrationRequiredFormsTitle','RegistrationRequiredFormsComment',NULL,'OfficialCode',1,0,0),(27,'registration','email','checkbox','User','true','RegistrationRequiredFormsTitle','RegistrationRequiredFormsComment',NULL,'Email',1,0,0),(28,'registration','language','checkbox','User','true','RegistrationRequiredFormsTitle','RegistrationRequiredFormsComment',NULL,'Language',1,0,0),(29,'default_group_quotum',NULL,'textfield','Course','5000000','DefaultGroupQuotumTitle','DefaultGroupQuotumComment',NULL,NULL,1,0,0),(30,'allow_registration',NULL,'radio','Platform','false','AllowRegistrationTitle','AllowRegistrationComment',NULL,NULL,1,0,0),(31,'allow_registration_as_teacher',NULL,'radio','Platform','true','AllowRegistrationAsTeacherTitle','AllowRegistrationAsTeacherComment',NULL,NULL,1,0,0),(32,'allow_lostpassword',NULL,'radio','Platform','true','AllowLostPasswordTitle','AllowLostPasswordComment',NULL,NULL,1,0,0),(33,'allow_user_headings',NULL,'radio','Course','false','AllowUserHeadings','AllowUserHeadingsComment',NULL,NULL,1,0,0),(34,'course_create_active_tools','course_description','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'CourseDescription',1,0,0),(35,'course_create_active_tools','agenda','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Agenda',1,0,0),(36,'course_create_active_tools','documents','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Documents',1,0,0),(37,'course_create_active_tools','learning_path','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'LearningPath',1,0,0),(38,'course_create_active_tools','links','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Links',1,0,0),(39,'course_create_active_tools','announcements','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Announcements',1,0,0),(40,'course_create_active_tools','forums','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Forums',1,0,0),(41,'course_create_active_tools','dropbox','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Dropbox',1,0,0),(42,'course_create_active_tools','quiz','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Quiz',1,0,0),(43,'course_create_active_tools','users','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Users',1,0,0),(44,'course_create_active_tools','groups','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Groups',1,0,0),(45,'course_create_active_tools','chat','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Chat',1,0,0),(46,'course_create_active_tools','student_publications','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'StudentPublications',1,0,0),(47,'allow_personal_agenda',NULL,'radio','User','true','AllowPersonalAgendaTitle','AllowPersonalAgendaComment',NULL,NULL,1,0,0),(48,'display_coursecode_in_courselist',NULL,'radio','Platform','false','DisplayCourseCodeInCourselistTitle','DisplayCourseCodeInCourselistComment',NULL,NULL,1,0,0),(49,'display_teacher_in_courselist',NULL,'radio','Platform','true','DisplayTeacherInCourselistTitle','DisplayTeacherInCourselistComment',NULL,NULL,1,0,0),(50,'permanently_remove_deleted_files',NULL,'radio','Tools','false','PermanentlyRemoveFilesTitle','PermanentlyRemoveFilesComment',NULL,NULL,1,0,1),(51,'dropbox_allow_overwrite',NULL,'radio','Tools','true','DropboxAllowOverwriteTitle','DropboxAllowOverwriteComment',NULL,NULL,1,0,0),(52,'dropbox_max_filesize',NULL,'textfield','Tools','100000000','DropboxMaxFilesizeTitle','DropboxMaxFilesizeComment',NULL,NULL,1,0,0),(53,'dropbox_allow_just_upload',NULL,'radio','Tools','true','DropboxAllowJustUploadTitle','DropboxAllowJustUploadComment',NULL,NULL,1,0,0),(54,'dropbox_allow_student_to_student',NULL,'radio','Tools','true','DropboxAllowStudentToStudentTitle','DropboxAllowStudentToStudentComment',NULL,NULL,1,0,0),(55,'dropbox_allow_group',NULL,'radio','Tools','true','DropboxAllowGroupTitle','DropboxAllowGroupComment',NULL,NULL,1,0,0),(56,'dropbox_allow_mailing',NULL,'radio','Tools','false','DropboxAllowMailingTitle','DropboxAllowMailingComment',NULL,NULL,1,0,0),(57,'administratorTelephone',NULL,'textfield','Platform','(000) 001 02 03','administratorTelephoneTitle','administratorTelephoneComment',NULL,NULL,1,1,0),(58,'extended_profile',NULL,'radio','User','false','ExtendedProfileTitle','ExtendedProfileComment',NULL,NULL,1,0,0),(59,'student_view_enabled',NULL,'radio','Platform','true','StudentViewEnabledTitle','StudentViewEnabledComment',NULL,NULL,1,0,0),(60,'show_navigation_menu',NULL,'radio','Course','false','ShowNavigationMenuTitle','ShowNavigationMenuComment',NULL,NULL,1,0,0),(61,'enable_tool_introduction',NULL,'radio','course','false','EnableToolIntroductionTitle','EnableToolIntroductionComment',NULL,NULL,1,0,0),(62,'page_after_login',NULL,'radio','Platform','user_portal.php','PageAfterLoginTitle','PageAfterLoginComment',NULL,NULL,1,0,0),(63,'time_limit_whosonline',NULL,'textfield','Platform','30','TimeLimitWhosonlineTitle','TimeLimitWhosonlineComment',NULL,NULL,1,0,0),(64,'breadcrumbs_course_homepage',NULL,'radio','Course','course_title','BreadCrumbsCourseHomepageTitle','BreadCrumbsCourseHomepageComment',NULL,NULL,1,0,0),(65,'example_material_course_creation',NULL,'radio','Platform','true','ExampleMaterialCourseCreationTitle','ExampleMaterialCourseCreationComment',NULL,NULL,1,0,0),(66,'account_valid_duration',NULL,'textfield','Platform','3660','AccountValidDurationTitle','AccountValidDurationComment',NULL,NULL,1,0,1),(67,'use_session_mode',NULL,'radio','Session','true','UseSessionModeTitle','UseSessionModeComment',NULL,NULL,1,0,0),(68,'allow_email_editor',NULL,'radio','Tools','false','AllowEmailEditorTitle','AllowEmailEditorComment',NULL,NULL,1,0,0),(69,'registered',NULL,'textfield',NULL,'false','registered',NULL,NULL,NULL,1,0,0),(70,'donotlistcampus',NULL,'textfield',NULL,'false','donotlistcampus',NULL,NULL,NULL,1,0,0),(71,'show_email_addresses',NULL,'radio','Platform','false','ShowEmailAddresses','ShowEmailAddressesComment',NULL,NULL,1,1,0),(72,'profile','phone','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'Phone',1,0,0),(73,'service_ppt2lp','active','radio',NULL,'false','ppt2lp_actived','',NULL,NULL,1,0,1),(74,'service_ppt2lp','host','textfield',NULL,NULL,'Host',NULL,NULL,NULL,1,0,1),(75,'service_ppt2lp','port','textfield',NULL,'2002','Port',NULL,NULL,NULL,1,0,1),(76,'service_ppt2lp','user','textfield',NULL,NULL,'UserOnHost',NULL,NULL,NULL,1,0,1),(77,'service_ppt2lp','ftp_password','textfield',NULL,NULL,'FtpPassword',NULL,NULL,NULL,1,0,1),(78,'service_ppt2lp','path_to_lzx','textfield',NULL,NULL,'',NULL,NULL,NULL,1,0,1),(79,'service_ppt2lp','size','radio',NULL,'720x540','',NULL,NULL,NULL,1,0,1),(80,'stylesheets',NULL,'textfield','stylesheets','chamilo','',NULL,NULL,NULL,1,1,0),(81,'upload_extensions_list_type',NULL,'radio','Security','blacklist','UploadExtensionsListType','UploadExtensionsListTypeComment',NULL,NULL,1,0,1),(82,'upload_extensions_blacklist',NULL,'textfield','Security','','UploadExtensionsBlacklist','UploadExtensionsBlacklistComment',NULL,NULL,1,0,1),(83,'upload_extensions_whitelist',NULL,'textfield','Security','htm;html;jpg;jpeg;gif;png;swf;avi;mpg;mpeg;mov;flv;doc;docx;xls;xlsx;ppt;pptx;odt;odp;ods;pdf','UploadExtensionsWhitelist','UploadExtensionsWhitelistComment',NULL,NULL,1,0,1),(84,'upload_extensions_skip',NULL,'radio','Security','true','UploadExtensionsSkip','UploadExtensionsSkipComment',NULL,NULL,1,0,1),(85,'upload_extensions_replace_by',NULL,'textfield','Security','dangerous','UploadExtensionsReplaceBy','UploadExtensionsReplaceByComment',NULL,NULL,1,0,1),(86,'show_number_of_courses',NULL,'radio','Platform','false','ShowNumberOfCourses','ShowNumberOfCoursesComment',NULL,NULL,1,0,0),(87,'show_empty_course_categories',NULL,'radio','Platform','true','ShowEmptyCourseCategories','ShowEmptyCourseCategoriesComment',NULL,NULL,1,0,0),(88,'show_back_link_on_top_of_tree',NULL,'radio','Platform','false','ShowBackLinkOnTopOfCourseTree','ShowBackLinkOnTopOfCourseTreeComment',NULL,NULL,1,0,0),(89,'show_different_course_language',NULL,'radio','Platform','true','ShowDifferentCourseLanguage','ShowDifferentCourseLanguageComment',NULL,NULL,1,1,0),(90,'split_users_upload_directory',NULL,'radio','Tuning','true','SplitUsersUploadDirectory','SplitUsersUploadDirectoryComment',NULL,NULL,1,0,1),(91,'hide_dltt_markup',NULL,'radio','Languages','true','HideDLTTMarkup','HideDLTTMarkupComment',NULL,NULL,1,0,1),(92,'display_categories_on_homepage',NULL,'radio','Platform','false','DisplayCategoriesOnHomepageTitle','DisplayCategoriesOnHomepageComment',NULL,NULL,1,1,0),(93,'permissions_for_new_directories',NULL,'textfield','Security','0777','PermissionsForNewDirs','PermissionsForNewDirsComment',NULL,NULL,1,0,1),(94,'permissions_for_new_files',NULL,'textfield','Security','0600','PermissionsForNewFiles','PermissionsForNewFilesComment',NULL,NULL,1,0,1),(95,'show_tabs','campus_homepage','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsCampusHomepage',1,1,0),(96,'show_tabs','my_courses','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsMyCourses',1,1,0),(97,'show_tabs','reporting','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsReporting',1,1,0),(98,'show_tabs','platform_administration','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsPlatformAdministration',1,1,0),(99,'show_tabs','my_agenda','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsMyAgenda',1,1,0),(100,'show_tabs','my_profile','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsMyProfile',1,1,0),(101,'default_forum_view',NULL,'radio','Course','flat','DefaultForumViewTitle','DefaultForumViewComment',NULL,NULL,1,0,0),(102,'platform_charset',NULL,'textfield','Languages','UTF-8','PlatformCharsetTitle','PlatformCharsetComment','platform',NULL,1,0,1),(103,'noreply_email_address','','textfield','Platform','','NoReplyEmailAddress','NoReplyEmailAddressComment',NULL,NULL,1,0,0),(104,'survey_email_sender_noreply','','radio','Course','coach','SurveyEmailSenderNoReply','SurveyEmailSenderNoReplyComment',NULL,NULL,1,0,0),(105,'openid_authentication',NULL,'radio','Security','false','OpenIdAuthentication','OpenIdAuthenticationComment',NULL,NULL,1,0,0),(106,'profile','openid','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'OpenIDURL',1,0,0),(107,'gradebook_enable',NULL,'radio','Gradebook','false','GradebookActivation','GradebookActivationComment',NULL,NULL,1,0,0),(108,'show_tabs','my_gradebook','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsMyGradebook',1,1,0),(109,'gradebook_score_display_coloring','my_display_coloring','checkbox','Gradebook','false','GradebookScoreDisplayColoring','GradebookScoreDisplayColoringComment',NULL,'TabsGradebookEnableColoring',1,0,0),(110,'gradebook_score_display_custom','my_display_custom','checkbox','Gradebook','false','GradebookScoreDisplayCustom','GradebookScoreDisplayCustomComment',NULL,'TabsGradebookEnableCustom',1,0,0),(111,'gradebook_score_display_colorsplit',NULL,'textfield','Gradebook','50','GradebookScoreDisplayColorSplit','GradebookScoreDisplayColorSplitComment',NULL,NULL,1,0,0),(112,'gradebook_score_display_upperlimit','my_display_upperlimit','checkbox','Gradebook','false','GradebookScoreDisplayUpperLimit','GradebookScoreDisplayUpperLimitComment',NULL,'TabsGradebookEnableUpperLimit',1,0,0),(113,'gradebook_number_decimals',NULL,'select','Gradebook','0','GradebookNumberDecimals','GradebookNumberDecimalsComment',NULL,NULL,1,0,0),(114,'user_selected_theme',NULL,'radio','Platform','false','UserThemeSelection','UserThemeSelectionComment',NULL,NULL,1,0,0),(115,'profile','theme','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'UserTheme',1,0,0),(116,'allow_course_theme',NULL,'radio','Course','true','AllowCourseThemeTitle','AllowCourseThemeComment',NULL,NULL,1,0,0),(117,'show_closed_courses',NULL,'radio','Platform','false','ShowClosedCoursesTitle','ShowClosedCoursesComment',NULL,NULL,1,0,0),(118,'extendedprofile_registration','mycomptetences','checkbox','User','false','ExtendedProfileRegistrationTitle','ExtendedProfileRegistrationComment',NULL,'MyCompetences',1,0,0),(119,'extendedprofile_registration','mydiplomas','checkbox','User','false','ExtendedProfileRegistrationTitle','ExtendedProfileRegistrationComment',NULL,'MyDiplomas',1,0,0),(120,'extendedprofile_registration','myteach','checkbox','User','false','ExtendedProfileRegistrationTitle','ExtendedProfileRegistrationComment',NULL,'MyTeach',1,0,0),(121,'extendedprofile_registration','mypersonalopenarea','checkbox','User','false','ExtendedProfileRegistrationTitle','ExtendedProfileRegistrationComment',NULL,'MyPersonalOpenArea',1,0,0),(122,'extendedprofile_registrationrequired','mycomptetences','checkbox','User','false','ExtendedProfileRegistrationRequiredTitle','ExtendedProfileRegistrationRequiredComment',NULL,'MyCompetences',1,0,0),(123,'extendedprofile_registrationrequired','mydiplomas','checkbox','User','false','ExtendedProfileRegistrationRequiredTitle','ExtendedProfileRegistrationRequiredComment',NULL,'MyDiplomas',1,0,0),(124,'extendedprofile_registrationrequired','myteach','checkbox','User','false','ExtendedProfileRegistrationRequiredTitle','ExtendedProfileRegistrationRequiredComment',NULL,'MyTeach',1,0,0),(125,'extendedprofile_registrationrequired','mypersonalopenarea','checkbox','User','false','ExtendedProfileRegistrationRequiredTitle','ExtendedProfileRegistrationRequiredComment',NULL,'MyPersonalOpenArea',1,0,0),(126,'registration','phone','checkbox','User','false','RegistrationRequiredFormsTitle','RegistrationRequiredFormsComment',NULL,'Phone',1,0,0),(127,'add_users_by_coach',NULL,'radio','Session','false','AddUsersByCoachTitle','AddUsersByCoachComment',NULL,NULL,1,0,0),(128,'extend_rights_for_coach',NULL,'radio','Security','false','ExtendRightsForCoachTitle','ExtendRightsForCoachComment',NULL,NULL,1,0,0),(129,'extend_rights_for_coach_on_survey',NULL,'radio','Security','true','ExtendRightsForCoachOnSurveyTitle','ExtendRightsForCoachOnSurveyComment',NULL,NULL,1,0,0),(130,'course_create_active_tools','wiki','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Wiki',1,0,0),(131,'show_session_coach',NULL,'radio','Session','false','ShowSessionCoachTitle','ShowSessionCoachComment',NULL,NULL,1,0,0),(132,'course_create_active_tools','gradebook','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Gradebook',1,0,0),(133,'allow_users_to_create_courses',NULL,'radio','Platform','true','AllowUsersToCreateCoursesTitle','AllowUsersToCreateCoursesComment',NULL,NULL,1,0,0),(134,'course_create_active_tools','survey','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Survey',1,0,0),(135,'course_create_active_tools','glossary','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Glossary',1,0,0),(136,'course_create_active_tools','notebook','checkbox','Tools','true','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Notebook',1,0,0),(137,'course_create_active_tools','attendances','checkbox','Tools','false','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Attendances',1,0,0),(138,'course_create_active_tools','course_progress','checkbox','Tools','false','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'CourseProgress',1,0,0),(139,'profile','apikeys','checkbox','User','false','ProfileChangesTitle','ProfileChangesComment',NULL,'ApiKeys',1,0,0),(140,'allow_message_tool',NULL,'radio','Tools','true','AllowMessageToolTitle','AllowMessageToolComment',NULL,NULL,1,1,0),(141,'allow_social_tool',NULL,'radio','Tools','true','AllowSocialToolTitle','AllowSocialToolComment',NULL,NULL,1,1,0),(142,'allow_students_to_browse_courses',NULL,'radio','Platform','true','AllowStudentsToBrowseCoursesTitle','AllowStudentsToBrowseCoursesComment',NULL,NULL,1,1,0),(143,'show_session_data',NULL,'radio','Session','false','ShowSessionDataTitle','ShowSessionDataComment',NULL,NULL,1,1,0),(144,'allow_use_sub_language',NULL,'radio','Languages','false','AllowUseSubLanguageTitle','AllowUseSubLanguageComment',NULL,NULL,1,0,0),(145,'show_glossary_in_documents',NULL,'radio','Course','none','ShowGlossaryInDocumentsTitle','ShowGlossaryInDocumentsComment',NULL,NULL,1,1,0),(146,'allow_terms_conditions',NULL,'radio','Platform','false','AllowTermsAndConditionsTitle','AllowTermsAndConditionsComment',NULL,NULL,1,0,0),(147,'course_create_active_tools','enable_search','checkbox','Tools','false','CourseCreateActiveToolsTitle','CourseCreateActiveToolsComment',NULL,'Search',1,0,0),(148,'search_enabled',NULL,'radio','Search','false','EnableSearchTitle','EnableSearchComment',NULL,NULL,1,1,0),(149,'search_prefilter_prefix',NULL,NULL,'Search','','SearchPrefilterPrefix','SearchPrefilterPrefixComment',NULL,NULL,1,0,0),(150,'search_show_unlinked_results',NULL,'radio','Search','true','SearchShowUnlinkedResultsTitle','SearchShowUnlinkedResultsComment',NULL,NULL,1,1,0),(151,'show_courses_descriptions_in_catalog',NULL,'radio','Course','true','ShowCoursesDescriptionsInCatalogTitle','ShowCoursesDescriptionsInCatalogComment',NULL,NULL,1,1,0),(152,'allow_coach_to_edit_course_session',NULL,'radio','Session','true','AllowCoachsToEditInsideTrainingSessions','AllowCoachsToEditInsideTrainingSessionsComment',NULL,NULL,1,0,0),(153,'show_glossary_in_extra_tools',NULL,'radio','Course','none','ShowGlossaryInExtraToolsTitle','ShowGlossaryInExtraToolsComment',NULL,NULL,1,1,0),(154,'send_email_to_admin_when_create_course',NULL,'radio','Platform','false','SendEmailToAdminTitle','SendEmailToAdminComment',NULL,NULL,1,1,0),(155,'go_to_course_after_login',NULL,'radio','Course','false','GoToCourseAfterLoginTitle','GoToCourseAfterLoginComment',NULL,NULL,1,0,0),(156,'math_asciimathML',NULL,'radio','Editor','false','MathASCIImathMLTitle','MathASCIImathMLComment',NULL,NULL,1,0,0),(157,'enabled_asciisvg',NULL,'radio','Editor','false','AsciiSvgTitle','AsciiSvgComment',NULL,NULL,1,0,0),(158,'include_asciimathml_script',NULL,'radio','Editor','false','IncludeAsciiMathMlTitle','IncludeAsciiMathMlComment',NULL,NULL,1,0,0),(159,'youtube_for_students',NULL,'radio','Editor','true','YoutubeForStudentsTitle','YoutubeForStudentsComment',NULL,NULL,1,0,0),(160,'block_copy_paste_for_students',NULL,'radio','Editor','false','BlockCopyPasteForStudentsTitle','BlockCopyPasteForStudentsComment',NULL,NULL,1,0,0),(161,'more_buttons_maximized_mode',NULL,'radio','Editor','true','MoreButtonsForMaximizedModeTitle','MoreButtonsForMaximizedModeComment',NULL,NULL,1,0,0),(162,'students_download_folders',NULL,'radio','Tools','true','AllowStudentsDownloadFoldersTitle','AllowStudentsDownloadFoldersComment',NULL,NULL,1,0,0),(163,'users_copy_files',NULL,'radio','Tools','true','AllowUsersCopyFilesTitle','AllowUsersCopyFilesComment',NULL,NULL,1,1,0),(164,'show_tabs','social','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsSocial',1,0,0),(165,'allow_students_to_create_groups_in_social',NULL,'radio','Tools','false','AllowStudentsToCreateGroupsInSocialTitle','AllowStudentsToCreateGroupsInSocialComment',NULL,NULL,1,0,0),(166,'allow_send_message_to_all_platform_users',NULL,'radio','Tools','true','AllowSendMessageToAllPlatformUsersTitle','AllowSendMessageToAllPlatformUsersComment',NULL,NULL,1,0,0),(167,'message_max_upload_filesize',NULL,'textfield','Tools','20971520','MessageMaxUploadFilesizeTitle','MessageMaxUploadFilesizeComment',NULL,NULL,1,0,0),(168,'show_tabs','dashboard','checkbox','Platform','true','ShowTabsTitle','ShowTabsComment',NULL,'TabsDashboard',1,1,0),(169,'use_users_timezone','timezones','radio','Timezones','true','UseUsersTimezoneTitle','UseUsersTimezoneComment',NULL,'Timezones',1,1,0),(170,'timezone_value','timezones','select','Timezones','','TimezoneValueTitle','TimezoneValueComment',NULL,'Timezones',1,1,0),(171,'allow_user_course_subscription_by_course_admin',NULL,'radio','Security','true','AllowUserCourseSubscriptionByCourseAdminTitle','AllowUserCourseSubscriptionByCourseAdminComment',NULL,NULL,1,1,0),(172,'show_link_bug_notification',NULL,'radio','Platform','false','ShowLinkBugNotificationTitle','ShowLinkBugNotificationComment',NULL,NULL,1,0,0),(173,'show_link_ticket_notification',NULL,'radio','Platform','false','ShowLinkTicketNotificationTitle','ShowLinkTicketNotificationComment',NULL,NULL,1,0,0),(174,'course_validation',NULL,'radio','Platform','false','EnableCourseValidation','EnableCourseValidationComment',NULL,NULL,1,1,0),(175,'course_validation_terms_and_conditions_url',NULL,'textfield','Platform','','CourseValidationTermsAndConditionsLink','CourseValidationTermsAndConditionsLinkComment',NULL,NULL,1,1,0),(176,'sso_authentication',NULL,'radio','Security','false','EnableSSOTitle','EnableSSOComment',NULL,NULL,1,1,0),(177,'sso_authentication_domain',NULL,'textfield','Security','','SSOServerDomainTitle','SSOServerDomainComment',NULL,NULL,1,1,0),(178,'sso_authentication_auth_uri',NULL,'textfield','Security','/?q=user','SSOServerAuthURITitle','SSOServerAuthURIComment',NULL,NULL,1,1,0),(179,'sso_authentication_unauth_uri',NULL,'textfield','Security','/?q=logout','SSOServerUnAuthURITitle','SSOServerUnAuthURIComment',NULL,NULL,1,1,0),(180,'sso_authentication_protocol',NULL,'radio','Security','http://','SSOServerProtocolTitle','SSOServerProtocolComment',NULL,NULL,1,1,0),(181,'enabled_wiris',NULL,'radio','Editor','false','EnabledWirisTitle','EnabledWirisComment',NULL,NULL,1,0,0),(182,'allow_spellcheck',NULL,'radio','Editor','false','AllowSpellCheckTitle','AllowSpellCheckComment',NULL,NULL,1,0,0),(183,'force_wiki_paste_as_plain_text',NULL,'radio','Editor','false','ForceWikiPasteAsPlainTextTitle','ForceWikiPasteAsPlainTextComment',NULL,NULL,1,0,0),(184,'enabled_googlemaps',NULL,'radio','Editor','false','EnabledGooglemapsTitle','EnabledGooglemapsComment',NULL,NULL,1,0,0),(185,'enabled_imgmap',NULL,'radio','Editor','true','EnabledImageMapsTitle','EnabledImageMapsComment',NULL,NULL,1,0,0),(186,'enabled_support_svg',NULL,'radio','Tools','true','EnabledSVGTitle','EnabledSVGComment',NULL,NULL,1,0,0),(187,'pdf_export_watermark_enable',NULL,'radio','Platform','false','PDFExportWatermarkEnableTitle','PDFExportWatermarkEnableComment','platform',NULL,1,1,0),(188,'pdf_export_watermark_by_course',NULL,'radio','Platform','false','PDFExportWatermarkByCourseTitle','PDFExportWatermarkByCourseComment','platform',NULL,1,1,0),(189,'pdf_export_watermark_text',NULL,'textfield','Platform','','PDFExportWatermarkTextTitle','PDFExportWatermarkTextComment','platform',NULL,1,1,0),(190,'enabled_insertHtml',NULL,'radio','Editor','true','EnabledInsertHtmlTitle','EnabledInsertHtmlComment',NULL,NULL,1,0,0),(191,'students_export2pdf',NULL,'radio','Tools','true','EnabledStudentExport2PDFTitle','EnabledStudentExport2PDFComment',NULL,NULL,1,0,0),(192,'exercise_min_score',NULL,'textfield','Course','','ExerciseMinScoreTitle','ExerciseMinScoreComment','platform',NULL,1,1,0),(193,'exercise_max_score',NULL,'textfield','Course','','ExerciseMaxScoreTitle','ExerciseMaxScoreComment','platform',NULL,1,1,0),(194,'show_users_folders',NULL,'radio','Tools','true','ShowUsersFoldersTitle','ShowUsersFoldersComment',NULL,NULL,1,0,0),(195,'show_default_folders',NULL,'radio','Tools','true','ShowDefaultFoldersTitle','ShowDefaultFoldersComment',NULL,NULL,1,0,0),(196,'show_chat_folder',NULL,'radio','Tools','true','ShowChatFolderTitle','ShowChatFolderComment',NULL,NULL,1,0,0),(197,'enabled_text2audio',NULL,'radio','Tools','false','Text2AudioTitle','Text2AudioComment',NULL,NULL,1,0,0),(198,'course_hide_tools','course_description','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'CourseDescription',1,1,0),(199,'course_hide_tools','calendar_event','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Agenda',1,1,0),(200,'course_hide_tools','document','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Documents',1,1,0),(201,'course_hide_tools','learnpath','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'LearningPath',1,1,0),(202,'course_hide_tools','link','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Links',1,1,0),(203,'course_hide_tools','announcement','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Announcements',1,1,0),(204,'course_hide_tools','forum','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Forums',1,1,0),(205,'course_hide_tools','dropbox','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Dropbox',1,1,0),(206,'course_hide_tools','quiz','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Quiz',1,1,0),(207,'course_hide_tools','user','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Users',1,1,0),(208,'course_hide_tools','group','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Groups',1,1,0),(209,'course_hide_tools','chat','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Chat',1,1,0),(210,'course_hide_tools','student_publication','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'StudentPublications',1,1,0),(211,'course_hide_tools','wiki','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Wiki',1,1,0),(212,'course_hide_tools','gradebook','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Gradebook',1,1,0),(213,'course_hide_tools','survey','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Survey',1,1,0),(214,'course_hide_tools','glossary','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Glossary',1,1,0),(215,'course_hide_tools','notebook','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Notebook',1,1,0),(216,'course_hide_tools','attendance','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Attendances',1,1,0),(217,'course_hide_tools','course_progress','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'CourseProgress',1,1,0),(218,'course_hide_tools','blog_management','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Blog',1,1,0),(219,'course_hide_tools','tracking','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Stats',1,1,0),(220,'course_hide_tools','course_maintenance','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'Maintenance',1,1,0),(221,'course_hide_tools','course_setting','checkbox','Tools','false','CourseHideToolsTitle','CourseHideToolsComment',NULL,'CourseSettings',1,1,0),(222,'enabled_support_pixlr',NULL,'radio','Tools','false','EnabledPixlrTitle','EnabledPixlrComment',NULL,NULL,1,0,0),(223,'show_groups_to_users',NULL,'radio','Session','false','ShowGroupsToUsersTitle','ShowGroupsToUsersComment',NULL,NULL,1,0,0),(224,'accessibility_font_resize',NULL,'radio','Platform','false','EnableAccessibilityFontResizeTitle','EnableAccessibilityFontResizeComment',NULL,NULL,1,1,0),(225,'hide_courses_in_sessions',NULL,'radio','Session','false','HideCoursesInSessionsTitle','HideCoursesInSessionsComment','platform',NULL,1,1,0),(226,'enable_quiz_scenario',NULL,'radio','Course','true','EnableQuizScenarioTitle','EnableQuizScenarioComment',NULL,NULL,1,1,0),(227,'filter_terms',NULL,'textarea','Security','','FilterTermsTitle','FilterTermsComment',NULL,NULL,1,0,0),(228,'header_extra_content',NULL,'textarea','Tracking','','HeaderExtraContentTitle','HeaderExtraContentComment',NULL,NULL,1,1,0),(229,'footer_extra_content',NULL,'textarea','Tracking','','FooterExtraContentTitle','FooterExtraContentComment',NULL,NULL,1,1,0),(230,'show_documents_preview',NULL,'radio','Tools','false','ShowDocumentPreviewTitle','ShowDocumentPreviewComment',NULL,NULL,1,1,0),(231,'htmlpurifier_wiki',NULL,'radio','Editor','false','HtmlPurifierWikiTitle','HtmlPurifierWikiComment',NULL,NULL,1,0,0),(232,'cas_activate',NULL,'radio','CAS','false','CasMainActivateTitle','CasMainActivateComment',NULL,NULL,1,0,1),(233,'cas_server',NULL,'textfield','CAS','','CasMainServerTitle','CasMainServerComment',NULL,NULL,1,0,1),(234,'cas_server_uri',NULL,'textfield','CAS','','CasMainServerURITitle','CasMainServerURIComment',NULL,NULL,1,0,1),(235,'cas_port',NULL,'textfield','CAS','','CasMainPortTitle','CasMainPortComment',NULL,NULL,1,0,1),(236,'cas_protocol',NULL,'radio','CAS','','CasMainProtocolTitle','CasMainProtocolComment',NULL,NULL,1,0,1),(237,'cas_add_user_activate',NULL,'radio','CAS','false','CasUserAddActivateTitle','CasUserAddActivateComment',NULL,NULL,1,0,1),(238,'update_user_info_cas_with_ldap',NULL,'radio','CAS','true','UpdateUserInfoCasWithLdapTitle','UpdateUserInfoCasWithLdapComment',NULL,NULL,1,0,1),(239,'student_page_after_login',NULL,'textfield','Platform','','StudentPageAfterLoginTitle','StudentPageAfterLoginComment',NULL,NULL,1,0,0),(240,'teacher_page_after_login',NULL,'textfield','Platform','','TeacherPageAfterLoginTitle','TeacherPageAfterLoginComment',NULL,NULL,1,0,0),(241,'drh_page_after_login',NULL,'textfield','Platform','','DRHPageAfterLoginTitle','DRHPageAfterLoginComment',NULL,NULL,1,0,0),(242,'sessionadmin_page_after_login',NULL,'textfield','Session','','SessionAdminPageAfterLoginTitle','SessionAdminPageAfterLoginComment',NULL,NULL,1,0,0),(243,'student_autosubscribe',NULL,'textfield','Platform','','StudentAutosubscribeTitle','StudentAutosubscribeComment',NULL,NULL,1,0,0),(244,'teacher_autosubscribe',NULL,'textfield','Platform','','TeacherAutosubscribeTitle','TeacherAutosubscribeComment',NULL,NULL,1,0,0),(245,'drh_autosubscribe',NULL,'textfield','Platform','','DRHAutosubscribeTitle','DRHAutosubscribeComment',NULL,NULL,1,0,0),(246,'sessionadmin_autosubscribe',NULL,'textfield','Session','','SessionadminAutosubscribeTitle','SessionadminAutosubscribeComment',NULL,NULL,1,0,0),(247,'scorm_cumulative_session_time',NULL,'radio','Course','true','ScormCumulativeSessionTimeTitle','ScormCumulativeSessionTimeComment',NULL,NULL,1,0,0),(248,'allow_hr_skills_management',NULL,'radio','Gradebook','true','AllowHRSkillsManagementTitle','AllowHRSkillsManagementComment',NULL,NULL,1,1,0),(249,'enable_help_link',NULL,'radio','Platform','true','EnableHelpLinkTitle','EnableHelpLinkComment',NULL,NULL,1,0,0),(250,'teachers_can_change_score_settings',NULL,'radio','Gradebook','true','TeachersCanChangeScoreSettingsTitle','TeachersCanChangeScoreSettingsComment',NULL,NULL,1,1,0),(251,'allow_users_to_change_email_with_no_password',NULL,'radio','User','false','AllowUsersToChangeEmailWithNoPasswordTitle','AllowUsersToChangeEmailWithNoPasswordComment',NULL,NULL,1,0,0),(252,'show_admin_toolbar',NULL,'radio','Platform','do_not_show','ShowAdminToolbarTitle','ShowAdminToolbarComment',NULL,NULL,1,1,0),(253,'allow_global_chat',NULL,'radio','Platform','true','AllowGlobalChatTitle','AllowGlobalChatComment',NULL,NULL,1,1,0),(254,'languagePriority1',NULL,'radio','Languages','course_lang','LanguagePriority1Title','LanguagePriority1Comment',NULL,NULL,1,0,1),(255,'languagePriority2',NULL,'radio','Languages','user_profil_lang','LanguagePriority2Title','LanguagePriority2Comment',NULL,NULL,1,0,1),(256,'languagePriority3',NULL,'radio','Languages','user_selected_lang','LanguagePriority3Title','LanguagePriority3Comment',NULL,NULL,1,0,1),(257,'languagePriority4',NULL,'radio','Languages','platform_lang','LanguagePriority4Title','LanguagePriority4Comment',NULL,NULL,1,0,1),(258,'login_is_email',NULL,'radio','Platform','false','LoginIsEmailTitle','LoginIsEmailComment',NULL,NULL,1,0,1),(259,'courses_default_creation_visibility',NULL,'radio','Course','2','CoursesDefaultCreationVisibilityTitle','CoursesDefaultCreationVisibilityComment',NULL,NULL,1,1,0),(260,'gradebook_enable_grade_model',NULL,'radio','Gradebook','false','GradebookEnableGradeModelTitle','GradebookEnableGradeModelComment',NULL,NULL,1,1,0),(261,'teachers_can_change_grade_model_settings',NULL,'radio','Gradebook','true','TeachersCanChangeGradeModelSettingsTitle','TeachersCanChangeGradeModelSettingsComment',NULL,NULL,1,1,0),(262,'gradebook_default_weight',NULL,'textfield','Gradebook','100','GradebookDefaultWeightTitle','GradebookDefaultWeightComment',NULL,NULL,1,0,0),(263,'ldap_description',NULL,'radio','LDAP',NULL,'LdapDescriptionTitle','LdapDescriptionComment',NULL,NULL,1,0,1),(264,'shibboleth_description',NULL,'radio','Shibboleth','false','ShibbolethMainActivateTitle','ShibbolethMainActivateComment',NULL,NULL,1,0,0),(265,'facebook_description',NULL,'radio','Facebook','false','FacebookMainActivateTitle','FacebookMainActivateComment',NULL,NULL,1,0,0),(266,'gradebook_locking_enabled',NULL,'radio','Gradebook','false','GradebookEnableLockingTitle','GradebookEnableLockingComment',NULL,NULL,1,0,0),(267,'gradebook_default_grade_model_id',NULL,'select','Gradebook','','GradebookDefaultGradeModelTitle','GradebookDefaultGradeModelComment',NULL,NULL,1,1,0),(268,'allow_session_admins_to_manage_all_sessions',NULL,'radio','Session','false','AllowSessionAdminsToSeeAllSessionsTitle','AllowSessionAdminsToSeeAllSessionsComment',NULL,NULL,1,1,0),(269,'allow_skills_tool',NULL,'radio','Platform','true','AllowSkillsToolTitle','AllowSkillsToolComment',NULL,NULL,1,1,0),(270,'allow_public_certificates',NULL,'radio','Course','false','AllowPublicCertificatesTitle','AllowPublicCertificatesComment',NULL,NULL,1,1,0),(271,'platform_unsubscribe_allowed',NULL,'radio','Platform','false','PlatformUnsubscribeTitle','PlatformUnsubscribeComment',NULL,NULL,1,1,0),(272,'activate_email_template',NULL,'radio','Platform','false','ActivateEmailTemplateTitle','ActivateEmailTemplateComment',NULL,NULL,1,0,0),(273,'enable_iframe_inclusion',NULL,'radio','Editor','false','EnableIframeInclusionTitle','EnableIframeInclusionComment',NULL,NULL,1,1,0),(274,'show_hot_courses',NULL,'radio','Platform','true','ShowHotCoursesTitle','ShowHotCoursesComment',NULL,NULL,1,1,0),(275,'enable_webcam_clip',NULL,'radio','Tools','false','EnableWebCamClipTitle','EnableWebCamClipComment',NULL,NULL,1,0,0),(276,'use_custom_pages',NULL,'radio','Platform','false','UseCustomPagesTitle','UseCustomPagesComment',NULL,NULL,1,1,0),(277,'tool_visible_by_default_at_creation','documents','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Documents',1,1,0),(278,'tool_visible_by_default_at_creation','learning_path','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'LearningPath',1,1,0),(279,'tool_visible_by_default_at_creation','links','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Links',1,1,0),(280,'tool_visible_by_default_at_creation','announcements','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Announcements',1,1,0),(281,'tool_visible_by_default_at_creation','forums','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Forums',1,1,0),(282,'tool_visible_by_default_at_creation','quiz','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Quiz',1,1,0),(283,'tool_visible_by_default_at_creation','gradebook','checkbox','Tools','true','ToolVisibleByDefaultAtCreationTitle','ToolVisibleByDefaultAtCreationComment',NULL,'Gradebook',1,1,0),(284,'prevent_session_admins_to_manage_all_users',NULL,'radio','Session','false','PreventSessionAdminsToManageAllUsersTitle','PreventSessionAdminsToManageAllUsersComment',NULL,NULL,1,1,0),(285,'documents_default_visibility_defined_in_course',NULL,'radio','Tools','false','DocumentsDefaultVisibilityDefinedInCourseTitle','DocumentsDefaultVisibilityDefinedInCourseComment',NULL,NULL,1,1,0),(286,'enabled_mathjax',NULL,'radio','Editor','false','EnableMathJaxTitle','EnableMathJaxComment',NULL,NULL,1,0,0),(287,'meta_twitter_site',NULL,'textfield','Tracking','','MetaTwitterSiteTitle','MetaTwitterSiteComment',NULL,NULL,1,1,0),(288,'meta_twitter_creator',NULL,'textfield','Tracking','','MetaTwitterCreatorTitle','MetaTwitterCreatorComment',NULL,NULL,1,1,0),(289,'meta_title',NULL,'textfield','Tracking','','MetaTitleTitle','MetaTitleComment',NULL,NULL,1,1,0),(290,'meta_description',NULL,'textfield','Tracking','','MetaDescriptionTitle','MetaDescriptionComment',NULL,NULL,1,1,0),(291,'meta_image_path',NULL,'textfield','Tracking','','MetaImagePathTitle','MetaImagePathComment',NULL,NULL,1,1,0),(292,'allow_teachers_to_create_sessions',NULL,'radio','Session','false','AllowTeachersToCreateSessionsTitle','AllowTeachersToCreateSessionsComment',NULL,NULL,1,0,0),(293,'institution_address',NULL,'textfield','Platform','','InstitutionAddressTitle','InstitutionAddressComment',NULL,NULL,1,1,0),(294,'chamilo_database_version',NULL,'textfield',NULL,'1.11.0.6','DatabaseVersion','',NULL,NULL,1,0,1),(295,'cron_remind_course_finished_activate',NULL,'radio','Crons','false','CronRemindCourseFinishedActivateTitle','CronRemindCourseFinishedActivateComment',NULL,NULL,1,1,0),(296,'cron_remind_course_expiration_frequency',NULL,'textfield','Crons','2','CronRemindCourseExpirationFrequencyTitle','CronRemindCourseExpirationFrequencyComment',NULL,NULL,1,1,0),(297,'cron_remind_course_expiration_activate',NULL,'radio','Crons','false','CronRemindCourseExpirationActivateTitle','CronRemindCourseExpirationActivateComment',NULL,NULL,1,1,0),(298,'allow_coach_feedback_exercises',NULL,'radio','Session','true','AllowCoachFeedbackExercisesTitle','AllowCoachFeedbackExercisesComment',NULL,NULL,1,0,0),(299,'allow_my_files',NULL,'radio','Platform','true','AllowMyFilesTitle','AllowMyFilesComment','',NULL,1,1,0),(300,'ticket_allow_student_add',NULL,'radio','Ticket','false','TicketAllowStudentAddTitle','TicketAllowStudentAddComment',NULL,NULL,1,0,0),(301,'ticket_send_warning_to_all_admins',NULL,'radio','Ticket','false','TicketSendWarningToAllAdminsTitle','TicketSendWarningToAllAdminsComment',NULL,NULL,1,0,0),(302,'ticket_warn_admin_no_user_in_category',NULL,'radio','Ticket','false','TicketWarnAdminNoUserInCategoryTitle','TicketWarnAdminNoUserInCategoryComment',NULL,NULL,1,0,0),(303,'ticket_allow_category_edition',NULL,'radio','Ticket','false','TicketAllowCategoryEditionTitle','TicketAllowCategoryEditionComment',NULL,NULL,1,0,0),(304,'load_term_conditions_section',NULL,'radio','Platform','login','LoadTermConditionsSectionTitle','LoadTermConditionsSectionDescription',NULL,NULL,1,0,0),(305,'show_terms_if_profile_completed',NULL,'radio','Ticket','false','ShowTermsIfProfileCompletedTitle','ShowTermsIfProfileCompletedComment',NULL,NULL,1,0,0),(306,'hide_home_top_when_connected','','radio','Platform','false','HideHomeTopContentWhenLoggedInText','HideHomeTopContentWhenLoggedInComment',NULL,'',1,1,0),(307,'hide_global_announcements_when_not_connected','','radio','Platform','false','HideGlobalAnnouncementsWhenNotLoggedInText','HideGlobalAnnouncementsWhenNotLoggedInComment',NULL,'',1,1,0),(308,'course_creation_use_template','','select_course','Course','','CourseCreationUsesTemplateText','CourseCreationUsesTemplateComment',NULL,'',1,1,0),(309,'allow_strength_pass_checker','','radio','Security','true','EnablePasswordStrengthCheckerText','EnablePasswordStrengthCheckerComment',NULL,'',1,1,0),(310,'allow_captcha','','radio','Security','false','EnableCaptchaText','EnableCaptchaComment',NULL,'',1,1,0),(311,'captcha_number_mistakes_to_block_account','','textfield','Security','5','CaptchaNumberOfMistakesBeforeBlockingAccountText','CaptchaNumberOfMistakesBeforeBlockingAccountComment',NULL,'',1,1,0),(312,'captcha_time_to_block','','textfield','Security','5','CaptchaTimeAccountIsLockedText','CaptchaTimeAccountIsLockedComment',NULL,'',1,1,0),(313,'drh_can_access_all_session_content','','radio','Session','false','DRHAccessToAllSessionContentText','DRHAccessToAllSessionContentComment',NULL,'',1,1,0),(314,'display_groups_forum_in_general_tool','','radio','Tools','true','ShowGroupForaInGeneralToolText','ShowGroupForaInGeneralToolComment',NULL,'',1,1,0),(315,'allow_tutors_to_assign_students_to_session','','radio','Session','false','TutorsCanAssignStudentsToSessionsText','TutorsCanAssignStudentsToSessionsComment',NULL,'',1,1,0),(316,'allow_lp_return_link',NULL,'radio','Course','true','AllowLearningPathReturnLinkTitle','AllowLearningPathReturnLinkComment',NULL,NULL,1,1,0),(317,'hide_scorm_export_link',NULL,'radio','Course','false','HideScormExportLinkTitle','HideScormExportLinkComment',NULL,NULL,1,1,0),(318,'hide_scorm_copy_link',NULL,'radio','Course','false','HideScormCopyLinkTitle','HideScormCopyLinkComment',NULL,NULL,1,1,0),(319,'hide_scorm_pdf_link',NULL,'radio','Course','true','HideScormPdfLinkTitle','HideScormPdfLinkComment',NULL,NULL,1,1,0),(320,'session_days_before_coach_access',NULL,'textfield','Session','0','SessionDaysBeforeCoachAccessTitle','SessionDaysBeforeCoachAccessComment',NULL,NULL,1,1,0),(321,'session_days_after_coach_access',NULL,'textfield','Session','0','SessionDaysAfterCoachAccessTitle','SessionDaysAfterCoachAccessComment',NULL,NULL,1,1,0),(322,'pdf_logo_header',NULL,'radio','Course','false','PdfLogoHeaderTitle','PdfLogoHeaderComment',NULL,NULL,1,1,0),(323,'order_user_list_by_official_code',NULL,'radio','Platform','false','OrderUserListByOfficialCodeTitle','OrderUserListByOfficialCodeComment',NULL,NULL,1,1,0),(324,'email_alert_manager_on_new_quiz',NULL,'radio','Tools','true','AlertManagerOnNewQuizTitle','AlertManagerOnNewQuizComment',NULL,NULL,1,1,0),(325,'show_official_code_exercise_result_list',NULL,'radio','Tools','false','ShowOfficialCodeInExerciseResultListTitle','ShowOfficialCodeInExerciseResultListComment',NULL,NULL,1,1,0),(326,'course_catalog_hide_private',NULL,'radio','Platform','false','HidePrivateCoursesFromCourseCatalogTitle','HidePrivateCoursesFromCourseCatalogComment',NULL,NULL,1,1,0),(327,'catalog_show_courses_sessions',NULL,'radio','Platform','0','CoursesCatalogueShowSessionsTitle','CoursesCatalogueShowSessionsComment',NULL,NULL,1,1,0),(328,'auto_detect_language_custom_pages',NULL,'radio','Platform','true','AutoDetectLanguageCustomPagesTitle','AutoDetectLanguageCustomPagesComment',NULL,NULL,1,1,0),(329,'lp_show_reduced_report',NULL,'radio','Tools','false','LearningPathShowReducedReportTitle','LearningPathShowReducedReportComment',NULL,NULL,1,1,0),(330,'allow_session_course_copy_for_teachers',NULL,'radio','Session','false','AllowSessionCourseCopyForTeachersTitle','AllowSessionCourseCopyForTeachersComment',NULL,NULL,1,1,0),(331,'hide_logout_button',NULL,'radio','Platform','false','HideLogoutButtonTitle','HideLogoutButtonComment',NULL,NULL,1,1,0),(332,'redirect_admin_to_courses_list',NULL,'radio','Platform','false','RedirectAdminToCoursesListTitle','RedirectAdminToCoursesListComment',NULL,NULL,1,1,0),(333,'course_images_in_courses_list',NULL,'radio','Course','true','CourseImagesInCoursesListTitle','CourseImagesInCoursesListComment',NULL,NULL,1,1,0),(334,'student_publication_to_take_in_gradebook',NULL,'radio','Gradebook','first','StudentPublicationSelectionForGradebookTitle','StudentPublicationSelectionForGradebookComment',NULL,NULL,1,1,0),(335,'certificate_filter_by_official_code',NULL,'radio','Gradebook','false','FilterCertificateByOfficialCodeTitle','FilterCertificateByOfficialCodeComment',NULL,NULL,1,1,0),(336,'exercise_max_ckeditors_in_page',NULL,'textfield','Tools','0','MaxCKeditorsOnExerciseResultsPageTitle','MaxCKeditorsOnExerciseResultsPageComment',NULL,NULL,1,1,0),(337,'document_if_file_exists_option',NULL,'radio','Tools','rename','DocumentDefaultOptionIfFileExistsTitle','DocumentDefaultOptionIfFileExistsComment',NULL,NULL,1,1,0),(338,'add_gradebook_certificates_cron_task_enabled',NULL,'radio','Tools','false','GradebookCronTaskGenerationTitle','GradebookCronTaskGenerationComment',NULL,NULL,1,1,0),(339,'openbadges_backpack',NULL,'textfield','Gradebook','https://backpack.openbadges.org/','OpenBadgesBackpackUrlTitle','OpenBadgesBackpackUrlComment',NULL,NULL,1,1,0),(340,'cookie_warning',NULL,'radio','Tools','false','CookieWarningTitle','CookieWarningComment',NULL,NULL,1,1,0),(341,'hide_course_group_if_no_tools_available',NULL,'radio','Tools','false','HideCourseGroupIfNoToolAvailableTitle','HideCourseGroupIfNoToolAvailableComment',NULL,NULL,1,1,0),(342,'catalog_allow_session_auto_subscription',NULL,'radio','Session','false','CatalogueAllowSessionAutoSubscriptionTitle','CatalogueAllowSessionAutoSubscriptionTitle',NULL,NULL,1,1,0),(343,'registration.soap.php.decode_utf8',NULL,'radio','Platform','false','SoapRegistrationDecodeUtf8Title','SoapRegistrationDecodeUtf8Comment',NULL,NULL,1,1,0),(344,'allow_delete_attendance',NULL,'radio','Tools','true','AttendanceDeletionEnableTitle','AttendanceDeletionEnableComment',NULL,NULL,1,1,0),(345,'gravatar_enabled',NULL,'radio','Platform','false','GravatarPicturesTitle','GravatarPicturesComment',NULL,NULL,1,1,0),(346,'gravatar_type',NULL,'radio','Platform','mm','GravatarPicturesTypeTitle','GravatarPicturesTypeComment',NULL,NULL,1,1,0),(347,'limit_session_admin_role',NULL,'radio','Session','false','SessionAdminPermissionsLimitTitle','SessionAdminPermissionsLimitComment',NULL,NULL,1,1,0),(348,'show_session_description',NULL,'radio','Session','false','ShowSessionDescriptionTitle','ShowSessionDescriptionComment',NULL,NULL,1,1,0),(349,'hide_certificate_export_link_students',NULL,'radio','Gradebook','false','CertificateHideExportLinkStudentTitle','CertificateHideExportLinkStudentComment',NULL,NULL,1,1,0),(350,'hide_certificate_export_link',NULL,'radio','Gradebook','false','CertificateHideExportLinkTitle','CertificateHideExportLinkComment',NULL,NULL,1,1,0),(351,'dropbox_hide_course_coach',NULL,'radio','Tools','false','DropboxHideCourseCoachTitle','DropboxHideCourseCoachComment',NULL,NULL,1,1,0),(352,'dropbox_hide_general_coach',NULL,'radio','Tools','false','DropboxHideGeneralCoachTitle','DropboxHideGeneralCoachComment',NULL,NULL,1,1,0),(353,'sso_force_redirect',NULL,'radio','Security','false','SSOForceRedirectTitle','SSOForceRedirectComment',NULL,NULL,1,1,0),(354,'session_course_ordering',NULL,'radio','Session','false','SessionCourseOrderingTitle','SessionCourseOrderingComment',NULL,NULL,1,1,0),(355,'gamification_mode',NULL,'radio','Platform','0','GamificationModeTitle','GamificationModeComment',NULL,NULL,1,1,0),(356,'prevent_multiple_simultaneous_login',NULL,'radio','Security','false','PreventMultipleSimultaneousLoginTitle','PreventMultipleSimultaneousLoginComment',NULL,NULL,1,0,0),(357,'gradebook_detailed_admin_view',NULL,'radio','Gradebook','false','ShowAdditionalColumnsInStudentResultsPageTitle','ShowAdditionalColumnsInStudentResultsPageComment',NULL,NULL,1,1,0),(358,'course_catalog_published',NULL,'radio','Course','false','CourseCatalogIsPublicTitle','CourseCatalogIsPublicComment',NULL,NULL,1,0,0),(359,'user_reset_password',NULL,'radio','Security','false','ResetPasswordTokenTitle','ResetPasswordTokenComment',NULL,NULL,1,0,0),(360,'user_reset_password_token_limit',NULL,'textfield','Security','3600','ResetPasswordTokenLimitTitle','ResetPasswordTokenLimitComment',NULL,NULL,1,0,0),(361,'my_courses_view_by_session',NULL,'radio','Session','false','ViewMyCoursesListBySessionTitle','ViewMyCoursesListBySessionComment',NULL,NULL,1,0,0),(362,'show_full_skill_name_on_skill_wheel',NULL,'radio','Platform','false','ShowFullSkillNameOnSkillWheelTitle','ShowFullSkillNameOnSkillWheelComment',NULL,NULL,1,1,0),(363,'messaging_allow_send_push_notification',NULL,'radio','WebServices','false','MessagingAllowSendPushNotificationTitle','MessagingAllowSendPushNotificationComment',NULL,NULL,1,0,0),(364,'messaging_gdc_project_number',NULL,'textfield','WebServices','','MessagingGDCProjectNumberTitle','MessagingGDCProjectNumberComment',NULL,NULL,1,0,0),(365,'messaging_gdc_api_key',NULL,'textfield','WebServices','','MessagingGDCApiKeyTitle','MessagingGDCApiKeyComment',NULL,NULL,1,0,0),(366,'teacher_can_select_course_template',NULL,'radio','Course','true','TeacherCanSelectCourseTemplateTitle','TeacherCanSelectCourseTemplateComment',NULL,NULL,1,0,0),(367,'enable_record_audio',NULL,'radio','Tools','true','EnableRecordAudioTitle','EnableRecordAudioComment',NULL,NULL,1,0,0),(368,'allow_show_skype_account',NULL,'radio','Platform','true','AllowShowSkypeAccountTitle','AllowShowSkypeAccountComment',NULL,NULL,1,1,0),(369,'allow_show_linkedin_url',NULL,'radio','Platform','true','AllowShowLinkedInUrlTitle','AllowShowLinkedInUrlComment',NULL,NULL,1,1,0),(370,'enable_profile_user_address_geolocalization',NULL,'radio','User','false','EnableProfileUsersAddressGeolocalizationTitle','EnableProfileUsersAddressGeolocalizationComment',NULL,NULL,1,0,0),(371,'show_official_code_whoisonline',NULL,'radio','User','false','ShowOfficialCodeInWhoIsOnlinePage','ShowOfficialCodeInWhoIsOnlinePageComment',NULL,NULL,1,0,0),(372,'icons_mode_svg',NULL,'radio','Tuning','false','IconsModeSVGTitle','IconsModeSVGComment','',NULL,1,1,0),(373,'allow_download_documents_by_api_key',NULL,'radio','WebServices','false','AllowDownloadDocumentsByApiKeyTitle','AllowDownloadDocumentsByApiKeyComment','',NULL,1,1,0),(374,'exercise_invisible_in_session',NULL,'radio','Session','false','ExerciseInvisibleInSessionTitle','ExerciseInvisibleInSessionComment','',NULL,1,1,0),(375,'configure_exercise_visibility_in_course',NULL,'radio','Session','false','ConfigureExerciseVisibilityInCourseTitle','ConfigureExerciseVisibilityInCourseComment','',NULL,1,1,0),(376,'status','bbb','setting','Plugins','installed','bbb','','','',1,1,0),(377,'bbb_tool_enable','bbb','setting','Plugins','true','bbb','','','',1,1,0),(378,'bbb_host','bbb','setting','Plugins','https://test-install.blindsidenetworks.com','bbb','','','',1,1,0),(379,'bbb_salt','bbb','setting','Plugins','8cd8ef52e8e101574e400365b55e11a6','bbb','','','',1,1,0),(380,'bbb_enable_global_conference','bbb','setting','Plugins','true','bbb','','','',1,1,0),(381,'bbb_enable_global_conference_per_user','bbb','setting','Plugins','true','bbb','','','',1,1,0),(382,'bbb_enable_conference_in_course_groups','bbb','setting','Plugins','true','bbb','','','',1,1,0),(383,'bbb_enable_global_conference_link','bbb','setting','Plugins','true','bbb','','','',1,1,0),(384,'bbb_max_users_limit','bbb','setting','Plugins','','bbb','','','',1,1,0),(385,'bbb_interface','bbb','setting','Plugins','1','bbb','','','',1,1,0),(386,'bbb_launch_type','bbb','setting','Plugins','0','bbb','','','',1,1,0),(387,'bbb_submit_button','bbb','setting','Plugins','','bbb','','','',1,1,0),(388,'bbb_global_conference_allow_roles','bbb','setting','Plugins','a:0:{}','bbb','','','',1,1,0);
/*!40000 ALTER TABLE `settings_current` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_options`
--

DROP TABLE IF EXISTS `settings_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_setting_option` (`variable`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_options`
--

LOCK TABLES `settings_options` WRITE;
/*!40000 ALTER TABLE `settings_options` DISABLE KEYS */;
INSERT INTO `settings_options` VALUES (1,'show_administrator_data','true','Yes'),(2,'show_administrator_data','false','No'),(3,'show_tutor_data','true','Yes'),(4,'show_tutor_data','false','No'),(5,'show_teacher_data','true','Yes'),(6,'show_teacher_data','false','No'),(7,'homepage_view','activity','HomepageViewActivity'),(8,'homepage_view','2column','HomepageView2column'),(9,'homepage_view','3column','HomepageView3column'),(10,'homepage_view','vertical_activity','HomepageViewVerticalActivity'),(11,'homepage_view','activity_big','HomepageViewActivityBig'),(12,'show_toolshortcuts','true','Yes'),(13,'show_toolshortcuts','false','No'),(14,'allow_group_categories','true','Yes'),(15,'allow_group_categories','false','No'),(16,'server_type','production','ProductionServer'),(17,'server_type','test','TestServer'),(18,'allow_name_change','true','Yes'),(19,'allow_name_change','false','No'),(20,'allow_officialcode_change','true','Yes'),(21,'allow_officialcode_change','false','No'),(22,'allow_registration','true','Yes'),(23,'allow_registration','false','No'),(24,'allow_registration','approval','AfterApproval'),(25,'allow_registration_as_teacher','true','Yes'),(26,'allow_registration_as_teacher','false','No'),(27,'allow_lostpassword','true','Yes'),(28,'allow_lostpassword','false','No'),(29,'allow_user_headings','true','Yes'),(30,'allow_user_headings','false','No'),(31,'allow_personal_agenda','true','Yes'),(32,'allow_personal_agenda','false','No'),(33,'display_coursecode_in_courselist','true','Yes'),(34,'display_coursecode_in_courselist','false','No'),(35,'display_teacher_in_courselist','true','Yes'),(36,'display_teacher_in_courselist','false','No'),(37,'permanently_remove_deleted_files','true','YesWillDeletePermanently'),(38,'permanently_remove_deleted_files','false','NoWillDeletePermanently'),(39,'dropbox_allow_overwrite','true','Yes'),(40,'dropbox_allow_overwrite','false','No'),(41,'dropbox_allow_just_upload','true','Yes'),(42,'dropbox_allow_just_upload','false','No'),(43,'dropbox_allow_student_to_student','true','Yes'),(44,'dropbox_allow_student_to_student','false','No'),(45,'dropbox_allow_group','true','Yes'),(46,'dropbox_allow_group','false','No'),(47,'dropbox_allow_mailing','true','Yes'),(48,'dropbox_allow_mailing','false','No'),(49,'extended_profile','true','Yes'),(50,'extended_profile','false','No'),(51,'student_view_enabled','true','Yes'),(52,'student_view_enabled','false','No'),(53,'show_navigation_menu','false','No'),(54,'show_navigation_menu','icons','IconsOnly'),(55,'show_navigation_menu','text','TextOnly'),(56,'show_navigation_menu','iconstext','IconsText'),(57,'enable_tool_introduction','true','Yes'),(58,'enable_tool_introduction','false','No'),(59,'page_after_login','index.php','CampusHomepage'),(60,'page_after_login','user_portal.php','MyCourses'),(61,'page_after_login','main/auth/courses.php','CourseCatalog'),(62,'breadcrumbs_course_homepage','get_lang','CourseHomepage'),(63,'breadcrumbs_course_homepage','course_code','CourseCode'),(64,'breadcrumbs_course_homepage','course_title','CourseTitle'),(65,'example_material_course_creation','true','Yes'),(66,'example_material_course_creation','false','No'),(67,'use_session_mode','true','Yes'),(68,'use_session_mode','false','No'),(69,'allow_email_editor','true','Yes'),(70,'allow_email_editor','false','No'),(71,'show_email_addresses','true','Yes'),(72,'show_email_addresses','false','No'),(73,'upload_extensions_list_type','blacklist','Blacklist'),(74,'upload_extensions_list_type','whitelist','Whitelist'),(75,'upload_extensions_skip','true','Remove'),(76,'upload_extensions_skip','false','Rename'),(77,'show_number_of_courses','true','Yes'),(78,'show_number_of_courses','false','No'),(79,'show_empty_course_categories','true','Yes'),(80,'show_empty_course_categories','false','No'),(81,'show_back_link_on_top_of_tree','true','Yes'),(82,'show_back_link_on_top_of_tree','false','No'),(83,'show_different_course_language','true','Yes'),(84,'show_different_course_language','false','No'),(85,'split_users_upload_directory','true','Yes'),(86,'split_users_upload_directory','false','No'),(87,'hide_dltt_markup','false','No'),(88,'hide_dltt_markup','true','Yes'),(89,'display_categories_on_homepage','true','Yes'),(90,'display_categories_on_homepage','false','No'),(91,'default_forum_view','flat','Flat'),(92,'default_forum_view','threaded','Threaded'),(93,'default_forum_view','nested','Nested'),(94,'survey_email_sender_noreply','coach','CourseCoachEmailSender'),(95,'survey_email_sender_noreply','noreply','NoReplyEmailSender'),(96,'openid_authentication','true','Yes'),(97,'openid_authentication','false','No'),(98,'gradebook_enable','true','Yes'),(99,'gradebook_enable','false','No'),(100,'user_selected_theme','true','Yes'),(101,'user_selected_theme','false','No'),(102,'allow_course_theme','true','Yes'),(103,'allow_course_theme','false','No'),(104,'show_closed_courses','true','Yes'),(105,'show_closed_courses','false','No'),(106,'ldap_version','2','LDAPVersion2'),(107,'ldap_version','3','LDAPVersion3'),(108,'add_users_by_coach','true','Yes'),(109,'add_users_by_coach','false','No'),(110,'extend_rights_for_coach','true','Yes'),(111,'extend_rights_for_coach','false','No'),(112,'extend_rights_for_coach_on_survey','true','Yes'),(113,'extend_rights_for_coach_on_survey','false','No'),(114,'show_session_coach','true','Yes'),(115,'show_session_coach','false','No'),(116,'allow_users_to_create_courses','true','Yes'),(117,'allow_users_to_create_courses','false','No'),(118,'breadcrumbs_course_homepage','session_name_and_course_title','SessionNameAndCourseTitle'),(119,'allow_message_tool','true','Yes'),(120,'allow_message_tool','false','No'),(121,'allow_social_tool','true','Yes'),(122,'allow_social_tool','false','No'),(123,'allow_students_to_browse_courses','true','Yes'),(124,'allow_students_to_browse_courses','false','No'),(125,'show_email_of_teacher_or_tutor ','true','Yes'),(126,'show_email_of_teacher_or_tutor ','false','No'),(127,'show_session_data ','true','Yes'),(128,'show_session_data ','false','No'),(129,'allow_use_sub_language','true','Yes'),(130,'allow_use_sub_language','false','No'),(131,'show_glossary_in_documents','none','ShowGlossaryInDocumentsIsNone'),(132,'show_glossary_in_documents','ismanual','ShowGlossaryInDocumentsIsManual'),(133,'show_glossary_in_documents','isautomatic','ShowGlossaryInDocumentsIsAutomatic'),(134,'allow_terms_conditions','true','Yes'),(135,'allow_terms_conditions','false','No'),(136,'search_enabled','true','Yes'),(137,'search_enabled','false','No'),(138,'search_show_unlinked_results','true','SearchShowUnlinkedResults'),(139,'search_show_unlinked_results','false','SearchHideUnlinkedResults'),(140,'show_courses_descriptions_in_catalog','true','Yes'),(141,'show_courses_descriptions_in_catalog','false','No'),(142,'allow_coach_to_edit_course_session','true','Yes'),(143,'allow_coach_to_edit_course_session','false','No'),(144,'show_glossary_in_extra_tools','none','None'),(145,'show_glossary_in_extra_tools','exercise','Exercise'),(146,'show_glossary_in_extra_tools','lp','LearningPaths'),(147,'show_glossary_in_extra_tools','exercise_and_lp','ExerciseAndLearningPath'),(148,'send_email_to_admin_when_create_course','true','Yes'),(149,'send_email_to_admin_when_create_course','false','No'),(150,'go_to_course_after_login','true','Yes'),(151,'go_to_course_after_login','false','No'),(152,'math_asciimathML','true','Yes'),(153,'math_asciimathML','false','No'),(154,'enabled_asciisvg','true','Yes'),(155,'enabled_asciisvg','false','No'),(156,'include_asciimathml_script','true','Yes'),(157,'include_asciimathml_script','false','No'),(158,'youtube_for_students','true','Yes'),(159,'youtube_for_students','false','No'),(160,'block_copy_paste_for_students','true','Yes'),(161,'block_copy_paste_for_students','false','No'),(162,'more_buttons_maximized_mode','true','Yes'),(163,'more_buttons_maximized_mode','false','No'),(164,'students_download_folders','true','Yes'),(165,'students_download_folders','false','No'),(166,'users_copy_files','true','Yes'),(167,'users_copy_files','false','No'),(168,'allow_students_to_create_groups_in_social','true','Yes'),(169,'allow_students_to_create_groups_in_social','false','No'),(170,'allow_send_message_to_all_platform_users','true','Yes'),(171,'allow_send_message_to_all_platform_users','false','No'),(172,'use_users_timezone','true','Yes'),(173,'use_users_timezone','false','No'),(174,'allow_user_course_subscription_by_course_admin','true','Yes'),(175,'allow_user_course_subscription_by_course_admin','false','No'),(176,'show_link_bug_notification','true','Yes'),(177,'show_link_bug_notification','false','No'),(178,'show_link_ticket_notification','true','Yes'),(179,'show_link_ticket_notification','false','No'),(180,'course_validation','true','Yes'),(181,'course_validation','false','No'),(182,'sso_authentication','true','Yes'),(183,'sso_authentication','false','No'),(184,'sso_authentication_protocol','http://','http://'),(185,'sso_authentication_protocol','https://','https://'),(186,'enabled_wiris','true','Yes'),(187,'enabled_wiris','false','No'),(188,'allow_spellcheck','true','Yes'),(189,'allow_spellcheck','false','No'),(190,'force_wiki_paste_as_plain_text','true','Yes'),(191,'force_wiki_paste_as_plain_text','false','No'),(192,'enabled_googlemaps','true','Yes'),(193,'enabled_googlemaps','false','No'),(194,'enabled_imgmap','true','Yes'),(195,'enabled_imgmap','false','No'),(196,'enabled_support_svg','true','Yes'),(197,'enabled_support_svg','false','No'),(198,'pdf_export_watermark_enable','true','Yes'),(199,'pdf_export_watermark_enable','false','No'),(200,'pdf_export_watermark_by_course','true','Yes'),(201,'pdf_export_watermark_by_course','false','No'),(202,'enabled_insertHtml','true','Yes'),(203,'enabled_insertHtml','false','No'),(204,'students_export2pdf','true','Yes'),(205,'students_export2pdf','false','No'),(206,'show_users_folders','true','Yes'),(207,'show_users_folders','false','No'),(208,'show_default_folders','true','Yes'),(209,'show_default_folders','false','No'),(210,'show_chat_folder','true','Yes'),(211,'show_chat_folder','false','No'),(212,'enabled_text2audio','true','Yes'),(213,'enabled_text2audio','false','No'),(214,'enabled_support_pixlr','true','Yes'),(215,'enabled_support_pixlr','false','No'),(216,'show_groups_to_users','true','Yes'),(217,'show_groups_to_users','false','No'),(218,'accessibility_font_resize','true','Yes'),(219,'accessibility_font_resize','false','No'),(220,'hide_courses_in_sessions','true','Yes'),(221,'hide_courses_in_sessions','false','No'),(222,'enable_quiz_scenario','true','Yes'),(223,'enable_quiz_scenario','false','No'),(224,'show_documents_preview','true','Yes'),(225,'show_documents_preview','false','No'),(226,'htmlpurifier_wiki','true','Yes'),(227,'htmlpurifier_wiki','false','No'),(228,'cas_activate','true','Yes'),(229,'cas_activate','false','No'),(230,'cas_protocol','CAS1','CAS1Text'),(231,'cas_protocol','CAS2','CAS2Text'),(232,'cas_protocol','SAML','SAMLText'),(233,'cas_add_user_activate','false','No'),(234,'cas_add_user_activate','platform','casAddUserActivatePlatform'),(235,'cas_add_user_activate','extldap','casAddUserActivateLDAP'),(236,'update_user_info_cas_with_ldap','true','Yes'),(237,'update_user_info_cas_with_ldap','false','No'),(238,'scorm_cumulative_session_time','true','Yes'),(239,'scorm_cumulative_session_time','false','No'),(240,'allow_hr_skills_management','true','Yes'),(241,'allow_hr_skills_management','false','No'),(242,'enable_help_link','true','Yes'),(243,'enable_help_link','false','No'),(244,'allow_users_to_change_email_with_no_password','true','Yes'),(245,'allow_users_to_change_email_with_no_password','false','No'),(246,'show_admin_toolbar','do_not_show','DoNotShow'),(247,'show_admin_toolbar','show_to_admin','ShowToAdminsOnly'),(248,'show_admin_toolbar','show_to_admin_and_teachers','ShowToAdminsAndTeachers'),(249,'show_admin_toolbar','show_to_all','ShowToAllUsers'),(250,'use_custom_pages','true','Yes'),(251,'use_custom_pages','false','No'),(252,'languagePriority1','platform_lang','PlatformLanguage'),(253,'languagePriority1','user_profil_lang','UserLanguage'),(254,'languagePriority1','user_selected_lang','UserSelectedLanguage'),(255,'languagePriority1','course_lang','CourseLanguage'),(256,'languagePriority2','platform_lang','PlatformLanguage'),(257,'languagePriority2','user_profil_lang','UserLanguage'),(258,'languagePriority2','user_selected_lang','UserSelectedLanguage'),(259,'languagePriority2','course_lang','CourseLanguage'),(260,'languagePriority3','platform_lang','PlatformLanguage'),(261,'languagePriority3','user_profil_lang','UserLanguage'),(262,'languagePriority3','user_selected_lang','UserSelectedLanguage'),(263,'languagePriority3','course_lang','CourseLanguage'),(264,'languagePriority4','platform_lang','PlatformLanguage'),(265,'languagePriority4','user_profil_lang','UserLanguage'),(266,'languagePriority4','user_selected_lang','UserSelectedLanguage'),(267,'languagePriority4','course_lang','CourseLanguage'),(268,'allow_global_chat','true','Yes'),(269,'allow_global_chat','false','No'),(270,'login_is_email','true','Yes'),(271,'login_is_email','false','No'),(272,'courses_default_creation_visibility','3','OpenToTheWorld'),(273,'courses_default_creation_visibility','2','OpenToThePlatform'),(274,'courses_default_creation_visibility','1','Private'),(275,'courses_default_creation_visibility','0','CourseVisibilityClosed'),(276,'teachers_can_change_score_settings','true','Yes'),(277,'teachers_can_change_score_settings','false','No'),(278,'teachers_can_change_grade_model_settings','true','Yes'),(279,'teachers_can_change_grade_model_settings','false','No'),(280,'gradebook_locking_enabled','true','Yes'),(281,'gradebook_locking_enabled','false','No'),(282,'gradebook_enable_grade_model','true','Yes'),(283,'gradebook_enable_grade_model','false','No'),(284,'allow_session_admins_to_manage_all_sessions','true','Yes'),(285,'allow_session_admins_to_manage_all_sessions','false','No'),(286,'allow_skills_tool','true','Yes'),(287,'allow_skills_tool','false','No'),(288,'allow_public_certificates','true','Yes'),(289,'allow_public_certificates','false','No'),(290,'platform_unsubscribe_allowed','true','Yes'),(291,'platform_unsubscribe_allowed','false','No'),(292,'activate_email_template','true','Yes'),(293,'activate_email_template','false','No'),(294,'enable_iframe_inclusion','true','Yes'),(295,'enable_iframe_inclusion','false','No'),(296,'show_hot_courses','true','Yes'),(297,'show_hot_courses','false','No'),(298,'enable_webcam_clip','true','Yes'),(299,'enable_webcam_clip','false','No'),(300,'prevent_session_admins_to_manage_all_users','true','Yes'),(301,'prevent_session_admins_to_manage_all_users','false','No'),(302,'documents_default_visibility_defined_in_course','true','Yes'),(303,'documents_default_visibility_defined_in_course','false','No'),(304,'enabled_mathjax','true','Yes'),(305,'enabled_mathjax','false','No'),(306,'allow_teachers_to_create_sessions','true','Yes'),(307,'allow_teachers_to_create_sessions','false','No'),(308,'cron_remind_course_finished_activate','false','No'),(309,'cron_remind_course_finished_activate','true','Yes'),(310,'cron_remind_course_expiration_activate','false','No'),(311,'cron_remind_course_expiration_activate','true','Yes'),(312,'allow_coach_feedback_exercises','true','Yes'),(313,'allow_coach_feedback_exercises','false','No'),(314,'allow_my_files','true','Yes'),(315,'allow_my_files','false','No'),(316,'ticket_allow_student_add','true','Yes'),(317,'ticket_allow_student_add','false','No'),(318,'ticket_allow_category_edition','true','Yes'),(319,'ticket_allow_category_edition','false','No'),(320,'ticket_send_warning_to_all_admins','true','Yes'),(321,'ticket_send_warning_to_all_admins','false','No'),(322,'ticket_warn_admin_no_user_in_category','true','Yes'),(323,'ticket_warn_admin_no_user_in_category','false','No'),(324,'load_term_conditions_section','login','Login'),(325,'load_term_conditions_section','course','Course'),(326,'show_terms_if_profile_completed','true','Yes'),(327,'show_terms_if_profile_completed','false','No'),(328,'hide_home_top_when_connected','true','Yes'),(329,'hide_home_top_when_connected','false','No'),(330,'hide_global_announcements_when_not_connected','true','Yes'),(331,'hide_global_announcements_when_not_connected','false','No'),(332,'allow_strength_pass_checker','true','Yes'),(333,'allow_strength_pass_checker','false','No'),(334,'allow_captcha','true','Yes'),(335,'allow_captcha','false','No'),(336,'drh_can_access_all_session_content','true','Yes'),(337,'drh_can_access_all_session_content','false','No'),(338,'display_groups_forum_in_general_tool','true','Yes'),(339,'display_groups_forum_in_general_tool','false','No'),(340,'allow_tutors_to_assign_students_to_session','true','Yes'),(341,'allow_tutors_to_assign_students_to_session','false','No'),(342,'allow_lp_return_link','true','Yes'),(343,'allow_lp_return_link','false','No'),(344,'hide_scorm_export_link','true','Yes'),(345,'hide_scorm_export_link','false','No'),(346,'hide_scorm_copy_link','true','Yes'),(347,'hide_scorm_copy_link','false','No'),(348,'hide_scorm_pdf_link','true','Yes'),(349,'hide_scorm_pdf_link','false','No'),(350,'pdf_logo_header','true','Yes'),(351,'pdf_logo_header','false','No'),(352,'order_user_list_by_official_code','true','Yes'),(353,'order_user_list_by_official_code','false','No'),(354,'email_alert_manager_on_new_quiz','true','Yes'),(355,'email_alert_manager_on_new_quiz','false','No'),(356,'show_official_code_exercise_result_list','true','Yes'),(357,'show_official_code_exercise_result_list','false','No'),(358,'course_catalog_hide_private','true','Yes'),(359,'course_catalog_hide_private','false','No'),(360,'catalog_show_courses_sessions','0','CatalogueShowOnlyCourses'),(361,'catalog_show_courses_sessions','1','CatalogueShowOnlySessions'),(362,'catalog_show_courses_sessions','2','CatalogueShowCoursesAndSessions'),(363,'auto_detect_language_custom_pages','true','Yes'),(364,'auto_detect_language_custom_pages','false','No'),(365,'lp_show_reduced_report','true','Yes'),(366,'lp_show_reduced_report','false','No'),(367,'allow_session_course_copy_for_teachers','true','Yes'),(368,'allow_session_course_copy_for_teachers','false','No'),(369,'hide_logout_button','true','Yes'),(370,'hide_logout_button','false','No'),(371,'redirect_admin_to_courses_list','true','Yes'),(372,'redirect_admin_to_courses_list','false','No'),(373,'course_images_in_courses_list','true','Yes'),(374,'course_images_in_courses_list','false','No'),(375,'student_publication_to_take_in_gradebook','first','First'),(376,'student_publication_to_take_in_gradebook','last','Last'),(377,'certificate_filter_by_official_code','true','Yes'),(378,'certificate_filter_by_official_code','false','No'),(379,'document_if_file_exists_option','rename','Rename'),(380,'document_if_file_exists_option','overwrite','Overwrite'),(381,'add_gradebook_certificates_cron_task_enabled','true','Yes'),(382,'add_gradebook_certificates_cron_task_enabled','false','No'),(383,'cookie_warning','true','Yes'),(384,'cookie_warning','false','No'),(385,'hide_course_group_if_no_tools_available','true','Yes'),(386,'hide_course_group_if_no_tools_available','false','No'),(387,'catalog_allow_session_auto_subscription','true','Yes'),(388,'catalog_allow_session_auto_subscription','false','No'),(389,'registration.soap.php.decode_utf8','true','Yes'),(390,'registration.soap.php.decode_utf8','false','No'),(391,'allow_delete_attendance','true','Yes'),(392,'allow_delete_attendance','false','No'),(393,'gravatar_enabled','true','Yes'),(394,'gravatar_enabled','false','No'),(395,'gravatar_type','mm','mistery-man'),(396,'gravatar_type','identicon','identicon'),(397,'gravatar_type','monsterid','monsterid'),(398,'gravatar_type','wavatar','wavatar'),(399,'limit_session_admin_role','true','Yes'),(400,'limit_session_admin_role','false','No'),(401,'show_session_description','true','Yes'),(402,'show_session_description','false','No'),(403,'hide_certificate_export_link_students','true','Yes'),(404,'hide_certificate_export_link_students','false','No'),(405,'hide_certificate_export_link','true','Yes'),(406,'hide_certificate_export_link','false','No'),(407,'dropbox_hide_course_coach','true','Yes'),(408,'dropbox_hide_course_coach','false','No'),(409,'dropbox_hide_general_coach','true','Yes'),(410,'dropbox_hide_general_coach','false','No'),(411,'sso_force_redirect','true','Yes'),(412,'sso_force_redirect','false','No'),(413,'session_course_ordering','true','Yes'),(414,'session_course_ordering','false','No'),(415,'gamification_mode','1','Yes'),(416,'gamification_mode','0','No'),(417,'prevent_multiple_simultaneous_login','true','Yes'),(418,'prevent_multiple_simultaneous_login','false','No'),(419,'gradebook_detailed_admin_view','true','Yes'),(420,'gradebook_detailed_admin_view','false','No'),(421,'course_catalog_published','true','Yes'),(422,'course_catalog_published','false','No'),(423,'user_reset_password','true','Yes'),(424,'user_reset_password','false','No'),(425,'my_courses_view_by_session','true','Yes'),(426,'my_courses_view_by_session','false','No'),(427,'show_full_skill_name_on_skill_wheel','true','Yes'),(428,'show_full_skill_name_on_skill_wheel','false','No'),(429,'messaging_allow_send_push_notification','true','Yes'),(430,'messaging_allow_send_push_notification','false','No'),(431,'teacher_can_select_course_template','true','Yes'),(432,'teacher_can_select_course_template','false','No'),(433,'enable_record_audio','true','Yes'),(434,'enable_record_audio','false','No'),(435,'allow_show_skype_account','true','Yes'),(436,'allow_show_skype_account','false','No'),(437,'allow_show_linkedin_url','true','Yes'),(438,'allow_show_linkedin_url','false','No'),(439,'enable_profile_user_address_geolocalization','true','Yes'),(440,'enable_profile_user_address_geolocalization','false','No'),(441,'show_official_code_whoisonline','true','Yes'),(442,'show_official_code_whoisonline','false','No'),(443,'icons_mode_svg','true','Yes'),(444,'icons_mode_svg','false','No'),(445,'allow_download_documents_by_api_key','true','Yes'),(446,'allow_download_documents_by_api_key','false','No'),(447,'exercise_invisible_in_session','true','Yes'),(448,'exercise_invisible_in_session','false','No'),(449,'configure_exercise_visibility_in_course','true','Yes'),(450,'configure_exercise_visibility_in_course','false','No');
/*!40000 ALTER TABLE `settings_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_survey`
--

DROP TABLE IF EXISTS `shared_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_survey` (
  `survey_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `subtitle` longtext COLLATE utf8_unicode_ci,
  `author` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `surveythanks` longtext COLLATE utf8_unicode_ci,
  `creation_date` datetime NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`survey_id`),
  UNIQUE KEY `id` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_survey`
--

LOCK TABLES `shared_survey` WRITE;
/*!40000 ALTER TABLE `shared_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_survey_question`
--

DROP TABLE IF EXISTS `shared_survey_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_survey_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `survey_question` longtext COLLATE utf8_unicode_ci NOT NULL,
  `survey_question_comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `display` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `max_value` int(11) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_survey_question`
--

LOCK TABLES `shared_survey_question` WRITE;
/*!40000 ALTER TABLE `shared_survey_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_survey_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_survey_question_option`
--

DROP TABLE IF EXISTS `shared_survey_question_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_survey_question_option` (
  `question_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `option_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`question_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_survey_question_option`
--

LOCK TABLES `shared_survey_question_option` WRITE;
/*!40000 ALTER TABLE `shared_survey_question_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_survey_question_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `access_url_id` int(11) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` longtext COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5E3DE477CCFA12B8` (`profile_id`),
  CONSTRAINT `FK_5E3DE477CCFA12B8` FOREIGN KEY (`profile_id`) REFERENCES `skill_level_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,NULL,'Root','root','',1,'',NULL,1,'2020-05-21 15:43:33');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_level`
--

DROP TABLE IF EXISTS `skill_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `short_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BFC25F2FCCFA12B8` (`profile_id`),
  CONSTRAINT `FK_BFC25F2FCCFA12B8` FOREIGN KEY (`profile_id`) REFERENCES `skill_level_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_level`
--

LOCK TABLES `skill_level` WRITE;
/*!40000 ALTER TABLE `skill_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_level_profile`
--

DROP TABLE IF EXISTS `skill_level_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_level_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_level_profile`
--

LOCK TABLES `skill_level_profile` WRITE;
/*!40000 ALTER TABLE `skill_level_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_level_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_profile`
--

DROP TABLE IF EXISTS `skill_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_profile`
--

LOCK TABLES `skill_profile` WRITE;
/*!40000 ALTER TABLE `skill_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_rel_gradebook`
--

DROP TABLE IF EXISTS `skill_rel_gradebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_rel_gradebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gradebook_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_rel_gradebook`
--

LOCK TABLES `skill_rel_gradebook` WRITE;
/*!40000 ALTER TABLE `skill_rel_gradebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_rel_gradebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_rel_profile`
--

DROP TABLE IF EXISTS `skill_rel_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_rel_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_rel_profile`
--

LOCK TABLES `skill_rel_profile` WRITE;
/*!40000 ALTER TABLE `skill_rel_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_rel_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_rel_skill`
--

DROP TABLE IF EXISTS `skill_rel_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_rel_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_rel_skill`
--

LOCK TABLES `skill_rel_skill` WRITE;
/*!40000 ALTER TABLE `skill_rel_skill` DISABLE KEYS */;
INSERT INTO `skill_rel_skill` VALUES (1,1,0,0,0);
/*!40000 ALTER TABLE `skill_rel_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_rel_user`
--

DROP TABLE IF EXISTS `skill_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `acquired_level` int(11) DEFAULT NULL,
  `acquired_skill_at` datetime NOT NULL,
  `assigned_by` int(11) NOT NULL,
  `argumentation` longtext COLLATE utf8_unicode_ci NOT NULL,
  `argumentation_author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_79D3D95AA76ED395` (`user_id`),
  KEY `IDX_79D3D95A5585C142` (`skill_id`),
  KEY `IDX_79D3D95A591CC992` (`course_id`),
  KEY `IDX_79D3D95A613FECDF` (`session_id`),
  KEY `IDX_79D3D95AF68F11CE` (`acquired_level`),
  KEY `idx_select_cs` (`course_id`,`session_id`),
  KEY `idx_select_s_c_u` (`session_id`,`course_id`,`user_id`),
  KEY `idx_select_sk_u` (`skill_id`,`user_id`),
  CONSTRAINT `FK_79D3D95A5585C142` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`),
  CONSTRAINT `FK_79D3D95A591CC992` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_79D3D95A613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_79D3D95AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_79D3D95AF68F11CE` FOREIGN KEY (`acquired_level`) REFERENCES `skill_level` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_rel_user`
--

LOCK TABLES `skill_rel_user` WRITE;
/*!40000 ALTER TABLE `skill_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_rel_user_comment`
--

DROP TABLE IF EXISTS `skill_rel_user_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill_rel_user_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_rel_user_id` int(11) DEFAULT NULL,
  `feedback_giver_id` int(11) DEFAULT NULL,
  `feedback_text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedback_value` int(11) DEFAULT '1',
  `feedback_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7AE9F6B6484A9317` (`skill_rel_user_id`),
  KEY `IDX_7AE9F6B63AF3B65B` (`feedback_giver_id`),
  KEY `idx_select_su_giver` (`skill_rel_user_id`,`feedback_giver_id`),
  CONSTRAINT `FK_7AE9F6B63AF3B65B` FOREIGN KEY (`feedback_giver_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_7AE9F6B6484A9317` FOREIGN KEY (`skill_rel_user_id`) REFERENCES `skill_rel_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_rel_user_comment`
--

LOCK TABLES `skill_rel_user_comment` WRITE;
/*!40000 ALTER TABLE `skill_rel_user_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_rel_user_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specific_field`
--

DROP TABLE IF EXISTS `specific_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specific_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_specific_field__code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specific_field`
--

LOCK TABLES `specific_field` WRITE;
/*!40000 ALTER TABLE `specific_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `specific_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specific_field_values`
--

DROP TABLE IF EXISTS `specific_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specific_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `tool_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specific_field_values`
--

LOCK TABLES `specific_field_values` WRITE;
/*!40000 ALTER TABLE `specific_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `specific_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_announcement`
--

DROP TABLE IF EXISTS `sys_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `visible_teacher` tinyint(1) NOT NULL,
  `visible_student` tinyint(1) NOT NULL,
  `visible_guest` tinyint(1) NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_url_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_announcement`
--

LOCK TABLES `sys_announcement` WRITE;
/*!40000 ALTER TABLE `sys_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_calendar`
--

DROP TABLE IF EXISTS `sys_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `access_url_id` int(11) NOT NULL,
  `all_day` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_calendar`
--

LOCK TABLES `sys_calendar` WRITE;
/*!40000 ALTER TABLE `sys_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_template`
--

DROP TABLE IF EXISTS `system_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_template`
--

LOCK TABLES `system_template` WRITE;
/*!40000 ALTER TABLE `system_template` DISABLE KEYS */;
INSERT INTO `system_template` VALUES (1,'TemplateTitleCourseTitle','TemplateTitleCourseTitleDescription','coursetitle.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n    <style type=\"text/css\">\n        .gris_title {\n            color: silver;\n        }\n\n        h1 {\n            text-align: right;\n        }\n    </style>\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td style=\"vertical-align: middle; width: 50%;\" colspan=\"1\" rowspan=\"1\">\n            <h1>TITULUS 1<br>\n                <span class=\"gris_title\">TITULUS 2</span><br>\n            </h1>\n        </td>\n        <td style=\"width: 50%;\">\n            <img style=\"width: 100px; height: 100px;\" alt=\"Chamilo logo\" src=\"{COURSE_DIR}images/logo_chamilo.png\">\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p>\n    <br><br>\n</p>\n</body>\n</html>\n'),(2,'TemplateTitleTeacher','TemplateTitleTeacherDescription','yourinstructor.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n    <style type=\"text/css\">\n        .text {\n            font-weight: normal;\n        }\n    </style>\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td></td>\n        <td style=\"height: 33%;\"></td>\n        <td></td>\n    </tr>\n    <tr>\n        <td style=\"width: 25%;\"></td>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: right; font-weight: bold;\"\n            colspan=\"1\" rowspan=\"1\">\n    <span class=\"text\">\n    <br>\n    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis pellentesque.</span>\n        </td>\n        <td style=\"width: 25%; font-weight: bold;\">\n            <img style=\"width: 180px; height: 241px;\" alt=\"trainer\" src=\"{COURSE_DIR}images/trainer/trainer_case.png \">\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p>\n    <br><br>\n</p>\n</body>\n</html>\n'),(3,'TemplateTitleLeftList','TemplateTitleListLeftListDescription','leftlist.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td style=\"width: 66%;\"></td>\n        <td style=\"vertical-align: bottom; width: 33%;\" colspan=\"1\" rowspan=\"4\">&nbsp;<img\n                style=\"width: 180px; height: 248px;\" alt=\"trainer\"\n                src=\"{COURSE_DIR}images/trainer/trainer_reads.png \"><br>\n        </td>\n    </tr>\n    <tr align=\"right\">\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 66%;\">\n            Lorem\n            ipsum dolor sit amet.\n        </td>\n    </tr>\n    <tr align=\"right\">\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 66%;\">\n            Vivamus\n            a quam.&nbsp;<br>\n        </td>\n    </tr>\n    <tr align=\"right\">\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 66%;\">\n            Proin\n            a est stibulum ante ipsum.\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(4,'TemplateTitleLeftRightList','TemplateTitleLeftRightListDescription','leftrightlist.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; height: 400px; width: 720px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td></td>\n        <td style=\"vertical-align: top;\" colspan=\"1\" rowspan=\"4\">&nbsp;<img style=\"width: 180px; height: 294px;\"\n                                                                            alt=\"Trainer\"\n                                                                            src=\"{COURSE_DIR}images/trainer/trainer_join_hands.png \"><br>\n        </td>\n        <td></td>\n    </tr>\n    <tr>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: right;\">\n            Lorem\n            ipsum dolor sit amet.\n        </td>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: left;\">\n            Convallis\n            ut.&nbsp;Cras dui magna.\n        </td>\n    </tr>\n    <tr>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: right;\">\n            Vivamus\n            a quam.&nbsp;<br>\n        </td>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: left;\">\n            Etiam\n            lacinia stibulum ante.<br>\n        </td>\n    </tr>\n    <tr>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: right;\">\n            Proin\n            a est stibulum ante ipsum.\n        </td>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 33%; text-align: left;\">\n            Consectetuer\n            adipiscing elit. <br>\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(5,'TemplateTitleRightList','TemplateTitleRightListDescription','rightlist.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body style=\"direction: ltr;\">\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td style=\"vertical-align: bottom; width: 50%;\" colspan=\"1\" rowspan=\"4\"><img\n                style=\"width: 300px; height: 199px;\" alt=\"trainer\"\n                src=\"{COURSE_DIR}images/trainer/trainer_points_right.png\"><br>\n        </td>\n        <td style=\"width: 50%;\"></td>\n    </tr>\n    <tr>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; text-align: left; width: 50%;\">\n            Convallis\n            ut.&nbsp;Cras dui magna.\n        </td>\n    </tr>\n    <tr>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; text-align: left; width: 50%;\">\n            Etiam\n            lacinia.<br>\n        </td>\n    </tr>\n    <tr>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; text-align: left; width: 50%;\">\n            Consectetuer\n            adipiscing elit. <br>\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(6,'TemplateTitleDiagram','TemplateTitleDiagramDescription','diagram.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png ) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; text-align: left; height: 33%; width: 33%;\">\n            <br>\n            Etiam\n            lacinia stibulum ante.\n            Convallis\n            ut.&nbsp;Cras dui magna.\n        </td>\n        <td colspan=\"1\" rowspan=\"3\">\n            <img style=\"width: 350px; height: 267px;\" alt=\"Alaska chart\"\n                 src=\"{COURSE_DIR}images/diagrams/alaska_chart.png \"></td>\n    </tr>\n    <tr>\n        <td colspan=\"1\" rowspan=\"1\">\n            <img style=\"width: 300px; height: 199px;\" alt=\"trainer\"\n                 src=\"{COURSE_DIR}images/trainer/trainer_points_right.png \"></td>\n    </tr>\n    <tr>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(7,'TemplateTitleDesc','TemplateTitleCheckListDescription','description.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td style=\"width: 50%; vertical-align: top;\">\n            <img style=\"width: 48px; height: 49px; float: left;\" alt=\"01\" src=\"{COURSE_DIR}images/small/01.png \"\n                 hspace=\"5\"><br>Lorem ipsum dolor sit amet<br><br><br>\n            <img style=\"width: 48px; height: 49px; float: left;\" alt=\"02\" src=\"{COURSE_DIR}images/small/02.png \"\n                 hspace=\"5\">\n            <br>Ut enim ad minim veniam<br><br><br>\n            <img style=\"width: 48px; height: 49px; float: left;\" alt=\"03\" src=\"{COURSE_DIR}images/small/03.png \"\n                 hspace=\"5\">Duis aute irure dolor in reprehenderit<br><br><br>\n            <img style=\"width: 48px; height: 49px; float: left;\" alt=\"04\" src=\"{COURSE_DIR}images/small/04.png \"\n                 hspace=\"5\">Neque porro quisquam est\n        </td>\n\n        <td style=\"vertical-align: top; width: 50%; text-align: right;\" colspan=\"1\" rowspan=\"1\">\n            <img style=\"width: 300px; height: 291px;\" alt=\"Gearbox\" src=\"{COURSE_DIR}images/diagrams/gearbox.jpg \"><br>\n        </td>\n    </tr>\n    <tr></tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(8,'TemplateTitleCycle','TemplateTitleCycleDescription','cyclechart.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n    <style>\n        .title {\n            color: white;\n            font-weight: bold;\n        }\n    </style>\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"8\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td style=\"text-align: center; vertical-align: bottom; height: 10%;\" colspan=\"3\" rowspan=\"1\">\n            <img style=\"width: 250px; height: 76px;\" alt=\"arrow\" src=\"{COURSE_DIR}images/diagrams/top_arrow.png \">\n        </td>\n    </tr>\n    <tr>\n        <td style=\"height: 5%; width: 45%; vertical-align: top; background-color: rgb(153, 153, 153); text-align: center;\">\n            <span class=\"title\">Lorem ipsum</span>\n        </td>\n        <td style=\"height: 5%; width: 10%;\"></td>\n        <td style=\"height: 5%; vertical-align: top; background-color: rgb(153, 153, 153); text-align: center;\">\n            <span class=\"title\">Sed ut perspiciatis</span>\n        </td>\n    </tr>\n    <tr>\n        <td style=\"background-color: rgb(204, 204, 255); width: 45%; vertical-align: top;\">\n            <ul>\n                <li>dolor sit amet</li>\n                <li>consectetur adipisicing elit</li>\n                <li>sed do eiusmod tempor&nbsp;</li>\n                <li>adipisci velit, sed quia non numquam</li>\n                <li>eius modi tempora incidunt ut labore et dolore magnam</li>\n            </ul>\n        </td>\n        <td style=\"width: 10%;\"></td>\n        <td style=\"background-color: rgb(204, 204, 255); width: 45%; vertical-align: top;\">\n            <ul>\n                <li>ut enim ad minim veniam</li>\n                <li>quis nostrud exercitation</li>\n                <li>ullamco laboris nisi ut</li>\n                <li> Quis autem vel eum iure reprehenderit qui in ea</li>\n                <li>voluptate velit esse quam nihil molestiae consequatur,</li>\n            </ul>\n        </td>\n    </tr>\n    <tr align=\"center\">\n        <td style=\"height: 10%; vertical-align: top;\" colspan=\"3\" rowspan=\"1\">\n            <img style=\"width: 250px; height: 76px;\" alt=\"arrow\" src=\"{COURSE_DIR}images/diagrams/bottom_arrow.png \">&nbsp;&nbsp;\n            &nbsp; &nbsp; &nbsp;\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(9,'TemplateTitleTimeline','TemplateTitleTimelineDescription','phasetimeline.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n    <style>\n        .title {\n            font-weight: bold;\n            text-align: center;\n        }\n    </style>\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"8\" cellspacing=\"5\">\n    <tbody>\n    <tr class=\"title\">\n        <td style=\"vertical-align: top; height: 3%; background-color: rgb(224, 224, 224);\">Lorem ipsum</td>\n        <td style=\"height: 3%;\"></td>\n        <td style=\"vertical-align: top; height: 3%; background-color: rgb(237, 237, 237);\">Perspiciatis</td>\n        <td style=\"height: 3%;\"></td>\n        <td style=\"vertical-align: top; height: 3%; background-color: rgb(245, 245, 245);\">Nemo enim</td>\n    </tr>\n    <tr>\n        <td style=\"vertical-align: top; width: 30%; background-color: rgb(224, 224, 224);\">\n            <ul>\n                <li>dolor sit amet</li>\n                <li>consectetur</li>\n                <li>adipisicing elit</li>\n            </ul>\n            <br>\n        </td>\n        <td>\n            <img style=\"width: 32px; height: 32px;\" alt=\"arrow\" src=\"{COURSE_DIR}images/small/arrow.png \">\n        </td>\n        <td style=\"vertical-align: top; width: 30%; background-color: rgb(237, 237, 237);\">\n            <ul>\n                <li>ut labore</li>\n                <li>et dolore</li>\n                <li>magni dolores</li>\n            </ul>\n        </td>\n        <td>\n            <img style=\"width: 32px; height: 32px;\" alt=\"arrow\" src=\"{COURSE_DIR}images/small/arrow.png \">\n        </td>\n        <td style=\"vertical-align: top; background-color: rgb(245, 245, 245); width: 30%;\">\n            <ul>\n                <li>neque porro</li>\n                <li>quisquam est</li>\n                <li>qui dolorem&nbsp;&nbsp;</li>\n            </ul>\n            <br><br>\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(10,'TemplateTitleTable','TemplateTitleCheckListDescription','table.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n    <style type=\"text/css\">\n        .title {\n            font-weight: bold;\n            text-align: center;\n        }\n\n        .items {\n            text-align: right;\n        }\n    </style>\n</head>\n<body>\n<br/>\n<h2>A table</h2>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px;\"\n       border=\"1\" cellpadding=\"5\" cellspacing=\"0\">\n    <tbody>\n    <tr class=\"title\">\n        <td>City</td>\n        <td>2005</td>\n        <td>2006</td>\n        <td>2007</td>\n        <td>2008</td>\n    </tr>\n    <tr class=\"items\">\n        <td>Lima</td>\n        <td>10,40</td>\n        <td>8,95</td>\n        <td>9,19</td>\n        <td>9,76</td>\n    </tr>\n    <tr class=\"items\">\n        <td>New York</td>\n        <td>18,39</td>\n        <td>17,52</td>\n        <td>16,57</td>\n        <td>16,60</td>\n    </tr>\n    <tr class=\"items\">\n        <td>Barcelona</td>\n        <td>0,10</td>\n        <td>0,10</td>\n        <td>0,05</td>\n        <td>0,05</td>\n    </tr>\n    <tr class=\"items\">\n        <td>Paris</td>\n        <td>3,38</td>\n        <td>3,63</td>\n        <td>3,63</td>\n        <td>3,54</td>\n    </tr>\n    </tbody>\n</table>\n<br>\n</body>\n</html>\n'),(11,'TemplateTitleAudio','TemplateTitleAudioDescription','audiocomment.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td>\n            <div align=\"center\">\n    <span style=\"text-align: center;\">\n        <embed type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\"\n               width=\"300\" height=\"20\" bgcolor=\"#FFFFFF\" src=\"{REL_PATH}main/inc/lib/mediaplayer/player.swf\"\n               allowfullscreen=\"false\" allowscriptaccess=\"always\"\n               flashvars=\"file={COURSE_DIR}audio/ListeningComprehension.mp3&amp;autostart=true\"></embed>\n    </span></div>\n\n            <br>\n        </td>\n        <td colspan=\"1\" rowspan=\"3\"><br>\n            <img style=\"width: 300px; height: 341px; float: right;\" alt=\"image\"\n                 src=\"{COURSE_DIR}images/diagrams/head_olfactory_nerve.png \"><br></td>\n    </tr>\n    <tr>\n        <td colspan=\"1\" rowspan=\"1\">\n            <img style=\"width: 180px; height: 271px;\" alt=\"trainer\"\n                 src=\"{COURSE_DIR}images/trainer/trainer_glasses.png\"><br></td>\n    </tr>\n    <tr>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n'),(12,'TemplateTitleVideo','TemplateTitleVideoDescription','video.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 720px; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td style=\"width: 50%; vertical-align: top;\">\n            <div style=\"text-align: center;\" id=\"player810625-parent\">\n                <div style=\"border-style: none; overflow: hidden; width: 320px; height: 240px; background-color: rgb(220, 220, 220);\">\n                    <div id=\"player810625\">\n                        <div id=\"player810625-config\"\n                             style=\"overflow: hidden; display: none; visibility: hidden; width: 0px; height: 0px;\">\n                            url={REL_PATH}main/default_course_document/video/flv/example.flv width=320 height=240\n                            loop=false play=false downloadable=false fullscreen=true displayNavigation=true\n                            displayDigits=true align=left dispPlaylist=none playlistThumbs=false\n                        </div>\n                    </div>\n                    <embed\n                            type=\"application/x-shockwave-flash\"\n                            src=\"{REL_PATH}main/inc/lib/mediaplayer/player.swf\"\n                            width=\"320\"\n                            height=\"240\"\n                            id=\"single\"\n                            name=\"single\"\n                            quality=\"high\"\n                            allowfullscreen=\"true\"\n                            flashvars=\"width=320&height=240&autostart=false&file={REL_PATH}main/default_course_document/video/flv/example.flv&repeat=false&image=&showdownload=false&link={REL_PATH}main/default_course_document/video/flv/example.flv&showdigits=true&shownavigation=true&logo=\"\n                    />\n                </div>\n            </div>\n        </td>\n        <td style=\"background: transparent url({IMG_DIR}faded_grey.png) repeat scroll center top; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; vertical-align: top; width: 50%;\">\n            <h3><br>\n            </h3>\n            <h3>Lorem ipsum dolor sit amet</h3>\n            <ul>\n                <li>consectetur adipisicing elit</li>\n                <li>sed do eiusmod tempor incididunt</li>\n                <li>ut labore et dolore magna aliqua</li>\n            </ul>\n            <h3>Ut enim ad minim veniam</h3>\n            <ul>\n                <li>quis nostrud exercitation ullamco</li>\n                <li>laboris nisi ut aliquip ex ea commodo consequat</li>\n                <li>Excepteur sint occaecat cupidatat non proident</li>\n            </ul>\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n<style type=\"text/css\">body {\n}</style><!-- to fix a strange bug appearing with firefox when editing this template -->\n</body>\n</html>\n'),(13,'TemplateTitleFlash','TemplateTitleFlashDescription','flash.gif','\n<!DOCTYPE html>\n<html>\n<head>\n    {CSS}\n</head>\n<body>\n<table style=\"background: transparent url({IMG_DIR}faded_blue_horizontal.png ) repeat scroll 0% 50%; -moz-background-clip: initial; -moz-background-origin: initial; -moz-background-inline-policy: initial; text-align: left; width: 100%; height: 400px;\"\n       border=\"0\" cellpadding=\"15\" cellspacing=\"6\">\n    <tbody>\n    <tr>\n        <td align=\"center\">\n            <embed width=\"700\" height=\"300\" type=\"application/x-shockwave-flash\"\n                   pluginspage=\"http://www.macromedia.com/go/getflashplayer\"\n                   src=\"{COURSE_DIR}flash/SpinEchoSequence.swf\" play=\"true\" loop=\"true\" menu=\"true\"></embed>\n            </span><br/>\n        </td>\n    </tr>\n    </tbody>\n</table>\n<p><br>\n    <br>\n</p>\n</body>\n</html>\n');
/*!40000 ALTER TABLE `system_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'',4,1);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `course_code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `ref_doc` int(11) NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_assigned_log`
--

DROP TABLE IF EXISTS `ticket_assigned_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_assigned_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sys_insert_user_id` int(11) NOT NULL,
  `assigned_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_54B65868700047D2` (`ticket_id`),
  KEY `IDX_54B65868A76ED395` (`user_id`),
  CONSTRAINT `FK_54B65868700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket_ticket` (`id`),
  CONSTRAINT `FK_54B65868A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_assigned_log`
--

LOCK TABLES `ticket_assigned_log` WRITE;
/*!40000 ALTER TABLE `ticket_assigned_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_assigned_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_category`
--

DROP TABLE IF EXISTS `ticket_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `total_tickets` int(11) NOT NULL,
  `course_required` tinyint(1) NOT NULL,
  `sys_insert_user_id` int(11) NOT NULL,
  `sys_insert_datetime` datetime NOT NULL,
  `sys_lastedit_user_id` int(11) DEFAULT NULL,
  `sys_lastedit_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8325E540166D1F9C` (`project_id`),
  CONSTRAINT `FK_8325E540166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `ticket_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_category`
--

LOCK TABLES `ticket_category` WRITE;
/*!40000 ALTER TABLE `ticket_category` DISABLE KEYS */;
INSERT INTO `ticket_category` VALUES (1,1,'Enrollment','Tickets about enrollment',0,0,1,'2020-05-21 15:43:32',NULL,NULL),(2,1,'General information','Tickets about general information',0,0,1,'2020-05-21 15:43:32',NULL,NULL),(3,1,'Requests and paperwork','Tickets about requests and paperwork',0,0,1,'2020-05-21 15:43:32',NULL,NULL),(4,1,'Academic Incidents','Tickets about academic incidents, like exams, practices, tasks, etc.',0,0,1,'2020-05-21 15:43:32',NULL,NULL),(5,1,'Virtual campus','Tickets about virtual campus',0,0,1,'2020-05-21 15:43:32',NULL,NULL),(6,1,'Online evaluation','Tickets about online evaluation',0,1,1,'2020-05-21 15:43:32',NULL,NULL);
/*!40000 ALTER TABLE `ticket_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_category_rel_user`
--

DROP TABLE IF EXISTS `ticket_category_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_category_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5B8A98712469DE2` (`category_id`),
  KEY `IDX_5B8A987A76ED395` (`user_id`),
  CONSTRAINT `FK_5B8A98712469DE2` FOREIGN KEY (`category_id`) REFERENCES `ticket_category` (`id`),
  CONSTRAINT `FK_5B8A987A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_category_rel_user`
--

LOCK TABLES `ticket_category_rel_user` WRITE;
/*!40000 ALTER TABLE `ticket_category_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_category_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_message`
--

DROP TABLE IF EXISTS `ticket_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sys_insert_user_id` int(11) NOT NULL,
  `sys_insert_datetime` datetime NOT NULL,
  `sys_lastedit_user_id` int(11) DEFAULT NULL,
  `sys_lastedit_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BA71692D700047D2` (`ticket_id`),
  CONSTRAINT `FK_BA71692D700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket_ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_message`
--

LOCK TABLES `ticket_message` WRITE;
/*!40000 ALTER TABLE `ticket_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_message_attachments`
--

DROP TABLE IF EXISTS `ticket_message_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_message_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` longtext COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `sys_insert_user_id` int(11) NOT NULL,
  `sys_insert_datetime` datetime NOT NULL,
  `sys_lastedit_user_id` int(11) DEFAULT NULL,
  `sys_lastedit_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_70BF9E26700047D2` (`ticket_id`),
  KEY `IDX_70BF9E26537A1329` (`message_id`),
  CONSTRAINT `FK_70BF9E26537A1329` FOREIGN KEY (`message_id`) REFERENCES `ticket_message` (`id`),
  CONSTRAINT `FK_70BF9E26700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket_ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_message_attachments`
--

LOCK TABLES `ticket_message_attachments` WRITE;
/*!40000 ALTER TABLE `ticket_message_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_message_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_priority`
--

DROP TABLE IF EXISTS `ticket_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urgency` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sys_insert_user_id` int(11) NOT NULL,
  `sys_insert_datetime` datetime NOT NULL,
  `sys_lastedit_user_id` int(11) DEFAULT NULL,
  `sys_lastedit_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_priority`
--

LOCK TABLES `ticket_priority` WRITE;
/*!40000 ALTER TABLE `ticket_priority` DISABLE KEYS */;
INSERT INTO `ticket_priority` VALUES (1,'Normal','NRM',NULL,'','',1,'2020-05-21 15:43:32',NULL,NULL),(2,'High','HGH',NULL,'','',1,'2020-05-21 15:43:32',NULL,NULL),(3,'Low','LOW',NULL,'','',1,'2020-05-21 15:43:32',NULL,NULL);
/*!40000 ALTER TABLE `ticket_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_project`
--

DROP TABLE IF EXISTS `ticket_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `other_area` int(11) DEFAULT NULL,
  `sys_insert_user_id` int(11) NOT NULL,
  `sys_insert_datetime` datetime NOT NULL,
  `sys_lastedit_user_id` int(11) DEFAULT NULL,
  `sys_lastedit_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_project`
--

LOCK TABLES `ticket_project` WRITE;
/*!40000 ALTER TABLE `ticket_project` DISABLE KEYS */;
INSERT INTO `ticket_project` VALUES (1,'Ticket System',NULL,NULL,NULL,1,'2020-05-21 15:43:32',NULL,NULL);
/*!40000 ALTER TABLE `ticket_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_status`
--

DROP TABLE IF EXISTS `ticket_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_status`
--

LOCK TABLES `ticket_status` WRITE;
/*!40000 ALTER TABLE `ticket_status` DISABLE KEYS */;
INSERT INTO `ticket_status` VALUES (1,'NAT','New',NULL),(2,'PND','Pending',NULL),(3,'XCF','Unconfirmed',NULL),(4,'CLS','Close',NULL),(5,'REE','Forwarded',NULL);
/*!40000 ALTER TABLE `ticket_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_ticket`
--

DROP TABLE IF EXISTS `ticket_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `priority_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci,
  `personal_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `assigned_last_user` int(11) DEFAULT NULL,
  `total_messages` int(11) NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `sys_insert_user_id` int(11) NOT NULL,
  `sys_insert_datetime` datetime NOT NULL,
  `sys_lastedit_user_id` int(11) DEFAULT NULL,
  `sys_lastedit_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EDE2C768166D1F9C` (`project_id`),
  KEY `IDX_EDE2C76812469DE2` (`category_id`),
  KEY `IDX_EDE2C768497B19F9` (`priority_id`),
  KEY `IDX_EDE2C768591CC992` (`course_id`),
  KEY `IDX_EDE2C768613FECDF` (`session_id`),
  KEY `IDX_EDE2C7686BF700BD` (`status_id`),
  CONSTRAINT `FK_EDE2C76812469DE2` FOREIGN KEY (`category_id`) REFERENCES `ticket_category` (`id`),
  CONSTRAINT `FK_EDE2C768166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `ticket_project` (`id`),
  CONSTRAINT `FK_EDE2C768497B19F9` FOREIGN KEY (`priority_id`) REFERENCES `ticket_priority` (`id`),
  CONSTRAINT `FK_EDE2C768591CC992` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK_EDE2C768613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  CONSTRAINT `FK_EDE2C7686BF700BD` FOREIGN KEY (`status_id`) REFERENCES `ticket_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_ticket`
--

LOCK TABLES `ticket_ticket` WRITE;
/*!40000 ALTER TABLE `ticket_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_course_ranking`
--

DROP TABLE IF EXISTS `track_course_ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_course_ranking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  `accesses` int(11) NOT NULL,
  `total_score` int(11) NOT NULL,
  `users` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tcc_cid` (`c_id`),
  KEY `idx_tcc_sid` (`session_id`),
  KEY `idx_tcc_urlid` (`url_id`),
  KEY `idx_tcc_creation_date` (`creation_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_course_ranking`
--

LOCK TABLES `track_course_ranking` WRITE;
/*!40000 ALTER TABLE `track_course_ranking` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_course_ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_access`
--

DROP TABLE IF EXISTS `track_e_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_access` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_user_id` int(11) DEFAULT NULL,
  `access_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `access_tool` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_session_id` int(11) NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`access_id`),
  KEY `access_user_id` (`access_user_id`),
  KEY `access_c_id` (`c_id`),
  KEY `access_session_id` (`access_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_access`
--

LOCK TABLES `track_e_access` WRITE;
/*!40000 ALTER TABLE `track_e_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_attempt`
--

DROP TABLE IF EXISTS `track_e_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exe_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teacher_comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `marks` double NOT NULL,
  `c_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `tms` datetime DEFAULT NULL,
  `session_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course` (`c_id`),
  KEY `exe_id` (`exe_id`),
  KEY `user_id` (`user_id`),
  KEY `question_id` (`question_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_attempt`
--

LOCK TABLES `track_e_attempt` WRITE;
/*!40000 ALTER TABLE `track_e_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_attempt_coeff`
--

DROP TABLE IF EXISTS `track_e_attempt_coeff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_attempt_coeff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attempt_id` int(11) NOT NULL,
  `marks_coeff` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_attempt_coeff`
--

LOCK TABLES `track_e_attempt_coeff` WRITE;
/*!40000 ALTER TABLE `track_e_attempt_coeff` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_attempt_coeff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_attempt_recording`
--

DROP TABLE IF EXISTS `track_e_attempt_recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_attempt_recording` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exe_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `marks` int(11) NOT NULL,
  `insert_date` datetime NOT NULL,
  `author` int(11) NOT NULL,
  `teacher_comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exe_id` (`exe_id`),
  KEY `question_id` (`question_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_attempt_recording`
--

LOCK TABLES `track_e_attempt_recording` WRITE;
/*!40000 ALTER TABLE `track_e_attempt_recording` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_attempt_recording` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_course_access`
--

DROP TABLE IF EXISTS `track_e_course_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_course_access` (
  `course_access_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `login_course_date` datetime NOT NULL,
  `logout_course_date` datetime DEFAULT NULL,
  `counter` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`course_access_id`),
  KEY `course` (`c_id`),
  KEY `user_id` (`user_id`),
  KEY `login_course_date` (`login_course_date`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_course_access`
--

LOCK TABLES `track_e_course_access` WRITE;
/*!40000 ALTER TABLE `track_e_course_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_course_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_default`
--

DROP TABLE IF EXISTS `track_e_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_default` (
  `default_id` int(11) NOT NULL AUTO_INCREMENT,
  `default_user_id` int(11) NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `default_date` datetime DEFAULT NULL,
  `default_event_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_value_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`default_id`),
  KEY `course` (`c_id`),
  KEY `session` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_default`
--

LOCK TABLES `track_e_default` WRITE;
/*!40000 ALTER TABLE `track_e_default` DISABLE KEYS */;
INSERT INTO `track_e_default` VALUES (1,0,0,'2020-05-21 15:43:33','user_created','user_id','1',0),(2,0,0,'2020-05-21 15:43:33','user_created','user_id','2',0),(3,1,0,'2020-05-21 15:59:31','settings_changed','settings_category','Plugins',0),(4,1,0,'2020-05-21 16:03:35','platform_lng_changed','default_platform_language','brazilian',0);
/*!40000 ALTER TABLE `track_e_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_downloads`
--

DROP TABLE IF EXISTS `track_e_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_downloads` (
  `down_id` int(11) NOT NULL AUTO_INCREMENT,
  `down_user_id` int(11) DEFAULT NULL,
  `down_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `down_doc_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `down_session_id` int(11) NOT NULL,
  PRIMARY KEY (`down_id`),
  KEY `idx_ted_user_id` (`down_user_id`),
  KEY `idx_ted_c_id` (`c_id`),
  KEY `down_session_id` (`down_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_downloads`
--

LOCK TABLES `track_e_downloads` WRITE;
/*!40000 ALTER TABLE `track_e_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_exercises`
--

DROP TABLE IF EXISTS `track_e_exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_exercises` (
  `exe_id` int(11) NOT NULL AUTO_INCREMENT,
  `exe_user_id` int(11) DEFAULT NULL,
  `exe_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `exe_exo_id` int(11) NOT NULL,
  `exe_result` double NOT NULL,
  `exe_weighting` double NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `data_tracking` longtext COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `steps_counter` smallint(6) NOT NULL,
  `session_id` smallint(6) NOT NULL,
  `orig_lp_id` int(11) NOT NULL,
  `orig_lp_item_id` int(11) NOT NULL,
  `exe_duration` int(11) NOT NULL,
  `expired_time_control` datetime DEFAULT NULL,
  `orig_lp_item_view_id` int(11) NOT NULL,
  `questions_to_check` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`exe_id`),
  KEY `idx_tee_user_id` (`exe_user_id`),
  KEY `idx_tee_c_id` (`c_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_exercises`
--

LOCK TABLES `track_e_exercises` WRITE;
/*!40000 ALTER TABLE `track_e_exercises` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_hotpotatoes`
--

DROP TABLE IF EXISTS `track_e_hotpotatoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_hotpotatoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exe_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exe_user_id` int(11) DEFAULT NULL,
  `exe_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `exe_result` smallint(6) NOT NULL,
  `exe_weighting` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tehp_user_id` (`exe_user_id`),
  KEY `idx_tehp_c_id` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_hotpotatoes`
--

LOCK TABLES `track_e_hotpotatoes` WRITE;
/*!40000 ALTER TABLE `track_e_hotpotatoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_hotpotatoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_hotspot`
--

DROP TABLE IF EXISTS `track_e_hotspot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_hotspot` (
  `hotspot_id` int(11) NOT NULL AUTO_INCREMENT,
  `hotspot_user_id` int(11) NOT NULL,
  `hotspot_course_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `hotspot_exe_id` int(11) NOT NULL,
  `hotspot_question_id` int(11) NOT NULL,
  `hotspot_answer_id` int(11) NOT NULL,
  `hotspot_correct` tinyint(1) NOT NULL,
  `hotspot_coordinate` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hotspot_id`),
  KEY `hotspot_course_code` (`hotspot_course_code`),
  KEY `hotspot_user_id` (`hotspot_user_id`),
  KEY `hotspot_exe_id` (`hotspot_exe_id`),
  KEY `hotspot_question_id` (`hotspot_question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_hotspot`
--

LOCK TABLES `track_e_hotspot` WRITE;
/*!40000 ALTER TABLE `track_e_hotspot` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_hotspot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_item_property`
--

DROP TABLE IF EXISTS `track_e_item_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_item_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `item_property_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `progress` int(11) NOT NULL,
  `lastedit_date` datetime NOT NULL,
  `lastedit_user_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`,`item_property_id`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_item_property`
--

LOCK TABLES `track_e_item_property` WRITE;
/*!40000 ALTER TABLE `track_e_item_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_item_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_lastaccess`
--

DROP TABLE IF EXISTS `track_e_lastaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_lastaccess` (
  `access_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `access_user_id` int(11) DEFAULT NULL,
  `access_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `access_tool` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`access_id`),
  KEY `access_user_id` (`access_user_id`),
  KEY `access_c_id` (`c_id`),
  KEY `access_session_id` (`access_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_lastaccess`
--

LOCK TABLES `track_e_lastaccess` WRITE;
/*!40000 ALTER TABLE `track_e_lastaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_lastaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_links`
--

DROP TABLE IF EXISTS `track_e_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_links` (
  `links_id` int(11) NOT NULL AUTO_INCREMENT,
  `links_user_id` int(11) DEFAULT NULL,
  `links_date` datetime NOT NULL,
  `c_id` int(11) NOT NULL,
  `links_link_id` int(11) NOT NULL,
  `links_session_id` int(11) NOT NULL,
  PRIMARY KEY (`links_id`),
  KEY `idx_tel_c_id` (`c_id`),
  KEY `idx_tel_user_id` (`links_user_id`),
  KEY `links_session_id` (`links_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_links`
--

LOCK TABLES `track_e_links` WRITE;
/*!40000 ALTER TABLE `track_e_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_login`
--

DROP TABLE IF EXISTS `track_e_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_user_id` int(11) NOT NULL,
  `login_date` datetime NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `logout_date` datetime DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  KEY `login_user_id` (`login_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_login`
--

LOCK TABLES `track_e_login` WRITE;
/*!40000 ALTER TABLE `track_e_login` DISABLE KEYS */;
INSERT INTO `track_e_login` VALUES (1,1,'2020-05-21 15:51:28','192.168.96.1','2020-05-21 16:00:46'),(2,1,'2020-05-21 16:01:59','192.168.112.1','2020-05-21 16:04:11'),(3,1,'2020-05-21 16:04:20','192.168.112.1','2020-05-21 16:05:43');
/*!40000 ALTER TABLE `track_e_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_online`
--

DROP TABLE IF EXISTS `track_e_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_online` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_user_id` int(11) NOT NULL,
  `login_date` datetime NOT NULL,
  `user_ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `c_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `access_url_id` int(11) NOT NULL,
  PRIMARY KEY (`login_id`),
  KEY `course` (`c_id`),
  KEY `login_user_id` (`login_user_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_online`
--

LOCK TABLES `track_e_online` WRITE;
/*!40000 ALTER TABLE `track_e_online` DISABLE KEYS */;
INSERT INTO `track_e_online` VALUES (1,1,'2020-05-21 16:05:43','192.168.112.1',0,0,1);
/*!40000 ALTER TABLE `track_e_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_open`
--

DROP TABLE IF EXISTS `track_e_open`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_open` (
  `open_id` int(11) NOT NULL AUTO_INCREMENT,
  `open_remote_host` longtext COLLATE utf8_unicode_ci NOT NULL,
  `open_agent` longtext COLLATE utf8_unicode_ci NOT NULL,
  `open_referer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `open_date` datetime NOT NULL,
  PRIMARY KEY (`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_open`
--

LOCK TABLES `track_e_open` WRITE;
/*!40000 ALTER TABLE `track_e_open` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_open` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_e_uploads`
--

DROP TABLE IF EXISTS `track_e_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_e_uploads` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_user_id` int(11) DEFAULT NULL,
  `upload_date` datetime NOT NULL,
  `upload_cours_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `upload_work_id` int(11) NOT NULL,
  `upload_session_id` int(11) NOT NULL,
  PRIMARY KEY (`upload_id`),
  KEY `course` (`c_id`),
  KEY `upload_user_id` (`upload_user_id`),
  KEY `upload_cours_id` (`upload_cours_id`),
  KEY `upload_session_id` (`upload_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_e_uploads`
--

LOCK TABLES `track_e_uploads` WRITE;
/*!40000 ALTER TABLE `track_e_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_e_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_stored_values`
--

DROP TABLE IF EXISTS `track_stored_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_stored_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sco_id` int(11) NOT NULL,
  `course_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sv_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `sv_value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`sco_id`,`course_id`,`sv_key`),
  KEY `user_sco_course_sv` (`user_id`,`sco_id`,`course_id`,`sv_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_stored_values`
--

LOCK TABLES `track_stored_values` WRITE;
/*!40000 ALTER TABLE `track_stored_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_stored_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_stored_values_stack`
--

DROP TABLE IF EXISTS `track_stored_values_stack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_stored_values_stack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sco_id` int(11) NOT NULL,
  `stack_order` int(11) NOT NULL,
  `course_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `sv_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `sv_value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`sco_id`,`course_id`,`sv_key`,`stack_order`),
  KEY `user_sco_course_sv_stack` (`user_id`,`sco_id`,`course_id`,`sv_key`,`stack_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_stored_values_stack`
--

LOCK TABLES `track_stored_values_stack` WRITE;
/*!40000 ALTER TABLE `track_stored_values_stack` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_stored_values_stack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `lastname` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `profile_completed` tinyint(1) DEFAULT NULL,
  `auth_source` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `official_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture_uri` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `competences` longtext COLLATE utf8_unicode_ci,
  `diplomas` longtext COLLATE utf8_unicode_ci,
  `openarea` longtext COLLATE utf8_unicode_ci,
  `teach` longtext COLLATE utf8_unicode_ci,
  `productions` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_date` datetime NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hr_dept_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`),
  KEY `idx_user_uid` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'admin','admin','webmaster@localhost.localdomain','webmaster@localhost.localdomain',0,1,0,0,NULL,NULL,'Doe','John','$2y$04$7vbJPxP/ITfho4q4LuBoIexeheL3Cn8T6oN2rZ/XBlhn5dcJ/uE2y','(000) 001 02 03','','f454b90678d33900a1903dd58954619660a55fd3','2020-05-21 16:05:43',NULL,NULL,NULL,NULL,'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}',NULL,'platform',1,'ADMIN','',0,NULL,NULL,NULL,NULL,NULL,'brazilian','2020-05-21 15:43:33',NULL,1,'http://',NULL,0),(2,2,'anon','anon','anonymous@localhost','anonymous@localhost',0,1,0,0,NULL,NULL,'Anonymous','Joe','$2y$04$pTOVhs5drVaNEbOSB9J0P.Rsd9raXWeMe/aleGacKpRBOf86S0gCO','','','ef9c88cf4c493dc4b28550342d203c6cfaa8a10a',NULL,NULL,NULL,NULL,NULL,'a:0:{}',NULL,'platform',6,'anonymous','',0,NULL,NULL,NULL,NULL,NULL,'english','2020-05-21 15:43:33',NULL,1,NULL,NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_api_key`
--

DROP TABLE IF EXISTS `user_api_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_api_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `api_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `api_service` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `api_end_point` longtext COLLATE utf8_unicode_ci,
  `created_date` datetime DEFAULT NULL,
  `validity_start_date` datetime DEFAULT NULL,
  `validity_end_date` datetime DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_user_api_keys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_api_key`
--

LOCK TABLES `user_api_key` WRITE;
/*!40000 ALTER TABLE `user_api_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_api_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_course_category`
--

DROP TABLE IF EXISTS `user_course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_course_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_c_cat_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_course_category`
--

LOCK TABLES `user_course_category` WRITE;
/*!40000 ALTER TABLE `user_course_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_friend_relation_type`
--

DROP TABLE IF EXISTS `user_friend_relation_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_friend_relation_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_friend_relation_type`
--

LOCK TABLES `user_friend_relation_type` WRITE;
/*!40000 ALTER TABLE `user_friend_relation_type` DISABLE KEYS */;
INSERT INTO `user_friend_relation_type` VALUES (1,'SocialUnknow'),(2,'SocialParent'),(3,'SocialFriend'),(4,'SocialGoodFriend'),(5,'SocialEnemy'),(6,'SocialDeleted');
/*!40000 ALTER TABLE `user_friend_relation_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rel_course_vote`
--

DROP TABLE IF EXISTS `user_rel_course_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rel_course_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ucv_cid` (`c_id`),
  KEY `idx_ucv_uid` (`user_id`),
  KEY `idx_ucv_cuid` (`user_id`,`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rel_course_vote`
--

LOCK TABLES `user_rel_course_vote` WRITE;
/*!40000 ALTER TABLE `user_rel_course_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rel_course_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rel_event_type`
--

DROP TABLE IF EXISTS `user_rel_event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rel_event_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `event_type_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_name_index` (`event_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rel_event_type`
--

LOCK TABLES `user_rel_event_type` WRITE;
/*!40000 ALTER TABLE `user_rel_event_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rel_event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rel_tag`
--

DROP TABLE IF EXISTS `user_rel_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rel_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_urt_uid` (`user_id`),
  KEY `idx_urt_tid` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rel_tag`
--

LOCK TABLES `user_rel_tag` WRITE;
/*!40000 ALTER TABLE `user_rel_tag` DISABLE KEYS */;
INSERT INTO `user_rel_tag` VALUES (1,1,1);
/*!40000 ALTER TABLE `user_rel_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rel_user`
--

DROP TABLE IF EXISTS `user_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rel_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `friend_user_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  `last_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_rel_user__user` (`user_id`),
  KEY `idx_user_rel_user__friend_user` (`friend_user_id`),
  KEY `idx_user_rel_user__user_friend_user` (`user_id`,`friend_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rel_user`
--

LOCK TABLES `user_rel_user` WRITE;
/*!40000 ALTER TABLE `user_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `group_type` int(11) NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visibility` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `allow_members_leave_group` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_rel_course`
--

DROP TABLE IF EXISTS `usergroup_rel_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_rel_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_rel_course`
--

LOCK TABLES `usergroup_rel_course` WRITE;
/*!40000 ALTER TABLE `usergroup_rel_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_rel_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_rel_question`
--

DROP TABLE IF EXISTS `usergroup_rel_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_rel_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `usergroup_id` int(11) NOT NULL,
  `coefficient` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_rel_question`
--

LOCK TABLES `usergroup_rel_question` WRITE;
/*!40000 ALTER TABLE `usergroup_rel_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_rel_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_rel_session`
--

DROP TABLE IF EXISTS `usergroup_rel_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_rel_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_rel_session`
--

LOCK TABLES `usergroup_rel_session` WRITE;
/*!40000 ALTER TABLE `usergroup_rel_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_rel_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_rel_user`
--

DROP TABLE IF EXISTS `usergroup_rel_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_rel_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `usergroup_id` int(11) DEFAULT NULL,
  `relation_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_739515A9A76ED395` (`user_id`),
  KEY `IDX_739515A9D2112630` (`usergroup_id`),
  CONSTRAINT `FK_739515A9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_739515A9D2112630` FOREIGN KEY (`usergroup_id`) REFERENCES `usergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_rel_user`
--

LOCK TABLES `usergroup_rel_user` WRITE;
/*!40000 ALTER TABLE `usergroup_rel_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_rel_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_rel_usergroup`
--

DROP TABLE IF EXISTS `usergroup_rel_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_rel_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `subgroup_id` int(11) NOT NULL,
  `relation_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_rel_usergroup`
--

LOCK TABLES `usergroup_rel_usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup_rel_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup_rel_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (12,'111'),(9,'20160302133200'),(30,'20160304151300'),(17,'20160315155700'),(29,'20160330103045'),(37,'20160331103600'),(15,'20160405112100'),(34,'20160418093800'),(24,'20160418113000'),(6,'20160421112900'),(22,'20160519201900'),(11,'20160603113100'),(33,'20160610142700'),(38,'20160623143200'),(35,'20160628220000'),(4,'20160701110000'),(8,'20160705190000'),(32,'20160705192000'),(36,'20160706145000'),(19,'20160706182000'),(28,'20160712150000'),(31,'20160713180000'),(18,'20160715122300'),(2,'20160727122700'),(16,'20160727155600'),(1,'20160804174600'),(10,'20160808154200'),(3,'20160808160000'),(20,'20160825155200'),(21,'20160907140300'),(23,'20160907150300'),(27,'20160929120000'),(13,'20160930144400'),(26,'20161028123400'),(5,'20170522120000'),(25,'20170608164500'),(14,'20171213092400'),(7,'20171227120000');
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `mysql`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysql` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mysql`;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columns_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns_priv`
--

LOCK TABLES `columns_priv` WRITE;
/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` VALUES ('localhost','performance_schema','mysql.session','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N'),('localhost','sys','mysql.sys','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','Y'),('%','chamilo','chamilo','Y','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine_cost`
--

DROP TABLE IF EXISTS `engine_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine_cost` (
  `engine_name` varchar(64) NOT NULL,
  `device_type` int(11) NOT NULL,
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`cost_name`,`engine_name`,`device_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine_cost`
--

LOCK TABLES `engine_cost` WRITE;
/*!40000 ALTER TABLE `engine_cost` DISABLE KEYS */;
INSERT INTO `engine_cost` VALUES ('default',0,'io_block_read_cost',NULL,'2020-05-21 15:32:47',NULL),('default',0,'memory_block_read_cost',NULL,'2020-05-21 15:32:47',NULL);
/*!40000 ALTER TABLE `engine_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `body` longblob NOT NULL,
  `definer` char(93) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `execute_at` datetime DEFAULT NULL,
  `interval_value` int(11) DEFAULT NULL,
  `interval_field` enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_executed` datetime DEFAULT NULL,
  `starts` datetime DEFAULT NULL,
  `ends` datetime DEFAULT NULL,
  `status` enum('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL DEFAULT 'ENABLED',
  `on_completion` enum('DROP','PRESERVE') NOT NULL DEFAULT 'DROP',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `originator` int(10) unsigned NOT NULL,
  `time_zone` char(64) CHARACTER SET latin1 NOT NULL DEFAULT 'SYSTEM',
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `func`
--

LOCK TABLES `func` WRITE;
/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gtid_executed`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `gtid_executed` (
  `source_uuid` char(36) NOT NULL COMMENT 'uuid of the source where the transaction was originally executed.',
  `interval_start` bigint(20) NOT NULL COMMENT 'First number of interval.',
  `interval_end` bigint(20) NOT NULL COMMENT 'Last number of interval.',
  PRIMARY KEY (`source_uuid`,`interval_start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_category` (
  `help_category_id` smallint(5) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='help categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_category`
--

LOCK TABLES `help_category` WRITE;
/*!40000 ALTER TABLE `help_category` DISABLE KEYS */;
INSERT INTO `help_category` VALUES (0,'Contents',0,''),(1,'Help Metadata',0,''),(2,'Data Types',0,''),(3,'Administration',0,''),(4,'Procedures',0,''),(5,'Language Structure',0,''),(6,'Geographic Features',0,''),(7,'MBR',6,''),(8,'WKT',6,''),(9,'Functions',0,''),(10,'Comparison Operators',9,''),(11,'Logical Operators',9,''),(12,'Control Flow Functions',9,''),(13,'String Functions',9,''),(14,'Numeric Functions',9,''),(15,'Date and Time Functions',9,''),(16,'Bit Functions',9,''),(17,'Encryption Functions',9,''),(18,'Locking Functions',9,''),(19,'Information Functions',9,''),(20,'Spatial Functions',9,''),(21,'WKT Functions',20,''),(22,'WKB Functions',20,''),(23,'Geometry Constructors',20,''),(24,'Geometry Property Functions',20,''),(25,'Point Property Functions',20,''),(26,'LineString Property Functions',20,''),(27,'Polygon Property Functions',20,''),(28,'GeometryCollection Property Functions',20,''),(29,'Geometry Relation Functions',20,''),(30,'MBR Functions',20,''),(31,'GROUP BY Functions and Modifiers',9,''),(32,'Miscellaneous Functions',9,''),(33,'Data Definition',0,''),(34,'Data Manipulation',0,''),(35,'Transactions',0,''),(36,'Compound Statements',0,''),(37,'Account Management',0,''),(38,'Table Maintenance',0,''),(39,'User-Defined Functions',0,''),(40,'Plugins',0,''),(41,'Utility',0,''),(42,'Storage Engines',0,'');
/*!40000 ALTER TABLE `help_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (282,'(JSON'),(283,'->'),(285,'->>'),(52,'<>'),(620,'ACCOUNT'),(415,'ACTION'),(46,'ADD'),(108,'AES_DECRYPT'),(109,'AES_ENCRYPT'),(347,'AFTER'),(97,'AGAINST'),(652,'AGGREGATE'),(348,'ALGORITHM'),(482,'ALL'),(47,'ALTER'),(6,'ANALYSE'),(349,'ANALYZE'),(53,'AND'),(319,'ANY_VALUE'),(416,'ARCHIVE'),(216,'AREA'),(483,'AS'),(181,'ASBINARY'),(310,'ASC'),(183,'ASTEXT'),(182,'ASWKB'),(184,'ASWKT'),(404,'AT'),(508,'AUTOCOMMIT'),(440,'AUTOEXTEND_SIZE'),(350,'AUTO_INCREMENT'),(351,'AVG_ROW_LENGTH'),(536,'BEFORE'),(509,'BEGIN'),(54,'BETWEEN'),(74,'BIGINT'),(104,'BINARY'),(677,'BINLOG'),(14,'BOOL'),(15,'BOOLEAN'),(68,'BOTH'),(408,'BTREE'),(231,'BUFFER'),(311,'BY'),(39,'BYTE'),(8,'CACHE'),(448,'CALL'),(417,'CASCADE'),(59,'CASE'),(600,'CATALOG_NAME'),(77,'CEIL'),(78,'CEILING'),(217,'CENTROID'),(510,'CHAIN'),(352,'CHANGE'),(541,'CHANNEL'),(40,'CHAR'),(36,'CHARACTER'),(660,'CHARSET'),(353,'CHECK'),(354,'CHECKSUM'),(621,'CIPHER'),(601,'CLASS_ORIGIN'),(633,'CLIENT'),(454,'CLOSE'),(355,'COALESCE'),(680,'CODE'),(320,'COLLATE'),(662,'COLLATION'),(356,'COLUMN'),(357,'COLUMNS'),(602,'COLUMN_NAME'),(328,'COMMENT'),(511,'COMMIT'),(525,'COMMITTED'),(418,'COMPACT'),(329,'COMPLETION'),(419,'COMPRESSED'),(358,'COMPRESSION'),(468,'CONCURRENT'),(596,'CONDITION'),(359,'CONNECTION'),(512,'CONSISTENT'),(360,'CONSTRAINT'),(603,'CONSTRAINT_CATALOG'),(604,'CONSTRAINT_NAME'),(605,'CONSTRAINT_SCHEMA'),(259,'CONTAINS'),(597,'CONTINUE'),(103,'CONVERT'),(232,'CONVEXHULL'),(309,'COUNT'),(48,'CREATE'),(307,'CREATE_DH_PARAMETERS'),(501,'CROSS'),(240,'CROSSES'),(420,'CSV'),(330,'CURRENT_USER'),(594,'CURSOR'),(606,'CURSOR_NAME'),(321,'DATA'),(322,'DATABASE'),(663,'DATABASES'),(399,'DATAFILE'),(33,'DATE'),(105,'DATETIME'),(81,'DATE_ADD'),(82,'DATE_SUB'),(83,'DAY'),(84,'DAY_HOUR'),(85,'DAY_MINUTE'),(86,'DAY_SECOND'),(584,'DEALLOCATE'),(25,'DEC'),(28,'DECIMAL'),(585,'DECLARE'),(2,'DEFAULT'),(575,'DEFAULT_AUTH'),(331,'DEFINER'),(461,'DELAYED'),(361,'DELAY_KEY_WRITE'),(421,'DELETE'),(312,'DESC'),(695,'DESCRIBE'),(685,'DES_KEY_FILE'),(607,'DIAGNOSTICS'),(189,'DIMENSION'),(323,'DIRECTORY'),(332,'DISABLE'),(362,'DISCARD'),(260,'DISJOINT'),(241,'DISTANCE'),(308,'DISTINCT'),(484,'DISTINCTROW'),(333,'DO'),(363,'DROP'),(500,'DUAL'),(485,'DUMPFILE'),(462,'DUPLICATE'),(422,'DYNAMIC'),(60,'ELSE'),(586,'ELSEIF'),(334,'ENABLE'),(469,'ENCLOSED'),(364,'ENCRYPTION'),(61,'END'),(205,'ENDPOINT'),(405,'ENDS'),(365,'ENGINE'),(664,'ENGINES'),(190,'ENVELOPE'),(261,'EQUALS'),(686,'ERROR'),(665,'ERRORS'),(72,'ESCAPE'),(470,'ESCAPED'),(335,'EVENT'),(678,'EVENTS'),(406,'EVERY'),(366,'EXCHANGE'),(583,'EXECUTE'),(403,'EXISTS'),(598,'EXIT'),(98,'EXPANSION'),(622,'EXPIRE'),(696,'EXPLAIN'),(687,'EXPORT'),(650,'EXTENDED'),(441,'EXTENT_SIZE'),(218,'EXTERIORRING'),(284,'EXTRACTION)'),(12,'FALSE'),(648,'FAST'),(423,'FEDERATED'),(595,'FETCH'),(471,'FIELDS'),(634,'FILE'),(442,'FILE_BLOCK_SIZE'),(565,'FILTER'),(367,'FIRST'),(26,'FIXED'),(29,'FLOAT4'),(30,'FLOAT8'),(75,'FLOOR'),(9,'FLUSH'),(486,'FOR'),(502,'FORCE'),(368,'FOREIGN'),(697,'FORMAT'),(69,'FROM'),(424,'FULL'),(369,'FULLTEXT'),(341,'FUNCTION'),(688,'GENERAL'),(114,'GEOMCOLLFROMTEXT'),(144,'GEOMCOLLFROMWKB'),(174,'GEOMETRYCOLLECTION'),(115,'GEOMETRYCOLLECTIONFROMTEXT'),(145,'GEOMETRYCOLLECTIONFROMWKB'),(116,'GEOMETRYFROMTEXT'),(146,'GEOMETRYFROMWKB'),(227,'GEOMETRYN'),(191,'GEOMETRYTYPE'),(117,'GEOMFROMTEXT'),(147,'GEOMFROMWKB'),(608,'GET'),(206,'GLENGTH'),(526,'GLOBAL'),(635,'GRANT'),(666,'GRANTS'),(343,'GROUP'),(455,'HANDLER'),(487,'HAVING'),(425,'HEAP'),(5,'HELP'),(0,'HELP_DATE'),(1,'HELP_VERSION'),(463,'HIGH_PRIORITY'),(409,'HOST'),(667,'HOSTS'),(87,'HOUR'),(88,'HOUR_MINUTE'),(89,'HOUR_SECOND'),(480,'IDENTIFIED'),(64,'IF'),(464,'IGNORE'),(542,'IGNORE_SERVER_IDS'),(370,'IMPORT'),(99,'IN'),(49,'INDEX'),(668,'INDEXES'),(472,'INFILE'),(400,'INITIAL_SIZE'),(286,'INLINE'),(503,'INNER'),(426,'INNODB'),(65,'INSERT'),(371,'INSERT_METHOD'),(656,'INSTALL'),(342,'INSTANCE'),(16,'INT1'),(19,'INT2'),(20,'INT3'),(22,'INT4'),(24,'INT8'),(23,'INTEGER'),(219,'INTERIORRINGN'),(262,'INTERSECTS'),(90,'INTERVAL'),(465,'INTO'),(576,'IO_THREAD'),(55,'IS'),(207,'ISCLOSED'),(192,'ISEMPTY'),(527,'ISOLATION'),(193,'ISSIMPLE'),(623,'ISSUER'),(587,'ITERATE'),(488,'JOIN'),(106,'JSON'),(290,'JSON_APPEND'),(276,'JSON_ARRAY'),(315,'JSON_ARRAYAGG'),(291,'JSON_ARRAY_APPEND'),(292,'JSON_ARRAY_INSERT'),(279,'JSON_CONTAINS'),(280,'JSON_CONTAINS_PATH'),(301,'JSON_DEPTH'),(281,'JSON_EXTRACT'),(293,'JSON_INSERT'),(288,'JSON_KEYS'),(302,'JSON_LENGTH'),(294,'JSON_MERGE'),(295,'JSON_MERGE_PATCH'),(296,'JSON_MERGE_PRESERVE'),(277,'JSON_OBJECT'),(316,'JSON_OBJECTAGG'),(305,'JSON_PRETTY'),(278,'JSON_QUOTE'),(297,'JSON_REMOVE'),(298,'JSON_REPLACE'),(289,'JSON_SEARCH'),(299,'JSON_SET'),(306,'JSON_STORAGE_SIZE'),(303,'JSON_TYPE'),(300,'JSON_UNQUOTE'),(304,'JSON_VALID'),(50,'KEY'),(372,'KEYS'),(373,'KEY_BLOCK_SIZE'),(693,'KILL'),(456,'LAST'),(70,'LEADING'),(588,'LEAVE'),(694,'LEAVES'),(504,'LEFT'),(528,'LEVEL'),(66,'LIKE'),(449,'LIMIT'),(118,'LINEFROMTEXT'),(148,'LINEFROMWKB'),(473,'LINES'),(175,'LINESTRING'),(119,'LINESTRINGFROMTEXT'),(149,'LINESTRINGFROMWKB'),(474,'LOAD'),(475,'LOCAL'),(374,'LOCK'),(344,'LOGFILE'),(537,'LOGS'),(44,'LONG'),(45,'LONGBINARY'),(589,'LOOP'),(450,'LOW_PRIORITY'),(538,'MASTER'),(543,'MASTER_AUTO_POSITION'),(544,'MASTER_BIND'),(545,'MASTER_CONNECT_RETRY'),(546,'MASTER_HEARTBEAT_PERIOD'),(547,'MASTER_HOST'),(548,'MASTER_LOG_FILE'),(549,'MASTER_LOG_POS'),(550,'MASTER_PASSWORD'),(551,'MASTER_PORT'),(552,'MASTER_RETRY_COUNT'),(553,'MASTER_SSL'),(554,'MASTER_SSL_CA'),(555,'MASTER_SSL_CERT'),(556,'MASTER_SSL_CIPHER'),(557,'MASTER_SSL_CRL'),(558,'MASTER_SSL_CRLPATH'),(559,'MASTER_SSL_KEY'),(560,'MASTER_SSL_VERIFY_SERVER_CERT'),(561,'MASTER_TLS_VERSION'),(562,'MASTER_USER'),(100,'MATCH'),(624,'MAX_CONNECTIONS_PER_HOUR'),(625,'MAX_QUERIES_PER_HOUR'),(375,'MAX_ROWS'),(443,'MAX_SIZE'),(626,'MAX_UPDATES_PER_HOUR'),(627,'MAX_USER_CONNECTIONS'),(252,'MBRCONTAINS'),(253,'MBRDISJOINT'),(254,'MBREQUAL'),(255,'MBRINTERSECTS'),(256,'MBROVERLAPS'),(257,'MBRTOUCHES'),(258,'MBRWITHIN'),(649,'MEDIUM'),(489,'MEMORY'),(427,'MERGE'),(609,'MESSAGE_TEXT'),(21,'MIDDLEINT'),(91,'MINUTE'),(92,'MINUTE_SECOND'),(376,'MIN_ROWS'),(120,'MLINEFROMTEXT'),(150,'MLINEFROMWKB'),(76,'MOD'),(101,'MODE'),(377,'MODIFY'),(93,'MONTH'),(122,'MPOINTFROMTEXT'),(152,'MPOINTFROMWKB'),(124,'MPOLYFROMTEXT'),(154,'MPOLYFROMWKB'),(428,'MRG_MYISAM'),(176,'MULTILINESTRING'),(121,'MULTILINESTRINGFROMTEXT'),(151,'MULTILINESTRINGFROMWKB'),(177,'MULTIPOINT'),(123,'MULTIPOINTFROMTEXT'),(153,'MULTIPOINTFROMWKB'),(178,'MULTIPOLYGON'),(125,'MULTIPOLYGONFROMTEXT'),(155,'MULTIPOLYGONFROMWKB'),(669,'MUTEX'),(429,'MYISAM'),(610,'MYSQL_ERRNO'),(324,'NAME'),(661,'NAMES'),(37,'NATIONAL'),(505,'NATURAL'),(38,'NCHAR'),(430,'NDB'),(431,'NDBCLUSTER'),(628,'NEVER'),(457,'NEXT'),(432,'NO'),(444,'NODEGROUP'),(636,'NONE'),(56,'NOT'),(647,'NO_WRITE_TO_BINLOG'),(57,'NULL'),(611,'NUMBER'),(27,'NUMERIC'),(228,'NUMGEOMETRIES'),(220,'NUMINTERIORRINGS'),(208,'NUMPOINTS'),(41,'NVARCHAR'),(490,'OFFSET'),(336,'ON'),(513,'ONLY'),(458,'OPEN'),(378,'OPTIMIZE'),(689,'OPTIMIZER_COSTS'),(637,'OPTION'),(476,'OPTIONALLY'),(345,'OPTIONS'),(58,'OR'),(313,'ORDER'),(506,'OUTER'),(491,'OUTFILE'),(263,'OVERLAPS'),(410,'OWNER'),(379,'PACK_KEYS'),(380,'PARSER'),(433,'PARTIAL'),(381,'PARTITION'),(382,'PARTITIONING'),(698,'PARTITIONS'),(383,'PASSWORD'),(287,'PATH)'),(657,'PLUGIN'),(681,'PLUGINS'),(577,'PLUGIN_DIR'),(179,'POINT'),(126,'POINTFROMTEXT'),(156,'POINTFROMWKB'),(209,'POINTN'),(127,'POLYFROMTEXT'),(157,'POLYFROMWKB'),(180,'POLYGON'),(128,'POLYGONFROMTEXT'),(158,'POLYGONFROMWKB'),(411,'PORT'),(79,'POW'),(80,'POWER'),(31,'PRECISION'),(533,'PREPARE'),(337,'PRESERVE'),(459,'PREV'),(384,'PRIMARY'),(638,'PRIVILEGES'),(7,'PROCEDURE'),(639,'PROCESS'),(670,'PROCESSLIST'),(682,'PROFILE'),(683,'PROFILES'),(645,'PROXY'),(539,'PURGE'),(10,'QUERY'),(451,'QUICK'),(110,'RANDOM_BYTES'),(460,'READ'),(32,'REAL'),(385,'REBUILD'),(534,'RECOVER'),(434,'REDUNDANT'),(435,'REFERENCES'),(690,'RELAY'),(684,'RELAYLOG'),(563,'RELAY_LOG_FILE'),(564,'RELAY_LOG_POS'),(514,'RELEASE'),(640,'RELOAD'),(386,'REMOVE'),(338,'RENAME'),(387,'REORGANIZE'),(388,'REPAIR'),(590,'REPEAT'),(529,'REPEATABLE'),(477,'REPLACE'),(566,'REPLICATE_DO_DB'),(567,'REPLICATE_DO_TABLE'),(568,'REPLICATE_IGNORE_DB'),(569,'REPLICATE_IGNORE_TABLE'),(570,'REPLICATE_REWRITE_DB'),(571,'REPLICATE_WILD_DO_TABLE'),(572,'REPLICATE_WILD_IGNORE_TABLE'),(573,'REPLICATION'),(629,'REQUIRE'),(11,'RESET'),(617,'RESIGNAL'),(438,'RESTRICT'),(592,'RETURN'),(612,'RETURNED_SQLSTATE'),(653,'RETURNS'),(646,'REVOKE'),(507,'RIGHT'),(73,'RLIKE'),(515,'ROLLBACK'),(481,'ROWS'),(613,'ROW_COUNT'),(389,'ROW_FORMAT'),(521,'SAVEPOINT'),(339,'SCHEDULE'),(325,'SCHEMA'),(671,'SCHEMAS'),(614,'SCHEMA_NAME'),(94,'SECOND'),(641,'SECURITY'),(466,'SELECT'),(314,'SEPARATOR'),(3,'SERIAL'),(530,'SERIALIZABLE'),(346,'SERVER'),(531,'SESSION'),(326,'SET'),(111,'SHA'),(112,'SHA1'),(113,'SHA2'),(492,'SHARE'),(672,'SHOW'),(642,'SHUTDOWN'),(619,'SIGNAL'),(107,'SIGNED'),(340,'SLAVE'),(691,'SLOW'),(516,'SNAPSHOT'),(412,'SOCKET'),(654,'SONAME'),(67,'SOUNDS'),(390,'SPATIAL'),(618,'SQLSTATE'),(578,'SQL_AFTER_GTIDS'),(579,'SQL_AFTER_MTS_GAPS'),(580,'SQL_BEFORE_GTIDS'),(493,'SQL_BIG_RESULT'),(494,'SQL_BUFFER_RESULT'),(495,'SQL_CACHE'),(496,'SQL_CALC_FOUND_ROWS'),(540,'SQL_LOG_BIN'),(497,'SQL_NO_CACHE'),(574,'SQL_SLAVE_SKIP_COUNTER'),(498,'SQL_SMALL_RESULT'),(581,'SQL_THREAD'),(194,'SRID'),(630,'SSL'),(517,'START'),(478,'STARTING'),(215,'STARTPOINT'),(407,'STARTS'),(391,'STATS_AUTO_RECALC'),(392,'STATS_PERSISTENT'),(393,'STATS_SAMPLE_PAGES'),(673,'STATUS'),(317,'STD'),(318,'STDDEV'),(582,'STOP'),(679,'STORAGE'),(436,'STORED'),(499,'STRAIGHT_JOIN'),(655,'STRING'),(221,'ST_AREA'),(185,'ST_ASBINARY'),(269,'ST_ASGEOJSON'),(187,'ST_ASTEXT'),(186,'ST_ASWKB'),(188,'ST_ASWKT'),(233,'ST_BUFFER'),(234,'ST_BUFFER_STRATEGY'),(222,'ST_CENTROID'),(242,'ST_CONTAINS'),(235,'ST_CONVEXHULL'),(243,'ST_CROSSES'),(236,'ST_DIFFERENCE'),(195,'ST_DIMENSION'),(244,'ST_DISJOINT'),(245,'ST_DISTANCE'),(271,'ST_DISTANCE_SPHERE'),(210,'ST_ENDPOINT'),(196,'ST_ENVELOPE'),(246,'ST_EQUALS'),(223,'ST_EXTERIORRING'),(265,'ST_GEOHASH'),(129,'ST_GEOMCOLLFROMTEXT'),(159,'ST_GEOMCOLLFROMWKB'),(130,'ST_GEOMETRYCOLLECTIONFROMTEXT'),(160,'ST_GEOMETRYCOLLECTIONFROMWKB'),(131,'ST_GEOMETRYFROMTEXT'),(161,'ST_GEOMETRYFROMWKB'),(229,'ST_GEOMETRYN'),(197,'ST_GEOMETRYTYPE'),(270,'ST_GEOMFROMGEOJSON'),(132,'ST_GEOMFROMTEXT'),(162,'ST_GEOMFROMWKB'),(224,'ST_INTERIORRINGN'),(237,'ST_INTERSECTION'),(247,'ST_INTERSECTS'),(211,'ST_ISCLOSED'),(198,'ST_ISEMPTY'),(199,'ST_ISSIMPLE'),(272,'ST_ISVALID'),(266,'ST_LATFROMGEOHASH'),(133,'ST_LINEFROMTEXT'),(163,'ST_LINEFROMWKB'),(134,'ST_LINESTRINGFROMTEXT'),(164,'ST_LINESTRINGFROMWKB'),(267,'ST_LONGFROMGEOHASH'),(273,'ST_MAKEENVELOPE'),(135,'ST_MLINEFROMTEXT'),(165,'ST_MLINEFROMWKB'),(137,'ST_MPOINTFROMTEXT'),(167,'ST_MPOINTFROMWKB'),(139,'ST_MPOLYFROMTEXT'),(169,'ST_MPOLYFROMWKB'),(136,'ST_MULTILINESTRINGFROMTEXT'),(166,'ST_MULTILINESTRINGFROMWKB'),(138,'ST_MULTIPOINTFROMTEXT'),(168,'ST_MULTIPOINTFROMWKB'),(140,'ST_MULTIPOLYGONFROMTEXT'),(170,'ST_MULTIPOLYGONFROMWKB'),(230,'ST_NUMGEOMETRIES'),(225,'ST_NUMINTERIORRING'),(226,'ST_NUMINTERIORRINGS'),(212,'ST_NUMPOINTS'),(248,'ST_OVERLAPS'),(268,'ST_POINTFROMGEOHASH'),(141,'ST_POINTFROMTEXT'),(171,'ST_POINTFROMWKB'),(213,'ST_POINTN'),(142,'ST_POLYFROMTEXT'),(172,'ST_POLYFROMWKB'),(143,'ST_POLYGONFROMTEXT'),(173,'ST_POLYGONFROMWKB'),(274,'ST_SIMPLIFY'),(200,'ST_SRID'),(214,'ST_STARTPOINT'),(238,'ST_SYMDIFFERENCE'),(249,'ST_TOUCHES'),(239,'ST_UNION'),(275,'ST_VALIDATE'),(250,'ST_WITHIN'),(201,'ST_X'),(202,'ST_Y'),(615,'SUBCLASS_ORIGIN'),(631,'SUBJECT'),(643,'SUPER'),(51,'TABLE'),(523,'TABLES'),(394,'TABLESPACE'),(616,'TABLE_NAME'),(447,'TEMPORARY'),(479,'TERMINATED'),(62,'THEN'),(35,'TIME'),(34,'TIMESTAMP'),(522,'TO'),(251,'TOUCHES'),(699,'TRADITIONAL'),(71,'TRAILING'),(518,'TRANSACTION'),(446,'TRIGGER'),(674,'TRIGGERS'),(13,'TRUE'),(395,'TRUNCATE'),(396,'TYPE'),(532,'UNCOMMITTED'),(599,'UNDO'),(658,'UNINSTALL'),(397,'UNION'),(398,'UNIQUE'),(524,'UNLOCK'),(17,'UNSIGNED'),(591,'UNTIL'),(439,'UPDATE'),(327,'UPGRADE'),(644,'USAGE'),(445,'USE'),(413,'USER'),(692,'USER_RESOURCES'),(651,'USE_FRM'),(452,'USING'),(4,'VALUE'),(467,'VALUES'),(42,'VARCHARACTER'),(659,'VARIABLE'),(675,'VARIABLES'),(43,'VARYING'),(402,'VIEW'),(437,'VIRTUAL'),(401,'WAIT'),(676,'WARNINGS'),(63,'WHEN'),(453,'WHERE'),(593,'WHILE'),(102,'WITH'),(264,'WITHIN'),(519,'WORK'),(414,'WRAPPER'),(520,'WRITE'),(203,'X'),(632,'X509'),(535,'XA'),(204,'Y'),(95,'YEAR'),(96,'YEAR_MONTH'),(18,'ZEROFILL');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_relation` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `help_keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='keyword-topic relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_relation`
--

LOCK TABLES `help_relation` WRITE;
/*!40000 ALTER TABLE `help_relation` DISABLE KEYS */;
INSERT INTO `help_relation` VALUES (0,0),(1,1),(2,2),(487,2),(488,2),(495,2),(498,2),(499,2),(506,2),(507,2),(528,2),(533,2),(565,2),(583,2),(584,2),(2,3),(506,3),(2,4),(528,4),(533,4),(581,4),(582,4),(3,5),(658,5),(4,6),(4,7),(493,7),(503,7),(504,7),(515,7),(516,7),(534,7),(603,7),(615,7),(634,7),(635,7),(5,8),(649,8),(650,8),(652,8),(653,8),(5,9),(650,9),(5,10),(229,10),(650,10),(651,10),(653,10),(5,11),(551,11),(555,11),(653,11),(6,12),(7,12),(6,13),(7,13),(9,14),(10,14),(9,15),(229,15),(9,16),(9,17),(13,17),(15,17),(16,17),(18,17),(19,17),(232,17),(9,18),(13,18),(15,18),(16,18),(18,18),(19,18),(11,19),(12,20),(12,21),(13,22),(13,23),(232,23),(595,23),(15,24),(16,25),(16,26),(506,26),(16,27),(17,28),(232,28),(595,28),(18,29),(19,30),(19,31),(19,32),(595,32),(21,33),(177,33),(179,33),(232,33),(23,34),(213,34),(24,35),(211,35),(232,35),(26,36),(28,36),(487,36),(488,36),(495,36),(498,36),(499,36),(506,36),(531,36),(532,36),(534,36),(600,36),(601,36),(603,36),(607,36),(26,37),(28,37),(26,38),(27,39),(27,40),(232,40),(28,41),(28,42),(28,43),(37,44),(37,45),(46,46),(495,46),(496,46),(508,46),(46,47),(487,47),(488,47),(489,47),(490,47),(491,47),(492,47),(493,47),(494,47),(495,47),(496,47),(497,47),(583,47),(586,47),(46,48),(498,48),(499,48),(500,48),(501,48),(502,48),(503,48),(504,48),(505,48),(506,48),(508,48),(509,48),(510,48),(584,48),(595,48),(603,48),(611,48),(612,48),(613,48),(614,48),(615,48),(616,48),(618,48),(46,49),(495,49),(501,49),(506,49),(514,49),(536,49),(603,49),(629,49),(649,49),(652,49),(46,50),(495,50),(506,50),(507,50),(528,50),(46,51),(495,51),(506,51),(518,51),(522,51),(523,51),(590,51),(591,51),(592,51),(593,51),(594,51),(603,51),(616,51),(643,51),(49,52),(54,53),(68,53),(54,54),(61,55),(62,55),(63,55),(64,55),(62,56),(64,56),(67,56),(498,56),(499,56),(500,56),(584,56),(63,57),(64,57),(507,57),(69,58),(73,59),(566,59),(73,60),(566,60),(73,61),(548,61),(563,61),(566,61),(567,61),(570,61),(571,61),(573,61),(73,62),(566,62),(567,62),(73,63),(566,63),(74,64),(498,64),(499,64),(500,64),(511,64),(512,64),(513,64),(517,64),(518,64),(521,64),(567,64),(583,64),(584,64),(585,64),(92,65),(528,65),(529,65),(530,65),(116,66),(603,66),(609,66),(610,66),(116,67),(122,68),(122,69),(525,69),(534,69),(603,69),(606,69),(609,69),(610,69),(629,69),(639,69),(122,70),(122,71),(127,72),(131,73),(137,74),(137,75),(138,76),(157,76),(144,77),(145,78),(159,79),(160,80),(179,81),(179,82),(179,83),(179,84),(179,85),(179,86),(179,87),(179,88),(179,89),(179,90),(500,90),(583,90),(584,90),(179,91),(179,92),(179,93),(179,94),(179,95),(179,96),(229,97),(229,98),(229,99),(534,99),(606,99),(609,99),(610,99),(629,99),(639,99),(229,100),(229,101),(534,101),(229,102),(495,102),(501,102),(506,102),(583,102),(584,102),(586,102),(650,102),(231,103),(232,103),(232,104),(549,104),(550,104),(604,104),(605,104),(650,104),(232,105),(232,106),(655,106),(656,106),(657,106),(232,107),(242,108),(243,109),(253,110),(254,111),(254,112),(255,113),(279,114),(279,115),(280,116),(280,117),(281,118),(281,119),(282,120),(282,121),(283,122),(283,123),(284,124),(284,125),(285,126),(286,127),(286,128),(287,129),(287,130),(288,131),(288,132),(289,133),(289,134),(290,135),(290,136),(291,137),(291,138),(292,139),(292,140),(293,141),(294,142),(294,143),(295,144),(295,145),(296,146),(296,147),(297,148),(297,149),(298,150),(298,151),(299,152),(299,153),(300,154),(300,155),(301,156),(302,157),(302,158),(303,159),(303,160),(304,161),(304,162),(305,163),(305,164),(306,165),(306,166),(307,167),(307,168),(308,169),(308,170),(309,171),(310,172),(310,173),(311,174),(312,175),(313,176),(314,177),(315,178),(316,179),(317,180),(318,181),(318,182),(319,183),(319,184),(320,185),(320,186),(321,187),(321,188),(322,189),(323,190),(324,191),(325,192),(326,193),(327,194),(328,195),(329,196),(330,197),(331,198),(332,199),(333,200),(334,201),(335,202),(336,203),(337,204),(338,205),(339,206),(340,207),(341,208),(342,209),(343,210),(344,211),(346,212),(347,213),(348,214),(349,215),(350,216),(351,217),(352,218),(353,219),(354,220),(355,221),(356,222),(357,223),(358,224),(359,225),(359,226),(360,227),(361,228),(362,229),(363,230),(364,231),(365,232),(366,233),(367,234),(368,235),(369,236),(370,237),(371,238),(372,239),(373,240),(374,241),(375,242),(376,243),(377,244),(378,245),(379,246),(380,247),(381,248),(382,249),(383,250),(384,251),(385,252),(388,253),(389,254),(391,255),(392,256),(393,257),(394,258),(395,259),(396,260),(397,261),(398,262),(399,263),(400,264),(401,265),(402,266),(403,267),(404,268),(405,269),(406,270),(407,271),(408,272),(409,273),(410,274),(411,275),(412,276),(413,277),(414,278),(415,279),(416,280),(417,281),(418,282),(419,282),(418,283),(418,284),(419,285),(419,286),(419,287),(420,288),(421,289),(422,290),(423,291),(424,292),(425,293),(426,294),(427,295),(428,296),(429,297),(430,298),(431,299),(432,300),(433,301),(434,302),(435,303),(436,304),(437,305),(438,306),(450,307),(452,308),(457,308),(458,308),(461,308),(462,308),(467,308),(534,308),(537,308),(457,309),(624,309),(647,309),(458,310),(534,310),(458,311),(495,311),(506,311),(525,311),(531,311),(532,311),(534,311),(538,311),(583,311),(584,311),(586,311),(458,312),(534,312),(655,312),(656,312),(657,312),(458,313),(495,313),(525,313),(534,313),(538,313),(458,314),(459,315),(460,316),(463,317),(464,318),(471,319),(487,320),(488,320),(495,320),(498,320),(499,320),(506,320),(487,321),(488,321),(495,321),(505,321),(506,321),(531,321),(487,322),(488,322),(498,322),(499,322),(505,322),(511,322),(512,322),(603,322),(611,322),(612,322),(487,323),(488,323),(495,323),(506,323),(487,324),(488,324),(487,325),(488,325),(498,325),(499,325),(511,325),(512,325),(603,325),(611,325),(612,325),(487,326),(488,326),(495,326),(498,326),(499,326),(506,326),(507,326),(528,326),(531,326),(532,326),(533,326),(534,326),(538,326),(539,326),(540,326),(541,326),(542,326),(552,326),(556,326),(581,326),(582,326),(589,326),(599,326),(600,326),(601,326),(602,326),(603,326),(607,326),(487,327),(488,327),(495,327),(591,327),(489,328),(495,328),(500,328),(501,328),(506,328),(508,328),(489,329),(500,329),(489,330),(500,330),(489,331),(500,331),(489,332),(495,332),(500,332),(489,333),(500,333),(526,333),(573,333),(489,334),(495,334),(500,334),(489,335),(500,335),(513,335),(613,335),(489,336),(500,336),(507,336),(536,336),(489,337),(500,337),(489,338),(495,338),(522,338),(587,338),(489,339),(500,339),(489,340),(500,340),(555,340),(557,340),(558,340),(640,340),(641,340),(653,340),(490,341),(503,341),(504,341),(515,341),(516,341),(595,341),(596,341),(603,341),(614,341),(626,341),(627,341),(491,342),(492,343),(502,343),(508,343),(534,343),(492,344),(502,344),(508,344),(494,345),(505,345),(494,346),(505,346),(517,346),(495,347),(495,348),(495,349),(590,349),(495,350),(495,351),(506,351),(495,352),(553,352),(554,352),(495,353),(506,353),(591,353),(495,354),(506,354),(592,354),(495,355),(495,356),(495,357),(506,357),(531,357),(603,357),(609,357),(610,357),(495,358),(495,359),(506,359),(651,359),(655,359),(656,359),(657,359),(495,360),(506,360),(495,361),(506,361),(495,362),(495,363),(496,363),(511,363),(512,363),(513,363),(514,363),(515,363),(516,363),(517,363),(518,363),(519,363),(520,363),(521,363),(561,363),(562,363),(585,363),(596,363),(495,364),(495,365),(496,365),(506,365),(508,365),(519,365),(603,365),(622,365),(650,365),(495,366),(495,367),(506,367),(527,367),(495,368),(505,368),(506,368),(507,368),(495,369),(501,369),(506,369),(495,370),(531,370),(495,371),(506,371),(495,372),(603,372),(629,372),(495,373),(506,373),(495,374),(534,374),(546,374),(583,374),(584,374),(650,374),(495,375),(506,375),(495,376),(506,376),(495,377),(495,378),(593,378),(495,379),(506,379),(495,380),(501,380),(506,380),(495,381),(506,381),(525,381),(528,381),(531,381),(533,381),(534,381),(536,381),(649,381),(652,381),(495,382),(495,383),(505,383),(557,383),(583,383),(584,383),(586,383),(589,383),(495,384),(495,385),(495,386),(495,387),(495,388),(594,388),(495,389),(506,389),(495,390),(501,390),(495,391),(506,391),(495,392),(506,392),(495,393),(506,393),(495,394),(496,394),(508,394),(519,394),(495,395),(523,395),(495,396),(495,397),(537,397),(495,398),(496,399),(508,399),(496,400),(508,400),(496,401),(508,401),(497,402),(510,402),(521,402),(498,403),(499,403),(500,403),(511,403),(512,403),(513,403),(517,403),(518,403),(521,403),(583,403),(584,403),(585,403),(500,404),(500,405),(500,406),(500,407),(501,408),(505,409),(505,410),(505,411),(505,412),(505,413),(557,413),(583,413),(584,413),(585,413),(587,413),(618,413),(505,414),(506,415),(507,415),(506,416),(506,417),(507,417),(518,417),(521,417),(506,418),(506,419),(506,420),(531,420),(506,421),(507,421),(525,421),(506,422),(506,423),(506,424),(603,424),(609,424),(610,424),(636,424),(644,424),(506,425),(506,426),(603,426),(506,427),(506,428),(506,429),(506,430),(506,431),(506,432),(507,432),(506,433),(506,434),(506,435),(507,435),(586,435),(506,436),(506,437),(507,438),(518,438),(521,438),(507,439),(528,439),(534,439),(538,439),(508,440),(508,441),(508,442),(508,443),(508,444),(508,445),(536,445),(659,445),(509,446),(520,446),(603,446),(518,447),(524,448),(525,449),(527,449),(534,449),(538,449),(606,449),(639,449),(525,450),(528,450),(531,450),(532,450),(533,450),(538,450),(546,450),(525,451),(591,451),(594,451),(525,452),(536,452),(560,452),(525,453),(527,453),(538,453),(609,453),(610,453),(629,453),(527,454),(574,454),(527,455),(579,455),(527,456),(527,457),(527,458),(577,458),(603,458),(631,458),(527,459),(527,460),(539,460),(540,460),(541,460),(542,460),(546,460),(547,460),(548,460),(650,460),(528,461),(530,461),(533,461),(528,462),(528,463),(534,463),(528,464),(531,464),(532,464),(534,464),(536,464),(538,464),(652,464),(528,465),(533,465),(534,465),(652,465),(528,466),(529,466),(533,466),(534,466),(655,466),(656,466),(657,466),(528,467),(533,467),(531,468),(532,468),(531,469),(531,470),(531,471),(603,471),(609,471),(610,471),(531,472),(532,472),(531,473),(532,473),(531,474),(652,474),(531,475),(532,475),(546,475),(590,475),(593,475),(594,475),(650,475),(531,476),(531,477),(532,477),(533,477),(531,478),(531,479),(532,480),(583,480),(584,480),(586,480),(532,481),(534,482),(537,482),(555,482),(586,482),(588,482),(649,482),(652,482),(534,483),(536,483),(546,483),(583,483),(584,483),(534,484),(534,485),(534,486),(553,486),(555,486),(557,486),(558,486),(575,486),(578,486),(579,486),(589,486),(603,486),(639,486),(641,486),(650,486),(655,486),(656,486),(657,486),(534,487),(534,488),(536,488),(534,489),(534,490),(534,491),(534,492),(534,493),(534,494),(534,495),(534,496),(534,497),(534,498),(534,499),(536,499),(535,500),(536,501),(536,502),(536,503),(536,504),(536,505),(536,506),(536,507),(539,508),(540,508),(541,508),(542,508),(539,509),(540,509),(541,509),(542,509),(548,509),(563,509),(539,510),(540,510),(541,510),(542,510),(539,511),(540,511),(541,511),(542,511),(548,511),(539,512),(540,512),(541,512),(542,512),(548,512),(539,513),(540,513),(541,513),(542,513),(547,513),(548,513),(539,514),(540,514),(541,514),(542,514),(543,514),(544,514),(545,514),(548,514),(539,515),(540,515),(541,515),(542,515),(543,515),(544,515),(545,515),(548,515),(539,516),(540,516),(541,516),(542,516),(548,516),(539,517),(540,517),(541,517),(542,517),(548,517),(557,517),(539,518),(540,518),(541,518),(542,518),(547,518),(539,519),(540,519),(541,519),(542,519),(539,520),(540,520),(541,520),(542,520),(546,520),(547,520),(548,520),(543,521),(544,521),(545,521),(543,522),(544,522),(545,522),(549,522),(550,522),(553,522),(546,523),(603,523),(631,523),(644,523),(650,523),(546,524),(583,524),(584,524),(547,525),(547,526),(556,526),(599,526),(642,526),(646,526),(547,527),(547,528),(547,529),(547,530),(547,531),(599,531),(642,531),(646,531),(547,532),(548,533),(559,533),(561,533),(562,533),(548,534),(548,535),(549,536),(550,536),(549,537),(550,537),(603,537),(604,537),(605,537),(650,537),(549,538),(550,538),(551,538),(553,538),(604,538),(605,538),(630,538),(653,538),(549,539),(550,539),(552,540),(553,541),(555,541),(557,541),(558,541),(639,541),(641,541),(650,541),(553,542),(553,543),(553,544),(553,545),(553,546),(553,547),(553,548),(553,549),(553,550),(553,551),(553,552),(553,553),(553,554),(553,555),(553,556),(553,557),(553,558),(553,559),(553,560),(553,561),(553,562),(553,563),(553,564),(554,565),(554,566),(554,567),(554,568),(554,569),(554,570),(554,571),(554,572),(554,573),(586,573),(556,574),(557,575),(557,576),(558,576),(557,577),(557,578),(557,579),(557,580),(557,581),(558,581),(558,582),(560,583),(586,583),(561,584),(562,584),(565,585),(575,585),(578,585),(579,585),(567,586),(568,587),(569,588),(570,589),(571,590),(571,591),(572,592),(573,593),(575,594),(576,595),(578,596),(579,597),(579,598),(579,599),(580,600),(581,600),(582,600),(580,601),(581,601),(582,601),(580,602),(581,602),(582,602),(580,603),(581,603),(582,603),(580,604),(581,604),(582,604),(580,605),(581,605),(582,605),(580,606),(581,606),(582,606),(580,607),(580,608),(580,609),(581,609),(582,609),(580,610),(581,610),(582,610),(580,611),(580,612),(580,613),(580,614),(581,614),(582,614),(580,615),(581,615),(582,615),(580,616),(581,616),(582,616),(581,617),(581,618),(582,618),(582,619),(583,620),(584,620),(583,621),(584,621),(586,621),(583,622),(584,622),(583,623),(584,623),(586,623),(583,624),(584,624),(586,624),(583,625),(584,625),(586,625),(583,626),(584,626),(586,626),(583,627),(584,627),(586,627),(583,628),(584,628),(583,629),(584,629),(586,629),(583,630),(584,630),(586,630),(583,631),(584,631),(586,631),(583,632),(584,632),(586,632),(586,633),(586,634),(586,635),(588,635),(586,636),(586,637),(588,637),(586,638),(588,638),(633,638),(650,638),(586,639),(586,640),(586,641),(586,642),(654,642),(586,643),(586,644),(588,645),(588,646),(590,647),(593,647),(594,647),(650,647),(591,648),(591,649),(594,650),(655,650),(656,650),(657,650),(594,651),(595,652),(595,653),(595,654),(595,655),(597,656),(597,657),(598,657),(603,657),(598,658),(599,659),(600,660),(601,660),(602,661),(603,662),(608,662),(603,663),(620,663),(621,663),(603,664),(623,664),(603,665),(624,665),(603,666),(628,666),(603,667),(640,667),(650,667),(603,668),(603,669),(622,669),(603,670),(636,670),(603,671),(620,671),(621,671),(603,672),(604,672),(605,672),(606,672),(607,672),(608,672),(609,672),(610,672),(611,672),(612,672),(613,672),(614,672),(615,672),(616,672),(618,672),(620,672),(621,672),(622,672),(623,672),(624,672),(625,672),(626,672),(627,672),(628,672),(629,672),(630,672),(631,672),(632,672),(633,672),(634,672),(635,672),(636,672),(637,672),(638,672),(639,672),(640,672),(641,672),(642,672),(643,672),(644,672),(645,672),(646,672),(647,672),(603,673),(622,673),(627,673),(630,673),(635,673),(641,673),(642,673),(643,673),(650,673),(603,674),(645,674),(603,675),(646,675),(603,676),(647,676),(606,677),(648,677),(606,678),(625,678),(639,678),(623,679),(626,680),(634,680),(632,681),(637,682),(638,683),(639,684),(650,685),(650,686),(650,687),(650,688),(650,689),(650,690),(650,691),(650,692),(651,693),(652,694),(655,695),(656,695),(657,695),(655,696),(656,696),(657,696),(655,697),(656,697),(657,697),(655,698),(656,698),(657,698),(655,699),(656,699),(657,699);
/*!40000 ALTER TABLE `help_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_topic` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='help topics';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_topic`
--

LOCK TABLES `help_topic` WRITE;
/*!40000 ALTER TABLE `help_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `help_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `innodb_index_stats`
--

DROP TABLE IF EXISTS `innodb_index_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `innodb_index_stats` (
  `database_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(199) COLLATE utf8_bin NOT NULL,
  `index_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stat_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `stat_value` bigint(20) unsigned NOT NULL,
  `sample_size` bigint(20) unsigned DEFAULT NULL,
  `stat_description` varchar(1024) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`database_name`,`table_name`,`index_name`,`stat_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `innodb_index_stats`
--

LOCK TABLES `innodb_index_stats` WRITE;
/*!40000 ALTER TABLE `innodb_index_stats` DISABLE KEYS */;
INSERT INTO `innodb_index_stats` VALUES ('chamilo','access_url','PRIMARY','2020-05-21 15:43:25','n_diff_pfx01',0,1,'id'),('chamilo','access_url','PRIMARY','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','access_url','PRIMARY','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','access_url_rel_course','IDX_8E97FC0873444FD5','2020-05-21 15:43:31','n_diff_pfx01',0,1,'access_url_id'),('chamilo','access_url_rel_course','IDX_8E97FC0873444FD5','2020-05-21 15:43:31','n_diff_pfx02',0,1,'access_url_id,id'),('chamilo','access_url_rel_course','IDX_8E97FC0873444FD5','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','access_url_rel_course','IDX_8E97FC0873444FD5','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','access_url_rel_course','IDX_8E97FC0891D79BD3','2020-05-21 15:43:31','n_diff_pfx01',0,1,'c_id'),('chamilo','access_url_rel_course','IDX_8E97FC0891D79BD3','2020-05-21 15:43:31','n_diff_pfx02',0,1,'c_id,id'),('chamilo','access_url_rel_course','IDX_8E97FC0891D79BD3','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','access_url_rel_course','IDX_8E97FC0891D79BD3','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','access_url_rel_course','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','access_url_rel_course','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','access_url_rel_course','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','access_url_rel_course_category','PRIMARY','2020-05-21 15:43:53','n_diff_pfx01',3,1,'id'),('chamilo','access_url_rel_course_category','PRIMARY','2020-05-21 15:43:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','access_url_rel_course_category','PRIMARY','2020-05-21 15:43:53','size',1,NULL,'Number of pages in the index'),('chamilo','access_url_rel_session','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'access_url_id'),('chamilo','access_url_rel_session','PRIMARY','2020-05-21 15:43:27','n_diff_pfx02',0,1,'access_url_id,session_id'),('chamilo','access_url_rel_session','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','access_url_rel_session','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','access_url_rel_user','PRIMARY','2020-05-21 15:44:23','n_diff_pfx01',1,1,'access_url_id'),('chamilo','access_url_rel_user','PRIMARY','2020-05-21 15:44:23','n_diff_pfx02',2,1,'access_url_id,user_id'),('chamilo','access_url_rel_user','PRIMARY','2020-05-21 15:44:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','access_url_rel_user','PRIMARY','2020-05-21 15:44:23','size',1,NULL,'Number of pages in the index'),('chamilo','access_url_rel_user','idx_access_url_rel_user_access_url','2020-05-21 15:44:23','n_diff_pfx01',1,1,'access_url_id'),('chamilo','access_url_rel_user','idx_access_url_rel_user_access_url','2020-05-21 15:44:23','n_diff_pfx02',2,1,'access_url_id,user_id'),('chamilo','access_url_rel_user','idx_access_url_rel_user_access_url','2020-05-21 15:44:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','access_url_rel_user','idx_access_url_rel_user_access_url','2020-05-21 15:44:23','size',1,NULL,'Number of pages in the index'),('chamilo','access_url_rel_user','idx_access_url_rel_user_access_url_user','2020-05-21 15:44:23','n_diff_pfx01',2,1,'user_id'),('chamilo','access_url_rel_user','idx_access_url_rel_user_access_url_user','2020-05-21 15:44:23','n_diff_pfx02',2,1,'user_id,access_url_id'),('chamilo','access_url_rel_user','idx_access_url_rel_user_access_url_user','2020-05-21 15:44:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','access_url_rel_user','idx_access_url_rel_user_access_url_user','2020-05-21 15:44:23','size',1,NULL,'Number of pages in the index'),('chamilo','access_url_rel_user','idx_access_url_rel_user_user','2020-05-21 15:44:23','n_diff_pfx01',2,1,'user_id'),('chamilo','access_url_rel_user','idx_access_url_rel_user_user','2020-05-21 15:44:23','n_diff_pfx02',2,1,'user_id,access_url_id'),('chamilo','access_url_rel_user','idx_access_url_rel_user_user','2020-05-21 15:44:23','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','access_url_rel_user','idx_access_url_rel_user_user','2020-05-21 15:44:23','size',1,NULL,'Number of pages in the index'),('chamilo','access_url_rel_usergroup','PRIMARY','2020-05-21 15:43:25','n_diff_pfx01',0,1,'id'),('chamilo','access_url_rel_usergroup','PRIMARY','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','access_url_rel_usergroup','PRIMARY','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','admin','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','admin','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','admin','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','admin','user_id','2020-05-21 15:43:27','n_diff_pfx01',0,1,'user_id'),('chamilo','admin','user_id','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','admin','user_id','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','announcement_rel_group','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'group_id'),('chamilo','announcement_rel_group','PRIMARY','2020-05-21 15:43:27','n_diff_pfx02',0,1,'group_id,announcement_id'),('chamilo','announcement_rel_group','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','announcement_rel_group','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','block','PRIMARY','2020-05-21 15:43:26','n_diff_pfx01',0,1,'id'),('chamilo','block','PRIMARY','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','block','PRIMARY','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','block','path','2020-05-21 15:43:26','n_diff_pfx01',0,1,'path'),('chamilo','block','path','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','block','path','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','branch_sync','IDX_F62F45ED727ACA70','2020-05-21 15:43:31','n_diff_pfx01',0,1,'parent_id'),('chamilo','branch_sync','IDX_F62F45ED727ACA70','2020-05-21 15:43:31','n_diff_pfx02',0,1,'parent_id,id'),('chamilo','branch_sync','IDX_F62F45ED727ACA70','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','branch_sync','IDX_F62F45ED727ACA70','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','branch_sync','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','branch_sync','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','branch_sync','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','branch_sync','UNIQ_F62F45EDE3C68343','2020-05-21 15:43:31','n_diff_pfx01',0,1,'unique_id'),('chamilo','branch_sync','UNIQ_F62F45EDE3C68343','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','branch_sync','UNIQ_F62F45EDE3C68343','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','branch_transaction','IDX_FEFBA12B6BF700BD','2020-05-21 15:43:31','n_diff_pfx01',0,1,'status_id'),('chamilo','branch_transaction','IDX_FEFBA12B6BF700BD','2020-05-21 15:43:31','n_diff_pfx02',0,1,'status_id,id'),('chamilo','branch_transaction','IDX_FEFBA12B6BF700BD','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','branch_transaction','IDX_FEFBA12B6BF700BD','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','branch_transaction','IDX_FEFBA12BDCD6CC49','2020-05-21 15:43:31','n_diff_pfx01',0,1,'branch_id'),('chamilo','branch_transaction','IDX_FEFBA12BDCD6CC49','2020-05-21 15:43:31','n_diff_pfx02',0,1,'branch_id,id'),('chamilo','branch_transaction','IDX_FEFBA12BDCD6CC49','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','branch_transaction','IDX_FEFBA12BDCD6CC49','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','branch_transaction','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','branch_transaction','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','branch_transaction','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','branch_transaction_status','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','branch_transaction_status','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','branch_transaction_status','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','c_announcement','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_announcement','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_announcement','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_announcement','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_announcement','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_announcement','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_announcement','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_announcement','session_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_announcement','session_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_announcement','session_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_announcement','session_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_announcement_attachment','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_announcement_attachment','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_announcement_attachment','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_announcement_attachment','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_announcement_attachment','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_announcement_attachment','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_announcement_attachment','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_attendance','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance','active','2020-05-21 15:43:30','n_diff_pfx01',0,1,'active'),('chamilo','c_attendance','active','2020-05-21 15:43:30','n_diff_pfx02',0,1,'active,iid'),('chamilo','c_attendance','active','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance','active','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_attendance','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_attendance','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance','session_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_attendance','session_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_attendance','session_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance','session_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_calendar','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_attendance_calendar','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_calendar','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_calendar','attendance_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'attendance_id'),('chamilo','c_attendance_calendar','attendance_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'attendance_id,iid'),('chamilo','c_attendance_calendar','attendance_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_calendar','attendance_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_calendar','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_attendance_calendar','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_attendance_calendar','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_calendar','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_calendar','done_attendance','2020-05-21 15:43:30','n_diff_pfx01',0,1,'done_attendance'),('chamilo','c_attendance_calendar','done_attendance','2020-05-21 15:43:30','n_diff_pfx02',0,1,'done_attendance,iid'),('chamilo','c_attendance_calendar','done_attendance','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_calendar','done_attendance','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_calendar_rel_group','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_attendance_calendar_rel_group','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_calendar_rel_group','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_calendar_rel_group','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_attendance_calendar_rel_group','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_attendance_calendar_rel_group','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_calendar_rel_group','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_calendar_rel_group','group','2020-05-21 15:43:29','n_diff_pfx01',0,1,'group_id'),('chamilo','c_attendance_calendar_rel_group','group','2020-05-21 15:43:29','n_diff_pfx02',0,1,'group_id,iid'),('chamilo','c_attendance_calendar_rel_group','group','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_calendar_rel_group','group','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_result','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_attendance_result','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_result','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_result','attendance_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'attendance_id'),('chamilo','c_attendance_result','attendance_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'attendance_id,iid'),('chamilo','c_attendance_result','attendance_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_result','attendance_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_result','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_attendance_result','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_attendance_result','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_result','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_result','user_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'user_id'),('chamilo','c_attendance_result','user_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'user_id,iid'),('chamilo','c_attendance_result','user_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_result','user_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_sheet','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_attendance_sheet','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_sheet','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_sheet','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_attendance_sheet','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_attendance_sheet','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_sheet','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_sheet','presence','2020-05-21 15:43:30','n_diff_pfx01',0,1,'presence'),('chamilo','c_attendance_sheet','presence','2020-05-21 15:43:30','n_diff_pfx02',0,1,'presence,iid'),('chamilo','c_attendance_sheet','presence','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_sheet','presence','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_sheet','user','2020-05-21 15:43:30','n_diff_pfx01',0,1,'user_id'),('chamilo','c_attendance_sheet','user','2020-05-21 15:43:30','n_diff_pfx02',0,1,'user_id,iid'),('chamilo','c_attendance_sheet','user','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_sheet','user','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_sheet_log','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_attendance_sheet_log','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_sheet_log','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_attendance_sheet_log','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_attendance_sheet_log','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_attendance_sheet_log','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_attendance_sheet_log','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_blog','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_blog','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_blog','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog','session_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_blog','session_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_blog','session_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog','session_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_attachment','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_blog_attachment','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_attachment','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_attachment','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_blog_attachment','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_blog_attachment','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_attachment','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_comment','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_blog_comment','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_comment','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_comment','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_blog_comment','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_blog_comment','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_comment','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_post','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_blog_post','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_post','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_post','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_blog_post','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_blog_post','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_post','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_rating','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_blog_rating','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_rating','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_rating','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_blog_rating','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_blog_rating','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_rating','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_rel_user','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_blog_rel_user','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_rel_user','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_rel_user','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_blog_rel_user','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_blog_rel_user','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_rel_user','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_task','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_blog_task','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_task','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_task','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_blog_task','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_blog_task','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_task','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_task_rel_user','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_blog_task_rel_user','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_task_rel_user','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_task_rel_user','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_blog_task_rel_user','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_blog_task_rel_user','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_task_rel_user','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_task_rel_user','task','2020-05-21 15:43:30','n_diff_pfx01',0,1,'task_id'),('chamilo','c_blog_task_rel_user','task','2020-05-21 15:43:30','n_diff_pfx02',0,1,'task_id,iid'),('chamilo','c_blog_task_rel_user','task','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_task_rel_user','task','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_blog_task_rel_user','user','2020-05-21 15:43:30','n_diff_pfx01',0,1,'user_id'),('chamilo','c_blog_task_rel_user','user','2020-05-21 15:43:30','n_diff_pfx02',0,1,'user_id,iid'),('chamilo','c_blog_task_rel_user','user','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_blog_task_rel_user','user','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_calendar_event','IDX_A062258154177093','2020-05-21 15:43:32','n_diff_pfx01',0,1,'room_id'),('chamilo','c_calendar_event','IDX_A062258154177093','2020-05-21 15:43:32','n_diff_pfx02',0,1,'room_id,iid'),('chamilo','c_calendar_event','IDX_A062258154177093','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_calendar_event','IDX_A062258154177093','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_calendar_event','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',0,1,'iid'),('chamilo','c_calendar_event','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_calendar_event','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_calendar_event','course','2020-05-21 15:43:32','n_diff_pfx01',0,1,'c_id'),('chamilo','c_calendar_event','course','2020-05-21 15:43:32','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_calendar_event','course','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_calendar_event','course','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_calendar_event','session_id','2020-05-21 15:43:32','n_diff_pfx01',0,1,'session_id'),('chamilo','c_calendar_event','session_id','2020-05-21 15:43:32','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_calendar_event','session_id','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_calendar_event','session_id','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_calendar_event_attachment','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_calendar_event_attachment','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_calendar_event_attachment','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_calendar_event_attachment','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_calendar_event_attachment','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_calendar_event_attachment','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_calendar_event_attachment','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_calendar_event_repeat','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_calendar_event_repeat','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_calendar_event_repeat','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_calendar_event_repeat','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_calendar_event_repeat','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_calendar_event_repeat','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_calendar_event_repeat','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_calendar_event_repeat_not','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_calendar_event_repeat_not','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_calendar_event_repeat_not','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_calendar_event_repeat_not','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_calendar_event_repeat_not','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_calendar_event_repeat_not','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_calendar_event_repeat_not','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_chat_connected','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_chat_connected','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_chat_connected','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_chat_connected','char_connected_index','2020-05-21 15:43:30','n_diff_pfx01',0,1,'user_id'),('chamilo','c_chat_connected','char_connected_index','2020-05-21 15:43:30','n_diff_pfx02',0,1,'user_id,session_id'),('chamilo','c_chat_connected','char_connected_index','2020-05-21 15:43:30','n_diff_pfx03',0,1,'user_id,session_id,to_group_id'),('chamilo','c_chat_connected','char_connected_index','2020-05-21 15:43:30','n_diff_pfx04',0,1,'user_id,session_id,to_group_id,iid'),('chamilo','c_chat_connected','char_connected_index','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_chat_connected','char_connected_index','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_chat_connected','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_chat_connected','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_chat_connected','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_chat_connected','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_chat_connected','user','2020-05-21 15:43:30','n_diff_pfx01',0,1,'user_id'),('chamilo','c_chat_connected','user','2020-05-21 15:43:30','n_diff_pfx02',0,1,'user_id,iid'),('chamilo','c_chat_connected','user','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_chat_connected','user','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_course_description','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_course_description','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_course_description','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_course_description','session_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_course_description','session_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_course_description','session_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_course_description','session_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_course_setting','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_course_setting','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_course_setting','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_course_setting','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_course_setting','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_course_setting','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_course_setting','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_document','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_document','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_document','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_document','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_document','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_document','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_document','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_category','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_dropbox_category','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_category','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_category','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_dropbox_category','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_dropbox_category','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_category','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_category','session_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_dropbox_category','session_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_dropbox_category','session_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_category','session_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_feedback','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_dropbox_feedback','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_feedback','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_feedback','author_user_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'author_user_id'),('chamilo','c_dropbox_feedback','author_user_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'author_user_id,iid'),('chamilo','c_dropbox_feedback','author_user_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_feedback','author_user_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_feedback','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_dropbox_feedback','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_dropbox_feedback','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_feedback','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_feedback','file_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'file_id'),('chamilo','c_dropbox_feedback','file_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'file_id,iid'),('chamilo','c_dropbox_feedback','file_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_feedback','file_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_file','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_dropbox_file','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_file','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_file','UN_filename','2020-05-21 15:43:30','n_diff_pfx01',0,1,'filename'),('chamilo','c_dropbox_file','UN_filename','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_file','UN_filename','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_file','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_dropbox_file','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_dropbox_file','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_file','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_file','session_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_dropbox_file','session_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_dropbox_file','session_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_file','session_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_person','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_dropbox_person','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_person','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_person','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_dropbox_person','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_dropbox_person','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_person','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_person','user','2020-05-21 15:43:30','n_diff_pfx01',0,1,'user_id'),('chamilo','c_dropbox_person','user','2020-05-21 15:43:30','n_diff_pfx02',0,1,'user_id,iid'),('chamilo','c_dropbox_person','user','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_person','user','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_post','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_dropbox_post','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_post','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_post','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_dropbox_post','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_dropbox_post','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_post','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_post','dest_user','2020-05-21 15:43:30','n_diff_pfx01',0,1,'dest_user_id'),('chamilo','c_dropbox_post','dest_user','2020-05-21 15:43:30','n_diff_pfx02',0,1,'dest_user_id,iid'),('chamilo','c_dropbox_post','dest_user','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_post','dest_user','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_dropbox_post','session_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_dropbox_post','session_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_dropbox_post','session_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_dropbox_post','session_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_attachment','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_forum_attachment','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_attachment','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_attachment','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_forum_attachment','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_forum_attachment','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_attachment','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_category','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_forum_category','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_category','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_category','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_forum_category','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_forum_category','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_category','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_category','session_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_forum_category','session_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_forum_category','session_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_category','session_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_forum','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_forum_forum','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_forum','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_forum','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_forum_forum','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_forum_forum','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_forum','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_mailcue','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_forum_mailcue','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_mailcue','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_mailcue','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_forum_mailcue','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_forum_mailcue','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_mailcue','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_mailcue','post','2020-05-21 15:43:29','n_diff_pfx01',0,1,'post_id'),('chamilo','c_forum_mailcue','post','2020-05-21 15:43:29','n_diff_pfx02',0,1,'post_id,iid'),('chamilo','c_forum_mailcue','post','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_mailcue','post','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_mailcue','thread','2020-05-21 15:43:29','n_diff_pfx01',0,1,'thread_id'),('chamilo','c_forum_mailcue','thread','2020-05-21 15:43:29','n_diff_pfx02',0,1,'thread_id,iid'),('chamilo','c_forum_mailcue','thread','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_mailcue','thread','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_mailcue','user','2020-05-21 15:43:29','n_diff_pfx01',0,1,'user_id'),('chamilo','c_forum_mailcue','user','2020-05-21 15:43:29','n_diff_pfx02',0,1,'user_id,iid'),('chamilo','c_forum_mailcue','user','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_mailcue','user','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_notification','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_forum_notification','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_notification','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_notification','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_forum_notification','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_forum_notification','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_notification','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_notification','forum_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'forum_id'),('chamilo','c_forum_notification','forum_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'forum_id,iid'),('chamilo','c_forum_notification','forum_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_notification','forum_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_notification','post','2020-05-21 15:43:30','n_diff_pfx01',0,1,'post_id'),('chamilo','c_forum_notification','post','2020-05-21 15:43:30','n_diff_pfx02',0,1,'post_id,iid'),('chamilo','c_forum_notification','post','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_notification','post','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_notification','thread','2020-05-21 15:43:30','n_diff_pfx01',0,1,'thread_id'),('chamilo','c_forum_notification','thread','2020-05-21 15:43:30','n_diff_pfx02',0,1,'thread_id,iid'),('chamilo','c_forum_notification','thread','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_notification','thread','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_notification','user_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'user_id'),('chamilo','c_forum_notification','user_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'user_id,iid'),('chamilo','c_forum_notification','user_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_notification','user_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_post','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_forum_post','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_post','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_post','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_forum_post','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_forum_post','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_post','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_post','forum_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'forum_id'),('chamilo','c_forum_post','forum_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'forum_id,iid'),('chamilo','c_forum_post','forum_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_post','forum_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_post','idx_forum_post_thread_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'thread_id'),('chamilo','c_forum_post','idx_forum_post_thread_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'thread_id,iid'),('chamilo','c_forum_post','idx_forum_post_thread_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_post','idx_forum_post_thread_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_post','idx_forum_post_visible','2020-05-21 15:43:29','n_diff_pfx01',0,1,'visible'),('chamilo','c_forum_post','idx_forum_post_visible','2020-05-21 15:43:29','n_diff_pfx02',0,1,'visible,iid'),('chamilo','c_forum_post','idx_forum_post_visible','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_post','idx_forum_post_visible','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_post','poster_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'poster_id'),('chamilo','c_forum_post','poster_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'poster_id,iid'),('chamilo','c_forum_post','poster_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_post','poster_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_thread','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_forum_thread','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_thread','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_thread','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_forum_thread','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_forum_thread','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_thread','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_thread','idx_forum_thread_forum_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'forum_id'),('chamilo','c_forum_thread','idx_forum_thread_forum_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'forum_id,iid'),('chamilo','c_forum_thread','idx_forum_thread_forum_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_thread','idx_forum_thread_forum_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_thread_qualify','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_forum_thread_qualify','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_thread_qualify','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_thread_qualify','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_forum_thread_qualify','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_forum_thread_qualify','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_thread_qualify','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_thread_qualify','user_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'user_id'),('chamilo','c_forum_thread_qualify','user_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'user_id,thread_id'),('chamilo','c_forum_thread_qualify','user_id','2020-05-21 15:43:30','n_diff_pfx03',0,1,'user_id,thread_id,iid'),('chamilo','c_forum_thread_qualify','user_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_thread_qualify','user_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_thread_qualify_log','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_forum_thread_qualify_log','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_thread_qualify_log','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_thread_qualify_log','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_forum_thread_qualify_log','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_forum_thread_qualify_log','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_thread_qualify_log','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_forum_thread_qualify_log','user_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'user_id'),('chamilo','c_forum_thread_qualify_log','user_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'user_id,thread_id'),('chamilo','c_forum_thread_qualify_log','user_id','2020-05-21 15:43:30','n_diff_pfx03',0,1,'user_id,thread_id,iid'),('chamilo','c_forum_thread_qualify_log','user_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_forum_thread_qualify_log','user_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_glossary','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_glossary','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_glossary','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_glossary','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_glossary','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_glossary','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_glossary','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_glossary','session_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_glossary','session_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_glossary','session_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_glossary','session_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_group_category','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_group_category','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_group_category','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_group_category','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_group_category','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_group_category','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_group_category','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_group_info','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_group_info','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_group_info','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_group_info','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_group_info','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_group_info','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_group_info','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_group_info','session_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'session_id'),('chamilo','c_group_info','session_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_group_info','session_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_group_info','session_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_group_rel_tutor','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_group_rel_tutor','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_group_rel_tutor','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_group_rel_tutor','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_group_rel_tutor','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_group_rel_tutor','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_group_rel_tutor','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_group_rel_user','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_group_rel_user','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_group_rel_user','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_group_rel_user','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_group_rel_user','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_group_rel_user','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_group_rel_user','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_item_property','IDX_1D84C18129F6EE60','2020-05-21 15:43:32','n_diff_pfx01',0,1,'to_user_id'),('chamilo','c_item_property','IDX_1D84C18129F6EE60','2020-05-21 15:43:32','n_diff_pfx02',0,1,'to_user_id,iid'),('chamilo','c_item_property','IDX_1D84C18129F6EE60','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_item_property','IDX_1D84C18129F6EE60','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_item_property','IDX_1D84C181330D47E9','2020-05-21 15:43:32','n_diff_pfx01',0,1,'to_group_id'),('chamilo','c_item_property','IDX_1D84C181330D47E9','2020-05-21 15:43:32','n_diff_pfx02',0,1,'to_group_id,iid'),('chamilo','c_item_property','IDX_1D84C181330D47E9','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_item_property','IDX_1D84C181330D47E9','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_item_property','IDX_1D84C181613FECDF','2020-05-21 15:43:32','n_diff_pfx01',0,1,'session_id'),('chamilo','c_item_property','IDX_1D84C181613FECDF','2020-05-21 15:43:32','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_item_property','IDX_1D84C181613FECDF','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_item_property','IDX_1D84C181613FECDF','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_item_property','IDX_1D84C18191D79BD3','2020-05-21 15:43:32','n_diff_pfx01',0,1,'c_id'),('chamilo','c_item_property','IDX_1D84C18191D79BD3','2020-05-21 15:43:32','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_item_property','IDX_1D84C18191D79BD3','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_item_property','IDX_1D84C18191D79BD3','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_item_property','IDX_1D84C1819C859CC3','2020-05-21 15:43:32','n_diff_pfx01',0,1,'insert_user_id'),('chamilo','c_item_property','IDX_1D84C1819C859CC3','2020-05-21 15:43:32','n_diff_pfx02',0,1,'insert_user_id,iid'),('chamilo','c_item_property','IDX_1D84C1819C859CC3','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_item_property','IDX_1D84C1819C859CC3','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_item_property','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',0,1,'iid'),('chamilo','c_item_property','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_item_property','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_item_property','idx_item_property_toolref','2020-05-21 15:43:32','n_diff_pfx01',0,1,'tool'),('chamilo','c_item_property','idx_item_property_toolref','2020-05-21 15:43:32','n_diff_pfx02',0,1,'tool,ref'),('chamilo','c_item_property','idx_item_property_toolref','2020-05-21 15:43:32','n_diff_pfx03',0,1,'tool,ref,iid'),('chamilo','c_item_property','idx_item_property_toolref','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_item_property','idx_item_property_toolref','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_link','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_link','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_link','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_link','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_link','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_link','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_link','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_link','session_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_link','session_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_link','session_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_link','session_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_link_category','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_link_category','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_link_category','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_link_category','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_link_category','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_link_category','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_link_category','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_link_category','session_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_link_category','session_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_link_category','session_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_link_category','session_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_lp','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_lp','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_lp','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp','session','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_lp','session','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_lp','session','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp','session','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_category','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_lp_category','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_category','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_category','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_lp_category','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_lp_category','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_category','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_category_user','IDX_61F042712469DE2','2020-05-21 15:43:32','n_diff_pfx01',0,1,'category_id'),('chamilo','c_lp_category_user','IDX_61F042712469DE2','2020-05-21 15:43:32','n_diff_pfx02',0,1,'category_id,id'),('chamilo','c_lp_category_user','IDX_61F042712469DE2','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_category_user','IDX_61F042712469DE2','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_category_user','IDX_61F0427A76ED395','2020-05-21 15:43:32','n_diff_pfx01',0,1,'user_id'),('chamilo','c_lp_category_user','IDX_61F0427A76ED395','2020-05-21 15:43:32','n_diff_pfx02',0,1,'user_id,id'),('chamilo','c_lp_category_user','IDX_61F0427A76ED395','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_category_user','IDX_61F0427A76ED395','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_category_user','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',0,1,'id'),('chamilo','c_lp_category_user','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_category_user','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_item','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_lp_item','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_item','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_item','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_lp_item','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_lp_item','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_item','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_item','idx_c_lp_item_cid_lp_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_lp_item','idx_c_lp_item_cid_lp_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,lp_id'),('chamilo','c_lp_item','idx_c_lp_item_cid_lp_id','2020-05-21 15:43:30','n_diff_pfx03',0,1,'c_id,lp_id,iid'),('chamilo','c_lp_item','idx_c_lp_item_cid_lp_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_item','idx_c_lp_item_cid_lp_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_item','lp_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'lp_id'),('chamilo','c_lp_item','lp_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'lp_id,iid'),('chamilo','c_lp_item','lp_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_item','lp_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_item_view','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_lp_item_view','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_item_view','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_item_view','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_lp_item_view','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_lp_item_view','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_item_view','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_item_view','idx_c_lp_item_view_cid_lp_view_id_lp_item_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_lp_item_view','idx_c_lp_item_view_cid_lp_view_id_lp_item_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,lp_view_id'),('chamilo','c_lp_item_view','idx_c_lp_item_view_cid_lp_view_id_lp_item_id','2020-05-21 15:43:30','n_diff_pfx03',0,1,'c_id,lp_view_id,lp_item_id'),('chamilo','c_lp_item_view','idx_c_lp_item_view_cid_lp_view_id_lp_item_id','2020-05-21 15:43:30','n_diff_pfx04',0,1,'c_id,lp_view_id,lp_item_id,iid'),('chamilo','c_lp_item_view','idx_c_lp_item_view_cid_lp_view_id_lp_item_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_item_view','idx_c_lp_item_view_cid_lp_view_id_lp_item_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_item_view','lp_item_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'lp_item_id'),('chamilo','c_lp_item_view','lp_item_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'lp_item_id,iid'),('chamilo','c_lp_item_view','lp_item_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_item_view','lp_item_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_item_view','lp_view_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'lp_view_id'),('chamilo','c_lp_item_view','lp_view_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'lp_view_id,iid'),('chamilo','c_lp_item_view','lp_view_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_item_view','lp_view_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_iv_interaction','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_lp_iv_interaction','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_iv_interaction','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_iv_interaction','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_lp_iv_interaction','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_lp_iv_interaction','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_iv_interaction','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_iv_interaction','lp_iv_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'lp_iv_id'),('chamilo','c_lp_iv_interaction','lp_iv_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'lp_iv_id,iid'),('chamilo','c_lp_iv_interaction','lp_iv_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_iv_interaction','lp_iv_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_iv_objective','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_lp_iv_objective','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_iv_objective','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_iv_objective','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_lp_iv_objective','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_lp_iv_objective','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_iv_objective','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_iv_objective','lp_iv_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'lp_iv_id'),('chamilo','c_lp_iv_objective','lp_iv_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'lp_iv_id,iid'),('chamilo','c_lp_iv_objective','lp_iv_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_iv_objective','lp_iv_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_view','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_lp_view','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_view','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_view','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_lp_view','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_lp_view','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_view','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_view','lp_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'lp_id'),('chamilo','c_lp_view','lp_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'lp_id,iid'),('chamilo','c_lp_view','lp_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_view','lp_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_view','session_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_lp_view','session_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_lp_view','session_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_view','session_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_lp_view','user_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'user_id'),('chamilo','c_lp_view','user_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'user_id,iid'),('chamilo','c_lp_view','user_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_lp_view','user_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_notebook','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_notebook','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_notebook','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_notebook','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_notebook','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_notebook','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_notebook','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_online_connected','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_online_connected','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_online_connected','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_online_connected','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_online_connected','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_online_connected','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_online_connected','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_online_link','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_online_link','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_online_link','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_online_link','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_online_link','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_online_link','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_online_link','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_permission_group','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_permission_group','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_permission_group','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_permission_group','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_permission_group','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_permission_group','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_permission_group','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_permission_task','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_permission_task','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_permission_task','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_permission_task','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_permission_task','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_permission_task','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_permission_task','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_permission_user','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_permission_user','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_permission_user','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_permission_user','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_permission_user','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_permission_user','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_permission_user','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_quiz','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_quiz','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_quiz','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz','session_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_quiz','session_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_quiz','session_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz','session_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_answer','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_quiz_answer','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_answer','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_answer','c_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_quiz_answer','c_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_quiz_answer','c_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_answer','c_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_answer','idx_cqa_q','2020-05-21 15:43:29','n_diff_pfx01',0,1,'question_id'),('chamilo','c_quiz_answer','idx_cqa_q','2020-05-21 15:43:29','n_diff_pfx02',0,1,'question_id,iid'),('chamilo','c_quiz_answer','idx_cqa_q','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_answer','idx_cqa_q','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_question','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_quiz_question','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_question','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_question','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_quiz_question','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_quiz_question','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_question','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_question','position','2020-05-21 15:43:30','n_diff_pfx01',0,1,'position'),('chamilo','c_quiz_question','position','2020-05-21 15:43:30','n_diff_pfx02',0,1,'position,iid'),('chamilo','c_quiz_question','position','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_question','position','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_question_category','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_quiz_question_category','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_question_category','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_question_category','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_quiz_question_category','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_quiz_question_category','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_question_category','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_question_option','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_quiz_question_option','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_question_option','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_question_option','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_quiz_question_option','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_quiz_question_option','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_question_option','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_question_rel_category','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_quiz_question_rel_category','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_question_rel_category','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_question_rel_category','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_quiz_question_rel_category','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_quiz_question_rel_category','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_question_rel_category','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_question_rel_category','idx_qqrc_qid','2020-05-21 15:43:30','n_diff_pfx01',0,1,'question_id'),('chamilo','c_quiz_question_rel_category','idx_qqrc_qid','2020-05-21 15:43:30','n_diff_pfx02',0,1,'question_id,iid'),('chamilo','c_quiz_question_rel_category','idx_qqrc_qid','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_question_rel_category','idx_qqrc_qid','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_rel_category','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_quiz_rel_category','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_rel_category','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_rel_question','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_quiz_rel_question','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_rel_question','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_rel_question','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_quiz_rel_question','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_quiz_rel_question','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_rel_question','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_rel_question','exercise','2020-05-21 15:43:29','n_diff_pfx01',0,1,'exercice_id'),('chamilo','c_quiz_rel_question','exercise','2020-05-21 15:43:29','n_diff_pfx02',0,1,'exercice_id,iid'),('chamilo','c_quiz_rel_question','exercise','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_rel_question','exercise','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_quiz_rel_question','question','2020-05-21 15:43:29','n_diff_pfx01',0,1,'question_id'),('chamilo','c_quiz_rel_question','question','2020-05-21 15:43:29','n_diff_pfx02',0,1,'question_id,iid'),('chamilo','c_quiz_rel_question','question','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_quiz_rel_question','question','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_resource','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_resource','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_resource','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_resource','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_resource','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_resource','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_resource','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_role','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_role','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_role','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_role','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_role','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_role','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_role','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_role_group','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_role_group','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_role_group','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_role_group','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_role_group','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_role_group','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_role_group','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_role_group','group','2020-05-21 15:43:30','n_diff_pfx01',0,1,'group_id'),('chamilo','c_role_group','group','2020-05-21 15:43:30','n_diff_pfx02',0,1,'group_id,iid'),('chamilo','c_role_group','group','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_role_group','group','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_role_permissions','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_role_permissions','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_role_permissions','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_role_permissions','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_role_permissions','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_role_permissions','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_role_permissions','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_role_permissions','role','2020-05-21 15:43:29','n_diff_pfx01',0,1,'role_id'),('chamilo','c_role_permissions','role','2020-05-21 15:43:29','n_diff_pfx02',0,1,'role_id,iid'),('chamilo','c_role_permissions','role','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_role_permissions','role','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_role_user','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_role_user','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_role_user','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_role_user','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_role_user','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_role_user','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_role_user','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_role_user','user','2020-05-21 15:43:29','n_diff_pfx01',0,1,'user_id'),('chamilo','c_role_user','user','2020-05-21 15:43:29','n_diff_pfx02',0,1,'user_id,iid'),('chamilo','c_role_user','user','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_role_user','user','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',0,1,'iid'),('chamilo','c_student_publication','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication','course','2020-05-21 15:43:32','n_diff_pfx01',0,1,'c_id'),('chamilo','c_student_publication','course','2020-05-21 15:43:32','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_student_publication','course','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication','course','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication','idx_csp_u','2020-05-21 15:43:32','n_diff_pfx01',0,1,'user_id'),('chamilo','c_student_publication','idx_csp_u','2020-05-21 15:43:32','n_diff_pfx02',0,1,'user_id,iid'),('chamilo','c_student_publication','idx_csp_u','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication','idx_csp_u','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication','session_id','2020-05-21 15:43:32','n_diff_pfx01',0,1,'session_id'),('chamilo','c_student_publication','session_id','2020-05-21 15:43:32','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_student_publication','session_id','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication','session_id','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication_assignment','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_student_publication_assignment','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication_assignment','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication_assignment','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_student_publication_assignment','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_student_publication_assignment','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication_assignment','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication_comment','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_student_publication_comment','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication_comment','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication_comment','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_student_publication_comment','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_student_publication_comment','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication_comment','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication_comment','user','2020-05-21 15:43:29','n_diff_pfx01',0,1,'user_id'),('chamilo','c_student_publication_comment','user','2020-05-21 15:43:29','n_diff_pfx02',0,1,'user_id,iid'),('chamilo','c_student_publication_comment','user','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication_comment','user','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication_comment','work','2020-05-21 15:43:29','n_diff_pfx01',0,1,'work_id'),('chamilo','c_student_publication_comment','work','2020-05-21 15:43:29','n_diff_pfx02',0,1,'work_id,iid'),('chamilo','c_student_publication_comment','work','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication_comment','work','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication_rel_document','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_student_publication_rel_document','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication_rel_document','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication_rel_document','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_student_publication_rel_document','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_student_publication_rel_document','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication_rel_document','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication_rel_document','document','2020-05-21 15:43:30','n_diff_pfx01',0,1,'document_id'),('chamilo','c_student_publication_rel_document','document','2020-05-21 15:43:30','n_diff_pfx02',0,1,'document_id,iid'),('chamilo','c_student_publication_rel_document','document','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication_rel_document','document','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication_rel_document','work','2020-05-21 15:43:30','n_diff_pfx01',0,1,'work_id'),('chamilo','c_student_publication_rel_document','work','2020-05-21 15:43:30','n_diff_pfx02',0,1,'work_id,iid'),('chamilo','c_student_publication_rel_document','work','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication_rel_document','work','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication_rel_user','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_student_publication_rel_user','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication_rel_user','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication_rel_user','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_student_publication_rel_user','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_student_publication_rel_user','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication_rel_user','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication_rel_user','user','2020-05-21 15:43:30','n_diff_pfx01',0,1,'user_id'),('chamilo','c_student_publication_rel_user','user','2020-05-21 15:43:30','n_diff_pfx02',0,1,'user_id,iid'),('chamilo','c_student_publication_rel_user','user','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication_rel_user','user','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_student_publication_rel_user','work','2020-05-21 15:43:30','n_diff_pfx01',0,1,'work_id'),('chamilo','c_student_publication_rel_user','work','2020-05-21 15:43:30','n_diff_pfx02',0,1,'work_id,iid'),('chamilo','c_student_publication_rel_user','work','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_student_publication_rel_user','work','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_survey','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_survey','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_survey','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_survey','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_survey','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_survey','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_survey','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_survey','session_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_survey','session_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_survey','session_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_survey','session_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_survey_answer','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_survey_answer','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_survey_answer','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_survey_answer','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_survey_answer','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_survey_answer','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_survey_answer','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_survey_group','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_survey_group','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_survey_group','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_survey_group','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_survey_group','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_survey_group','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_survey_group','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_survey_invitation','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_survey_invitation','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_survey_invitation','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_survey_invitation','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_survey_invitation','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_survey_invitation','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_survey_invitation','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_survey_question','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_survey_question','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_survey_question','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_survey_question','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_survey_question','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_survey_question','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_survey_question','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_survey_question_option','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_survey_question_option','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_survey_question_option','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_survey_question_option','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_survey_question_option','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_survey_question_option','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_survey_question_option','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_thematic','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_thematic','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_thematic','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_thematic','active','2020-05-21 15:43:30','n_diff_pfx01',0,1,'active'),('chamilo','c_thematic','active','2020-05-21 15:43:30','n_diff_pfx02',0,1,'active,session_id'),('chamilo','c_thematic','active','2020-05-21 15:43:30','n_diff_pfx03',0,1,'active,session_id,iid'),('chamilo','c_thematic','active','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_thematic','active','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_thematic','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_thematic','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_thematic','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_thematic','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_thematic_advance','IDX_62798E9754177093','2020-05-21 15:43:32','n_diff_pfx01',0,1,'room_id'),('chamilo','c_thematic_advance','IDX_62798E9754177093','2020-05-21 15:43:32','n_diff_pfx02',0,1,'room_id,iid'),('chamilo','c_thematic_advance','IDX_62798E9754177093','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_thematic_advance','IDX_62798E9754177093','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_thematic_advance','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',0,1,'iid'),('chamilo','c_thematic_advance','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_thematic_advance','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_thematic_advance','course','2020-05-21 15:43:32','n_diff_pfx01',0,1,'c_id'),('chamilo','c_thematic_advance','course','2020-05-21 15:43:32','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_thematic_advance','course','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_thematic_advance','course','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_thematic_advance','thematic_id','2020-05-21 15:43:32','n_diff_pfx01',0,1,'thematic_id'),('chamilo','c_thematic_advance','thematic_id','2020-05-21 15:43:32','n_diff_pfx02',0,1,'thematic_id,iid'),('chamilo','c_thematic_advance','thematic_id','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_thematic_advance','thematic_id','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','c_thematic_plan','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_thematic_plan','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_thematic_plan','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_thematic_plan','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_thematic_plan','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_thematic_plan','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_thematic_plan','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_thematic_plan','thematic_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'thematic_id'),('chamilo','c_thematic_plan','thematic_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'thematic_id,description_type'),('chamilo','c_thematic_plan','thematic_id','2020-05-21 15:43:30','n_diff_pfx03',0,1,'thematic_id,description_type,iid'),('chamilo','c_thematic_plan','thematic_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_thematic_plan','thematic_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_tool','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_tool','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_tool','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_tool','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_tool','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_tool','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_tool','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_tool','session_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'session_id'),('chamilo','c_tool','session_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_tool','session_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_tool','session_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_tool_intro','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_tool_intro','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_tool_intro','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_tool_intro','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_tool_intro','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_tool_intro','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_tool_intro','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_userinfo_content','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_userinfo_content','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_userinfo_content','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_userinfo_content','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_userinfo_content','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_userinfo_content','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_userinfo_content','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_userinfo_content','user_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'user_id'),('chamilo','c_userinfo_content','user_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'user_id,iid'),('chamilo','c_userinfo_content','user_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_userinfo_content','user_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_userinfo_def','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_userinfo_def','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_userinfo_def','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_userinfo_def','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_userinfo_def','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_userinfo_def','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_userinfo_def','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_wiki','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_wiki','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_wiki','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_wiki','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_wiki','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_wiki','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_wiki','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_wiki','group_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'group_id'),('chamilo','c_wiki','group_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'group_id,iid'),('chamilo','c_wiki','group_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_wiki','group_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_wiki','page_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'page_id'),('chamilo','c_wiki','page_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'page_id,iid'),('chamilo','c_wiki','page_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_wiki','page_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_wiki','reflink','2020-05-21 15:43:30','n_diff_pfx01',0,1,'reflink'),('chamilo','c_wiki','reflink','2020-05-21 15:43:30','n_diff_pfx02',0,1,'reflink,iid'),('chamilo','c_wiki','reflink','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_wiki','reflink','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_wiki','session_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'session_id'),('chamilo','c_wiki','session_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'session_id,iid'),('chamilo','c_wiki','session_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_wiki','session_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_wiki_conf','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_wiki_conf','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_wiki_conf','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_wiki_conf','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_wiki_conf','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_wiki_conf','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_wiki_conf','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_wiki_conf','page_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'page_id'),('chamilo','c_wiki_conf','page_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'page_id,iid'),('chamilo','c_wiki_conf','page_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_wiki_conf','page_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_wiki_discuss','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'iid'),('chamilo','c_wiki_discuss','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_wiki_discuss','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_wiki_discuss','course','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','c_wiki_discuss','course','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_wiki_discuss','course','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_wiki_discuss','course','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','c_wiki_mailcue','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'iid'),('chamilo','c_wiki_mailcue','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_wiki_mailcue','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_wiki_mailcue','c_id','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_wiki_mailcue','c_id','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,id'),('chamilo','c_wiki_mailcue','c_id','2020-05-21 15:43:30','n_diff_pfx03',0,1,'c_id,id,iid'),('chamilo','c_wiki_mailcue','c_id','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_wiki_mailcue','c_id','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_wiki_mailcue','course','2020-05-21 15:43:30','n_diff_pfx01',0,1,'c_id'),('chamilo','c_wiki_mailcue','course','2020-05-21 15:43:30','n_diff_pfx02',0,1,'c_id,iid'),('chamilo','c_wiki_mailcue','course','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_wiki_mailcue','course','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','c_wiki_mailcue','user','2020-05-21 15:43:30','n_diff_pfx01',0,1,'user_id'),('chamilo','c_wiki_mailcue','user','2020-05-21 15:43:30','n_diff_pfx02',0,1,'user_id,iid'),('chamilo','c_wiki_mailcue','user','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','c_wiki_mailcue','user','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','career','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','career','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','career','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','chat','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','chat','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','chat','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','chat','idx_chat_from_user','2020-05-21 15:43:28','n_diff_pfx01',0,1,'from_user'),('chamilo','chat','idx_chat_from_user','2020-05-21 15:43:28','n_diff_pfx02',0,1,'from_user,id'),('chamilo','chat','idx_chat_from_user','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','chat','idx_chat_from_user','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','chat','idx_chat_to_user','2020-05-21 15:43:28','n_diff_pfx01',0,1,'to_user'),('chamilo','chat','idx_chat_to_user','2020-05-21 15:43:28','n_diff_pfx02',0,1,'to_user,id'),('chamilo','chat','idx_chat_to_user','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','chat','idx_chat_to_user','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','chat_video','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','chat_video','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','chat_video','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','chat_video','idx_chat_video_from_user','2020-05-21 15:43:28','n_diff_pfx01',0,1,'from_user'),('chamilo','chat_video','idx_chat_video_from_user','2020-05-21 15:43:28','n_diff_pfx02',0,1,'from_user,id'),('chamilo','chat_video','idx_chat_video_from_user','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','chat_video','idx_chat_video_from_user','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','chat_video','idx_chat_video_room_name','2020-05-21 15:43:28','n_diff_pfx01',0,1,'room_name'),('chamilo','chat_video','idx_chat_video_room_name','2020-05-21 15:43:28','n_diff_pfx02',0,1,'room_name,id'),('chamilo','chat_video','idx_chat_video_room_name','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','chat_video','idx_chat_video_room_name','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','chat_video','idx_chat_video_to_user','2020-05-21 15:43:28','n_diff_pfx01',0,1,'to_user'),('chamilo','chat_video','idx_chat_video_to_user','2020-05-21 15:43:28','n_diff_pfx02',0,1,'to_user,id'),('chamilo','chat_video','idx_chat_video_to_user','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','chat_video','idx_chat_video_to_user','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','chat_video','idx_chat_video_users','2020-05-21 15:43:28','n_diff_pfx01',0,1,'from_user'),('chamilo','chat_video','idx_chat_video_users','2020-05-21 15:43:28','n_diff_pfx02',0,1,'from_user,to_user'),('chamilo','chat_video','idx_chat_video_users','2020-05-21 15:43:28','n_diff_pfx03',0,1,'from_user,to_user,id'),('chamilo','chat_video','idx_chat_video_users','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','chat_video','idx_chat_video_users','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','class_item','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','class_item','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','class_item','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','class_user','PRIMARY','2020-05-21 15:43:25','n_diff_pfx01',0,1,'class_id'),('chamilo','class_user','PRIMARY','2020-05-21 15:43:25','n_diff_pfx02',0,1,'class_id,user_id'),('chamilo','class_user','PRIMARY','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','class_user','PRIMARY','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','course','IDX_169E6FB954177093','2020-05-21 15:43:31','n_diff_pfx01',0,1,'room_id'),('chamilo','course','IDX_169E6FB954177093','2020-05-21 15:43:31','n_diff_pfx02',0,1,'room_id,id'),('chamilo','course','IDX_169E6FB954177093','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course','IDX_169E6FB954177093','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','course','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','course','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','course','UNIQ_169E6FB977153098','2020-05-21 15:43:31','n_diff_pfx01',0,1,'code'),('chamilo','course','UNIQ_169E6FB977153098','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course','UNIQ_169E6FB977153098','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','course','category_code','2020-05-21 15:43:31','n_diff_pfx01',0,1,'category_code'),('chamilo','course','category_code','2020-05-21 15:43:31','n_diff_pfx02',0,1,'category_code,id'),('chamilo','course','category_code','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course','category_code','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','course','directory','2020-05-21 15:43:31','n_diff_pfx01',0,1,'directory'),('chamilo','course','directory','2020-05-21 15:43:31','n_diff_pfx02',0,1,'directory,id'),('chamilo','course','directory','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course','directory','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','course_category','PRIMARY','2020-05-21 15:43:33','n_diff_pfx01',3,1,'id'),('chamilo','course_category','PRIMARY','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course_category','PRIMARY','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','course_category','code','2020-05-21 15:43:33','n_diff_pfx01',3,1,'code'),('chamilo','course_category','code','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course_category','code','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','course_category','parent_id','2020-05-21 15:43:33','n_diff_pfx01',1,1,'parent_id'),('chamilo','course_category','parent_id','2020-05-21 15:43:33','n_diff_pfx02',3,1,'parent_id,id'),('chamilo','course_category','parent_id','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course_category','parent_id','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','course_category','tree_pos','2020-05-21 15:43:33','n_diff_pfx01',3,1,'tree_pos'),('chamilo','course_category','tree_pos','2020-05-21 15:43:33','n_diff_pfx02',3,1,'tree_pos,id'),('chamilo','course_category','tree_pos','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course_category','tree_pos','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','course_module','PRIMARY','2020-05-21 15:43:33','n_diff_pfx01',28,1,'id'),('chamilo','course_module','PRIMARY','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course_module','PRIMARY','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','course_rel_class','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'course_code'),('chamilo','course_rel_class','PRIMARY','2020-05-21 15:43:29','n_diff_pfx02',0,1,'course_code,class_id'),('chamilo','course_rel_class','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course_rel_class','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','course_rel_user','IDX_92CFD9FE91D79BD3','2020-05-21 15:43:32','n_diff_pfx01',0,1,'c_id'),('chamilo','course_rel_user','IDX_92CFD9FE91D79BD3','2020-05-21 15:43:32','n_diff_pfx02',0,1,'c_id,id'),('chamilo','course_rel_user','IDX_92CFD9FE91D79BD3','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course_rel_user','IDX_92CFD9FE91D79BD3','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','course_rel_user','IDX_92CFD9FEA76ED395','2020-05-21 15:43:32','n_diff_pfx01',0,1,'user_id'),('chamilo','course_rel_user','IDX_92CFD9FEA76ED395','2020-05-21 15:43:32','n_diff_pfx02',0,1,'user_id,id'),('chamilo','course_rel_user','IDX_92CFD9FEA76ED395','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course_rel_user','IDX_92CFD9FEA76ED395','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','course_rel_user','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',0,1,'id'),('chamilo','course_rel_user','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course_rel_user','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','course_rel_user_catalogue','IDX_79CA412E91D79BD3','2020-05-21 15:43:31','n_diff_pfx01',0,1,'c_id'),('chamilo','course_rel_user_catalogue','IDX_79CA412E91D79BD3','2020-05-21 15:43:31','n_diff_pfx02',0,1,'c_id,id'),('chamilo','course_rel_user_catalogue','IDX_79CA412E91D79BD3','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course_rel_user_catalogue','IDX_79CA412E91D79BD3','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','course_rel_user_catalogue','IDX_79CA412EA76ED395','2020-05-21 15:43:31','n_diff_pfx01',0,1,'user_id'),('chamilo','course_rel_user_catalogue','IDX_79CA412EA76ED395','2020-05-21 15:43:31','n_diff_pfx02',0,1,'user_id,id'),('chamilo','course_rel_user_catalogue','IDX_79CA412EA76ED395','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course_rel_user_catalogue','IDX_79CA412EA76ED395','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','course_rel_user_catalogue','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','course_rel_user_catalogue','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course_rel_user_catalogue','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','course_request','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'id'),('chamilo','course_request','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course_request','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','course_request','code','2020-05-21 15:43:29','n_diff_pfx01',0,1,'code'),('chamilo','course_request','code','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course_request','code','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','course_type','PRIMARY','2020-05-21 15:43:33','n_diff_pfx01',2,1,'id'),('chamilo','course_type','PRIMARY','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','course_type','PRIMARY','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','event_email_template','PRIMARY','2020-05-21 15:43:25','n_diff_pfx01',0,1,'id'),('chamilo','event_email_template','PRIMARY','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','event_email_template','PRIMARY','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','event_email_template','event_name_index','2020-05-21 15:43:25','n_diff_pfx01',0,1,'event_type_name'),('chamilo','event_email_template','event_name_index','2020-05-21 15:43:25','n_diff_pfx02',0,1,'event_type_name,id'),('chamilo','event_email_template','event_name_index','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','event_email_template','event_name_index','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','event_sent','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','event_sent','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','event_sent','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','event_sent','event_name_index','2020-05-21 15:43:27','n_diff_pfx01',0,1,'event_type_name'),('chamilo','event_sent','event_name_index','2020-05-21 15:43:27','n_diff_pfx02',0,1,'event_type_name,id'),('chamilo','event_sent','event_name_index','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','event_sent','event_name_index','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field','PRIMARY','2020-05-21 15:43:33','n_diff_pfx01',17,1,'id'),('chamilo','extra_field','PRIMARY','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field','PRIMARY','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field_option_rel_field_option','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','extra_field_option_rel_field_option','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field_option_rel_field_option','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field_option_rel_field_option','idx','2020-05-21 15:43:28','n_diff_pfx01',0,1,'field_id'),('chamilo','extra_field_option_rel_field_option','idx','2020-05-21 15:43:28','n_diff_pfx02',0,1,'field_id,role_id'),('chamilo','extra_field_option_rel_field_option','idx','2020-05-21 15:43:28','n_diff_pfx03',0,1,'field_id,role_id,field_option_id'),('chamilo','extra_field_option_rel_field_option','idx','2020-05-21 15:43:28','n_diff_pfx04',0,1,'field_id,role_id,field_option_id,related_field_option_id'),('chamilo','extra_field_option_rel_field_option','idx','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field_option_rel_field_option','idx','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field_options','IDX_A572E3AE443707B0','2020-05-21 15:43:33','n_diff_pfx01',3,1,'field_id'),('chamilo','extra_field_options','IDX_A572E3AE443707B0','2020-05-21 15:43:33','n_diff_pfx02',9,1,'field_id,id'),('chamilo','extra_field_options','IDX_A572E3AE443707B0','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field_options','IDX_A572E3AE443707B0','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field_options','PRIMARY','2020-05-21 15:43:33','n_diff_pfx01',9,1,'id'),('chamilo','extra_field_options','PRIMARY','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field_options','PRIMARY','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field_rel_tag','PRIMARY','2020-05-21 15:43:25','n_diff_pfx01',0,1,'id'),('chamilo','extra_field_rel_tag','PRIMARY','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field_rel_tag','PRIMARY','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field_rel_tag','field','2020-05-21 15:43:25','n_diff_pfx01',0,1,'field_id'),('chamilo','extra_field_rel_tag','field','2020-05-21 15:43:25','n_diff_pfx02',0,1,'field_id,id'),('chamilo','extra_field_rel_tag','field','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field_rel_tag','field','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field_rel_tag','field_item_tag','2020-05-21 15:43:25','n_diff_pfx01',0,1,'field_id'),('chamilo','extra_field_rel_tag','field_item_tag','2020-05-21 15:43:25','n_diff_pfx02',0,1,'field_id,item_id'),('chamilo','extra_field_rel_tag','field_item_tag','2020-05-21 15:43:25','n_diff_pfx03',0,1,'field_id,item_id,tag_id'),('chamilo','extra_field_rel_tag','field_item_tag','2020-05-21 15:43:25','n_diff_pfx04',0,1,'field_id,item_id,tag_id,id'),('chamilo','extra_field_rel_tag','field_item_tag','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field_rel_tag','field_item_tag','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field_rel_tag','item','2020-05-21 15:43:25','n_diff_pfx01',0,1,'item_id'),('chamilo','extra_field_rel_tag','item','2020-05-21 15:43:25','n_diff_pfx02',0,1,'item_id,id'),('chamilo','extra_field_rel_tag','item','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field_rel_tag','item','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field_rel_tag','tag','2020-05-21 15:43:25','n_diff_pfx01',0,1,'tag_id'),('chamilo','extra_field_rel_tag','tag','2020-05-21 15:43:25','n_diff_pfx02',0,1,'tag_id,id'),('chamilo','extra_field_rel_tag','tag','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field_rel_tag','tag','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field_saved_search','IDX_16ABE32A443707B0','2020-05-21 15:43:31','n_diff_pfx01',0,1,'field_id'),('chamilo','extra_field_saved_search','IDX_16ABE32A443707B0','2020-05-21 15:43:31','n_diff_pfx02',0,1,'field_id,id'),('chamilo','extra_field_saved_search','IDX_16ABE32A443707B0','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field_saved_search','IDX_16ABE32A443707B0','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field_saved_search','IDX_16ABE32AA76ED395','2020-05-21 15:43:31','n_diff_pfx01',0,1,'user_id'),('chamilo','extra_field_saved_search','IDX_16ABE32AA76ED395','2020-05-21 15:43:31','n_diff_pfx02',0,1,'user_id,id'),('chamilo','extra_field_saved_search','IDX_16ABE32AA76ED395','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field_saved_search','IDX_16ABE32AA76ED395','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field_saved_search','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','extra_field_saved_search','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field_saved_search','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field_values','IDX_171DF924443707B0','2020-05-21 16:05:11','n_diff_pfx01',14,1,'field_id'),('chamilo','extra_field_values','IDX_171DF924443707B0','2020-05-21 16:05:11','n_diff_pfx02',17,1,'field_id,id'),('chamilo','extra_field_values','IDX_171DF924443707B0','2020-05-21 16:05:11','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field_values','IDX_171DF924443707B0','2020-05-21 16:05:11','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field_values','PRIMARY','2020-05-21 16:05:11','n_diff_pfx01',17,1,'id'),('chamilo','extra_field_values','PRIMARY','2020-05-21 16:05:11','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field_values','PRIMARY','2020-05-21 16:05:11','size',1,NULL,'Number of pages in the index'),('chamilo','extra_field_values','idx_efv_fiii','2020-05-21 16:05:11','n_diff_pfx01',14,1,'field_id'),('chamilo','extra_field_values','idx_efv_fiii','2020-05-21 16:05:11','n_diff_pfx02',17,1,'field_id,item_id'),('chamilo','extra_field_values','idx_efv_fiii','2020-05-21 16:05:11','n_diff_pfx03',17,1,'field_id,item_id,id'),('chamilo','extra_field_values','idx_efv_fiii','2020-05-21 16:05:11','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','extra_field_values','idx_efv_fiii','2020-05-21 16:05:11','size',1,NULL,'Number of pages in the index'),('chamilo','fos_group','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'id'),('chamilo','fos_group','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','fos_group','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','fos_group','UNIQ_4B019DDB77153098','2020-05-21 15:43:29','n_diff_pfx01',0,1,'code'),('chamilo','fos_group','UNIQ_4B019DDB77153098','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','fos_group','UNIQ_4B019DDB77153098','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','fos_user_user_group','IDX_B3C77447A76ED395','2020-05-21 15:43:32','n_diff_pfx01',0,1,'user_id'),('chamilo','fos_user_user_group','IDX_B3C77447A76ED395','2020-05-21 15:43:32','n_diff_pfx02',0,1,'user_id,group_id'),('chamilo','fos_user_user_group','IDX_B3C77447A76ED395','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','fos_user_user_group','IDX_B3C77447A76ED395','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','fos_user_user_group','IDX_B3C77447FE54D947','2020-05-21 15:43:32','n_diff_pfx01',0,1,'group_id'),('chamilo','fos_user_user_group','IDX_B3C77447FE54D947','2020-05-21 15:43:32','n_diff_pfx02',0,1,'group_id,user_id'),('chamilo','fos_user_user_group','IDX_B3C77447FE54D947','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','fos_user_user_group','IDX_B3C77447FE54D947','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','fos_user_user_group','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',0,1,'user_id'),('chamilo','fos_user_user_group','PRIMARY','2020-05-21 15:43:32','n_diff_pfx02',0,1,'user_id,group_id'),('chamilo','fos_user_user_group','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','fos_user_user_group','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','grade_components','PRIMARY','2020-05-21 15:43:26','n_diff_pfx01',0,1,'id'),('chamilo','grade_components','PRIMARY','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','grade_components','PRIMARY','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','grade_model','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','grade_model','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','grade_model','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','gradebook_category','PRIMARY','2020-05-21 15:43:26','n_diff_pfx01',0,1,'id'),('chamilo','gradebook_category','PRIMARY','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','gradebook_category','PRIMARY','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','gradebook_certificate','PRIMARY','2020-05-21 15:43:26','n_diff_pfx01',0,1,'id'),('chamilo','gradebook_certificate','PRIMARY','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','gradebook_certificate','PRIMARY','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','gradebook_certificate','idx_gradebook_certificate_category_id','2020-05-21 15:43:26','n_diff_pfx01',0,1,'cat_id'),('chamilo','gradebook_certificate','idx_gradebook_certificate_category_id','2020-05-21 15:43:26','n_diff_pfx02',0,1,'cat_id,id'),('chamilo','gradebook_certificate','idx_gradebook_certificate_category_id','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','gradebook_certificate','idx_gradebook_certificate_category_id','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','gradebook_certificate','idx_gradebook_certificate_category_id_user_id','2020-05-21 15:43:26','n_diff_pfx01',0,1,'cat_id'),('chamilo','gradebook_certificate','idx_gradebook_certificate_category_id_user_id','2020-05-21 15:43:26','n_diff_pfx02',0,1,'cat_id,user_id'),('chamilo','gradebook_certificate','idx_gradebook_certificate_category_id_user_id','2020-05-21 15:43:26','n_diff_pfx03',0,1,'cat_id,user_id,id'),('chamilo','gradebook_certificate','idx_gradebook_certificate_category_id_user_id','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','gradebook_certificate','idx_gradebook_certificate_category_id_user_id','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','gradebook_certificate','idx_gradebook_certificate_user_id','2020-05-21 15:43:26','n_diff_pfx01',0,1,'user_id'),('chamilo','gradebook_certificate','idx_gradebook_certificate_user_id','2020-05-21 15:43:26','n_diff_pfx02',0,1,'user_id,id'),('chamilo','gradebook_certificate','idx_gradebook_certificate_user_id','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','gradebook_certificate','idx_gradebook_certificate_user_id','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','gradebook_evaluation','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','gradebook_evaluation','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','gradebook_evaluation','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','gradebook_link','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','gradebook_link','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','gradebook_link','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','gradebook_linkeval_log','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'id'),('chamilo','gradebook_linkeval_log','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','gradebook_linkeval_log','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','gradebook_result','PRIMARY','2020-05-21 15:43:25','n_diff_pfx01',0,1,'id'),('chamilo','gradebook_result','PRIMARY','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','gradebook_result','PRIMARY','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','gradebook_result_log','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','gradebook_result_log','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','gradebook_result_log','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','gradebook_score_display','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','gradebook_score_display','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','gradebook_score_display','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','gradebook_score_display','category_id','2020-05-21 15:43:27','n_diff_pfx01',0,1,'category_id'),('chamilo','gradebook_score_display','category_id','2020-05-21 15:43:27','n_diff_pfx02',0,1,'category_id,id'),('chamilo','gradebook_score_display','category_id','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','gradebook_score_display','category_id','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','gradebook_score_log','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','gradebook_score_log','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','gradebook_score_log','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','gradebook_score_log','idx_gradebook_score_log_user','2020-05-21 15:43:27','n_diff_pfx01',0,1,'user_id'),('chamilo','gradebook_score_log','idx_gradebook_score_log_user','2020-05-21 15:43:27','n_diff_pfx02',0,1,'user_id,id'),('chamilo','gradebook_score_log','idx_gradebook_score_log_user','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','gradebook_score_log','idx_gradebook_score_log_user','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','gradebook_score_log','idx_gradebook_score_log_user_category','2020-05-21 15:43:27','n_diff_pfx01',0,1,'user_id'),('chamilo','gradebook_score_log','idx_gradebook_score_log_user_category','2020-05-21 15:43:27','n_diff_pfx02',0,1,'user_id,category_id'),('chamilo','gradebook_score_log','idx_gradebook_score_log_user_category','2020-05-21 15:43:27','n_diff_pfx03',0,1,'user_id,category_id,id'),('chamilo','gradebook_score_log','idx_gradebook_score_log_user_category','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','gradebook_score_log','idx_gradebook_score_log_user_category','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','hook_call','PRIMARY','2020-05-21 15:59:41','n_diff_pfx01',4,1,'id'),('chamilo','hook_call','PRIMARY','2020-05-21 15:59:41','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','hook_call','PRIMARY','2020-05-21 15:59:41','size',1,NULL,'Number of pages in the index'),('chamilo','hook_event','PRIMARY','2020-05-21 15:59:31','n_diff_pfx01',2,1,'id'),('chamilo','hook_event','PRIMARY','2020-05-21 15:59:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','hook_event','PRIMARY','2020-05-21 15:59:31','size',1,NULL,'Number of pages in the index'),('chamilo','hook_event','class_name','2020-05-21 15:59:31','n_diff_pfx01',2,1,'class_name'),('chamilo','hook_event','class_name','2020-05-21 15:59:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','hook_event','class_name','2020-05-21 15:59:31','size',1,NULL,'Number of pages in the index'),('chamilo','hook_observer','PRIMARY','2020-05-21 15:59:31','n_diff_pfx01',2,1,'id'),('chamilo','hook_observer','PRIMARY','2020-05-21 15:59:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','hook_observer','PRIMARY','2020-05-21 15:59:31','size',1,NULL,'Number of pages in the index'),('chamilo','hook_observer','class_name','2020-05-21 15:59:31','n_diff_pfx01',2,1,'class_name'),('chamilo','hook_observer','class_name','2020-05-21 15:59:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','hook_observer','class_name','2020-05-21 15:59:31','size',1,NULL,'Number of pages in the index'),('chamilo','language','IDX_D4DB71B5727ACA70','2020-05-21 15:43:32','n_diff_pfx01',6,1,'parent_id'),('chamilo','language','IDX_D4DB71B5727ACA70','2020-05-21 15:43:32','n_diff_pfx02',60,1,'parent_id,id'),('chamilo','language','IDX_D4DB71B5727ACA70','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','language','IDX_D4DB71B5727ACA70','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','language','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',60,1,'id'),('chamilo','language','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','language','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','language','idx_language_dokeos_folder','2020-05-21 15:43:32','n_diff_pfx01',60,1,'dokeos_folder'),('chamilo','language','idx_language_dokeos_folder','2020-05-21 15:43:32','n_diff_pfx02',60,1,'dokeos_folder,id'),('chamilo','language','idx_language_dokeos_folder','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','language','idx_language_dokeos_folder','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','legal','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','legal','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','legal','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','message','PRIMARY','2020-05-21 15:43:26','n_diff_pfx01',0,1,'id'),('chamilo','message','PRIMARY','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','message','PRIMARY','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','message','idx_message_group','2020-05-21 15:43:26','n_diff_pfx01',0,1,'group_id'),('chamilo','message','idx_message_group','2020-05-21 15:43:26','n_diff_pfx02',0,1,'group_id,id'),('chamilo','message','idx_message_group','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','message','idx_message_group','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','message','idx_message_parent','2020-05-21 15:43:26','n_diff_pfx01',0,1,'parent_id'),('chamilo','message','idx_message_parent','2020-05-21 15:43:26','n_diff_pfx02',0,1,'parent_id,id'),('chamilo','message','idx_message_parent','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','message','idx_message_parent','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','message','idx_message_user_receiver','2020-05-21 15:43:26','n_diff_pfx01',0,1,'user_receiver_id'),('chamilo','message','idx_message_user_receiver','2020-05-21 15:43:26','n_diff_pfx02',0,1,'user_receiver_id,id'),('chamilo','message','idx_message_user_receiver','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','message','idx_message_user_receiver','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','message','idx_message_user_receiver_status','2020-05-21 15:43:26','n_diff_pfx01',0,1,'user_receiver_id'),('chamilo','message','idx_message_user_receiver_status','2020-05-21 15:43:26','n_diff_pfx02',0,1,'user_receiver_id,msg_status'),('chamilo','message','idx_message_user_receiver_status','2020-05-21 15:43:26','n_diff_pfx03',0,1,'user_receiver_id,msg_status,id'),('chamilo','message','idx_message_user_receiver_status','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','message','idx_message_user_receiver_status','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','message','idx_message_user_sender','2020-05-21 15:43:26','n_diff_pfx01',0,1,'user_sender_id'),('chamilo','message','idx_message_user_sender','2020-05-21 15:43:26','n_diff_pfx02',0,1,'user_sender_id,id'),('chamilo','message','idx_message_user_sender','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','message','idx_message_user_sender','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','message','idx_message_user_sender_user_receiver','2020-05-21 15:43:26','n_diff_pfx01',0,1,'user_sender_id'),('chamilo','message','idx_message_user_sender_user_receiver','2020-05-21 15:43:26','n_diff_pfx02',0,1,'user_sender_id,user_receiver_id'),('chamilo','message','idx_message_user_sender_user_receiver','2020-05-21 15:43:26','n_diff_pfx03',0,1,'user_sender_id,user_receiver_id,id'),('chamilo','message','idx_message_user_sender_user_receiver','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','message','idx_message_user_sender_user_receiver','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','message_attachment','PRIMARY','2020-05-21 15:43:26','n_diff_pfx01',0,1,'id'),('chamilo','message_attachment','PRIMARY','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','message_attachment','PRIMARY','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','notification','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','notification','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','notification','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','notification','mail_notify_freq_index','2020-05-21 15:43:28','n_diff_pfx01',0,1,'sent_at'),('chamilo','notification','mail_notify_freq_index','2020-05-21 15:43:28','n_diff_pfx02',0,1,'sent_at,send_freq'),('chamilo','notification','mail_notify_freq_index','2020-05-21 15:43:28','n_diff_pfx03',0,1,'sent_at,send_freq,created_at'),('chamilo','notification','mail_notify_freq_index','2020-05-21 15:43:28','n_diff_pfx04',0,1,'sent_at,send_freq,created_at,id'),('chamilo','notification','mail_notify_freq_index','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','notification','mail_notify_freq_index','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','notification','mail_notify_sent_index','2020-05-21 15:43:28','n_diff_pfx01',0,1,'sent_at'),('chamilo','notification','mail_notify_sent_index','2020-05-21 15:43:28','n_diff_pfx02',0,1,'sent_at,id'),('chamilo','notification','mail_notify_sent_index','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','notification','mail_notify_sent_index','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','openid_association','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','openid_association','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','openid_association','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','personal_agenda','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','personal_agenda','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','personal_agenda','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','personal_agenda','idx_personal_agenda_parent','2020-05-21 15:43:27','n_diff_pfx01',0,1,'parent_event_id'),('chamilo','personal_agenda','idx_personal_agenda_parent','2020-05-21 15:43:27','n_diff_pfx02',0,1,'parent_event_id,id'),('chamilo','personal_agenda','idx_personal_agenda_parent','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','personal_agenda','idx_personal_agenda_parent','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','personal_agenda','idx_personal_agenda_user','2020-05-21 15:43:27','n_diff_pfx01',0,1,'user'),('chamilo','personal_agenda','idx_personal_agenda_user','2020-05-21 15:43:27','n_diff_pfx02',0,1,'user,id'),('chamilo','personal_agenda','idx_personal_agenda_user','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','personal_agenda','idx_personal_agenda_user','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','personal_agenda_repeat','PRIMARY','2020-05-21 15:43:25','n_diff_pfx01',0,1,'cal_id'),('chamilo','personal_agenda_repeat','PRIMARY','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','personal_agenda_repeat','PRIMARY','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','personal_agenda_repeat_not','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'cal_id'),('chamilo','personal_agenda_repeat_not','PRIMARY','2020-05-21 15:43:29','n_diff_pfx02',0,1,'cal_id,cal_date'),('chamilo','personal_agenda_repeat_not','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','personal_agenda_repeat_not','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','plugin_bbb_meeting','PRIMARY','2020-05-21 15:59:31','n_diff_pfx01',0,1,'id'),('chamilo','plugin_bbb_meeting','PRIMARY','2020-05-21 15:59:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','plugin_bbb_meeting','PRIMARY','2020-05-21 15:59:31','size',1,NULL,'Number of pages in the index'),('chamilo','plugin_bbb_room','PRIMARY','2020-05-21 15:59:31','n_diff_pfx01',0,1,'id'),('chamilo','plugin_bbb_room','PRIMARY','2020-05-21 15:59:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','plugin_bbb_room','PRIMARY','2020-05-21 15:59:31','size',1,NULL,'Number of pages in the index'),('chamilo','promotion','IDX_C11D7DD1B58CDA09','2020-05-21 15:43:32','n_diff_pfx01',0,1,'career_id'),('chamilo','promotion','IDX_C11D7DD1B58CDA09','2020-05-21 15:43:32','n_diff_pfx02',0,1,'career_id,id'),('chamilo','promotion','IDX_C11D7DD1B58CDA09','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','promotion','IDX_C11D7DD1B58CDA09','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','promotion','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',0,1,'id'),('chamilo','promotion','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','promotion','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','room','IDX_729F519BDCD6CC49','2020-05-21 15:43:32','n_diff_pfx01',0,1,'branch_id'),('chamilo','room','IDX_729F519BDCD6CC49','2020-05-21 15:43:32','n_diff_pfx02',0,1,'branch_id,id'),('chamilo','room','IDX_729F519BDCD6CC49','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','room','IDX_729F519BDCD6CC49','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','room','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',0,1,'id'),('chamilo','room','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','room','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','search_engine_ref','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','search_engine_ref','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','search_engine_ref','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','sequence','PRIMARY','2020-05-21 15:43:26','n_diff_pfx01',0,1,'id'),('chamilo','sequence','PRIMARY','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence','PRIMARY','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_condition','PRIMARY','2020-05-21 15:43:33','n_diff_pfx01',2,1,'id'),('chamilo','sequence_condition','PRIMARY','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_condition','PRIMARY','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_formula','IDX_533B915955C65E08','2020-05-21 15:43:33','n_diff_pfx01',8,1,'sequence_variable_id'),('chamilo','sequence_formula','IDX_533B915955C65E08','2020-05-21 15:43:33','n_diff_pfx02',13,1,'sequence_variable_id,id'),('chamilo','sequence_formula','IDX_533B915955C65E08','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_formula','IDX_533B915955C65E08','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_formula','IDX_533B9159B2D1386E','2020-05-21 15:43:33','n_diff_pfx01',11,1,'sequence_method_id'),('chamilo','sequence_formula','IDX_533B9159B2D1386E','2020-05-21 15:43:33','n_diff_pfx02',13,1,'sequence_method_id,id'),('chamilo','sequence_formula','IDX_533B9159B2D1386E','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_formula','IDX_533B9159B2D1386E','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_formula','PRIMARY','2020-05-21 15:43:33','n_diff_pfx01',13,1,'id'),('chamilo','sequence_formula','PRIMARY','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_formula','PRIMARY','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_method','PRIMARY','2020-05-21 15:43:33','n_diff_pfx01',11,1,'id'),('chamilo','sequence_method','PRIMARY','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_method','PRIMARY','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_resource','IDX_34ADA43998FB19AE','2020-05-21 15:43:31','n_diff_pfx01',0,1,'sequence_id'),('chamilo','sequence_resource','IDX_34ADA43998FB19AE','2020-05-21 15:43:31','n_diff_pfx02',0,1,'sequence_id,id'),('chamilo','sequence_resource','IDX_34ADA43998FB19AE','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_resource','IDX_34ADA43998FB19AE','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_resource','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','sequence_resource','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_resource','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_row_entity','IDX_2779761FAED14944','2020-05-21 15:43:31','n_diff_pfx01',0,1,'sequence_type_entity_id'),('chamilo','sequence_row_entity','IDX_2779761FAED14944','2020-05-21 15:43:31','n_diff_pfx02',0,1,'sequence_type_entity_id,id'),('chamilo','sequence_row_entity','IDX_2779761FAED14944','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_row_entity','IDX_2779761FAED14944','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_row_entity','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','sequence_row_entity','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_row_entity','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_rule','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','sequence_rule','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_rule','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_rule_condition','IDX_F948EE6A4044CA89','2020-05-21 15:43:33','n_diff_pfx01',1,1,'sequence_rule_id'),('chamilo','sequence_rule_condition','IDX_F948EE6A4044CA89','2020-05-21 15:43:33','n_diff_pfx02',2,1,'sequence_rule_id,id'),('chamilo','sequence_rule_condition','IDX_F948EE6A4044CA89','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_rule_condition','IDX_F948EE6A4044CA89','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_rule_condition','IDX_F948EE6A8C0A7083','2020-05-21 15:43:33','n_diff_pfx01',2,1,'sequence_condition_id'),('chamilo','sequence_rule_condition','IDX_F948EE6A8C0A7083','2020-05-21 15:43:33','n_diff_pfx02',2,1,'sequence_condition_id,id'),('chamilo','sequence_rule_condition','IDX_F948EE6A8C0A7083','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_rule_condition','IDX_F948EE6A8C0A7083','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_rule_condition','PRIMARY','2020-05-21 15:43:33','n_diff_pfx01',2,1,'id'),('chamilo','sequence_rule_condition','PRIMARY','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_rule_condition','PRIMARY','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_rule_method','IDX_6336EA764044CA89','2020-05-21 15:43:33','n_diff_pfx01',1,1,'sequence_rule_id'),('chamilo','sequence_rule_method','IDX_6336EA764044CA89','2020-05-21 15:43:33','n_diff_pfx02',11,1,'sequence_rule_id,id'),('chamilo','sequence_rule_method','IDX_6336EA764044CA89','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_rule_method','IDX_6336EA764044CA89','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_rule_method','IDX_6336EA76B2D1386E','2020-05-21 15:43:33','n_diff_pfx01',11,1,'sequence_method_id'),('chamilo','sequence_rule_method','IDX_6336EA76B2D1386E','2020-05-21 15:43:33','n_diff_pfx02',11,1,'sequence_method_id,id'),('chamilo','sequence_rule_method','IDX_6336EA76B2D1386E','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_rule_method','IDX_6336EA76B2D1386E','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_rule_method','PRIMARY','2020-05-21 15:43:33','n_diff_pfx01',11,1,'id'),('chamilo','sequence_rule_method','PRIMARY','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_rule_method','PRIMARY','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_type_entity','PRIMARY','2020-05-21 15:43:33','n_diff_pfx01',3,1,'id'),('chamilo','sequence_type_entity','PRIMARY','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_type_entity','PRIMARY','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_valid','IDX_F78B9CE655C65E08','2020-05-21 15:43:33','n_diff_pfx01',1,1,'sequence_variable_id'),('chamilo','sequence_valid','IDX_F78B9CE655C65E08','2020-05-21 15:43:33','n_diff_pfx02',2,1,'sequence_variable_id,id'),('chamilo','sequence_valid','IDX_F78B9CE655C65E08','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_valid','IDX_F78B9CE655C65E08','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_valid','IDX_F78B9CE68C0A7083','2020-05-21 15:43:33','n_diff_pfx01',2,1,'sequence_condition_id'),('chamilo','sequence_valid','IDX_F78B9CE68C0A7083','2020-05-21 15:43:33','n_diff_pfx02',2,1,'sequence_condition_id,id'),('chamilo','sequence_valid','IDX_F78B9CE68C0A7083','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_valid','IDX_F78B9CE68C0A7083','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_valid','PRIMARY','2020-05-21 15:43:33','n_diff_pfx01',2,1,'id'),('chamilo','sequence_valid','PRIMARY','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_valid','PRIMARY','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_value','IDX_66FBF12D218736B2','2020-05-21 15:43:31','n_diff_pfx01',0,1,'sequence_row_entity_id'),('chamilo','sequence_value','IDX_66FBF12D218736B2','2020-05-21 15:43:31','n_diff_pfx02',0,1,'sequence_row_entity_id,id'),('chamilo','sequence_value','IDX_66FBF12D218736B2','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_value','IDX_66FBF12D218736B2','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_value','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','sequence_value','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_value','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','sequence_variable','PRIMARY','2020-05-21 15:43:33','n_diff_pfx01',8,1,'id'),('chamilo','sequence_variable','PRIMARY','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sequence_variable','PRIMARY','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','session','IDX_D044D5D4EE1F8395','2020-05-21 15:43:31','n_diff_pfx01',0,1,'session_category_id'),('chamilo','session','IDX_D044D5D4EE1F8395','2020-05-21 15:43:31','n_diff_pfx02',0,1,'session_category_id,id'),('chamilo','session','IDX_D044D5D4EE1F8395','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session','IDX_D044D5D4EE1F8395','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','session','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session','idx_id_coach','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id_coach'),('chamilo','session','idx_id_coach','2020-05-21 15:43:31','n_diff_pfx02',0,1,'id_coach,id'),('chamilo','session','idx_id_coach','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session','idx_id_coach','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session','idx_id_session_admin_id','2020-05-21 15:43:31','n_diff_pfx01',0,1,'session_admin_id'),('chamilo','session','idx_id_session_admin_id','2020-05-21 15:43:31','n_diff_pfx02',0,1,'session_admin_id,id'),('chamilo','session','idx_id_session_admin_id','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session','idx_id_session_admin_id','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session','name','2020-05-21 15:43:31','n_diff_pfx01',0,1,'name'),('chamilo','session','name','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session','name','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session_category','IDX_8DE079A973444FD5','2020-05-21 15:43:31','n_diff_pfx01',0,1,'access_url_id'),('chamilo','session_category','IDX_8DE079A973444FD5','2020-05-21 15:43:31','n_diff_pfx02',0,1,'access_url_id,id'),('chamilo','session_category','IDX_8DE079A973444FD5','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session_category','IDX_8DE079A973444FD5','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session_category','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','session_category','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session_category','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session_rel_course','IDX_12D110D3613FECDF','2020-05-21 15:43:31','n_diff_pfx01',0,1,'session_id'),('chamilo','session_rel_course','IDX_12D110D3613FECDF','2020-05-21 15:43:31','n_diff_pfx02',0,1,'session_id,id'),('chamilo','session_rel_course','IDX_12D110D3613FECDF','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session_rel_course','IDX_12D110D3613FECDF','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session_rel_course','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','session_rel_course','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session_rel_course','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session_rel_course','idx_session_rel_course_course_id','2020-05-21 15:43:31','n_diff_pfx01',0,1,'c_id'),('chamilo','session_rel_course','idx_session_rel_course_course_id','2020-05-21 15:43:31','n_diff_pfx02',0,1,'c_id,id'),('chamilo','session_rel_course','idx_session_rel_course_course_id','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session_rel_course','idx_session_rel_course_course_id','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session_rel_course_rel_user','IDX_720167E613FECDF','2020-05-21 15:43:31','n_diff_pfx01',0,1,'session_id'),('chamilo','session_rel_course_rel_user','IDX_720167E613FECDF','2020-05-21 15:43:31','n_diff_pfx02',0,1,'session_id,id'),('chamilo','session_rel_course_rel_user','IDX_720167E613FECDF','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session_rel_course_rel_user','IDX_720167E613FECDF','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session_rel_course_rel_user','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','session_rel_course_rel_user','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session_rel_course_rel_user','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session_rel_course_rel_user','idx_session_rel_course_rel_user_course_id','2020-05-21 15:43:31','n_diff_pfx01',0,1,'c_id'),('chamilo','session_rel_course_rel_user','idx_session_rel_course_rel_user_course_id','2020-05-21 15:43:31','n_diff_pfx02',0,1,'c_id,id'),('chamilo','session_rel_course_rel_user','idx_session_rel_course_rel_user_course_id','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session_rel_course_rel_user','idx_session_rel_course_rel_user_course_id','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session_rel_course_rel_user','idx_session_rel_course_rel_user_id_user','2020-05-21 15:43:31','n_diff_pfx01',0,1,'user_id'),('chamilo','session_rel_course_rel_user','idx_session_rel_course_rel_user_id_user','2020-05-21 15:43:31','n_diff_pfx02',0,1,'user_id,id'),('chamilo','session_rel_course_rel_user','idx_session_rel_course_rel_user_id_user','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session_rel_course_rel_user','idx_session_rel_course_rel_user_id_user','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session_rel_user','IDX_B0D7D4C0613FECDF','2020-05-21 15:43:31','n_diff_pfx01',0,1,'session_id'),('chamilo','session_rel_user','IDX_B0D7D4C0613FECDF','2020-05-21 15:43:31','n_diff_pfx02',0,1,'session_id,id'),('chamilo','session_rel_user','IDX_B0D7D4C0613FECDF','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session_rel_user','IDX_B0D7D4C0613FECDF','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session_rel_user','IDX_B0D7D4C0A76ED395','2020-05-21 15:43:31','n_diff_pfx01',0,1,'user_id'),('chamilo','session_rel_user','IDX_B0D7D4C0A76ED395','2020-05-21 15:43:31','n_diff_pfx02',0,1,'user_id,id'),('chamilo','session_rel_user','IDX_B0D7D4C0A76ED395','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session_rel_user','IDX_B0D7D4C0A76ED395','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session_rel_user','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','session_rel_user','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session_rel_user','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','session_rel_user','idx_session_rel_user_id_user_moved','2020-05-21 15:43:31','n_diff_pfx01',0,1,'user_id'),('chamilo','session_rel_user','idx_session_rel_user_id_user_moved','2020-05-21 15:43:31','n_diff_pfx02',0,1,'user_id,moved_to'),('chamilo','session_rel_user','idx_session_rel_user_id_user_moved','2020-05-21 15:43:31','n_diff_pfx03',0,1,'user_id,moved_to,id'),('chamilo','session_rel_user','idx_session_rel_user_id_user_moved','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','session_rel_user','idx_session_rel_user_id_user_moved','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','settings_current','PRIMARY','2020-05-21 15:44:43','n_diff_pfx01',375,4,'id'),('chamilo','settings_current','PRIMARY','2020-05-21 15:44:43','n_leaf_pages',4,NULL,'Number of leaf pages in the index'),('chamilo','settings_current','PRIMARY','2020-05-21 15:44:43','size',5,NULL,'Number of pages in the index'),('chamilo','settings_current','access_url','2020-05-21 15:44:43','n_diff_pfx01',1,1,'access_url'),('chamilo','settings_current','access_url','2020-05-21 15:44:43','n_diff_pfx02',375,1,'access_url,id'),('chamilo','settings_current','access_url','2020-05-21 15:44:43','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','settings_current','access_url','2020-05-21 15:44:43','size',1,NULL,'Number of pages in the index'),('chamilo','settings_current','unique_setting','2020-05-21 15:44:43','n_diff_pfx01',291,1,'variable'),('chamilo','settings_current','unique_setting','2020-05-21 15:44:43','n_diff_pfx02',375,1,'variable,subkey'),('chamilo','settings_current','unique_setting','2020-05-21 15:44:43','n_diff_pfx03',375,1,'variable,subkey,access_url'),('chamilo','settings_current','unique_setting','2020-05-21 15:44:43','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','settings_current','unique_setting','2020-05-21 15:44:43','size',1,NULL,'Number of pages in the index'),('chamilo','settings_options','PRIMARY','2020-05-21 15:43:43','n_diff_pfx01',450,3,'id'),('chamilo','settings_options','PRIMARY','2020-05-21 15:43:43','n_leaf_pages',3,NULL,'Number of leaf pages in the index'),('chamilo','settings_options','PRIMARY','2020-05-21 15:43:43','size',4,NULL,'Number of pages in the index'),('chamilo','settings_options','unique_setting_option','2020-05-21 15:43:43','n_diff_pfx01',210,2,'variable'),('chamilo','settings_options','unique_setting_option','2020-05-21 15:43:43','n_diff_pfx02',450,2,'variable,value'),('chamilo','settings_options','unique_setting_option','2020-05-21 15:43:43','n_leaf_pages',2,NULL,'Number of leaf pages in the index'),('chamilo','settings_options','unique_setting_option','2020-05-21 15:43:43','size',3,NULL,'Number of pages in the index'),('chamilo','shared_survey','PRIMARY','2020-05-21 15:43:26','n_diff_pfx01',0,1,'survey_id'),('chamilo','shared_survey','PRIMARY','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','shared_survey','PRIMARY','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','shared_survey','id','2020-05-21 15:43:26','n_diff_pfx01',0,1,'survey_id'),('chamilo','shared_survey','id','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','shared_survey','id','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','shared_survey_question','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'question_id'),('chamilo','shared_survey_question','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','shared_survey_question','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','shared_survey_question_option','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'question_option_id'),('chamilo','shared_survey_question_option','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','shared_survey_question_option','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','skill','IDX_5E3DE477CCFA12B8','2020-05-21 15:43:31','n_diff_pfx01',0,1,'profile_id'),('chamilo','skill','IDX_5E3DE477CCFA12B8','2020-05-21 15:43:31','n_diff_pfx02',0,1,'profile_id,id'),('chamilo','skill','IDX_5E3DE477CCFA12B8','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill','IDX_5E3DE477CCFA12B8','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','skill','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','skill','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','skill_level','IDX_BFC25F2FCCFA12B8','2020-05-21 15:43:32','n_diff_pfx01',0,1,'profile_id'),('chamilo','skill_level','IDX_BFC25F2FCCFA12B8','2020-05-21 15:43:32','n_diff_pfx02',0,1,'profile_id,id'),('chamilo','skill_level','IDX_BFC25F2FCCFA12B8','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_level','IDX_BFC25F2FCCFA12B8','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','skill_level','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',0,1,'id'),('chamilo','skill_level','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_level','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','skill_level_profile','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','skill_level_profile','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_level_profile','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','skill_profile','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','skill_profile','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_profile','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_gradebook','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','skill_rel_gradebook','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_gradebook','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_profile','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'id'),('chamilo','skill_rel_profile','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_profile','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_skill','PRIMARY','2020-05-21 15:43:26','n_diff_pfx01',0,1,'id'),('chamilo','skill_rel_skill','PRIMARY','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_skill','PRIMARY','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_user','IDX_79D3D95A5585C142','2020-05-21 15:43:31','n_diff_pfx01',0,1,'skill_id'),('chamilo','skill_rel_user','IDX_79D3D95A5585C142','2020-05-21 15:43:31','n_diff_pfx02',0,1,'skill_id,id'),('chamilo','skill_rel_user','IDX_79D3D95A5585C142','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_user','IDX_79D3D95A5585C142','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_user','IDX_79D3D95A591CC992','2020-05-21 15:43:31','n_diff_pfx01',0,1,'course_id'),('chamilo','skill_rel_user','IDX_79D3D95A591CC992','2020-05-21 15:43:31','n_diff_pfx02',0,1,'course_id,id'),('chamilo','skill_rel_user','IDX_79D3D95A591CC992','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_user','IDX_79D3D95A591CC992','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_user','IDX_79D3D95A613FECDF','2020-05-21 15:43:31','n_diff_pfx01',0,1,'session_id'),('chamilo','skill_rel_user','IDX_79D3D95A613FECDF','2020-05-21 15:43:31','n_diff_pfx02',0,1,'session_id,id'),('chamilo','skill_rel_user','IDX_79D3D95A613FECDF','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_user','IDX_79D3D95A613FECDF','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_user','IDX_79D3D95AA76ED395','2020-05-21 15:43:31','n_diff_pfx01',0,1,'user_id'),('chamilo','skill_rel_user','IDX_79D3D95AA76ED395','2020-05-21 15:43:31','n_diff_pfx02',0,1,'user_id,id'),('chamilo','skill_rel_user','IDX_79D3D95AA76ED395','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_user','IDX_79D3D95AA76ED395','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_user','IDX_79D3D95AF68F11CE','2020-05-21 15:43:31','n_diff_pfx01',0,1,'acquired_level'),('chamilo','skill_rel_user','IDX_79D3D95AF68F11CE','2020-05-21 15:43:31','n_diff_pfx02',0,1,'acquired_level,id'),('chamilo','skill_rel_user','IDX_79D3D95AF68F11CE','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_user','IDX_79D3D95AF68F11CE','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_user','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','skill_rel_user','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_user','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_user','idx_select_cs','2020-05-21 15:43:31','n_diff_pfx01',0,1,'course_id'),('chamilo','skill_rel_user','idx_select_cs','2020-05-21 15:43:31','n_diff_pfx02',0,1,'course_id,session_id'),('chamilo','skill_rel_user','idx_select_cs','2020-05-21 15:43:31','n_diff_pfx03',0,1,'course_id,session_id,id'),('chamilo','skill_rel_user','idx_select_cs','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_user','idx_select_cs','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_user','idx_select_s_c_u','2020-05-21 15:43:31','n_diff_pfx01',0,1,'session_id'),('chamilo','skill_rel_user','idx_select_s_c_u','2020-05-21 15:43:31','n_diff_pfx02',0,1,'session_id,course_id'),('chamilo','skill_rel_user','idx_select_s_c_u','2020-05-21 15:43:31','n_diff_pfx03',0,1,'session_id,course_id,user_id'),('chamilo','skill_rel_user','idx_select_s_c_u','2020-05-21 15:43:31','n_diff_pfx04',0,1,'session_id,course_id,user_id,id'),('chamilo','skill_rel_user','idx_select_s_c_u','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_user','idx_select_s_c_u','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_user','idx_select_sk_u','2020-05-21 15:43:31','n_diff_pfx01',0,1,'skill_id'),('chamilo','skill_rel_user','idx_select_sk_u','2020-05-21 15:43:31','n_diff_pfx02',0,1,'skill_id,user_id'),('chamilo','skill_rel_user','idx_select_sk_u','2020-05-21 15:43:31','n_diff_pfx03',0,1,'skill_id,user_id,id'),('chamilo','skill_rel_user','idx_select_sk_u','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_user','idx_select_sk_u','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_user_comment','IDX_7AE9F6B63AF3B65B','2020-05-21 15:43:31','n_diff_pfx01',0,1,'feedback_giver_id'),('chamilo','skill_rel_user_comment','IDX_7AE9F6B63AF3B65B','2020-05-21 15:43:31','n_diff_pfx02',0,1,'feedback_giver_id,id'),('chamilo','skill_rel_user_comment','IDX_7AE9F6B63AF3B65B','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_user_comment','IDX_7AE9F6B63AF3B65B','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_user_comment','IDX_7AE9F6B6484A9317','2020-05-21 15:43:31','n_diff_pfx01',0,1,'skill_rel_user_id'),('chamilo','skill_rel_user_comment','IDX_7AE9F6B6484A9317','2020-05-21 15:43:31','n_diff_pfx02',0,1,'skill_rel_user_id,id'),('chamilo','skill_rel_user_comment','IDX_7AE9F6B6484A9317','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_user_comment','IDX_7AE9F6B6484A9317','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_user_comment','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','skill_rel_user_comment','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_user_comment','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','skill_rel_user_comment','idx_select_su_giver','2020-05-21 15:43:31','n_diff_pfx01',0,1,'skill_rel_user_id'),('chamilo','skill_rel_user_comment','idx_select_su_giver','2020-05-21 15:43:31','n_diff_pfx02',0,1,'skill_rel_user_id,feedback_giver_id'),('chamilo','skill_rel_user_comment','idx_select_su_giver','2020-05-21 15:43:31','n_diff_pfx03',0,1,'skill_rel_user_id,feedback_giver_id,id'),('chamilo','skill_rel_user_comment','idx_select_su_giver','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','skill_rel_user_comment','idx_select_su_giver','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','specific_field','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','specific_field','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','specific_field','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','specific_field','unique_specific_field__code','2020-05-21 15:43:27','n_diff_pfx01',0,1,'code'),('chamilo','specific_field','unique_specific_field__code','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','specific_field','unique_specific_field__code','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','specific_field_values','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','specific_field_values','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','specific_field_values','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','sys_announcement','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','sys_announcement','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sys_announcement','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','sys_calendar','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'id'),('chamilo','sys_calendar','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','sys_calendar','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','system_template','PRIMARY','2020-05-21 15:43:33','n_diff_pfx01',13,3,'id'),('chamilo','system_template','PRIMARY','2020-05-21 15:43:33','n_leaf_pages',3,NULL,'Number of leaf pages in the index'),('chamilo','system_template','PRIMARY','2020-05-21 15:43:33','size',4,NULL,'Number of pages in the index'),('chamilo','tag','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'id'),('chamilo','tag','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','tag','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','templates','PRIMARY','2020-05-21 15:43:26','n_diff_pfx01',0,1,'id'),('chamilo','templates','PRIMARY','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','templates','PRIMARY','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_assigned_log','IDX_54B65868700047D2','2020-05-21 15:43:32','n_diff_pfx01',0,1,'ticket_id'),('chamilo','ticket_assigned_log','IDX_54B65868700047D2','2020-05-21 15:43:32','n_diff_pfx02',0,1,'ticket_id,id'),('chamilo','ticket_assigned_log','IDX_54B65868700047D2','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_assigned_log','IDX_54B65868700047D2','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_assigned_log','IDX_54B65868A76ED395','2020-05-21 15:43:32','n_diff_pfx01',0,1,'user_id'),('chamilo','ticket_assigned_log','IDX_54B65868A76ED395','2020-05-21 15:43:32','n_diff_pfx02',0,1,'user_id,id'),('chamilo','ticket_assigned_log','IDX_54B65868A76ED395','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_assigned_log','IDX_54B65868A76ED395','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_assigned_log','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',0,1,'id'),('chamilo','ticket_assigned_log','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_assigned_log','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_category','IDX_8325E540166D1F9C','2020-05-21 15:45:03','n_diff_pfx01',1,1,'project_id'),('chamilo','ticket_category','IDX_8325E540166D1F9C','2020-05-21 15:45:03','n_diff_pfx02',6,1,'project_id,id'),('chamilo','ticket_category','IDX_8325E540166D1F9C','2020-05-21 15:45:03','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_category','IDX_8325E540166D1F9C','2020-05-21 15:45:03','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_category','PRIMARY','2020-05-21 15:45:03','n_diff_pfx01',6,1,'id'),('chamilo','ticket_category','PRIMARY','2020-05-21 15:45:03','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_category','PRIMARY','2020-05-21 15:45:03','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_category_rel_user','IDX_5B8A98712469DE2','2020-05-21 15:43:32','n_diff_pfx01',0,1,'category_id'),('chamilo','ticket_category_rel_user','IDX_5B8A98712469DE2','2020-05-21 15:43:32','n_diff_pfx02',0,1,'category_id,id'),('chamilo','ticket_category_rel_user','IDX_5B8A98712469DE2','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_category_rel_user','IDX_5B8A98712469DE2','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_category_rel_user','IDX_5B8A987A76ED395','2020-05-21 15:43:32','n_diff_pfx01',0,1,'user_id'),('chamilo','ticket_category_rel_user','IDX_5B8A987A76ED395','2020-05-21 15:43:32','n_diff_pfx02',0,1,'user_id,id'),('chamilo','ticket_category_rel_user','IDX_5B8A987A76ED395','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_category_rel_user','IDX_5B8A987A76ED395','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_category_rel_user','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',0,1,'id'),('chamilo','ticket_category_rel_user','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_category_rel_user','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_message','IDX_BA71692D700047D2','2020-05-21 15:43:32','n_diff_pfx01',0,1,'ticket_id'),('chamilo','ticket_message','IDX_BA71692D700047D2','2020-05-21 15:43:32','n_diff_pfx02',0,1,'ticket_id,id'),('chamilo','ticket_message','IDX_BA71692D700047D2','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_message','IDX_BA71692D700047D2','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_message','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',0,1,'id'),('chamilo','ticket_message','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_message','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_message_attachments','IDX_70BF9E26537A1329','2020-05-21 15:43:32','n_diff_pfx01',0,1,'message_id'),('chamilo','ticket_message_attachments','IDX_70BF9E26537A1329','2020-05-21 15:43:32','n_diff_pfx02',0,1,'message_id,id'),('chamilo','ticket_message_attachments','IDX_70BF9E26537A1329','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_message_attachments','IDX_70BF9E26537A1329','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_message_attachments','IDX_70BF9E26700047D2','2020-05-21 15:43:32','n_diff_pfx01',0,1,'ticket_id'),('chamilo','ticket_message_attachments','IDX_70BF9E26700047D2','2020-05-21 15:43:32','n_diff_pfx02',0,1,'ticket_id,id'),('chamilo','ticket_message_attachments','IDX_70BF9E26700047D2','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_message_attachments','IDX_70BF9E26700047D2','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_message_attachments','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',0,1,'id'),('chamilo','ticket_message_attachments','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_message_attachments','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_priority','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',3,1,'id'),('chamilo','ticket_priority','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_priority','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_project','PRIMARY','2020-05-21 15:43:30','n_diff_pfx01',0,1,'id'),('chamilo','ticket_project','PRIMARY','2020-05-21 15:43:30','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_project','PRIMARY','2020-05-21 15:43:30','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_status','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',5,1,'id'),('chamilo','ticket_status','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_status','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_ticket','IDX_EDE2C76812469DE2','2020-05-21 15:43:32','n_diff_pfx01',0,1,'category_id'),('chamilo','ticket_ticket','IDX_EDE2C76812469DE2','2020-05-21 15:43:32','n_diff_pfx02',0,1,'category_id,id'),('chamilo','ticket_ticket','IDX_EDE2C76812469DE2','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_ticket','IDX_EDE2C76812469DE2','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_ticket','IDX_EDE2C768166D1F9C','2020-05-21 15:43:32','n_diff_pfx01',0,1,'project_id'),('chamilo','ticket_ticket','IDX_EDE2C768166D1F9C','2020-05-21 15:43:32','n_diff_pfx02',0,1,'project_id,id'),('chamilo','ticket_ticket','IDX_EDE2C768166D1F9C','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_ticket','IDX_EDE2C768166D1F9C','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_ticket','IDX_EDE2C768497B19F9','2020-05-21 15:43:32','n_diff_pfx01',0,1,'priority_id'),('chamilo','ticket_ticket','IDX_EDE2C768497B19F9','2020-05-21 15:43:32','n_diff_pfx02',0,1,'priority_id,id'),('chamilo','ticket_ticket','IDX_EDE2C768497B19F9','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_ticket','IDX_EDE2C768497B19F9','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_ticket','IDX_EDE2C768591CC992','2020-05-21 15:43:32','n_diff_pfx01',0,1,'course_id'),('chamilo','ticket_ticket','IDX_EDE2C768591CC992','2020-05-21 15:43:32','n_diff_pfx02',0,1,'course_id,id'),('chamilo','ticket_ticket','IDX_EDE2C768591CC992','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_ticket','IDX_EDE2C768591CC992','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_ticket','IDX_EDE2C768613FECDF','2020-05-21 15:43:32','n_diff_pfx01',0,1,'session_id'),('chamilo','ticket_ticket','IDX_EDE2C768613FECDF','2020-05-21 15:43:32','n_diff_pfx02',0,1,'session_id,id'),('chamilo','ticket_ticket','IDX_EDE2C768613FECDF','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_ticket','IDX_EDE2C768613FECDF','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_ticket','IDX_EDE2C7686BF700BD','2020-05-21 15:43:32','n_diff_pfx01',0,1,'status_id'),('chamilo','ticket_ticket','IDX_EDE2C7686BF700BD','2020-05-21 15:43:32','n_diff_pfx02',0,1,'status_id,id'),('chamilo','ticket_ticket','IDX_EDE2C7686BF700BD','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_ticket','IDX_EDE2C7686BF700BD','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','ticket_ticket','PRIMARY','2020-05-21 15:43:32','n_diff_pfx01',0,1,'id'),('chamilo','ticket_ticket','PRIMARY','2020-05-21 15:43:32','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','ticket_ticket','PRIMARY','2020-05-21 15:43:32','size',1,NULL,'Number of pages in the index'),('chamilo','track_course_ranking','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'id'),('chamilo','track_course_ranking','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_course_ranking','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_course_ranking','idx_tcc_cid','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','track_course_ranking','idx_tcc_cid','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,id'),('chamilo','track_course_ranking','idx_tcc_cid','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_course_ranking','idx_tcc_cid','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_course_ranking','idx_tcc_creation_date','2020-05-21 15:43:29','n_diff_pfx01',0,1,'creation_date'),('chamilo','track_course_ranking','idx_tcc_creation_date','2020-05-21 15:43:29','n_diff_pfx02',0,1,'creation_date,id'),('chamilo','track_course_ranking','idx_tcc_creation_date','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_course_ranking','idx_tcc_creation_date','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_course_ranking','idx_tcc_sid','2020-05-21 15:43:29','n_diff_pfx01',0,1,'session_id'),('chamilo','track_course_ranking','idx_tcc_sid','2020-05-21 15:43:29','n_diff_pfx02',0,1,'session_id,id'),('chamilo','track_course_ranking','idx_tcc_sid','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_course_ranking','idx_tcc_sid','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_course_ranking','idx_tcc_urlid','2020-05-21 15:43:29','n_diff_pfx01',0,1,'url_id'),('chamilo','track_course_ranking','idx_tcc_urlid','2020-05-21 15:43:29','n_diff_pfx02',0,1,'url_id,id'),('chamilo','track_course_ranking','idx_tcc_urlid','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_course_ranking','idx_tcc_urlid','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_access','PRIMARY','2020-05-21 15:43:25','n_diff_pfx01',0,1,'access_id'),('chamilo','track_e_access','PRIMARY','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_access','PRIMARY','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_access','access_c_id','2020-05-21 15:43:25','n_diff_pfx01',0,1,'c_id'),('chamilo','track_e_access','access_c_id','2020-05-21 15:43:25','n_diff_pfx02',0,1,'c_id,access_id'),('chamilo','track_e_access','access_c_id','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_access','access_c_id','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_access','access_session_id','2020-05-21 15:43:25','n_diff_pfx01',0,1,'access_session_id'),('chamilo','track_e_access','access_session_id','2020-05-21 15:43:25','n_diff_pfx02',0,1,'access_session_id,access_id'),('chamilo','track_e_access','access_session_id','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_access','access_session_id','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_access','access_user_id','2020-05-21 15:43:25','n_diff_pfx01',0,1,'access_user_id'),('chamilo','track_e_access','access_user_id','2020-05-21 15:43:25','n_diff_pfx02',0,1,'access_user_id,access_id'),('chamilo','track_e_access','access_user_id','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_access','access_user_id','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_attempt','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','track_e_attempt','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_attempt','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_attempt','course','2020-05-21 15:43:27','n_diff_pfx01',0,1,'c_id'),('chamilo','track_e_attempt','course','2020-05-21 15:43:27','n_diff_pfx02',0,1,'c_id,id'),('chamilo','track_e_attempt','course','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_attempt','course','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_attempt','exe_id','2020-05-21 15:43:27','n_diff_pfx01',0,1,'exe_id'),('chamilo','track_e_attempt','exe_id','2020-05-21 15:43:27','n_diff_pfx02',0,1,'exe_id,id'),('chamilo','track_e_attempt','exe_id','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_attempt','exe_id','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_attempt','question_id','2020-05-21 15:43:27','n_diff_pfx01',0,1,'question_id'),('chamilo','track_e_attempt','question_id','2020-05-21 15:43:27','n_diff_pfx02',0,1,'question_id,id'),('chamilo','track_e_attempt','question_id','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_attempt','question_id','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_attempt','session_id','2020-05-21 15:43:27','n_diff_pfx01',0,1,'session_id'),('chamilo','track_e_attempt','session_id','2020-05-21 15:43:27','n_diff_pfx02',0,1,'session_id,id'),('chamilo','track_e_attempt','session_id','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_attempt','session_id','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_attempt','user_id','2020-05-21 15:43:27','n_diff_pfx01',0,1,'user_id'),('chamilo','track_e_attempt','user_id','2020-05-21 15:43:27','n_diff_pfx02',0,1,'user_id,id'),('chamilo','track_e_attempt','user_id','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_attempt','user_id','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_attempt_coeff','PRIMARY','2020-05-21 15:43:26','n_diff_pfx01',0,1,'id'),('chamilo','track_e_attempt_coeff','PRIMARY','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_attempt_coeff','PRIMARY','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_attempt_recording','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','track_e_attempt_recording','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_attempt_recording','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_attempt_recording','exe_id','2020-05-21 15:43:27','n_diff_pfx01',0,1,'exe_id'),('chamilo','track_e_attempt_recording','exe_id','2020-05-21 15:43:27','n_diff_pfx02',0,1,'exe_id,id'),('chamilo','track_e_attempt_recording','exe_id','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_attempt_recording','exe_id','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_attempt_recording','question_id','2020-05-21 15:43:27','n_diff_pfx01',0,1,'question_id'),('chamilo','track_e_attempt_recording','question_id','2020-05-21 15:43:27','n_diff_pfx02',0,1,'question_id,id'),('chamilo','track_e_attempt_recording','question_id','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_attempt_recording','question_id','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_attempt_recording','session_id','2020-05-21 15:43:27','n_diff_pfx01',0,1,'session_id'),('chamilo','track_e_attempt_recording','session_id','2020-05-21 15:43:27','n_diff_pfx02',0,1,'session_id,id'),('chamilo','track_e_attempt_recording','session_id','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_attempt_recording','session_id','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_course_access','PRIMARY','2020-05-21 15:43:25','n_diff_pfx01',0,1,'course_access_id'),('chamilo','track_e_course_access','PRIMARY','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_course_access','PRIMARY','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_course_access','course','2020-05-21 15:43:25','n_diff_pfx01',0,1,'c_id'),('chamilo','track_e_course_access','course','2020-05-21 15:43:25','n_diff_pfx02',0,1,'c_id,course_access_id'),('chamilo','track_e_course_access','course','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_course_access','course','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_course_access','login_course_date','2020-05-21 15:43:25','n_diff_pfx01',0,1,'login_course_date'),('chamilo','track_e_course_access','login_course_date','2020-05-21 15:43:25','n_diff_pfx02',0,1,'login_course_date,course_access_id'),('chamilo','track_e_course_access','login_course_date','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_course_access','login_course_date','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_course_access','session_id','2020-05-21 15:43:25','n_diff_pfx01',0,1,'session_id'),('chamilo','track_e_course_access','session_id','2020-05-21 15:43:25','n_diff_pfx02',0,1,'session_id,course_access_id'),('chamilo','track_e_course_access','session_id','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_course_access','session_id','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_course_access','user_id','2020-05-21 15:43:25','n_diff_pfx01',0,1,'user_id'),('chamilo','track_e_course_access','user_id','2020-05-21 15:43:25','n_diff_pfx02',0,1,'user_id,course_access_id'),('chamilo','track_e_course_access','user_id','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_course_access','user_id','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_default','PRIMARY','2020-05-21 15:44:33','n_diff_pfx01',2,1,'default_id'),('chamilo','track_e_default','PRIMARY','2020-05-21 15:44:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_default','PRIMARY','2020-05-21 15:44:33','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_default','course','2020-05-21 15:44:33','n_diff_pfx01',1,1,'c_id'),('chamilo','track_e_default','course','2020-05-21 15:44:33','n_diff_pfx02',2,1,'c_id,default_id'),('chamilo','track_e_default','course','2020-05-21 15:44:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_default','course','2020-05-21 15:44:33','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_default','session','2020-05-21 15:44:33','n_diff_pfx01',1,1,'session_id'),('chamilo','track_e_default','session','2020-05-21 15:44:33','n_diff_pfx02',2,1,'session_id,default_id'),('chamilo','track_e_default','session','2020-05-21 15:44:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_default','session','2020-05-21 15:44:33','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_downloads','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'down_id'),('chamilo','track_e_downloads','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_downloads','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_downloads','down_session_id','2020-05-21 15:43:28','n_diff_pfx01',0,1,'down_session_id'),('chamilo','track_e_downloads','down_session_id','2020-05-21 15:43:28','n_diff_pfx02',0,1,'down_session_id,down_id'),('chamilo','track_e_downloads','down_session_id','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_downloads','down_session_id','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_downloads','idx_ted_c_id','2020-05-21 15:43:28','n_diff_pfx01',0,1,'c_id'),('chamilo','track_e_downloads','idx_ted_c_id','2020-05-21 15:43:28','n_diff_pfx02',0,1,'c_id,down_id'),('chamilo','track_e_downloads','idx_ted_c_id','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_downloads','idx_ted_c_id','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_downloads','idx_ted_user_id','2020-05-21 15:43:28','n_diff_pfx01',0,1,'down_user_id'),('chamilo','track_e_downloads','idx_ted_user_id','2020-05-21 15:43:28','n_diff_pfx02',0,1,'down_user_id,down_id'),('chamilo','track_e_downloads','idx_ted_user_id','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_downloads','idx_ted_user_id','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_exercises','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'exe_id'),('chamilo','track_e_exercises','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_exercises','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_exercises','idx_tee_c_id','2020-05-21 15:43:27','n_diff_pfx01',0,1,'c_id'),('chamilo','track_e_exercises','idx_tee_c_id','2020-05-21 15:43:27','n_diff_pfx02',0,1,'c_id,exe_id'),('chamilo','track_e_exercises','idx_tee_c_id','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_exercises','idx_tee_c_id','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_exercises','idx_tee_user_id','2020-05-21 15:43:27','n_diff_pfx01',0,1,'exe_user_id'),('chamilo','track_e_exercises','idx_tee_user_id','2020-05-21 15:43:27','n_diff_pfx02',0,1,'exe_user_id,exe_id'),('chamilo','track_e_exercises','idx_tee_user_id','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_exercises','idx_tee_user_id','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_exercises','session_id','2020-05-21 15:43:27','n_diff_pfx01',0,1,'session_id'),('chamilo','track_e_exercises','session_id','2020-05-21 15:43:27','n_diff_pfx02',0,1,'session_id,exe_id'),('chamilo','track_e_exercises','session_id','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_exercises','session_id','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_hotpotatoes','PRIMARY','2020-05-21 15:43:25','n_diff_pfx01',0,1,'id'),('chamilo','track_e_hotpotatoes','PRIMARY','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_hotpotatoes','PRIMARY','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_hotpotatoes','idx_tehp_c_id','2020-05-21 15:43:25','n_diff_pfx01',0,1,'c_id'),('chamilo','track_e_hotpotatoes','idx_tehp_c_id','2020-05-21 15:43:25','n_diff_pfx02',0,1,'c_id,id'),('chamilo','track_e_hotpotatoes','idx_tehp_c_id','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_hotpotatoes','idx_tehp_c_id','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_hotpotatoes','idx_tehp_user_id','2020-05-21 15:43:25','n_diff_pfx01',0,1,'exe_user_id'),('chamilo','track_e_hotpotatoes','idx_tehp_user_id','2020-05-21 15:43:25','n_diff_pfx02',0,1,'exe_user_id,id'),('chamilo','track_e_hotpotatoes','idx_tehp_user_id','2020-05-21 15:43:25','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_hotpotatoes','idx_tehp_user_id','2020-05-21 15:43:25','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_hotspot','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'hotspot_id'),('chamilo','track_e_hotspot','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_hotspot','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_hotspot','hotspot_course_code','2020-05-21 15:43:29','n_diff_pfx01',0,1,'hotspot_course_code'),('chamilo','track_e_hotspot','hotspot_course_code','2020-05-21 15:43:29','n_diff_pfx02',0,1,'hotspot_course_code,hotspot_id'),('chamilo','track_e_hotspot','hotspot_course_code','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_hotspot','hotspot_course_code','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_hotspot','hotspot_exe_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'hotspot_exe_id'),('chamilo','track_e_hotspot','hotspot_exe_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'hotspot_exe_id,hotspot_id'),('chamilo','track_e_hotspot','hotspot_exe_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_hotspot','hotspot_exe_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_hotspot','hotspot_question_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'hotspot_question_id'),('chamilo','track_e_hotspot','hotspot_question_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'hotspot_question_id,hotspot_id'),('chamilo','track_e_hotspot','hotspot_question_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_hotspot','hotspot_question_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_hotspot','hotspot_user_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'hotspot_user_id'),('chamilo','track_e_hotspot','hotspot_user_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'hotspot_user_id,hotspot_id'),('chamilo','track_e_hotspot','hotspot_user_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_hotspot','hotspot_user_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_item_property','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'id'),('chamilo','track_e_item_property','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_item_property','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_item_property','course_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'course_id'),('chamilo','track_e_item_property','course_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'course_id,item_property_id'),('chamilo','track_e_item_property','course_id','2020-05-21 15:43:29','n_diff_pfx03',0,1,'course_id,item_property_id,session_id'),('chamilo','track_e_item_property','course_id','2020-05-21 15:43:29','n_diff_pfx04',0,1,'course_id,item_property_id,session_id,id'),('chamilo','track_e_item_property','course_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_item_property','course_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_lastaccess','PRIMARY','2020-05-21 15:43:29','n_diff_pfx01',0,1,'access_id'),('chamilo','track_e_lastaccess','PRIMARY','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_lastaccess','PRIMARY','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_lastaccess','access_c_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'c_id'),('chamilo','track_e_lastaccess','access_c_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'c_id,access_id'),('chamilo','track_e_lastaccess','access_c_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_lastaccess','access_c_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_lastaccess','access_session_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'access_session_id'),('chamilo','track_e_lastaccess','access_session_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'access_session_id,access_id'),('chamilo','track_e_lastaccess','access_session_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_lastaccess','access_session_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_lastaccess','access_user_id','2020-05-21 15:43:29','n_diff_pfx01',0,1,'access_user_id'),('chamilo','track_e_lastaccess','access_user_id','2020-05-21 15:43:29','n_diff_pfx02',0,1,'access_user_id,access_id'),('chamilo','track_e_lastaccess','access_user_id','2020-05-21 15:43:29','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_lastaccess','access_user_id','2020-05-21 15:43:29','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_links','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'links_id'),('chamilo','track_e_links','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_links','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_links','idx_tel_c_id','2020-05-21 15:43:28','n_diff_pfx01',0,1,'c_id'),('chamilo','track_e_links','idx_tel_c_id','2020-05-21 15:43:28','n_diff_pfx02',0,1,'c_id,links_id'),('chamilo','track_e_links','idx_tel_c_id','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_links','idx_tel_c_id','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_links','idx_tel_user_id','2020-05-21 15:43:28','n_diff_pfx01',0,1,'links_user_id'),('chamilo','track_e_links','idx_tel_user_id','2020-05-21 15:43:28','n_diff_pfx02',0,1,'links_user_id,links_id'),('chamilo','track_e_links','idx_tel_user_id','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_links','idx_tel_user_id','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_links','links_session_id','2020-05-21 15:43:28','n_diff_pfx01',0,1,'links_session_id'),('chamilo','track_e_links','links_session_id','2020-05-21 15:43:28','n_diff_pfx02',0,1,'links_session_id,links_id'),('chamilo','track_e_links','links_session_id','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_links','links_session_id','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_login','PRIMARY','2020-05-21 16:04:20','n_diff_pfx01',3,1,'login_id'),('chamilo','track_e_login','PRIMARY','2020-05-21 16:04:20','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_login','PRIMARY','2020-05-21 16:04:20','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_login','login_user_id','2020-05-21 16:04:20','n_diff_pfx01',1,1,'login_user_id'),('chamilo','track_e_login','login_user_id','2020-05-21 16:04:20','n_diff_pfx02',3,1,'login_user_id,login_id'),('chamilo','track_e_login','login_user_id','2020-05-21 16:04:20','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_login','login_user_id','2020-05-21 16:04:20','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_online','PRIMARY','2020-05-21 16:04:20','n_diff_pfx01',1,1,'login_id'),('chamilo','track_e_online','PRIMARY','2020-05-21 16:04:20','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_online','PRIMARY','2020-05-21 16:04:20','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_online','course','2020-05-21 16:04:20','n_diff_pfx01',1,1,'c_id'),('chamilo','track_e_online','course','2020-05-21 16:04:20','n_diff_pfx02',1,1,'c_id,login_id'),('chamilo','track_e_online','course','2020-05-21 16:04:20','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_online','course','2020-05-21 16:04:20','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_online','login_user_id','2020-05-21 16:04:20','n_diff_pfx01',1,1,'login_user_id'),('chamilo','track_e_online','login_user_id','2020-05-21 16:04:20','n_diff_pfx02',1,1,'login_user_id,login_id'),('chamilo','track_e_online','login_user_id','2020-05-21 16:04:20','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_online','login_user_id','2020-05-21 16:04:20','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_online','session_id','2020-05-21 16:04:20','n_diff_pfx01',1,1,'session_id'),('chamilo','track_e_online','session_id','2020-05-21 16:04:20','n_diff_pfx02',1,1,'session_id,login_id'),('chamilo','track_e_online','session_id','2020-05-21 16:04:20','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_online','session_id','2020-05-21 16:04:20','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_open','PRIMARY','2020-05-21 15:43:26','n_diff_pfx01',0,1,'open_id'),('chamilo','track_e_open','PRIMARY','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_open','PRIMARY','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_uploads','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'upload_id'),('chamilo','track_e_uploads','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_uploads','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_uploads','course','2020-05-21 15:43:28','n_diff_pfx01',0,1,'c_id'),('chamilo','track_e_uploads','course','2020-05-21 15:43:28','n_diff_pfx02',0,1,'c_id,upload_id'),('chamilo','track_e_uploads','course','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_uploads','course','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_uploads','upload_cours_id','2020-05-21 15:43:28','n_diff_pfx01',0,1,'upload_cours_id'),('chamilo','track_e_uploads','upload_cours_id','2020-05-21 15:43:28','n_diff_pfx02',0,1,'upload_cours_id,upload_id'),('chamilo','track_e_uploads','upload_cours_id','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_uploads','upload_cours_id','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_uploads','upload_session_id','2020-05-21 15:43:28','n_diff_pfx01',0,1,'upload_session_id'),('chamilo','track_e_uploads','upload_session_id','2020-05-21 15:43:28','n_diff_pfx02',0,1,'upload_session_id,upload_id'),('chamilo','track_e_uploads','upload_session_id','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_uploads','upload_session_id','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_e_uploads','upload_user_id','2020-05-21 15:43:28','n_diff_pfx01',0,1,'upload_user_id'),('chamilo','track_e_uploads','upload_user_id','2020-05-21 15:43:28','n_diff_pfx02',0,1,'upload_user_id,upload_id'),('chamilo','track_e_uploads','upload_user_id','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_e_uploads','upload_user_id','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_stored_values','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','track_stored_values','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_stored_values','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_stored_values','user_id_2','2020-05-21 15:43:28','n_diff_pfx01',0,1,'user_id'),('chamilo','track_stored_values','user_id_2','2020-05-21 15:43:28','n_diff_pfx02',0,1,'user_id,sco_id'),('chamilo','track_stored_values','user_id_2','2020-05-21 15:43:28','n_diff_pfx03',0,1,'user_id,sco_id,course_id'),('chamilo','track_stored_values','user_id_2','2020-05-21 15:43:28','n_diff_pfx04',0,1,'user_id,sco_id,course_id,sv_key'),('chamilo','track_stored_values','user_id_2','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_stored_values','user_id_2','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_stored_values','user_sco_course_sv','2020-05-21 15:43:28','n_diff_pfx01',0,1,'user_id'),('chamilo','track_stored_values','user_sco_course_sv','2020-05-21 15:43:28','n_diff_pfx02',0,1,'user_id,sco_id'),('chamilo','track_stored_values','user_sco_course_sv','2020-05-21 15:43:28','n_diff_pfx03',0,1,'user_id,sco_id,course_id'),('chamilo','track_stored_values','user_sco_course_sv','2020-05-21 15:43:28','n_diff_pfx04',0,1,'user_id,sco_id,course_id,sv_key'),('chamilo','track_stored_values','user_sco_course_sv','2020-05-21 15:43:28','n_diff_pfx05',0,1,'user_id,sco_id,course_id,sv_key,id'),('chamilo','track_stored_values','user_sco_course_sv','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_stored_values','user_sco_course_sv','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','track_stored_values_stack','PRIMARY','2020-05-21 15:43:26','n_diff_pfx01',0,1,'id'),('chamilo','track_stored_values_stack','PRIMARY','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_stored_values_stack','PRIMARY','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','track_stored_values_stack','user_id_2','2020-05-21 15:43:26','n_diff_pfx01',0,1,'user_id'),('chamilo','track_stored_values_stack','user_id_2','2020-05-21 15:43:26','n_diff_pfx02',0,1,'user_id,sco_id'),('chamilo','track_stored_values_stack','user_id_2','2020-05-21 15:43:26','n_diff_pfx03',0,1,'user_id,sco_id,course_id'),('chamilo','track_stored_values_stack','user_id_2','2020-05-21 15:43:26','n_diff_pfx04',0,1,'user_id,sco_id,course_id,sv_key'),('chamilo','track_stored_values_stack','user_id_2','2020-05-21 15:43:26','n_diff_pfx05',0,1,'user_id,sco_id,course_id,sv_key,stack_order'),('chamilo','track_stored_values_stack','user_id_2','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_stored_values_stack','user_id_2','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','track_stored_values_stack','user_sco_course_sv_stack','2020-05-21 15:43:26','n_diff_pfx01',0,1,'user_id'),('chamilo','track_stored_values_stack','user_sco_course_sv_stack','2020-05-21 15:43:26','n_diff_pfx02',0,1,'user_id,sco_id'),('chamilo','track_stored_values_stack','user_sco_course_sv_stack','2020-05-21 15:43:26','n_diff_pfx03',0,1,'user_id,sco_id,course_id'),('chamilo','track_stored_values_stack','user_sco_course_sv_stack','2020-05-21 15:43:26','n_diff_pfx04',0,1,'user_id,sco_id,course_id,sv_key'),('chamilo','track_stored_values_stack','user_sco_course_sv_stack','2020-05-21 15:43:26','n_diff_pfx05',0,1,'user_id,sco_id,course_id,sv_key,stack_order'),('chamilo','track_stored_values_stack','user_sco_course_sv_stack','2020-05-21 15:43:26','n_diff_pfx06',0,1,'user_id,sco_id,course_id,sv_key,stack_order,id'),('chamilo','track_stored_values_stack','user_sco_course_sv_stack','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','track_stored_values_stack','user_sco_course_sv_stack','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','user','PRIMARY','2020-05-21 15:44:03','n_diff_pfx01',2,1,'id'),('chamilo','user','PRIMARY','2020-05-21 15:44:03','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user','PRIMARY','2020-05-21 15:44:03','size',1,NULL,'Number of pages in the index'),('chamilo','user','UNIQ_8D93D649F85E0677','2020-05-21 15:44:03','n_diff_pfx01',2,1,'username'),('chamilo','user','UNIQ_8D93D649F85E0677','2020-05-21 15:44:03','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user','UNIQ_8D93D649F85E0677','2020-05-21 15:44:03','size',1,NULL,'Number of pages in the index'),('chamilo','user','idx_user_uid','2020-05-21 15:44:03','n_diff_pfx01',2,1,'user_id'),('chamilo','user','idx_user_uid','2020-05-21 15:44:03','n_diff_pfx02',2,1,'user_id,id'),('chamilo','user','idx_user_uid','2020-05-21 15:44:03','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user','idx_user_uid','2020-05-21 15:44:03','size',1,NULL,'Number of pages in the index'),('chamilo','user','status','2020-05-21 15:44:03','n_diff_pfx01',2,1,'status'),('chamilo','user','status','2020-05-21 15:44:03','n_diff_pfx02',2,1,'status,id'),('chamilo','user','status','2020-05-21 15:44:03','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user','status','2020-05-21 15:44:03','size',1,NULL,'Number of pages in the index'),('chamilo','user_api_key','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','user_api_key','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_api_key','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','user_api_key','idx_user_api_keys_user','2020-05-21 15:43:28','n_diff_pfx01',0,1,'user_id'),('chamilo','user_api_key','idx_user_api_keys_user','2020-05-21 15:43:28','n_diff_pfx02',0,1,'user_id,id'),('chamilo','user_api_key','idx_user_api_keys_user','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_api_key','idx_user_api_keys_user','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','user_course_category','PRIMARY','2020-05-21 15:43:26','n_diff_pfx01',0,1,'id'),('chamilo','user_course_category','PRIMARY','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_course_category','PRIMARY','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','user_course_category','idx_user_c_cat_uid','2020-05-21 15:43:26','n_diff_pfx01',0,1,'user_id'),('chamilo','user_course_category','idx_user_c_cat_uid','2020-05-21 15:43:26','n_diff_pfx02',0,1,'user_id,id'),('chamilo','user_course_category','idx_user_c_cat_uid','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_course_category','idx_user_c_cat_uid','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','user_friend_relation_type','PRIMARY','2020-05-21 15:43:33','n_diff_pfx01',6,1,'id'),('chamilo','user_friend_relation_type','PRIMARY','2020-05-21 15:43:33','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_friend_relation_type','PRIMARY','2020-05-21 15:43:33','size',1,NULL,'Number of pages in the index'),('chamilo','user_rel_course_vote','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','user_rel_course_vote','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_rel_course_vote','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','user_rel_course_vote','idx_ucv_cid','2020-05-21 15:43:27','n_diff_pfx01',0,1,'c_id'),('chamilo','user_rel_course_vote','idx_ucv_cid','2020-05-21 15:43:27','n_diff_pfx02',0,1,'c_id,id'),('chamilo','user_rel_course_vote','idx_ucv_cid','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_rel_course_vote','idx_ucv_cid','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','user_rel_course_vote','idx_ucv_cuid','2020-05-21 15:43:27','n_diff_pfx01',0,1,'user_id'),('chamilo','user_rel_course_vote','idx_ucv_cuid','2020-05-21 15:43:27','n_diff_pfx02',0,1,'user_id,c_id'),('chamilo','user_rel_course_vote','idx_ucv_cuid','2020-05-21 15:43:27','n_diff_pfx03',0,1,'user_id,c_id,id'),('chamilo','user_rel_course_vote','idx_ucv_cuid','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_rel_course_vote','idx_ucv_cuid','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','user_rel_course_vote','idx_ucv_uid','2020-05-21 15:43:27','n_diff_pfx01',0,1,'user_id'),('chamilo','user_rel_course_vote','idx_ucv_uid','2020-05-21 15:43:27','n_diff_pfx02',0,1,'user_id,id'),('chamilo','user_rel_course_vote','idx_ucv_uid','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_rel_course_vote','idx_ucv_uid','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','user_rel_event_type','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','user_rel_event_type','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_rel_event_type','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','user_rel_event_type','event_name_index','2020-05-21 15:43:27','n_diff_pfx01',0,1,'event_type_name'),('chamilo','user_rel_event_type','event_name_index','2020-05-21 15:43:27','n_diff_pfx02',0,1,'event_type_name,id'),('chamilo','user_rel_event_type','event_name_index','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_rel_event_type','event_name_index','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','user_rel_tag','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','user_rel_tag','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_rel_tag','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','user_rel_tag','idx_urt_tid','2020-05-21 15:43:27','n_diff_pfx01',0,1,'tag_id'),('chamilo','user_rel_tag','idx_urt_tid','2020-05-21 15:43:27','n_diff_pfx02',0,1,'tag_id,id'),('chamilo','user_rel_tag','idx_urt_tid','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_rel_tag','idx_urt_tid','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','user_rel_tag','idx_urt_uid','2020-05-21 15:43:27','n_diff_pfx01',0,1,'user_id'),('chamilo','user_rel_tag','idx_urt_uid','2020-05-21 15:43:27','n_diff_pfx02',0,1,'user_id,id'),('chamilo','user_rel_tag','idx_urt_uid','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_rel_tag','idx_urt_uid','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','user_rel_user','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','user_rel_user','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_rel_user','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','user_rel_user','idx_user_rel_user__friend_user','2020-05-21 15:43:28','n_diff_pfx01',0,1,'friend_user_id'),('chamilo','user_rel_user','idx_user_rel_user__friend_user','2020-05-21 15:43:28','n_diff_pfx02',0,1,'friend_user_id,id'),('chamilo','user_rel_user','idx_user_rel_user__friend_user','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_rel_user','idx_user_rel_user__friend_user','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','user_rel_user','idx_user_rel_user__user','2020-05-21 15:43:28','n_diff_pfx01',0,1,'user_id'),('chamilo','user_rel_user','idx_user_rel_user__user','2020-05-21 15:43:28','n_diff_pfx02',0,1,'user_id,id'),('chamilo','user_rel_user','idx_user_rel_user__user','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_rel_user','idx_user_rel_user__user','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','user_rel_user','idx_user_rel_user__user_friend_user','2020-05-21 15:43:28','n_diff_pfx01',0,1,'user_id'),('chamilo','user_rel_user','idx_user_rel_user__user_friend_user','2020-05-21 15:43:28','n_diff_pfx02',0,1,'user_id,friend_user_id'),('chamilo','user_rel_user','idx_user_rel_user__user_friend_user','2020-05-21 15:43:28','n_diff_pfx03',0,1,'user_id,friend_user_id,id'),('chamilo','user_rel_user','idx_user_rel_user__user_friend_user','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','user_rel_user','idx_user_rel_user__user_friend_user','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','usergroup','PRIMARY','2020-05-21 15:43:26','n_diff_pfx01',0,1,'id'),('chamilo','usergroup','PRIMARY','2020-05-21 15:43:26','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','usergroup','PRIMARY','2020-05-21 15:43:26','size',1,NULL,'Number of pages in the index'),('chamilo','usergroup_rel_course','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','usergroup_rel_course','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','usergroup_rel_course','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','usergroup_rel_question','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','usergroup_rel_question','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','usergroup_rel_question','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','usergroup_rel_session','PRIMARY','2020-05-21 15:43:28','n_diff_pfx01',0,1,'id'),('chamilo','usergroup_rel_session','PRIMARY','2020-05-21 15:43:28','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','usergroup_rel_session','PRIMARY','2020-05-21 15:43:28','size',1,NULL,'Number of pages in the index'),('chamilo','usergroup_rel_user','IDX_739515A9A76ED395','2020-05-21 15:43:31','n_diff_pfx01',0,1,'user_id'),('chamilo','usergroup_rel_user','IDX_739515A9A76ED395','2020-05-21 15:43:31','n_diff_pfx02',0,1,'user_id,id'),('chamilo','usergroup_rel_user','IDX_739515A9A76ED395','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','usergroup_rel_user','IDX_739515A9A76ED395','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','usergroup_rel_user','IDX_739515A9D2112630','2020-05-21 15:43:31','n_diff_pfx01',0,1,'usergroup_id'),('chamilo','usergroup_rel_user','IDX_739515A9D2112630','2020-05-21 15:43:31','n_diff_pfx02',0,1,'usergroup_id,id'),('chamilo','usergroup_rel_user','IDX_739515A9D2112630','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','usergroup_rel_user','IDX_739515A9D2112630','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','usergroup_rel_user','PRIMARY','2020-05-21 15:43:31','n_diff_pfx01',0,1,'id'),('chamilo','usergroup_rel_user','PRIMARY','2020-05-21 15:43:31','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','usergroup_rel_user','PRIMARY','2020-05-21 15:43:31','size',1,NULL,'Number of pages in the index'),('chamilo','usergroup_rel_usergroup','PRIMARY','2020-05-21 15:43:27','n_diff_pfx01',0,1,'id'),('chamilo','usergroup_rel_usergroup','PRIMARY','2020-05-21 15:43:27','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','usergroup_rel_usergroup','PRIMARY','2020-05-21 15:43:27','size',1,NULL,'Number of pages in the index'),('chamilo','version','PRIMARY','2020-05-21 15:44:53','n_diff_pfx01',38,1,'id'),('chamilo','version','PRIMARY','2020-05-21 15:44:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','version','PRIMARY','2020-05-21 15:44:53','size',1,NULL,'Number of pages in the index'),('chamilo','version','version','2020-05-21 15:44:53','n_diff_pfx01',38,1,'version'),('chamilo','version','version','2020-05-21 15:44:53','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('chamilo','version','version','2020-05-21 15:44:53','size',1,NULL,'Number of pages in the index'),('mysql','gtid_executed','PRIMARY','2020-05-21 15:32:47','n_diff_pfx01',0,1,'source_uuid'),('mysql','gtid_executed','PRIMARY','2020-05-21 15:32:47','n_diff_pfx02',0,1,'source_uuid,interval_start'),('mysql','gtid_executed','PRIMARY','2020-05-21 15:32:47','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('mysql','gtid_executed','PRIMARY','2020-05-21 15:32:47','size',1,NULL,'Number of pages in the index'),('sys','sys_config','PRIMARY','2020-05-21 15:32:47','n_diff_pfx01',6,1,'variable'),('sys','sys_config','PRIMARY','2020-05-21 15:32:47','n_leaf_pages',1,NULL,'Number of leaf pages in the index'),('sys','sys_config','PRIMARY','2020-05-21 15:32:47','size',1,NULL,'Number of pages in the index');
/*!40000 ALTER TABLE `innodb_index_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `innodb_table_stats`
--

DROP TABLE IF EXISTS `innodb_table_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `innodb_table_stats` (
  `database_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(199) COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `n_rows` bigint(20) unsigned NOT NULL,
  `clustered_index_size` bigint(20) unsigned NOT NULL,
  `sum_of_other_index_sizes` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`database_name`,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `innodb_table_stats`
--

LOCK TABLES `innodb_table_stats` WRITE;
/*!40000 ALTER TABLE `innodb_table_stats` DISABLE KEYS */;
INSERT INTO `innodb_table_stats` VALUES ('chamilo','access_url','2020-05-21 15:43:25',0,1,0),('chamilo','access_url_rel_course','2020-05-21 15:43:31',0,1,2),('chamilo','access_url_rel_course_category','2020-05-21 15:43:53',3,1,0),('chamilo','access_url_rel_session','2020-05-21 15:43:27',0,1,0),('chamilo','access_url_rel_user','2020-05-21 15:44:23',2,1,3),('chamilo','access_url_rel_usergroup','2020-05-21 15:43:25',0,1,0),('chamilo','admin','2020-05-21 15:43:27',0,1,1),('chamilo','announcement_rel_group','2020-05-21 15:43:27',0,1,0),('chamilo','block','2020-05-21 15:43:26',0,1,1),('chamilo','branch_sync','2020-05-21 15:43:31',0,1,2),('chamilo','branch_transaction','2020-05-21 15:43:31',0,1,2),('chamilo','branch_transaction_status','2020-05-21 15:43:28',0,1,0),('chamilo','c_announcement','2020-05-21 15:43:30',0,1,2),('chamilo','c_announcement_attachment','2020-05-21 15:43:30',0,1,1),('chamilo','c_attendance','2020-05-21 15:43:30',0,1,3),('chamilo','c_attendance_calendar','2020-05-21 15:43:30',0,1,3),('chamilo','c_attendance_calendar_rel_group','2020-05-21 15:43:29',0,1,2),('chamilo','c_attendance_result','2020-05-21 15:43:29',0,1,3),('chamilo','c_attendance_sheet','2020-05-21 15:43:30',0,1,3),('chamilo','c_attendance_sheet_log','2020-05-21 15:43:30',0,1,1),('chamilo','c_blog','2020-05-21 15:43:30',0,1,2),('chamilo','c_blog_attachment','2020-05-21 15:43:30',0,1,1),('chamilo','c_blog_comment','2020-05-21 15:43:30',0,1,1),('chamilo','c_blog_post','2020-05-21 15:43:30',0,1,1),('chamilo','c_blog_rating','2020-05-21 15:43:30',0,1,1),('chamilo','c_blog_rel_user','2020-05-21 15:43:30',0,1,1),('chamilo','c_blog_task','2020-05-21 15:43:30',0,1,1),('chamilo','c_blog_task_rel_user','2020-05-21 15:43:30',0,1,3),('chamilo','c_calendar_event','2020-05-21 15:43:32',0,1,3),('chamilo','c_calendar_event_attachment','2020-05-21 15:43:30',0,1,1),('chamilo','c_calendar_event_repeat','2020-05-21 15:43:29',0,1,1),('chamilo','c_calendar_event_repeat_not','2020-05-21 15:43:30',0,1,1),('chamilo','c_chat_connected','2020-05-21 15:43:30',0,1,3),('chamilo','c_course_description','2020-05-21 15:43:30',0,1,1),('chamilo','c_course_setting','2020-05-21 15:43:30',0,1,1),('chamilo','c_document','2020-05-21 15:43:30',0,1,1),('chamilo','c_dropbox_category','2020-05-21 15:43:30',0,1,2),('chamilo','c_dropbox_feedback','2020-05-21 15:43:30',0,1,3),('chamilo','c_dropbox_file','2020-05-21 15:43:30',0,1,3),('chamilo','c_dropbox_person','2020-05-21 15:43:30',0,1,2),('chamilo','c_dropbox_post','2020-05-21 15:43:30',0,1,3),('chamilo','c_forum_attachment','2020-05-21 15:43:29',0,1,1),('chamilo','c_forum_category','2020-05-21 15:43:30',0,1,2),('chamilo','c_forum_forum','2020-05-21 15:43:30',0,1,1),('chamilo','c_forum_mailcue','2020-05-21 15:43:29',0,1,4),('chamilo','c_forum_notification','2020-05-21 15:43:30',0,1,5),('chamilo','c_forum_post','2020-05-21 15:43:29',0,1,5),('chamilo','c_forum_thread','2020-05-21 15:43:29',0,1,2),('chamilo','c_forum_thread_qualify','2020-05-21 15:43:30',0,1,2),('chamilo','c_forum_thread_qualify_log','2020-05-21 15:43:30',0,1,2),('chamilo','c_glossary','2020-05-21 15:43:30',0,1,2),('chamilo','c_group_category','2020-05-21 15:43:30',0,1,1),('chamilo','c_group_info','2020-05-21 15:43:29',0,1,2),('chamilo','c_group_rel_tutor','2020-05-21 15:43:29',0,1,1),('chamilo','c_group_rel_user','2020-05-21 15:43:29',0,1,1),('chamilo','c_item_property','2020-05-21 15:43:32',0,1,6),('chamilo','c_link','2020-05-21 15:43:30',0,1,2),('chamilo','c_link_category','2020-05-21 15:43:30',0,1,2),('chamilo','c_lp','2020-05-21 15:43:30',0,1,2),('chamilo','c_lp_category','2020-05-21 15:43:30',0,1,1),('chamilo','c_lp_category_user','2020-05-21 15:43:32',0,1,2),('chamilo','c_lp_item','2020-05-21 15:43:30',0,1,3),('chamilo','c_lp_item_view','2020-05-21 15:43:30',0,1,4),('chamilo','c_lp_iv_interaction','2020-05-21 15:43:30',0,1,2),('chamilo','c_lp_iv_objective','2020-05-21 15:43:30',0,1,2),('chamilo','c_lp_view','2020-05-21 15:43:30',0,1,4),('chamilo','c_notebook','2020-05-21 15:43:30',0,1,1),('chamilo','c_online_connected','2020-05-21 15:43:30',0,1,1),('chamilo','c_online_link','2020-05-21 15:43:29',0,1,1),('chamilo','c_permission_group','2020-05-21 15:43:30',0,1,1),('chamilo','c_permission_task','2020-05-21 15:43:30',0,1,1),('chamilo','c_permission_user','2020-05-21 15:43:30',0,1,1),('chamilo','c_quiz','2020-05-21 15:43:30',0,1,2),('chamilo','c_quiz_answer','2020-05-21 15:43:29',0,1,2),('chamilo','c_quiz_question','2020-05-21 15:43:30',0,1,2),('chamilo','c_quiz_question_category','2020-05-21 15:43:30',0,1,1),('chamilo','c_quiz_question_option','2020-05-21 15:43:30',0,1,1),('chamilo','c_quiz_question_rel_category','2020-05-21 15:43:30',0,1,2),('chamilo','c_quiz_rel_category','2020-05-21 15:43:30',0,1,0),('chamilo','c_quiz_rel_question','2020-05-21 15:43:29',0,1,3),('chamilo','c_resource','2020-05-21 15:43:29',0,1,1),('chamilo','c_role','2020-05-21 15:43:30',0,1,1),('chamilo','c_role_group','2020-05-21 15:43:30',0,1,2),('chamilo','c_role_permissions','2020-05-21 15:43:29',0,1,2),('chamilo','c_role_user','2020-05-21 15:43:29',0,1,2),('chamilo','c_student_publication','2020-05-21 15:43:32',0,1,3),('chamilo','c_student_publication_assignment','2020-05-21 15:43:30',0,1,1),('chamilo','c_student_publication_comment','2020-05-21 15:43:29',0,1,3),('chamilo','c_student_publication_rel_document','2020-05-21 15:43:30',0,1,3),('chamilo','c_student_publication_rel_user','2020-05-21 15:43:30',0,1,3),('chamilo','c_survey','2020-05-21 15:43:30',0,1,2),('chamilo','c_survey_answer','2020-05-21 15:43:30',0,1,1),('chamilo','c_survey_group','2020-05-21 15:43:30',0,1,1),('chamilo','c_survey_invitation','2020-05-21 15:43:30',0,1,1),('chamilo','c_survey_question','2020-05-21 15:43:30',0,1,1),('chamilo','c_survey_question_option','2020-05-21 15:43:30',0,1,1),('chamilo','c_thematic','2020-05-21 15:43:30',0,1,2),('chamilo','c_thematic_advance','2020-05-21 15:43:32',0,1,3),('chamilo','c_thematic_plan','2020-05-21 15:43:30',0,1,2),('chamilo','c_tool','2020-05-21 15:43:29',0,1,2),('chamilo','c_tool_intro','2020-05-21 15:43:29',0,1,1),('chamilo','c_userinfo_content','2020-05-21 15:43:29',0,1,2),('chamilo','c_userinfo_def','2020-05-21 15:43:29',0,1,1),('chamilo','c_wiki','2020-05-21 15:43:30',0,1,5),('chamilo','c_wiki_conf','2020-05-21 15:43:29',0,1,2),('chamilo','c_wiki_discuss','2020-05-21 15:43:29',0,1,1),('chamilo','c_wiki_mailcue','2020-05-21 15:43:30',0,1,3),('chamilo','career','2020-05-21 15:43:28',0,1,0),('chamilo','chat','2020-05-21 15:43:28',0,1,2),('chamilo','chat_video','2020-05-21 15:43:28',0,1,4),('chamilo','class_item','2020-05-21 15:43:28',0,1,0),('chamilo','class_user','2020-05-21 15:43:25',0,1,0),('chamilo','course','2020-05-21 15:43:31',0,1,4),('chamilo','course_category','2020-05-21 15:43:33',3,1,3),('chamilo','course_module','2020-05-21 15:43:33',28,1,0),('chamilo','course_rel_class','2020-05-21 15:43:29',0,1,0),('chamilo','course_rel_user','2020-05-21 15:43:32',0,1,2),('chamilo','course_rel_user_catalogue','2020-05-21 15:43:31',0,1,2),('chamilo','course_request','2020-05-21 15:43:29',0,1,1),('chamilo','course_type','2020-05-21 15:43:33',2,1,0),('chamilo','event_email_template','2020-05-21 15:43:25',0,1,1),('chamilo','event_sent','2020-05-21 15:43:27',0,1,1),('chamilo','extra_field','2020-05-21 15:43:33',17,1,0),('chamilo','extra_field_option_rel_field_option','2020-05-21 15:43:28',0,1,1),('chamilo','extra_field_options','2020-05-21 15:43:33',9,1,1),('chamilo','extra_field_rel_tag','2020-05-21 15:43:25',0,1,4),('chamilo','extra_field_saved_search','2020-05-21 15:43:31',0,1,2),('chamilo','extra_field_values','2020-05-21 16:05:11',17,1,2),('chamilo','fos_group','2020-05-21 15:43:29',0,1,1),('chamilo','fos_user_user_group','2020-05-21 15:43:32',0,1,2),('chamilo','grade_components','2020-05-21 15:43:26',0,1,0),('chamilo','grade_model','2020-05-21 15:43:28',0,1,0),('chamilo','gradebook_category','2020-05-21 15:43:26',0,1,0),('chamilo','gradebook_certificate','2020-05-21 15:43:26',0,1,3),('chamilo','gradebook_evaluation','2020-05-21 15:43:28',0,1,0),('chamilo','gradebook_link','2020-05-21 15:43:27',0,1,0),('chamilo','gradebook_linkeval_log','2020-05-21 15:43:29',0,1,0),('chamilo','gradebook_result','2020-05-21 15:43:25',0,1,0),('chamilo','gradebook_result_log','2020-05-21 15:43:27',0,1,0),('chamilo','gradebook_score_display','2020-05-21 15:43:27',0,1,1),('chamilo','gradebook_score_log','2020-05-21 15:43:27',0,1,2),('chamilo','hook_call','2020-05-21 15:59:41',4,1,0),('chamilo','hook_event','2020-05-21 15:59:31',2,1,1),('chamilo','hook_observer','2020-05-21 15:59:31',2,1,1),('chamilo','language','2020-05-21 15:43:32',60,1,2),('chamilo','legal','2020-05-21 15:43:28',0,1,0),('chamilo','message','2020-05-21 15:43:26',0,1,6),('chamilo','message_attachment','2020-05-21 15:43:26',0,1,0),('chamilo','notification','2020-05-21 15:43:28',0,1,2),('chamilo','openid_association','2020-05-21 15:43:28',0,1,0),('chamilo','personal_agenda','2020-05-21 15:43:27',0,1,2),('chamilo','personal_agenda_repeat','2020-05-21 15:43:25',0,1,0),('chamilo','personal_agenda_repeat_not','2020-05-21 15:43:29',0,1,0),('chamilo','plugin_bbb_meeting','2020-05-21 15:59:31',0,1,0),('chamilo','plugin_bbb_room','2020-05-21 15:59:31',0,1,0),('chamilo','promotion','2020-05-21 15:43:32',0,1,1),('chamilo','room','2020-05-21 15:43:32',0,1,1),('chamilo','search_engine_ref','2020-05-21 15:43:28',0,1,0),('chamilo','sequence','2020-05-21 15:43:26',0,1,0),('chamilo','sequence_condition','2020-05-21 15:43:33',2,1,0),('chamilo','sequence_formula','2020-05-21 15:43:33',13,1,2),('chamilo','sequence_method','2020-05-21 15:43:33',11,1,0),('chamilo','sequence_resource','2020-05-21 15:43:31',0,1,1),('chamilo','sequence_row_entity','2020-05-21 15:43:31',0,1,1),('chamilo','sequence_rule','2020-05-21 15:43:28',0,1,0),('chamilo','sequence_rule_condition','2020-05-21 15:43:33',2,1,2),('chamilo','sequence_rule_method','2020-05-21 15:43:33',11,1,2),('chamilo','sequence_type_entity','2020-05-21 15:43:33',3,1,0),('chamilo','sequence_valid','2020-05-21 15:43:33',2,1,2),('chamilo','sequence_value','2020-05-21 15:43:31',0,1,1),('chamilo','sequence_variable','2020-05-21 15:43:33',8,1,0),('chamilo','session','2020-05-21 15:43:31',0,1,4),('chamilo','session_category','2020-05-21 15:43:31',0,1,1),('chamilo','session_rel_course','2020-05-21 15:43:31',0,1,2),('chamilo','session_rel_course_rel_user','2020-05-21 15:43:31',0,1,3),('chamilo','session_rel_user','2020-05-21 15:43:31',0,1,3),('chamilo','settings_current','2020-05-21 15:44:43',375,5,2),('chamilo','settings_options','2020-05-21 15:43:43',450,4,3),('chamilo','shared_survey','2020-05-21 15:43:26',0,1,1),('chamilo','shared_survey_question','2020-05-21 15:43:27',0,1,0),('chamilo','shared_survey_question_option','2020-05-21 15:43:29',0,1,0),('chamilo','skill','2020-05-21 15:43:31',0,1,1),('chamilo','skill_level','2020-05-21 15:43:32',0,1,1),('chamilo','skill_level_profile','2020-05-21 15:43:31',0,1,0),('chamilo','skill_profile','2020-05-21 15:43:27',0,1,0),('chamilo','skill_rel_gradebook','2020-05-21 15:43:27',0,1,0),('chamilo','skill_rel_profile','2020-05-21 15:43:29',0,1,0),('chamilo','skill_rel_skill','2020-05-21 15:43:26',0,1,0),('chamilo','skill_rel_user','2020-05-21 15:43:31',0,1,8),('chamilo','skill_rel_user_comment','2020-05-21 15:43:31',0,1,3),('chamilo','specific_field','2020-05-21 15:43:27',0,1,1),('chamilo','specific_field_values','2020-05-21 15:43:27',0,1,0),('chamilo','sys_announcement','2020-05-21 15:43:28',0,1,0),('chamilo','sys_calendar','2020-05-21 15:43:29',0,1,0),('chamilo','system_template','2020-05-21 15:43:33',13,4,0),('chamilo','tag','2020-05-21 15:43:29',0,1,0),('chamilo','templates','2020-05-21 15:43:26',0,1,0),('chamilo','ticket_assigned_log','2020-05-21 15:43:32',0,1,2),('chamilo','ticket_category','2020-05-21 15:45:03',6,1,1),('chamilo','ticket_category_rel_user','2020-05-21 15:43:32',0,1,2),('chamilo','ticket_message','2020-05-21 15:43:32',0,1,1),('chamilo','ticket_message_attachments','2020-05-21 15:43:32',0,1,2),('chamilo','ticket_priority','2020-05-21 15:43:32',3,1,0),('chamilo','ticket_project','2020-05-21 15:43:30',0,1,0),('chamilo','ticket_status','2020-05-21 15:43:32',5,1,0),('chamilo','ticket_ticket','2020-05-21 15:43:32',0,1,6),('chamilo','track_course_ranking','2020-05-21 15:43:29',0,1,4),('chamilo','track_e_access','2020-05-21 15:43:25',0,1,3),('chamilo','track_e_attempt','2020-05-21 15:43:27',0,1,5),('chamilo','track_e_attempt_coeff','2020-05-21 15:43:26',0,1,0),('chamilo','track_e_attempt_recording','2020-05-21 15:43:27',0,1,3),('chamilo','track_e_course_access','2020-05-21 15:43:25',0,1,4),('chamilo','track_e_default','2020-05-21 15:44:33',2,1,2),('chamilo','track_e_downloads','2020-05-21 15:43:28',0,1,3),('chamilo','track_e_exercises','2020-05-21 15:43:27',0,1,3),('chamilo','track_e_hotpotatoes','2020-05-21 15:43:25',0,1,2),('chamilo','track_e_hotspot','2020-05-21 15:43:29',0,1,4),('chamilo','track_e_item_property','2020-05-21 15:43:29',0,1,1),('chamilo','track_e_lastaccess','2020-05-21 15:43:29',0,1,3),('chamilo','track_e_links','2020-05-21 15:43:28',0,1,3),('chamilo','track_e_login','2020-05-21 16:04:20',3,1,1),('chamilo','track_e_online','2020-05-21 16:04:20',1,1,3),('chamilo','track_e_open','2020-05-21 15:43:26',0,1,0),('chamilo','track_e_uploads','2020-05-21 15:43:28',0,1,4),('chamilo','track_stored_values','2020-05-21 15:43:28',0,1,2),('chamilo','track_stored_values_stack','2020-05-21 15:43:26',0,1,2),('chamilo','user','2020-05-21 15:44:03',2,1,3),('chamilo','user_api_key','2020-05-21 15:43:28',0,1,1),('chamilo','user_course_category','2020-05-21 15:43:26',0,1,1),('chamilo','user_friend_relation_type','2020-05-21 15:43:33',6,1,0),('chamilo','user_rel_course_vote','2020-05-21 15:43:27',0,1,3),('chamilo','user_rel_event_type','2020-05-21 15:43:27',0,1,1),('chamilo','user_rel_tag','2020-05-21 15:43:27',0,1,2),('chamilo','user_rel_user','2020-05-21 15:43:28',0,1,3),('chamilo','usergroup','2020-05-21 15:43:26',0,1,0),('chamilo','usergroup_rel_course','2020-05-21 15:43:28',0,1,0),('chamilo','usergroup_rel_question','2020-05-21 15:43:28',0,1,0),('chamilo','usergroup_rel_session','2020-05-21 15:43:28',0,1,0),('chamilo','usergroup_rel_user','2020-05-21 15:43:31',0,1,2),('chamilo','usergroup_rel_usergroup','2020-05-21 15:43:27',0,1,0),('chamilo','version','2020-05-21 15:44:53',38,1,1),('mysql','gtid_executed','2020-05-21 15:32:47',0,1,0),('sys','sys_config','2020-05-21 15:32:47',6,1,0);
/*!40000 ALTER TABLE `innodb_table_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ndb_binlog_index`
--

DROP TABLE IF EXISTS `ndb_binlog_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndb_binlog_index` (
  `Position` bigint(20) unsigned NOT NULL,
  `File` varchar(255) NOT NULL,
  `epoch` bigint(20) unsigned NOT NULL,
  `inserts` int(10) unsigned NOT NULL,
  `updates` int(10) unsigned NOT NULL,
  `deletes` int(10) unsigned NOT NULL,
  `schemaops` int(10) unsigned NOT NULL,
  `orig_server_id` int(10) unsigned NOT NULL,
  `orig_epoch` bigint(20) unsigned NOT NULL,
  `gci` int(10) unsigned NOT NULL,
  `next_position` bigint(20) unsigned NOT NULL,
  `next_file` varchar(255) NOT NULL,
  PRIMARY KEY (`epoch`,`orig_server_id`,`orig_epoch`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ndb_binlog_index`
--

LOCK TABLES `ndb_binlog_index` WRITE;
/*!40000 ALTER TABLE `ndb_binlog_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `ndb_binlog_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='MySQL plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proc`
--

DROP TABLE IF EXISTS `proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL DEFAULT '',
  `language` enum('SQL') NOT NULL DEFAULT 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL DEFAULT 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` longblob NOT NULL,
  `body` longblob NOT NULL,
  `definer` char(93) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stored Procedures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proc`
--

LOCK TABLES `proc` WRITE;
/*!40000 ALTER TABLE `proc` DISABLE KEYS */;
/*!40000 ALTER TABLE `proc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procs_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8_bin NOT NULL,
  `Grantor` char(93) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Procedure privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procs_priv`
--

LOCK TABLES `procs_priv` WRITE;
/*!40000 ALTER TABLE `procs_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `procs_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxies_priv`
--

DROP TABLE IF EXISTS `proxies_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxies_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_user` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` char(93) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User proxy privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxies_priv`
--

LOCK TABLES `proxies_priv` WRITE;
/*!40000 ALTER TABLE `proxies_priv` DISABLE KEYS */;
INSERT INTO `proxies_priv` VALUES ('localhost','root','','',1,'boot@connecting host','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `proxies_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_cost`
--

DROP TABLE IF EXISTS `server_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_cost` (
  `cost_name` varchar(64) NOT NULL,
  `cost_value` float DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`cost_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_cost`
--

LOCK TABLES `server_cost` WRITE;
/*!40000 ALTER TABLE `server_cost` DISABLE KEYS */;
INSERT INTO `server_cost` VALUES ('disk_temptable_create_cost',NULL,'2020-05-21 15:32:47',NULL),('disk_temptable_row_cost',NULL,'2020-05-21 15:32:47',NULL),('key_compare_cost',NULL,'2020-05-21 15:32:47',NULL),('memory_temptable_create_cost',NULL,'2020-05-21 15:32:47',NULL),('memory_temptable_row_cost',NULL,'2020-05-21 15:32:47',NULL),('row_evaluate_cost',NULL,'2020-05-21 15:32:47',NULL);
/*!40000 ALTER TABLE `server_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(64) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int(4) NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='MySQL Foreign Servers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slave_master_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slave_master_info` (
  `Number_of_lines` int(10) unsigned NOT NULL COMMENT 'Number of lines in the file.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log currently being read from the master.',
  `Master_log_pos` bigint(20) unsigned NOT NULL COMMENT 'The master log position of the last read event.',
  `Host` char(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The host name of the master.',
  `User_name` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The user name used to connect to the master.',
  `User_password` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The password used to connect to the master.',
  `Port` int(10) unsigned NOT NULL COMMENT 'The network port used to connect to the master.',
  `Connect_retry` int(10) unsigned NOT NULL COMMENT 'The period (in seconds) that the slave will wait before trying to reconnect to the master.',
  `Enabled_ssl` tinyint(1) NOT NULL COMMENT 'Indicates whether the server supports SSL connections.',
  `Ssl_ca` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Authority (CA) certificate.',
  `Ssl_capath` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path to the Certificate Authority (CA) certificates.',
  `Ssl_cert` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL certificate file.',
  `Ssl_cipher` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the cipher in use for the SSL connection.',
  `Ssl_key` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The name of the SSL key file.',
  `Ssl_verify_server_cert` tinyint(1) NOT NULL COMMENT 'Whether to verify the server certificate.',
  `Heartbeat` float NOT NULL,
  `Bind` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Displays which interface is employed when connecting to the MySQL server',
  `Ignored_server_ids` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The number of server IDs to be ignored, followed by the actual server IDs',
  `Uuid` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The master server uuid.',
  `Retry_count` bigint(20) unsigned NOT NULL COMMENT 'Number of reconnect attempts, to the master, before giving up.',
  `Ssl_crl` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The file used for the Certificate Revocation List (CRL)',
  `Ssl_crlpath` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'The path used for Certificate Revocation List (CRL) files',
  `Enabled_auto_position` tinyint(1) NOT NULL COMMENT 'Indicates whether GTIDs will be used to retrieve events from the master.',
  `Channel_name` char(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  `Tls_version` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'Tls version',
  PRIMARY KEY (`Channel_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Master Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_relay_log_info`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slave_relay_log_info` (
  `Number_of_lines` int(10) unsigned NOT NULL COMMENT 'Number of lines in the file or rows in the table. Used to version table definitions.',
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the current relay log file.',
  `Relay_log_pos` bigint(20) unsigned NOT NULL COMMENT 'The relay log position of the last executed event.',
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The name of the master binary log file from which the events in the relay log file were read.',
  `Master_log_pos` bigint(20) unsigned NOT NULL COMMENT 'The master log position of the last executed event.',
  `Sql_delay` int(11) NOT NULL COMMENT 'The number of seconds that the slave must lag behind the master.',
  `Number_of_workers` int(10) unsigned NOT NULL,
  `Id` int(10) unsigned NOT NULL COMMENT 'Internal Id that uniquely identifies this record.',
  `Channel_name` char(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Relay Log Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slave_worker_info`
--

DROP TABLE IF EXISTS `slave_worker_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slave_worker_info` (
  `Id` int(10) unsigned NOT NULL,
  `Relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Relay_log_pos` bigint(20) unsigned NOT NULL,
  `Master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Master_log_pos` bigint(20) unsigned NOT NULL,
  `Checkpoint_relay_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_relay_log_pos` bigint(20) unsigned NOT NULL,
  `Checkpoint_master_log_name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Checkpoint_master_log_pos` bigint(20) unsigned NOT NULL,
  `Checkpoint_seqno` int(10) unsigned NOT NULL,
  `Checkpoint_group_size` int(10) unsigned NOT NULL,
  `Checkpoint_group_bitmap` blob NOT NULL,
  `Channel_name` char(64) NOT NULL COMMENT 'The channel on which the slave is connected to a source. Used in Multisource Replication',
  PRIMARY KEY (`Channel_name`,`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Worker Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slave_worker_info`
--

LOCK TABLES `slave_worker_info` WRITE;
/*!40000 ALTER TABLE `slave_worker_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `slave_worker_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` char(93) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_priv`
--

LOCK TABLES `tables_priv` WRITE;
/*!40000 ALTER TABLE `tables_priv` DISABLE KEYS */;
INSERT INTO `tables_priv` VALUES ('localhost','mysql','mysql.session','user','boot@connecting host','0000-00-00 00:00:00','Select',''),('localhost','sys','mysql.sys','sys_config','root@localhost','2020-05-21 15:32:47','Select','');
/*!40000 ALTER TABLE `tables_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone` (
  `Time_zone_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1824 DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone`
--

LOCK TABLES `time_zone` WRITE;
/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
INSERT INTO `time_zone` VALUES (1,'N'),(2,'N'),(3,'N'),(4,'N'),(5,'N'),(6,'N'),(7,'N'),(8,'N'),(9,'N'),(10,'N'),(11,'N'),(12,'N'),(13,'N'),(14,'N'),(15,'N'),(16,'N'),(17,'N'),(18,'N'),(19,'N'),(20,'N'),(21,'N'),(22,'N'),(23,'N'),(24,'N'),(25,'N'),(26,'N'),(27,'N'),(28,'N'),(29,'N'),(30,'N'),(31,'N'),(32,'N'),(33,'N'),(34,'N'),(35,'N'),(36,'N'),(37,'N'),(38,'N'),(39,'N'),(40,'N'),(41,'N'),(42,'N'),(43,'N'),(44,'N'),(45,'N'),(46,'N'),(47,'N'),(48,'N'),(49,'N'),(50,'N'),(51,'N'),(52,'N'),(53,'N'),(54,'N'),(55,'N'),(56,'N'),(57,'N'),(58,'N'),(59,'N'),(60,'N'),(61,'N'),(62,'N'),(63,'N'),(64,'N'),(65,'N'),(66,'N'),(67,'N'),(68,'N'),(69,'N'),(70,'N'),(71,'N'),(72,'N'),(73,'N'),(74,'N'),(75,'N'),(76,'N'),(77,'N'),(78,'N'),(79,'N'),(80,'N'),(81,'N'),(82,'N'),(83,'N'),(84,'N'),(85,'N'),(86,'N'),(87,'N'),(88,'N'),(89,'N'),(90,'N'),(91,'N'),(92,'N'),(93,'N'),(94,'N'),(95,'N'),(96,'N'),(97,'N'),(98,'N'),(99,'N'),(100,'N'),(101,'N'),(102,'N'),(103,'N'),(104,'N'),(105,'N'),(106,'N'),(107,'N'),(108,'N'),(109,'N'),(110,'N'),(111,'N'),(112,'N'),(113,'N'),(114,'N'),(115,'N'),(116,'N'),(117,'N'),(118,'N'),(119,'N'),(120,'N'),(121,'N'),(122,'N'),(123,'N'),(124,'N'),(125,'N'),(126,'N'),(127,'N'),(128,'N'),(129,'N'),(130,'N'),(131,'N'),(132,'N'),(133,'N'),(134,'N'),(135,'N'),(136,'N'),(137,'N'),(138,'N'),(139,'N'),(140,'N'),(141,'N'),(142,'N'),(143,'N'),(144,'N'),(145,'N'),(146,'N'),(147,'N'),(148,'N'),(149,'N'),(150,'N'),(151,'N'),(152,'N'),(153,'N'),(154,'N'),(155,'N'),(156,'N'),(157,'N'),(158,'N'),(159,'N'),(160,'N'),(161,'N'),(162,'N'),(163,'N'),(164,'N'),(165,'N'),(166,'N'),(167,'N'),(168,'N'),(169,'N'),(170,'N'),(171,'N'),(172,'N'),(173,'N'),(174,'N'),(175,'N'),(176,'N'),(177,'N'),(178,'N'),(179,'N'),(180,'N'),(181,'N'),(182,'N'),(183,'N'),(184,'N'),(185,'N'),(186,'N'),(187,'N'),(188,'N'),(189,'N'),(190,'N'),(191,'N'),(192,'N'),(193,'N'),(194,'N'),(195,'N'),(196,'N'),(197,'N'),(198,'N'),(199,'N'),(200,'N'),(201,'N'),(202,'N'),(203,'N'),(204,'N'),(205,'N'),(206,'N'),(207,'N'),(208,'N'),(209,'N'),(210,'N'),(211,'N'),(212,'N'),(213,'N'),(214,'N'),(215,'N'),(216,'N'),(217,'N'),(218,'N'),(219,'N'),(220,'N'),(221,'N'),(222,'N'),(223,'N'),(224,'N'),(225,'N'),(226,'N'),(227,'N'),(228,'N'),(229,'N'),(230,'N'),(231,'N'),(232,'N'),(233,'N'),(234,'N'),(235,'N'),(236,'N'),(237,'N'),(238,'N'),(239,'N'),(240,'N'),(241,'N'),(242,'N'),(243,'N'),(244,'N'),(245,'N'),(246,'N'),(247,'N'),(248,'N'),(249,'N'),(250,'N'),(251,'N'),(252,'N'),(253,'N'),(254,'N'),(255,'N'),(256,'N'),(257,'N'),(258,'N'),(259,'N'),(260,'N'),(261,'N'),(262,'N'),(263,'N'),(264,'N'),(265,'N'),(266,'N'),(267,'N'),(268,'N'),(269,'N'),(270,'N'),(271,'N'),(272,'N'),(273,'N'),(274,'N'),(275,'N'),(276,'N'),(277,'N'),(278,'N'),(279,'N'),(280,'N'),(281,'N'),(282,'N'),(283,'N'),(284,'N'),(285,'N'),(286,'N'),(287,'N'),(288,'N'),(289,'N'),(290,'N'),(291,'N'),(292,'N'),(293,'N'),(294,'N'),(295,'N'),(296,'N'),(297,'N'),(298,'N'),(299,'N'),(300,'N'),(301,'N'),(302,'N'),(303,'N'),(304,'N'),(305,'N'),(306,'N'),(307,'N'),(308,'N'),(309,'N'),(310,'N'),(311,'N'),(312,'N'),(313,'N'),(314,'N'),(315,'N'),(316,'N'),(317,'N'),(318,'N'),(319,'N'),(320,'N'),(321,'N'),(322,'N'),(323,'N'),(324,'N'),(325,'N'),(326,'N'),(327,'N'),(328,'N'),(329,'N'),(330,'N'),(331,'N'),(332,'N'),(333,'N'),(334,'N'),(335,'N'),(336,'N'),(337,'N'),(338,'N'),(339,'N'),(340,'N'),(341,'N'),(342,'N'),(343,'N'),(344,'N'),(345,'N'),(346,'N'),(347,'N'),(348,'N'),(349,'N'),(350,'N'),(351,'N'),(352,'N'),(353,'N'),(354,'N'),(355,'N'),(356,'N'),(357,'N'),(358,'N'),(359,'N'),(360,'N'),(361,'N'),(362,'N'),(363,'N'),(364,'N'),(365,'N'),(366,'N'),(367,'N'),(368,'N'),(369,'N'),(370,'N'),(371,'N'),(372,'N'),(373,'N'),(374,'N'),(375,'N'),(376,'N'),(377,'N'),(378,'N'),(379,'N'),(380,'N'),(381,'N'),(382,'N'),(383,'N'),(384,'N'),(385,'N'),(386,'N'),(387,'N'),(388,'N'),(389,'N'),(390,'N'),(391,'N'),(392,'N'),(393,'N'),(394,'N'),(395,'N'),(396,'N'),(397,'N'),(398,'N'),(399,'N'),(400,'N'),(401,'N'),(402,'N'),(403,'N'),(404,'N'),(405,'N'),(406,'N'),(407,'N'),(408,'N'),(409,'N'),(410,'N'),(411,'N'),(412,'N'),(413,'N'),(414,'N'),(415,'N'),(416,'N'),(417,'N'),(418,'N'),(419,'N'),(420,'N'),(421,'N'),(422,'N'),(423,'N'),(424,'N'),(425,'N'),(426,'N'),(427,'N'),(428,'N'),(429,'N'),(430,'N'),(431,'N'),(432,'N'),(433,'N'),(434,'N'),(435,'N'),(436,'N'),(437,'N'),(438,'N'),(439,'N'),(440,'N'),(441,'N'),(442,'N'),(443,'N'),(444,'N'),(445,'N'),(446,'N'),(447,'N'),(448,'N'),(449,'N'),(450,'N'),(451,'N'),(452,'N'),(453,'N'),(454,'N'),(455,'N'),(456,'N'),(457,'N'),(458,'N'),(459,'N'),(460,'N'),(461,'N'),(462,'N'),(463,'N'),(464,'N'),(465,'N'),(466,'N'),(467,'N'),(468,'N'),(469,'N'),(470,'N'),(471,'N'),(472,'N'),(473,'N'),(474,'N'),(475,'N'),(476,'N'),(477,'N'),(478,'N'),(479,'N'),(480,'N'),(481,'N'),(482,'N'),(483,'N'),(484,'N'),(485,'N'),(486,'N'),(487,'N'),(488,'N'),(489,'N'),(490,'N'),(491,'N'),(492,'N'),(493,'N'),(494,'N'),(495,'N'),(496,'N'),(497,'N'),(498,'N'),(499,'N'),(500,'N'),(501,'N'),(502,'N'),(503,'N'),(504,'N'),(505,'N'),(506,'N'),(507,'N'),(508,'N'),(509,'N'),(510,'N'),(511,'N'),(512,'N'),(513,'N'),(514,'N'),(515,'N'),(516,'N'),(517,'N'),(518,'N'),(519,'N'),(520,'N'),(521,'N'),(522,'N'),(523,'N'),(524,'N'),(525,'N'),(526,'N'),(527,'N'),(528,'N'),(529,'N'),(530,'N'),(531,'N'),(532,'N'),(533,'N'),(534,'N'),(535,'N'),(536,'N'),(537,'N'),(538,'N'),(539,'N'),(540,'N'),(541,'N'),(542,'N'),(543,'N'),(544,'N'),(545,'N'),(546,'N'),(547,'N'),(548,'N'),(549,'N'),(550,'N'),(551,'N'),(552,'N'),(553,'N'),(554,'N'),(555,'N'),(556,'N'),(557,'N'),(558,'N'),(559,'N'),(560,'N'),(561,'N'),(562,'N'),(563,'N'),(564,'N'),(565,'N'),(566,'N'),(567,'N'),(568,'N'),(569,'N'),(570,'N'),(571,'N'),(572,'N'),(573,'N'),(574,'N'),(575,'N'),(576,'N'),(577,'N'),(578,'N'),(579,'N'),(580,'N'),(581,'N'),(582,'N'),(583,'N'),(584,'N'),(585,'N'),(586,'N'),(587,'N'),(588,'N'),(589,'N'),(590,'N'),(591,'N'),(592,'N'),(593,'N'),(594,'N'),(595,'N'),(596,'N'),(597,'N'),(598,'N'),(599,'N'),(600,'N'),(601,'N'),(602,'N'),(603,'N'),(604,'N'),(605,'N'),(606,'N'),(607,'N'),(608,'N'),(609,'N'),(610,'N'),(611,'N'),(612,'N'),(613,'N'),(614,'N'),(615,'N'),(616,'N'),(617,'N'),(618,'N'),(619,'N'),(620,'N'),(621,'N'),(622,'N'),(623,'N'),(624,'N'),(625,'N'),(626,'N'),(627,'N'),(628,'N'),(629,'N'),(630,'N'),(631,'N'),(632,'N'),(633,'N'),(634,'N'),(635,'N'),(636,'N'),(637,'N'),(638,'N'),(639,'N'),(640,'N'),(641,'N'),(642,'N'),(643,'N'),(644,'N'),(645,'N'),(646,'N'),(647,'N'),(648,'N'),(649,'N'),(650,'N'),(651,'N'),(652,'N'),(653,'N'),(654,'N'),(655,'N'),(656,'N'),(657,'N'),(658,'N'),(659,'N'),(660,'N'),(661,'N'),(662,'N'),(663,'N'),(664,'N'),(665,'N'),(666,'N'),(667,'N'),(668,'N'),(669,'N'),(670,'N'),(671,'N'),(672,'N'),(673,'N'),(674,'N'),(675,'N'),(676,'N'),(677,'N'),(678,'N'),(679,'N'),(680,'N'),(681,'N'),(682,'N'),(683,'N'),(684,'N'),(685,'N'),(686,'N'),(687,'N'),(688,'N'),(689,'N'),(690,'N'),(691,'N'),(692,'N'),(693,'N'),(694,'N'),(695,'N'),(696,'N'),(697,'N'),(698,'N'),(699,'N'),(700,'N'),(701,'N'),(702,'N'),(703,'N'),(704,'N'),(705,'N'),(706,'N'),(707,'N'),(708,'N'),(709,'N'),(710,'N'),(711,'N'),(712,'N'),(713,'N'),(714,'N'),(715,'N'),(716,'N'),(717,'N'),(718,'N'),(719,'N'),(720,'N'),(721,'N'),(722,'N'),(723,'N'),(724,'N'),(725,'N'),(726,'N'),(727,'N'),(728,'N'),(729,'N'),(730,'N'),(731,'N'),(732,'N'),(733,'N'),(734,'N'),(735,'N'),(736,'N'),(737,'N'),(738,'N'),(739,'N'),(740,'N'),(741,'N'),(742,'N'),(743,'N'),(744,'N'),(745,'N'),(746,'N'),(747,'N'),(748,'N'),(749,'N'),(750,'N'),(751,'N'),(752,'N'),(753,'N'),(754,'N'),(755,'N'),(756,'N'),(757,'N'),(758,'N'),(759,'N'),(760,'N'),(761,'N'),(762,'N'),(763,'N'),(764,'N'),(765,'N'),(766,'N'),(767,'N'),(768,'N'),(769,'N'),(770,'N'),(771,'N'),(772,'N'),(773,'N'),(774,'N'),(775,'N'),(776,'N'),(777,'N'),(778,'N'),(779,'N'),(780,'N'),(781,'N'),(782,'N'),(783,'N'),(784,'N'),(785,'N'),(786,'N'),(787,'N'),(788,'N'),(789,'N'),(790,'N'),(791,'N'),(792,'N'),(793,'N'),(794,'N'),(795,'N'),(796,'N'),(797,'N'),(798,'N'),(799,'N'),(800,'N'),(801,'N'),(802,'N'),(803,'N'),(804,'N'),(805,'N'),(806,'N'),(807,'N'),(808,'N'),(809,'N'),(810,'N'),(811,'N'),(812,'N'),(813,'N'),(814,'N'),(815,'N'),(816,'N'),(817,'N'),(818,'N'),(819,'N'),(820,'N'),(821,'N'),(822,'N'),(823,'N'),(824,'N'),(825,'N'),(826,'N'),(827,'N'),(828,'N'),(829,'N'),(830,'N'),(831,'N'),(832,'N'),(833,'N'),(834,'N'),(835,'N'),(836,'N'),(837,'N'),(838,'N'),(839,'N'),(840,'N'),(841,'N'),(842,'N'),(843,'N'),(844,'N'),(845,'N'),(846,'N'),(847,'N'),(848,'N'),(849,'N'),(850,'N'),(851,'N'),(852,'N'),(853,'N'),(854,'N'),(855,'N'),(856,'N'),(857,'N'),(858,'N'),(859,'N'),(860,'N'),(861,'N'),(862,'N'),(863,'N'),(864,'N'),(865,'N'),(866,'N'),(867,'N'),(868,'N'),(869,'N'),(870,'N'),(871,'N'),(872,'N'),(873,'N'),(874,'N'),(875,'N'),(876,'N'),(877,'N'),(878,'N'),(879,'N'),(880,'N'),(881,'N'),(882,'N'),(883,'N'),(884,'N'),(885,'N'),(886,'N'),(887,'N'),(888,'N'),(889,'N'),(890,'N'),(891,'N'),(892,'N'),(893,'N'),(894,'N'),(895,'N'),(896,'N'),(897,'N'),(898,'N'),(899,'N'),(900,'N'),(901,'N'),(902,'N'),(903,'N'),(904,'N'),(905,'N'),(906,'N'),(907,'N'),(908,'N'),(909,'N'),(910,'N'),(911,'N'),(912,'N'),(913,'N'),(914,'N'),(915,'N'),(916,'N'),(917,'N'),(918,'N'),(919,'N'),(920,'N'),(921,'N'),(922,'N'),(923,'N'),(924,'N'),(925,'N'),(926,'N'),(927,'N'),(928,'N'),(929,'N'),(930,'N'),(931,'N'),(932,'N'),(933,'N'),(934,'N'),(935,'N'),(936,'N'),(937,'N'),(938,'N'),(939,'N'),(940,'N'),(941,'N'),(942,'N'),(943,'N'),(944,'N'),(945,'N'),(946,'N'),(947,'N'),(948,'N'),(949,'N'),(950,'N'),(951,'N'),(952,'N'),(953,'N'),(954,'N'),(955,'N'),(956,'N'),(957,'N'),(958,'N'),(959,'N'),(960,'N'),(961,'N'),(962,'N'),(963,'N'),(964,'N'),(965,'N'),(966,'N'),(967,'N'),(968,'N'),(969,'N'),(970,'N'),(971,'N'),(972,'N'),(973,'N'),(974,'N'),(975,'N'),(976,'N'),(977,'N'),(978,'N'),(979,'N'),(980,'N'),(981,'N'),(982,'N'),(983,'N'),(984,'N'),(985,'N'),(986,'N'),(987,'N'),(988,'N'),(989,'N'),(990,'N'),(991,'N'),(992,'N'),(993,'N'),(994,'N'),(995,'N'),(996,'N'),(997,'N'),(998,'N'),(999,'N'),(1000,'N'),(1001,'N'),(1002,'N'),(1003,'N'),(1004,'N'),(1005,'N'),(1006,'N'),(1007,'N'),(1008,'N'),(1009,'N'),(1010,'N'),(1011,'N'),(1012,'N'),(1013,'N'),(1014,'N'),(1015,'N'),(1016,'N'),(1017,'N'),(1018,'N'),(1019,'N'),(1020,'N'),(1021,'N'),(1022,'N'),(1023,'N'),(1024,'N'),(1025,'N'),(1026,'N'),(1027,'N'),(1028,'N'),(1029,'N'),(1030,'N'),(1031,'N'),(1032,'N'),(1033,'N'),(1034,'N'),(1035,'N'),(1036,'N'),(1037,'N'),(1038,'N'),(1039,'N'),(1040,'N'),(1041,'N'),(1042,'N'),(1043,'N'),(1044,'N'),(1045,'N'),(1046,'N'),(1047,'N'),(1048,'N'),(1049,'N'),(1050,'N'),(1051,'N'),(1052,'N'),(1053,'N'),(1054,'N'),(1055,'N'),(1056,'N'),(1057,'N'),(1058,'N'),(1059,'N'),(1060,'N'),(1061,'N'),(1062,'N'),(1063,'N'),(1064,'N'),(1065,'N'),(1066,'N'),(1067,'N'),(1068,'N'),(1069,'N'),(1070,'N'),(1071,'N'),(1072,'N'),(1073,'N'),(1074,'N'),(1075,'N'),(1076,'N'),(1077,'N'),(1078,'N'),(1079,'N'),(1080,'N'),(1081,'N'),(1082,'N'),(1083,'N'),(1084,'N'),(1085,'N'),(1086,'N'),(1087,'N'),(1088,'N'),(1089,'N'),(1090,'N'),(1091,'N'),(1092,'N'),(1093,'N'),(1094,'N'),(1095,'N'),(1096,'N'),(1097,'N'),(1098,'N'),(1099,'N'),(1100,'N'),(1101,'N'),(1102,'N'),(1103,'N'),(1104,'N'),(1105,'N'),(1106,'N'),(1107,'N'),(1108,'N'),(1109,'N'),(1110,'N'),(1111,'N'),(1112,'N'),(1113,'N'),(1114,'N'),(1115,'N'),(1116,'N'),(1117,'N'),(1118,'N'),(1119,'N'),(1120,'N'),(1121,'N'),(1122,'N'),(1123,'N'),(1124,'N'),(1125,'N'),(1126,'N'),(1127,'N'),(1128,'N'),(1129,'N'),(1130,'N'),(1131,'N'),(1132,'N'),(1133,'N'),(1134,'N'),(1135,'N'),(1136,'N'),(1137,'N'),(1138,'N'),(1139,'N'),(1140,'N'),(1141,'N'),(1142,'N'),(1143,'N'),(1144,'N'),(1145,'N'),(1146,'N'),(1147,'N'),(1148,'N'),(1149,'N'),(1150,'N'),(1151,'N'),(1152,'N'),(1153,'N'),(1154,'N'),(1155,'N'),(1156,'N'),(1157,'N'),(1158,'N'),(1159,'N'),(1160,'N'),(1161,'N'),(1162,'N'),(1163,'N'),(1164,'N'),(1165,'N'),(1166,'N'),(1167,'N'),(1168,'N'),(1169,'N'),(1170,'N'),(1171,'N'),(1172,'N'),(1173,'N'),(1174,'N'),(1175,'N'),(1176,'N'),(1177,'N'),(1178,'N'),(1179,'N'),(1180,'N'),(1181,'N'),(1182,'N'),(1183,'N'),(1184,'N'),(1185,'N'),(1186,'N'),(1187,'N'),(1188,'N'),(1189,'N'),(1190,'N'),(1191,'N'),(1192,'N'),(1193,'N'),(1194,'N'),(1195,'N'),(1196,'N'),(1197,'N'),(1198,'N'),(1199,'N'),(1200,'N'),(1201,'N'),(1202,'N'),(1203,'N'),(1204,'N'),(1205,'N'),(1206,'N'),(1207,'N'),(1208,'N'),(1209,'N'),(1210,'N'),(1211,'N'),(1212,'N'),(1213,'N'),(1214,'N'),(1215,'N'),(1216,'N'),(1217,'Y'),(1218,'Y'),(1219,'Y'),(1220,'Y'),(1221,'Y'),(1222,'Y'),(1223,'Y'),(1224,'Y'),(1225,'Y'),(1226,'Y'),(1227,'Y'),(1228,'Y'),(1229,'Y'),(1230,'Y'),(1231,'Y'),(1232,'Y'),(1233,'Y'),(1234,'Y'),(1235,'Y'),(1236,'Y'),(1237,'Y'),(1238,'Y'),(1239,'Y'),(1240,'Y'),(1241,'Y'),(1242,'Y'),(1243,'Y'),(1244,'Y'),(1245,'Y'),(1246,'Y'),(1247,'Y'),(1248,'Y'),(1249,'Y'),(1250,'Y'),(1251,'Y'),(1252,'Y'),(1253,'Y'),(1254,'Y'),(1255,'Y'),(1256,'Y'),(1257,'Y'),(1258,'Y'),(1259,'Y'),(1260,'Y'),(1261,'Y'),(1262,'Y'),(1263,'Y'),(1264,'Y'),(1265,'Y'),(1266,'Y'),(1267,'Y'),(1268,'Y'),(1269,'Y'),(1270,'Y'),(1271,'Y'),(1272,'Y'),(1273,'Y'),(1274,'Y'),(1275,'Y'),(1276,'Y'),(1277,'Y'),(1278,'Y'),(1279,'Y'),(1280,'Y'),(1281,'Y'),(1282,'Y'),(1283,'Y'),(1284,'Y'),(1285,'Y'),(1286,'Y'),(1287,'Y'),(1288,'Y'),(1289,'Y'),(1290,'Y'),(1291,'Y'),(1292,'Y'),(1293,'Y'),(1294,'Y'),(1295,'Y'),(1296,'Y'),(1297,'Y'),(1298,'Y'),(1299,'Y'),(1300,'Y'),(1301,'Y'),(1302,'Y'),(1303,'Y'),(1304,'Y'),(1305,'Y'),(1306,'Y'),(1307,'Y'),(1308,'Y'),(1309,'Y'),(1310,'Y'),(1311,'Y'),(1312,'Y'),(1313,'Y'),(1314,'Y'),(1315,'Y'),(1316,'Y'),(1317,'Y'),(1318,'Y'),(1319,'Y'),(1320,'Y'),(1321,'Y'),(1322,'Y'),(1323,'Y'),(1324,'Y'),(1325,'Y'),(1326,'Y'),(1327,'Y'),(1328,'Y'),(1329,'Y'),(1330,'Y'),(1331,'Y'),(1332,'Y'),(1333,'Y'),(1334,'Y'),(1335,'Y'),(1336,'Y'),(1337,'Y'),(1338,'Y'),(1339,'Y'),(1340,'Y'),(1341,'Y'),(1342,'Y'),(1343,'Y'),(1344,'Y'),(1345,'Y'),(1346,'Y'),(1347,'Y'),(1348,'Y'),(1349,'Y'),(1350,'Y'),(1351,'Y'),(1352,'Y'),(1353,'Y'),(1354,'Y'),(1355,'Y'),(1356,'Y'),(1357,'Y'),(1358,'Y'),(1359,'Y'),(1360,'Y'),(1361,'Y'),(1362,'Y'),(1363,'Y'),(1364,'Y'),(1365,'Y'),(1366,'Y'),(1367,'Y'),(1368,'Y'),(1369,'Y'),(1370,'Y'),(1371,'Y'),(1372,'Y'),(1373,'Y'),(1374,'Y'),(1375,'Y'),(1376,'Y'),(1377,'Y'),(1378,'Y'),(1379,'Y'),(1380,'Y'),(1381,'Y'),(1382,'Y'),(1383,'Y'),(1384,'Y'),(1385,'Y'),(1386,'Y'),(1387,'Y'),(1388,'Y'),(1389,'Y'),(1390,'Y'),(1391,'Y'),(1392,'Y'),(1393,'Y'),(1394,'Y'),(1395,'Y'),(1396,'Y'),(1397,'Y'),(1398,'Y'),(1399,'Y'),(1400,'Y'),(1401,'Y'),(1402,'Y'),(1403,'Y'),(1404,'Y'),(1405,'Y'),(1406,'Y'),(1407,'Y'),(1408,'Y'),(1409,'Y'),(1410,'Y'),(1411,'Y'),(1412,'Y'),(1413,'Y'),(1414,'Y'),(1415,'Y'),(1416,'Y'),(1417,'Y'),(1418,'Y'),(1419,'Y'),(1420,'Y'),(1421,'Y'),(1422,'Y'),(1423,'Y'),(1424,'Y'),(1425,'Y'),(1426,'Y'),(1427,'Y'),(1428,'Y'),(1429,'Y'),(1430,'Y'),(1431,'Y'),(1432,'Y'),(1433,'Y'),(1434,'Y'),(1435,'Y'),(1436,'Y'),(1437,'Y'),(1438,'Y'),(1439,'Y'),(1440,'Y'),(1441,'Y'),(1442,'Y'),(1443,'Y'),(1444,'Y'),(1445,'Y'),(1446,'Y'),(1447,'Y'),(1448,'Y'),(1449,'Y'),(1450,'Y'),(1451,'Y'),(1452,'Y'),(1453,'Y'),(1454,'Y'),(1455,'Y'),(1456,'Y'),(1457,'Y'),(1458,'Y'),(1459,'Y'),(1460,'Y'),(1461,'Y'),(1462,'Y'),(1463,'Y'),(1464,'Y'),(1465,'Y'),(1466,'Y'),(1467,'Y'),(1468,'Y'),(1469,'Y'),(1470,'Y'),(1471,'Y'),(1472,'Y'),(1473,'Y'),(1474,'Y'),(1475,'Y'),(1476,'Y'),(1477,'Y'),(1478,'Y'),(1479,'Y'),(1480,'Y'),(1481,'Y'),(1482,'Y'),(1483,'Y'),(1484,'Y'),(1485,'Y'),(1486,'Y'),(1487,'Y'),(1488,'Y'),(1489,'Y'),(1490,'Y'),(1491,'Y'),(1492,'Y'),(1493,'Y'),(1494,'Y'),(1495,'Y'),(1496,'Y'),(1497,'Y'),(1498,'Y'),(1499,'Y'),(1500,'Y'),(1501,'Y'),(1502,'Y'),(1503,'Y'),(1504,'Y'),(1505,'Y'),(1506,'Y'),(1507,'Y'),(1508,'Y'),(1509,'Y'),(1510,'Y'),(1511,'Y'),(1512,'Y'),(1513,'Y'),(1514,'Y'),(1515,'Y'),(1516,'Y'),(1517,'Y'),(1518,'Y'),(1519,'Y'),(1520,'Y'),(1521,'Y'),(1522,'Y'),(1523,'Y'),(1524,'Y'),(1525,'Y'),(1526,'Y'),(1527,'Y'),(1528,'Y'),(1529,'Y'),(1530,'Y'),(1531,'Y'),(1532,'Y'),(1533,'Y'),(1534,'Y'),(1535,'Y'),(1536,'Y'),(1537,'Y'),(1538,'Y'),(1539,'Y'),(1540,'Y'),(1541,'Y'),(1542,'Y'),(1543,'Y'),(1544,'Y'),(1545,'Y'),(1546,'Y'),(1547,'Y'),(1548,'Y'),(1549,'Y'),(1550,'Y'),(1551,'Y'),(1552,'Y'),(1553,'Y'),(1554,'Y'),(1555,'Y'),(1556,'Y'),(1557,'Y'),(1558,'Y'),(1559,'Y'),(1560,'Y'),(1561,'Y'),(1562,'Y'),(1563,'Y'),(1564,'Y'),(1565,'Y'),(1566,'Y'),(1567,'Y'),(1568,'Y'),(1569,'Y'),(1570,'Y'),(1571,'Y'),(1572,'Y'),(1573,'Y'),(1574,'Y'),(1575,'Y'),(1576,'Y'),(1577,'Y'),(1578,'Y'),(1579,'Y'),(1580,'Y'),(1581,'Y'),(1582,'Y'),(1583,'Y'),(1584,'Y'),(1585,'Y'),(1586,'Y'),(1587,'Y'),(1588,'Y'),(1589,'Y'),(1590,'Y'),(1591,'Y'),(1592,'Y'),(1593,'Y'),(1594,'Y'),(1595,'Y'),(1596,'Y'),(1597,'Y'),(1598,'Y'),(1599,'Y'),(1600,'Y'),(1601,'Y'),(1602,'Y'),(1603,'Y'),(1604,'Y'),(1605,'Y'),(1606,'Y'),(1607,'Y'),(1608,'Y'),(1609,'Y'),(1610,'Y'),(1611,'Y'),(1612,'Y'),(1613,'Y'),(1614,'Y'),(1615,'Y'),(1616,'Y'),(1617,'Y'),(1618,'Y'),(1619,'Y'),(1620,'Y'),(1621,'Y'),(1622,'Y'),(1623,'Y'),(1624,'Y'),(1625,'Y'),(1626,'Y'),(1627,'Y'),(1628,'Y'),(1629,'Y'),(1630,'Y'),(1631,'Y'),(1632,'Y'),(1633,'Y'),(1634,'Y'),(1635,'Y'),(1636,'Y'),(1637,'Y'),(1638,'Y'),(1639,'Y'),(1640,'Y'),(1641,'Y'),(1642,'Y'),(1643,'Y'),(1644,'Y'),(1645,'Y'),(1646,'Y'),(1647,'Y'),(1648,'Y'),(1649,'Y'),(1650,'Y'),(1651,'Y'),(1652,'Y'),(1653,'Y'),(1654,'Y'),(1655,'Y'),(1656,'Y'),(1657,'Y'),(1658,'Y'),(1659,'Y'),(1660,'Y'),(1661,'Y'),(1662,'Y'),(1663,'Y'),(1664,'Y'),(1665,'Y'),(1666,'Y'),(1667,'Y'),(1668,'Y'),(1669,'Y'),(1670,'Y'),(1671,'Y'),(1672,'Y'),(1673,'Y'),(1674,'Y'),(1675,'Y'),(1676,'Y'),(1677,'Y'),(1678,'Y'),(1679,'Y'),(1680,'Y'),(1681,'Y'),(1682,'Y'),(1683,'Y'),(1684,'Y'),(1685,'Y'),(1686,'Y'),(1687,'Y'),(1688,'Y'),(1689,'Y'),(1690,'Y'),(1691,'Y'),(1692,'Y'),(1693,'Y'),(1694,'Y'),(1695,'Y'),(1696,'Y'),(1697,'Y'),(1698,'Y'),(1699,'Y'),(1700,'Y'),(1701,'Y'),(1702,'Y'),(1703,'Y'),(1704,'Y'),(1705,'Y'),(1706,'Y'),(1707,'Y'),(1708,'Y'),(1709,'Y'),(1710,'Y'),(1711,'Y'),(1712,'Y'),(1713,'Y'),(1714,'Y'),(1715,'Y'),(1716,'Y'),(1717,'Y'),(1718,'Y'),(1719,'Y'),(1720,'Y'),(1721,'Y'),(1722,'Y'),(1723,'Y'),(1724,'Y'),(1725,'Y'),(1726,'Y'),(1727,'Y'),(1728,'Y'),(1729,'Y'),(1730,'Y'),(1731,'Y'),(1732,'Y'),(1733,'Y'),(1734,'Y'),(1735,'Y'),(1736,'Y'),(1737,'Y'),(1738,'Y'),(1739,'Y'),(1740,'Y'),(1741,'Y'),(1742,'Y'),(1743,'Y'),(1744,'Y'),(1745,'Y'),(1746,'Y'),(1747,'Y'),(1748,'Y'),(1749,'Y'),(1750,'Y'),(1751,'Y'),(1752,'Y'),(1753,'Y'),(1754,'Y'),(1755,'Y'),(1756,'Y'),(1757,'Y'),(1758,'Y'),(1759,'Y'),(1760,'Y'),(1761,'Y'),(1762,'Y'),(1763,'Y'),(1764,'Y'),(1765,'Y'),(1766,'Y'),(1767,'Y'),(1768,'Y'),(1769,'Y'),(1770,'Y'),(1771,'Y'),(1772,'Y'),(1773,'Y'),(1774,'Y'),(1775,'Y'),(1776,'Y'),(1777,'Y'),(1778,'Y'),(1779,'Y'),(1780,'Y'),(1781,'Y'),(1782,'Y'),(1783,'Y'),(1784,'Y'),(1785,'Y'),(1786,'Y'),(1787,'Y'),(1788,'Y'),(1789,'Y'),(1790,'Y'),(1791,'Y'),(1792,'Y'),(1793,'Y'),(1794,'Y'),(1795,'Y'),(1796,'Y'),(1797,'Y'),(1798,'Y'),(1799,'Y'),(1800,'Y'),(1801,'Y'),(1802,'Y'),(1803,'Y'),(1804,'Y'),(1805,'Y'),(1806,'Y'),(1807,'Y'),(1808,'Y'),(1809,'Y'),(1810,'Y'),(1811,'Y'),(1812,'Y'),(1813,'Y'),(1814,'Y'),(1815,'Y'),(1816,'Y'),(1817,'Y'),(1818,'Y'),(1819,'Y'),(1820,'Y'),(1821,'Y'),(1822,'Y'),(1823,'Y');
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY (`Transition_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Leap seconds information for time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_leap_second`
--

LOCK TABLES `time_zone_leap_second` WRITE;
/*!40000 ALTER TABLE `time_zone_leap_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_leap_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Time zone names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_name`
--

LOCK TABLES `time_zone_name` WRITE;
/*!40000 ALTER TABLE `time_zone_name` DISABLE KEYS */;
INSERT INTO `time_zone_name` VALUES ('Africa/Abidjan',1),('Africa/Accra',2),('Africa/Addis_Ababa',3),('Africa/Algiers',4),('Africa/Asmara',5),('Africa/Asmera',6),('Africa/Bamako',7),('Africa/Bangui',8),('Africa/Banjul',9),('Africa/Bissau',10),('Africa/Blantyre',11),('Africa/Brazzaville',12),('Africa/Bujumbura',13),('Africa/Cairo',14),('Africa/Casablanca',15),('Africa/Ceuta',16),('Africa/Conakry',17),('Africa/Dakar',18),('Africa/Dar_es_Salaam',19),('Africa/Djibouti',20),('Africa/Douala',21),('Africa/El_Aaiun',22),('Africa/Freetown',23),('Africa/Gaborone',24),('Africa/Harare',25),('Africa/Johannesburg',26),('Africa/Juba',27),('Africa/Kampala',28),('Africa/Khartoum',29),('Africa/Kigali',30),('Africa/Kinshasa',31),('Africa/Lagos',32),('Africa/Libreville',33),('Africa/Lome',34),('Africa/Luanda',35),('Africa/Lubumbashi',36),('Africa/Lusaka',37),('Africa/Malabo',38),('Africa/Maputo',39),('Africa/Maseru',40),('Africa/Mbabane',41),('Africa/Mogadishu',42),('Africa/Monrovia',43),('Africa/Nairobi',44),('Africa/Ndjamena',45),('Africa/Niamey',46),('Africa/Nouakchott',47),('Africa/Ouagadougou',48),('Africa/Porto-Novo',49),('Africa/Sao_Tome',50),('Africa/Timbuktu',51),('Africa/Tripoli',52),('Africa/Tunis',53),('Africa/Windhoek',54),('America/Adak',55),('America/Anchorage',56),('America/Anguilla',57),('America/Antigua',58),('America/Araguaina',59),('America/Argentina/Buenos_Aires',60),('America/Argentina/Catamarca',61),('America/Argentina/ComodRivadavia',62),('America/Argentina/Cordoba',63),('America/Argentina/Jujuy',64),('America/Argentina/La_Rioja',65),('America/Argentina/Mendoza',66),('America/Argentina/Rio_Gallegos',67),('America/Argentina/Salta',68),('America/Argentina/San_Juan',69),('America/Argentina/San_Luis',70),('America/Argentina/Tucuman',71),('America/Argentina/Ushuaia',72),('America/Aruba',73),('America/Asuncion',74),('America/Atikokan',75),('America/Atka',76),('America/Bahia',77),('America/Bahia_Banderas',78),('America/Barbados',79),('America/Belem',80),('America/Belize',81),('America/Blanc-Sablon',82),('America/Boa_Vista',83),('America/Bogota',84),('America/Boise',85),('America/Buenos_Aires',86),('America/Cambridge_Bay',87),('America/Campo_Grande',88),('America/Cancun',89),('America/Caracas',90),('America/Catamarca',91),('America/Cayenne',92),('America/Cayman',93),('America/Chicago',94),('America/Chihuahua',95),('America/Coral_Harbour',96),('America/Cordoba',97),('America/Costa_Rica',98),('America/Creston',99),('America/Cuiaba',100),('America/Curacao',101),('America/Danmarkshavn',102),('America/Dawson',103),('America/Dawson_Creek',104),('America/Denver',105),('America/Detroit',106),('America/Dominica',107),('America/Edmonton',108),('America/Eirunepe',109),('America/El_Salvador',110),('America/Ensenada',111),('America/Fortaleza',114),('America/Fort_Nelson',112),('America/Fort_Wayne',113),('America/Glace_Bay',115),('America/Godthab',116),('America/Goose_Bay',117),('America/Grand_Turk',118),('America/Grenada',119),('America/Guadeloupe',120),('America/Guatemala',121),('America/Guayaquil',122),('America/Guyana',123),('America/Halifax',124),('America/Havana',125),('America/Hermosillo',126),('America/Indiana/Indianapolis',127),('America/Indiana/Knox',128),('America/Indiana/Marengo',129),('America/Indiana/Petersburg',130),('America/Indiana/Tell_City',131),('America/Indiana/Vevay',132),('America/Indiana/Vincennes',133),('America/Indiana/Winamac',134),('America/Indianapolis',135),('America/Inuvik',136),('America/Iqaluit',137),('America/Jamaica',138),('America/Jujuy',139),('America/Juneau',140),('America/Kentucky/Louisville',141),('America/Kentucky/Monticello',142),('America/Knox_IN',143),('America/Kralendijk',144),('America/La_Paz',145),('America/Lima',146),('America/Los_Angeles',147),('America/Louisville',148),('America/Lower_Princes',149),('America/Maceio',150),('America/Managua',151),('America/Manaus',152),('America/Marigot',153),('America/Martinique',154),('America/Matamoros',155),('America/Mazatlan',156),('America/Mendoza',157),('America/Menominee',158),('America/Merida',159),('America/Metlakatla',160),('America/Mexico_City',161),('America/Miquelon',162),('America/Moncton',163),('America/Monterrey',164),('America/Montevideo',165),('America/Montreal',166),('America/Montserrat',167),('America/Nassau',168),('America/New_York',169),('America/Nipigon',170),('America/Nome',171),('America/Noronha',172),('America/North_Dakota/Beulah',173),('America/North_Dakota/Center',174),('America/North_Dakota/New_Salem',175),('America/Ojinaga',176),('America/Panama',177),('America/Pangnirtung',178),('America/Paramaribo',179),('America/Phoenix',180),('America/Port-au-Prince',181),('America/Porto_Acre',183),('America/Porto_Velho',184),('America/Port_of_Spain',182),('America/Puerto_Rico',185),('America/Punta_Arenas',186),('America/Rainy_River',187),('America/Rankin_Inlet',188),('America/Recife',189),('America/Regina',190),('America/Resolute',191),('America/Rio_Branco',192),('America/Rosario',193),('America/Santarem',195),('America/Santa_Isabel',194),('America/Santiago',196),('America/Santo_Domingo',197),('America/Sao_Paulo',198),('America/Scoresbysund',199),('America/Shiprock',200),('America/Sitka',201),('America/St_Barthelemy',202),('America/St_Johns',203),('America/St_Kitts',204),('America/St_Lucia',205),('America/St_Thomas',206),('America/St_Vincent',207),('America/Swift_Current',208),('America/Tegucigalpa',209),('America/Thule',210),('America/Thunder_Bay',211),('America/Tijuana',212),('America/Toronto',213),('America/Tortola',214),('America/Vancouver',215),('America/Virgin',216),('America/Whitehorse',217),('America/Winnipeg',218),('America/Yakutat',219),('America/Yellowknife',220),('Antarctica/Casey',221),('Antarctica/Davis',222),('Antarctica/DumontDUrville',223),('Antarctica/Macquarie',224),('Antarctica/Mawson',225),('Antarctica/McMurdo',226),('Antarctica/Palmer',227),('Antarctica/Rothera',228),('Antarctica/South_Pole',229),('Antarctica/Syowa',230),('Antarctica/Troll',231),('Antarctica/Vostok',232),('Arctic/Longyearbyen',233),('Asia/Aden',234),('Asia/Almaty',235),('Asia/Amman',236),('Asia/Anadyr',237),('Asia/Aqtau',238),('Asia/Aqtobe',239),('Asia/Ashgabat',240),('Asia/Ashkhabad',241),('Asia/Atyrau',242),('Asia/Baghdad',243),('Asia/Bahrain',244),('Asia/Baku',245),('Asia/Bangkok',246),('Asia/Barnaul',247),('Asia/Beirut',248),('Asia/Bishkek',249),('Asia/Brunei',250),('Asia/Calcutta',251),('Asia/Chita',252),('Asia/Choibalsan',253),('Asia/Chongqing',254),('Asia/Chungking',255),('Asia/Colombo',256),('Asia/Dacca',257),('Asia/Damascus',258),('Asia/Dhaka',259),('Asia/Dili',260),('Asia/Dubai',261),('Asia/Dushanbe',262),('Asia/Famagusta',263),('Asia/Gaza',264),('Asia/Harbin',265),('Asia/Hebron',266),('Asia/Hong_Kong',268),('Asia/Hovd',269),('Asia/Ho_Chi_Minh',267),('Asia/Irkutsk',270),('Asia/Istanbul',271),('Asia/Jakarta',272),('Asia/Jayapura',273),('Asia/Jerusalem',274),('Asia/Kabul',275),('Asia/Kamchatka',276),('Asia/Karachi',277),('Asia/Kashgar',278),('Asia/Kathmandu',279),('Asia/Katmandu',280),('Asia/Khandyga',281),('Asia/Kolkata',282),('Asia/Krasnoyarsk',283),('Asia/Kuala_Lumpur',284),('Asia/Kuching',285),('Asia/Kuwait',286),('Asia/Macao',287),('Asia/Macau',288),('Asia/Magadan',289),('Asia/Makassar',290),('Asia/Manila',291),('Asia/Muscat',292),('Asia/Nicosia',293),('Asia/Novokuznetsk',294),('Asia/Novosibirsk',295),('Asia/Omsk',296),('Asia/Oral',297),('Asia/Phnom_Penh',298),('Asia/Pontianak',299),('Asia/Pyongyang',300),('Asia/Qatar',301),('Asia/Qostanay',302),('Asia/Qyzylorda',303),('Asia/Rangoon',304),('Asia/Riyadh',305),('Asia/Saigon',306),('Asia/Sakhalin',307),('Asia/Samarkand',308),('Asia/Seoul',309),('Asia/Shanghai',310),('Asia/Singapore',311),('Asia/Srednekolymsk',312),('Asia/Taipei',313),('Asia/Tashkent',314),('Asia/Tbilisi',315),('Asia/Tehran',316),('Asia/Tel_Aviv',317),('Asia/Thimbu',318),('Asia/Thimphu',319),('Asia/Tokyo',320),('Asia/Tomsk',321),('Asia/Ujung_Pandang',322),('Asia/Ulaanbaatar',323),('Asia/Ulan_Bator',324),('Asia/Urumqi',325),('Asia/Ust-Nera',326),('Asia/Vientiane',327),('Asia/Vladivostok',328),('Asia/Yakutsk',329),('Asia/Yangon',330),('Asia/Yekaterinburg',331),('Asia/Yerevan',332),('Atlantic/Azores',333),('Atlantic/Bermuda',334),('Atlantic/Canary',335),('Atlantic/Cape_Verde',336),('Atlantic/Faeroe',337),('Atlantic/Faroe',338),('Atlantic/Jan_Mayen',339),('Atlantic/Madeira',340),('Atlantic/Reykjavik',341),('Atlantic/South_Georgia',342),('Atlantic/Stanley',344),('Atlantic/St_Helena',343),('Australia/ACT',345),('Australia/Adelaide',346),('Australia/Brisbane',347),('Australia/Broken_Hill',348),('Australia/Canberra',349),('Australia/Currie',350),('Australia/Darwin',351),('Australia/Eucla',352),('Australia/Hobart',353),('Australia/LHI',354),('Australia/Lindeman',355),('Australia/Lord_Howe',356),('Australia/Melbourne',357),('Australia/North',359),('Australia/NSW',358),('Australia/Perth',360),('Australia/Queensland',361),('Australia/South',362),('Australia/Sydney',363),('Australia/Tasmania',364),('Australia/Victoria',365),('Australia/West',366),('Australia/Yancowinna',367),('Brazil/Acre',368),('Brazil/DeNoronha',369),('Brazil/East',370),('Brazil/West',371),('Canada/Atlantic',374),('Canada/Central',375),('Canada/Eastern',376),('Canada/Mountain',377),('Canada/Newfoundland',378),('Canada/Pacific',379),('Canada/Saskatchewan',380),('Canada/Yukon',381),('CET',372),('Chile/Continental',382),('Chile/EasterIsland',383),('CST6CDT',373),('Cuba',384),('EET',385),('Egypt',388),('Eire',389),('EST',386),('EST5EDT',387),('Etc/GMT',390),('Etc/GMT+0',391),('Etc/GMT+1',392),('Etc/GMT+10',393),('Etc/GMT+11',394),('Etc/GMT+12',395),('Etc/GMT+2',396),('Etc/GMT+3',397),('Etc/GMT+4',398),('Etc/GMT+5',399),('Etc/GMT+6',400),('Etc/GMT+7',401),('Etc/GMT+8',402),('Etc/GMT+9',403),('Etc/GMT-0',404),('Etc/GMT-1',405),('Etc/GMT-10',406),('Etc/GMT-11',407),('Etc/GMT-12',408),('Etc/GMT-13',409),('Etc/GMT-14',410),('Etc/GMT-2',411),('Etc/GMT-3',412),('Etc/GMT-4',413),('Etc/GMT-5',414),('Etc/GMT-6',415),('Etc/GMT-7',416),('Etc/GMT-8',417),('Etc/GMT-9',418),('Etc/GMT0',419),('Etc/Greenwich',420),('Etc/UCT',421),('Etc/Universal',423),('Etc/UTC',422),('Etc/Zulu',424),('Europe/Amsterdam',425),('Europe/Andorra',426),('Europe/Astrakhan',427),('Europe/Athens',428),('Europe/Belfast',429),('Europe/Belgrade',430),('Europe/Berlin',431),('Europe/Bratislava',432),('Europe/Brussels',433),('Europe/Bucharest',434),('Europe/Budapest',435),('Europe/Busingen',436),('Europe/Chisinau',437),('Europe/Copenhagen',438),('Europe/Dublin',439),('Europe/Gibraltar',440),('Europe/Guernsey',441),('Europe/Helsinki',442),('Europe/Isle_of_Man',443),('Europe/Istanbul',444),('Europe/Jersey',445),('Europe/Kaliningrad',446),('Europe/Kiev',447),('Europe/Kirov',448),('Europe/Lisbon',449),('Europe/Ljubljana',450),('Europe/London',451),('Europe/Luxembourg',452),('Europe/Madrid',453),('Europe/Malta',454),('Europe/Mariehamn',455),('Europe/Minsk',456),('Europe/Monaco',457),('Europe/Moscow',458),('Europe/Nicosia',459),('Europe/Oslo',460),('Europe/Paris',461),('Europe/Podgorica',462),('Europe/Prague',463),('Europe/Riga',464),('Europe/Rome',465),('Europe/Samara',466),('Europe/San_Marino',467),('Europe/Sarajevo',468),('Europe/Saratov',469),('Europe/Simferopol',470),('Europe/Skopje',471),('Europe/Sofia',472),('Europe/Stockholm',473),('Europe/Tallinn',474),('Europe/Tirane',475),('Europe/Tiraspol',476),('Europe/Ulyanovsk',477),('Europe/Uzhgorod',478),('Europe/Vaduz',479),('Europe/Vatican',480),('Europe/Vienna',481),('Europe/Vilnius',482),('Europe/Volgograd',483),('Europe/Warsaw',484),('Europe/Zagreb',485),('Europe/Zaporozhye',486),('Europe/Zurich',487),('Factory',488),('GB',489),('GB-Eire',490),('GMT',491),('GMT+0',492),('GMT-0',493),('GMT0',494),('Greenwich',495),('Hongkong',497),('HST',496),('Iceland',498),('Indian/Antananarivo',499),('Indian/Chagos',500),('Indian/Christmas',501),('Indian/Cocos',502),('Indian/Comoro',503),('Indian/Kerguelen',504),('Indian/Mahe',505),('Indian/Maldives',506),('Indian/Mauritius',507),('Indian/Mayotte',508),('Indian/Reunion',509),('Iran',510),('Israel',511),('Jamaica',512),('Japan',513),('Kwajalein',514),('Libya',515),('localtime',608),('MET',516),('Mexico/BajaNorte',519),('Mexico/BajaSur',520),('Mexico/General',521),('MST',517),('MST7MDT',518),('Navajo',524),('NZ',522),('NZ-CHAT',523),('Pacific/Apia',527),('Pacific/Auckland',528),('Pacific/Bougainville',529),('Pacific/Chatham',530),('Pacific/Chuuk',531),('Pacific/Easter',532),('Pacific/Efate',533),('Pacific/Enderbury',534),('Pacific/Fakaofo',535),('Pacific/Fiji',536),('Pacific/Funafuti',537),('Pacific/Galapagos',538),('Pacific/Gambier',539),('Pacific/Guadalcanal',540),('Pacific/Guam',541),('Pacific/Honolulu',542),('Pacific/Johnston',543),('Pacific/Kiritimati',544),('Pacific/Kosrae',545),('Pacific/Kwajalein',546),('Pacific/Majuro',547),('Pacific/Marquesas',548),('Pacific/Midway',549),('Pacific/Nauru',550),('Pacific/Niue',551),('Pacific/Norfolk',552),('Pacific/Noumea',553),('Pacific/Pago_Pago',554),('Pacific/Palau',555),('Pacific/Pitcairn',556),('Pacific/Pohnpei',557),('Pacific/Ponape',558),('Pacific/Port_Moresby',559),('Pacific/Rarotonga',560),('Pacific/Saipan',561),('Pacific/Samoa',562),('Pacific/Tahiti',563),('Pacific/Tarawa',564),('Pacific/Tongatapu',565),('Pacific/Truk',566),('Pacific/Wake',567),('Pacific/Wallis',568),('Pacific/Yap',569),('Poland',570),('Portugal',571),('posix/Africa/Abidjan',609),('posix/Africa/Accra',610),('posix/Africa/Addis_Ababa',611),('posix/Africa/Algiers',612),('posix/Africa/Asmara',613),('posix/Africa/Asmera',614),('posix/Africa/Bamako',615),('posix/Africa/Bangui',616),('posix/Africa/Banjul',617),('posix/Africa/Bissau',618),('posix/Africa/Blantyre',619),('posix/Africa/Brazzaville',620),('posix/Africa/Bujumbura',621),('posix/Africa/Cairo',622),('posix/Africa/Casablanca',623),('posix/Africa/Ceuta',624),('posix/Africa/Conakry',625),('posix/Africa/Dakar',626),('posix/Africa/Dar_es_Salaam',627),('posix/Africa/Djibouti',628),('posix/Africa/Douala',629),('posix/Africa/El_Aaiun',630),('posix/Africa/Freetown',631),('posix/Africa/Gaborone',632),('posix/Africa/Harare',633),('posix/Africa/Johannesburg',634),('posix/Africa/Juba',635),('posix/Africa/Kampala',636),('posix/Africa/Khartoum',637),('posix/Africa/Kigali',638),('posix/Africa/Kinshasa',639),('posix/Africa/Lagos',640),('posix/Africa/Libreville',641),('posix/Africa/Lome',642),('posix/Africa/Luanda',643),('posix/Africa/Lubumbashi',644),('posix/Africa/Lusaka',645),('posix/Africa/Malabo',646),('posix/Africa/Maputo',647),('posix/Africa/Maseru',648),('posix/Africa/Mbabane',649),('posix/Africa/Mogadishu',650),('posix/Africa/Monrovia',651),('posix/Africa/Nairobi',652),('posix/Africa/Ndjamena',653),('posix/Africa/Niamey',654),('posix/Africa/Nouakchott',655),('posix/Africa/Ouagadougou',656),('posix/Africa/Porto-Novo',657),('posix/Africa/Sao_Tome',658),('posix/Africa/Timbuktu',659),('posix/Africa/Tripoli',660),('posix/Africa/Tunis',661),('posix/Africa/Windhoek',662),('posix/America/Adak',663),('posix/America/Anchorage',664),('posix/America/Anguilla',665),('posix/America/Antigua',666),('posix/America/Araguaina',667),('posix/America/Argentina/Buenos_Aires',668),('posix/America/Argentina/Catamarca',669),('posix/America/Argentina/ComodRivadavia',670),('posix/America/Argentina/Cordoba',671),('posix/America/Argentina/Jujuy',672),('posix/America/Argentina/La_Rioja',673),('posix/America/Argentina/Mendoza',674),('posix/America/Argentina/Rio_Gallegos',675),('posix/America/Argentina/Salta',676),('posix/America/Argentina/San_Juan',677),('posix/America/Argentina/San_Luis',678),('posix/America/Argentina/Tucuman',679),('posix/America/Argentina/Ushuaia',680),('posix/America/Aruba',681),('posix/America/Asuncion',682),('posix/America/Atikokan',683),('posix/America/Atka',684),('posix/America/Bahia',685),('posix/America/Bahia_Banderas',686),('posix/America/Barbados',687),('posix/America/Belem',688),('posix/America/Belize',689),('posix/America/Blanc-Sablon',690),('posix/America/Boa_Vista',691),('posix/America/Bogota',692),('posix/America/Boise',693),('posix/America/Buenos_Aires',694),('posix/America/Cambridge_Bay',695),('posix/America/Campo_Grande',696),('posix/America/Cancun',697),('posix/America/Caracas',698),('posix/America/Catamarca',699),('posix/America/Cayenne',700),('posix/America/Cayman',701),('posix/America/Chicago',702),('posix/America/Chihuahua',703),('posix/America/Coral_Harbour',704),('posix/America/Cordoba',705),('posix/America/Costa_Rica',706),('posix/America/Creston',707),('posix/America/Cuiaba',708),('posix/America/Curacao',709),('posix/America/Danmarkshavn',710),('posix/America/Dawson',711),('posix/America/Dawson_Creek',712),('posix/America/Denver',713),('posix/America/Detroit',714),('posix/America/Dominica',715),('posix/America/Edmonton',716),('posix/America/Eirunepe',717),('posix/America/El_Salvador',718),('posix/America/Ensenada',719),('posix/America/Fortaleza',722),('posix/America/Fort_Nelson',720),('posix/America/Fort_Wayne',721),('posix/America/Glace_Bay',723),('posix/America/Godthab',724),('posix/America/Goose_Bay',725),('posix/America/Grand_Turk',726),('posix/America/Grenada',727),('posix/America/Guadeloupe',728),('posix/America/Guatemala',729),('posix/America/Guayaquil',730),('posix/America/Guyana',731),('posix/America/Halifax',732),('posix/America/Havana',733),('posix/America/Hermosillo',734),('posix/America/Indiana/Indianapolis',735),('posix/America/Indiana/Knox',736),('posix/America/Indiana/Marengo',737),('posix/America/Indiana/Petersburg',738),('posix/America/Indiana/Tell_City',739),('posix/America/Indiana/Vevay',740),('posix/America/Indiana/Vincennes',741),('posix/America/Indiana/Winamac',742),('posix/America/Indianapolis',743),('posix/America/Inuvik',744),('posix/America/Iqaluit',745),('posix/America/Jamaica',746),('posix/America/Jujuy',747),('posix/America/Juneau',748),('posix/America/Kentucky/Louisville',749),('posix/America/Kentucky/Monticello',750),('posix/America/Knox_IN',751),('posix/America/Kralendijk',752),('posix/America/La_Paz',753),('posix/America/Lima',754),('posix/America/Los_Angeles',755),('posix/America/Louisville',756),('posix/America/Lower_Princes',757),('posix/America/Maceio',758),('posix/America/Managua',759),('posix/America/Manaus',760),('posix/America/Marigot',761),('posix/America/Martinique',762),('posix/America/Matamoros',763),('posix/America/Mazatlan',764),('posix/America/Mendoza',765),('posix/America/Menominee',766),('posix/America/Merida',767),('posix/America/Metlakatla',768),('posix/America/Mexico_City',769),('posix/America/Miquelon',770),('posix/America/Moncton',771),('posix/America/Monterrey',772),('posix/America/Montevideo',773),('posix/America/Montreal',774),('posix/America/Montserrat',775),('posix/America/Nassau',776),('posix/America/New_York',777),('posix/America/Nipigon',778),('posix/America/Nome',779),('posix/America/Noronha',780),('posix/America/North_Dakota/Beulah',781),('posix/America/North_Dakota/Center',782),('posix/America/North_Dakota/New_Salem',783),('posix/America/Ojinaga',784),('posix/America/Panama',785),('posix/America/Pangnirtung',786),('posix/America/Paramaribo',787),('posix/America/Phoenix',788),('posix/America/Port-au-Prince',789),('posix/America/Porto_Acre',791),('posix/America/Porto_Velho',792),('posix/America/Port_of_Spain',790),('posix/America/Puerto_Rico',793),('posix/America/Punta_Arenas',794),('posix/America/Rainy_River',795),('posix/America/Rankin_Inlet',796),('posix/America/Recife',797),('posix/America/Regina',798),('posix/America/Resolute',799),('posix/America/Rio_Branco',800),('posix/America/Rosario',801),('posix/America/Santarem',803),('posix/America/Santa_Isabel',802),('posix/America/Santiago',804),('posix/America/Santo_Domingo',805),('posix/America/Sao_Paulo',806),('posix/America/Scoresbysund',807),('posix/America/Shiprock',808),('posix/America/Sitka',809),('posix/America/St_Barthelemy',810),('posix/America/St_Johns',811),('posix/America/St_Kitts',812),('posix/America/St_Lucia',813),('posix/America/St_Thomas',814),('posix/America/St_Vincent',815),('posix/America/Swift_Current',816),('posix/America/Tegucigalpa',817),('posix/America/Thule',818),('posix/America/Thunder_Bay',819),('posix/America/Tijuana',820),('posix/America/Toronto',821),('posix/America/Tortola',822),('posix/America/Vancouver',823),('posix/America/Virgin',824),('posix/America/Whitehorse',825),('posix/America/Winnipeg',826),('posix/America/Yakutat',827),('posix/America/Yellowknife',828),('posix/Antarctica/Casey',829),('posix/Antarctica/Davis',830),('posix/Antarctica/DumontDUrville',831),('posix/Antarctica/Macquarie',832),('posix/Antarctica/Mawson',833),('posix/Antarctica/McMurdo',834),('posix/Antarctica/Palmer',835),('posix/Antarctica/Rothera',836),('posix/Antarctica/South_Pole',837),('posix/Antarctica/Syowa',838),('posix/Antarctica/Troll',839),('posix/Antarctica/Vostok',840),('posix/Arctic/Longyearbyen',841),('posix/Asia/Aden',842),('posix/Asia/Almaty',843),('posix/Asia/Amman',844),('posix/Asia/Anadyr',845),('posix/Asia/Aqtau',846),('posix/Asia/Aqtobe',847),('posix/Asia/Ashgabat',848),('posix/Asia/Ashkhabad',849),('posix/Asia/Atyrau',850),('posix/Asia/Baghdad',851),('posix/Asia/Bahrain',852),('posix/Asia/Baku',853),('posix/Asia/Bangkok',854),('posix/Asia/Barnaul',855),('posix/Asia/Beirut',856),('posix/Asia/Bishkek',857),('posix/Asia/Brunei',858),('posix/Asia/Calcutta',859),('posix/Asia/Chita',860),('posix/Asia/Choibalsan',861),('posix/Asia/Chongqing',862),('posix/Asia/Chungking',863),('posix/Asia/Colombo',864),('posix/Asia/Dacca',865),('posix/Asia/Damascus',866),('posix/Asia/Dhaka',867),('posix/Asia/Dili',868),('posix/Asia/Dubai',869),('posix/Asia/Dushanbe',870),('posix/Asia/Famagusta',871),('posix/Asia/Gaza',872),('posix/Asia/Harbin',873),('posix/Asia/Hebron',874),('posix/Asia/Hong_Kong',876),('posix/Asia/Hovd',877),('posix/Asia/Ho_Chi_Minh',875),('posix/Asia/Irkutsk',878),('posix/Asia/Istanbul',879),('posix/Asia/Jakarta',880),('posix/Asia/Jayapura',881),('posix/Asia/Jerusalem',882),('posix/Asia/Kabul',883),('posix/Asia/Kamchatka',884),('posix/Asia/Karachi',885),('posix/Asia/Kashgar',886),('posix/Asia/Kathmandu',887),('posix/Asia/Katmandu',888),('posix/Asia/Khandyga',889),('posix/Asia/Kolkata',890),('posix/Asia/Krasnoyarsk',891),('posix/Asia/Kuala_Lumpur',892),('posix/Asia/Kuching',893),('posix/Asia/Kuwait',894),('posix/Asia/Macao',895),('posix/Asia/Macau',896),('posix/Asia/Magadan',897),('posix/Asia/Makassar',898),('posix/Asia/Manila',899),('posix/Asia/Muscat',900),('posix/Asia/Nicosia',901),('posix/Asia/Novokuznetsk',902),('posix/Asia/Novosibirsk',903),('posix/Asia/Omsk',904),('posix/Asia/Oral',905),('posix/Asia/Phnom_Penh',906),('posix/Asia/Pontianak',907),('posix/Asia/Pyongyang',908),('posix/Asia/Qatar',909),('posix/Asia/Qostanay',910),('posix/Asia/Qyzylorda',911),('posix/Asia/Rangoon',912),('posix/Asia/Riyadh',913),('posix/Asia/Saigon',914),('posix/Asia/Sakhalin',915),('posix/Asia/Samarkand',916),('posix/Asia/Seoul',917),('posix/Asia/Shanghai',918),('posix/Asia/Singapore',919),('posix/Asia/Srednekolymsk',920),('posix/Asia/Taipei',921),('posix/Asia/Tashkent',922),('posix/Asia/Tbilisi',923),('posix/Asia/Tehran',924),('posix/Asia/Tel_Aviv',925),('posix/Asia/Thimbu',926),('posix/Asia/Thimphu',927),('posix/Asia/Tokyo',928),('posix/Asia/Tomsk',929),('posix/Asia/Ujung_Pandang',930),('posix/Asia/Ulaanbaatar',931),('posix/Asia/Ulan_Bator',932),('posix/Asia/Urumqi',933),('posix/Asia/Ust-Nera',934),('posix/Asia/Vientiane',935),('posix/Asia/Vladivostok',936),('posix/Asia/Yakutsk',937),('posix/Asia/Yangon',938),('posix/Asia/Yekaterinburg',939),('posix/Asia/Yerevan',940),('posix/Atlantic/Azores',941),('posix/Atlantic/Bermuda',942),('posix/Atlantic/Canary',943),('posix/Atlantic/Cape_Verde',944),('posix/Atlantic/Faeroe',945),('posix/Atlantic/Faroe',946),('posix/Atlantic/Jan_Mayen',947),('posix/Atlantic/Madeira',948),('posix/Atlantic/Reykjavik',949),('posix/Atlantic/South_Georgia',950),('posix/Atlantic/Stanley',952),('posix/Atlantic/St_Helena',951),('posix/Australia/ACT',953),('posix/Australia/Adelaide',954),('posix/Australia/Brisbane',955),('posix/Australia/Broken_Hill',956),('posix/Australia/Canberra',957),('posix/Australia/Currie',958),('posix/Australia/Darwin',959),('posix/Australia/Eucla',960),('posix/Australia/Hobart',961),('posix/Australia/LHI',962),('posix/Australia/Lindeman',963),('posix/Australia/Lord_Howe',964),('posix/Australia/Melbourne',965),('posix/Australia/North',967),('posix/Australia/NSW',966),('posix/Australia/Perth',968),('posix/Australia/Queensland',969),('posix/Australia/South',970),('posix/Australia/Sydney',971),('posix/Australia/Tasmania',972),('posix/Australia/Victoria',973),('posix/Australia/West',974),('posix/Australia/Yancowinna',975),('posix/Brazil/Acre',976),('posix/Brazil/DeNoronha',977),('posix/Brazil/East',978),('posix/Brazil/West',979),('posix/Canada/Atlantic',982),('posix/Canada/Central',983),('posix/Canada/Eastern',984),('posix/Canada/Mountain',985),('posix/Canada/Newfoundland',986),('posix/Canada/Pacific',987),('posix/Canada/Saskatchewan',988),('posix/Canada/Yukon',989),('posix/CET',980),('posix/Chile/Continental',990),('posix/Chile/EasterIsland',991),('posix/CST6CDT',981),('posix/Cuba',992),('posix/EET',993),('posix/Egypt',996),('posix/Eire',997),('posix/EST',994),('posix/EST5EDT',995),('posix/Etc/GMT',998),('posix/Etc/GMT+0',999),('posix/Etc/GMT+1',1000),('posix/Etc/GMT+10',1001),('posix/Etc/GMT+11',1002),('posix/Etc/GMT+12',1003),('posix/Etc/GMT+2',1004),('posix/Etc/GMT+3',1005),('posix/Etc/GMT+4',1006),('posix/Etc/GMT+5',1007),('posix/Etc/GMT+6',1008),('posix/Etc/GMT+7',1009),('posix/Etc/GMT+8',1010),('posix/Etc/GMT+9',1011),('posix/Etc/GMT-0',1012),('posix/Etc/GMT-1',1013),('posix/Etc/GMT-10',1014),('posix/Etc/GMT-11',1015),('posix/Etc/GMT-12',1016),('posix/Etc/GMT-13',1017),('posix/Etc/GMT-14',1018),('posix/Etc/GMT-2',1019),('posix/Etc/GMT-3',1020),('posix/Etc/GMT-4',1021),('posix/Etc/GMT-5',1022),('posix/Etc/GMT-6',1023),('posix/Etc/GMT-7',1024),('posix/Etc/GMT-8',1025),('posix/Etc/GMT-9',1026),('posix/Etc/GMT0',1027),('posix/Etc/Greenwich',1028),('posix/Etc/UCT',1029),('posix/Etc/Universal',1031),('posix/Etc/UTC',1030),('posix/Etc/Zulu',1032),('posix/Europe/Amsterdam',1033),('posix/Europe/Andorra',1034),('posix/Europe/Astrakhan',1035),('posix/Europe/Athens',1036),('posix/Europe/Belfast',1037),('posix/Europe/Belgrade',1038),('posix/Europe/Berlin',1039),('posix/Europe/Bratislava',1040),('posix/Europe/Brussels',1041),('posix/Europe/Bucharest',1042),('posix/Europe/Budapest',1043),('posix/Europe/Busingen',1044),('posix/Europe/Chisinau',1045),('posix/Europe/Copenhagen',1046),('posix/Europe/Dublin',1047),('posix/Europe/Gibraltar',1048),('posix/Europe/Guernsey',1049),('posix/Europe/Helsinki',1050),('posix/Europe/Isle_of_Man',1051),('posix/Europe/Istanbul',1052),('posix/Europe/Jersey',1053),('posix/Europe/Kaliningrad',1054),('posix/Europe/Kiev',1055),('posix/Europe/Kirov',1056),('posix/Europe/Lisbon',1057),('posix/Europe/Ljubljana',1058),('posix/Europe/London',1059),('posix/Europe/Luxembourg',1060),('posix/Europe/Madrid',1061),('posix/Europe/Malta',1062),('posix/Europe/Mariehamn',1063),('posix/Europe/Minsk',1064),('posix/Europe/Monaco',1065),('posix/Europe/Moscow',1066),('posix/Europe/Nicosia',1067),('posix/Europe/Oslo',1068),('posix/Europe/Paris',1069),('posix/Europe/Podgorica',1070),('posix/Europe/Prague',1071),('posix/Europe/Riga',1072),('posix/Europe/Rome',1073),('posix/Europe/Samara',1074),('posix/Europe/San_Marino',1075),('posix/Europe/Sarajevo',1076),('posix/Europe/Saratov',1077),('posix/Europe/Simferopol',1078),('posix/Europe/Skopje',1079),('posix/Europe/Sofia',1080),('posix/Europe/Stockholm',1081),('posix/Europe/Tallinn',1082),('posix/Europe/Tirane',1083),('posix/Europe/Tiraspol',1084),('posix/Europe/Ulyanovsk',1085),('posix/Europe/Uzhgorod',1086),('posix/Europe/Vaduz',1087),('posix/Europe/Vatican',1088),('posix/Europe/Vienna',1089),('posix/Europe/Vilnius',1090),('posix/Europe/Volgograd',1091),('posix/Europe/Warsaw',1092),('posix/Europe/Zagreb',1093),('posix/Europe/Zaporozhye',1094),('posix/Europe/Zurich',1095),('posix/Factory',1096),('posix/GB',1097),('posix/GB-Eire',1098),('posix/GMT',1099),('posix/GMT+0',1100),('posix/GMT-0',1101),('posix/GMT0',1102),('posix/Greenwich',1103),('posix/Hongkong',1105),('posix/HST',1104),('posix/Iceland',1106),('posix/Indian/Antananarivo',1107),('posix/Indian/Chagos',1108),('posix/Indian/Christmas',1109),('posix/Indian/Cocos',1110),('posix/Indian/Comoro',1111),('posix/Indian/Kerguelen',1112),('posix/Indian/Mahe',1113),('posix/Indian/Maldives',1114),('posix/Indian/Mauritius',1115),('posix/Indian/Mayotte',1116),('posix/Indian/Reunion',1117),('posix/Iran',1118),('posix/Israel',1119),('posix/Jamaica',1120),('posix/Japan',1121),('posix/Kwajalein',1122),('posix/Libya',1123),('posix/MET',1124),('posix/Mexico/BajaNorte',1127),('posix/Mexico/BajaSur',1128),('posix/Mexico/General',1129),('posix/MST',1125),('posix/MST7MDT',1126),('posix/Navajo',1132),('posix/NZ',1130),('posix/NZ-CHAT',1131),('posix/Pacific/Apia',1135),('posix/Pacific/Auckland',1136),('posix/Pacific/Bougainville',1137),('posix/Pacific/Chatham',1138),('posix/Pacific/Chuuk',1139),('posix/Pacific/Easter',1140),('posix/Pacific/Efate',1141),('posix/Pacific/Enderbury',1142),('posix/Pacific/Fakaofo',1143),('posix/Pacific/Fiji',1144),('posix/Pacific/Funafuti',1145),('posix/Pacific/Galapagos',1146),('posix/Pacific/Gambier',1147),('posix/Pacific/Guadalcanal',1148),('posix/Pacific/Guam',1149),('posix/Pacific/Honolulu',1150),('posix/Pacific/Johnston',1151),('posix/Pacific/Kiritimati',1152),('posix/Pacific/Kosrae',1153),('posix/Pacific/Kwajalein',1154),('posix/Pacific/Majuro',1155),('posix/Pacific/Marquesas',1156),('posix/Pacific/Midway',1157),('posix/Pacific/Nauru',1158),('posix/Pacific/Niue',1159),('posix/Pacific/Norfolk',1160),('posix/Pacific/Noumea',1161),('posix/Pacific/Pago_Pago',1162),('posix/Pacific/Palau',1163),('posix/Pacific/Pitcairn',1164),('posix/Pacific/Pohnpei',1165),('posix/Pacific/Ponape',1166),('posix/Pacific/Port_Moresby',1167),('posix/Pacific/Rarotonga',1168),('posix/Pacific/Saipan',1169),('posix/Pacific/Samoa',1170),('posix/Pacific/Tahiti',1171),('posix/Pacific/Tarawa',1172),('posix/Pacific/Tongatapu',1173),('posix/Pacific/Truk',1174),('posix/Pacific/Wake',1175),('posix/Pacific/Wallis',1176),('posix/Pacific/Yap',1177),('posix/Poland',1178),('posix/Portugal',1179),('posix/PRC',1133),('posix/PST8PDT',1134),('posix/ROC',1180),('posix/ROK',1181),('posix/Singapore',1182),('posix/SystemV/AST4',1183),('posix/SystemV/AST4ADT',1184),('posix/SystemV/CST6',1185),('posix/SystemV/CST6CDT',1186),('posix/SystemV/EST5',1187),('posix/SystemV/EST5EDT',1188),('posix/SystemV/HST10',1189),('posix/SystemV/MST7',1190),('posix/SystemV/MST7MDT',1191),('posix/SystemV/PST8',1192),('posix/SystemV/PST8PDT',1193),('posix/SystemV/YST9',1194),('posix/SystemV/YST9YDT',1195),('posix/Turkey',1196),('posix/UCT',1197),('posix/Universal',1212),('posix/US/Alaska',1198),('posix/US/Aleutian',1199),('posix/US/Arizona',1200),('posix/US/Central',1201),('posix/US/East-Indiana',1202),('posix/US/Eastern',1203),('posix/US/Hawaii',1204),('posix/US/Indiana-Starke',1205),('posix/US/Michigan',1206),('posix/US/Mountain',1207),('posix/US/Pacific',1208),('posix/US/Pacific-New',1209),('posix/US/Samoa',1210),('posix/UTC',1211),('posix/W-SU',1213),('posix/WET',1214),('posix/Zulu',1215),('posixrules',1216),('PRC',525),('PST8PDT',526),('right/Africa/Abidjan',1217),('right/Africa/Accra',1218),('right/Africa/Addis_Ababa',1219),('right/Africa/Algiers',1220),('right/Africa/Asmara',1221),('right/Africa/Asmera',1222),('right/Africa/Bamako',1223),('right/Africa/Bangui',1224),('right/Africa/Banjul',1225),('right/Africa/Bissau',1226),('right/Africa/Blantyre',1227),('right/Africa/Brazzaville',1228),('right/Africa/Bujumbura',1229),('right/Africa/Cairo',1230),('right/Africa/Casablanca',1231),('right/Africa/Ceuta',1232),('right/Africa/Conakry',1233),('right/Africa/Dakar',1234),('right/Africa/Dar_es_Salaam',1235),('right/Africa/Djibouti',1236),('right/Africa/Douala',1237),('right/Africa/El_Aaiun',1238),('right/Africa/Freetown',1239),('right/Africa/Gaborone',1240),('right/Africa/Harare',1241),('right/Africa/Johannesburg',1242),('right/Africa/Juba',1243),('right/Africa/Kampala',1244),('right/Africa/Khartoum',1245),('right/Africa/Kigali',1246),('right/Africa/Kinshasa',1247),('right/Africa/Lagos',1248),('right/Africa/Libreville',1249),('right/Africa/Lome',1250),('right/Africa/Luanda',1251),('right/Africa/Lubumbashi',1252),('right/Africa/Lusaka',1253),('right/Africa/Malabo',1254),('right/Africa/Maputo',1255),('right/Africa/Maseru',1256),('right/Africa/Mbabane',1257),('right/Africa/Mogadishu',1258),('right/Africa/Monrovia',1259),('right/Africa/Nairobi',1260),('right/Africa/Ndjamena',1261),('right/Africa/Niamey',1262),('right/Africa/Nouakchott',1263),('right/Africa/Ouagadougou',1264),('right/Africa/Porto-Novo',1265),('right/Africa/Sao_Tome',1266),('right/Africa/Timbuktu',1267),('right/Africa/Tripoli',1268),('right/Africa/Tunis',1269),('right/Africa/Windhoek',1270),('right/America/Adak',1271),('right/America/Anchorage',1272),('right/America/Anguilla',1273),('right/America/Antigua',1274),('right/America/Araguaina',1275),('right/America/Argentina/Buenos_Aires',1276),('right/America/Argentina/Catamarca',1277),('right/America/Argentina/ComodRivadavia',1278),('right/America/Argentina/Cordoba',1279),('right/America/Argentina/Jujuy',1280),('right/America/Argentina/La_Rioja',1281),('right/America/Argentina/Mendoza',1282),('right/America/Argentina/Rio_Gallegos',1283),('right/America/Argentina/Salta',1284),('right/America/Argentina/San_Juan',1285),('right/America/Argentina/San_Luis',1286),('right/America/Argentina/Tucuman',1287),('right/America/Argentina/Ushuaia',1288),('right/America/Aruba',1289),('right/America/Asuncion',1290),('right/America/Atikokan',1291),('right/America/Atka',1292),('right/America/Bahia',1293),('right/America/Bahia_Banderas',1294),('right/America/Barbados',1295),('right/America/Belem',1296),('right/America/Belize',1297),('right/America/Blanc-Sablon',1298),('right/America/Boa_Vista',1299),('right/America/Bogota',1300),('right/America/Boise',1301),('right/America/Buenos_Aires',1302),('right/America/Cambridge_Bay',1303),('right/America/Campo_Grande',1304),('right/America/Cancun',1305),('right/America/Caracas',1306),('right/America/Catamarca',1307),('right/America/Cayenne',1308),('right/America/Cayman',1309),('right/America/Chicago',1310),('right/America/Chihuahua',1311),('right/America/Coral_Harbour',1312),('right/America/Cordoba',1313),('right/America/Costa_Rica',1314),('right/America/Creston',1315),('right/America/Cuiaba',1316),('right/America/Curacao',1317),('right/America/Danmarkshavn',1318),('right/America/Dawson',1319),('right/America/Dawson_Creek',1320),('right/America/Denver',1321),('right/America/Detroit',1322),('right/America/Dominica',1323),('right/America/Edmonton',1324),('right/America/Eirunepe',1325),('right/America/El_Salvador',1326),('right/America/Ensenada',1327),('right/America/Fortaleza',1330),('right/America/Fort_Nelson',1328),('right/America/Fort_Wayne',1329),('right/America/Glace_Bay',1331),('right/America/Godthab',1332),('right/America/Goose_Bay',1333),('right/America/Grand_Turk',1334),('right/America/Grenada',1335),('right/America/Guadeloupe',1336),('right/America/Guatemala',1337),('right/America/Guayaquil',1338),('right/America/Guyana',1339),('right/America/Halifax',1340),('right/America/Havana',1341),('right/America/Hermosillo',1342),('right/America/Indiana/Indianapolis',1343),('right/America/Indiana/Knox',1344),('right/America/Indiana/Marengo',1345),('right/America/Indiana/Petersburg',1346),('right/America/Indiana/Tell_City',1347),('right/America/Indiana/Vevay',1348),('right/America/Indiana/Vincennes',1349),('right/America/Indiana/Winamac',1350),('right/America/Indianapolis',1351),('right/America/Inuvik',1352),('right/America/Iqaluit',1353),('right/America/Jamaica',1354),('right/America/Jujuy',1355),('right/America/Juneau',1356),('right/America/Kentucky/Louisville',1357),('right/America/Kentucky/Monticello',1358),('right/America/Knox_IN',1359),('right/America/Kralendijk',1360),('right/America/La_Paz',1361),('right/America/Lima',1362),('right/America/Los_Angeles',1363),('right/America/Louisville',1364),('right/America/Lower_Princes',1365),('right/America/Maceio',1366),('right/America/Managua',1367),('right/America/Manaus',1368),('right/America/Marigot',1369),('right/America/Martinique',1370),('right/America/Matamoros',1371),('right/America/Mazatlan',1372),('right/America/Mendoza',1373),('right/America/Menominee',1374),('right/America/Merida',1375),('right/America/Metlakatla',1376),('right/America/Mexico_City',1377),('right/America/Miquelon',1378),('right/America/Moncton',1379),('right/America/Monterrey',1380),('right/America/Montevideo',1381),('right/America/Montreal',1382),('right/America/Montserrat',1383),('right/America/Nassau',1384),('right/America/New_York',1385),('right/America/Nipigon',1386),('right/America/Nome',1387),('right/America/Noronha',1388),('right/America/North_Dakota/Beulah',1389),('right/America/North_Dakota/Center',1390),('right/America/North_Dakota/New_Salem',1391),('right/America/Ojinaga',1392),('right/America/Panama',1393),('right/America/Pangnirtung',1394),('right/America/Paramaribo',1395),('right/America/Phoenix',1396),('right/America/Port-au-Prince',1397),('right/America/Porto_Acre',1399),('right/America/Porto_Velho',1400),('right/America/Port_of_Spain',1398),('right/America/Puerto_Rico',1401),('right/America/Punta_Arenas',1402),('right/America/Rainy_River',1403),('right/America/Rankin_Inlet',1404),('right/America/Recife',1405),('right/America/Regina',1406),('right/America/Resolute',1407),('right/America/Rio_Branco',1408),('right/America/Rosario',1409),('right/America/Santarem',1411),('right/America/Santa_Isabel',1410),('right/America/Santiago',1412),('right/America/Santo_Domingo',1413),('right/America/Sao_Paulo',1414),('right/America/Scoresbysund',1415),('right/America/Shiprock',1416),('right/America/Sitka',1417),('right/America/St_Barthelemy',1418),('right/America/St_Johns',1419),('right/America/St_Kitts',1420),('right/America/St_Lucia',1421),('right/America/St_Thomas',1422),('right/America/St_Vincent',1423),('right/America/Swift_Current',1424),('right/America/Tegucigalpa',1425),('right/America/Thule',1426),('right/America/Thunder_Bay',1427),('right/America/Tijuana',1428),('right/America/Toronto',1429),('right/America/Tortola',1430),('right/America/Vancouver',1431),('right/America/Virgin',1432),('right/America/Whitehorse',1433),('right/America/Winnipeg',1434),('right/America/Yakutat',1435),('right/America/Yellowknife',1436),('right/Antarctica/Casey',1437),('right/Antarctica/Davis',1438),('right/Antarctica/DumontDUrville',1439),('right/Antarctica/Macquarie',1440),('right/Antarctica/Mawson',1441),('right/Antarctica/McMurdo',1442),('right/Antarctica/Palmer',1443),('right/Antarctica/Rothera',1444),('right/Antarctica/South_Pole',1445),('right/Antarctica/Syowa',1446),('right/Antarctica/Troll',1447),('right/Antarctica/Vostok',1448),('right/Arctic/Longyearbyen',1449),('right/Asia/Aden',1450),('right/Asia/Almaty',1451),('right/Asia/Amman',1452),('right/Asia/Anadyr',1453),('right/Asia/Aqtau',1454),('right/Asia/Aqtobe',1455),('right/Asia/Ashgabat',1456),('right/Asia/Ashkhabad',1457),('right/Asia/Atyrau',1458),('right/Asia/Baghdad',1459),('right/Asia/Bahrain',1460),('right/Asia/Baku',1461),('right/Asia/Bangkok',1462),('right/Asia/Barnaul',1463),('right/Asia/Beirut',1464),('right/Asia/Bishkek',1465),('right/Asia/Brunei',1466),('right/Asia/Calcutta',1467),('right/Asia/Chita',1468),('right/Asia/Choibalsan',1469),('right/Asia/Chongqing',1470),('right/Asia/Chungking',1471),('right/Asia/Colombo',1472),('right/Asia/Dacca',1473),('right/Asia/Damascus',1474),('right/Asia/Dhaka',1475),('right/Asia/Dili',1476),('right/Asia/Dubai',1477),('right/Asia/Dushanbe',1478),('right/Asia/Famagusta',1479),('right/Asia/Gaza',1480),('right/Asia/Harbin',1481),('right/Asia/Hebron',1482),('right/Asia/Hong_Kong',1484),('right/Asia/Hovd',1485),('right/Asia/Ho_Chi_Minh',1483),('right/Asia/Irkutsk',1486),('right/Asia/Istanbul',1487),('right/Asia/Jakarta',1488),('right/Asia/Jayapura',1489),('right/Asia/Jerusalem',1490),('right/Asia/Kabul',1491),('right/Asia/Kamchatka',1492),('right/Asia/Karachi',1493),('right/Asia/Kashgar',1494),('right/Asia/Kathmandu',1495),('right/Asia/Katmandu',1496),('right/Asia/Khandyga',1497),('right/Asia/Kolkata',1498),('right/Asia/Krasnoyarsk',1499),('right/Asia/Kuala_Lumpur',1500),('right/Asia/Kuching',1501),('right/Asia/Kuwait',1502),('right/Asia/Macao',1503),('right/Asia/Macau',1504),('right/Asia/Magadan',1505),('right/Asia/Makassar',1506),('right/Asia/Manila',1507),('right/Asia/Muscat',1508),('right/Asia/Nicosia',1509),('right/Asia/Novokuznetsk',1510),('right/Asia/Novosibirsk',1511),('right/Asia/Omsk',1512),('right/Asia/Oral',1513),('right/Asia/Phnom_Penh',1514),('right/Asia/Pontianak',1515),('right/Asia/Pyongyang',1516),('right/Asia/Qatar',1517),('right/Asia/Qostanay',1518),('right/Asia/Qyzylorda',1519),('right/Asia/Rangoon',1520),('right/Asia/Riyadh',1521),('right/Asia/Saigon',1522),('right/Asia/Sakhalin',1523),('right/Asia/Samarkand',1524),('right/Asia/Seoul',1525),('right/Asia/Shanghai',1526),('right/Asia/Singapore',1527),('right/Asia/Srednekolymsk',1528),('right/Asia/Taipei',1529),('right/Asia/Tashkent',1530),('right/Asia/Tbilisi',1531),('right/Asia/Tehran',1532),('right/Asia/Tel_Aviv',1533),('right/Asia/Thimbu',1534),('right/Asia/Thimphu',1535),('right/Asia/Tokyo',1536),('right/Asia/Tomsk',1537),('right/Asia/Ujung_Pandang',1538),('right/Asia/Ulaanbaatar',1539),('right/Asia/Ulan_Bator',1540),('right/Asia/Urumqi',1541),('right/Asia/Ust-Nera',1542),('right/Asia/Vientiane',1543),('right/Asia/Vladivostok',1544),('right/Asia/Yakutsk',1545),('right/Asia/Yangon',1546),('right/Asia/Yekaterinburg',1547),('right/Asia/Yerevan',1548),('right/Atlantic/Azores',1549),('right/Atlantic/Bermuda',1550),('right/Atlantic/Canary',1551),('right/Atlantic/Cape_Verde',1552),('right/Atlantic/Faeroe',1553),('right/Atlantic/Faroe',1554),('right/Atlantic/Jan_Mayen',1555),('right/Atlantic/Madeira',1556),('right/Atlantic/Reykjavik',1557),('right/Atlantic/South_Georgia',1558),('right/Atlantic/Stanley',1560),('right/Atlantic/St_Helena',1559),('right/Australia/ACT',1561),('right/Australia/Adelaide',1562),('right/Australia/Brisbane',1563),('right/Australia/Broken_Hill',1564),('right/Australia/Canberra',1565),('right/Australia/Currie',1566),('right/Australia/Darwin',1567),('right/Australia/Eucla',1568),('right/Australia/Hobart',1569),('right/Australia/LHI',1570),('right/Australia/Lindeman',1571),('right/Australia/Lord_Howe',1572),('right/Australia/Melbourne',1573),('right/Australia/North',1575),('right/Australia/NSW',1574),('right/Australia/Perth',1576),('right/Australia/Queensland',1577),('right/Australia/South',1578),('right/Australia/Sydney',1579),('right/Australia/Tasmania',1580),('right/Australia/Victoria',1581),('right/Australia/West',1582),('right/Australia/Yancowinna',1583),('right/Brazil/Acre',1584),('right/Brazil/DeNoronha',1585),('right/Brazil/East',1586),('right/Brazil/West',1587),('right/Canada/Atlantic',1590),('right/Canada/Central',1591),('right/Canada/Eastern',1592),('right/Canada/Mountain',1593),('right/Canada/Newfoundland',1594),('right/Canada/Pacific',1595),('right/Canada/Saskatchewan',1596),('right/Canada/Yukon',1597),('right/CET',1588),('right/Chile/Continental',1598),('right/Chile/EasterIsland',1599),('right/CST6CDT',1589),('right/Cuba',1600),('right/EET',1601),('right/Egypt',1604),('right/Eire',1605),('right/EST',1602),('right/EST5EDT',1603),('right/Etc/GMT',1606),('right/Etc/GMT+0',1607),('right/Etc/GMT+1',1608),('right/Etc/GMT+10',1609),('right/Etc/GMT+11',1610),('right/Etc/GMT+12',1611),('right/Etc/GMT+2',1612),('right/Etc/GMT+3',1613),('right/Etc/GMT+4',1614),('right/Etc/GMT+5',1615),('right/Etc/GMT+6',1616),('right/Etc/GMT+7',1617),('right/Etc/GMT+8',1618),('right/Etc/GMT+9',1619),('right/Etc/GMT-0',1620),('right/Etc/GMT-1',1621),('right/Etc/GMT-10',1622),('right/Etc/GMT-11',1623),('right/Etc/GMT-12',1624),('right/Etc/GMT-13',1625),('right/Etc/GMT-14',1626),('right/Etc/GMT-2',1627),('right/Etc/GMT-3',1628),('right/Etc/GMT-4',1629),('right/Etc/GMT-5',1630),('right/Etc/GMT-6',1631),('right/Etc/GMT-7',1632),('right/Etc/GMT-8',1633),('right/Etc/GMT-9',1634),('right/Etc/GMT0',1635),('right/Etc/Greenwich',1636),('right/Etc/UCT',1637),('right/Etc/Universal',1639),('right/Etc/UTC',1638),('right/Etc/Zulu',1640),('right/Europe/Amsterdam',1641),('right/Europe/Andorra',1642),('right/Europe/Astrakhan',1643),('right/Europe/Athens',1644),('right/Europe/Belfast',1645),('right/Europe/Belgrade',1646),('right/Europe/Berlin',1647),('right/Europe/Bratislava',1648),('right/Europe/Brussels',1649),('right/Europe/Bucharest',1650),('right/Europe/Budapest',1651),('right/Europe/Busingen',1652),('right/Europe/Chisinau',1653),('right/Europe/Copenhagen',1654),('right/Europe/Dublin',1655),('right/Europe/Gibraltar',1656),('right/Europe/Guernsey',1657),('right/Europe/Helsinki',1658),('right/Europe/Isle_of_Man',1659),('right/Europe/Istanbul',1660),('right/Europe/Jersey',1661),('right/Europe/Kaliningrad',1662),('right/Europe/Kiev',1663),('right/Europe/Kirov',1664),('right/Europe/Lisbon',1665),('right/Europe/Ljubljana',1666),('right/Europe/London',1667),('right/Europe/Luxembourg',1668),('right/Europe/Madrid',1669),('right/Europe/Malta',1670),('right/Europe/Mariehamn',1671),('right/Europe/Minsk',1672),('right/Europe/Monaco',1673),('right/Europe/Moscow',1674),('right/Europe/Nicosia',1675),('right/Europe/Oslo',1676),('right/Europe/Paris',1677),('right/Europe/Podgorica',1678),('right/Europe/Prague',1679),('right/Europe/Riga',1680),('right/Europe/Rome',1681),('right/Europe/Samara',1682),('right/Europe/San_Marino',1683),('right/Europe/Sarajevo',1684),('right/Europe/Saratov',1685),('right/Europe/Simferopol',1686),('right/Europe/Skopje',1687),('right/Europe/Sofia',1688),('right/Europe/Stockholm',1689),('right/Europe/Tallinn',1690),('right/Europe/Tirane',1691),('right/Europe/Tiraspol',1692),('right/Europe/Ulyanovsk',1693),('right/Europe/Uzhgorod',1694),('right/Europe/Vaduz',1695),('right/Europe/Vatican',1696),('right/Europe/Vienna',1697),('right/Europe/Vilnius',1698),('right/Europe/Volgograd',1699),('right/Europe/Warsaw',1700),('right/Europe/Zagreb',1701),('right/Europe/Zaporozhye',1702),('right/Europe/Zurich',1703),('right/Factory',1704),('right/GB',1705),('right/GB-Eire',1706),('right/GMT',1707),('right/GMT+0',1708),('right/GMT-0',1709),('right/GMT0',1710),('right/Greenwich',1711),('right/Hongkong',1713),('right/HST',1712),('right/Iceland',1714),('right/Indian/Antananarivo',1715),('right/Indian/Chagos',1716),('right/Indian/Christmas',1717),('right/Indian/Cocos',1718),('right/Indian/Comoro',1719),('right/Indian/Kerguelen',1720),('right/Indian/Mahe',1721),('right/Indian/Maldives',1722),('right/Indian/Mauritius',1723),('right/Indian/Mayotte',1724),('right/Indian/Reunion',1725),('right/Iran',1726),('right/Israel',1727),('right/Jamaica',1728),('right/Japan',1729),('right/Kwajalein',1730),('right/Libya',1731),('right/MET',1732),('right/Mexico/BajaNorte',1735),('right/Mexico/BajaSur',1736),('right/Mexico/General',1737),('right/MST',1733),('right/MST7MDT',1734),('right/Navajo',1740),('right/NZ',1738),('right/NZ-CHAT',1739),('right/Pacific/Apia',1743),('right/Pacific/Auckland',1744),('right/Pacific/Bougainville',1745),('right/Pacific/Chatham',1746),('right/Pacific/Chuuk',1747),('right/Pacific/Easter',1748),('right/Pacific/Efate',1749),('right/Pacific/Enderbury',1750),('right/Pacific/Fakaofo',1751),('right/Pacific/Fiji',1752),('right/Pacific/Funafuti',1753),('right/Pacific/Galapagos',1754),('right/Pacific/Gambier',1755),('right/Pacific/Guadalcanal',1756),('right/Pacific/Guam',1757),('right/Pacific/Honolulu',1758),('right/Pacific/Johnston',1759),('right/Pacific/Kiritimati',1760),('right/Pacific/Kosrae',1761),('right/Pacific/Kwajalein',1762),('right/Pacific/Majuro',1763),('right/Pacific/Marquesas',1764),('right/Pacific/Midway',1765),('right/Pacific/Nauru',1766),('right/Pacific/Niue',1767),('right/Pacific/Norfolk',1768),('right/Pacific/Noumea',1769),('right/Pacific/Pago_Pago',1770),('right/Pacific/Palau',1771),('right/Pacific/Pitcairn',1772),('right/Pacific/Pohnpei',1773),('right/Pacific/Ponape',1774),('right/Pacific/Port_Moresby',1775),('right/Pacific/Rarotonga',1776),('right/Pacific/Saipan',1777),('right/Pacific/Samoa',1778),('right/Pacific/Tahiti',1779),('right/Pacific/Tarawa',1780),('right/Pacific/Tongatapu',1781),('right/Pacific/Truk',1782),('right/Pacific/Wake',1783),('right/Pacific/Wallis',1784),('right/Pacific/Yap',1785),('right/Poland',1786),('right/Portugal',1787),('right/PRC',1741),('right/PST8PDT',1742),('right/ROC',1788),('right/ROK',1789),('right/Singapore',1790),('right/SystemV/AST4',1791),('right/SystemV/AST4ADT',1792),('right/SystemV/CST6',1793),('right/SystemV/CST6CDT',1794),('right/SystemV/EST5',1795),('right/SystemV/EST5EDT',1796),('right/SystemV/HST10',1797),('right/SystemV/MST7',1798),('right/SystemV/MST7MDT',1799),('right/SystemV/PST8',1800),('right/SystemV/PST8PDT',1801),('right/SystemV/YST9',1802),('right/SystemV/YST9YDT',1803),('right/Turkey',1804),('right/UCT',1805),('right/Universal',1820),('right/US/Alaska',1806),('right/US/Aleutian',1807),('right/US/Arizona',1808),('right/US/Central',1809),('right/US/East-Indiana',1810),('right/US/Eastern',1811),('right/US/Hawaii',1812),('right/US/Indiana-Starke',1813),('right/US/Michigan',1814),('right/US/Mountain',1815),('right/US/Pacific',1816),('right/US/Pacific-New',1817),('right/US/Samoa',1818),('right/UTC',1819),('right/W-SU',1821),('right/WET',1822),('right/Zulu',1823),('ROC',572),('ROK',573),('Singapore',574),('SystemV/AST4',575),('SystemV/AST4ADT',576),('SystemV/CST6',577),('SystemV/CST6CDT',578),('SystemV/EST5',579),('SystemV/EST5EDT',580),('SystemV/HST10',581),('SystemV/MST7',582),('SystemV/MST7MDT',583),('SystemV/PST8',584),('SystemV/PST8PDT',585),('SystemV/YST9',586),('SystemV/YST9YDT',587),('Turkey',588),('UCT',589),('Universal',604),('US/Alaska',590),('US/Aleutian',591),('US/Arizona',592),('US/Central',593),('US/East-Indiana',594),('US/Eastern',595),('US/Hawaii',596),('US/Indiana-Starke',597),('US/Michigan',598),('US/Mountain',599),('US/Pacific',600),('US/Pacific-New',601),('US/Samoa',602),('UTC',603),('W-SU',605),('WET',606),('Zulu',607);
/*!40000 ALTER TABLE `time_zone_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Time zone transitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition`
--

LOCK TABLES `time_zone_transition` WRITE;
/*!40000 ALTER TABLE `time_zone_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  `Offset` int(11) NOT NULL DEFAULT '0',
  `Is_DST` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0 COMMENT='Time zone transition types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition_type`
--

LOCK TABLES `time_zone_transition_type` WRITE;
/*!40000 ALTER TABLE `time_zone_transition_type` DISABLE KEYS */;
INSERT INTO `time_zone_transition_type` VALUES (1,0,-968,0,'LMT'),(1,1,0,0,'GMT'),(2,0,-52,0,'LMT'),(2,1,1200,1,'+0020'),(2,2,0,0,'GMT'),(3,0,8836,0,'LMT'),(3,1,10800,0,'EAT'),(3,2,9000,0,'+0230'),(3,3,9900,0,'+0245'),(3,4,10800,0,'EAT'),(4,0,732,0,'LMT'),(4,1,561,0,'PMT'),(4,2,3600,1,'WEST'),(4,3,0,0,'WET'),(4,4,0,0,'WET'),(4,5,7200,1,'CEST'),(4,6,3600,0,'CET'),(4,7,3600,1,'WEST'),(5,0,8836,0,'LMT'),(5,1,10800,0,'EAT'),(5,2,9000,0,'+0230'),(5,3,9900,0,'+0245'),(5,4,10800,0,'EAT'),(6,0,8836,0,'LMT'),(6,1,10800,0,'EAT'),(6,2,9000,0,'+0230'),(6,3,9900,0,'+0245'),(6,4,10800,0,'EAT'),(7,0,-968,0,'LMT'),(7,1,0,0,'GMT'),(8,0,816,0,'LMT'),(8,1,3600,0,'WAT'),(9,0,-968,0,'LMT'),(9,1,0,0,'GMT'),(10,0,-3740,0,'LMT'),(10,1,-3600,0,'-01'),(10,2,0,0,'GMT'),(11,0,7820,0,'LMT'),(11,1,7200,0,'CAT'),(12,0,816,0,'LMT'),(12,1,3600,0,'WAT'),(13,0,7820,0,'LMT'),(13,1,7200,0,'CAT'),(14,0,7509,0,'LMT'),(14,1,10800,1,'EEST'),(14,2,7200,0,'EET'),(14,3,10800,1,'EEST'),(15,0,-1820,0,'LMT'),(15,1,3600,1,'+01'),(15,2,0,0,'+00'),(15,3,3600,0,'+01'),(15,4,0,1,'+00'),(16,0,-1276,0,'LMT'),(16,1,0,0,'WET'),(16,2,3600,1,'WEST'),(16,3,0,0,'WET'),(16,4,3600,0,'CET'),(16,5,7200,1,'CEST'),(16,6,3600,0,'CET'),(17,0,-968,0,'LMT'),(17,1,0,0,'GMT'),(18,0,-968,0,'LMT'),(18,1,0,0,'GMT'),(19,0,8836,0,'LMT'),(19,1,10800,0,'EAT'),(19,2,9000,0,'+0230'),(19,3,9900,0,'+0245'),(19,4,10800,0,'EAT'),(20,0,8836,0,'LMT'),(20,1,10800,0,'EAT'),(20,2,9000,0,'+0230'),(20,3,9900,0,'+0245'),(20,4,10800,0,'EAT'),(21,0,816,0,'LMT'),(21,1,3600,0,'WAT'),(22,0,-3168,0,'LMT'),(22,1,-3600,0,'-01'),(22,2,3600,1,'+01'),(22,3,0,0,'+00'),(22,4,0,1,'+00'),(22,5,3600,0,'+01'),(23,0,-968,0,'LMT'),(23,1,0,0,'GMT'),(24,0,7820,0,'LMT'),(24,1,7200,0,'CAT'),(25,0,7820,0,'LMT'),(25,1,7200,0,'CAT'),(26,0,6720,0,'LMT'),(26,1,5400,0,'SAST'),(26,2,10800,1,'SAST'),(26,3,7200,0,'SAST'),(27,0,7588,0,'LMT'),(27,1,10800,1,'CAST'),(27,2,7200,0,'CAT'),(27,3,10800,0,'EAT'),(28,0,8836,0,'LMT'),(28,1,10800,0,'EAT'),(28,2,9000,0,'+0230'),(28,3,9900,0,'+0245'),(28,4,10800,0,'EAT'),(29,0,7808,0,'LMT'),(29,1,10800,1,'CAST'),(29,2,7200,0,'CAT'),(29,3,10800,0,'EAT'),(29,4,7200,0,'CAT'),(30,0,7820,0,'LMT'),(30,1,7200,0,'CAT'),(31,0,816,0,'LMT'),(31,1,3600,0,'WAT'),(32,0,816,0,'LMT'),(32,1,3600,0,'WAT'),(33,0,816,0,'LMT'),(33,1,3600,0,'WAT'),(34,0,-968,0,'LMT'),(34,1,0,0,'GMT'),(35,0,816,0,'LMT'),(35,1,3600,0,'WAT'),(36,0,7820,0,'LMT'),(36,1,7200,0,'CAT'),(37,0,7820,0,'LMT'),(37,1,7200,0,'CAT'),(38,0,816,0,'LMT'),(38,1,3600,0,'WAT'),(39,0,7820,0,'LMT'),(39,1,7200,0,'CAT'),(40,0,6720,0,'LMT'),(40,1,5400,0,'SAST'),(40,2,10800,1,'SAST'),(40,3,7200,0,'SAST'),(41,0,6720,0,'LMT'),(41,1,5400,0,'SAST'),(41,2,10800,1,'SAST'),(41,3,7200,0,'SAST'),(42,0,8836,0,'LMT'),(42,1,10800,0,'EAT'),(42,2,9000,0,'+0230'),(42,3,9900,0,'+0245'),(42,4,10800,0,'EAT'),(43,0,-2588,0,'LMT'),(43,1,-2588,0,'MMT'),(43,2,-2670,0,'MMT'),(43,3,0,0,'GMT'),(44,0,8836,0,'LMT'),(44,1,10800,0,'EAT'),(44,2,9000,0,'+0230'),(44,3,9900,0,'+0245'),(44,4,10800,0,'EAT'),(45,0,3612,0,'LMT'),(45,1,3600,0,'WAT'),(45,2,7200,1,'WAST'),(46,0,816,0,'LMT'),(46,1,3600,0,'WAT'),(47,0,-968,0,'LMT'),(47,1,0,0,'GMT'),(48,0,-968,0,'LMT'),(48,1,0,0,'GMT'),(49,0,816,0,'LMT'),(49,1,3600,0,'WAT'),(50,0,1616,0,'LMT'),(50,1,-2205,0,'LMT'),(50,2,0,0,'GMT'),(50,3,3600,0,'WAT'),(50,4,0,0,'GMT'),(51,0,-968,0,'LMT'),(51,1,0,0,'GMT'),(52,0,3164,0,'LMT'),(52,1,7200,1,'CEST'),(52,2,3600,0,'CET'),(52,3,7200,0,'EET'),(53,0,2444,0,'LMT'),(53,1,561,0,'PMT'),(53,2,7200,1,'CEST'),(53,3,3600,0,'CET'),(53,4,3600,0,'CET'),(53,5,7200,1,'CEST'),(54,0,4104,0,'LMT'),(54,1,5400,0,'+0130'),(54,2,7200,0,'SAST'),(54,3,10800,1,'SAST'),(54,4,3600,1,'WAT'),(54,5,7200,0,'CAT'),(55,0,-42398,0,'LMT'),(55,1,-39600,0,'NST'),(55,2,-36000,1,'NWT'),(55,3,-36000,1,'NPT'),(55,4,-39600,0,'BST'),(55,5,-36000,1,'BDT'),(55,6,-36000,0,'AHST'),(55,7,-32400,1,'HDT'),(55,8,-36000,0,'HST'),(56,0,-35976,0,'LMT'),(56,1,-36000,0,'AST'),(56,2,-32400,1,'AWT'),(56,3,-32400,1,'APT'),(56,4,-36000,0,'AHST'),(56,5,-32400,1,'AHDT'),(56,6,-32400,0,'YST'),(56,7,-28800,1,'AKDT'),(56,8,-32400,0,'AKST'),(57,0,-14764,0,'LMT'),(57,1,-14400,0,'AST'),(58,0,-14764,0,'LMT'),(58,1,-14400,0,'AST'),(59,0,-11568,0,'LMT'),(59,1,-7200,1,'-02'),(59,2,-10800,0,'-03'),(60,0,-14028,0,'LMT'),(60,1,-15408,0,'CMT'),(60,2,-14400,0,'-04'),(60,3,-10800,1,'-03'),(60,4,-7200,1,'-02'),(60,5,-10800,0,'-03'),(61,0,-15788,0,'LMT'),(61,1,-15408,0,'CMT'),(61,2,-14400,0,'-04'),(61,3,-10800,1,'-03'),(61,4,-7200,1,'-02'),(61,5,-10800,0,'-03'),(62,0,-15788,0,'LMT'),(62,1,-15408,0,'CMT'),(62,2,-14400,0,'-04'),(62,3,-10800,1,'-03'),(62,4,-7200,1,'-02'),(62,5,-10800,0,'-03'),(63,0,-15408,0,'LMT'),(63,1,-15408,0,'CMT'),(63,2,-14400,0,'-04'),(63,3,-10800,1,'-03'),(63,4,-7200,1,'-02'),(63,5,-10800,0,'-03'),(64,0,-15672,0,'LMT'),(64,1,-15408,0,'CMT'),(64,2,-14400,0,'-04'),(64,3,-10800,1,'-03'),(64,4,-7200,1,'-02'),(64,5,-10800,0,'-03'),(65,0,-16044,0,'LMT'),(65,1,-15408,0,'CMT'),(65,2,-14400,0,'-04'),(65,3,-10800,1,'-03'),(65,4,-7200,1,'-02'),(65,5,-10800,0,'-03'),(66,0,-16516,0,'LMT'),(66,1,-15408,0,'CMT'),(66,2,-14400,0,'-04'),(66,3,-10800,1,'-03'),(66,4,-7200,1,'-02'),(66,5,-10800,0,'-03'),(67,0,-16612,0,'LMT'),(67,1,-15408,0,'CMT'),(67,2,-14400,0,'-04'),(67,3,-10800,1,'-03'),(67,4,-7200,1,'-02'),(67,5,-10800,0,'-03'),(68,0,-15700,0,'LMT'),(68,1,-15408,0,'CMT'),(68,2,-14400,0,'-04'),(68,3,-10800,1,'-03'),(68,4,-7200,1,'-02'),(68,5,-10800,0,'-03'),(69,0,-16444,0,'LMT'),(69,1,-15408,0,'CMT'),(69,2,-14400,0,'-04'),(69,3,-10800,1,'-03'),(69,4,-7200,1,'-02'),(69,5,-10800,0,'-03'),(70,0,-15924,0,'LMT'),(70,1,-15408,0,'CMT'),(70,2,-14400,0,'-04'),(70,3,-10800,1,'-03'),(70,4,-7200,1,'-02'),(70,5,-10800,0,'-03'),(70,6,-10800,1,'-03'),(71,0,-15652,0,'LMT'),(71,1,-15408,0,'CMT'),(71,2,-14400,0,'-04'),(71,3,-10800,1,'-03'),(71,4,-7200,1,'-02'),(71,5,-10800,0,'-03'),(72,0,-16392,0,'LMT'),(72,1,-15408,0,'CMT'),(72,2,-14400,0,'-04'),(72,3,-10800,1,'-03'),(72,4,-7200,1,'-02'),(72,5,-10800,0,'-03'),(73,0,-16547,0,'LMT'),(73,1,-16200,0,'-0430'),(73,2,-14400,0,'AST'),(74,0,-13840,0,'LMT'),(74,1,-13840,0,'AMT'),(74,2,-14400,0,'-04'),(74,3,-10800,0,'-03'),(74,4,-10800,1,'-03'),(74,5,-14400,0,'-04'),(75,0,-21988,0,'LMT'),(75,1,-18000,1,'CDT'),(75,2,-21600,0,'CST'),(75,3,-18000,1,'CWT'),(75,4,-18000,1,'CPT'),(75,5,-18000,0,'EST'),(76,0,-42398,0,'LMT'),(76,1,-39600,0,'NST'),(76,2,-36000,1,'NWT'),(76,3,-36000,1,'NPT'),(76,4,-39600,0,'BST'),(76,5,-36000,1,'BDT'),(76,6,-36000,0,'AHST'),(76,7,-32400,1,'HDT'),(76,8,-36000,0,'HST'),(77,0,-9244,0,'LMT'),(77,1,-7200,1,'-02'),(77,2,-10800,0,'-03'),(78,0,-25260,0,'LMT'),(78,1,-25200,0,'MST'),(78,2,-21600,0,'CST'),(78,3,-28800,0,'PST'),(78,4,-21600,1,'MDT'),(78,5,-18000,1,'CDT'),(78,6,-21600,0,'CST'),(79,0,-14309,0,'LMT'),(79,1,-14309,0,'BMT'),(79,2,-10800,1,'ADT'),(79,3,-14400,0,'AST'),(80,0,-11636,0,'LMT'),(80,1,-7200,1,'-02'),(80,2,-10800,0,'-03'),(81,0,-21168,0,'LMT'),(81,1,-19800,1,'-0530'),(81,2,-21600,0,'CST'),(81,3,-18000,1,'CDT'),(82,0,-13708,0,'LMT'),(82,1,-10800,1,'ADT'),(82,2,-14400,0,'AST'),(82,3,-10800,1,'AWT'),(82,4,-10800,1,'APT'),(83,0,-14560,0,'LMT'),(83,1,-10800,1,'-03'),(83,2,-14400,0,'-04'),(84,0,-17776,0,'LMT'),(84,1,-17776,0,'BMT'),(84,2,-14400,1,'-04'),(84,3,-18000,0,'-05'),(85,0,-27889,0,'LMT'),(85,1,-25200,1,'PDT'),(85,2,-28800,0,'PST'),(85,3,-21600,1,'MWT'),(85,4,-21600,1,'MPT'),(85,5,-25200,0,'MST'),(85,6,-21600,1,'MDT'),(86,0,-14028,0,'LMT'),(86,1,-15408,0,'CMT'),(86,2,-14400,0,'-04'),(86,3,-10800,1,'-03'),(86,4,-7200,1,'-02'),(86,5,-10800,0,'-03'),(87,0,0,0,'-00'),(87,1,-21600,1,'MWT'),(87,2,-21600,1,'MPT'),(87,3,-25200,0,'MST'),(87,4,-18000,1,'MDDT'),(87,5,-21600,1,'MDT'),(87,6,-18000,1,'CDT'),(87,7,-21600,0,'CST'),(87,8,-18000,0,'EST'),(87,9,-21600,1,'MDT'),(87,10,-25200,0,'MST'),(88,0,-13108,0,'LMT'),(88,1,-10800,1,'-03'),(88,2,-14400,0,'-04'),(89,0,-20824,0,'LMT'),(89,1,-21600,0,'CST'),(89,2,-14400,1,'EDT'),(89,3,-18000,0,'EST'),(89,4,-18000,1,'CDT'),(90,0,-16064,0,'LMT'),(90,1,-16060,0,'CMT'),(90,2,-16200,0,'-0430'),(90,3,-14400,0,'-04'),(91,0,-15788,0,'LMT'),(91,1,-15408,0,'CMT'),(91,2,-14400,0,'-04'),(91,3,-10800,1,'-03'),(91,4,-7200,1,'-02'),(91,5,-10800,0,'-03'),(92,0,-12560,0,'LMT'),(92,1,-14400,0,'-04'),(92,2,-10800,0,'-03'),(93,0,-19088,0,'LMT'),(93,1,-19176,0,'CMT'),(93,2,-18000,0,'EST'),(94,0,-21036,0,'LMT'),(94,1,-18000,1,'CDT'),(94,2,-21600,0,'CST'),(94,3,-18000,0,'EST'),(94,4,-18000,1,'CWT'),(94,5,-18000,1,'CPT'),(94,6,-21600,0,'CST'),(95,0,-25460,0,'LMT'),(95,1,-25200,0,'MST'),(95,2,-21600,0,'CST'),(95,3,-18000,1,'CDT'),(95,4,-21600,1,'MDT'),(95,5,-25200,0,'MST'),(96,0,-21988,0,'LMT'),(96,1,-18000,1,'CDT'),(96,2,-21600,0,'CST'),(96,3,-18000,1,'CWT'),(96,4,-18000,1,'CPT'),(96,5,-18000,0,'EST'),(97,0,-15408,0,'LMT'),(97,1,-15408,0,'CMT'),(97,2,-14400,0,'-04'),(97,3,-10800,1,'-03'),(97,4,-7200,1,'-02'),(97,5,-10800,0,'-03'),(98,0,-20173,0,'LMT'),(98,1,-20173,0,'SJMT'),(98,2,-18000,1,'CDT'),(98,3,-21600,0,'CST'),(99,0,-27964,0,'LMT'),(99,1,-25200,0,'MST'),(99,2,-28800,0,'PST'),(99,3,-25200,0,'MST'),(100,0,-13460,0,'LMT'),(100,1,-10800,1,'-03'),(100,2,-14400,0,'-04'),(101,0,-16547,0,'LMT'),(101,1,-16200,0,'-0430'),(101,2,-14400,0,'AST'),(102,0,-4480,0,'LMT'),(102,1,-10800,0,'-03'),(102,2,-10800,0,'-03'),(102,3,-7200,1,'-02'),(102,4,-7200,1,'-02'),(102,5,0,0,'GMT'),(103,0,-33460,0,'LMT'),(103,1,-28800,1,'YDT'),(103,2,-32400,0,'YST'),(103,3,-28800,1,'YWT'),(103,4,-28800,1,'YPT'),(103,5,-25200,1,'YDDT'),(103,6,-28800,0,'PST'),(103,7,-25200,1,'PDT'),(104,0,-28856,0,'LMT'),(104,1,-25200,1,'PDT'),(104,2,-28800,0,'PST'),(104,3,-25200,1,'PWT'),(104,4,-25200,1,'PPT'),(104,5,-25200,0,'MST'),(105,0,-25196,0,'LMT'),(105,1,-21600,1,'MDT'),(105,2,-25200,0,'MST'),(105,3,-21600,1,'MWT'),(105,4,-21600,1,'MPT'),(106,0,-19931,0,'LMT'),(106,1,-21600,0,'CST'),(106,2,-18000,0,'EST'),(106,3,-14400,1,'EWT'),(106,4,-14400,1,'EPT'),(106,5,-14400,1,'EDT'),(107,0,-14764,0,'LMT'),(107,1,-14400,0,'AST'),(108,0,-27232,0,'LMT'),(108,1,-21600,1,'MDT'),(108,2,-25200,0,'MST'),(108,3,-21600,1,'MWT'),(108,4,-21600,1,'MPT'),(109,0,-16768,0,'LMT'),(109,1,-14400,1,'-04'),(109,2,-18000,0,'-05'),(109,3,-14400,0,'-04'),(109,4,-18000,0,'-05'),(110,0,-21408,0,'LMT'),(110,1,-18000,1,'CDT'),(110,2,-21600,0,'CST'),(111,0,-28084,0,'LMT'),(111,1,-25200,0,'MST'),(111,2,-28800,0,'PST'),(111,3,-25200,1,'PDT'),(111,4,-25200,1,'PWT'),(111,5,-25200,1,'PPT'),(112,0,-29447,0,'LMT'),(112,1,-25200,1,'PDT'),(112,2,-28800,0,'PST'),(112,3,-25200,1,'PWT'),(112,4,-25200,1,'PPT'),(112,5,-25200,0,'MST'),(113,0,-20678,0,'LMT'),(113,1,-18000,1,'CDT'),(113,2,-21600,0,'CST'),(113,3,-18000,1,'CWT'),(113,4,-18000,1,'CPT'),(113,5,-18000,0,'EST'),(113,6,-14400,1,'EDT'),(114,0,-9240,0,'LMT'),(114,1,-7200,1,'-02'),(114,2,-10800,0,'-03'),(115,0,-14388,0,'LMT'),(115,1,-10800,1,'ADT'),(115,2,-14400,0,'AST'),(115,3,-10800,1,'AWT'),(115,4,-10800,1,'APT'),(116,0,-12416,0,'LMT'),(116,1,-10800,0,'-03'),(116,2,-10800,0,'-03'),(116,3,-7200,1,'-02'),(116,4,-7200,1,'-02'),(117,0,-14500,0,'LMT'),(117,1,-12652,0,'NST'),(117,2,-9052,1,'NDT'),(117,3,-12600,0,'NST'),(117,4,-9000,1,'NDT'),(117,5,-9000,1,'NPT'),(117,6,-9000,1,'NWT'),(117,7,-10800,1,'ADT'),(117,8,-14400,0,'AST'),(117,9,-7200,1,'ADDT'),(117,10,-10800,1,'ADT'),(118,0,-17072,0,'LMT'),(118,1,-18430,0,'KMT'),(118,2,-18000,0,'EST'),(118,3,-14400,1,'EDT'),(118,4,-14400,0,'AST'),(118,5,-18000,0,'EST'),(119,0,-14764,0,'LMT'),(119,1,-14400,0,'AST'),(120,0,-14764,0,'LMT'),(120,1,-14400,0,'AST'),(121,0,-21724,0,'LMT'),(121,1,-18000,1,'CDT'),(121,2,-21600,0,'CST'),(122,0,-19160,0,'LMT'),(122,1,-18840,0,'QMT'),(122,2,-14400,1,'-04'),(122,3,-18000,0,'-05'),(123,0,-13960,0,'LMT'),(123,1,-13500,0,'-0345'),(123,2,-10800,0,'-03'),(123,3,-14400,0,'-04'),(124,0,-15264,0,'LMT'),(124,1,-10800,1,'ADT'),(124,2,-14400,0,'AST'),(124,3,-10800,1,'AWT'),(124,4,-10800,1,'APT'),(125,0,-19768,0,'LMT'),(125,1,-19776,0,'HMT'),(125,2,-14400,1,'CDT'),(125,3,-18000,0,'CST'),(125,4,-18000,0,'CST'),(125,5,-14400,1,'CDT'),(126,0,-26632,0,'LMT'),(126,1,-25200,0,'MST'),(126,2,-21600,0,'CST'),(126,3,-28800,0,'PST'),(126,4,-21600,1,'MDT'),(126,5,-25200,0,'MST'),(127,0,-20678,0,'LMT'),(127,1,-18000,1,'CDT'),(127,2,-21600,0,'CST'),(127,3,-18000,1,'CWT'),(127,4,-18000,1,'CPT'),(127,5,-18000,0,'EST'),(127,6,-14400,1,'EDT'),(128,0,-20790,0,'LMT'),(128,1,-18000,1,'CDT'),(128,2,-21600,0,'CST'),(128,3,-18000,1,'CWT'),(128,4,-18000,1,'CPT'),(128,5,-18000,0,'EST'),(128,6,-21600,0,'CST'),(129,0,-20723,0,'LMT'),(129,1,-18000,1,'CDT'),(129,2,-21600,0,'CST'),(129,3,-18000,1,'CWT'),(129,4,-18000,1,'CPT'),(129,5,-18000,0,'EST'),(129,6,-14400,1,'EDT'),(130,0,-20947,0,'LMT'),(130,1,-18000,1,'CDT'),(130,2,-21600,0,'CST'),(130,3,-18000,1,'CWT'),(130,4,-18000,1,'CPT'),(130,5,-18000,0,'EST'),(130,6,-14400,1,'EDT'),(131,0,-20823,0,'LMT'),(131,1,-18000,1,'CDT'),(131,2,-21600,0,'CST'),(131,3,-18000,1,'CWT'),(131,4,-18000,1,'CPT'),(131,5,-18000,0,'EST'),(131,6,-14400,1,'EDT'),(131,7,-18000,1,'CDT'),(131,8,-21600,0,'CST'),(132,0,-20416,0,'LMT'),(132,1,-18000,1,'CDT'),(132,2,-21600,0,'CST'),(132,3,-18000,1,'CWT'),(132,4,-18000,1,'CPT'),(132,5,-18000,0,'EST'),(132,6,-14400,1,'EDT'),(133,0,-21007,0,'LMT'),(133,1,-18000,1,'CDT'),(133,2,-21600,0,'CST'),(133,3,-18000,1,'CWT'),(133,4,-18000,1,'CPT'),(133,5,-18000,0,'EST'),(133,6,-14400,1,'EDT'),(134,0,-20785,0,'LMT'),(134,1,-18000,1,'CDT'),(134,2,-21600,0,'CST'),(134,3,-18000,1,'CWT'),(134,4,-18000,1,'CPT'),(134,5,-18000,0,'EST'),(134,6,-14400,1,'EDT'),(135,0,-20678,0,'LMT'),(135,1,-18000,1,'CDT'),(135,2,-21600,0,'CST'),(135,3,-18000,1,'CWT'),(135,4,-18000,1,'CPT'),(135,5,-18000,0,'EST'),(135,6,-14400,1,'EDT'),(136,0,0,0,'-00'),(136,1,-21600,1,'PDDT'),(136,2,-28800,0,'PST'),(136,3,-25200,0,'MST'),(136,4,-21600,1,'MDT'),(137,0,0,0,'-00'),(137,1,-14400,1,'EPT'),(137,2,-18000,0,'EST'),(137,3,-10800,1,'EDDT'),(137,4,-14400,1,'EDT'),(137,5,-14400,1,'EWT'),(137,6,-21600,0,'CST'),(137,7,-18000,1,'CDT'),(137,8,-14400,1,'EDT'),(137,9,-18000,0,'EST'),(138,0,-18430,0,'LMT'),(138,1,-18430,0,'KMT'),(138,2,-18000,0,'EST'),(138,3,-14400,1,'EDT'),(139,0,-15672,0,'LMT'),(139,1,-15408,0,'CMT'),(139,2,-14400,0,'-04'),(139,3,-10800,1,'-03'),(139,4,-7200,1,'-02'),(139,5,-10800,0,'-03'),(140,0,-32261,0,'LMT'),(140,1,-28800,0,'PST'),(140,2,-25200,1,'PWT'),(140,3,-25200,1,'PPT'),(140,4,-25200,1,'PDT'),(140,5,-28800,1,'YDT'),(140,6,-32400,0,'YST'),(140,7,-28800,1,'AKDT'),(140,8,-32400,0,'AKST'),(141,0,-20582,0,'LMT'),(141,1,-18000,1,'CDT'),(141,2,-21600,0,'CST'),(141,3,-18000,1,'CWT'),(141,4,-18000,1,'CPT'),(141,5,-18000,0,'EST'),(141,6,-14400,1,'EDT'),(142,0,-20364,0,'LMT'),(142,1,-18000,1,'CDT'),(142,2,-21600,0,'CST'),(142,3,-18000,1,'CWT'),(142,4,-18000,1,'CPT'),(142,5,-14400,1,'EDT'),(142,6,-18000,0,'EST'),(143,0,-20790,0,'LMT'),(143,1,-18000,1,'CDT'),(143,2,-21600,0,'CST'),(143,3,-18000,1,'CWT'),(143,4,-18000,1,'CPT'),(143,5,-18000,0,'EST'),(143,6,-21600,0,'CST'),(144,0,-16547,0,'LMT'),(144,1,-16200,0,'-0430'),(144,2,-14400,0,'AST'),(145,0,-16356,0,'LMT'),(145,1,-16356,0,'CMT'),(145,2,-12756,1,'BST'),(145,3,-14400,0,'-04'),(146,0,-18492,0,'LMT'),(146,1,-18516,0,'LMT'),(146,2,-14400,1,'-04'),(146,3,-18000,0,'-05'),(147,0,-28378,0,'LMT'),(147,1,-25200,1,'PDT'),(147,2,-28800,0,'PST'),(147,3,-25200,1,'PWT'),(147,4,-25200,1,'PPT'),(148,0,-20582,0,'LMT'),(148,1,-18000,1,'CDT'),(148,2,-21600,0,'CST'),(148,3,-18000,1,'CWT'),(148,4,-18000,1,'CPT'),(148,5,-18000,0,'EST'),(148,6,-14400,1,'EDT'),(149,0,-16547,0,'LMT'),(149,1,-16200,0,'-0430'),(149,2,-14400,0,'AST'),(150,0,-8572,0,'LMT'),(150,1,-7200,1,'-02'),(150,2,-10800,0,'-03'),(151,0,-20708,0,'LMT'),(151,1,-20712,0,'MMT'),(151,2,-21600,0,'CST'),(151,3,-18000,0,'EST'),(151,4,-18000,1,'CDT'),(151,5,-21600,0,'CST'),(152,0,-14404,0,'LMT'),(152,1,-10800,1,'-03'),(152,2,-14400,0,'-04'),(153,0,-14764,0,'LMT'),(153,1,-14400,0,'AST'),(154,0,-14660,0,'LMT'),(154,1,-14660,0,'FFMT'),(154,2,-14400,0,'AST'),(154,3,-10800,1,'ADT'),(155,0,-24000,0,'LMT'),(155,1,-21600,0,'CST'),(155,2,-18000,1,'CDT'),(156,0,-25540,0,'LMT'),(156,1,-25200,0,'MST'),(156,2,-21600,0,'CST'),(156,3,-28800,0,'PST'),(156,4,-21600,1,'MDT'),(156,5,-25200,0,'MST'),(157,0,-16516,0,'LMT'),(157,1,-15408,0,'CMT'),(157,2,-14400,0,'-04'),(157,3,-10800,1,'-03'),(157,4,-7200,1,'-02'),(157,5,-10800,0,'-03'),(158,0,-21027,0,'LMT'),(158,1,-18000,1,'CDT'),(158,2,-21600,0,'CST'),(158,3,-18000,1,'CWT'),(158,4,-18000,1,'CPT'),(158,5,-18000,0,'EST'),(158,6,-21600,0,'CST'),(159,0,-21508,0,'LMT'),(159,1,-21600,0,'CST'),(159,2,-18000,0,'EST'),(159,3,-18000,1,'CDT'),(159,4,-21600,0,'CST'),(160,0,-31578,0,'LMT'),(160,1,-28800,0,'PST'),(160,2,-25200,1,'PWT'),(160,3,-25200,1,'PPT'),(160,4,-25200,1,'PDT'),(160,5,-32400,0,'AKST'),(160,6,-28800,1,'AKDT'),(161,0,-23796,0,'LMT'),(161,1,-25200,0,'MST'),(161,2,-21600,0,'CST'),(161,3,-18000,1,'CDT'),(161,4,-18000,1,'CWT'),(162,0,-13480,0,'LMT'),(162,1,-14400,0,'AST'),(162,2,-10800,0,'-03'),(162,3,-7200,1,'-02'),(163,0,-15548,0,'LMT'),(163,1,-18000,0,'EST'),(163,2,-10800,1,'ADT'),(163,3,-14400,0,'AST'),(163,4,-10800,1,'AWT'),(163,5,-10800,1,'APT'),(164,0,-24076,0,'LMT'),(164,1,-21600,0,'CST'),(164,2,-18000,1,'CDT'),(165,0,-13491,0,'LMT'),(165,1,-13491,0,'MMT'),(165,2,-14400,0,'-04'),(165,3,-12600,0,'-0330'),(165,4,-10800,1,'-03'),(165,5,-10800,0,'-03'),(165,6,-9000,1,'-0230'),(165,7,-7200,1,'-02'),(165,8,-5400,1,'-0130'),(165,9,-7200,1,'-02'),(166,0,-19052,0,'LMT'),(166,1,-14400,1,'EDT'),(166,2,-18000,0,'EST'),(166,3,-14400,1,'EWT'),(166,4,-14400,1,'EPT'),(167,0,-14764,0,'LMT'),(167,1,-14400,0,'AST'),(168,0,-18570,0,'LMT'),(168,1,-14400,1,'EDT'),(168,2,-18000,0,'EST'),(169,0,-17762,0,'LMT'),(169,1,-14400,1,'EDT'),(169,2,-18000,0,'EST'),(169,3,-14400,1,'EWT'),(169,4,-14400,1,'EPT'),(170,0,-21184,0,'LMT'),(170,1,-14400,1,'EDT'),(170,2,-18000,0,'EST'),(170,3,-14400,1,'EWT'),(170,4,-14400,1,'EPT'),(171,0,-39698,0,'LMT'),(171,1,-39600,0,'NST'),(171,2,-36000,1,'NWT'),(171,3,-36000,1,'NPT'),(171,4,-39600,0,'BST'),(171,5,-36000,1,'BDT'),(171,6,-32400,0,'YST'),(171,7,-28800,1,'AKDT'),(171,8,-32400,0,'AKST'),(172,0,-7780,0,'LMT'),(172,1,-3600,1,'-01'),(172,2,-7200,0,'-02'),(173,0,-24427,0,'LMT'),(173,1,-21600,1,'MDT'),(173,2,-25200,0,'MST'),(173,3,-21600,1,'MWT'),(173,4,-21600,1,'MPT'),(173,5,-18000,1,'CDT'),(173,6,-21600,0,'CST'),(174,0,-24312,0,'LMT'),(174,1,-21600,1,'MDT'),(174,2,-25200,0,'MST'),(174,3,-21600,1,'MWT'),(174,4,-21600,1,'MPT'),(174,5,-18000,1,'CDT'),(174,6,-21600,0,'CST'),(175,0,-24339,0,'LMT'),(175,1,-21600,1,'MDT'),(175,2,-25200,0,'MST'),(175,3,-21600,1,'MWT'),(175,4,-21600,1,'MPT'),(175,5,-18000,1,'CDT'),(175,6,-21600,0,'CST'),(176,0,-25060,0,'LMT'),(176,1,-25200,0,'MST'),(176,2,-21600,0,'CST'),(176,3,-18000,1,'CDT'),(176,4,-21600,1,'MDT'),(176,5,-25200,0,'MST'),(177,0,-19088,0,'LMT'),(177,1,-19176,0,'CMT'),(177,2,-18000,0,'EST'),(178,0,0,0,'-00'),(178,1,-10800,1,'AWT'),(178,2,-10800,1,'APT'),(178,3,-14400,0,'AST'),(178,4,-7200,1,'ADDT'),(178,5,-10800,1,'ADT'),(178,6,-14400,1,'EDT'),(178,7,-18000,0,'EST'),(178,8,-21600,0,'CST'),(178,9,-18000,1,'CDT'),(178,10,-14400,1,'EDT'),(178,11,-18000,0,'EST'),(179,0,-13240,0,'LMT'),(179,1,-13252,0,'PMT'),(179,2,-13236,0,'PMT'),(179,3,-12600,0,'-0330'),(179,4,-10800,0,'-03'),(180,0,-26898,0,'LMT'),(180,1,-21600,1,'MDT'),(180,2,-25200,0,'MST'),(180,3,-21600,1,'MWT'),(181,0,-17360,0,'LMT'),(181,1,-17340,0,'PPMT'),(181,2,-14400,1,'EDT'),(181,3,-18000,0,'EST'),(181,4,-14400,1,'EDT'),(181,5,-18000,0,'EST'),(182,0,-14764,0,'LMT'),(182,1,-14400,0,'AST'),(183,0,-16272,0,'LMT'),(183,1,-14400,1,'-04'),(183,2,-18000,0,'-05'),(183,3,-14400,0,'-04'),(183,4,-18000,0,'-05'),(184,0,-15336,0,'LMT'),(184,1,-10800,1,'-03'),(184,2,-14400,0,'-04'),(185,0,-15865,0,'LMT'),(185,1,-14400,0,'AST'),(185,2,-10800,1,'APT'),(185,3,-10800,1,'AWT'),(186,0,-17020,0,'LMT'),(186,1,-16966,0,'SMT'),(186,2,-18000,0,'-05'),(186,3,-14400,0,'-04'),(186,4,-14400,1,'-04'),(186,5,-10800,1,'-03'),(186,6,-14400,0,'-04'),(186,7,-10800,0,'-03'),(187,0,-22696,0,'LMT'),(187,1,-18000,1,'CDT'),(187,2,-21600,0,'CST'),(187,3,-18000,1,'CWT'),(187,4,-18000,1,'CPT'),(188,0,0,0,'-00'),(188,1,-14400,1,'CDDT'),(188,2,-21600,0,'CST'),(188,3,-18000,1,'CDT'),(188,4,-18000,0,'EST'),(188,5,-21600,0,'CST'),(189,0,-8376,0,'LMT'),(189,1,-7200,1,'-02'),(189,2,-10800,0,'-03'),(190,0,-25116,0,'LMT'),(190,1,-21600,1,'MDT'),(190,2,-25200,0,'MST'),(190,3,-21600,1,'MWT'),(190,4,-21600,1,'MPT'),(190,5,-21600,0,'CST'),(191,0,0,0,'-00'),(191,1,-14400,1,'CDDT'),(191,2,-21600,0,'CST'),(191,3,-18000,1,'CDT'),(191,4,-18000,0,'EST'),(191,5,-21600,0,'CST'),(192,0,-16272,0,'LMT'),(192,1,-14400,1,'-04'),(192,2,-18000,0,'-05'),(192,3,-14400,0,'-04'),(192,4,-18000,0,'-05'),(193,0,-15408,0,'LMT'),(193,1,-15408,0,'CMT'),(193,2,-14400,0,'-04'),(193,3,-10800,1,'-03'),(193,4,-7200,1,'-02'),(193,5,-10800,0,'-03'),(194,0,-28084,0,'LMT'),(194,1,-25200,0,'MST'),(194,2,-28800,0,'PST'),(194,3,-25200,1,'PDT'),(194,4,-25200,1,'PWT'),(194,5,-25200,1,'PPT'),(195,0,-13128,0,'LMT'),(195,1,-10800,1,'-03'),(195,2,-14400,0,'-04'),(195,3,-10800,0,'-03'),(196,0,-16966,0,'LMT'),(196,1,-16966,0,'SMT'),(196,2,-18000,0,'-05'),(196,3,-14400,0,'-04'),(196,4,-14400,1,'-04'),(196,5,-10800,1,'-03'),(196,6,-10800,1,'-03'),(196,7,-14400,0,'-04'),(197,0,-16776,0,'LMT'),(197,1,-16800,0,'SDMT'),(197,2,-14400,1,'EDT'),(197,3,-18000,0,'EST'),(197,4,-16200,1,'-0430'),(197,5,-14400,0,'AST'),(198,0,-11188,0,'LMT'),(198,1,-7200,1,'-02'),(198,2,-10800,0,'-03'),(199,0,-5272,0,'LMT'),(199,1,-7200,0,'-02'),(199,2,-3600,1,'-01'),(199,3,-7200,0,'-02'),(199,4,-3600,0,'-01'),(199,5,0,1,'+00'),(199,6,0,1,'+00'),(200,0,-25196,0,'LMT'),(200,1,-21600,1,'MDT'),(200,2,-25200,0,'MST'),(200,3,-21600,1,'MWT'),(200,4,-21600,1,'MPT'),(201,0,-32473,0,'LMT'),(201,1,-28800,0,'PST'),(201,2,-25200,1,'PWT'),(201,3,-25200,1,'PPT'),(201,4,-25200,1,'PDT'),(201,5,-32400,0,'YST'),(201,6,-28800,1,'AKDT'),(201,7,-32400,0,'AKST'),(202,0,-14764,0,'LMT'),(202,1,-14400,0,'AST'),(203,0,-12652,0,'LMT'),(203,1,-9052,1,'NDT'),(203,2,-12652,0,'NST'),(203,3,-9000,1,'NDT'),(203,4,-12600,0,'NST'),(203,5,-9000,1,'NPT'),(203,6,-9000,1,'NWT'),(203,7,-5400,1,'NDDT'),(203,8,-9000,1,'NDT'),(204,0,-14764,0,'LMT'),(204,1,-14400,0,'AST'),(205,0,-14764,0,'LMT'),(205,1,-14400,0,'AST'),(206,0,-14764,0,'LMT'),(206,1,-14400,0,'AST'),(207,0,-14764,0,'LMT'),(207,1,-14400,0,'AST'),(208,0,-25880,0,'LMT'),(208,1,-21600,1,'MDT'),(208,2,-25200,0,'MST'),(208,3,-21600,1,'MWT'),(208,4,-21600,1,'MPT'),(208,5,-21600,0,'CST'),(209,0,-20932,0,'LMT'),(209,1,-18000,1,'CDT'),(209,2,-21600,0,'CST'),(210,0,-16508,0,'LMT'),(210,1,-10800,1,'ADT'),(210,2,-14400,0,'AST'),(211,0,-21420,0,'LMT'),(211,1,-21600,0,'CST'),(211,2,-18000,0,'EST'),(211,3,-14400,1,'EWT'),(211,4,-14400,1,'EPT'),(211,5,-14400,1,'EDT'),(212,0,-28084,0,'LMT'),(212,1,-25200,0,'MST'),(212,2,-28800,0,'PST'),(212,3,-25200,1,'PDT'),(212,4,-25200,1,'PWT'),(212,5,-25200,1,'PPT'),(213,0,-19052,0,'LMT'),(213,1,-14400,1,'EDT'),(213,2,-18000,0,'EST'),(213,3,-14400,1,'EWT'),(213,4,-14400,1,'EPT'),(214,0,-14764,0,'LMT'),(214,1,-14400,0,'AST'),(215,0,-29548,0,'LMT'),(215,1,-25200,1,'PDT'),(215,2,-28800,0,'PST'),(215,3,-25200,1,'PWT'),(215,4,-25200,1,'PPT'),(216,0,-14764,0,'LMT'),(216,1,-14400,0,'AST'),(217,0,-32412,0,'LMT'),(217,1,-28800,1,'YDT'),(217,2,-32400,0,'YST'),(217,3,-28800,1,'YWT'),(217,4,-28800,1,'YPT'),(217,5,-25200,1,'YDDT'),(217,6,-28800,0,'PST'),(217,7,-25200,1,'PDT'),(218,0,-23316,0,'LMT'),(218,1,-18000,1,'CDT'),(218,2,-21600,0,'CST'),(218,3,-18000,1,'CWT'),(218,4,-18000,1,'CPT'),(218,5,-18000,1,'CDT'),(218,6,-21600,0,'CST'),(219,0,-33535,0,'LMT'),(219,1,-32400,0,'YST'),(219,2,-28800,1,'YWT'),(219,3,-28800,1,'YPT'),(219,4,-28800,1,'YDT'),(219,5,-28800,1,'AKDT'),(219,6,-32400,0,'AKST'),(220,0,0,0,'-00'),(220,1,-21600,1,'MWT'),(220,2,-21600,1,'MPT'),(220,3,-25200,0,'MST'),(220,4,-18000,1,'MDDT'),(220,5,-21600,1,'MDT'),(221,0,0,0,'-00'),(221,1,28800,0,'+08'),(221,2,39600,0,'+11'),(221,3,28800,0,'+08'),(222,0,0,0,'-00'),(222,1,25200,0,'+07'),(222,2,18000,0,'+05'),(222,3,25200,0,'+07'),(223,0,0,0,'-00'),(223,1,36000,0,'+10'),(224,0,0,0,'-00'),(224,1,36000,0,'AEST'),(224,2,39600,1,'AEDT'),(224,3,0,0,'-00'),(224,4,39600,1,'AEDT'),(224,5,36000,0,'AEST'),(224,6,39600,0,'+11'),(225,0,0,0,'-00'),(225,1,21600,0,'+06'),(225,2,18000,0,'+05'),(226,0,41944,0,'LMT'),(226,1,45000,1,'NZST'),(226,2,41400,0,'NZMT'),(226,3,43200,1,'NZST'),(226,4,46800,1,'NZDT'),(226,5,43200,0,'NZST'),(226,6,43200,0,'NZST'),(227,0,0,0,'-00'),(227,1,-14400,0,'-04'),(227,2,-10800,1,'-03'),(227,3,-7200,1,'-02'),(227,4,-10800,0,'-03'),(227,5,-10800,1,'-03'),(227,6,-14400,0,'-04'),(227,7,-10800,0,'-03'),(228,0,0,0,'-00'),(228,1,-10800,0,'-03'),(229,0,41944,0,'LMT'),(229,1,45000,1,'NZST'),(229,2,41400,0,'NZMT'),(229,3,43200,1,'NZST'),(229,4,46800,1,'NZDT'),(229,5,43200,0,'NZST'),(229,6,43200,0,'NZST'),(230,0,0,0,'-00'),(230,1,10800,0,'+03'),(231,0,0,0,'-00'),(231,1,7200,1,'+02'),(231,2,0,0,'+00'),(231,3,0,0,'+00'),(232,0,0,0,'-00'),(232,1,21600,0,'+06'),(233,0,2580,0,'LMT'),(233,1,7200,1,'CEST'),(233,2,3600,0,'CET'),(233,3,3600,0,'CET'),(233,4,7200,1,'CEST'),(233,5,7200,1,'CEST'),(233,6,3600,0,'CET'),(234,0,11212,0,'LMT'),(234,1,10800,0,'+03'),(235,0,18468,0,'LMT'),(235,1,18000,0,'+05'),(235,2,25200,1,'+07'),(235,3,21600,0,'+06'),(235,4,21600,0,'+06'),(235,5,25200,1,'+07'),(235,6,21600,1,'+06'),(235,7,18000,0,'+05'),(235,8,25200,1,'+07'),(235,9,21600,0,'+06'),(236,0,8624,0,'LMT'),(236,1,10800,1,'EEST'),(236,2,7200,0,'EET'),(236,3,7200,0,'EET'),(236,4,10800,1,'EEST'),(237,0,42596,0,'LMT'),(237,1,43200,0,'+12'),(237,2,50400,1,'+14'),(237,3,46800,0,'+13'),(237,4,46800,1,'+13'),(237,5,43200,0,'+12'),(237,6,46800,1,'+13'),(237,7,43200,1,'+12'),(237,8,39600,0,'+11'),(237,9,43200,0,'+12'),(238,0,12064,0,'LMT'),(238,1,14400,0,'+04'),(238,2,18000,0,'+05'),(238,3,21600,0,'+06'),(238,4,21600,1,'+06'),(238,5,18000,0,'+05'),(238,6,21600,1,'+06'),(238,7,18000,1,'+05'),(238,8,14400,0,'+04'),(238,9,18000,0,'+05'),(239,0,13720,0,'LMT'),(239,1,14400,0,'+04'),(239,2,18000,0,'+05'),(239,3,21600,1,'+06'),(239,4,21600,0,'+06'),(239,5,18000,0,'+05'),(239,6,21600,1,'+06'),(239,7,18000,1,'+05'),(239,8,14400,0,'+04'),(239,9,21600,1,'+06'),(239,10,18000,0,'+05'),(240,0,14012,0,'LMT'),(240,1,14400,0,'+04'),(240,2,21600,1,'+06'),(240,3,18000,0,'+05'),(240,4,18000,0,'+05'),(240,5,21600,1,'+06'),(240,6,18000,1,'+05'),(240,7,14400,0,'+04'),(240,8,18000,0,'+05'),(241,0,14012,0,'LMT'),(241,1,14400,0,'+04'),(241,2,21600,1,'+06'),(241,3,18000,0,'+05'),(241,4,18000,0,'+05'),(241,5,21600,1,'+06'),(241,6,18000,1,'+05'),(241,7,14400,0,'+04'),(241,8,18000,0,'+05'),(242,0,12464,0,'LMT'),(242,1,10800,0,'+03'),(242,2,18000,0,'+05'),(242,3,21600,0,'+06'),(242,4,21600,1,'+06'),(242,5,18000,0,'+05'),(242,6,21600,1,'+06'),(242,7,18000,1,'+05'),(242,8,14400,0,'+04'),(242,9,18000,0,'+05'),(243,0,10660,0,'LMT'),(243,1,10656,0,'BMT'),(243,2,10800,0,'+03'),(243,3,14400,1,'+04'),(243,4,10800,0,'+03'),(243,5,14400,1,'+04'),(244,0,12368,0,'LMT'),(244,1,14400,0,'+04'),(244,2,10800,0,'+03'),(245,0,11964,0,'LMT'),(245,1,10800,0,'+03'),(245,2,18000,1,'+05'),(245,3,14400,0,'+04'),(245,4,14400,0,'+04'),(245,5,18000,1,'+05'),(245,6,14400,1,'+04'),(245,7,10800,0,'+03'),(245,8,18000,1,'+05'),(245,9,14400,0,'+04'),(246,0,24124,0,'LMT'),(246,1,24124,0,'BMT'),(246,2,25200,0,'+07'),(247,0,20100,0,'LMT'),(247,1,21600,0,'+06'),(247,2,28800,1,'+08'),(247,3,25200,0,'+07'),(247,4,25200,0,'+07'),(247,5,28800,1,'+08'),(247,6,25200,1,'+07'),(247,7,21600,0,'+06'),(247,8,25200,1,'+07'),(247,9,25200,0,'+07'),(248,0,8520,0,'LMT'),(248,1,10800,1,'EEST'),(248,2,7200,0,'EET'),(249,0,17904,0,'LMT'),(249,1,18000,0,'+05'),(249,2,25200,1,'+07'),(249,3,21600,0,'+06'),(249,4,21600,0,'+06'),(249,5,25200,1,'+07'),(249,6,21600,1,'+06'),(249,7,18000,0,'+05'),(249,8,21600,1,'+06'),(249,9,21600,0,'+06'),(250,0,27580,0,'LMT'),(250,1,27000,0,'+0730'),(250,2,28800,0,'+08'),(251,0,21200,0,'HMT'),(251,1,19270,0,'MMT'),(251,2,19800,0,'IST'),(251,3,23400,1,'+0630'),(252,0,27232,0,'LMT'),(252,1,28800,0,'+08'),(252,2,36000,1,'+10'),(252,3,32400,0,'+09'),(252,4,32400,0,'+09'),(252,5,36000,1,'+10'),(252,6,32400,1,'+09'),(252,7,28800,0,'+08'),(252,8,36000,0,'+10'),(252,9,36000,1,'+10'),(252,10,32400,0,'+09'),(253,0,27480,0,'LMT'),(253,1,25200,0,'+07'),(253,2,28800,0,'+08'),(253,3,32400,0,'+09'),(253,4,36000,1,'+10'),(253,5,32400,1,'+09'),(253,6,28800,0,'+08'),(254,0,29143,0,'LMT'),(254,1,32400,1,'CDT'),(254,2,28800,0,'CST'),(255,0,29143,0,'LMT'),(255,1,32400,1,'CDT'),(255,2,28800,0,'CST'),(256,0,19164,0,'LMT'),(256,1,19172,0,'MMT'),(256,2,19800,0,'+0530'),(256,3,21600,1,'+06'),(256,4,23400,1,'+0630'),(256,5,23400,0,'+0630'),(256,6,21600,0,'+06'),(256,7,19800,0,'+0530'),(257,0,21700,0,'LMT'),(257,1,21200,0,'HMT'),(257,2,23400,0,'+0630'),(257,3,19800,0,'+0530'),(257,4,21600,0,'+06'),(257,5,25200,1,'+07'),(258,0,8712,0,'LMT'),(258,1,10800,1,'EEST'),(258,2,7200,0,'EET'),(259,0,21700,0,'LMT'),(259,1,21200,0,'HMT'),(259,2,23400,0,'+0630'),(259,3,19800,0,'+0530'),(259,4,21600,0,'+06'),(259,5,25200,1,'+07'),(260,0,30140,0,'LMT'),(260,1,28800,0,'+08'),(260,2,32400,0,'+09'),(261,0,13272,0,'LMT'),(261,1,14400,0,'+04'),(262,0,16512,0,'LMT'),(262,1,18000,0,'+05'),(262,2,25200,1,'+07'),(262,3,21600,0,'+06'),(262,4,21600,0,'+06'),(262,5,25200,1,'+07'),(262,6,21600,1,'+06'),(262,7,18000,0,'+05'),(263,0,8148,0,'LMT'),(263,1,10800,1,'EEST'),(263,2,7200,0,'EET'),(263,3,7200,0,'EET'),(263,4,10800,1,'EEST'),(263,5,10800,0,'+03'),(263,6,7200,0,'EET'),(264,0,8272,0,'LMT'),(264,1,10800,1,'EEST'),(264,2,7200,0,'EET'),(264,3,10800,1,'IDT'),(264,4,7200,0,'IST'),(264,5,7200,0,'EET'),(265,0,29143,0,'LMT'),(265,1,32400,1,'CDT'),(265,2,28800,0,'CST'),(266,0,8423,0,'LMT'),(266,1,10800,1,'EEST'),(266,2,7200,0,'EET'),(266,3,10800,1,'IDT'),(266,4,7200,0,'IST'),(266,5,7200,0,'EET'),(267,0,25600,0,'LMT'),(267,1,25590,0,'PLMT'),(267,2,25200,0,'+07'),(267,3,28800,0,'+08'),(267,4,32400,0,'+09'),(267,5,25200,0,'+07'),(268,0,27402,0,'LMT'),(268,1,28800,0,'HKT'),(268,2,32400,1,'HKST'),(268,3,30600,1,'HKWT'),(268,4,32400,0,'JST'),(268,5,28800,0,'HKT'),(268,6,32400,1,'HKST'),(269,0,21996,0,'LMT'),(269,1,21600,0,'+06'),(269,2,28800,1,'+08'),(269,3,25200,0,'+07'),(270,0,25025,0,'LMT'),(270,1,25025,0,'IMT'),(270,2,25200,0,'+07'),(270,3,32400,1,'+09'),(270,4,28800,0,'+08'),(270,5,28800,0,'+08'),(270,6,32400,1,'+09'),(270,7,28800,1,'+08'),(270,8,25200,0,'+07'),(270,9,32400,0,'+09'),(270,10,32400,1,'+09'),(270,11,28800,0,'+08'),(271,0,6952,0,'LMT'),(271,1,7016,0,'IMT'),(271,2,10800,1,'EEST'),(271,3,7200,0,'EET'),(271,4,10800,0,'+03'),(271,5,14400,1,'+04'),(271,6,10800,1,'EEST'),(271,7,7200,0,'EET'),(271,8,10800,1,'EEST'),(271,9,7200,0,'EET'),(271,10,10800,0,'+03'),(272,0,25632,0,'LMT'),(272,1,25632,0,'BMT'),(272,2,26400,0,'+0720'),(272,3,27000,0,'+0730'),(272,4,32400,0,'+09'),(272,5,28800,0,'+08'),(272,6,25200,0,'WIB'),(273,0,33768,0,'LMT'),(273,1,32400,0,'+09'),(273,2,34200,0,'+0930'),(273,3,32400,0,'WIT'),(274,0,8454,0,'LMT'),(274,1,8440,0,'JMT'),(274,2,10800,1,'IDT'),(274,3,7200,0,'IST'),(274,4,14400,1,'IDDT'),(274,5,10800,1,'IDT'),(275,0,16608,0,'LMT'),(275,1,14400,0,'+04'),(275,2,16200,0,'+0430'),(276,0,38076,0,'LMT'),(276,1,39600,0,'+11'),(276,2,46800,1,'+13'),(276,3,43200,0,'+12'),(276,4,43200,0,'+12'),(276,5,46800,1,'+13'),(276,6,43200,1,'+12'),(276,7,39600,0,'+11'),(276,8,43200,0,'+12'),(277,0,16092,0,'LMT'),(277,1,19800,0,'+0530'),(277,2,23400,1,'+0630'),(277,3,18000,0,'+05'),(277,4,21600,1,'PKST'),(277,5,18000,0,'PKT'),(278,0,21020,0,'LMT'),(278,1,21600,0,'+06'),(279,0,20476,0,'LMT'),(279,1,19800,0,'+0530'),(279,2,20700,0,'+0545'),(280,0,20476,0,'LMT'),(280,1,19800,0,'+0530'),(280,2,20700,0,'+0545'),(281,0,32533,0,'LMT'),(281,1,28800,0,'+08'),(281,2,36000,1,'+10'),(281,3,32400,0,'+09'),(281,4,32400,0,'+09'),(281,5,36000,1,'+10'),(281,6,32400,1,'+09'),(281,7,28800,0,'+08'),(281,8,39600,1,'+11'),(281,9,36000,0,'+10'),(281,10,36000,0,'+10'),(281,11,39600,0,'+11'),(281,12,32400,0,'+09'),(282,0,21200,0,'HMT'),(282,1,19270,0,'MMT'),(282,2,19800,0,'IST'),(282,3,23400,1,'+0630'),(283,0,22286,0,'LMT'),(283,1,21600,0,'+06'),(283,2,28800,1,'+08'),(283,3,25200,0,'+07'),(283,4,25200,0,'+07'),(283,5,28800,1,'+08'),(283,6,25200,1,'+07'),(283,7,21600,0,'+06'),(283,8,28800,0,'+08'),(283,9,28800,1,'+08'),(283,10,25200,0,'+07'),(284,0,24406,0,'LMT'),(284,1,24925,0,'SMT'),(284,2,25200,0,'+07'),(284,3,26400,1,'+0720'),(284,4,26400,0,'+0720'),(284,5,27000,0,'+0730'),(284,6,32400,0,'+09'),(284,7,28800,0,'+08'),(285,0,26480,0,'LMT'),(285,1,27000,0,'+0730'),(285,2,30000,1,'+0820'),(285,3,28800,0,'+08'),(285,4,32400,0,'+09'),(285,5,28800,0,'+08'),(286,0,11212,0,'LMT'),(286,1,10800,0,'+03'),(287,0,27250,0,'LMT'),(287,1,28800,0,'CST'),(287,2,36000,1,'+10'),(287,3,32400,0,'+09'),(287,4,32400,1,'CDT'),(287,5,28800,0,'CST'),(287,6,32400,1,'CDT'),(288,0,27250,0,'LMT'),(288,1,28800,0,'CST'),(288,2,36000,1,'+10'),(288,3,32400,0,'+09'),(288,4,32400,1,'CDT'),(288,5,28800,0,'CST'),(288,6,32400,1,'CDT'),(289,0,36192,0,'LMT'),(289,1,36000,0,'+10'),(289,2,43200,1,'+12'),(289,3,39600,0,'+11'),(289,4,39600,0,'+11'),(289,5,43200,1,'+12'),(289,6,39600,1,'+11'),(289,7,36000,0,'+10'),(289,8,43200,0,'+12'),(289,9,43200,1,'+12'),(289,10,39600,0,'+11'),(290,0,28656,0,'LMT'),(290,1,28656,0,'MMT'),(290,2,28800,0,'+08'),(290,3,32400,0,'+09'),(290,4,28800,0,'WITA'),(291,0,29040,0,'LMT'),(291,1,32400,1,'PDT'),(291,2,28800,0,'PST'),(291,3,32400,0,'JST'),(291,4,28800,0,'PST'),(292,0,13272,0,'LMT'),(292,1,14400,0,'+04'),(293,0,8008,0,'LMT'),(293,1,10800,1,'EEST'),(293,2,7200,0,'EET'),(293,3,7200,0,'EET'),(293,4,10800,1,'EEST'),(294,0,20928,0,'LMT'),(294,1,21600,0,'+06'),(294,2,28800,1,'+08'),(294,3,25200,0,'+07'),(294,4,25200,0,'+07'),(294,5,28800,1,'+08'),(294,6,25200,1,'+07'),(294,7,21600,0,'+06'),(294,8,25200,0,'+07'),(295,0,19900,0,'LMT'),(295,1,21600,0,'+06'),(295,2,28800,1,'+08'),(295,3,25200,0,'+07'),(295,4,25200,0,'+07'),(295,5,28800,1,'+08'),(295,6,25200,1,'+07'),(295,7,21600,0,'+06'),(295,8,25200,1,'+07'),(295,9,25200,0,'+07'),(296,0,17610,0,'LMT'),(296,1,18000,0,'+05'),(296,2,25200,1,'+07'),(296,3,21600,0,'+06'),(296,4,21600,0,'+06'),(296,5,25200,1,'+07'),(296,6,21600,1,'+06'),(296,7,18000,0,'+05'),(296,8,25200,0,'+07'),(296,9,25200,1,'+07'),(296,10,21600,0,'+06'),(297,0,12324,0,'LMT'),(297,1,10800,0,'+03'),(297,2,18000,0,'+05'),(297,3,21600,1,'+06'),(297,4,21600,0,'+06'),(297,5,18000,0,'+05'),(297,6,21600,1,'+06'),(297,7,18000,1,'+05'),(297,8,14400,0,'+04'),(297,9,18000,0,'+05'),(298,0,24124,0,'LMT'),(298,1,24124,0,'BMT'),(298,2,25200,0,'+07'),(299,0,26240,0,'LMT'),(299,1,26240,0,'PMT'),(299,2,27000,0,'+0730'),(299,3,32400,0,'+09'),(299,4,28800,0,'+08'),(299,5,28800,0,'WITA'),(299,6,25200,0,'WIB'),(300,0,30180,0,'LMT'),(300,1,30600,0,'KST'),(300,2,32400,0,'JST'),(300,3,32400,0,'KST'),(301,0,12368,0,'LMT'),(301,1,14400,0,'+04'),(301,2,10800,0,'+03'),(302,0,15268,0,'LMT'),(302,1,14400,0,'+04'),(302,2,18000,0,'+05'),(302,3,21600,1,'+06'),(302,4,21600,0,'+06'),(302,5,18000,0,'+05'),(302,6,21600,1,'+06'),(302,7,18000,1,'+05'),(302,8,14400,0,'+04'),(302,9,21600,0,'+06'),(302,10,21600,1,'+06'),(303,0,15712,0,'LMT'),(303,1,14400,0,'+04'),(303,2,18000,0,'+05'),(303,3,21600,1,'+06'),(303,4,21600,0,'+06'),(303,5,18000,0,'+05'),(303,6,21600,1,'+06'),(303,7,18000,1,'+05'),(303,8,14400,0,'+04'),(303,9,21600,0,'+06'),(303,10,21600,1,'+06'),(303,11,18000,0,'+05'),(304,0,23087,0,'LMT'),(304,1,23087,0,'RMT'),(304,2,23400,0,'+0630'),(304,3,32400,0,'+09'),(304,4,23400,0,'+0630'),(305,0,11212,0,'LMT'),(305,1,10800,0,'+03'),(306,0,25600,0,'LMT'),(306,1,25590,0,'PLMT'),(306,2,25200,0,'+07'),(306,3,28800,0,'+08'),(306,4,32400,0,'+09'),(306,5,25200,0,'+07'),(307,0,34248,0,'LMT'),(307,1,32400,0,'+09'),(307,2,43200,1,'+12'),(307,3,39600,0,'+11'),(307,4,39600,0,'+11'),(307,5,43200,1,'+12'),(307,6,39600,1,'+11'),(307,7,36000,0,'+10'),(307,8,39600,0,'+11'),(308,0,16073,0,'LMT'),(308,1,14400,0,'+04'),(308,2,18000,0,'+05'),(308,3,21600,1,'+06'),(308,4,21600,0,'+06'),(308,5,18000,0,'+05'),(308,6,21600,1,'+06'),(309,0,30472,0,'LMT'),(309,1,30600,0,'KST'),(309,2,32400,0,'JST'),(309,3,36000,1,'KDT'),(309,4,32400,0,'KST'),(309,5,34200,1,'KDT'),(309,6,36000,1,'KDT'),(310,0,29143,0,'LMT'),(310,1,32400,1,'CDT'),(310,2,28800,0,'CST'),(311,0,24925,0,'LMT'),(311,1,24925,0,'SMT'),(311,2,25200,0,'+07'),(311,3,26400,1,'+0720'),(311,4,26400,0,'+0720'),(311,5,27000,0,'+0730'),(311,6,32400,0,'+09'),(311,7,28800,0,'+08'),(312,0,36892,0,'LMT'),(312,1,36000,0,'+10'),(312,2,43200,1,'+12'),(312,3,39600,0,'+11'),(312,4,39600,0,'+11'),(312,5,43200,1,'+12'),(312,6,39600,1,'+11'),(312,7,36000,0,'+10'),(312,8,43200,0,'+12'),(312,9,43200,1,'+12'),(312,10,39600,0,'+11'),(313,0,29160,0,'LMT'),(313,1,28800,0,'CST'),(313,2,32400,0,'JST'),(313,3,32400,1,'CDT'),(313,4,28800,0,'CST'),(314,0,16631,0,'LMT'),(314,1,18000,0,'+05'),(314,2,25200,1,'+07'),(314,3,21600,0,'+06'),(314,4,21600,0,'+06'),(314,5,25200,1,'+07'),(314,6,21600,1,'+06'),(314,7,18000,0,'+05'),(315,0,10751,0,'LMT'),(315,1,10751,0,'TBMT'),(315,2,10800,0,'+03'),(315,3,18000,1,'+05'),(315,4,14400,0,'+04'),(315,5,14400,0,'+04'),(315,6,18000,1,'+05'),(315,7,14400,1,'+04'),(315,8,10800,0,'+03'),(315,9,14400,1,'+04'),(315,10,14400,0,'+04'),(316,0,12344,0,'LMT'),(316,1,12344,0,'TMT'),(316,2,12600,0,'+0330'),(316,3,18000,1,'+05'),(316,4,14400,0,'+04'),(316,5,16200,1,'+0430'),(316,6,12600,0,'+0330'),(317,0,8454,0,'LMT'),(317,1,8440,0,'JMT'),(317,2,10800,1,'IDT'),(317,3,7200,0,'IST'),(317,4,14400,1,'IDDT'),(317,5,10800,1,'IDT'),(318,0,21516,0,'LMT'),(318,1,19800,0,'+0530'),(318,2,21600,0,'+06'),(319,0,21516,0,'LMT'),(319,1,19800,0,'+0530'),(319,2,21600,0,'+06'),(320,0,33539,0,'LMT'),(320,1,36000,1,'JDT'),(320,2,32400,0,'JST'),(320,3,32400,0,'JST'),(321,0,20391,0,'LMT'),(321,1,21600,0,'+06'),(321,2,28800,1,'+08'),(321,3,25200,0,'+07'),(321,4,25200,0,'+07'),(321,5,28800,1,'+08'),(321,6,25200,1,'+07'),(321,7,21600,0,'+06'),(321,8,25200,1,'+07'),(321,9,25200,0,'+07'),(322,0,28656,0,'LMT'),(322,1,28656,0,'MMT'),(322,2,28800,0,'+08'),(322,3,32400,0,'+09'),(322,4,28800,0,'WITA'),(323,0,25652,0,'LMT'),(323,1,25200,0,'+07'),(323,2,32400,1,'+09'),(323,3,28800,0,'+08'),(324,0,25652,0,'LMT'),(324,1,25200,0,'+07'),(324,2,32400,1,'+09'),(324,3,28800,0,'+08'),(325,0,21020,0,'LMT'),(325,1,21600,0,'+06'),(326,0,34374,0,'LMT'),(326,1,28800,0,'+08'),(326,2,32400,0,'+09'),(326,3,39600,0,'+11'),(326,4,43200,1,'+12'),(326,5,39600,0,'+11'),(326,6,43200,1,'+12'),(326,7,39600,1,'+11'),(326,8,36000,0,'+10'),(326,9,43200,0,'+12'),(326,10,43200,1,'+12'),(326,11,36000,0,'+10'),(327,0,24124,0,'LMT'),(327,1,24124,0,'BMT'),(327,2,25200,0,'+07'),(328,0,31651,0,'LMT'),(328,1,32400,0,'+09'),(328,2,39600,1,'+11'),(328,3,36000,0,'+10'),(328,4,36000,0,'+10'),(328,5,39600,1,'+11'),(328,6,36000,1,'+10'),(328,7,32400,0,'+09'),(328,8,39600,0,'+11'),(328,9,39600,1,'+11'),(328,10,36000,0,'+10'),(329,0,31138,0,'LMT'),(329,1,28800,0,'+08'),(329,2,36000,1,'+10'),(329,3,32400,0,'+09'),(329,4,32400,0,'+09'),(329,5,36000,1,'+10'),(329,6,32400,1,'+09'),(329,7,28800,0,'+08'),(329,8,36000,0,'+10'),(329,9,36000,1,'+10'),(329,10,32400,0,'+09'),(330,0,23087,0,'LMT'),(330,1,23087,0,'RMT'),(330,2,23400,0,'+0630'),(330,3,32400,0,'+09'),(330,4,23400,0,'+0630'),(331,0,14553,0,'LMT'),(331,1,13505,0,'PMT'),(331,2,14400,0,'+04'),(331,3,21600,1,'+06'),(331,4,18000,0,'+05'),(331,5,18000,0,'+05'),(331,6,21600,1,'+06'),(331,7,18000,1,'+05'),(331,8,14400,0,'+04'),(331,9,21600,0,'+06'),(331,10,21600,1,'+06'),(331,11,18000,0,'+05'),(332,0,10680,0,'LMT'),(332,1,10800,0,'+03'),(332,2,18000,1,'+05'),(332,3,14400,0,'+04'),(332,4,14400,0,'+04'),(332,5,18000,1,'+05'),(332,6,14400,1,'+04'),(332,7,10800,0,'+03'),(332,8,18000,1,'+05'),(332,9,14400,0,'+04'),(333,0,-6160,0,'LMT'),(333,1,-6872,0,'HMT'),(333,2,-3600,1,'-01'),(333,3,-7200,0,'-02'),(333,4,-3600,1,'-01'),(333,5,-7200,0,'-02'),(333,6,-7200,0,'-02'),(333,7,0,1,'+00'),(333,8,-3600,0,'-01'),(333,9,-3600,0,'-01'),(333,10,0,0,'WET'),(333,11,0,1,'+00'),(333,12,-3600,0,'-01'),(334,0,-15558,0,'LMT'),(334,1,-14400,0,'AST'),(334,2,-10800,1,'ADT'),(335,0,-3696,0,'LMT'),(335,1,-3600,0,'-01'),(335,2,0,0,'WET'),(335,3,3600,1,'WEST'),(335,4,0,0,'WET'),(335,5,3600,1,'WEST'),(336,0,-5644,0,'LMT'),(336,1,-7200,0,'-02'),(336,2,-3600,1,'-01'),(336,3,-7200,0,'-02'),(336,4,-3600,0,'-01'),(337,0,-1624,0,'LMT'),(337,1,0,0,'WET'),(337,2,3600,1,'WEST'),(337,3,0,0,'WET'),(338,0,-1624,0,'LMT'),(338,1,0,0,'WET'),(338,2,3600,1,'WEST'),(338,3,0,0,'WET'),(339,0,2580,0,'LMT'),(339,1,7200,1,'CEST'),(339,2,3600,0,'CET'),(339,3,3600,0,'CET'),(339,4,7200,1,'CEST'),(339,5,7200,1,'CEST'),(339,6,3600,0,'CET'),(340,0,-4056,0,'LMT'),(340,1,-4056,0,'FMT'),(340,2,0,1,'+00'),(340,3,-3600,0,'-01'),(340,4,0,1,'+00'),(340,5,-3600,0,'-01'),(340,6,-3600,0,'-01'),(340,7,3600,1,'+01'),(340,8,3600,1,'WEST'),(340,9,0,0,'WET'),(340,10,0,0,'WET'),(340,11,0,0,'WET'),(340,12,3600,1,'WEST'),(341,0,-5280,0,'LMT'),(341,1,0,1,'+00'),(341,2,-3600,0,'-01'),(341,3,-3600,0,'-01'),(341,4,0,1,'+00'),(341,5,0,0,'GMT'),(342,0,-8768,0,'LMT'),(342,1,-7200,0,'-02'),(343,0,-968,0,'LMT'),(343,1,0,0,'GMT'),(344,0,-13884,0,'LMT'),(344,1,-13884,0,'SMT'),(344,2,-10800,1,'-03'),(344,3,-14400,0,'-04'),(344,4,-7200,1,'-02'),(344,5,-10800,0,'-03'),(344,6,-10800,1,'-03'),(345,0,36292,0,'LMT'),(345,1,39600,1,'AEDT'),(345,2,36000,0,'AEST'),(345,3,39600,1,'AEDT'),(345,4,36000,0,'AEST'),(346,0,32400,0,'ACST'),(346,1,37800,1,'ACDT'),(346,2,34200,0,'ACST'),(346,3,37800,1,'ACDT'),(346,4,34200,0,'ACST'),(347,0,36728,0,'LMT'),(347,1,39600,1,'AEDT'),(347,2,36000,0,'AEST'),(347,3,39600,1,'AEDT'),(347,4,36000,0,'AEST'),(348,0,32400,0,'ACST'),(348,1,37800,1,'ACDT'),(348,2,34200,0,'ACST'),(348,3,37800,1,'ACDT'),(348,4,34200,0,'ACST'),(349,0,36292,0,'LMT'),(349,1,39600,1,'AEDT'),(349,2,36000,0,'AEST'),(349,3,39600,1,'AEDT'),(349,4,36000,0,'AEST'),(350,0,34528,0,'LMT'),(350,1,36000,0,'AEST'),(350,2,39600,1,'AEDT'),(350,3,39600,1,'AEDT'),(350,4,36000,0,'AEST'),(351,0,32400,0,'ACST'),(351,1,37800,1,'ACDT'),(351,2,34200,0,'ACST'),(352,0,30928,0,'LMT'),(352,1,35100,1,'+0945'),(352,2,31500,0,'+0845'),(352,3,35100,1,'+0945'),(352,4,31500,0,'+0845'),(353,0,35356,0,'LMT'),(353,1,36000,0,'AEST'),(353,2,39600,1,'AEDT'),(353,3,39600,1,'AEDT'),(353,4,36000,0,'AEST'),(354,0,38180,0,'LMT'),(354,1,36000,0,'AEST'),(354,2,41400,1,'+1130'),(354,3,37800,0,'+1030'),(354,4,39600,1,'+11'),(355,0,35756,0,'LMT'),(355,1,39600,1,'AEDT'),(355,2,36000,0,'AEST'),(355,3,39600,1,'AEDT'),(355,4,36000,0,'AEST'),(356,0,38180,0,'LMT'),(356,1,36000,0,'AEST'),(356,2,41400,1,'+1130'),(356,3,37800,0,'+1030'),(356,4,39600,1,'+11'),(357,0,34792,0,'LMT'),(357,1,39600,1,'AEDT'),(357,2,36000,0,'AEST'),(357,3,39600,1,'AEDT'),(357,4,36000,0,'AEST'),(358,0,36292,0,'LMT'),(358,1,39600,1,'AEDT'),(358,2,36000,0,'AEST'),(358,3,39600,1,'AEDT'),(358,4,36000,0,'AEST'),(359,0,32400,0,'ACST'),(359,1,37800,1,'ACDT'),(359,2,34200,0,'ACST'),(360,0,27804,0,'LMT'),(360,1,32400,1,'AWDT'),(360,2,28800,0,'AWST'),(360,3,32400,1,'AWDT'),(360,4,28800,0,'AWST'),(361,0,36728,0,'LMT'),(361,1,39600,1,'AEDT'),(361,2,36000,0,'AEST'),(361,3,39600,1,'AEDT'),(361,4,36000,0,'AEST'),(362,0,32400,0,'ACST'),(362,1,37800,1,'ACDT'),(362,2,34200,0,'ACST'),(362,3,37800,1,'ACDT'),(362,4,34200,0,'ACST'),(363,0,36292,0,'LMT'),(363,1,39600,1,'AEDT'),(363,2,36000,0,'AEST'),(363,3,39600,1,'AEDT'),(363,4,36000,0,'AEST'),(364,0,35356,0,'LMT'),(364,1,36000,0,'AEST'),(364,2,39600,1,'AEDT'),(364,3,39600,1,'AEDT'),(364,4,36000,0,'AEST'),(365,0,34792,0,'LMT'),(365,1,39600,1,'AEDT'),(365,2,36000,0,'AEST'),(365,3,39600,1,'AEDT'),(365,4,36000,0,'AEST'),(366,0,27804,0,'LMT'),(366,1,32400,1,'AWDT'),(366,2,28800,0,'AWST'),(366,3,32400,1,'AWDT'),(366,4,28800,0,'AWST'),(367,0,32400,0,'ACST'),(367,1,37800,1,'ACDT'),(367,2,34200,0,'ACST'),(367,3,37800,1,'ACDT'),(367,4,34200,0,'ACST'),(368,0,-16272,0,'LMT'),(368,1,-14400,1,'-04'),(368,2,-18000,0,'-05'),(368,3,-14400,0,'-04'),(368,4,-18000,0,'-05'),(369,0,-7780,0,'LMT'),(369,1,-3600,1,'-01'),(369,2,-7200,0,'-02'),(370,0,-11188,0,'LMT'),(370,1,-7200,1,'-02'),(370,2,-10800,0,'-03'),(371,0,-14404,0,'LMT'),(371,1,-10800,1,'-03'),(371,2,-14400,0,'-04'),(372,0,7200,1,'CEST'),(372,1,3600,0,'CET'),(372,2,7200,1,'CEST'),(372,3,3600,0,'CET'),(373,0,-18000,1,'CDT'),(373,1,-21600,0,'CST'),(373,2,-18000,1,'CWT'),(373,3,-18000,1,'CPT'),(374,0,-15264,0,'LMT'),(374,1,-10800,1,'ADT'),(374,2,-14400,0,'AST'),(374,3,-10800,1,'AWT'),(374,4,-10800,1,'APT'),(375,0,-23316,0,'LMT'),(375,1,-18000,1,'CDT'),(375,2,-21600,0,'CST'),(375,3,-18000,1,'CWT'),(375,4,-18000,1,'CPT'),(375,5,-18000,1,'CDT'),(375,6,-21600,0,'CST'),(376,0,-19052,0,'LMT'),(376,1,-14400,1,'EDT'),(376,2,-18000,0,'EST'),(376,3,-14400,1,'EWT'),(376,4,-14400,1,'EPT'),(377,0,-27232,0,'LMT'),(377,1,-21600,1,'MDT'),(377,2,-25200,0,'MST'),(377,3,-21600,1,'MWT'),(377,4,-21600,1,'MPT'),(378,0,-12652,0,'LMT'),(378,1,-9052,1,'NDT'),(378,2,-12652,0,'NST'),(378,3,-9000,1,'NDT'),(378,4,-12600,0,'NST'),(378,5,-9000,1,'NPT'),(378,6,-9000,1,'NWT'),(378,7,-5400,1,'NDDT'),(378,8,-9000,1,'NDT'),(379,0,-29548,0,'LMT'),(379,1,-25200,1,'PDT'),(379,2,-28800,0,'PST'),(379,3,-25200,1,'PWT'),(379,4,-25200,1,'PPT'),(380,0,-25116,0,'LMT'),(380,1,-21600,1,'MDT'),(380,2,-25200,0,'MST'),(380,3,-21600,1,'MWT'),(380,4,-21600,1,'MPT'),(380,5,-21600,0,'CST'),(381,0,-32412,0,'LMT'),(381,1,-28800,1,'YDT'),(381,2,-32400,0,'YST'),(381,3,-28800,1,'YWT'),(381,4,-28800,1,'YPT'),(381,5,-25200,1,'YDDT'),(381,6,-28800,0,'PST'),(381,7,-25200,1,'PDT'),(382,0,-16966,0,'LMT'),(382,1,-16966,0,'SMT'),(382,2,-18000,0,'-05'),(382,3,-14400,0,'-04'),(382,4,-14400,1,'-04'),(382,5,-10800,1,'-03'),(382,6,-10800,1,'-03'),(382,7,-14400,0,'-04'),(383,0,-26248,0,'LMT'),(383,1,-26248,0,'EMT'),(383,2,-21600,1,'-06'),(383,3,-25200,0,'-07'),(383,4,-25200,0,'-07'),(383,5,-21600,0,'-06'),(383,6,-18000,1,'-05'),(384,0,-19768,0,'LMT'),(384,1,-19776,0,'HMT'),(384,2,-14400,1,'CDT'),(384,3,-18000,0,'CST'),(384,4,-18000,0,'CST'),(384,5,-14400,1,'CDT'),(385,0,10800,1,'EEST'),(385,1,7200,0,'EET'),(386,0,-18000,0,'EST'),(387,0,-14400,1,'EDT'),(387,1,-18000,0,'EST'),(387,2,-14400,1,'EWT'),(387,3,-14400,1,'EPT'),(388,0,7509,0,'LMT'),(388,1,10800,1,'EEST'),(388,2,7200,0,'EET'),(388,3,10800,1,'EEST'),(389,0,-1500,0,'LMT'),(389,1,-1521,0,'DMT'),(389,2,2079,1,'IST'),(389,3,3600,1,'BST'),(389,4,0,0,'GMT'),(389,5,3600,1,'IST'),(389,6,0,0,'GMT'),(389,7,0,1,'GMT'),(389,8,3600,0,'IST'),(389,9,3600,0,'IST'),(390,0,0,0,'GMT'),(391,0,0,0,'GMT'),(392,0,-3600,0,'-01'),(393,0,-36000,0,'-10'),(394,0,-39600,0,'-11'),(395,0,-43200,0,'-12'),(396,0,-7200,0,'-02'),(397,0,-10800,0,'-03'),(398,0,-14400,0,'-04'),(399,0,-18000,0,'-05'),(400,0,-21600,0,'-06'),(401,0,-25200,0,'-07'),(402,0,-28800,0,'-08'),(403,0,-32400,0,'-09'),(404,0,0,0,'GMT'),(405,0,3600,0,'+01'),(406,0,36000,0,'+10'),(407,0,39600,0,'+11'),(408,0,43200,0,'+12'),(409,0,46800,0,'+13'),(410,0,50400,0,'+14'),(411,0,7200,0,'+02'),(412,0,10800,0,'+03'),(413,0,14400,0,'+04'),(414,0,18000,0,'+05'),(415,0,21600,0,'+06'),(416,0,25200,0,'+07'),(417,0,28800,0,'+08'),(418,0,32400,0,'+09'),(419,0,0,0,'GMT'),(420,0,0,0,'GMT'),(421,0,0,0,'UTC'),(422,0,0,0,'UTC'),(423,0,0,0,'UTC'),(424,0,0,0,'UTC'),(425,0,1172,0,'LMT'),(425,1,4772,1,'NST'),(425,2,1172,0,'AMT'),(425,3,4772,1,'NST'),(425,4,1172,0,'AMT'),(425,5,1200,0,'+0020'),(425,6,4800,1,'+0120'),(425,7,4800,1,'+0120'),(425,8,3600,0,'CET'),(425,9,7200,1,'CEST'),(425,10,7200,1,'CEST'),(425,11,7200,1,'CEST'),(425,12,3600,0,'CET'),(425,13,3600,0,'CET'),(426,0,364,0,'LMT'),(426,1,0,0,'WET'),(426,2,3600,0,'CET'),(426,3,7200,1,'CEST'),(426,4,3600,0,'CET'),(427,0,11532,0,'LMT'),(427,1,10800,0,'+03'),(427,2,18000,1,'+05'),(427,3,14400,0,'+04'),(427,4,14400,0,'+04'),(427,5,18000,1,'+05'),(427,6,14400,1,'+04'),(427,7,10800,0,'+03'),(427,8,14400,0,'+04'),(428,0,5692,0,'LMT'),(428,1,5692,0,'AMT'),(428,2,10800,1,'EEST'),(428,3,7200,0,'EET'),(428,4,3600,0,'CET'),(428,5,7200,1,'CEST'),(428,6,10800,1,'EEST'),(428,7,7200,0,'EET'),(428,8,10800,1,'EEST'),(428,9,7200,0,'EET'),(429,0,-75,0,'LMT'),(429,1,3600,1,'BST'),(429,2,0,0,'GMT'),(429,3,7200,1,'BDST'),(429,4,3600,0,'BST'),(429,5,3600,1,'BST'),(429,6,0,0,'GMT'),(429,7,0,0,'GMT'),(430,0,4920,0,'LMT'),(430,1,3600,0,'CET'),(430,2,3600,0,'CET'),(430,3,7200,1,'CEST'),(430,4,7200,1,'CEST'),(430,5,7200,1,'CEST'),(430,6,3600,0,'CET'),(431,0,3208,0,'LMT'),(431,1,7200,1,'CEST'),(431,2,3600,0,'CET'),(431,3,7200,1,'CEST'),(431,4,3600,0,'CET'),(431,5,10800,1,'CEMT'),(431,6,10800,1,'CEMT'),(431,7,7200,1,'CEST'),(431,8,3600,0,'CET'),(432,0,3464,0,'PMT'),(432,1,7200,1,'CEST'),(432,2,3600,0,'CET'),(432,3,7200,1,'CEST'),(432,4,3600,0,'CET'),(432,5,0,1,'GMT'),(432,6,7200,1,'CEST'),(432,7,3600,0,'CET'),(433,0,1050,0,'BMT'),(433,1,0,0,'WET'),(433,2,3600,0,'CET'),(433,3,7200,1,'CEST'),(433,4,3600,0,'CET'),(433,5,7200,1,'CEST'),(433,6,3600,1,'WEST'),(433,7,0,0,'WET'),(433,8,0,0,'WET'),(433,9,7200,1,'CEST'),(433,10,3600,0,'CET'),(434,0,6264,0,'LMT'),(434,1,6264,0,'BMT'),(434,2,10800,1,'EEST'),(434,3,7200,0,'EET'),(434,4,10800,1,'EEST'),(434,5,7200,0,'EET'),(434,6,10800,1,'EEST'),(434,7,7200,0,'EET'),(435,0,4580,0,'LMT'),(435,1,7200,1,'CEST'),(435,2,3600,0,'CET'),(435,3,7200,1,'CEST'),(435,4,3600,0,'CET'),(435,5,3600,0,'CET'),(435,6,7200,1,'CEST'),(436,0,1786,0,'BMT'),(436,1,7200,1,'CEST'),(436,2,3600,0,'CET'),(436,3,7200,1,'CEST'),(436,4,3600,0,'CET'),(437,0,6920,0,'LMT'),(437,1,6900,0,'CMT'),(437,2,6264,0,'BMT'),(437,3,10800,1,'EEST'),(437,4,7200,0,'EET'),(437,5,7200,0,'EET'),(437,6,10800,1,'EEST'),(437,7,3600,0,'CET'),(437,8,7200,1,'CEST'),(437,9,7200,1,'CEST'),(437,10,14400,1,'MSD'),(437,11,10800,0,'MSK'),(437,12,10800,0,'MSK'),(437,13,14400,1,'MSD'),(437,14,10800,1,'EEST'),(437,15,7200,0,'EET'),(438,0,3020,0,'CMT'),(438,1,7200,1,'CEST'),(438,2,3600,0,'CET'),(438,3,3600,0,'CET'),(438,4,7200,1,'CEST'),(438,5,7200,1,'CEST'),(438,6,3600,0,'CET'),(439,0,-1500,0,'LMT'),(439,1,-1521,0,'DMT'),(439,2,2079,1,'IST'),(439,3,3600,1,'BST'),(439,4,0,0,'GMT'),(439,5,3600,1,'IST'),(439,6,0,0,'GMT'),(439,7,0,1,'GMT'),(439,8,3600,0,'IST'),(439,9,3600,0,'IST'),(440,0,-1284,0,'LMT'),(440,1,3600,1,'BST'),(440,2,0,0,'GMT'),(440,3,7200,1,'BDST'),(440,4,3600,0,'CET'),(440,5,7200,1,'CEST'),(440,6,3600,0,'CET'),(441,0,-75,0,'LMT'),(441,1,3600,1,'BST'),(441,2,0,0,'GMT'),(441,3,7200,1,'BDST'),(441,4,3600,0,'BST'),(441,5,3600,1,'BST'),(441,6,0,0,'GMT'),(441,7,0,0,'GMT'),(442,0,5989,0,'LMT'),(442,1,5989,0,'HMT'),(442,2,10800,1,'EEST'),(442,3,7200,0,'EET'),(442,4,10800,1,'EEST'),(442,5,7200,0,'EET'),(443,0,-75,0,'LMT'),(443,1,3600,1,'BST'),(443,2,0,0,'GMT'),(443,3,7200,1,'BDST'),(443,4,3600,0,'BST'),(443,5,3600,1,'BST'),(443,6,0,0,'GMT'),(443,7,0,0,'GMT'),(444,0,6952,0,'LMT'),(444,1,7016,0,'IMT'),(444,2,10800,1,'EEST'),(444,3,7200,0,'EET'),(444,4,10800,0,'+03'),(444,5,14400,1,'+04'),(444,6,10800,1,'EEST'),(444,7,7200,0,'EET'),(444,8,10800,1,'EEST'),(444,9,7200,0,'EET'),(444,10,10800,0,'+03'),(445,0,-75,0,'LMT'),(445,1,3600,1,'BST'),(445,2,0,0,'GMT'),(445,3,7200,1,'BDST'),(445,4,3600,0,'BST'),(445,5,3600,1,'BST'),(445,6,0,0,'GMT'),(445,7,0,0,'GMT'),(446,0,4920,0,'LMT'),(446,1,7200,1,'CEST'),(446,2,3600,0,'CET'),(446,3,7200,1,'CEST'),(446,4,3600,0,'CET'),(446,5,10800,1,'EEST'),(446,6,7200,0,'EET'),(446,7,14400,1,'MSD'),(446,8,10800,0,'MSK'),(446,9,10800,0,'MSK'),(446,10,14400,1,'MSD'),(446,11,10800,1,'EEST'),(446,12,7200,0,'EET'),(446,13,10800,0,'+03'),(446,14,7200,0,'EET'),(447,0,7324,0,'LMT'),(447,1,7324,0,'KMT'),(447,2,7200,0,'EET'),(447,3,10800,0,'MSK'),(447,4,3600,0,'CET'),(447,5,7200,1,'CEST'),(447,6,7200,1,'CEST'),(447,7,14400,1,'MSD'),(447,8,10800,0,'MSK'),(447,9,14400,1,'MSD'),(447,10,10800,1,'EEST'),(447,11,10800,1,'EEST'),(447,12,7200,0,'EET'),(448,0,11928,0,'LMT'),(448,1,10800,0,'+03'),(448,2,18000,1,'+05'),(448,3,14400,0,'+04'),(448,4,14400,0,'+04'),(448,5,18000,1,'+05'),(448,6,14400,1,'+04'),(448,7,10800,0,'+03'),(449,0,-2205,0,'LMT'),(449,1,3600,1,'WEST'),(449,2,0,0,'WET'),(449,3,3600,1,'WEST'),(449,4,0,0,'WET'),(449,5,7200,1,'WEMT'),(449,6,0,0,'WET'),(449,7,3600,0,'CET'),(449,8,3600,0,'CET'),(449,9,7200,1,'CEST'),(449,10,3600,1,'WEST'),(449,11,0,0,'WET'),(450,0,4920,0,'LMT'),(450,1,3600,0,'CET'),(450,2,3600,0,'CET'),(450,3,7200,1,'CEST'),(450,4,7200,1,'CEST'),(450,5,7200,1,'CEST'),(450,6,3600,0,'CET'),(451,0,-75,0,'LMT'),(451,1,3600,1,'BST'),(451,2,0,0,'GMT'),(451,3,7200,1,'BDST'),(451,4,3600,0,'BST'),(451,5,3600,1,'BST'),(451,6,0,0,'GMT'),(451,7,0,0,'GMT'),(452,0,1476,0,'LMT'),(452,1,7200,1,'CEST'),(452,2,3600,0,'CET'),(452,3,7200,1,'CEST'),(452,4,3600,0,'CET'),(452,5,3600,1,'WEST'),(452,6,0,0,'WET'),(452,7,0,0,'WET'),(452,8,3600,1,'WEST'),(452,9,3600,0,'WET'),(452,10,7200,1,'WEST'),(452,11,7200,1,'WEST'),(452,12,7200,1,'CEST'),(452,13,3600,0,'CET'),(453,0,-884,0,'LMT'),(453,1,3600,1,'WEST'),(453,2,0,0,'WET'),(453,3,7200,1,'WEMT'),(453,4,0,0,'WET'),(453,5,7200,1,'CEST'),(453,6,3600,0,'CET'),(453,7,7200,1,'CEST'),(453,8,3600,0,'CET'),(453,9,7200,1,'CEST'),(453,10,3600,0,'CET'),(454,0,3484,0,'LMT'),(454,1,7200,1,'CEST'),(454,2,3600,0,'CET'),(454,3,3600,0,'CET'),(454,4,7200,1,'CEST'),(454,5,7200,1,'CEST'),(454,6,3600,0,'CET'),(455,0,5989,0,'LMT'),(455,1,5989,0,'HMT'),(455,2,10800,1,'EEST'),(455,3,7200,0,'EET'),(455,4,10800,1,'EEST'),(455,5,7200,0,'EET'),(456,0,6616,0,'LMT'),(456,1,6600,0,'MMT'),(456,2,7200,0,'EET'),(456,3,10800,0,'MSK'),(456,4,3600,0,'CET'),(456,5,7200,1,'CEST'),(456,6,7200,1,'CEST'),(456,7,14400,1,'MSD'),(456,8,10800,0,'MSK'),(456,9,14400,1,'MSD'),(456,10,10800,1,'EEST'),(456,11,7200,0,'EET'),(456,12,10800,0,'+03'),(457,0,1772,0,'LMT'),(457,1,561,0,'PMT'),(457,2,3600,1,'WEST'),(457,3,0,0,'WET'),(457,4,3600,1,'WEST'),(457,5,7200,1,'WEMT'),(457,6,0,0,'WET'),(457,7,7200,1,'CEST'),(457,8,3600,0,'CET'),(457,9,7200,1,'CEST'),(457,10,3600,0,'CET'),(458,0,9017,0,'LMT'),(458,1,9017,0,'MMT'),(458,2,12679,1,'MST'),(458,3,9079,0,'MMT'),(458,4,16279,1,'MDST'),(458,5,14400,1,'MSD'),(458,6,10800,0,'MSK'),(458,7,14400,1,'MSD'),(458,8,18000,1,'+05'),(458,9,7200,0,'EET'),(458,10,10800,0,'MSK'),(458,11,14400,1,'MSD'),(458,12,10800,1,'EEST'),(458,13,7200,0,'EET'),(458,14,14400,0,'MSK'),(458,15,14400,1,'MSD'),(458,16,10800,0,'MSK'),(459,0,8008,0,'LMT'),(459,1,10800,1,'EEST'),(459,2,7200,0,'EET'),(459,3,7200,0,'EET'),(459,4,10800,1,'EEST'),(460,0,2580,0,'LMT'),(460,1,7200,1,'CEST'),(460,2,3600,0,'CET'),(460,3,3600,0,'CET'),(460,4,7200,1,'CEST'),(460,5,7200,1,'CEST'),(460,6,3600,0,'CET'),(461,0,561,0,'LMT'),(461,1,561,0,'PMT'),(461,2,3600,1,'WEST'),(461,3,0,0,'WET'),(461,4,3600,1,'WEST'),(461,5,0,0,'WET'),(461,6,3600,0,'CET'),(461,7,7200,1,'CEST'),(461,8,7200,1,'CEST'),(461,9,7200,1,'WEMT'),(461,10,3600,0,'CET'),(461,11,7200,1,'CEST'),(461,12,3600,0,'CET'),(462,0,4920,0,'LMT'),(462,1,3600,0,'CET'),(462,2,3600,0,'CET'),(462,3,7200,1,'CEST'),(462,4,7200,1,'CEST'),(462,5,7200,1,'CEST'),(462,6,3600,0,'CET'),(463,0,3464,0,'PMT'),(463,1,7200,1,'CEST'),(463,2,3600,0,'CET'),(463,3,7200,1,'CEST'),(463,4,3600,0,'CET'),(463,5,0,1,'GMT'),(463,6,7200,1,'CEST'),(463,7,3600,0,'CET'),(464,0,5794,0,'LMT'),(464,1,5794,0,'RMT'),(464,2,9394,1,'LST'),(464,3,7200,0,'EET'),(464,4,10800,0,'MSK'),(464,5,3600,0,'CET'),(464,6,7200,1,'CEST'),(464,7,7200,1,'CEST'),(464,8,14400,1,'MSD'),(464,9,10800,0,'MSK'),(464,10,14400,1,'MSD'),(464,11,10800,1,'EEST'),(464,12,7200,0,'EET'),(464,13,10800,1,'EEST'),(464,14,7200,0,'EET'),(465,0,2996,0,'RMT'),(465,1,7200,1,'CEST'),(465,2,3600,0,'CET'),(465,3,3600,0,'CET'),(465,4,7200,1,'CEST'),(465,5,7200,1,'CEST'),(465,6,3600,0,'CET'),(466,0,12020,0,'LMT'),(466,1,10800,0,'+03'),(466,2,14400,0,'+04'),(466,3,18000,1,'+05'),(466,4,14400,0,'+04'),(466,5,18000,1,'+05'),(466,6,14400,1,'+04'),(466,7,10800,0,'+03'),(466,8,10800,1,'+03'),(466,9,7200,0,'+02'),(466,10,14400,1,'+04'),(466,11,14400,0,'+04'),(467,0,2996,0,'RMT'),(467,1,7200,1,'CEST'),(467,2,3600,0,'CET'),(467,3,3600,0,'CET'),(467,4,7200,1,'CEST'),(467,5,7200,1,'CEST'),(467,6,3600,0,'CET'),(468,0,4920,0,'LMT'),(468,1,3600,0,'CET'),(468,2,3600,0,'CET'),(468,3,7200,1,'CEST'),(468,4,7200,1,'CEST'),(468,5,7200,1,'CEST'),(468,6,3600,0,'CET'),(469,0,11058,0,'LMT'),(469,1,10800,0,'+03'),(469,2,18000,1,'+05'),(469,3,14400,0,'+04'),(469,4,14400,0,'+04'),(469,5,18000,1,'+05'),(469,6,14400,1,'+04'),(469,7,10800,0,'+03'),(469,8,14400,0,'+04'),(470,0,8184,0,'LMT'),(470,1,8160,0,'SMT'),(470,2,7200,0,'EET'),(470,3,10800,0,'MSK'),(470,4,3600,0,'CET'),(470,5,7200,1,'CEST'),(470,6,7200,1,'CEST'),(470,7,14400,1,'MSD'),(470,8,10800,0,'MSK'),(470,9,14400,1,'MSD'),(470,10,10800,1,'EEST'),(470,11,10800,1,'EEST'),(470,12,7200,0,'EET'),(470,13,14400,0,'MSK'),(470,14,10800,0,'MSK'),(471,0,4920,0,'LMT'),(471,1,3600,0,'CET'),(471,2,3600,0,'CET'),(471,3,7200,1,'CEST'),(471,4,7200,1,'CEST'),(471,5,7200,1,'CEST'),(471,6,3600,0,'CET'),(472,0,7016,0,'IMT'),(472,1,7200,0,'EET'),(472,2,3600,0,'CET'),(472,3,7200,1,'CEST'),(472,4,3600,0,'CET'),(472,5,10800,1,'EEST'),(472,6,7200,0,'EET'),(472,7,10800,1,'EEST'),(472,8,10800,1,'EEST'),(472,9,7200,0,'EET'),(473,0,3614,0,'SET'),(473,1,3600,0,'CET'),(473,2,7200,1,'CEST'),(473,3,7200,1,'CEST'),(473,4,3600,0,'CET'),(474,0,5940,0,'LMT'),(474,1,5940,0,'TMT'),(474,2,7200,1,'CEST'),(474,3,3600,0,'CET'),(474,4,3600,0,'CET'),(474,5,7200,0,'EET'),(474,6,10800,0,'MSK'),(474,7,7200,1,'CEST'),(474,8,14400,1,'MSD'),(474,9,10800,0,'MSK'),(474,10,14400,1,'MSD'),(474,11,10800,1,'EEST'),(474,12,7200,0,'EET'),(474,13,7200,0,'EET'),(474,14,10800,1,'EEST'),(474,15,10800,1,'EEST'),(475,0,4760,0,'LMT'),(475,1,3600,0,'CET'),(475,2,7200,1,'CEST'),(475,3,3600,0,'CET'),(475,4,7200,1,'CEST'),(476,0,6920,0,'LMT'),(476,1,6900,0,'CMT'),(476,2,6264,0,'BMT'),(476,3,10800,1,'EEST'),(476,4,7200,0,'EET'),(476,5,7200,0,'EET'),(476,6,10800,1,'EEST'),(476,7,3600,0,'CET'),(476,8,7200,1,'CEST'),(476,9,7200,1,'CEST'),(476,10,14400,1,'MSD'),(476,11,10800,0,'MSK'),(476,12,10800,0,'MSK'),(476,13,14400,1,'MSD'),(476,14,10800,1,'EEST'),(476,15,7200,0,'EET'),(477,0,11616,0,'LMT'),(477,1,10800,0,'+03'),(477,2,18000,1,'+05'),(477,3,14400,0,'+04'),(477,4,14400,0,'+04'),(477,5,18000,1,'+05'),(477,6,14400,1,'+04'),(477,7,10800,0,'+03'),(477,8,10800,1,'+03'),(477,9,7200,0,'+02'),(477,10,14400,1,'+04'),(477,11,14400,0,'+04'),(478,0,5352,0,'LMT'),(478,1,3600,0,'CET'),(478,2,7200,1,'CEST'),(478,3,3600,0,'CET'),(478,4,7200,1,'CEST'),(478,5,14400,1,'MSD'),(478,6,10800,0,'MSK'),(478,7,10800,0,'MSK'),(478,8,14400,1,'MSD'),(478,9,7200,0,'EET'),(478,10,10800,1,'EEST'),(478,11,10800,1,'EEST'),(478,12,7200,0,'EET'),(479,0,1786,0,'BMT'),(479,1,7200,1,'CEST'),(479,2,3600,0,'CET'),(479,3,7200,1,'CEST'),(479,4,3600,0,'CET'),(480,0,2996,0,'RMT'),(480,1,7200,1,'CEST'),(480,2,3600,0,'CET'),(480,3,3600,0,'CET'),(480,4,7200,1,'CEST'),(480,5,7200,1,'CEST'),(480,6,3600,0,'CET'),(481,0,3921,0,'LMT'),(481,1,7200,1,'CEST'),(481,2,3600,0,'CET'),(481,3,7200,1,'CEST'),(481,4,3600,0,'CET'),(481,5,7200,1,'CEST'),(481,6,3600,0,'CET'),(482,0,6076,0,'LMT'),(482,1,5040,0,'WMT'),(482,2,5736,0,'KMT'),(482,3,3600,0,'CET'),(482,4,7200,0,'EET'),(482,5,10800,0,'MSK'),(482,6,3600,0,'CET'),(482,7,7200,1,'CEST'),(482,8,7200,1,'CEST'),(482,9,14400,1,'MSD'),(482,10,10800,0,'MSK'),(482,11,14400,1,'MSD'),(482,12,10800,1,'EEST'),(482,13,7200,0,'EET'),(482,14,7200,1,'CEST'),(482,15,3600,0,'CET'),(482,16,7200,0,'EET'),(482,17,10800,1,'EEST'),(483,0,10660,0,'LMT'),(483,1,10800,0,'+03'),(483,2,14400,0,'+04'),(483,3,18000,1,'+05'),(483,4,14400,0,'+04'),(483,5,18000,1,'+05'),(483,6,14400,1,'+04'),(483,7,10800,0,'+03'),(483,8,14400,0,'+04'),(484,0,5040,0,'LMT'),(484,1,5040,0,'WMT'),(484,2,7200,1,'CEST'),(484,3,3600,0,'CET'),(484,4,7200,1,'CEST'),(484,5,3600,0,'CET'),(484,6,10800,1,'EEST'),(484,7,7200,0,'EET'),(484,8,7200,0,'EET'),(484,9,7200,1,'CEST'),(484,10,3600,0,'CET'),(485,0,4920,0,'LMT'),(485,1,3600,0,'CET'),(485,2,3600,0,'CET'),(485,3,7200,1,'CEST'),(485,4,7200,1,'CEST'),(485,5,7200,1,'CEST'),(485,6,3600,0,'CET'),(486,0,8440,0,'LMT'),(486,1,8400,0,'+0220'),(486,2,7200,0,'EET'),(486,3,10800,0,'MSK'),(486,4,3600,0,'CET'),(486,5,7200,1,'CEST'),(486,6,7200,1,'CEST'),(486,7,14400,1,'MSD'),(486,8,10800,0,'MSK'),(486,9,14400,1,'MSD'),(486,10,10800,1,'EEST'),(486,11,10800,1,'EEST'),(486,12,7200,0,'EET'),(487,0,1786,0,'BMT'),(487,1,7200,1,'CEST'),(487,2,3600,0,'CET'),(487,3,7200,1,'CEST'),(487,4,3600,0,'CET'),(488,0,0,0,'-00'),(489,0,-75,0,'LMT'),(489,1,3600,1,'BST'),(489,2,0,0,'GMT'),(489,3,7200,1,'BDST'),(489,4,3600,0,'BST'),(489,5,3600,1,'BST'),(489,6,0,0,'GMT'),(489,7,0,0,'GMT'),(490,0,-75,0,'LMT'),(490,1,3600,1,'BST'),(490,2,0,0,'GMT'),(490,3,7200,1,'BDST'),(490,4,3600,0,'BST'),(490,5,3600,1,'BST'),(490,6,0,0,'GMT'),(490,7,0,0,'GMT'),(491,0,0,0,'GMT'),(492,0,0,0,'GMT'),(493,0,0,0,'GMT'),(494,0,0,0,'GMT'),(495,0,0,0,'GMT'),(496,0,-36000,0,'HST'),(497,0,27402,0,'LMT'),(497,1,28800,0,'HKT'),(497,2,32400,1,'HKST'),(497,3,30600,1,'HKWT'),(497,4,32400,0,'JST'),(497,5,28800,0,'HKT'),(497,6,32400,1,'HKST'),(498,0,-5280,0,'LMT'),(498,1,0,1,'+00'),(498,2,-3600,0,'-01'),(498,3,-3600,0,'-01'),(498,4,0,1,'+00'),(498,5,0,0,'GMT'),(499,0,8836,0,'LMT'),(499,1,10800,0,'EAT'),(499,2,9000,0,'+0230'),(499,3,9900,0,'+0245'),(499,4,10800,0,'EAT'),(500,0,17380,0,'LMT'),(500,1,18000,0,'+05'),(500,2,21600,0,'+06'),(501,0,25372,0,'LMT'),(501,1,25200,0,'+07'),(502,0,23260,0,'LMT'),(502,1,23400,0,'+0630'),(503,0,8836,0,'LMT'),(503,1,10800,0,'EAT'),(503,2,9000,0,'+0230'),(503,3,9900,0,'+0245'),(503,4,10800,0,'EAT'),(504,0,0,0,'-00'),(504,1,18000,0,'+05'),(505,0,13308,0,'LMT'),(505,1,14400,0,'+04'),(506,0,17640,0,'LMT'),(506,1,17640,0,'MMT'),(506,2,18000,0,'+05'),(507,0,13800,0,'LMT'),(507,1,18000,1,'+05'),(507,2,14400,0,'+04'),(508,0,8836,0,'LMT'),(508,1,10800,0,'EAT'),(508,2,9000,0,'+0230'),(508,3,9900,0,'+0245'),(508,4,10800,0,'EAT'),(509,0,13312,0,'LMT'),(509,1,14400,0,'+04'),(510,0,12344,0,'LMT'),(510,1,12344,0,'TMT'),(510,2,12600,0,'+0330'),(510,3,18000,1,'+05'),(510,4,14400,0,'+04'),(510,5,16200,1,'+0430'),(510,6,12600,0,'+0330'),(511,0,8454,0,'LMT'),(511,1,8440,0,'JMT'),(511,2,10800,1,'IDT'),(511,3,7200,0,'IST'),(511,4,14400,1,'IDDT'),(511,5,10800,1,'IDT'),(512,0,-18430,0,'LMT'),(512,1,-18430,0,'KMT'),(512,2,-18000,0,'EST'),(512,3,-14400,1,'EDT'),(513,0,33539,0,'LMT'),(513,1,36000,1,'JDT'),(513,2,32400,0,'JST'),(513,3,32400,0,'JST'),(514,0,40160,0,'LMT'),(514,1,39600,0,'+11'),(514,2,36000,0,'+10'),(514,3,32400,0,'+09'),(514,4,-43200,0,'-12'),(514,5,43200,0,'+12'),(515,0,3164,0,'LMT'),(515,1,7200,1,'CEST'),(515,2,3600,0,'CET'),(515,3,7200,0,'EET'),(516,0,7200,1,'MEST'),(516,1,3600,0,'MET'),(516,2,7200,1,'MEST'),(516,3,3600,0,'MET'),(517,0,-25200,0,'MST'),(518,0,-21600,1,'MDT'),(518,1,-25200,0,'MST'),(518,2,-21600,1,'MWT'),(518,3,-21600,1,'MPT'),(519,0,-28084,0,'LMT'),(519,1,-25200,0,'MST'),(519,2,-28800,0,'PST'),(519,3,-25200,1,'PDT'),(519,4,-25200,1,'PWT'),(519,5,-25200,1,'PPT'),(520,0,-25540,0,'LMT'),(520,1,-25200,0,'MST'),(520,2,-21600,0,'CST'),(520,3,-28800,0,'PST'),(520,4,-21600,1,'MDT'),(520,5,-25200,0,'MST'),(521,0,-23796,0,'LMT'),(521,1,-25200,0,'MST'),(521,2,-21600,0,'CST'),(521,3,-18000,1,'CDT'),(521,4,-18000,1,'CWT'),(522,0,41944,0,'LMT'),(522,1,45000,1,'NZST'),(522,2,41400,0,'NZMT'),(522,3,43200,1,'NZST'),(522,4,46800,1,'NZDT'),(522,5,43200,0,'NZST'),(522,6,43200,0,'NZST'),(523,0,44028,0,'LMT'),(523,1,44100,0,'+1215'),(523,2,49500,1,'+1345'),(523,3,45900,0,'+1245'),(523,4,45900,0,'+1245'),(524,0,-25196,0,'LMT'),(524,1,-21600,1,'MDT'),(524,2,-25200,0,'MST'),(524,3,-21600,1,'MWT'),(524,4,-21600,1,'MPT'),(525,0,29143,0,'LMT'),(525,1,32400,1,'CDT'),(525,2,28800,0,'CST'),(526,0,-25200,1,'PDT'),(526,1,-28800,0,'PST'),(526,2,-25200,1,'PWT'),(526,3,-25200,1,'PPT'),(527,0,45184,0,'LMT'),(527,1,-41216,0,'LMT'),(527,2,-41400,0,'-1130'),(527,3,-36000,1,'-10'),(527,4,-39600,0,'-11'),(527,5,46800,0,'+13'),(527,6,50400,1,'+14'),(528,0,41944,0,'LMT'),(528,1,45000,1,'NZST'),(528,2,41400,0,'NZMT'),(528,3,43200,1,'NZST'),(528,4,46800,1,'NZDT'),(528,5,43200,0,'NZST'),(528,6,43200,0,'NZST'),(529,0,35312,0,'PMMT'),(529,1,36000,0,'+10'),(529,2,32400,0,'+09'),(529,3,39600,0,'+11'),(530,0,44028,0,'LMT'),(530,1,44100,0,'+1215'),(530,2,49500,1,'+1345'),(530,3,45900,0,'+1245'),(530,4,45900,0,'+1245'),(531,0,36428,0,'LMT'),(531,1,36000,0,'+10'),(531,2,32400,0,'+09'),(531,3,36000,0,'+10'),(532,0,-26248,0,'LMT'),(532,1,-26248,0,'EMT'),(532,2,-21600,1,'-06'),(532,3,-25200,0,'-07'),(532,4,-25200,0,'-07'),(532,5,-21600,0,'-06'),(532,6,-18000,1,'-05'),(533,0,40396,0,'LMT'),(533,1,43200,1,'+12'),(533,2,39600,0,'+11'),(534,0,-41060,0,'LMT'),(534,1,-43200,0,'-12'),(534,2,-39600,0,'-11'),(534,3,46800,0,'+13'),(535,0,-41096,0,'LMT'),(535,1,-39600,0,'-11'),(535,2,46800,0,'+13'),(536,0,42944,0,'LMT'),(536,1,46800,1,'+13'),(536,2,43200,0,'+12'),(537,0,43012,0,'LMT'),(537,1,43200,0,'+12'),(538,0,-21504,0,'LMT'),(538,1,-18000,0,'-05'),(538,2,-18000,1,'-05'),(538,3,-21600,0,'-06'),(539,0,-32388,0,'LMT'),(539,1,-32400,0,'-09'),(540,0,38388,0,'LMT'),(540,1,39600,0,'+11'),(541,0,34740,0,'LMT'),(541,1,36000,0,'GST'),(541,2,32400,0,'+09'),(541,3,39600,1,'GDT'),(541,4,36000,0,'ChST'),(542,0,-37886,0,'LMT'),(542,1,-37800,0,'HST'),(542,2,-34200,1,'HDT'),(542,3,-34200,1,'HWT'),(542,4,-34200,1,'HPT'),(542,5,-36000,0,'HST'),(543,0,-37886,0,'LMT'),(543,1,-37800,0,'HST'),(543,2,-34200,1,'HDT'),(543,3,-34200,1,'HWT'),(543,4,-34200,1,'HPT'),(543,5,-36000,0,'HST'),(544,0,-37760,0,'LMT'),(544,1,-38400,0,'-1040'),(544,2,-36000,0,'-10'),(544,3,50400,0,'+14'),(545,0,39116,0,'LMT'),(545,1,39600,0,'+11'),(545,2,32400,0,'+09'),(545,3,36000,0,'+10'),(545,4,43200,0,'+12'),(545,5,39600,0,'+11'),(546,0,40160,0,'LMT'),(546,1,39600,0,'+11'),(546,2,36000,0,'+10'),(546,3,32400,0,'+09'),(546,4,-43200,0,'-12'),(546,5,43200,0,'+12'),(547,0,41088,0,'LMT'),(547,1,39600,0,'+11'),(547,2,32400,0,'+09'),(547,3,36000,0,'+10'),(547,4,43200,0,'+12'),(548,0,-33480,0,'LMT'),(548,1,-34200,0,'-0930'),(549,0,45432,0,'LMT'),(549,1,-40968,0,'LMT'),(549,2,-39600,0,'SST'),(550,0,40060,0,'LMT'),(550,1,41400,0,'+1130'),(550,2,32400,0,'+09'),(550,3,43200,0,'+12'),(551,0,-40780,0,'LMT'),(551,1,-40800,0,'-1120'),(551,2,-41400,0,'-1130'),(551,3,-39600,0,'-11'),(552,0,40312,0,'LMT'),(552,1,40320,0,'+1112'),(552,2,41400,0,'+1130'),(552,3,45000,1,'+1230'),(552,4,41400,0,'+1130'),(552,5,39600,0,'+11'),(552,6,43200,1,'+12'),(552,7,39600,0,'+11'),(553,0,39948,0,'LMT'),(553,1,43200,1,'+12'),(553,2,39600,0,'+11'),(553,3,43200,1,'+12'),(553,4,39600,0,'+11'),(554,0,45432,0,'LMT'),(554,1,-40968,0,'LMT'),(554,2,-39600,0,'SST'),(555,0,32276,0,'LMT'),(555,1,32400,0,'+09'),(556,0,-31220,0,'LMT'),(556,1,-30600,0,'-0830'),(556,2,-28800,0,'-08'),(557,0,37972,0,'LMT'),(557,1,39600,0,'+11'),(557,2,32400,0,'+09'),(557,3,36000,0,'+10'),(557,4,39600,0,'+11'),(558,0,37972,0,'LMT'),(558,1,39600,0,'+11'),(558,2,32400,0,'+09'),(558,3,36000,0,'+10'),(558,4,39600,0,'+11'),(559,0,35312,0,'PMMT'),(559,1,36000,0,'+10'),(560,0,-38344,0,'LMT'),(560,1,-37800,0,'-1030'),(560,2,-36000,0,'-10'),(560,3,-34200,1,'-0930'),(561,0,34740,0,'LMT'),(561,1,36000,0,'GST'),(561,2,32400,0,'+09'),(561,3,39600,1,'GDT'),(561,4,36000,0,'ChST'),(562,0,45432,0,'LMT'),(562,1,-40968,0,'LMT'),(562,2,-39600,0,'SST'),(563,0,-35896,0,'LMT'),(563,1,-36000,0,'-10'),(564,0,41524,0,'LMT'),(564,1,43200,0,'+12'),(565,0,44360,0,'LMT'),(565,1,44400,0,'+1220'),(565,2,46800,0,'+13'),(565,3,50400,1,'+14'),(565,4,46800,0,'+13'),(565,5,50400,1,'+14'),(566,0,36428,0,'LMT'),(566,1,36000,0,'+10'),(566,2,32400,0,'+09'),(566,3,36000,0,'+10'),(567,0,39988,0,'LMT'),(567,1,43200,0,'+12'),(568,0,44120,0,'LMT'),(568,1,43200,0,'+12'),(569,0,36428,0,'LMT'),(569,1,36000,0,'+10'),(569,2,32400,0,'+09'),(569,3,36000,0,'+10'),(570,0,5040,0,'LMT'),(570,1,5040,0,'WMT'),(570,2,7200,1,'CEST'),(570,3,3600,0,'CET'),(570,4,7200,1,'CEST'),(570,5,3600,0,'CET'),(570,6,10800,1,'EEST'),(570,7,7200,0,'EET'),(570,8,7200,0,'EET'),(570,9,7200,1,'CEST'),(570,10,3600,0,'CET'),(571,0,-2205,0,'LMT'),(571,1,3600,1,'WEST'),(571,2,0,0,'WET'),(571,3,3600,1,'WEST'),(571,4,0,0,'WET'),(571,5,7200,1,'WEMT'),(571,6,0,0,'WET'),(571,7,3600,0,'CET'),(571,8,3600,0,'CET'),(571,9,7200,1,'CEST'),(571,10,3600,1,'WEST'),(571,11,0,0,'WET'),(572,0,29160,0,'LMT'),(572,1,28800,0,'CST'),(572,2,32400,0,'JST'),(572,3,32400,1,'CDT'),(572,4,28800,0,'CST'),(573,0,30472,0,'LMT'),(573,1,30600,0,'KST'),(573,2,32400,0,'JST'),(573,3,36000,1,'KDT'),(573,4,32400,0,'KST'),(573,5,34200,1,'KDT'),(573,6,36000,1,'KDT'),(574,0,24925,0,'LMT'),(574,1,24925,0,'SMT'),(574,2,25200,0,'+07'),(574,3,26400,1,'+0720'),(574,4,26400,0,'+0720'),(574,5,27000,0,'+0730'),(574,6,32400,0,'+09'),(574,7,28800,0,'+08'),(575,0,-15865,0,'LMT'),(575,1,-14400,0,'AST'),(575,2,-10800,1,'APT'),(575,3,-10800,1,'AWT'),(576,0,-15264,0,'LMT'),(576,1,-10800,1,'ADT'),(576,2,-14400,0,'AST'),(576,3,-10800,1,'AWT'),(576,4,-10800,1,'APT'),(577,0,-25116,0,'LMT'),(577,1,-21600,1,'MDT'),(577,2,-25200,0,'MST'),(577,3,-21600,1,'MWT'),(577,4,-21600,1,'MPT'),(577,5,-21600,0,'CST'),(578,0,-21036,0,'LMT'),(578,1,-18000,1,'CDT'),(578,2,-21600,0,'CST'),(578,3,-18000,0,'EST'),(578,4,-18000,1,'CWT'),(578,5,-18000,1,'CPT'),(578,6,-21600,0,'CST'),(579,0,-19088,0,'LMT'),(579,1,-19176,0,'CMT'),(579,2,-18000,0,'EST'),(580,0,-17762,0,'LMT'),(580,1,-14400,1,'EDT'),(580,2,-18000,0,'EST'),(580,3,-14400,1,'EWT'),(580,4,-14400,1,'EPT'),(581,0,-37886,0,'LMT'),(581,1,-37800,0,'HST'),(581,2,-34200,1,'HDT'),(581,3,-34200,1,'HWT'),(581,4,-34200,1,'HPT'),(581,5,-36000,0,'HST'),(582,0,-26898,0,'LMT'),(582,1,-21600,1,'MDT'),(582,2,-25200,0,'MST'),(582,3,-21600,1,'MWT'),(583,0,-25196,0,'LMT'),(583,1,-21600,1,'MDT'),(583,2,-25200,0,'MST'),(583,3,-21600,1,'MWT'),(583,4,-21600,1,'MPT'),(584,0,-31220,0,'LMT'),(584,1,-30600,0,'-0830'),(584,2,-28800,0,'-08'),(585,0,-28378,0,'LMT'),(585,1,-25200,1,'PDT'),(585,2,-28800,0,'PST'),(585,3,-25200,1,'PWT'),(585,4,-25200,1,'PPT'),(586,0,-32388,0,'LMT'),(586,1,-32400,0,'-09'),(587,0,-35976,0,'LMT'),(587,1,-36000,0,'AST'),(587,2,-32400,1,'AWT'),(587,3,-32400,1,'APT'),(587,4,-36000,0,'AHST'),(587,5,-32400,1,'AHDT'),(587,6,-32400,0,'YST'),(587,7,-28800,1,'AKDT'),(587,8,-32400,0,'AKST'),(588,0,6952,0,'LMT'),(588,1,7016,0,'IMT'),(588,2,10800,1,'EEST'),(588,3,7200,0,'EET'),(588,4,10800,0,'+03'),(588,5,14400,1,'+04'),(588,6,10800,1,'EEST'),(588,7,7200,0,'EET'),(588,8,10800,1,'EEST'),(588,9,7200,0,'EET'),(588,10,10800,0,'+03'),(589,0,0,0,'UTC'),(590,0,-35976,0,'LMT'),(590,1,-36000,0,'AST'),(590,2,-32400,1,'AWT'),(590,3,-32400,1,'APT'),(590,4,-36000,0,'AHST'),(590,5,-32400,1,'AHDT'),(590,6,-32400,0,'YST'),(590,7,-28800,1,'AKDT'),(590,8,-32400,0,'AKST'),(591,0,-42398,0,'LMT'),(591,1,-39600,0,'NST'),(591,2,-36000,1,'NWT'),(591,3,-36000,1,'NPT'),(591,4,-39600,0,'BST'),(591,5,-36000,1,'BDT'),(591,6,-36000,0,'AHST'),(591,7,-32400,1,'HDT'),(591,8,-36000,0,'HST'),(592,0,-26898,0,'LMT'),(592,1,-21600,1,'MDT'),(592,2,-25200,0,'MST'),(592,3,-21600,1,'MWT'),(593,0,-21036,0,'LMT'),(593,1,-18000,1,'CDT'),(593,2,-21600,0,'CST'),(593,3,-18000,0,'EST'),(593,4,-18000,1,'CWT'),(593,5,-18000,1,'CPT'),(593,6,-21600,0,'CST'),(594,0,-20678,0,'LMT'),(594,1,-18000,1,'CDT'),(594,2,-21600,0,'CST'),(594,3,-18000,1,'CWT'),(594,4,-18000,1,'CPT'),(594,5,-18000,0,'EST'),(594,6,-14400,1,'EDT'),(595,0,-17762,0,'LMT'),(595,1,-14400,1,'EDT'),(595,2,-18000,0,'EST'),(595,3,-14400,1,'EWT'),(595,4,-14400,1,'EPT'),(596,0,-37886,0,'LMT'),(596,1,-37800,0,'HST'),(596,2,-34200,1,'HDT'),(596,3,-34200,1,'HWT'),(596,4,-34200,1,'HPT'),(596,5,-36000,0,'HST'),(597,0,-20790,0,'LMT'),(597,1,-18000,1,'CDT'),(597,2,-21600,0,'CST'),(597,3,-18000,1,'CWT'),(597,4,-18000,1,'CPT'),(597,5,-18000,0,'EST'),(597,6,-21600,0,'CST'),(598,0,-19931,0,'LMT'),(598,1,-21600,0,'CST'),(598,2,-18000,0,'EST'),(598,3,-14400,1,'EWT'),(598,4,-14400,1,'EPT'),(598,5,-14400,1,'EDT'),(599,0,-25196,0,'LMT'),(599,1,-21600,1,'MDT'),(599,2,-25200,0,'MST'),(599,3,-21600,1,'MWT'),(599,4,-21600,1,'MPT'),(600,0,-28378,0,'LMT'),(600,1,-25200,1,'PDT'),(600,2,-28800,0,'PST'),(600,3,-25200,1,'PWT'),(600,4,-25200,1,'PPT'),(601,0,-28378,0,'LMT'),(601,1,-25200,1,'PDT'),(601,2,-28800,0,'PST'),(601,3,-25200,1,'PWT'),(601,4,-25200,1,'PPT'),(602,0,45432,0,'LMT'),(602,1,-40968,0,'LMT'),(602,2,-39600,0,'SST'),(603,0,0,0,'UTC'),(604,0,0,0,'UTC'),(605,0,9017,0,'LMT'),(605,1,9017,0,'MMT'),(605,2,12679,1,'MST'),(605,3,9079,0,'MMT'),(605,4,16279,1,'MDST'),(605,5,14400,1,'MSD'),(605,6,10800,0,'MSK'),(605,7,14400,1,'MSD'),(605,8,18000,1,'+05'),(605,9,7200,0,'EET'),(605,10,10800,0,'MSK'),(605,11,14400,1,'MSD'),(605,12,10800,1,'EEST'),(605,13,7200,0,'EET'),(605,14,14400,0,'MSK'),(605,15,14400,1,'MSD'),(605,16,10800,0,'MSK'),(606,0,3600,1,'WEST'),(606,1,0,0,'WET'),(607,0,0,0,'UTC'),(608,0,0,0,'UTC'),(609,0,-968,0,'LMT'),(609,1,0,0,'GMT'),(610,0,-52,0,'LMT'),(610,1,1200,1,'+0020'),(610,2,0,0,'GMT'),(611,0,8836,0,'LMT'),(611,1,10800,0,'EAT'),(611,2,9000,0,'+0230'),(611,3,9900,0,'+0245'),(611,4,10800,0,'EAT'),(612,0,732,0,'LMT'),(612,1,561,0,'PMT'),(612,2,3600,1,'WEST'),(612,3,0,0,'WET'),(612,4,0,0,'WET'),(612,5,7200,1,'CEST'),(612,6,3600,0,'CET'),(612,7,3600,1,'WEST'),(613,0,8836,0,'LMT'),(613,1,10800,0,'EAT'),(613,2,9000,0,'+0230'),(613,3,9900,0,'+0245'),(613,4,10800,0,'EAT'),(614,0,8836,0,'LMT'),(614,1,10800,0,'EAT'),(614,2,9000,0,'+0230'),(614,3,9900,0,'+0245'),(614,4,10800,0,'EAT'),(615,0,-968,0,'LMT'),(615,1,0,0,'GMT'),(616,0,816,0,'LMT'),(616,1,3600,0,'WAT'),(617,0,-968,0,'LMT'),(617,1,0,0,'GMT'),(618,0,-3740,0,'LMT'),(618,1,-3600,0,'-01'),(618,2,0,0,'GMT'),(619,0,7820,0,'LMT'),(619,1,7200,0,'CAT'),(620,0,816,0,'LMT'),(620,1,3600,0,'WAT'),(621,0,7820,0,'LMT'),(621,1,7200,0,'CAT'),(622,0,7509,0,'LMT'),(622,1,10800,1,'EEST'),(622,2,7200,0,'EET'),(622,3,10800,1,'EEST'),(623,0,-1820,0,'LMT'),(623,1,3600,1,'+01'),(623,2,0,0,'+00'),(623,3,3600,0,'+01'),(623,4,0,1,'+00'),(624,0,-1276,0,'LMT'),(624,1,0,0,'WET'),(624,2,3600,1,'WEST'),(624,3,0,0,'WET'),(624,4,3600,0,'CET'),(624,5,7200,1,'CEST'),(624,6,3600,0,'CET'),(625,0,-968,0,'LMT'),(625,1,0,0,'GMT'),(626,0,-968,0,'LMT'),(626,1,0,0,'GMT'),(627,0,8836,0,'LMT'),(627,1,10800,0,'EAT'),(627,2,9000,0,'+0230'),(627,3,9900,0,'+0245'),(627,4,10800,0,'EAT'),(628,0,8836,0,'LMT'),(628,1,10800,0,'EAT'),(628,2,9000,0,'+0230'),(628,3,9900,0,'+0245'),(628,4,10800,0,'EAT'),(629,0,816,0,'LMT'),(629,1,3600,0,'WAT'),(630,0,-3168,0,'LMT'),(630,1,-3600,0,'-01'),(630,2,3600,1,'+01'),(630,3,0,0,'+00'),(630,4,0,1,'+00'),(630,5,3600,0,'+01'),(631,0,-968,0,'LMT'),(631,1,0,0,'GMT'),(632,0,7820,0,'LMT'),(632,1,7200,0,'CAT'),(633,0,7820,0,'LMT'),(633,1,7200,0,'CAT'),(634,0,6720,0,'LMT'),(634,1,5400,0,'SAST'),(634,2,10800,1,'SAST'),(634,3,7200,0,'SAST'),(635,0,7588,0,'LMT'),(635,1,10800,1,'CAST'),(635,2,7200,0,'CAT'),(635,3,10800,0,'EAT'),(636,0,8836,0,'LMT'),(636,1,10800,0,'EAT'),(636,2,9000,0,'+0230'),(636,3,9900,0,'+0245'),(636,4,10800,0,'EAT'),(637,0,7808,0,'LMT'),(637,1,10800,1,'CAST'),(637,2,7200,0,'CAT'),(637,3,10800,0,'EAT'),(637,4,7200,0,'CAT'),(638,0,7820,0,'LMT'),(638,1,7200,0,'CAT'),(639,0,816,0,'LMT'),(639,1,3600,0,'WAT'),(640,0,816,0,'LMT'),(640,1,3600,0,'WAT'),(641,0,816,0,'LMT'),(641,1,3600,0,'WAT'),(642,0,-968,0,'LMT'),(642,1,0,0,'GMT'),(643,0,816,0,'LMT'),(643,1,3600,0,'WAT'),(644,0,7820,0,'LMT'),(644,1,7200,0,'CAT'),(645,0,7820,0,'LMT'),(645,1,7200,0,'CAT'),(646,0,816,0,'LMT'),(646,1,3600,0,'WAT'),(647,0,7820,0,'LMT'),(647,1,7200,0,'CAT'),(648,0,6720,0,'LMT'),(648,1,5400,0,'SAST'),(648,2,10800,1,'SAST'),(648,3,7200,0,'SAST'),(649,0,6720,0,'LMT'),(649,1,5400,0,'SAST'),(649,2,10800,1,'SAST'),(649,3,7200,0,'SAST'),(650,0,8836,0,'LMT'),(650,1,10800,0,'EAT'),(650,2,9000,0,'+0230'),(650,3,9900,0,'+0245'),(650,4,10800,0,'EAT'),(651,0,-2588,0,'LMT'),(651,1,-2588,0,'MMT'),(651,2,-2670,0,'MMT'),(651,3,0,0,'GMT'),(652,0,8836,0,'LMT'),(652,1,10800,0,'EAT'),(652,2,9000,0,'+0230'),(652,3,9900,0,'+0245'),(652,4,10800,0,'EAT'),(653,0,3612,0,'LMT'),(653,1,3600,0,'WAT'),(653,2,7200,1,'WAST'),(654,0,816,0,'LMT'),(654,1,3600,0,'WAT'),(655,0,-968,0,'LMT'),(655,1,0,0,'GMT'),(656,0,-968,0,'LMT'),(656,1,0,0,'GMT'),(657,0,816,0,'LMT'),(657,1,3600,0,'WAT'),(658,0,1616,0,'LMT'),(658,1,-2205,0,'LMT'),(658,2,0,0,'GMT'),(658,3,3600,0,'WAT'),(658,4,0,0,'GMT'),(659,0,-968,0,'LMT'),(659,1,0,0,'GMT'),(660,0,3164,0,'LMT'),(660,1,7200,1,'CEST'),(660,2,3600,0,'CET'),(660,3,7200,0,'EET'),(661,0,2444,0,'LMT'),(661,1,561,0,'PMT'),(661,2,7200,1,'CEST'),(661,3,3600,0,'CET'),(661,4,3600,0,'CET'),(661,5,7200,1,'CEST'),(662,0,4104,0,'LMT'),(662,1,5400,0,'+0130'),(662,2,7200,0,'SAST'),(662,3,10800,1,'SAST'),(662,4,3600,1,'WAT'),(662,5,7200,0,'CAT'),(663,0,-42398,0,'LMT'),(663,1,-39600,0,'NST'),(663,2,-36000,1,'NWT'),(663,3,-36000,1,'NPT'),(663,4,-39600,0,'BST'),(663,5,-36000,1,'BDT'),(663,6,-36000,0,'AHST'),(663,7,-32400,1,'HDT'),(663,8,-36000,0,'HST'),(664,0,-35976,0,'LMT'),(664,1,-36000,0,'AST'),(664,2,-32400,1,'AWT'),(664,3,-32400,1,'APT'),(664,4,-36000,0,'AHST'),(664,5,-32400,1,'AHDT'),(664,6,-32400,0,'YST'),(664,7,-28800,1,'AKDT'),(664,8,-32400,0,'AKST'),(665,0,-14764,0,'LMT'),(665,1,-14400,0,'AST'),(666,0,-14764,0,'LMT'),(666,1,-14400,0,'AST'),(667,0,-11568,0,'LMT'),(667,1,-7200,1,'-02'),(667,2,-10800,0,'-03'),(668,0,-14028,0,'LMT'),(668,1,-15408,0,'CMT'),(668,2,-14400,0,'-04'),(668,3,-10800,1,'-03'),(668,4,-7200,1,'-02'),(668,5,-10800,0,'-03'),(669,0,-15788,0,'LMT'),(669,1,-15408,0,'CMT'),(669,2,-14400,0,'-04'),(669,3,-10800,1,'-03'),(669,4,-7200,1,'-02'),(669,5,-10800,0,'-03'),(670,0,-15788,0,'LMT'),(670,1,-15408,0,'CMT'),(670,2,-14400,0,'-04'),(670,3,-10800,1,'-03'),(670,4,-7200,1,'-02'),(670,5,-10800,0,'-03'),(671,0,-15408,0,'LMT'),(671,1,-15408,0,'CMT'),(671,2,-14400,0,'-04'),(671,3,-10800,1,'-03'),(671,4,-7200,1,'-02'),(671,5,-10800,0,'-03'),(672,0,-15672,0,'LMT'),(672,1,-15408,0,'CMT'),(672,2,-14400,0,'-04'),(672,3,-10800,1,'-03'),(672,4,-7200,1,'-02'),(672,5,-10800,0,'-03'),(673,0,-16044,0,'LMT'),(673,1,-15408,0,'CMT'),(673,2,-14400,0,'-04'),(673,3,-10800,1,'-03'),(673,4,-7200,1,'-02'),(673,5,-10800,0,'-03'),(674,0,-16516,0,'LMT'),(674,1,-15408,0,'CMT'),(674,2,-14400,0,'-04'),(674,3,-10800,1,'-03'),(674,4,-7200,1,'-02'),(674,5,-10800,0,'-03'),(675,0,-16612,0,'LMT'),(675,1,-15408,0,'CMT'),(675,2,-14400,0,'-04'),(675,3,-10800,1,'-03'),(675,4,-7200,1,'-02'),(675,5,-10800,0,'-03'),(676,0,-15700,0,'LMT'),(676,1,-15408,0,'CMT'),(676,2,-14400,0,'-04'),(676,3,-10800,1,'-03'),(676,4,-7200,1,'-02'),(676,5,-10800,0,'-03'),(677,0,-16444,0,'LMT'),(677,1,-15408,0,'CMT'),(677,2,-14400,0,'-04'),(677,3,-10800,1,'-03'),(677,4,-7200,1,'-02'),(677,5,-10800,0,'-03'),(678,0,-15924,0,'LMT'),(678,1,-15408,0,'CMT'),(678,2,-14400,0,'-04'),(678,3,-10800,1,'-03'),(678,4,-7200,1,'-02'),(678,5,-10800,0,'-03'),(678,6,-10800,1,'-03'),(679,0,-15652,0,'LMT'),(679,1,-15408,0,'CMT'),(679,2,-14400,0,'-04'),(679,3,-10800,1,'-03'),(679,4,-7200,1,'-02'),(679,5,-10800,0,'-03'),(680,0,-16392,0,'LMT'),(680,1,-15408,0,'CMT'),(680,2,-14400,0,'-04'),(680,3,-10800,1,'-03'),(680,4,-7200,1,'-02'),(680,5,-10800,0,'-03'),(681,0,-16547,0,'LMT'),(681,1,-16200,0,'-0430'),(681,2,-14400,0,'AST'),(682,0,-13840,0,'LMT'),(682,1,-13840,0,'AMT'),(682,2,-14400,0,'-04'),(682,3,-10800,0,'-03'),(682,4,-10800,1,'-03'),(682,5,-14400,0,'-04'),(683,0,-21988,0,'LMT'),(683,1,-18000,1,'CDT'),(683,2,-21600,0,'CST'),(683,3,-18000,1,'CWT'),(683,4,-18000,1,'CPT'),(683,5,-18000,0,'EST'),(684,0,-42398,0,'LMT'),(684,1,-39600,0,'NST'),(684,2,-36000,1,'NWT'),(684,3,-36000,1,'NPT'),(684,4,-39600,0,'BST'),(684,5,-36000,1,'BDT'),(684,6,-36000,0,'AHST'),(684,7,-32400,1,'HDT'),(684,8,-36000,0,'HST'),(685,0,-9244,0,'LMT'),(685,1,-7200,1,'-02'),(685,2,-10800,0,'-03'),(686,0,-25260,0,'LMT'),(686,1,-25200,0,'MST'),(686,2,-21600,0,'CST'),(686,3,-28800,0,'PST'),(686,4,-21600,1,'MDT'),(686,5,-18000,1,'CDT'),(686,6,-21600,0,'CST'),(687,0,-14309,0,'LMT'),(687,1,-14309,0,'BMT'),(687,2,-10800,1,'ADT'),(687,3,-14400,0,'AST'),(688,0,-11636,0,'LMT'),(688,1,-7200,1,'-02'),(688,2,-10800,0,'-03'),(689,0,-21168,0,'LMT'),(689,1,-19800,1,'-0530'),(689,2,-21600,0,'CST'),(689,3,-18000,1,'CDT'),(690,0,-13708,0,'LMT'),(690,1,-10800,1,'ADT'),(690,2,-14400,0,'AST'),(690,3,-10800,1,'AWT'),(690,4,-10800,1,'APT'),(691,0,-14560,0,'LMT'),(691,1,-10800,1,'-03'),(691,2,-14400,0,'-04'),(692,0,-17776,0,'LMT'),(692,1,-17776,0,'BMT'),(692,2,-14400,1,'-04'),(692,3,-18000,0,'-05'),(693,0,-27889,0,'LMT'),(693,1,-25200,1,'PDT'),(693,2,-28800,0,'PST'),(693,3,-21600,1,'MWT'),(693,4,-21600,1,'MPT'),(693,5,-25200,0,'MST'),(693,6,-21600,1,'MDT'),(694,0,-14028,0,'LMT'),(694,1,-15408,0,'CMT'),(694,2,-14400,0,'-04'),(694,3,-10800,1,'-03'),(694,4,-7200,1,'-02'),(694,5,-10800,0,'-03'),(695,0,0,0,'-00'),(695,1,-21600,1,'MWT'),(695,2,-21600,1,'MPT'),(695,3,-25200,0,'MST'),(695,4,-18000,1,'MDDT'),(695,5,-21600,1,'MDT'),(695,6,-18000,1,'CDT'),(695,7,-21600,0,'CST'),(695,8,-18000,0,'EST'),(695,9,-21600,1,'MDT'),(695,10,-25200,0,'MST'),(696,0,-13108,0,'LMT'),(696,1,-10800,1,'-03'),(696,2,-14400,0,'-04'),(697,0,-20824,0,'LMT'),(697,1,-21600,0,'CST'),(697,2,-14400,1,'EDT'),(697,3,-18000,0,'EST'),(697,4,-18000,1,'CDT'),(698,0,-16064,0,'LMT'),(698,1,-16060,0,'CMT'),(698,2,-16200,0,'-0430'),(698,3,-14400,0,'-04'),(699,0,-15788,0,'LMT'),(699,1,-15408,0,'CMT'),(699,2,-14400,0,'-04'),(699,3,-10800,1,'-03'),(699,4,-7200,1,'-02'),(699,5,-10800,0,'-03'),(700,0,-12560,0,'LMT'),(700,1,-14400,0,'-04'),(700,2,-10800,0,'-03'),(701,0,-19088,0,'LMT'),(701,1,-19176,0,'CMT'),(701,2,-18000,0,'EST'),(702,0,-21036,0,'LMT'),(702,1,-18000,1,'CDT'),(702,2,-21600,0,'CST'),(702,3,-18000,0,'EST'),(702,4,-18000,1,'CWT'),(702,5,-18000,1,'CPT'),(702,6,-21600,0,'CST'),(703,0,-25460,0,'LMT'),(703,1,-25200,0,'MST'),(703,2,-21600,0,'CST'),(703,3,-18000,1,'CDT'),(703,4,-21600,1,'MDT'),(703,5,-25200,0,'MST'),(704,0,-21988,0,'LMT'),(704,1,-18000,1,'CDT'),(704,2,-21600,0,'CST'),(704,3,-18000,1,'CWT'),(704,4,-18000,1,'CPT'),(704,5,-18000,0,'EST'),(705,0,-15408,0,'LMT'),(705,1,-15408,0,'CMT'),(705,2,-14400,0,'-04'),(705,3,-10800,1,'-03'),(705,4,-7200,1,'-02'),(705,5,-10800,0,'-03'),(706,0,-20173,0,'LMT'),(706,1,-20173,0,'SJMT'),(706,2,-18000,1,'CDT'),(706,3,-21600,0,'CST'),(707,0,-27964,0,'LMT'),(707,1,-25200,0,'MST'),(707,2,-28800,0,'PST'),(707,3,-25200,0,'MST'),(708,0,-13460,0,'LMT'),(708,1,-10800,1,'-03'),(708,2,-14400,0,'-04'),(709,0,-16547,0,'LMT'),(709,1,-16200,0,'-0430'),(709,2,-14400,0,'AST'),(710,0,-4480,0,'LMT'),(710,1,-10800,0,'-03'),(710,2,-10800,0,'-03'),(710,3,-7200,1,'-02'),(710,4,-7200,1,'-02'),(710,5,0,0,'GMT'),(711,0,-33460,0,'LMT'),(711,1,-28800,1,'YDT'),(711,2,-32400,0,'YST'),(711,3,-28800,1,'YWT'),(711,4,-28800,1,'YPT'),(711,5,-25200,1,'YDDT'),(711,6,-28800,0,'PST'),(711,7,-25200,1,'PDT'),(712,0,-28856,0,'LMT'),(712,1,-25200,1,'PDT'),(712,2,-28800,0,'PST'),(712,3,-25200,1,'PWT'),(712,4,-25200,1,'PPT'),(712,5,-25200,0,'MST'),(713,0,-25196,0,'LMT'),(713,1,-21600,1,'MDT'),(713,2,-25200,0,'MST'),(713,3,-21600,1,'MWT'),(713,4,-21600,1,'MPT'),(714,0,-19931,0,'LMT'),(714,1,-21600,0,'CST'),(714,2,-18000,0,'EST'),(714,3,-14400,1,'EWT'),(714,4,-14400,1,'EPT'),(714,5,-14400,1,'EDT'),(715,0,-14764,0,'LMT'),(715,1,-14400,0,'AST'),(716,0,-27232,0,'LMT'),(716,1,-21600,1,'MDT'),(716,2,-25200,0,'MST'),(716,3,-21600,1,'MWT'),(716,4,-21600,1,'MPT'),(717,0,-16768,0,'LMT'),(717,1,-14400,1,'-04'),(717,2,-18000,0,'-05'),(717,3,-14400,0,'-04'),(717,4,-18000,0,'-05'),(718,0,-21408,0,'LMT'),(718,1,-18000,1,'CDT'),(718,2,-21600,0,'CST'),(719,0,-28084,0,'LMT'),(719,1,-25200,0,'MST'),(719,2,-28800,0,'PST'),(719,3,-25200,1,'PDT'),(719,4,-25200,1,'PWT'),(719,5,-25200,1,'PPT'),(720,0,-29447,0,'LMT'),(720,1,-25200,1,'PDT'),(720,2,-28800,0,'PST'),(720,3,-25200,1,'PWT'),(720,4,-25200,1,'PPT'),(720,5,-25200,0,'MST'),(721,0,-20678,0,'LMT'),(721,1,-18000,1,'CDT'),(721,2,-21600,0,'CST'),(721,3,-18000,1,'CWT'),(721,4,-18000,1,'CPT'),(721,5,-18000,0,'EST'),(721,6,-14400,1,'EDT'),(722,0,-9240,0,'LMT'),(722,1,-7200,1,'-02'),(722,2,-10800,0,'-03'),(723,0,-14388,0,'LMT'),(723,1,-10800,1,'ADT'),(723,2,-14400,0,'AST'),(723,3,-10800,1,'AWT'),(723,4,-10800,1,'APT'),(724,0,-12416,0,'LMT'),(724,1,-10800,0,'-03'),(724,2,-10800,0,'-03'),(724,3,-7200,1,'-02'),(724,4,-7200,1,'-02'),(725,0,-14500,0,'LMT'),(725,1,-12652,0,'NST'),(725,2,-9052,1,'NDT'),(725,3,-12600,0,'NST'),(725,4,-9000,1,'NDT'),(725,5,-9000,1,'NPT'),(725,6,-9000,1,'NWT'),(725,7,-10800,1,'ADT'),(725,8,-14400,0,'AST'),(725,9,-7200,1,'ADDT'),(725,10,-10800,1,'ADT'),(726,0,-17072,0,'LMT'),(726,1,-18430,0,'KMT'),(726,2,-18000,0,'EST'),(726,3,-14400,1,'EDT'),(726,4,-14400,0,'AST'),(726,5,-18000,0,'EST'),(727,0,-14764,0,'LMT'),(727,1,-14400,0,'AST'),(728,0,-14764,0,'LMT'),(728,1,-14400,0,'AST'),(729,0,-21724,0,'LMT'),(729,1,-18000,1,'CDT'),(729,2,-21600,0,'CST'),(730,0,-19160,0,'LMT'),(730,1,-18840,0,'QMT'),(730,2,-14400,1,'-04'),(730,3,-18000,0,'-05'),(731,0,-13960,0,'LMT'),(731,1,-13500,0,'-0345'),(731,2,-10800,0,'-03'),(731,3,-14400,0,'-04'),(732,0,-15264,0,'LMT'),(732,1,-10800,1,'ADT'),(732,2,-14400,0,'AST'),(732,3,-10800,1,'AWT'),(732,4,-10800,1,'APT'),(733,0,-19768,0,'LMT'),(733,1,-19776,0,'HMT'),(733,2,-14400,1,'CDT'),(733,3,-18000,0,'CST'),(733,4,-18000,0,'CST'),(733,5,-14400,1,'CDT'),(734,0,-26632,0,'LMT'),(734,1,-25200,0,'MST'),(734,2,-21600,0,'CST'),(734,3,-28800,0,'PST'),(734,4,-21600,1,'MDT'),(734,5,-25200,0,'MST'),(735,0,-20678,0,'LMT'),(735,1,-18000,1,'CDT'),(735,2,-21600,0,'CST'),(735,3,-18000,1,'CWT'),(735,4,-18000,1,'CPT'),(735,5,-18000,0,'EST'),(735,6,-14400,1,'EDT'),(736,0,-20790,0,'LMT'),(736,1,-18000,1,'CDT'),(736,2,-21600,0,'CST'),(736,3,-18000,1,'CWT'),(736,4,-18000,1,'CPT'),(736,5,-18000,0,'EST'),(736,6,-21600,0,'CST'),(737,0,-20723,0,'LMT'),(737,1,-18000,1,'CDT'),(737,2,-21600,0,'CST'),(737,3,-18000,1,'CWT'),(737,4,-18000,1,'CPT'),(737,5,-18000,0,'EST'),(737,6,-14400,1,'EDT'),(738,0,-20947,0,'LMT'),(738,1,-18000,1,'CDT'),(738,2,-21600,0,'CST'),(738,3,-18000,1,'CWT'),(738,4,-18000,1,'CPT'),(738,5,-18000,0,'EST'),(738,6,-14400,1,'EDT'),(739,0,-20823,0,'LMT'),(739,1,-18000,1,'CDT'),(739,2,-21600,0,'CST'),(739,3,-18000,1,'CWT'),(739,4,-18000,1,'CPT'),(739,5,-18000,0,'EST'),(739,6,-14400,1,'EDT'),(739,7,-18000,1,'CDT'),(739,8,-21600,0,'CST'),(740,0,-20416,0,'LMT'),(740,1,-18000,1,'CDT'),(740,2,-21600,0,'CST'),(740,3,-18000,1,'CWT'),(740,4,-18000,1,'CPT'),(740,5,-18000,0,'EST'),(740,6,-14400,1,'EDT'),(741,0,-21007,0,'LMT'),(741,1,-18000,1,'CDT'),(741,2,-21600,0,'CST'),(741,3,-18000,1,'CWT'),(741,4,-18000,1,'CPT'),(741,5,-18000,0,'EST'),(741,6,-14400,1,'EDT'),(742,0,-20785,0,'LMT'),(742,1,-18000,1,'CDT'),(742,2,-21600,0,'CST'),(742,3,-18000,1,'CWT'),(742,4,-18000,1,'CPT'),(742,5,-18000,0,'EST'),(742,6,-14400,1,'EDT'),(743,0,-20678,0,'LMT'),(743,1,-18000,1,'CDT'),(743,2,-21600,0,'CST'),(743,3,-18000,1,'CWT'),(743,4,-18000,1,'CPT'),(743,5,-18000,0,'EST'),(743,6,-14400,1,'EDT'),(744,0,0,0,'-00'),(744,1,-21600,1,'PDDT'),(744,2,-28800,0,'PST'),(744,3,-25200,0,'MST'),(744,4,-21600,1,'MDT'),(745,0,0,0,'-00'),(745,1,-14400,1,'EPT'),(745,2,-18000,0,'EST'),(745,3,-10800,1,'EDDT'),(745,4,-14400,1,'EDT'),(745,5,-14400,1,'EWT'),(745,6,-21600,0,'CST'),(745,7,-18000,1,'CDT'),(745,8,-14400,1,'EDT'),(745,9,-18000,0,'EST'),(746,0,-18430,0,'LMT'),(746,1,-18430,0,'KMT'),(746,2,-18000,0,'EST'),(746,3,-14400,1,'EDT'),(747,0,-15672,0,'LMT'),(747,1,-15408,0,'CMT'),(747,2,-14400,0,'-04'),(747,3,-10800,1,'-03'),(747,4,-7200,1,'-02'),(747,5,-10800,0,'-03'),(748,0,-32261,0,'LMT'),(748,1,-28800,0,'PST'),(748,2,-25200,1,'PWT'),(748,3,-25200,1,'PPT'),(748,4,-25200,1,'PDT'),(748,5,-28800,1,'YDT'),(748,6,-32400,0,'YST'),(748,7,-28800,1,'AKDT'),(748,8,-32400,0,'AKST'),(749,0,-20582,0,'LMT'),(749,1,-18000,1,'CDT'),(749,2,-21600,0,'CST'),(749,3,-18000,1,'CWT'),(749,4,-18000,1,'CPT'),(749,5,-18000,0,'EST'),(749,6,-14400,1,'EDT'),(750,0,-20364,0,'LMT'),(750,1,-18000,1,'CDT'),(750,2,-21600,0,'CST'),(750,3,-18000,1,'CWT'),(750,4,-18000,1,'CPT'),(750,5,-14400,1,'EDT'),(750,6,-18000,0,'EST'),(751,0,-20790,0,'LMT'),(751,1,-18000,1,'CDT'),(751,2,-21600,0,'CST'),(751,3,-18000,1,'CWT'),(751,4,-18000,1,'CPT'),(751,5,-18000,0,'EST'),(751,6,-21600,0,'CST'),(752,0,-16547,0,'LMT'),(752,1,-16200,0,'-0430'),(752,2,-14400,0,'AST'),(753,0,-16356,0,'LMT'),(753,1,-16356,0,'CMT'),(753,2,-12756,1,'BST'),(753,3,-14400,0,'-04'),(754,0,-18492,0,'LMT'),(754,1,-18516,0,'LMT'),(754,2,-14400,1,'-04'),(754,3,-18000,0,'-05'),(755,0,-28378,0,'LMT'),(755,1,-25200,1,'PDT'),(755,2,-28800,0,'PST'),(755,3,-25200,1,'PWT'),(755,4,-25200,1,'PPT'),(756,0,-20582,0,'LMT'),(756,1,-18000,1,'CDT'),(756,2,-21600,0,'CST'),(756,3,-18000,1,'CWT'),(756,4,-18000,1,'CPT'),(756,5,-18000,0,'EST'),(756,6,-14400,1,'EDT'),(757,0,-16547,0,'LMT'),(757,1,-16200,0,'-0430'),(757,2,-14400,0,'AST'),(758,0,-8572,0,'LMT'),(758,1,-7200,1,'-02'),(758,2,-10800,0,'-03'),(759,0,-20708,0,'LMT'),(759,1,-20712,0,'MMT'),(759,2,-21600,0,'CST'),(759,3,-18000,0,'EST'),(759,4,-18000,1,'CDT'),(759,5,-21600,0,'CST'),(760,0,-14404,0,'LMT'),(760,1,-10800,1,'-03'),(760,2,-14400,0,'-04'),(761,0,-14764,0,'LMT'),(761,1,-14400,0,'AST'),(762,0,-14660,0,'LMT'),(762,1,-14660,0,'FFMT'),(762,2,-14400,0,'AST'),(762,3,-10800,1,'ADT'),(763,0,-24000,0,'LMT'),(763,1,-21600,0,'CST'),(763,2,-18000,1,'CDT'),(764,0,-25540,0,'LMT'),(764,1,-25200,0,'MST'),(764,2,-21600,0,'CST'),(764,3,-28800,0,'PST'),(764,4,-21600,1,'MDT'),(764,5,-25200,0,'MST'),(765,0,-16516,0,'LMT'),(765,1,-15408,0,'CMT'),(765,2,-14400,0,'-04'),(765,3,-10800,1,'-03'),(765,4,-7200,1,'-02'),(765,5,-10800,0,'-03'),(766,0,-21027,0,'LMT'),(766,1,-18000,1,'CDT'),(766,2,-21600,0,'CST'),(766,3,-18000,1,'CWT'),(766,4,-18000,1,'CPT'),(766,5,-18000,0,'EST'),(766,6,-21600,0,'CST'),(767,0,-21508,0,'LMT'),(767,1,-21600,0,'CST'),(767,2,-18000,0,'EST'),(767,3,-18000,1,'CDT'),(767,4,-21600,0,'CST'),(768,0,-31578,0,'LMT'),(768,1,-28800,0,'PST'),(768,2,-25200,1,'PWT'),(768,3,-25200,1,'PPT'),(768,4,-25200,1,'PDT'),(768,5,-32400,0,'AKST'),(768,6,-28800,1,'AKDT'),(769,0,-23796,0,'LMT'),(769,1,-25200,0,'MST'),(769,2,-21600,0,'CST'),(769,3,-18000,1,'CDT'),(769,4,-18000,1,'CWT'),(770,0,-13480,0,'LMT'),(770,1,-14400,0,'AST'),(770,2,-10800,0,'-03'),(770,3,-7200,1,'-02'),(771,0,-15548,0,'LMT'),(771,1,-18000,0,'EST'),(771,2,-10800,1,'ADT'),(771,3,-14400,0,'AST'),(771,4,-10800,1,'AWT'),(771,5,-10800,1,'APT'),(772,0,-24076,0,'LMT'),(772,1,-21600,0,'CST'),(772,2,-18000,1,'CDT'),(773,0,-13491,0,'LMT'),(773,1,-13491,0,'MMT'),(773,2,-14400,0,'-04'),(773,3,-12600,0,'-0330'),(773,4,-10800,1,'-03'),(773,5,-10800,0,'-03'),(773,6,-9000,1,'-0230'),(773,7,-7200,1,'-02'),(773,8,-5400,1,'-0130'),(773,9,-7200,1,'-02'),(774,0,-19052,0,'LMT'),(774,1,-14400,1,'EDT'),(774,2,-18000,0,'EST'),(774,3,-14400,1,'EWT'),(774,4,-14400,1,'EPT'),(775,0,-14764,0,'LMT'),(775,1,-14400,0,'AST'),(776,0,-18570,0,'LMT'),(776,1,-14400,1,'EDT'),(776,2,-18000,0,'EST'),(777,0,-17762,0,'LMT'),(777,1,-14400,1,'EDT'),(777,2,-18000,0,'EST'),(777,3,-14400,1,'EWT'),(777,4,-14400,1,'EPT'),(778,0,-21184,0,'LMT'),(778,1,-14400,1,'EDT'),(778,2,-18000,0,'EST'),(778,3,-14400,1,'EWT'),(778,4,-14400,1,'EPT'),(779,0,-39698,0,'LMT'),(779,1,-39600,0,'NST'),(779,2,-36000,1,'NWT'),(779,3,-36000,1,'NPT'),(779,4,-39600,0,'BST'),(779,5,-36000,1,'BDT'),(779,6,-32400,0,'YST'),(779,7,-28800,1,'AKDT'),(779,8,-32400,0,'AKST'),(780,0,-7780,0,'LMT'),(780,1,-3600,1,'-01'),(780,2,-7200,0,'-02'),(781,0,-24427,0,'LMT'),(781,1,-21600,1,'MDT'),(781,2,-25200,0,'MST'),(781,3,-21600,1,'MWT'),(781,4,-21600,1,'MPT'),(781,5,-18000,1,'CDT'),(781,6,-21600,0,'CST'),(782,0,-24312,0,'LMT'),(782,1,-21600,1,'MDT'),(782,2,-25200,0,'MST'),(782,3,-21600,1,'MWT'),(782,4,-21600,1,'MPT'),(782,5,-18000,1,'CDT'),(782,6,-21600,0,'CST'),(783,0,-24339,0,'LMT'),(783,1,-21600,1,'MDT'),(783,2,-25200,0,'MST'),(783,3,-21600,1,'MWT'),(783,4,-21600,1,'MPT'),(783,5,-18000,1,'CDT'),(783,6,-21600,0,'CST'),(784,0,-25060,0,'LMT'),(784,1,-25200,0,'MST'),(784,2,-21600,0,'CST'),(784,3,-18000,1,'CDT'),(784,4,-21600,1,'MDT'),(784,5,-25200,0,'MST'),(785,0,-19088,0,'LMT'),(785,1,-19176,0,'CMT'),(785,2,-18000,0,'EST'),(786,0,0,0,'-00'),(786,1,-10800,1,'AWT'),(786,2,-10800,1,'APT'),(786,3,-14400,0,'AST'),(786,4,-7200,1,'ADDT'),(786,5,-10800,1,'ADT'),(786,6,-14400,1,'EDT'),(786,7,-18000,0,'EST'),(786,8,-21600,0,'CST'),(786,9,-18000,1,'CDT'),(786,10,-14400,1,'EDT'),(786,11,-18000,0,'EST'),(787,0,-13240,0,'LMT'),(787,1,-13252,0,'PMT'),(787,2,-13236,0,'PMT'),(787,3,-12600,0,'-0330'),(787,4,-10800,0,'-03'),(788,0,-26898,0,'LMT'),(788,1,-21600,1,'MDT'),(788,2,-25200,0,'MST'),(788,3,-21600,1,'MWT'),(789,0,-17360,0,'LMT'),(789,1,-17340,0,'PPMT'),(789,2,-14400,1,'EDT'),(789,3,-18000,0,'EST'),(789,4,-14400,1,'EDT'),(789,5,-18000,0,'EST'),(790,0,-14764,0,'LMT'),(790,1,-14400,0,'AST'),(791,0,-16272,0,'LMT'),(791,1,-14400,1,'-04'),(791,2,-18000,0,'-05'),(791,3,-14400,0,'-04'),(791,4,-18000,0,'-05'),(792,0,-15336,0,'LMT'),(792,1,-10800,1,'-03'),(792,2,-14400,0,'-04'),(793,0,-15865,0,'LMT'),(793,1,-14400,0,'AST'),(793,2,-10800,1,'APT'),(793,3,-10800,1,'AWT'),(794,0,-17020,0,'LMT'),(794,1,-16966,0,'SMT'),(794,2,-18000,0,'-05'),(794,3,-14400,0,'-04'),(794,4,-14400,1,'-04'),(794,5,-10800,1,'-03'),(794,6,-14400,0,'-04'),(794,7,-10800,0,'-03'),(795,0,-22696,0,'LMT'),(795,1,-18000,1,'CDT'),(795,2,-21600,0,'CST'),(795,3,-18000,1,'CWT'),(795,4,-18000,1,'CPT'),(796,0,0,0,'-00'),(796,1,-14400,1,'CDDT'),(796,2,-21600,0,'CST'),(796,3,-18000,1,'CDT'),(796,4,-18000,0,'EST'),(796,5,-21600,0,'CST'),(797,0,-8376,0,'LMT'),(797,1,-7200,1,'-02'),(797,2,-10800,0,'-03'),(798,0,-25116,0,'LMT'),(798,1,-21600,1,'MDT'),(798,2,-25200,0,'MST'),(798,3,-21600,1,'MWT'),(798,4,-21600,1,'MPT'),(798,5,-21600,0,'CST'),(799,0,0,0,'-00'),(799,1,-14400,1,'CDDT'),(799,2,-21600,0,'CST'),(799,3,-18000,1,'CDT'),(799,4,-18000,0,'EST'),(799,5,-21600,0,'CST'),(800,0,-16272,0,'LMT'),(800,1,-14400,1,'-04'),(800,2,-18000,0,'-05'),(800,3,-14400,0,'-04'),(800,4,-18000,0,'-05'),(801,0,-15408,0,'LMT'),(801,1,-15408,0,'CMT'),(801,2,-14400,0,'-04'),(801,3,-10800,1,'-03'),(801,4,-7200,1,'-02'),(801,5,-10800,0,'-03'),(802,0,-28084,0,'LMT'),(802,1,-25200,0,'MST'),(802,2,-28800,0,'PST'),(802,3,-25200,1,'PDT'),(802,4,-25200,1,'PWT'),(802,5,-25200,1,'PPT'),(803,0,-13128,0,'LMT'),(803,1,-10800,1,'-03'),(803,2,-14400,0,'-04'),(803,3,-10800,0,'-03'),(804,0,-16966,0,'LMT'),(804,1,-16966,0,'SMT'),(804,2,-18000,0,'-05'),(804,3,-14400,0,'-04'),(804,4,-14400,1,'-04'),(804,5,-10800,1,'-03'),(804,6,-10800,1,'-03'),(804,7,-14400,0,'-04'),(805,0,-16776,0,'LMT'),(805,1,-16800,0,'SDMT'),(805,2,-14400,1,'EDT'),(805,3,-18000,0,'EST'),(805,4,-16200,1,'-0430'),(805,5,-14400,0,'AST'),(806,0,-11188,0,'LMT'),(806,1,-7200,1,'-02'),(806,2,-10800,0,'-03'),(807,0,-5272,0,'LMT'),(807,1,-7200,0,'-02'),(807,2,-3600,1,'-01'),(807,3,-7200,0,'-02'),(807,4,-3600,0,'-01'),(807,5,0,1,'+00'),(807,6,0,1,'+00'),(808,0,-25196,0,'LMT'),(808,1,-21600,1,'MDT'),(808,2,-25200,0,'MST'),(808,3,-21600,1,'MWT'),(808,4,-21600,1,'MPT'),(809,0,-32473,0,'LMT'),(809,1,-28800,0,'PST'),(809,2,-25200,1,'PWT'),(809,3,-25200,1,'PPT'),(809,4,-25200,1,'PDT'),(809,5,-32400,0,'YST'),(809,6,-28800,1,'AKDT'),(809,7,-32400,0,'AKST'),(810,0,-14764,0,'LMT'),(810,1,-14400,0,'AST'),(811,0,-12652,0,'LMT'),(811,1,-9052,1,'NDT'),(811,2,-12652,0,'NST'),(811,3,-9000,1,'NDT'),(811,4,-12600,0,'NST'),(811,5,-9000,1,'NPT'),(811,6,-9000,1,'NWT'),(811,7,-5400,1,'NDDT'),(811,8,-9000,1,'NDT'),(812,0,-14764,0,'LMT'),(812,1,-14400,0,'AST'),(813,0,-14764,0,'LMT'),(813,1,-14400,0,'AST'),(814,0,-14764,0,'LMT'),(814,1,-14400,0,'AST'),(815,0,-14764,0,'LMT'),(815,1,-14400,0,'AST'),(816,0,-25880,0,'LMT'),(816,1,-21600,1,'MDT'),(816,2,-25200,0,'MST'),(816,3,-21600,1,'MWT'),(816,4,-21600,1,'MPT'),(816,5,-21600,0,'CST'),(817,0,-20932,0,'LMT'),(817,1,-18000,1,'CDT'),(817,2,-21600,0,'CST'),(818,0,-16508,0,'LMT'),(818,1,-10800,1,'ADT'),(818,2,-14400,0,'AST'),(819,0,-21420,0,'LMT'),(819,1,-21600,0,'CST'),(819,2,-18000,0,'EST'),(819,3,-14400,1,'EWT'),(819,4,-14400,1,'EPT'),(819,5,-14400,1,'EDT'),(820,0,-28084,0,'LMT'),(820,1,-25200,0,'MST'),(820,2,-28800,0,'PST'),(820,3,-25200,1,'PDT'),(820,4,-25200,1,'PWT'),(820,5,-25200,1,'PPT'),(821,0,-19052,0,'LMT'),(821,1,-14400,1,'EDT'),(821,2,-18000,0,'EST'),(821,3,-14400,1,'EWT'),(821,4,-14400,1,'EPT'),(822,0,-14764,0,'LMT'),(822,1,-14400,0,'AST'),(823,0,-29548,0,'LMT'),(823,1,-25200,1,'PDT'),(823,2,-28800,0,'PST'),(823,3,-25200,1,'PWT'),(823,4,-25200,1,'PPT'),(824,0,-14764,0,'LMT'),(824,1,-14400,0,'AST'),(825,0,-32412,0,'LMT'),(825,1,-28800,1,'YDT'),(825,2,-32400,0,'YST'),(825,3,-28800,1,'YWT'),(825,4,-28800,1,'YPT'),(825,5,-25200,1,'YDDT'),(825,6,-28800,0,'PST'),(825,7,-25200,1,'PDT'),(826,0,-23316,0,'LMT'),(826,1,-18000,1,'CDT'),(826,2,-21600,0,'CST'),(826,3,-18000,1,'CWT'),(826,4,-18000,1,'CPT'),(826,5,-18000,1,'CDT'),(826,6,-21600,0,'CST'),(827,0,-33535,0,'LMT'),(827,1,-32400,0,'YST'),(827,2,-28800,1,'YWT'),(827,3,-28800,1,'YPT'),(827,4,-28800,1,'YDT'),(827,5,-28800,1,'AKDT'),(827,6,-32400,0,'AKST'),(828,0,0,0,'-00'),(828,1,-21600,1,'MWT'),(828,2,-21600,1,'MPT'),(828,3,-25200,0,'MST'),(828,4,-18000,1,'MDDT'),(828,5,-21600,1,'MDT'),(829,0,0,0,'-00'),(829,1,28800,0,'+08'),(829,2,39600,0,'+11'),(829,3,28800,0,'+08'),(830,0,0,0,'-00'),(830,1,25200,0,'+07'),(830,2,18000,0,'+05'),(830,3,25200,0,'+07'),(831,0,0,0,'-00'),(831,1,36000,0,'+10'),(832,0,0,0,'-00'),(832,1,36000,0,'AEST'),(832,2,39600,1,'AEDT'),(832,3,0,0,'-00'),(832,4,39600,1,'AEDT'),(832,5,36000,0,'AEST'),(832,6,39600,0,'+11'),(833,0,0,0,'-00'),(833,1,21600,0,'+06'),(833,2,18000,0,'+05'),(834,0,41944,0,'LMT'),(834,1,45000,1,'NZST'),(834,2,41400,0,'NZMT'),(834,3,43200,1,'NZST'),(834,4,46800,1,'NZDT'),(834,5,43200,0,'NZST'),(834,6,43200,0,'NZST'),(835,0,0,0,'-00'),(835,1,-14400,0,'-04'),(835,2,-10800,1,'-03'),(835,3,-7200,1,'-02'),(835,4,-10800,0,'-03'),(835,5,-10800,1,'-03'),(835,6,-14400,0,'-04'),(835,7,-10800,0,'-03'),(836,0,0,0,'-00'),(836,1,-10800,0,'-03'),(837,0,41944,0,'LMT'),(837,1,45000,1,'NZST'),(837,2,41400,0,'NZMT'),(837,3,43200,1,'NZST'),(837,4,46800,1,'NZDT'),(837,5,43200,0,'NZST'),(837,6,43200,0,'NZST'),(838,0,0,0,'-00'),(838,1,10800,0,'+03'),(839,0,0,0,'-00'),(839,1,7200,1,'+02'),(839,2,0,0,'+00'),(839,3,0,0,'+00'),(840,0,0,0,'-00'),(840,1,21600,0,'+06'),(841,0,2580,0,'LMT'),(841,1,7200,1,'CEST'),(841,2,3600,0,'CET'),(841,3,3600,0,'CET'),(841,4,7200,1,'CEST'),(841,5,7200,1,'CEST'),(841,6,3600,0,'CET'),(842,0,11212,0,'LMT'),(842,1,10800,0,'+03'),(843,0,18468,0,'LMT'),(843,1,18000,0,'+05'),(843,2,25200,1,'+07'),(843,3,21600,0,'+06'),(843,4,21600,0,'+06'),(843,5,25200,1,'+07'),(843,6,21600,1,'+06'),(843,7,18000,0,'+05'),(843,8,25200,1,'+07'),(843,9,21600,0,'+06'),(844,0,8624,0,'LMT'),(844,1,10800,1,'EEST'),(844,2,7200,0,'EET'),(844,3,7200,0,'EET'),(844,4,10800,1,'EEST'),(845,0,42596,0,'LMT'),(845,1,43200,0,'+12'),(845,2,50400,1,'+14'),(845,3,46800,0,'+13'),(845,4,46800,1,'+13'),(845,5,43200,0,'+12'),(845,6,46800,1,'+13'),(845,7,43200,1,'+12'),(845,8,39600,0,'+11'),(845,9,43200,0,'+12'),(846,0,12064,0,'LMT'),(846,1,14400,0,'+04'),(846,2,18000,0,'+05'),(846,3,21600,0,'+06'),(846,4,21600,1,'+06'),(846,5,18000,0,'+05'),(846,6,21600,1,'+06'),(846,7,18000,1,'+05'),(846,8,14400,0,'+04'),(846,9,18000,0,'+05'),(847,0,13720,0,'LMT'),(847,1,14400,0,'+04'),(847,2,18000,0,'+05'),(847,3,21600,1,'+06'),(847,4,21600,0,'+06'),(847,5,18000,0,'+05'),(847,6,21600,1,'+06'),(847,7,18000,1,'+05'),(847,8,14400,0,'+04'),(847,9,21600,1,'+06'),(847,10,18000,0,'+05'),(848,0,14012,0,'LMT'),(848,1,14400,0,'+04'),(848,2,21600,1,'+06'),(848,3,18000,0,'+05'),(848,4,18000,0,'+05'),(848,5,21600,1,'+06'),(848,6,18000,1,'+05'),(848,7,14400,0,'+04'),(848,8,18000,0,'+05'),(849,0,14012,0,'LMT'),(849,1,14400,0,'+04'),(849,2,21600,1,'+06'),(849,3,18000,0,'+05'),(849,4,18000,0,'+05'),(849,5,21600,1,'+06'),(849,6,18000,1,'+05'),(849,7,14400,0,'+04'),(849,8,18000,0,'+05'),(850,0,12464,0,'LMT'),(850,1,10800,0,'+03'),(850,2,18000,0,'+05'),(850,3,21600,0,'+06'),(850,4,21600,1,'+06'),(850,5,18000,0,'+05'),(850,6,21600,1,'+06'),(850,7,18000,1,'+05'),(850,8,14400,0,'+04'),(850,9,18000,0,'+05'),(851,0,10660,0,'LMT'),(851,1,10656,0,'BMT'),(851,2,10800,0,'+03'),(851,3,14400,1,'+04'),(851,4,10800,0,'+03'),(851,5,14400,1,'+04'),(852,0,12368,0,'LMT'),(852,1,14400,0,'+04'),(852,2,10800,0,'+03'),(853,0,11964,0,'LMT'),(853,1,10800,0,'+03'),(853,2,18000,1,'+05'),(853,3,14400,0,'+04'),(853,4,14400,0,'+04'),(853,5,18000,1,'+05'),(853,6,14400,1,'+04'),(853,7,10800,0,'+03'),(853,8,18000,1,'+05'),(853,9,14400,0,'+04'),(854,0,24124,0,'LMT'),(854,1,24124,0,'BMT'),(854,2,25200,0,'+07'),(855,0,20100,0,'LMT'),(855,1,21600,0,'+06'),(855,2,28800,1,'+08'),(855,3,25200,0,'+07'),(855,4,25200,0,'+07'),(855,5,28800,1,'+08'),(855,6,25200,1,'+07'),(855,7,21600,0,'+06'),(855,8,25200,1,'+07'),(855,9,25200,0,'+07'),(856,0,8520,0,'LMT'),(856,1,10800,1,'EEST'),(856,2,7200,0,'EET'),(857,0,17904,0,'LMT'),(857,1,18000,0,'+05'),(857,2,25200,1,'+07'),(857,3,21600,0,'+06'),(857,4,21600,0,'+06'),(857,5,25200,1,'+07'),(857,6,21600,1,'+06'),(857,7,18000,0,'+05'),(857,8,21600,1,'+06'),(857,9,21600,0,'+06'),(858,0,27580,0,'LMT'),(858,1,27000,0,'+0730'),(858,2,28800,0,'+08'),(859,0,21200,0,'HMT'),(859,1,19270,0,'MMT'),(859,2,19800,0,'IST'),(859,3,23400,1,'+0630'),(860,0,27232,0,'LMT'),(860,1,28800,0,'+08'),(860,2,36000,1,'+10'),(860,3,32400,0,'+09'),(860,4,32400,0,'+09'),(860,5,36000,1,'+10'),(860,6,32400,1,'+09'),(860,7,28800,0,'+08'),(860,8,36000,0,'+10'),(860,9,36000,1,'+10'),(860,10,32400,0,'+09'),(861,0,27480,0,'LMT'),(861,1,25200,0,'+07'),(861,2,28800,0,'+08'),(861,3,32400,0,'+09'),(861,4,36000,1,'+10'),(861,5,32400,1,'+09'),(861,6,28800,0,'+08'),(862,0,29143,0,'LMT'),(862,1,32400,1,'CDT'),(862,2,28800,0,'CST'),(863,0,29143,0,'LMT'),(863,1,32400,1,'CDT'),(863,2,28800,0,'CST'),(864,0,19164,0,'LMT'),(864,1,19172,0,'MMT'),(864,2,19800,0,'+0530'),(864,3,21600,1,'+06'),(864,4,23400,1,'+0630'),(864,5,23400,0,'+0630'),(864,6,21600,0,'+06'),(864,7,19800,0,'+0530'),(865,0,21700,0,'LMT'),(865,1,21200,0,'HMT'),(865,2,23400,0,'+0630'),(865,3,19800,0,'+0530'),(865,4,21600,0,'+06'),(865,5,25200,1,'+07'),(866,0,8712,0,'LMT'),(866,1,10800,1,'EEST'),(866,2,7200,0,'EET'),(867,0,21700,0,'LMT'),(867,1,21200,0,'HMT'),(867,2,23400,0,'+0630'),(867,3,19800,0,'+0530'),(867,4,21600,0,'+06'),(867,5,25200,1,'+07'),(868,0,30140,0,'LMT'),(868,1,28800,0,'+08'),(868,2,32400,0,'+09'),(869,0,13272,0,'LMT'),(869,1,14400,0,'+04'),(870,0,16512,0,'LMT'),(870,1,18000,0,'+05'),(870,2,25200,1,'+07'),(870,3,21600,0,'+06'),(870,4,21600,0,'+06'),(870,5,25200,1,'+07'),(870,6,21600,1,'+06'),(870,7,18000,0,'+05'),(871,0,8148,0,'LMT'),(871,1,10800,1,'EEST'),(871,2,7200,0,'EET'),(871,3,7200,0,'EET'),(871,4,10800,1,'EEST'),(871,5,10800,0,'+03'),(871,6,7200,0,'EET'),(872,0,8272,0,'LMT'),(872,1,10800,1,'EEST'),(872,2,7200,0,'EET'),(872,3,10800,1,'IDT'),(872,4,7200,0,'IST'),(872,5,7200,0,'EET'),(873,0,29143,0,'LMT'),(873,1,32400,1,'CDT'),(873,2,28800,0,'CST'),(874,0,8423,0,'LMT'),(874,1,10800,1,'EEST'),(874,2,7200,0,'EET'),(874,3,10800,1,'IDT'),(874,4,7200,0,'IST'),(874,5,7200,0,'EET'),(875,0,25600,0,'LMT'),(875,1,25590,0,'PLMT'),(875,2,25200,0,'+07'),(875,3,28800,0,'+08'),(875,4,32400,0,'+09'),(875,5,25200,0,'+07'),(876,0,27402,0,'LMT'),(876,1,28800,0,'HKT'),(876,2,32400,1,'HKST'),(876,3,30600,1,'HKWT'),(876,4,32400,0,'JST'),(876,5,28800,0,'HKT'),(876,6,32400,1,'HKST'),(877,0,21996,0,'LMT'),(877,1,21600,0,'+06'),(877,2,28800,1,'+08'),(877,3,25200,0,'+07'),(878,0,25025,0,'LMT'),(878,1,25025,0,'IMT'),(878,2,25200,0,'+07'),(878,3,32400,1,'+09'),(878,4,28800,0,'+08'),(878,5,28800,0,'+08'),(878,6,32400,1,'+09'),(878,7,28800,1,'+08'),(878,8,25200,0,'+07'),(878,9,32400,0,'+09'),(878,10,32400,1,'+09'),(878,11,28800,0,'+08'),(879,0,6952,0,'LMT'),(879,1,7016,0,'IMT'),(879,2,10800,1,'EEST'),(879,3,7200,0,'EET'),(879,4,10800,0,'+03'),(879,5,14400,1,'+04'),(879,6,10800,1,'EEST'),(879,7,7200,0,'EET'),(879,8,10800,1,'EEST'),(879,9,7200,0,'EET'),(879,10,10800,0,'+03'),(880,0,25632,0,'LMT'),(880,1,25632,0,'BMT'),(880,2,26400,0,'+0720'),(880,3,27000,0,'+0730'),(880,4,32400,0,'+09'),(880,5,28800,0,'+08'),(880,6,25200,0,'WIB'),(881,0,33768,0,'LMT'),(881,1,32400,0,'+09'),(881,2,34200,0,'+0930'),(881,3,32400,0,'WIT'),(882,0,8454,0,'LMT'),(882,1,8440,0,'JMT'),(882,2,10800,1,'IDT'),(882,3,7200,0,'IST'),(882,4,14400,1,'IDDT'),(882,5,10800,1,'IDT'),(883,0,16608,0,'LMT'),(883,1,14400,0,'+04'),(883,2,16200,0,'+0430'),(884,0,38076,0,'LMT'),(884,1,39600,0,'+11'),(884,2,46800,1,'+13'),(884,3,43200,0,'+12'),(884,4,43200,0,'+12'),(884,5,46800,1,'+13'),(884,6,43200,1,'+12'),(884,7,39600,0,'+11'),(884,8,43200,0,'+12'),(885,0,16092,0,'LMT'),(885,1,19800,0,'+0530'),(885,2,23400,1,'+0630'),(885,3,18000,0,'+05'),(885,4,21600,1,'PKST'),(885,5,18000,0,'PKT'),(886,0,21020,0,'LMT'),(886,1,21600,0,'+06'),(887,0,20476,0,'LMT'),(887,1,19800,0,'+0530'),(887,2,20700,0,'+0545'),(888,0,20476,0,'LMT'),(888,1,19800,0,'+0530'),(888,2,20700,0,'+0545'),(889,0,32533,0,'LMT'),(889,1,28800,0,'+08'),(889,2,36000,1,'+10'),(889,3,32400,0,'+09'),(889,4,32400,0,'+09'),(889,5,36000,1,'+10'),(889,6,32400,1,'+09'),(889,7,28800,0,'+08'),(889,8,39600,1,'+11'),(889,9,36000,0,'+10'),(889,10,36000,0,'+10'),(889,11,39600,0,'+11'),(889,12,32400,0,'+09'),(890,0,21200,0,'HMT'),(890,1,19270,0,'MMT'),(890,2,19800,0,'IST'),(890,3,23400,1,'+0630'),(891,0,22286,0,'LMT'),(891,1,21600,0,'+06'),(891,2,28800,1,'+08'),(891,3,25200,0,'+07'),(891,4,25200,0,'+07'),(891,5,28800,1,'+08'),(891,6,25200,1,'+07'),(891,7,21600,0,'+06'),(891,8,28800,0,'+08'),(891,9,28800,1,'+08'),(891,10,25200,0,'+07'),(892,0,24406,0,'LMT'),(892,1,24925,0,'SMT'),(892,2,25200,0,'+07'),(892,3,26400,1,'+0720'),(892,4,26400,0,'+0720'),(892,5,27000,0,'+0730'),(892,6,32400,0,'+09'),(892,7,28800,0,'+08'),(893,0,26480,0,'LMT'),(893,1,27000,0,'+0730'),(893,2,30000,1,'+0820'),(893,3,28800,0,'+08'),(893,4,32400,0,'+09'),(893,5,28800,0,'+08'),(894,0,11212,0,'LMT'),(894,1,10800,0,'+03'),(895,0,27250,0,'LMT'),(895,1,28800,0,'CST'),(895,2,36000,1,'+10'),(895,3,32400,0,'+09'),(895,4,32400,1,'CDT'),(895,5,28800,0,'CST'),(895,6,32400,1,'CDT'),(896,0,27250,0,'LMT'),(896,1,28800,0,'CST'),(896,2,36000,1,'+10'),(896,3,32400,0,'+09'),(896,4,32400,1,'CDT'),(896,5,28800,0,'CST'),(896,6,32400,1,'CDT'),(897,0,36192,0,'LMT'),(897,1,36000,0,'+10'),(897,2,43200,1,'+12'),(897,3,39600,0,'+11'),(897,4,39600,0,'+11'),(897,5,43200,1,'+12'),(897,6,39600,1,'+11'),(897,7,36000,0,'+10'),(897,8,43200,0,'+12'),(897,9,43200,1,'+12'),(897,10,39600,0,'+11'),(898,0,28656,0,'LMT'),(898,1,28656,0,'MMT'),(898,2,28800,0,'+08'),(898,3,32400,0,'+09'),(898,4,28800,0,'WITA'),(899,0,29040,0,'LMT'),(899,1,32400,1,'PDT'),(899,2,28800,0,'PST'),(899,3,32400,0,'JST'),(899,4,28800,0,'PST'),(900,0,13272,0,'LMT'),(900,1,14400,0,'+04'),(901,0,8008,0,'LMT'),(901,1,10800,1,'EEST'),(901,2,7200,0,'EET'),(901,3,7200,0,'EET'),(901,4,10800,1,'EEST'),(902,0,20928,0,'LMT'),(902,1,21600,0,'+06'),(902,2,28800,1,'+08'),(902,3,25200,0,'+07'),(902,4,25200,0,'+07'),(902,5,28800,1,'+08'),(902,6,25200,1,'+07'),(902,7,21600,0,'+06'),(902,8,25200,0,'+07'),(903,0,19900,0,'LMT'),(903,1,21600,0,'+06'),(903,2,28800,1,'+08'),(903,3,25200,0,'+07'),(903,4,25200,0,'+07'),(903,5,28800,1,'+08'),(903,6,25200,1,'+07'),(903,7,21600,0,'+06'),(903,8,25200,1,'+07'),(903,9,25200,0,'+07'),(904,0,17610,0,'LMT'),(904,1,18000,0,'+05'),(904,2,25200,1,'+07'),(904,3,21600,0,'+06'),(904,4,21600,0,'+06'),(904,5,25200,1,'+07'),(904,6,21600,1,'+06'),(904,7,18000,0,'+05'),(904,8,25200,0,'+07'),(904,9,25200,1,'+07'),(904,10,21600,0,'+06'),(905,0,12324,0,'LMT'),(905,1,10800,0,'+03'),(905,2,18000,0,'+05'),(905,3,21600,1,'+06'),(905,4,21600,0,'+06'),(905,5,18000,0,'+05'),(905,6,21600,1,'+06'),(905,7,18000,1,'+05'),(905,8,14400,0,'+04'),(905,9,18000,0,'+05'),(906,0,24124,0,'LMT'),(906,1,24124,0,'BMT'),(906,2,25200,0,'+07'),(907,0,26240,0,'LMT'),(907,1,26240,0,'PMT'),(907,2,27000,0,'+0730'),(907,3,32400,0,'+09'),(907,4,28800,0,'+08'),(907,5,28800,0,'WITA'),(907,6,25200,0,'WIB'),(908,0,30180,0,'LMT'),(908,1,30600,0,'KST'),(908,2,32400,0,'JST'),(908,3,32400,0,'KST'),(909,0,12368,0,'LMT'),(909,1,14400,0,'+04'),(909,2,10800,0,'+03'),(910,0,15268,0,'LMT'),(910,1,14400,0,'+04'),(910,2,18000,0,'+05'),(910,3,21600,1,'+06'),(910,4,21600,0,'+06'),(910,5,18000,0,'+05'),(910,6,21600,1,'+06'),(910,7,18000,1,'+05'),(910,8,14400,0,'+04'),(910,9,21600,0,'+06'),(910,10,21600,1,'+06'),(911,0,15712,0,'LMT'),(911,1,14400,0,'+04'),(911,2,18000,0,'+05'),(911,3,21600,1,'+06'),(911,4,21600,0,'+06'),(911,5,18000,0,'+05'),(911,6,21600,1,'+06'),(911,7,18000,1,'+05'),(911,8,14400,0,'+04'),(911,9,21600,0,'+06'),(911,10,21600,1,'+06'),(911,11,18000,0,'+05'),(912,0,23087,0,'LMT'),(912,1,23087,0,'RMT'),(912,2,23400,0,'+0630'),(912,3,32400,0,'+09'),(912,4,23400,0,'+0630'),(913,0,11212,0,'LMT'),(913,1,10800,0,'+03'),(914,0,25600,0,'LMT'),(914,1,25590,0,'PLMT'),(914,2,25200,0,'+07'),(914,3,28800,0,'+08'),(914,4,32400,0,'+09'),(914,5,25200,0,'+07'),(915,0,34248,0,'LMT'),(915,1,32400,0,'+09'),(915,2,43200,1,'+12'),(915,3,39600,0,'+11'),(915,4,39600,0,'+11'),(915,5,43200,1,'+12'),(915,6,39600,1,'+11'),(915,7,36000,0,'+10'),(915,8,39600,0,'+11'),(916,0,16073,0,'LMT'),(916,1,14400,0,'+04'),(916,2,18000,0,'+05'),(916,3,21600,1,'+06'),(916,4,21600,0,'+06'),(916,5,18000,0,'+05'),(916,6,21600,1,'+06'),(917,0,30472,0,'LMT'),(917,1,30600,0,'KST'),(917,2,32400,0,'JST'),(917,3,36000,1,'KDT'),(917,4,32400,0,'KST'),(917,5,34200,1,'KDT'),(917,6,36000,1,'KDT'),(918,0,29143,0,'LMT'),(918,1,32400,1,'CDT'),(918,2,28800,0,'CST'),(919,0,24925,0,'LMT'),(919,1,24925,0,'SMT'),(919,2,25200,0,'+07'),(919,3,26400,1,'+0720'),(919,4,26400,0,'+0720'),(919,5,27000,0,'+0730'),(919,6,32400,0,'+09'),(919,7,28800,0,'+08'),(920,0,36892,0,'LMT'),(920,1,36000,0,'+10'),(920,2,43200,1,'+12'),(920,3,39600,0,'+11'),(920,4,39600,0,'+11'),(920,5,43200,1,'+12'),(920,6,39600,1,'+11'),(920,7,36000,0,'+10'),(920,8,43200,0,'+12'),(920,9,43200,1,'+12'),(920,10,39600,0,'+11'),(921,0,29160,0,'LMT'),(921,1,28800,0,'CST'),(921,2,32400,0,'JST'),(921,3,32400,1,'CDT'),(921,4,28800,0,'CST'),(922,0,16631,0,'LMT'),(922,1,18000,0,'+05'),(922,2,25200,1,'+07'),(922,3,21600,0,'+06'),(922,4,21600,0,'+06'),(922,5,25200,1,'+07'),(922,6,21600,1,'+06'),(922,7,18000,0,'+05'),(923,0,10751,0,'LMT'),(923,1,10751,0,'TBMT'),(923,2,10800,0,'+03'),(923,3,18000,1,'+05'),(923,4,14400,0,'+04'),(923,5,14400,0,'+04'),(923,6,18000,1,'+05'),(923,7,14400,1,'+04'),(923,8,10800,0,'+03'),(923,9,14400,1,'+04'),(923,10,14400,0,'+04'),(924,0,12344,0,'LMT'),(924,1,12344,0,'TMT'),(924,2,12600,0,'+0330'),(924,3,18000,1,'+05'),(924,4,14400,0,'+04'),(924,5,16200,1,'+0430'),(924,6,12600,0,'+0330'),(925,0,8454,0,'LMT'),(925,1,8440,0,'JMT'),(925,2,10800,1,'IDT'),(925,3,7200,0,'IST'),(925,4,14400,1,'IDDT'),(925,5,10800,1,'IDT'),(926,0,21516,0,'LMT'),(926,1,19800,0,'+0530'),(926,2,21600,0,'+06'),(927,0,21516,0,'LMT'),(927,1,19800,0,'+0530'),(927,2,21600,0,'+06'),(928,0,33539,0,'LMT'),(928,1,36000,1,'JDT'),(928,2,32400,0,'JST'),(928,3,32400,0,'JST'),(929,0,20391,0,'LMT'),(929,1,21600,0,'+06'),(929,2,28800,1,'+08'),(929,3,25200,0,'+07'),(929,4,25200,0,'+07'),(929,5,28800,1,'+08'),(929,6,25200,1,'+07'),(929,7,21600,0,'+06'),(929,8,25200,1,'+07'),(929,9,25200,0,'+07'),(930,0,28656,0,'LMT'),(930,1,28656,0,'MMT'),(930,2,28800,0,'+08'),(930,3,32400,0,'+09'),(930,4,28800,0,'WITA'),(931,0,25652,0,'LMT'),(931,1,25200,0,'+07'),(931,2,32400,1,'+09'),(931,3,28800,0,'+08'),(932,0,25652,0,'LMT'),(932,1,25200,0,'+07'),(932,2,32400,1,'+09'),(932,3,28800,0,'+08'),(933,0,21020,0,'LMT'),(933,1,21600,0,'+06'),(934,0,34374,0,'LMT'),(934,1,28800,0,'+08'),(934,2,32400,0,'+09'),(934,3,39600,0,'+11'),(934,4,43200,1,'+12'),(934,5,39600,0,'+11'),(934,6,43200,1,'+12'),(934,7,39600,1,'+11'),(934,8,36000,0,'+10'),(934,9,43200,0,'+12'),(934,10,43200,1,'+12'),(934,11,36000,0,'+10'),(935,0,24124,0,'LMT'),(935,1,24124,0,'BMT'),(935,2,25200,0,'+07'),(936,0,31651,0,'LMT'),(936,1,32400,0,'+09'),(936,2,39600,1,'+11'),(936,3,36000,0,'+10'),(936,4,36000,0,'+10'),(936,5,39600,1,'+11'),(936,6,36000,1,'+10'),(936,7,32400,0,'+09'),(936,8,39600,0,'+11'),(936,9,39600,1,'+11'),(936,10,36000,0,'+10'),(937,0,31138,0,'LMT'),(937,1,28800,0,'+08'),(937,2,36000,1,'+10'),(937,3,32400,0,'+09'),(937,4,32400,0,'+09'),(937,5,36000,1,'+10'),(937,6,32400,1,'+09'),(937,7,28800,0,'+08'),(937,8,36000,0,'+10'),(937,9,36000,1,'+10'),(937,10,32400,0,'+09'),(938,0,23087,0,'LMT'),(938,1,23087,0,'RMT'),(938,2,23400,0,'+0630'),(938,3,32400,0,'+09'),(938,4,23400,0,'+0630'),(939,0,14553,0,'LMT'),(939,1,13505,0,'PMT'),(939,2,14400,0,'+04'),(939,3,21600,1,'+06'),(939,4,18000,0,'+05'),(939,5,18000,0,'+05'),(939,6,21600,1,'+06'),(939,7,18000,1,'+05'),(939,8,14400,0,'+04'),(939,9,21600,0,'+06'),(939,10,21600,1,'+06'),(939,11,18000,0,'+05'),(940,0,10680,0,'LMT'),(940,1,10800,0,'+03'),(940,2,18000,1,'+05'),(940,3,14400,0,'+04'),(940,4,14400,0,'+04'),(940,5,18000,1,'+05'),(940,6,14400,1,'+04'),(940,7,10800,0,'+03'),(940,8,18000,1,'+05'),(940,9,14400,0,'+04'),(941,0,-6160,0,'LMT'),(941,1,-6872,0,'HMT'),(941,2,-3600,1,'-01'),(941,3,-7200,0,'-02'),(941,4,-3600,1,'-01'),(941,5,-7200,0,'-02'),(941,6,-7200,0,'-02'),(941,7,0,1,'+00'),(941,8,-3600,0,'-01'),(941,9,-3600,0,'-01'),(941,10,0,0,'WET'),(941,11,0,1,'+00'),(941,12,-3600,0,'-01'),(942,0,-15558,0,'LMT'),(942,1,-14400,0,'AST'),(942,2,-10800,1,'ADT'),(943,0,-3696,0,'LMT'),(943,1,-3600,0,'-01'),(943,2,0,0,'WET'),(943,3,3600,1,'WEST'),(943,4,0,0,'WET'),(943,5,3600,1,'WEST'),(944,0,-5644,0,'LMT'),(944,1,-7200,0,'-02'),(944,2,-3600,1,'-01'),(944,3,-7200,0,'-02'),(944,4,-3600,0,'-01'),(945,0,-1624,0,'LMT'),(945,1,0,0,'WET'),(945,2,3600,1,'WEST'),(945,3,0,0,'WET'),(946,0,-1624,0,'LMT'),(946,1,0,0,'WET'),(946,2,3600,1,'WEST'),(946,3,0,0,'WET'),(947,0,2580,0,'LMT'),(947,1,7200,1,'CEST'),(947,2,3600,0,'CET'),(947,3,3600,0,'CET'),(947,4,7200,1,'CEST'),(947,5,7200,1,'CEST'),(947,6,3600,0,'CET'),(948,0,-4056,0,'LMT'),(948,1,-4056,0,'FMT'),(948,2,0,1,'+00'),(948,3,-3600,0,'-01'),(948,4,0,1,'+00'),(948,5,-3600,0,'-01'),(948,6,-3600,0,'-01'),(948,7,3600,1,'+01'),(948,8,3600,1,'WEST'),(948,9,0,0,'WET'),(948,10,0,0,'WET'),(948,11,0,0,'WET'),(948,12,3600,1,'WEST'),(949,0,-5280,0,'LMT'),(949,1,0,1,'+00'),(949,2,-3600,0,'-01'),(949,3,-3600,0,'-01'),(949,4,0,1,'+00'),(949,5,0,0,'GMT'),(950,0,-8768,0,'LMT'),(950,1,-7200,0,'-02'),(951,0,-968,0,'LMT'),(951,1,0,0,'GMT'),(952,0,-13884,0,'LMT'),(952,1,-13884,0,'SMT'),(952,2,-10800,1,'-03'),(952,3,-14400,0,'-04'),(952,4,-7200,1,'-02'),(952,5,-10800,0,'-03'),(952,6,-10800,1,'-03'),(953,0,36292,0,'LMT'),(953,1,39600,1,'AEDT'),(953,2,36000,0,'AEST'),(953,3,39600,1,'AEDT'),(953,4,36000,0,'AEST'),(954,0,32400,0,'ACST'),(954,1,37800,1,'ACDT'),(954,2,34200,0,'ACST'),(954,3,37800,1,'ACDT'),(954,4,34200,0,'ACST'),(955,0,36728,0,'LMT'),(955,1,39600,1,'AEDT'),(955,2,36000,0,'AEST'),(955,3,39600,1,'AEDT'),(955,4,36000,0,'AEST'),(956,0,32400,0,'ACST'),(956,1,37800,1,'ACDT'),(956,2,34200,0,'ACST'),(956,3,37800,1,'ACDT'),(956,4,34200,0,'ACST'),(957,0,36292,0,'LMT'),(957,1,39600,1,'AEDT'),(957,2,36000,0,'AEST'),(957,3,39600,1,'AEDT'),(957,4,36000,0,'AEST'),(958,0,34528,0,'LMT'),(958,1,36000,0,'AEST'),(958,2,39600,1,'AEDT'),(958,3,39600,1,'AEDT'),(958,4,36000,0,'AEST'),(959,0,32400,0,'ACST'),(959,1,37800,1,'ACDT'),(959,2,34200,0,'ACST'),(960,0,30928,0,'LMT'),(960,1,35100,1,'+0945'),(960,2,31500,0,'+0845'),(960,3,35100,1,'+0945'),(960,4,31500,0,'+0845'),(961,0,35356,0,'LMT'),(961,1,36000,0,'AEST'),(961,2,39600,1,'AEDT'),(961,3,39600,1,'AEDT'),(961,4,36000,0,'AEST'),(962,0,38180,0,'LMT'),(962,1,36000,0,'AEST'),(962,2,41400,1,'+1130'),(962,3,37800,0,'+1030'),(962,4,39600,1,'+11'),(963,0,35756,0,'LMT'),(963,1,39600,1,'AEDT'),(963,2,36000,0,'AEST'),(963,3,39600,1,'AEDT'),(963,4,36000,0,'AEST'),(964,0,38180,0,'LMT'),(964,1,36000,0,'AEST'),(964,2,41400,1,'+1130'),(964,3,37800,0,'+1030'),(964,4,39600,1,'+11'),(965,0,34792,0,'LMT'),(965,1,39600,1,'AEDT'),(965,2,36000,0,'AEST'),(965,3,39600,1,'AEDT'),(965,4,36000,0,'AEST'),(966,0,36292,0,'LMT'),(966,1,39600,1,'AEDT'),(966,2,36000,0,'AEST'),(966,3,39600,1,'AEDT'),(966,4,36000,0,'AEST'),(967,0,32400,0,'ACST'),(967,1,37800,1,'ACDT'),(967,2,34200,0,'ACST'),(968,0,27804,0,'LMT'),(968,1,32400,1,'AWDT'),(968,2,28800,0,'AWST'),(968,3,32400,1,'AWDT'),(968,4,28800,0,'AWST'),(969,0,36728,0,'LMT'),(969,1,39600,1,'AEDT'),(969,2,36000,0,'AEST'),(969,3,39600,1,'AEDT'),(969,4,36000,0,'AEST'),(970,0,32400,0,'ACST'),(970,1,37800,1,'ACDT'),(970,2,34200,0,'ACST'),(970,3,37800,1,'ACDT'),(970,4,34200,0,'ACST'),(971,0,36292,0,'LMT'),(971,1,39600,1,'AEDT'),(971,2,36000,0,'AEST'),(971,3,39600,1,'AEDT'),(971,4,36000,0,'AEST'),(972,0,35356,0,'LMT'),(972,1,36000,0,'AEST'),(972,2,39600,1,'AEDT'),(972,3,39600,1,'AEDT'),(972,4,36000,0,'AEST'),(973,0,34792,0,'LMT'),(973,1,39600,1,'AEDT'),(973,2,36000,0,'AEST'),(973,3,39600,1,'AEDT'),(973,4,36000,0,'AEST'),(974,0,27804,0,'LMT'),(974,1,32400,1,'AWDT'),(974,2,28800,0,'AWST'),(974,3,32400,1,'AWDT'),(974,4,28800,0,'AWST'),(975,0,32400,0,'ACST'),(975,1,37800,1,'ACDT'),(975,2,34200,0,'ACST'),(975,3,37800,1,'ACDT'),(975,4,34200,0,'ACST'),(976,0,-16272,0,'LMT'),(976,1,-14400,1,'-04'),(976,2,-18000,0,'-05'),(976,3,-14400,0,'-04'),(976,4,-18000,0,'-05'),(977,0,-7780,0,'LMT'),(977,1,-3600,1,'-01'),(977,2,-7200,0,'-02'),(978,0,-11188,0,'LMT'),(978,1,-7200,1,'-02'),(978,2,-10800,0,'-03'),(979,0,-14404,0,'LMT'),(979,1,-10800,1,'-03'),(979,2,-14400,0,'-04'),(980,0,7200,1,'CEST'),(980,1,3600,0,'CET'),(980,2,7200,1,'CEST'),(980,3,3600,0,'CET'),(981,0,-18000,1,'CDT'),(981,1,-21600,0,'CST'),(981,2,-18000,1,'CWT'),(981,3,-18000,1,'CPT'),(982,0,-15264,0,'LMT'),(982,1,-10800,1,'ADT'),(982,2,-14400,0,'AST'),(982,3,-10800,1,'AWT'),(982,4,-10800,1,'APT'),(983,0,-23316,0,'LMT'),(983,1,-18000,1,'CDT'),(983,2,-21600,0,'CST'),(983,3,-18000,1,'CWT'),(983,4,-18000,1,'CPT'),(983,5,-18000,1,'CDT'),(983,6,-21600,0,'CST'),(984,0,-19052,0,'LMT'),(984,1,-14400,1,'EDT'),(984,2,-18000,0,'EST'),(984,3,-14400,1,'EWT'),(984,4,-14400,1,'EPT'),(985,0,-27232,0,'LMT'),(985,1,-21600,1,'MDT'),(985,2,-25200,0,'MST'),(985,3,-21600,1,'MWT'),(985,4,-21600,1,'MPT'),(986,0,-12652,0,'LMT'),(986,1,-9052,1,'NDT'),(986,2,-12652,0,'NST'),(986,3,-9000,1,'NDT'),(986,4,-12600,0,'NST'),(986,5,-9000,1,'NPT'),(986,6,-9000,1,'NWT'),(986,7,-5400,1,'NDDT'),(986,8,-9000,1,'NDT'),(987,0,-29548,0,'LMT'),(987,1,-25200,1,'PDT'),(987,2,-28800,0,'PST'),(987,3,-25200,1,'PWT'),(987,4,-25200,1,'PPT'),(988,0,-25116,0,'LMT'),(988,1,-21600,1,'MDT'),(988,2,-25200,0,'MST'),(988,3,-21600,1,'MWT'),(988,4,-21600,1,'MPT'),(988,5,-21600,0,'CST'),(989,0,-32412,0,'LMT'),(989,1,-28800,1,'YDT'),(989,2,-32400,0,'YST'),(989,3,-28800,1,'YWT'),(989,4,-28800,1,'YPT'),(989,5,-25200,1,'YDDT'),(989,6,-28800,0,'PST'),(989,7,-25200,1,'PDT'),(990,0,-16966,0,'LMT'),(990,1,-16966,0,'SMT'),(990,2,-18000,0,'-05'),(990,3,-14400,0,'-04'),(990,4,-14400,1,'-04'),(990,5,-10800,1,'-03'),(990,6,-10800,1,'-03'),(990,7,-14400,0,'-04'),(991,0,-26248,0,'LMT'),(991,1,-26248,0,'EMT'),(991,2,-21600,1,'-06'),(991,3,-25200,0,'-07'),(991,4,-25200,0,'-07'),(991,5,-21600,0,'-06'),(991,6,-18000,1,'-05'),(992,0,-19768,0,'LMT'),(992,1,-19776,0,'HMT'),(992,2,-14400,1,'CDT'),(992,3,-18000,0,'CST'),(992,4,-18000,0,'CST'),(992,5,-14400,1,'CDT'),(993,0,10800,1,'EEST'),(993,1,7200,0,'EET'),(994,0,-18000,0,'EST'),(995,0,-14400,1,'EDT'),(995,1,-18000,0,'EST'),(995,2,-14400,1,'EWT'),(995,3,-14400,1,'EPT'),(996,0,7509,0,'LMT'),(996,1,10800,1,'EEST'),(996,2,7200,0,'EET'),(996,3,10800,1,'EEST'),(997,0,-1500,0,'LMT'),(997,1,-1521,0,'DMT'),(997,2,2079,1,'IST'),(997,3,3600,1,'BST'),(997,4,0,0,'GMT'),(997,5,3600,1,'IST'),(997,6,0,0,'GMT'),(997,7,0,1,'GMT'),(997,8,3600,0,'IST'),(997,9,3600,0,'IST'),(998,0,0,0,'GMT'),(999,0,0,0,'GMT'),(1000,0,-3600,0,'-01'),(1001,0,-36000,0,'-10'),(1002,0,-39600,0,'-11'),(1003,0,-43200,0,'-12'),(1004,0,-7200,0,'-02'),(1005,0,-10800,0,'-03'),(1006,0,-14400,0,'-04'),(1007,0,-18000,0,'-05'),(1008,0,-21600,0,'-06'),(1009,0,-25200,0,'-07'),(1010,0,-28800,0,'-08'),(1011,0,-32400,0,'-09'),(1012,0,0,0,'GMT'),(1013,0,3600,0,'+01'),(1014,0,36000,0,'+10'),(1015,0,39600,0,'+11'),(1016,0,43200,0,'+12'),(1017,0,46800,0,'+13'),(1018,0,50400,0,'+14'),(1019,0,7200,0,'+02'),(1020,0,10800,0,'+03'),(1021,0,14400,0,'+04'),(1022,0,18000,0,'+05'),(1023,0,21600,0,'+06'),(1024,0,25200,0,'+07'),(1025,0,28800,0,'+08'),(1026,0,32400,0,'+09'),(1027,0,0,0,'GMT'),(1028,0,0,0,'GMT'),(1029,0,0,0,'UTC'),(1030,0,0,0,'UTC'),(1031,0,0,0,'UTC'),(1032,0,0,0,'UTC'),(1033,0,1172,0,'LMT'),(1033,1,4772,1,'NST'),(1033,2,1172,0,'AMT'),(1033,3,4772,1,'NST'),(1033,4,1172,0,'AMT'),(1033,5,1200,0,'+0020'),(1033,6,4800,1,'+0120'),(1033,7,4800,1,'+0120'),(1033,8,3600,0,'CET'),(1033,9,7200,1,'CEST'),(1033,10,7200,1,'CEST'),(1033,11,7200,1,'CEST'),(1033,12,3600,0,'CET'),(1033,13,3600,0,'CET'),(1034,0,364,0,'LMT'),(1034,1,0,0,'WET'),(1034,2,3600,0,'CET'),(1034,3,7200,1,'CEST'),(1034,4,3600,0,'CET'),(1035,0,11532,0,'LMT'),(1035,1,10800,0,'+03'),(1035,2,18000,1,'+05'),(1035,3,14400,0,'+04'),(1035,4,14400,0,'+04'),(1035,5,18000,1,'+05'),(1035,6,14400,1,'+04'),(1035,7,10800,0,'+03'),(1035,8,14400,0,'+04'),(1036,0,5692,0,'LMT'),(1036,1,5692,0,'AMT'),(1036,2,10800,1,'EEST'),(1036,3,7200,0,'EET'),(1036,4,3600,0,'CET'),(1036,5,7200,1,'CEST'),(1036,6,10800,1,'EEST'),(1036,7,7200,0,'EET'),(1036,8,10800,1,'EEST'),(1036,9,7200,0,'EET'),(1037,0,-75,0,'LMT'),(1037,1,3600,1,'BST'),(1037,2,0,0,'GMT'),(1037,3,7200,1,'BDST'),(1037,4,3600,0,'BST'),(1037,5,3600,1,'BST'),(1037,6,0,0,'GMT'),(1037,7,0,0,'GMT'),(1038,0,4920,0,'LMT'),(1038,1,3600,0,'CET'),(1038,2,3600,0,'CET'),(1038,3,7200,1,'CEST'),(1038,4,7200,1,'CEST'),(1038,5,7200,1,'CEST'),(1038,6,3600,0,'CET'),(1039,0,3208,0,'LMT'),(1039,1,7200,1,'CEST'),(1039,2,3600,0,'CET'),(1039,3,7200,1,'CEST'),(1039,4,3600,0,'CET'),(1039,5,10800,1,'CEMT'),(1039,6,10800,1,'CEMT'),(1039,7,7200,1,'CEST'),(1039,8,3600,0,'CET'),(1040,0,3464,0,'PMT'),(1040,1,7200,1,'CEST'),(1040,2,3600,0,'CET'),(1040,3,7200,1,'CEST'),(1040,4,3600,0,'CET'),(1040,5,0,1,'GMT'),(1040,6,7200,1,'CEST'),(1040,7,3600,0,'CET'),(1041,0,1050,0,'BMT'),(1041,1,0,0,'WET'),(1041,2,3600,0,'CET'),(1041,3,7200,1,'CEST'),(1041,4,3600,0,'CET'),(1041,5,7200,1,'CEST'),(1041,6,3600,1,'WEST'),(1041,7,0,0,'WET'),(1041,8,0,0,'WET'),(1041,9,7200,1,'CEST'),(1041,10,3600,0,'CET'),(1042,0,6264,0,'LMT'),(1042,1,6264,0,'BMT'),(1042,2,10800,1,'EEST'),(1042,3,7200,0,'EET'),(1042,4,10800,1,'EEST'),(1042,5,7200,0,'EET'),(1042,6,10800,1,'EEST'),(1042,7,7200,0,'EET'),(1043,0,4580,0,'LMT'),(1043,1,7200,1,'CEST'),(1043,2,3600,0,'CET'),(1043,3,7200,1,'CEST'),(1043,4,3600,0,'CET'),(1043,5,3600,0,'CET'),(1043,6,7200,1,'CEST'),(1044,0,1786,0,'BMT'),(1044,1,7200,1,'CEST'),(1044,2,3600,0,'CET'),(1044,3,7200,1,'CEST'),(1044,4,3600,0,'CET'),(1045,0,6920,0,'LMT'),(1045,1,6900,0,'CMT'),(1045,2,6264,0,'BMT'),(1045,3,10800,1,'EEST'),(1045,4,7200,0,'EET'),(1045,5,7200,0,'EET'),(1045,6,10800,1,'EEST'),(1045,7,3600,0,'CET'),(1045,8,7200,1,'CEST'),(1045,9,7200,1,'CEST'),(1045,10,14400,1,'MSD'),(1045,11,10800,0,'MSK'),(1045,12,10800,0,'MSK'),(1045,13,14400,1,'MSD'),(1045,14,10800,1,'EEST'),(1045,15,7200,0,'EET'),(1046,0,3020,0,'CMT'),(1046,1,7200,1,'CEST'),(1046,2,3600,0,'CET'),(1046,3,3600,0,'CET'),(1046,4,7200,1,'CEST'),(1046,5,7200,1,'CEST'),(1046,6,3600,0,'CET'),(1047,0,-1500,0,'LMT'),(1047,1,-1521,0,'DMT'),(1047,2,2079,1,'IST'),(1047,3,3600,1,'BST'),(1047,4,0,0,'GMT'),(1047,5,3600,1,'IST'),(1047,6,0,0,'GMT'),(1047,7,0,1,'GMT'),(1047,8,3600,0,'IST'),(1047,9,3600,0,'IST'),(1048,0,-1284,0,'LMT'),(1048,1,3600,1,'BST'),(1048,2,0,0,'GMT'),(1048,3,7200,1,'BDST'),(1048,4,3600,0,'CET'),(1048,5,7200,1,'CEST'),(1048,6,3600,0,'CET'),(1049,0,-75,0,'LMT'),(1049,1,3600,1,'BST'),(1049,2,0,0,'GMT'),(1049,3,7200,1,'BDST'),(1049,4,3600,0,'BST'),(1049,5,3600,1,'BST'),(1049,6,0,0,'GMT'),(1049,7,0,0,'GMT'),(1050,0,5989,0,'LMT'),(1050,1,5989,0,'HMT'),(1050,2,10800,1,'EEST'),(1050,3,7200,0,'EET'),(1050,4,10800,1,'EEST'),(1050,5,7200,0,'EET'),(1051,0,-75,0,'LMT'),(1051,1,3600,1,'BST'),(1051,2,0,0,'GMT'),(1051,3,7200,1,'BDST'),(1051,4,3600,0,'BST'),(1051,5,3600,1,'BST'),(1051,6,0,0,'GMT'),(1051,7,0,0,'GMT'),(1052,0,6952,0,'LMT'),(1052,1,7016,0,'IMT'),(1052,2,10800,1,'EEST'),(1052,3,7200,0,'EET'),(1052,4,10800,0,'+03'),(1052,5,14400,1,'+04'),(1052,6,10800,1,'EEST'),(1052,7,7200,0,'EET'),(1052,8,10800,1,'EEST'),(1052,9,7200,0,'EET'),(1052,10,10800,0,'+03'),(1053,0,-75,0,'LMT'),(1053,1,3600,1,'BST'),(1053,2,0,0,'GMT'),(1053,3,7200,1,'BDST'),(1053,4,3600,0,'BST'),(1053,5,3600,1,'BST'),(1053,6,0,0,'GMT'),(1053,7,0,0,'GMT'),(1054,0,4920,0,'LMT'),(1054,1,7200,1,'CEST'),(1054,2,3600,0,'CET'),(1054,3,7200,1,'CEST'),(1054,4,3600,0,'CET'),(1054,5,10800,1,'EEST'),(1054,6,7200,0,'EET'),(1054,7,14400,1,'MSD'),(1054,8,10800,0,'MSK'),(1054,9,10800,0,'MSK'),(1054,10,14400,1,'MSD'),(1054,11,10800,1,'EEST'),(1054,12,7200,0,'EET'),(1054,13,10800,0,'+03'),(1054,14,7200,0,'EET'),(1055,0,7324,0,'LMT'),(1055,1,7324,0,'KMT'),(1055,2,7200,0,'EET'),(1055,3,10800,0,'MSK'),(1055,4,3600,0,'CET'),(1055,5,7200,1,'CEST'),(1055,6,7200,1,'CEST'),(1055,7,14400,1,'MSD'),(1055,8,10800,0,'MSK'),(1055,9,14400,1,'MSD'),(1055,10,10800,1,'EEST'),(1055,11,10800,1,'EEST'),(1055,12,7200,0,'EET'),(1056,0,11928,0,'LMT'),(1056,1,10800,0,'+03'),(1056,2,18000,1,'+05'),(1056,3,14400,0,'+04'),(1056,4,14400,0,'+04'),(1056,5,18000,1,'+05'),(1056,6,14400,1,'+04'),(1056,7,10800,0,'+03'),(1057,0,-2205,0,'LMT'),(1057,1,3600,1,'WEST'),(1057,2,0,0,'WET'),(1057,3,3600,1,'WEST'),(1057,4,0,0,'WET'),(1057,5,7200,1,'WEMT'),(1057,6,0,0,'WET'),(1057,7,3600,0,'CET'),(1057,8,3600,0,'CET'),(1057,9,7200,1,'CEST'),(1057,10,3600,1,'WEST'),(1057,11,0,0,'WET'),(1058,0,4920,0,'LMT'),(1058,1,3600,0,'CET'),(1058,2,3600,0,'CET'),(1058,3,7200,1,'CEST'),(1058,4,7200,1,'CEST'),(1058,5,7200,1,'CEST'),(1058,6,3600,0,'CET'),(1059,0,-75,0,'LMT'),(1059,1,3600,1,'BST'),(1059,2,0,0,'GMT'),(1059,3,7200,1,'BDST'),(1059,4,3600,0,'BST'),(1059,5,3600,1,'BST'),(1059,6,0,0,'GMT'),(1059,7,0,0,'GMT'),(1060,0,1476,0,'LMT'),(1060,1,7200,1,'CEST'),(1060,2,3600,0,'CET'),(1060,3,7200,1,'CEST'),(1060,4,3600,0,'CET'),(1060,5,3600,1,'WEST'),(1060,6,0,0,'WET'),(1060,7,0,0,'WET'),(1060,8,3600,1,'WEST'),(1060,9,3600,0,'WET'),(1060,10,7200,1,'WEST'),(1060,11,7200,1,'WEST'),(1060,12,7200,1,'CEST'),(1060,13,3600,0,'CET'),(1061,0,-884,0,'LMT'),(1061,1,3600,1,'WEST'),(1061,2,0,0,'WET'),(1061,3,7200,1,'WEMT'),(1061,4,0,0,'WET'),(1061,5,7200,1,'CEST'),(1061,6,3600,0,'CET'),(1061,7,7200,1,'CEST'),(1061,8,3600,0,'CET'),(1061,9,7200,1,'CEST'),(1061,10,3600,0,'CET'),(1062,0,3484,0,'LMT'),(1062,1,7200,1,'CEST'),(1062,2,3600,0,'CET'),(1062,3,3600,0,'CET'),(1062,4,7200,1,'CEST'),(1062,5,7200,1,'CEST'),(1062,6,3600,0,'CET'),(1063,0,5989,0,'LMT'),(1063,1,5989,0,'HMT'),(1063,2,10800,1,'EEST'),(1063,3,7200,0,'EET'),(1063,4,10800,1,'EEST'),(1063,5,7200,0,'EET'),(1064,0,6616,0,'LMT'),(1064,1,6600,0,'MMT'),(1064,2,7200,0,'EET'),(1064,3,10800,0,'MSK'),(1064,4,3600,0,'CET'),(1064,5,7200,1,'CEST'),(1064,6,7200,1,'CEST'),(1064,7,14400,1,'MSD'),(1064,8,10800,0,'MSK'),(1064,9,14400,1,'MSD'),(1064,10,10800,1,'EEST'),(1064,11,7200,0,'EET'),(1064,12,10800,0,'+03'),(1065,0,1772,0,'LMT'),(1065,1,561,0,'PMT'),(1065,2,3600,1,'WEST'),(1065,3,0,0,'WET'),(1065,4,3600,1,'WEST'),(1065,5,7200,1,'WEMT'),(1065,6,0,0,'WET'),(1065,7,7200,1,'CEST'),(1065,8,3600,0,'CET'),(1065,9,7200,1,'CEST'),(1065,10,3600,0,'CET'),(1066,0,9017,0,'LMT'),(1066,1,9017,0,'MMT'),(1066,2,12679,1,'MST'),(1066,3,9079,0,'MMT'),(1066,4,16279,1,'MDST'),(1066,5,14400,1,'MSD'),(1066,6,10800,0,'MSK'),(1066,7,14400,1,'MSD'),(1066,8,18000,1,'+05'),(1066,9,7200,0,'EET'),(1066,10,10800,0,'MSK'),(1066,11,14400,1,'MSD'),(1066,12,10800,1,'EEST'),(1066,13,7200,0,'EET'),(1066,14,14400,0,'MSK'),(1066,15,14400,1,'MSD'),(1066,16,10800,0,'MSK'),(1067,0,8008,0,'LMT'),(1067,1,10800,1,'EEST'),(1067,2,7200,0,'EET'),(1067,3,7200,0,'EET'),(1067,4,10800,1,'EEST'),(1068,0,2580,0,'LMT'),(1068,1,7200,1,'CEST'),(1068,2,3600,0,'CET'),(1068,3,3600,0,'CET'),(1068,4,7200,1,'CEST'),(1068,5,7200,1,'CEST'),(1068,6,3600,0,'CET'),(1069,0,561,0,'LMT'),(1069,1,561,0,'PMT'),(1069,2,3600,1,'WEST'),(1069,3,0,0,'WET'),(1069,4,3600,1,'WEST'),(1069,5,0,0,'WET'),(1069,6,3600,0,'CET'),(1069,7,7200,1,'CEST'),(1069,8,7200,1,'CEST'),(1069,9,7200,1,'WEMT'),(1069,10,3600,0,'CET'),(1069,11,7200,1,'CEST'),(1069,12,3600,0,'CET'),(1070,0,4920,0,'LMT'),(1070,1,3600,0,'CET'),(1070,2,3600,0,'CET'),(1070,3,7200,1,'CEST'),(1070,4,7200,1,'CEST'),(1070,5,7200,1,'CEST'),(1070,6,3600,0,'CET'),(1071,0,3464,0,'PMT'),(1071,1,7200,1,'CEST'),(1071,2,3600,0,'CET'),(1071,3,7200,1,'CEST'),(1071,4,3600,0,'CET'),(1071,5,0,1,'GMT'),(1071,6,7200,1,'CEST'),(1071,7,3600,0,'CET'),(1072,0,5794,0,'LMT'),(1072,1,5794,0,'RMT'),(1072,2,9394,1,'LST'),(1072,3,7200,0,'EET'),(1072,4,10800,0,'MSK'),(1072,5,3600,0,'CET'),(1072,6,7200,1,'CEST'),(1072,7,7200,1,'CEST'),(1072,8,14400,1,'MSD'),(1072,9,10800,0,'MSK'),(1072,10,14400,1,'MSD'),(1072,11,10800,1,'EEST'),(1072,12,7200,0,'EET'),(1072,13,10800,1,'EEST'),(1072,14,7200,0,'EET'),(1073,0,2996,0,'RMT'),(1073,1,7200,1,'CEST'),(1073,2,3600,0,'CET'),(1073,3,3600,0,'CET'),(1073,4,7200,1,'CEST'),(1073,5,7200,1,'CEST'),(1073,6,3600,0,'CET'),(1074,0,12020,0,'LMT'),(1074,1,10800,0,'+03'),(1074,2,14400,0,'+04'),(1074,3,18000,1,'+05'),(1074,4,14400,0,'+04'),(1074,5,18000,1,'+05'),(1074,6,14400,1,'+04'),(1074,7,10800,0,'+03'),(1074,8,10800,1,'+03'),(1074,9,7200,0,'+02'),(1074,10,14400,1,'+04'),(1074,11,14400,0,'+04'),(1075,0,2996,0,'RMT'),(1075,1,7200,1,'CEST'),(1075,2,3600,0,'CET'),(1075,3,3600,0,'CET'),(1075,4,7200,1,'CEST'),(1075,5,7200,1,'CEST'),(1075,6,3600,0,'CET'),(1076,0,4920,0,'LMT'),(1076,1,3600,0,'CET'),(1076,2,3600,0,'CET'),(1076,3,7200,1,'CEST'),(1076,4,7200,1,'CEST'),(1076,5,7200,1,'CEST'),(1076,6,3600,0,'CET'),(1077,0,11058,0,'LMT'),(1077,1,10800,0,'+03'),(1077,2,18000,1,'+05'),(1077,3,14400,0,'+04'),(1077,4,14400,0,'+04'),(1077,5,18000,1,'+05'),(1077,6,14400,1,'+04'),(1077,7,10800,0,'+03'),(1077,8,14400,0,'+04'),(1078,0,8184,0,'LMT'),(1078,1,8160,0,'SMT'),(1078,2,7200,0,'EET'),(1078,3,10800,0,'MSK'),(1078,4,3600,0,'CET'),(1078,5,7200,1,'CEST'),(1078,6,7200,1,'CEST'),(1078,7,14400,1,'MSD'),(1078,8,10800,0,'MSK'),(1078,9,14400,1,'MSD'),(1078,10,10800,1,'EEST'),(1078,11,10800,1,'EEST'),(1078,12,7200,0,'EET'),(1078,13,14400,0,'MSK'),(1078,14,10800,0,'MSK'),(1079,0,4920,0,'LMT'),(1079,1,3600,0,'CET'),(1079,2,3600,0,'CET'),(1079,3,7200,1,'CEST'),(1079,4,7200,1,'CEST'),(1079,5,7200,1,'CEST'),(1079,6,3600,0,'CET'),(1080,0,7016,0,'IMT'),(1080,1,7200,0,'EET'),(1080,2,3600,0,'CET'),(1080,3,7200,1,'CEST'),(1080,4,3600,0,'CET'),(1080,5,10800,1,'EEST'),(1080,6,7200,0,'EET'),(1080,7,10800,1,'EEST'),(1080,8,10800,1,'EEST'),(1080,9,7200,0,'EET'),(1081,0,3614,0,'SET'),(1081,1,3600,0,'CET'),(1081,2,7200,1,'CEST'),(1081,3,7200,1,'CEST'),(1081,4,3600,0,'CET'),(1082,0,5940,0,'LMT'),(1082,1,5940,0,'TMT'),(1082,2,7200,1,'CEST'),(1082,3,3600,0,'CET'),(1082,4,3600,0,'CET'),(1082,5,7200,0,'EET'),(1082,6,10800,0,'MSK'),(1082,7,7200,1,'CEST'),(1082,8,14400,1,'MSD'),(1082,9,10800,0,'MSK'),(1082,10,14400,1,'MSD'),(1082,11,10800,1,'EEST'),(1082,12,7200,0,'EET'),(1082,13,7200,0,'EET'),(1082,14,10800,1,'EEST'),(1082,15,10800,1,'EEST'),(1083,0,4760,0,'LMT'),(1083,1,3600,0,'CET'),(1083,2,7200,1,'CEST'),(1083,3,3600,0,'CET'),(1083,4,7200,1,'CEST'),(1084,0,6920,0,'LMT'),(1084,1,6900,0,'CMT'),(1084,2,6264,0,'BMT'),(1084,3,10800,1,'EEST'),(1084,4,7200,0,'EET'),(1084,5,7200,0,'EET'),(1084,6,10800,1,'EEST'),(1084,7,3600,0,'CET'),(1084,8,7200,1,'CEST'),(1084,9,7200,1,'CEST'),(1084,10,14400,1,'MSD'),(1084,11,10800,0,'MSK'),(1084,12,10800,0,'MSK'),(1084,13,14400,1,'MSD'),(1084,14,10800,1,'EEST'),(1084,15,7200,0,'EET'),(1085,0,11616,0,'LMT'),(1085,1,10800,0,'+03'),(1085,2,18000,1,'+05'),(1085,3,14400,0,'+04'),(1085,4,14400,0,'+04'),(1085,5,18000,1,'+05'),(1085,6,14400,1,'+04'),(1085,7,10800,0,'+03'),(1085,8,10800,1,'+03'),(1085,9,7200,0,'+02'),(1085,10,14400,1,'+04'),(1085,11,14400,0,'+04'),(1086,0,5352,0,'LMT'),(1086,1,3600,0,'CET'),(1086,2,7200,1,'CEST'),(1086,3,3600,0,'CET'),(1086,4,7200,1,'CEST'),(1086,5,14400,1,'MSD'),(1086,6,10800,0,'MSK'),(1086,7,10800,0,'MSK'),(1086,8,14400,1,'MSD'),(1086,9,7200,0,'EET'),(1086,10,10800,1,'EEST'),(1086,11,10800,1,'EEST'),(1086,12,7200,0,'EET'),(1087,0,1786,0,'BMT'),(1087,1,7200,1,'CEST'),(1087,2,3600,0,'CET'),(1087,3,7200,1,'CEST'),(1087,4,3600,0,'CET'),(1088,0,2996,0,'RMT'),(1088,1,7200,1,'CEST'),(1088,2,3600,0,'CET'),(1088,3,3600,0,'CET'),(1088,4,7200,1,'CEST'),(1088,5,7200,1,'CEST'),(1088,6,3600,0,'CET'),(1089,0,3921,0,'LMT'),(1089,1,7200,1,'CEST'),(1089,2,3600,0,'CET'),(1089,3,7200,1,'CEST'),(1089,4,3600,0,'CET'),(1089,5,7200,1,'CEST'),(1089,6,3600,0,'CET'),(1090,0,6076,0,'LMT'),(1090,1,5040,0,'WMT'),(1090,2,5736,0,'KMT'),(1090,3,3600,0,'CET'),(1090,4,7200,0,'EET'),(1090,5,10800,0,'MSK'),(1090,6,3600,0,'CET'),(1090,7,7200,1,'CEST'),(1090,8,7200,1,'CEST'),(1090,9,14400,1,'MSD'),(1090,10,10800,0,'MSK'),(1090,11,14400,1,'MSD'),(1090,12,10800,1,'EEST'),(1090,13,7200,0,'EET'),(1090,14,7200,1,'CEST'),(1090,15,3600,0,'CET'),(1090,16,7200,0,'EET'),(1090,17,10800,1,'EEST'),(1091,0,10660,0,'LMT'),(1091,1,10800,0,'+03'),(1091,2,14400,0,'+04'),(1091,3,18000,1,'+05'),(1091,4,14400,0,'+04'),(1091,5,18000,1,'+05'),(1091,6,14400,1,'+04'),(1091,7,10800,0,'+03'),(1091,8,14400,0,'+04'),(1092,0,5040,0,'LMT'),(1092,1,5040,0,'WMT'),(1092,2,7200,1,'CEST'),(1092,3,3600,0,'CET'),(1092,4,7200,1,'CEST'),(1092,5,3600,0,'CET'),(1092,6,10800,1,'EEST'),(1092,7,7200,0,'EET'),(1092,8,7200,0,'EET'),(1092,9,7200,1,'CEST'),(1092,10,3600,0,'CET'),(1093,0,4920,0,'LMT'),(1093,1,3600,0,'CET'),(1093,2,3600,0,'CET'),(1093,3,7200,1,'CEST'),(1093,4,7200,1,'CEST'),(1093,5,7200,1,'CEST'),(1093,6,3600,0,'CET'),(1094,0,8440,0,'LMT'),(1094,1,8400,0,'+0220'),(1094,2,7200,0,'EET'),(1094,3,10800,0,'MSK'),(1094,4,3600,0,'CET'),(1094,5,7200,1,'CEST'),(1094,6,7200,1,'CEST'),(1094,7,14400,1,'MSD'),(1094,8,10800,0,'MSK'),(1094,9,14400,1,'MSD'),(1094,10,10800,1,'EEST'),(1094,11,10800,1,'EEST'),(1094,12,7200,0,'EET'),(1095,0,1786,0,'BMT'),(1095,1,7200,1,'CEST'),(1095,2,3600,0,'CET'),(1095,3,7200,1,'CEST'),(1095,4,3600,0,'CET'),(1096,0,0,0,'-00'),(1097,0,-75,0,'LMT'),(1097,1,3600,1,'BST'),(1097,2,0,0,'GMT'),(1097,3,7200,1,'BDST'),(1097,4,3600,0,'BST'),(1097,5,3600,1,'BST'),(1097,6,0,0,'GMT'),(1097,7,0,0,'GMT'),(1098,0,-75,0,'LMT'),(1098,1,3600,1,'BST'),(1098,2,0,0,'GMT'),(1098,3,7200,1,'BDST'),(1098,4,3600,0,'BST'),(1098,5,3600,1,'BST'),(1098,6,0,0,'GMT'),(1098,7,0,0,'GMT'),(1099,0,0,0,'GMT'),(1100,0,0,0,'GMT'),(1101,0,0,0,'GMT'),(1102,0,0,0,'GMT'),(1103,0,0,0,'GMT'),(1104,0,-36000,0,'HST'),(1105,0,27402,0,'LMT'),(1105,1,28800,0,'HKT'),(1105,2,32400,1,'HKST'),(1105,3,30600,1,'HKWT'),(1105,4,32400,0,'JST'),(1105,5,28800,0,'HKT'),(1105,6,32400,1,'HKST'),(1106,0,-5280,0,'LMT'),(1106,1,0,1,'+00'),(1106,2,-3600,0,'-01'),(1106,3,-3600,0,'-01'),(1106,4,0,1,'+00'),(1106,5,0,0,'GMT'),(1107,0,8836,0,'LMT'),(1107,1,10800,0,'EAT'),(1107,2,9000,0,'+0230'),(1107,3,9900,0,'+0245'),(1107,4,10800,0,'EAT'),(1108,0,17380,0,'LMT'),(1108,1,18000,0,'+05'),(1108,2,21600,0,'+06'),(1109,0,25372,0,'LMT'),(1109,1,25200,0,'+07'),(1110,0,23260,0,'LMT'),(1110,1,23400,0,'+0630'),(1111,0,8836,0,'LMT'),(1111,1,10800,0,'EAT'),(1111,2,9000,0,'+0230'),(1111,3,9900,0,'+0245'),(1111,4,10800,0,'EAT'),(1112,0,0,0,'-00'),(1112,1,18000,0,'+05'),(1113,0,13308,0,'LMT'),(1113,1,14400,0,'+04'),(1114,0,17640,0,'LMT'),(1114,1,17640,0,'MMT'),(1114,2,18000,0,'+05'),(1115,0,13800,0,'LMT'),(1115,1,18000,1,'+05'),(1115,2,14400,0,'+04'),(1116,0,8836,0,'LMT'),(1116,1,10800,0,'EAT'),(1116,2,9000,0,'+0230'),(1116,3,9900,0,'+0245'),(1116,4,10800,0,'EAT'),(1117,0,13312,0,'LMT'),(1117,1,14400,0,'+04'),(1118,0,12344,0,'LMT'),(1118,1,12344,0,'TMT'),(1118,2,12600,0,'+0330'),(1118,3,18000,1,'+05'),(1118,4,14400,0,'+04'),(1118,5,16200,1,'+0430'),(1118,6,12600,0,'+0330'),(1119,0,8454,0,'LMT'),(1119,1,8440,0,'JMT'),(1119,2,10800,1,'IDT'),(1119,3,7200,0,'IST'),(1119,4,14400,1,'IDDT'),(1119,5,10800,1,'IDT'),(1120,0,-18430,0,'LMT'),(1120,1,-18430,0,'KMT'),(1120,2,-18000,0,'EST'),(1120,3,-14400,1,'EDT'),(1121,0,33539,0,'LMT'),(1121,1,36000,1,'JDT'),(1121,2,32400,0,'JST'),(1121,3,32400,0,'JST'),(1122,0,40160,0,'LMT'),(1122,1,39600,0,'+11'),(1122,2,36000,0,'+10'),(1122,3,32400,0,'+09'),(1122,4,-43200,0,'-12'),(1122,5,43200,0,'+12'),(1123,0,3164,0,'LMT'),(1123,1,7200,1,'CEST'),(1123,2,3600,0,'CET'),(1123,3,7200,0,'EET'),(1124,0,7200,1,'MEST'),(1124,1,3600,0,'MET'),(1124,2,7200,1,'MEST'),(1124,3,3600,0,'MET'),(1125,0,-25200,0,'MST'),(1126,0,-21600,1,'MDT'),(1126,1,-25200,0,'MST'),(1126,2,-21600,1,'MWT'),(1126,3,-21600,1,'MPT'),(1127,0,-28084,0,'LMT'),(1127,1,-25200,0,'MST'),(1127,2,-28800,0,'PST'),(1127,3,-25200,1,'PDT'),(1127,4,-25200,1,'PWT'),(1127,5,-25200,1,'PPT'),(1128,0,-25540,0,'LMT'),(1128,1,-25200,0,'MST'),(1128,2,-21600,0,'CST'),(1128,3,-28800,0,'PST'),(1128,4,-21600,1,'MDT'),(1128,5,-25200,0,'MST'),(1129,0,-23796,0,'LMT'),(1129,1,-25200,0,'MST'),(1129,2,-21600,0,'CST'),(1129,3,-18000,1,'CDT'),(1129,4,-18000,1,'CWT'),(1130,0,41944,0,'LMT'),(1130,1,45000,1,'NZST'),(1130,2,41400,0,'NZMT'),(1130,3,43200,1,'NZST'),(1130,4,46800,1,'NZDT'),(1130,5,43200,0,'NZST'),(1130,6,43200,0,'NZST'),(1131,0,44028,0,'LMT'),(1131,1,44100,0,'+1215'),(1131,2,49500,1,'+1345'),(1131,3,45900,0,'+1245'),(1131,4,45900,0,'+1245'),(1132,0,-25196,0,'LMT'),(1132,1,-21600,1,'MDT'),(1132,2,-25200,0,'MST'),(1132,3,-21600,1,'MWT'),(1132,4,-21600,1,'MPT'),(1133,0,29143,0,'LMT'),(1133,1,32400,1,'CDT'),(1133,2,28800,0,'CST'),(1134,0,-25200,1,'PDT'),(1134,1,-28800,0,'PST'),(1134,2,-25200,1,'PWT'),(1134,3,-25200,1,'PPT'),(1135,0,45184,0,'LMT'),(1135,1,-41216,0,'LMT'),(1135,2,-41400,0,'-1130'),(1135,3,-36000,1,'-10'),(1135,4,-39600,0,'-11'),(1135,5,46800,0,'+13'),(1135,6,50400,1,'+14'),(1136,0,41944,0,'LMT'),(1136,1,45000,1,'NZST'),(1136,2,41400,0,'NZMT'),(1136,3,43200,1,'NZST'),(1136,4,46800,1,'NZDT'),(1136,5,43200,0,'NZST'),(1136,6,43200,0,'NZST'),(1137,0,35312,0,'PMMT'),(1137,1,36000,0,'+10'),(1137,2,32400,0,'+09'),(1137,3,39600,0,'+11'),(1138,0,44028,0,'LMT'),(1138,1,44100,0,'+1215'),(1138,2,49500,1,'+1345'),(1138,3,45900,0,'+1245'),(1138,4,45900,0,'+1245'),(1139,0,36428,0,'LMT'),(1139,1,36000,0,'+10'),(1139,2,32400,0,'+09'),(1139,3,36000,0,'+10'),(1140,0,-26248,0,'LMT'),(1140,1,-26248,0,'EMT'),(1140,2,-21600,1,'-06'),(1140,3,-25200,0,'-07'),(1140,4,-25200,0,'-07'),(1140,5,-21600,0,'-06'),(1140,6,-18000,1,'-05'),(1141,0,40396,0,'LMT'),(1141,1,43200,1,'+12'),(1141,2,39600,0,'+11'),(1142,0,-41060,0,'LMT'),(1142,1,-43200,0,'-12'),(1142,2,-39600,0,'-11'),(1142,3,46800,0,'+13'),(1143,0,-41096,0,'LMT'),(1143,1,-39600,0,'-11'),(1143,2,46800,0,'+13'),(1144,0,42944,0,'LMT'),(1144,1,46800,1,'+13'),(1144,2,43200,0,'+12'),(1145,0,43012,0,'LMT'),(1145,1,43200,0,'+12'),(1146,0,-21504,0,'LMT'),(1146,1,-18000,0,'-05'),(1146,2,-18000,1,'-05'),(1146,3,-21600,0,'-06'),(1147,0,-32388,0,'LMT'),(1147,1,-32400,0,'-09'),(1148,0,38388,0,'LMT'),(1148,1,39600,0,'+11'),(1149,0,34740,0,'LMT'),(1149,1,36000,0,'GST'),(1149,2,32400,0,'+09'),(1149,3,39600,1,'GDT'),(1149,4,36000,0,'ChST'),(1150,0,-37886,0,'LMT'),(1150,1,-37800,0,'HST'),(1150,2,-34200,1,'HDT'),(1150,3,-34200,1,'HWT'),(1150,4,-34200,1,'HPT'),(1150,5,-36000,0,'HST'),(1151,0,-37886,0,'LMT'),(1151,1,-37800,0,'HST'),(1151,2,-34200,1,'HDT'),(1151,3,-34200,1,'HWT'),(1151,4,-34200,1,'HPT'),(1151,5,-36000,0,'HST'),(1152,0,-37760,0,'LMT'),(1152,1,-38400,0,'-1040'),(1152,2,-36000,0,'-10'),(1152,3,50400,0,'+14'),(1153,0,39116,0,'LMT'),(1153,1,39600,0,'+11'),(1153,2,32400,0,'+09'),(1153,3,36000,0,'+10'),(1153,4,43200,0,'+12'),(1153,5,39600,0,'+11'),(1154,0,40160,0,'LMT'),(1154,1,39600,0,'+11'),(1154,2,36000,0,'+10'),(1154,3,32400,0,'+09'),(1154,4,-43200,0,'-12'),(1154,5,43200,0,'+12'),(1155,0,41088,0,'LMT'),(1155,1,39600,0,'+11'),(1155,2,32400,0,'+09'),(1155,3,36000,0,'+10'),(1155,4,43200,0,'+12'),(1156,0,-33480,0,'LMT'),(1156,1,-34200,0,'-0930'),(1157,0,45432,0,'LMT'),(1157,1,-40968,0,'LMT'),(1157,2,-39600,0,'SST'),(1158,0,40060,0,'LMT'),(1158,1,41400,0,'+1130'),(1158,2,32400,0,'+09'),(1158,3,43200,0,'+12'),(1159,0,-40780,0,'LMT'),(1159,1,-40800,0,'-1120'),(1159,2,-41400,0,'-1130'),(1159,3,-39600,0,'-11'),(1160,0,40312,0,'LMT'),(1160,1,40320,0,'+1112'),(1160,2,41400,0,'+1130'),(1160,3,45000,1,'+1230'),(1160,4,41400,0,'+1130'),(1160,5,39600,0,'+11'),(1160,6,43200,1,'+12'),(1160,7,39600,0,'+11'),(1161,0,39948,0,'LMT'),(1161,1,43200,1,'+12'),(1161,2,39600,0,'+11'),(1161,3,43200,1,'+12'),(1161,4,39600,0,'+11'),(1162,0,45432,0,'LMT'),(1162,1,-40968,0,'LMT'),(1162,2,-39600,0,'SST'),(1163,0,32276,0,'LMT'),(1163,1,32400,0,'+09'),(1164,0,-31220,0,'LMT'),(1164,1,-30600,0,'-0830'),(1164,2,-28800,0,'-08'),(1165,0,37972,0,'LMT'),(1165,1,39600,0,'+11'),(1165,2,32400,0,'+09'),(1165,3,36000,0,'+10'),(1165,4,39600,0,'+11'),(1166,0,37972,0,'LMT'),(1166,1,39600,0,'+11'),(1166,2,32400,0,'+09'),(1166,3,36000,0,'+10'),(1166,4,39600,0,'+11'),(1167,0,35312,0,'PMMT'),(1167,1,36000,0,'+10'),(1168,0,-38344,0,'LMT'),(1168,1,-37800,0,'-1030'),(1168,2,-36000,0,'-10'),(1168,3,-34200,1,'-0930'),(1169,0,34740,0,'LMT'),(1169,1,36000,0,'GST'),(1169,2,32400,0,'+09'),(1169,3,39600,1,'GDT'),(1169,4,36000,0,'ChST'),(1170,0,45432,0,'LMT'),(1170,1,-40968,0,'LMT'),(1170,2,-39600,0,'SST'),(1171,0,-35896,0,'LMT'),(1171,1,-36000,0,'-10'),(1172,0,41524,0,'LMT'),(1172,1,43200,0,'+12'),(1173,0,44360,0,'LMT'),(1173,1,44400,0,'+1220'),(1173,2,46800,0,'+13'),(1173,3,50400,1,'+14'),(1173,4,46800,0,'+13'),(1173,5,50400,1,'+14'),(1174,0,36428,0,'LMT'),(1174,1,36000,0,'+10'),(1174,2,32400,0,'+09'),(1174,3,36000,0,'+10'),(1175,0,39988,0,'LMT'),(1175,1,43200,0,'+12'),(1176,0,44120,0,'LMT'),(1176,1,43200,0,'+12'),(1177,0,36428,0,'LMT'),(1177,1,36000,0,'+10'),(1177,2,32400,0,'+09'),(1177,3,36000,0,'+10'),(1178,0,5040,0,'LMT'),(1178,1,5040,0,'WMT'),(1178,2,7200,1,'CEST'),(1178,3,3600,0,'CET'),(1178,4,7200,1,'CEST'),(1178,5,3600,0,'CET'),(1178,6,10800,1,'EEST'),(1178,7,7200,0,'EET'),(1178,8,7200,0,'EET'),(1178,9,7200,1,'CEST'),(1178,10,3600,0,'CET'),(1179,0,-2205,0,'LMT'),(1179,1,3600,1,'WEST'),(1179,2,0,0,'WET'),(1179,3,3600,1,'WEST'),(1179,4,0,0,'WET'),(1179,5,7200,1,'WEMT'),(1179,6,0,0,'WET'),(1179,7,3600,0,'CET'),(1179,8,3600,0,'CET'),(1179,9,7200,1,'CEST'),(1179,10,3600,1,'WEST'),(1179,11,0,0,'WET'),(1180,0,29160,0,'LMT'),(1180,1,28800,0,'CST'),(1180,2,32400,0,'JST'),(1180,3,32400,1,'CDT'),(1180,4,28800,0,'CST'),(1181,0,30472,0,'LMT'),(1181,1,30600,0,'KST'),(1181,2,32400,0,'JST'),(1181,3,36000,1,'KDT'),(1181,4,32400,0,'KST'),(1181,5,34200,1,'KDT'),(1181,6,36000,1,'KDT'),(1182,0,24925,0,'LMT'),(1182,1,24925,0,'SMT'),(1182,2,25200,0,'+07'),(1182,3,26400,1,'+0720'),(1182,4,26400,0,'+0720'),(1182,5,27000,0,'+0730'),(1182,6,32400,0,'+09'),(1182,7,28800,0,'+08'),(1183,0,-15865,0,'LMT'),(1183,1,-14400,0,'AST'),(1183,2,-10800,1,'APT'),(1183,3,-10800,1,'AWT'),(1184,0,-15264,0,'LMT'),(1184,1,-10800,1,'ADT'),(1184,2,-14400,0,'AST'),(1184,3,-10800,1,'AWT'),(1184,4,-10800,1,'APT'),(1185,0,-25116,0,'LMT'),(1185,1,-21600,1,'MDT'),(1185,2,-25200,0,'MST'),(1185,3,-21600,1,'MWT'),(1185,4,-21600,1,'MPT'),(1185,5,-21600,0,'CST'),(1186,0,-21036,0,'LMT'),(1186,1,-18000,1,'CDT'),(1186,2,-21600,0,'CST'),(1186,3,-18000,0,'EST'),(1186,4,-18000,1,'CWT'),(1186,5,-18000,1,'CPT'),(1186,6,-21600,0,'CST'),(1187,0,-19088,0,'LMT'),(1187,1,-19176,0,'CMT'),(1187,2,-18000,0,'EST'),(1188,0,-17762,0,'LMT'),(1188,1,-14400,1,'EDT'),(1188,2,-18000,0,'EST'),(1188,3,-14400,1,'EWT'),(1188,4,-14400,1,'EPT'),(1189,0,-37886,0,'LMT'),(1189,1,-37800,0,'HST'),(1189,2,-34200,1,'HDT'),(1189,3,-34200,1,'HWT'),(1189,4,-34200,1,'HPT'),(1189,5,-36000,0,'HST'),(1190,0,-26898,0,'LMT'),(1190,1,-21600,1,'MDT'),(1190,2,-25200,0,'MST'),(1190,3,-21600,1,'MWT'),(1191,0,-25196,0,'LMT'),(1191,1,-21600,1,'MDT'),(1191,2,-25200,0,'MST'),(1191,3,-21600,1,'MWT'),(1191,4,-21600,1,'MPT'),(1192,0,-31220,0,'LMT'),(1192,1,-30600,0,'-0830'),(1192,2,-28800,0,'-08'),(1193,0,-28378,0,'LMT'),(1193,1,-25200,1,'PDT'),(1193,2,-28800,0,'PST'),(1193,3,-25200,1,'PWT'),(1193,4,-25200,1,'PPT'),(1194,0,-32388,0,'LMT'),(1194,1,-32400,0,'-09'),(1195,0,-35976,0,'LMT'),(1195,1,-36000,0,'AST'),(1195,2,-32400,1,'AWT'),(1195,3,-32400,1,'APT'),(1195,4,-36000,0,'AHST'),(1195,5,-32400,1,'AHDT'),(1195,6,-32400,0,'YST'),(1195,7,-28800,1,'AKDT'),(1195,8,-32400,0,'AKST'),(1196,0,6952,0,'LMT'),(1196,1,7016,0,'IMT'),(1196,2,10800,1,'EEST'),(1196,3,7200,0,'EET'),(1196,4,10800,0,'+03'),(1196,5,14400,1,'+04'),(1196,6,10800,1,'EEST'),(1196,7,7200,0,'EET'),(1196,8,10800,1,'EEST'),(1196,9,7200,0,'EET'),(1196,10,10800,0,'+03'),(1197,0,0,0,'UTC'),(1198,0,-35976,0,'LMT'),(1198,1,-36000,0,'AST'),(1198,2,-32400,1,'AWT'),(1198,3,-32400,1,'APT'),(1198,4,-36000,0,'AHST'),(1198,5,-32400,1,'AHDT'),(1198,6,-32400,0,'YST'),(1198,7,-28800,1,'AKDT'),(1198,8,-32400,0,'AKST'),(1199,0,-42398,0,'LMT'),(1199,1,-39600,0,'NST'),(1199,2,-36000,1,'NWT'),(1199,3,-36000,1,'NPT'),(1199,4,-39600,0,'BST'),(1199,5,-36000,1,'BDT'),(1199,6,-36000,0,'AHST'),(1199,7,-32400,1,'HDT'),(1199,8,-36000,0,'HST'),(1200,0,-26898,0,'LMT'),(1200,1,-21600,1,'MDT'),(1200,2,-25200,0,'MST'),(1200,3,-21600,1,'MWT'),(1201,0,-21036,0,'LMT'),(1201,1,-18000,1,'CDT'),(1201,2,-21600,0,'CST'),(1201,3,-18000,0,'EST'),(1201,4,-18000,1,'CWT'),(1201,5,-18000,1,'CPT'),(1201,6,-21600,0,'CST'),(1202,0,-20678,0,'LMT'),(1202,1,-18000,1,'CDT'),(1202,2,-21600,0,'CST'),(1202,3,-18000,1,'CWT'),(1202,4,-18000,1,'CPT'),(1202,5,-18000,0,'EST'),(1202,6,-14400,1,'EDT'),(1203,0,-17762,0,'LMT'),(1203,1,-14400,1,'EDT'),(1203,2,-18000,0,'EST'),(1203,3,-14400,1,'EWT'),(1203,4,-14400,1,'EPT'),(1204,0,-37886,0,'LMT'),(1204,1,-37800,0,'HST'),(1204,2,-34200,1,'HDT'),(1204,3,-34200,1,'HWT'),(1204,4,-34200,1,'HPT'),(1204,5,-36000,0,'HST'),(1205,0,-20790,0,'LMT'),(1205,1,-18000,1,'CDT'),(1205,2,-21600,0,'CST'),(1205,3,-18000,1,'CWT'),(1205,4,-18000,1,'CPT'),(1205,5,-18000,0,'EST'),(1205,6,-21600,0,'CST'),(1206,0,-19931,0,'LMT'),(1206,1,-21600,0,'CST'),(1206,2,-18000,0,'EST'),(1206,3,-14400,1,'EWT'),(1206,4,-14400,1,'EPT'),(1206,5,-14400,1,'EDT'),(1207,0,-25196,0,'LMT'),(1207,1,-21600,1,'MDT'),(1207,2,-25200,0,'MST'),(1207,3,-21600,1,'MWT'),(1207,4,-21600,1,'MPT'),(1208,0,-28378,0,'LMT'),(1208,1,-25200,1,'PDT'),(1208,2,-28800,0,'PST'),(1208,3,-25200,1,'PWT'),(1208,4,-25200,1,'PPT'),(1209,0,-28378,0,'LMT'),(1209,1,-25200,1,'PDT'),(1209,2,-28800,0,'PST'),(1209,3,-25200,1,'PWT'),(1209,4,-25200,1,'PPT'),(1210,0,45432,0,'LMT'),(1210,1,-40968,0,'LMT'),(1210,2,-39600,0,'SST'),(1211,0,0,0,'UTC'),(1212,0,0,0,'UTC'),(1213,0,9017,0,'LMT'),(1213,1,9017,0,'MMT'),(1213,2,12679,1,'MST'),(1213,3,9079,0,'MMT'),(1213,4,16279,1,'MDST'),(1213,5,14400,1,'MSD'),(1213,6,10800,0,'MSK'),(1213,7,14400,1,'MSD'),(1213,8,18000,1,'+05'),(1213,9,7200,0,'EET'),(1213,10,10800,0,'MSK'),(1213,11,14400,1,'MSD'),(1213,12,10800,1,'EEST'),(1213,13,7200,0,'EET'),(1213,14,14400,0,'MSK'),(1213,15,14400,1,'MSD'),(1213,16,10800,0,'MSK'),(1214,0,3600,1,'WEST'),(1214,1,0,0,'WET'),(1215,0,0,0,'UTC'),(1216,0,-17762,0,'LMT'),(1216,1,-14400,1,'EDT'),(1216,2,-18000,0,'EST'),(1216,3,-14400,1,'EWT'),(1216,4,-14400,1,'EPT'),(1217,0,-968,0,'LMT'),(1217,1,0,0,'GMT'),(1218,0,-52,0,'LMT'),(1218,1,1200,1,'+0020'),(1218,2,0,0,'GMT'),(1219,0,8836,0,'LMT'),(1219,1,10800,0,'EAT'),(1219,2,9000,0,'+0230'),(1219,3,9900,0,'+0245'),(1219,4,10800,0,'EAT'),(1220,0,732,0,'LMT'),(1220,1,561,0,'PMT'),(1220,2,3600,1,'WEST'),(1220,3,0,0,'WET'),(1220,4,0,0,'WET'),(1220,5,7200,1,'CEST'),(1220,6,3600,0,'CET'),(1220,7,3600,1,'WEST'),(1221,0,8836,0,'LMT'),(1221,1,10800,0,'EAT'),(1221,2,9000,0,'+0230'),(1221,3,9900,0,'+0245'),(1221,4,10800,0,'EAT'),(1222,0,8836,0,'LMT'),(1222,1,10800,0,'EAT'),(1222,2,9000,0,'+0230'),(1222,3,9900,0,'+0245'),(1222,4,10800,0,'EAT'),(1223,0,-968,0,'LMT'),(1223,1,0,0,'GMT'),(1224,0,816,0,'LMT'),(1224,1,3600,0,'WAT'),(1225,0,-968,0,'LMT'),(1225,1,0,0,'GMT'),(1226,0,-3740,0,'LMT'),(1226,1,-3600,0,'-01'),(1226,2,0,0,'GMT'),(1227,0,7820,0,'LMT'),(1227,1,7200,0,'CAT'),(1228,0,816,0,'LMT'),(1228,1,3600,0,'WAT'),(1229,0,7820,0,'LMT'),(1229,1,7200,0,'CAT'),(1230,0,7509,0,'LMT'),(1230,1,10800,1,'EEST'),(1230,2,7200,0,'EET'),(1230,3,10800,1,'EEST'),(1231,0,-1820,0,'LMT'),(1231,1,3600,1,'+01'),(1231,2,0,0,'+00'),(1231,3,3600,0,'+01'),(1231,4,0,1,'+00'),(1232,0,-1276,0,'LMT'),(1232,1,0,0,'WET'),(1232,2,3600,1,'WEST'),(1232,3,0,0,'WET'),(1232,4,3600,0,'CET'),(1232,5,7200,1,'CEST'),(1232,6,3600,0,'CET'),(1233,0,-968,0,'LMT'),(1233,1,0,0,'GMT'),(1234,0,-968,0,'LMT'),(1234,1,0,0,'GMT'),(1235,0,8836,0,'LMT'),(1235,1,10800,0,'EAT'),(1235,2,9000,0,'+0230'),(1235,3,9900,0,'+0245'),(1235,4,10800,0,'EAT'),(1236,0,8836,0,'LMT'),(1236,1,10800,0,'EAT'),(1236,2,9000,0,'+0230'),(1236,3,9900,0,'+0245'),(1236,4,10800,0,'EAT'),(1237,0,816,0,'LMT'),(1237,1,3600,0,'WAT'),(1238,0,-3168,0,'LMT'),(1238,1,-3600,0,'-01'),(1238,2,3600,1,'+01'),(1238,3,0,0,'+00'),(1238,4,0,1,'+00'),(1238,5,3600,0,'+01'),(1239,0,-968,0,'LMT'),(1239,1,0,0,'GMT'),(1240,0,7820,0,'LMT'),(1240,1,7200,0,'CAT'),(1241,0,7820,0,'LMT'),(1241,1,7200,0,'CAT'),(1242,0,6720,0,'LMT'),(1242,1,5400,0,'SAST'),(1242,2,10800,1,'SAST'),(1242,3,7200,0,'SAST'),(1243,0,7588,0,'LMT'),(1243,1,10800,1,'CAST'),(1243,2,7200,0,'CAT'),(1243,3,10800,0,'EAT'),(1244,0,8836,0,'LMT'),(1244,1,10800,0,'EAT'),(1244,2,9000,0,'+0230'),(1244,3,9900,0,'+0245'),(1244,4,10800,0,'EAT'),(1245,0,7808,0,'LMT'),(1245,1,10800,1,'CAST'),(1245,2,7200,0,'CAT'),(1245,3,10800,0,'EAT'),(1245,4,7200,0,'CAT'),(1246,0,7820,0,'LMT'),(1246,1,7200,0,'CAT'),(1247,0,816,0,'LMT'),(1247,1,3600,0,'WAT'),(1248,0,816,0,'LMT'),(1248,1,3600,0,'WAT'),(1249,0,816,0,'LMT'),(1249,1,3600,0,'WAT'),(1250,0,-968,0,'LMT'),(1250,1,0,0,'GMT'),(1251,0,816,0,'LMT'),(1251,1,3600,0,'WAT'),(1252,0,7820,0,'LMT'),(1252,1,7200,0,'CAT'),(1253,0,7820,0,'LMT'),(1253,1,7200,0,'CAT'),(1254,0,816,0,'LMT'),(1254,1,3600,0,'WAT'),(1255,0,7820,0,'LMT'),(1255,1,7200,0,'CAT'),(1256,0,6720,0,'LMT'),(1256,1,5400,0,'SAST'),(1256,2,10800,1,'SAST'),(1256,3,7200,0,'SAST'),(1257,0,6720,0,'LMT'),(1257,1,5400,0,'SAST'),(1257,2,10800,1,'SAST'),(1257,3,7200,0,'SAST'),(1258,0,8836,0,'LMT'),(1258,1,10800,0,'EAT'),(1258,2,9000,0,'+0230'),(1258,3,9900,0,'+0245'),(1258,4,10800,0,'EAT'),(1259,0,-2588,0,'LMT'),(1259,1,-2588,0,'MMT'),(1259,2,-2670,0,'MMT'),(1259,3,0,0,'GMT'),(1260,0,8836,0,'LMT'),(1260,1,10800,0,'EAT'),(1260,2,9000,0,'+0230'),(1260,3,9900,0,'+0245'),(1260,4,10800,0,'EAT'),(1261,0,3612,0,'LMT'),(1261,1,3600,0,'WAT'),(1261,2,7200,1,'WAST'),(1262,0,816,0,'LMT'),(1262,1,3600,0,'WAT'),(1263,0,-968,0,'LMT'),(1263,1,0,0,'GMT'),(1264,0,-968,0,'LMT'),(1264,1,0,0,'GMT'),(1265,0,816,0,'LMT'),(1265,1,3600,0,'WAT'),(1266,0,1616,0,'LMT'),(1266,1,-2205,0,'LMT'),(1266,2,0,0,'GMT'),(1266,3,3600,0,'WAT'),(1266,4,0,0,'GMT'),(1267,0,-968,0,'LMT'),(1267,1,0,0,'GMT'),(1268,0,3164,0,'LMT'),(1268,1,7200,1,'CEST'),(1268,2,3600,0,'CET'),(1268,3,7200,0,'EET'),(1269,0,2444,0,'LMT'),(1269,1,561,0,'PMT'),(1269,2,7200,1,'CEST'),(1269,3,3600,0,'CET'),(1269,4,3600,0,'CET'),(1269,5,7200,1,'CEST'),(1270,0,4104,0,'LMT'),(1270,1,5400,0,'+0130'),(1270,2,7200,0,'SAST'),(1270,3,10800,1,'SAST'),(1270,4,3600,1,'WAT'),(1270,5,7200,0,'CAT'),(1271,0,-42398,0,'LMT'),(1271,1,-39600,0,'NST'),(1271,2,-36000,1,'NWT'),(1271,3,-36000,1,'NPT'),(1271,4,-39600,0,'BST'),(1271,5,-36000,1,'BDT'),(1271,6,-36000,0,'AHST'),(1271,7,-32400,1,'HDT'),(1271,8,-36000,0,'HST'),(1272,0,-35976,0,'LMT'),(1272,1,-36000,0,'AST'),(1272,2,-32400,1,'AWT'),(1272,3,-32400,1,'APT'),(1272,4,-36000,0,'AHST'),(1272,5,-32400,1,'AHDT'),(1272,6,-32400,0,'YST'),(1272,7,-28800,1,'AKDT'),(1272,8,-32400,0,'AKST'),(1273,0,-14764,0,'LMT'),(1273,1,-14400,0,'AST'),(1274,0,-14764,0,'LMT'),(1274,1,-14400,0,'AST'),(1275,0,-11568,0,'LMT'),(1275,1,-7200,1,'-02'),(1275,2,-10800,0,'-03'),(1276,0,-14028,0,'LMT'),(1276,1,-15408,0,'CMT'),(1276,2,-14400,0,'-04'),(1276,3,-10800,1,'-03'),(1276,4,-7200,1,'-02'),(1276,5,-10800,0,'-03'),(1277,0,-15788,0,'LMT'),(1277,1,-15408,0,'CMT'),(1277,2,-14400,0,'-04'),(1277,3,-10800,1,'-03'),(1277,4,-7200,1,'-02'),(1277,5,-10800,0,'-03'),(1278,0,-15788,0,'LMT'),(1278,1,-15408,0,'CMT'),(1278,2,-14400,0,'-04'),(1278,3,-10800,1,'-03'),(1278,4,-7200,1,'-02'),(1278,5,-10800,0,'-03'),(1279,0,-15408,0,'LMT'),(1279,1,-15408,0,'CMT'),(1279,2,-14400,0,'-04'),(1279,3,-10800,1,'-03'),(1279,4,-7200,1,'-02'),(1279,5,-10800,0,'-03'),(1280,0,-15672,0,'LMT'),(1280,1,-15408,0,'CMT'),(1280,2,-14400,0,'-04'),(1280,3,-10800,1,'-03'),(1280,4,-7200,1,'-02'),(1280,5,-10800,0,'-03'),(1281,0,-16044,0,'LMT'),(1281,1,-15408,0,'CMT'),(1281,2,-14400,0,'-04'),(1281,3,-10800,1,'-03'),(1281,4,-7200,1,'-02'),(1281,5,-10800,0,'-03'),(1282,0,-16516,0,'LMT'),(1282,1,-15408,0,'CMT'),(1282,2,-14400,0,'-04'),(1282,3,-10800,1,'-03'),(1282,4,-7200,1,'-02'),(1282,5,-10800,0,'-03'),(1283,0,-16612,0,'LMT'),(1283,1,-15408,0,'CMT'),(1283,2,-14400,0,'-04'),(1283,3,-10800,1,'-03'),(1283,4,-7200,1,'-02'),(1283,5,-10800,0,'-03'),(1284,0,-15700,0,'LMT'),(1284,1,-15408,0,'CMT'),(1284,2,-14400,0,'-04'),(1284,3,-10800,1,'-03'),(1284,4,-7200,1,'-02'),(1284,5,-10800,0,'-03'),(1285,0,-16444,0,'LMT'),(1285,1,-15408,0,'CMT'),(1285,2,-14400,0,'-04'),(1285,3,-10800,1,'-03'),(1285,4,-7200,1,'-02'),(1285,5,-10800,0,'-03'),(1286,0,-15924,0,'LMT'),(1286,1,-15408,0,'CMT'),(1286,2,-14400,0,'-04'),(1286,3,-10800,1,'-03'),(1286,4,-7200,1,'-02'),(1286,5,-10800,0,'-03'),(1286,6,-10800,1,'-03'),(1287,0,-15652,0,'LMT'),(1287,1,-15408,0,'CMT'),(1287,2,-14400,0,'-04'),(1287,3,-10800,1,'-03'),(1287,4,-7200,1,'-02'),(1287,5,-10800,0,'-03'),(1288,0,-16392,0,'LMT'),(1288,1,-15408,0,'CMT'),(1288,2,-14400,0,'-04'),(1288,3,-10800,1,'-03'),(1288,4,-7200,1,'-02'),(1288,5,-10800,0,'-03'),(1289,0,-16547,0,'LMT'),(1289,1,-16200,0,'-0430'),(1289,2,-14400,0,'AST'),(1290,0,-13840,0,'LMT'),(1290,1,-13840,0,'AMT'),(1290,2,-14400,0,'-04'),(1290,3,-10800,0,'-03'),(1290,4,-10800,1,'-03'),(1290,5,-14400,0,'-04'),(1291,0,-21988,0,'LMT'),(1291,1,-18000,1,'CDT'),(1291,2,-21600,0,'CST'),(1291,3,-18000,1,'CWT'),(1291,4,-18000,1,'CPT'),(1291,5,-18000,0,'EST'),(1292,0,-42398,0,'LMT'),(1292,1,-39600,0,'NST'),(1292,2,-36000,1,'NWT'),(1292,3,-36000,1,'NPT'),(1292,4,-39600,0,'BST'),(1292,5,-36000,1,'BDT'),(1292,6,-36000,0,'AHST'),(1292,7,-32400,1,'HDT'),(1292,8,-36000,0,'HST'),(1293,0,-9244,0,'LMT'),(1293,1,-7200,1,'-02'),(1293,2,-10800,0,'-03'),(1294,0,-25260,0,'LMT'),(1294,1,-25200,0,'MST'),(1294,2,-21600,0,'CST'),(1294,3,-28800,0,'PST'),(1294,4,-21600,1,'MDT'),(1294,5,-18000,1,'CDT'),(1294,6,-21600,0,'CST'),(1295,0,-14309,0,'LMT'),(1295,1,-14309,0,'BMT'),(1295,2,-10800,1,'ADT'),(1295,3,-14400,0,'AST'),(1296,0,-11636,0,'LMT'),(1296,1,-7200,1,'-02'),(1296,2,-10800,0,'-03'),(1297,0,-21168,0,'LMT'),(1297,1,-19800,1,'-0530'),(1297,2,-21600,0,'CST'),(1297,3,-18000,1,'CDT'),(1298,0,-13708,0,'LMT'),(1298,1,-10800,1,'ADT'),(1298,2,-14400,0,'AST'),(1298,3,-10800,1,'AWT'),(1298,4,-10800,1,'APT'),(1299,0,-14560,0,'LMT'),(1299,1,-10800,1,'-03'),(1299,2,-14400,0,'-04'),(1300,0,-17776,0,'LMT'),(1300,1,-17776,0,'BMT'),(1300,2,-14400,1,'-04'),(1300,3,-18000,0,'-05'),(1301,0,-27889,0,'LMT'),(1301,1,-25200,1,'PDT'),(1301,2,-28800,0,'PST'),(1301,3,-21600,1,'MWT'),(1301,4,-21600,1,'MPT'),(1301,5,-25200,0,'MST'),(1301,6,-21600,1,'MDT'),(1302,0,-14028,0,'LMT'),(1302,1,-15408,0,'CMT'),(1302,2,-14400,0,'-04'),(1302,3,-10800,1,'-03'),(1302,4,-7200,1,'-02'),(1302,5,-10800,0,'-03'),(1303,0,0,0,'-00'),(1303,1,-21600,1,'MWT'),(1303,2,-21600,1,'MPT'),(1303,3,-25200,0,'MST'),(1303,4,-18000,1,'MDDT'),(1303,5,-21600,1,'MDT'),(1303,6,-18000,1,'CDT'),(1303,7,-21600,0,'CST'),(1303,8,-18000,0,'EST'),(1303,9,-21600,1,'MDT'),(1303,10,-25200,0,'MST'),(1304,0,-13108,0,'LMT'),(1304,1,-10800,1,'-03'),(1304,2,-14400,0,'-04'),(1305,0,-20824,0,'LMT'),(1305,1,-21600,0,'CST'),(1305,2,-14400,1,'EDT'),(1305,3,-18000,0,'EST'),(1305,4,-18000,1,'CDT'),(1306,0,-16064,0,'LMT'),(1306,1,-16060,0,'CMT'),(1306,2,-16200,0,'-0430'),(1306,3,-14400,0,'-04'),(1307,0,-15788,0,'LMT'),(1307,1,-15408,0,'CMT'),(1307,2,-14400,0,'-04'),(1307,3,-10800,1,'-03'),(1307,4,-7200,1,'-02'),(1307,5,-10800,0,'-03'),(1308,0,-12560,0,'LMT'),(1308,1,-14400,0,'-04'),(1308,2,-10800,0,'-03'),(1309,0,-19088,0,'LMT'),(1309,1,-19176,0,'CMT'),(1309,2,-18000,0,'EST'),(1310,0,-21036,0,'LMT'),(1310,1,-18000,1,'CDT'),(1310,2,-21600,0,'CST'),(1310,3,-18000,0,'EST'),(1310,4,-18000,1,'CWT'),(1310,5,-18000,1,'CPT'),(1310,6,-21600,0,'CST'),(1311,0,-25460,0,'LMT'),(1311,1,-25200,0,'MST'),(1311,2,-21600,0,'CST'),(1311,3,-18000,1,'CDT'),(1311,4,-21600,1,'MDT'),(1311,5,-25200,0,'MST'),(1312,0,-21988,0,'LMT'),(1312,1,-18000,1,'CDT'),(1312,2,-21600,0,'CST'),(1312,3,-18000,1,'CWT'),(1312,4,-18000,1,'CPT'),(1312,5,-18000,0,'EST'),(1313,0,-15408,0,'LMT'),(1313,1,-15408,0,'CMT'),(1313,2,-14400,0,'-04'),(1313,3,-10800,1,'-03'),(1313,4,-7200,1,'-02'),(1313,5,-10800,0,'-03'),(1314,0,-20173,0,'LMT'),(1314,1,-20173,0,'SJMT'),(1314,2,-18000,1,'CDT'),(1314,3,-21600,0,'CST'),(1315,0,-27964,0,'LMT'),(1315,1,-25200,0,'MST'),(1315,2,-28800,0,'PST'),(1315,3,-25200,0,'MST'),(1316,0,-13460,0,'LMT'),(1316,1,-10800,1,'-03'),(1316,2,-14400,0,'-04'),(1317,0,-16547,0,'LMT'),(1317,1,-16200,0,'-0430'),(1317,2,-14400,0,'AST'),(1318,0,-4480,0,'LMT'),(1318,1,-10800,0,'-03'),(1318,2,-10800,0,'-03'),(1318,3,-7200,1,'-02'),(1318,4,-7200,1,'-02'),(1318,5,0,0,'GMT'),(1319,0,-33460,0,'LMT'),(1319,1,-28800,1,'YDT'),(1319,2,-32400,0,'YST'),(1319,3,-28800,1,'YWT'),(1319,4,-28800,1,'YPT'),(1319,5,-25200,1,'YDDT'),(1319,6,-28800,0,'PST'),(1319,7,-25200,1,'PDT'),(1320,0,-28856,0,'LMT'),(1320,1,-25200,1,'PDT'),(1320,2,-28800,0,'PST'),(1320,3,-25200,1,'PWT'),(1320,4,-25200,1,'PPT'),(1320,5,-25200,0,'MST'),(1321,0,-25196,0,'LMT'),(1321,1,-21600,1,'MDT'),(1321,2,-25200,0,'MST'),(1321,3,-21600,1,'MWT'),(1321,4,-21600,1,'MPT'),(1322,0,-19931,0,'LMT'),(1322,1,-21600,0,'CST'),(1322,2,-18000,0,'EST'),(1322,3,-14400,1,'EWT'),(1322,4,-14400,1,'EPT'),(1322,5,-14400,1,'EDT'),(1323,0,-14764,0,'LMT'),(1323,1,-14400,0,'AST'),(1324,0,-27232,0,'LMT'),(1324,1,-21600,1,'MDT'),(1324,2,-25200,0,'MST'),(1324,3,-21600,1,'MWT'),(1324,4,-21600,1,'MPT'),(1325,0,-16768,0,'LMT'),(1325,1,-14400,1,'-04'),(1325,2,-18000,0,'-05'),(1325,3,-14400,0,'-04'),(1325,4,-18000,0,'-05'),(1326,0,-21408,0,'LMT'),(1326,1,-18000,1,'CDT'),(1326,2,-21600,0,'CST'),(1327,0,-28084,0,'LMT'),(1327,1,-25200,0,'MST'),(1327,2,-28800,0,'PST'),(1327,3,-25200,1,'PDT'),(1327,4,-25200,1,'PWT'),(1327,5,-25200,1,'PPT'),(1328,0,-29447,0,'LMT'),(1328,1,-25200,1,'PDT'),(1328,2,-28800,0,'PST'),(1328,3,-25200,1,'PWT'),(1328,4,-25200,1,'PPT'),(1328,5,-25200,0,'MST'),(1329,0,-20678,0,'LMT'),(1329,1,-18000,1,'CDT'),(1329,2,-21600,0,'CST'),(1329,3,-18000,1,'CWT'),(1329,4,-18000,1,'CPT'),(1329,5,-18000,0,'EST'),(1329,6,-14400,1,'EDT'),(1330,0,-9240,0,'LMT'),(1330,1,-7200,1,'-02'),(1330,2,-10800,0,'-03'),(1331,0,-14388,0,'LMT'),(1331,1,-10800,1,'ADT'),(1331,2,-14400,0,'AST'),(1331,3,-10800,1,'AWT'),(1331,4,-10800,1,'APT'),(1332,0,-12416,0,'LMT'),(1332,1,-10800,0,'-03'),(1332,2,-10800,0,'-03'),(1332,3,-7200,1,'-02'),(1332,4,-7200,1,'-02'),(1333,0,-14500,0,'LMT'),(1333,1,-12652,0,'NST'),(1333,2,-9052,1,'NDT'),(1333,3,-12600,0,'NST'),(1333,4,-9000,1,'NDT'),(1333,5,-9000,1,'NPT'),(1333,6,-9000,1,'NWT'),(1333,7,-10800,1,'ADT'),(1333,8,-14400,0,'AST'),(1333,9,-7200,1,'ADDT'),(1333,10,-10800,1,'ADT'),(1334,0,-17072,0,'LMT'),(1334,1,-18430,0,'KMT'),(1334,2,-18000,0,'EST'),(1334,3,-14400,1,'EDT'),(1334,4,-14400,0,'AST'),(1334,5,-18000,0,'EST'),(1335,0,-14764,0,'LMT'),(1335,1,-14400,0,'AST'),(1336,0,-14764,0,'LMT'),(1336,1,-14400,0,'AST'),(1337,0,-21724,0,'LMT'),(1337,1,-18000,1,'CDT'),(1337,2,-21600,0,'CST'),(1338,0,-19160,0,'LMT'),(1338,1,-18840,0,'QMT'),(1338,2,-14400,1,'-04'),(1338,3,-18000,0,'-05'),(1339,0,-13960,0,'LMT'),(1339,1,-13500,0,'-0345'),(1339,2,-10800,0,'-03'),(1339,3,-14400,0,'-04'),(1340,0,-15264,0,'LMT'),(1340,1,-10800,1,'ADT'),(1340,2,-14400,0,'AST'),(1340,3,-10800,1,'AWT'),(1340,4,-10800,1,'APT'),(1341,0,-19768,0,'LMT'),(1341,1,-19776,0,'HMT'),(1341,2,-14400,1,'CDT'),(1341,3,-18000,0,'CST'),(1341,4,-18000,0,'CST'),(1341,5,-14400,1,'CDT'),(1342,0,-26632,0,'LMT'),(1342,1,-25200,0,'MST'),(1342,2,-21600,0,'CST'),(1342,3,-28800,0,'PST'),(1342,4,-21600,1,'MDT'),(1342,5,-25200,0,'MST'),(1343,0,-20678,0,'LMT'),(1343,1,-18000,1,'CDT'),(1343,2,-21600,0,'CST'),(1343,3,-18000,1,'CWT'),(1343,4,-18000,1,'CPT'),(1343,5,-18000,0,'EST'),(1343,6,-14400,1,'EDT'),(1344,0,-20790,0,'LMT'),(1344,1,-18000,1,'CDT'),(1344,2,-21600,0,'CST'),(1344,3,-18000,1,'CWT'),(1344,4,-18000,1,'CPT'),(1344,5,-18000,0,'EST'),(1344,6,-21600,0,'CST'),(1345,0,-20723,0,'LMT'),(1345,1,-18000,1,'CDT'),(1345,2,-21600,0,'CST'),(1345,3,-18000,1,'CWT'),(1345,4,-18000,1,'CPT'),(1345,5,-18000,0,'EST'),(1345,6,-14400,1,'EDT'),(1346,0,-20947,0,'LMT'),(1346,1,-18000,1,'CDT'),(1346,2,-21600,0,'CST'),(1346,3,-18000,1,'CWT'),(1346,4,-18000,1,'CPT'),(1346,5,-18000,0,'EST'),(1346,6,-14400,1,'EDT'),(1347,0,-20823,0,'LMT'),(1347,1,-18000,1,'CDT'),(1347,2,-21600,0,'CST'),(1347,3,-18000,1,'CWT'),(1347,4,-18000,1,'CPT'),(1347,5,-18000,0,'EST'),(1347,6,-14400,1,'EDT'),(1347,7,-18000,1,'CDT'),(1347,8,-21600,0,'CST'),(1348,0,-20416,0,'LMT'),(1348,1,-18000,1,'CDT'),(1348,2,-21600,0,'CST'),(1348,3,-18000,1,'CWT'),(1348,4,-18000,1,'CPT'),(1348,5,-18000,0,'EST'),(1348,6,-14400,1,'EDT'),(1349,0,-21007,0,'LMT'),(1349,1,-18000,1,'CDT'),(1349,2,-21600,0,'CST'),(1349,3,-18000,1,'CWT'),(1349,4,-18000,1,'CPT'),(1349,5,-18000,0,'EST'),(1349,6,-14400,1,'EDT'),(1350,0,-20785,0,'LMT'),(1350,1,-18000,1,'CDT'),(1350,2,-21600,0,'CST'),(1350,3,-18000,1,'CWT'),(1350,4,-18000,1,'CPT'),(1350,5,-18000,0,'EST'),(1350,6,-14400,1,'EDT'),(1351,0,-20678,0,'LMT'),(1351,1,-18000,1,'CDT'),(1351,2,-21600,0,'CST'),(1351,3,-18000,1,'CWT'),(1351,4,-18000,1,'CPT'),(1351,5,-18000,0,'EST'),(1351,6,-14400,1,'EDT'),(1352,0,0,0,'-00'),(1352,1,-21600,1,'PDDT'),(1352,2,-28800,0,'PST'),(1352,3,-25200,0,'MST'),(1352,4,-21600,1,'MDT'),(1353,0,0,0,'-00'),(1353,1,-14400,1,'EPT'),(1353,2,-18000,0,'EST'),(1353,3,-10800,1,'EDDT'),(1353,4,-14400,1,'EDT'),(1353,5,-14400,1,'EWT'),(1353,6,-21600,0,'CST'),(1353,7,-18000,1,'CDT'),(1353,8,-14400,1,'EDT'),(1353,9,-18000,0,'EST'),(1354,0,-18430,0,'LMT'),(1354,1,-18430,0,'KMT'),(1354,2,-18000,0,'EST'),(1354,3,-14400,1,'EDT'),(1355,0,-15672,0,'LMT'),(1355,1,-15408,0,'CMT'),(1355,2,-14400,0,'-04'),(1355,3,-10800,1,'-03'),(1355,4,-7200,1,'-02'),(1355,5,-10800,0,'-03'),(1356,0,-32261,0,'LMT'),(1356,1,-28800,0,'PST'),(1356,2,-25200,1,'PWT'),(1356,3,-25200,1,'PPT'),(1356,4,-25200,1,'PDT'),(1356,5,-28800,1,'YDT'),(1356,6,-32400,0,'YST'),(1356,7,-28800,1,'AKDT'),(1356,8,-32400,0,'AKST'),(1357,0,-20582,0,'LMT'),(1357,1,-18000,1,'CDT'),(1357,2,-21600,0,'CST'),(1357,3,-18000,1,'CWT'),(1357,4,-18000,1,'CPT'),(1357,5,-18000,0,'EST'),(1357,6,-14400,1,'EDT'),(1358,0,-20364,0,'LMT'),(1358,1,-18000,1,'CDT'),(1358,2,-21600,0,'CST'),(1358,3,-18000,1,'CWT'),(1358,4,-18000,1,'CPT'),(1358,5,-14400,1,'EDT'),(1358,6,-18000,0,'EST'),(1359,0,-20790,0,'LMT'),(1359,1,-18000,1,'CDT'),(1359,2,-21600,0,'CST'),(1359,3,-18000,1,'CWT'),(1359,4,-18000,1,'CPT'),(1359,5,-18000,0,'EST'),(1359,6,-21600,0,'CST'),(1360,0,-16547,0,'LMT'),(1360,1,-16200,0,'-0430'),(1360,2,-14400,0,'AST'),(1361,0,-16356,0,'LMT'),(1361,1,-16356,0,'CMT'),(1361,2,-12756,1,'BST'),(1361,3,-14400,0,'-04'),(1362,0,-18492,0,'LMT'),(1362,1,-18516,0,'LMT'),(1362,2,-14400,1,'-04'),(1362,3,-18000,0,'-05'),(1363,0,-28378,0,'LMT'),(1363,1,-25200,1,'PDT'),(1363,2,-28800,0,'PST'),(1363,3,-25200,1,'PWT'),(1363,4,-25200,1,'PPT'),(1364,0,-20582,0,'LMT'),(1364,1,-18000,1,'CDT'),(1364,2,-21600,0,'CST'),(1364,3,-18000,1,'CWT'),(1364,4,-18000,1,'CPT'),(1364,5,-18000,0,'EST'),(1364,6,-14400,1,'EDT'),(1365,0,-16547,0,'LMT'),(1365,1,-16200,0,'-0430'),(1365,2,-14400,0,'AST'),(1366,0,-8572,0,'LMT'),(1366,1,-7200,1,'-02'),(1366,2,-10800,0,'-03'),(1367,0,-20708,0,'LMT'),(1367,1,-20712,0,'MMT'),(1367,2,-21600,0,'CST'),(1367,3,-18000,0,'EST'),(1367,4,-18000,1,'CDT'),(1367,5,-21600,0,'CST'),(1368,0,-14404,0,'LMT'),(1368,1,-10800,1,'-03'),(1368,2,-14400,0,'-04'),(1369,0,-14764,0,'LMT'),(1369,1,-14400,0,'AST'),(1370,0,-14660,0,'LMT'),(1370,1,-14660,0,'FFMT'),(1370,2,-14400,0,'AST'),(1370,3,-10800,1,'ADT'),(1371,0,-24000,0,'LMT'),(1371,1,-21600,0,'CST'),(1371,2,-18000,1,'CDT'),(1372,0,-25540,0,'LMT'),(1372,1,-25200,0,'MST'),(1372,2,-21600,0,'CST'),(1372,3,-28800,0,'PST'),(1372,4,-21600,1,'MDT'),(1372,5,-25200,0,'MST'),(1373,0,-16516,0,'LMT'),(1373,1,-15408,0,'CMT'),(1373,2,-14400,0,'-04'),(1373,3,-10800,1,'-03'),(1373,4,-7200,1,'-02'),(1373,5,-10800,0,'-03'),(1374,0,-21027,0,'LMT'),(1374,1,-18000,1,'CDT'),(1374,2,-21600,0,'CST'),(1374,3,-18000,1,'CWT'),(1374,4,-18000,1,'CPT'),(1374,5,-18000,0,'EST'),(1374,6,-21600,0,'CST'),(1375,0,-21508,0,'LMT'),(1375,1,-21600,0,'CST'),(1375,2,-18000,0,'EST'),(1375,3,-18000,1,'CDT'),(1375,4,-21600,0,'CST'),(1376,0,-31578,0,'LMT'),(1376,1,-28800,0,'PST'),(1376,2,-25200,1,'PWT'),(1376,3,-25200,1,'PPT'),(1376,4,-25200,1,'PDT'),(1376,5,-32400,0,'AKST'),(1376,6,-28800,1,'AKDT'),(1377,0,-23796,0,'LMT'),(1377,1,-25200,0,'MST'),(1377,2,-21600,0,'CST'),(1377,3,-18000,1,'CDT'),(1377,4,-18000,1,'CWT'),(1378,0,-13480,0,'LMT'),(1378,1,-14400,0,'AST'),(1378,2,-10800,0,'-03'),(1378,3,-7200,1,'-02'),(1379,0,-15548,0,'LMT'),(1379,1,-18000,0,'EST'),(1379,2,-10800,1,'ADT'),(1379,3,-14400,0,'AST'),(1379,4,-10800,1,'AWT'),(1379,5,-10800,1,'APT'),(1380,0,-24076,0,'LMT'),(1380,1,-21600,0,'CST'),(1380,2,-18000,1,'CDT'),(1381,0,-13491,0,'LMT'),(1381,1,-13491,0,'MMT'),(1381,2,-14400,0,'-04'),(1381,3,-12600,0,'-0330'),(1381,4,-10800,1,'-03'),(1381,5,-10800,0,'-03'),(1381,6,-9000,1,'-0230'),(1381,7,-7200,1,'-02'),(1381,8,-5400,1,'-0130'),(1381,9,-7200,1,'-02'),(1382,0,-19052,0,'LMT'),(1382,1,-14400,1,'EDT'),(1382,2,-18000,0,'EST'),(1382,3,-14400,1,'EWT'),(1382,4,-14400,1,'EPT'),(1383,0,-14764,0,'LMT'),(1383,1,-14400,0,'AST'),(1384,0,-18570,0,'LMT'),(1384,1,-14400,1,'EDT'),(1384,2,-18000,0,'EST'),(1385,0,-17762,0,'LMT'),(1385,1,-14400,1,'EDT'),(1385,2,-18000,0,'EST'),(1385,3,-14400,1,'EWT'),(1385,4,-14400,1,'EPT'),(1386,0,-21184,0,'LMT'),(1386,1,-14400,1,'EDT'),(1386,2,-18000,0,'EST'),(1386,3,-14400,1,'EWT'),(1386,4,-14400,1,'EPT'),(1387,0,-39698,0,'LMT'),(1387,1,-39600,0,'NST'),(1387,2,-36000,1,'NWT'),(1387,3,-36000,1,'NPT'),(1387,4,-39600,0,'BST'),(1387,5,-36000,1,'BDT'),(1387,6,-32400,0,'YST'),(1387,7,-28800,1,'AKDT'),(1387,8,-32400,0,'AKST'),(1388,0,-7780,0,'LMT'),(1388,1,-3600,1,'-01'),(1388,2,-7200,0,'-02'),(1389,0,-24427,0,'LMT'),(1389,1,-21600,1,'MDT'),(1389,2,-25200,0,'MST'),(1389,3,-21600,1,'MWT'),(1389,4,-21600,1,'MPT'),(1389,5,-18000,1,'CDT'),(1389,6,-21600,0,'CST'),(1390,0,-24312,0,'LMT'),(1390,1,-21600,1,'MDT'),(1390,2,-25200,0,'MST'),(1390,3,-21600,1,'MWT'),(1390,4,-21600,1,'MPT'),(1390,5,-18000,1,'CDT'),(1390,6,-21600,0,'CST'),(1391,0,-24339,0,'LMT'),(1391,1,-21600,1,'MDT'),(1391,2,-25200,0,'MST'),(1391,3,-21600,1,'MWT'),(1391,4,-21600,1,'MPT'),(1391,5,-18000,1,'CDT'),(1391,6,-21600,0,'CST'),(1392,0,-25060,0,'LMT'),(1392,1,-25200,0,'MST'),(1392,2,-21600,0,'CST'),(1392,3,-18000,1,'CDT'),(1392,4,-21600,1,'MDT'),(1392,5,-25200,0,'MST'),(1393,0,-19088,0,'LMT'),(1393,1,-19176,0,'CMT'),(1393,2,-18000,0,'EST'),(1394,0,0,0,'-00'),(1394,1,-10800,1,'AWT'),(1394,2,-10800,1,'APT'),(1394,3,-14400,0,'AST'),(1394,4,-7200,1,'ADDT'),(1394,5,-10800,1,'ADT'),(1394,6,-14400,1,'EDT'),(1394,7,-18000,0,'EST'),(1394,8,-21600,0,'CST'),(1394,9,-18000,1,'CDT'),(1394,10,-14400,1,'EDT'),(1394,11,-18000,0,'EST'),(1395,0,-13240,0,'LMT'),(1395,1,-13252,0,'PMT'),(1395,2,-13236,0,'PMT'),(1395,3,-12600,0,'-0330'),(1395,4,-10800,0,'-03'),(1396,0,-26898,0,'LMT'),(1396,1,-21600,1,'MDT'),(1396,2,-25200,0,'MST'),(1396,3,-21600,1,'MWT'),(1397,0,-17360,0,'LMT'),(1397,1,-17340,0,'PPMT'),(1397,2,-14400,1,'EDT'),(1397,3,-18000,0,'EST'),(1397,4,-14400,1,'EDT'),(1397,5,-18000,0,'EST'),(1398,0,-14764,0,'LMT'),(1398,1,-14400,0,'AST'),(1399,0,-16272,0,'LMT'),(1399,1,-14400,1,'-04'),(1399,2,-18000,0,'-05'),(1399,3,-14400,0,'-04'),(1399,4,-18000,0,'-05'),(1400,0,-15336,0,'LMT'),(1400,1,-10800,1,'-03'),(1400,2,-14400,0,'-04'),(1401,0,-15865,0,'LMT'),(1401,1,-14400,0,'AST'),(1401,2,-10800,1,'APT'),(1401,3,-10800,1,'AWT'),(1402,0,-17020,0,'LMT'),(1402,1,-16966,0,'SMT'),(1402,2,-18000,0,'-05'),(1402,3,-14400,0,'-04'),(1402,4,-14400,1,'-04'),(1402,5,-10800,1,'-03'),(1402,6,-14400,0,'-04'),(1402,7,-10800,0,'-03'),(1403,0,-22696,0,'LMT'),(1403,1,-18000,1,'CDT'),(1403,2,-21600,0,'CST'),(1403,3,-18000,1,'CWT'),(1403,4,-18000,1,'CPT'),(1404,0,0,0,'-00'),(1404,1,-14400,1,'CDDT'),(1404,2,-21600,0,'CST'),(1404,3,-18000,1,'CDT'),(1404,4,-18000,0,'EST'),(1404,5,-21600,0,'CST'),(1405,0,-8376,0,'LMT'),(1405,1,-7200,1,'-02'),(1405,2,-10800,0,'-03'),(1406,0,-25116,0,'LMT'),(1406,1,-21600,1,'MDT'),(1406,2,-25200,0,'MST'),(1406,3,-21600,1,'MWT'),(1406,4,-21600,1,'MPT'),(1406,5,-21600,0,'CST'),(1407,0,0,0,'-00'),(1407,1,-14400,1,'CDDT'),(1407,2,-21600,0,'CST'),(1407,3,-18000,1,'CDT'),(1407,4,-18000,0,'EST'),(1407,5,-21600,0,'CST'),(1408,0,-16272,0,'LMT'),(1408,1,-14400,1,'-04'),(1408,2,-18000,0,'-05'),(1408,3,-14400,0,'-04'),(1408,4,-18000,0,'-05'),(1409,0,-15408,0,'LMT'),(1409,1,-15408,0,'CMT'),(1409,2,-14400,0,'-04'),(1409,3,-10800,1,'-03'),(1409,4,-7200,1,'-02'),(1409,5,-10800,0,'-03'),(1410,0,-28084,0,'LMT'),(1410,1,-25200,0,'MST'),(1410,2,-28800,0,'PST'),(1410,3,-25200,1,'PDT'),(1410,4,-25200,1,'PWT'),(1410,5,-25200,1,'PPT'),(1411,0,-13128,0,'LMT'),(1411,1,-10800,1,'-03'),(1411,2,-14400,0,'-04'),(1411,3,-10800,0,'-03'),(1412,0,-16966,0,'LMT'),(1412,1,-16966,0,'SMT'),(1412,2,-18000,0,'-05'),(1412,3,-14400,0,'-04'),(1412,4,-14400,1,'-04'),(1412,5,-10800,1,'-03'),(1412,6,-10800,1,'-03'),(1412,7,-14400,0,'-04'),(1413,0,-16776,0,'LMT'),(1413,1,-16800,0,'SDMT'),(1413,2,-14400,1,'EDT'),(1413,3,-18000,0,'EST'),(1413,4,-16200,1,'-0430'),(1413,5,-14400,0,'AST'),(1414,0,-11188,0,'LMT'),(1414,1,-7200,1,'-02'),(1414,2,-10800,0,'-03'),(1415,0,-5272,0,'LMT'),(1415,1,-7200,0,'-02'),(1415,2,-3600,1,'-01'),(1415,3,-7200,0,'-02'),(1415,4,-3600,0,'-01'),(1415,5,0,1,'+00'),(1415,6,0,1,'+00'),(1416,0,-25196,0,'LMT'),(1416,1,-21600,1,'MDT'),(1416,2,-25200,0,'MST'),(1416,3,-21600,1,'MWT'),(1416,4,-21600,1,'MPT'),(1417,0,-32473,0,'LMT'),(1417,1,-28800,0,'PST'),(1417,2,-25200,1,'PWT'),(1417,3,-25200,1,'PPT'),(1417,4,-25200,1,'PDT'),(1417,5,-32400,0,'YST'),(1417,6,-28800,1,'AKDT'),(1417,7,-32400,0,'AKST'),(1418,0,-14764,0,'LMT'),(1418,1,-14400,0,'AST'),(1419,0,-12652,0,'LMT'),(1419,1,-9052,1,'NDT'),(1419,2,-12652,0,'NST'),(1419,3,-9000,1,'NDT'),(1419,4,-12600,0,'NST'),(1419,5,-9000,1,'NPT'),(1419,6,-9000,1,'NWT'),(1419,7,-5400,1,'NDDT'),(1419,8,-9000,1,'NDT'),(1420,0,-14764,0,'LMT'),(1420,1,-14400,0,'AST'),(1421,0,-14764,0,'LMT'),(1421,1,-14400,0,'AST'),(1422,0,-14764,0,'LMT'),(1422,1,-14400,0,'AST'),(1423,0,-14764,0,'LMT'),(1423,1,-14400,0,'AST'),(1424,0,-25880,0,'LMT'),(1424,1,-21600,1,'MDT'),(1424,2,-25200,0,'MST'),(1424,3,-21600,1,'MWT'),(1424,4,-21600,1,'MPT'),(1424,5,-21600,0,'CST'),(1425,0,-20932,0,'LMT'),(1425,1,-18000,1,'CDT'),(1425,2,-21600,0,'CST'),(1426,0,-16508,0,'LMT'),(1426,1,-10800,1,'ADT'),(1426,2,-14400,0,'AST'),(1427,0,-21420,0,'LMT'),(1427,1,-21600,0,'CST'),(1427,2,-18000,0,'EST'),(1427,3,-14400,1,'EWT'),(1427,4,-14400,1,'EPT'),(1427,5,-14400,1,'EDT'),(1428,0,-28084,0,'LMT'),(1428,1,-25200,0,'MST'),(1428,2,-28800,0,'PST'),(1428,3,-25200,1,'PDT'),(1428,4,-25200,1,'PWT'),(1428,5,-25200,1,'PPT'),(1429,0,-19052,0,'LMT'),(1429,1,-14400,1,'EDT'),(1429,2,-18000,0,'EST'),(1429,3,-14400,1,'EWT'),(1429,4,-14400,1,'EPT'),(1430,0,-14764,0,'LMT'),(1430,1,-14400,0,'AST'),(1431,0,-29548,0,'LMT'),(1431,1,-25200,1,'PDT'),(1431,2,-28800,0,'PST'),(1431,3,-25200,1,'PWT'),(1431,4,-25200,1,'PPT'),(1432,0,-14764,0,'LMT'),(1432,1,-14400,0,'AST'),(1433,0,-32412,0,'LMT'),(1433,1,-28800,1,'YDT'),(1433,2,-32400,0,'YST'),(1433,3,-28800,1,'YWT'),(1433,4,-28800,1,'YPT'),(1433,5,-25200,1,'YDDT'),(1433,6,-28800,0,'PST'),(1433,7,-25200,1,'PDT'),(1434,0,-23316,0,'LMT'),(1434,1,-18000,1,'CDT'),(1434,2,-21600,0,'CST'),(1434,3,-18000,1,'CWT'),(1434,4,-18000,1,'CPT'),(1434,5,-18000,1,'CDT'),(1434,6,-21600,0,'CST'),(1435,0,-33535,0,'LMT'),(1435,1,-32400,0,'YST'),(1435,2,-28800,1,'YWT'),(1435,3,-28800,1,'YPT'),(1435,4,-28800,1,'YDT'),(1435,5,-28800,1,'AKDT'),(1435,6,-32400,0,'AKST'),(1436,0,0,0,'-00'),(1436,1,-21600,1,'MWT'),(1436,2,-21600,1,'MPT'),(1436,3,-25200,0,'MST'),(1436,4,-18000,1,'MDDT'),(1436,5,-21600,1,'MDT'),(1437,0,0,0,'-00'),(1437,1,28800,0,'+08'),(1437,2,39600,0,'+11'),(1437,3,28800,0,'+08'),(1438,0,0,0,'-00'),(1438,1,25200,0,'+07'),(1438,2,18000,0,'+05'),(1438,3,25200,0,'+07'),(1439,0,0,0,'-00'),(1439,1,36000,0,'+10'),(1440,0,0,0,'-00'),(1440,1,36000,0,'AEST'),(1440,2,39600,1,'AEDT'),(1440,3,0,0,'-00'),(1440,4,39600,1,'AEDT'),(1440,5,36000,0,'AEST'),(1440,6,39600,0,'+11'),(1441,0,0,0,'-00'),(1441,1,21600,0,'+06'),(1441,2,18000,0,'+05'),(1442,0,41944,0,'LMT'),(1442,1,45000,1,'NZST'),(1442,2,41400,0,'NZMT'),(1442,3,43200,1,'NZST'),(1442,4,46800,1,'NZDT'),(1442,5,43200,0,'NZST'),(1442,6,43200,0,'NZST'),(1443,0,0,0,'-00'),(1443,1,-14400,0,'-04'),(1443,2,-10800,1,'-03'),(1443,3,-7200,1,'-02'),(1443,4,-10800,0,'-03'),(1443,5,-10800,1,'-03'),(1443,6,-14400,0,'-04'),(1443,7,-10800,0,'-03'),(1444,0,0,0,'-00'),(1444,1,-10800,0,'-03'),(1445,0,41944,0,'LMT'),(1445,1,45000,1,'NZST'),(1445,2,41400,0,'NZMT'),(1445,3,43200,1,'NZST'),(1445,4,46800,1,'NZDT'),(1445,5,43200,0,'NZST'),(1445,6,43200,0,'NZST'),(1446,0,0,0,'-00'),(1446,1,10800,0,'+03'),(1447,0,0,0,'-00'),(1447,1,7200,1,'+02'),(1447,2,0,0,'+00'),(1447,3,0,0,'+00'),(1448,0,0,0,'-00'),(1448,1,21600,0,'+06'),(1449,0,2580,0,'LMT'),(1449,1,7200,1,'CEST'),(1449,2,3600,0,'CET'),(1449,3,3600,0,'CET'),(1449,4,7200,1,'CEST'),(1449,5,7200,1,'CEST'),(1449,6,3600,0,'CET'),(1450,0,11212,0,'LMT'),(1450,1,10800,0,'+03'),(1451,0,18468,0,'LMT'),(1451,1,18000,0,'+05'),(1451,2,25200,1,'+07'),(1451,3,21600,0,'+06'),(1451,4,21600,0,'+06'),(1451,5,25200,1,'+07'),(1451,6,21600,1,'+06'),(1451,7,18000,0,'+05'),(1451,8,25200,1,'+07'),(1451,9,21600,0,'+06'),(1452,0,8624,0,'LMT'),(1452,1,10800,1,'EEST'),(1452,2,7200,0,'EET'),(1452,3,7200,0,'EET'),(1452,4,10800,1,'EEST'),(1453,0,42596,0,'LMT'),(1453,1,43200,0,'+12'),(1453,2,50400,1,'+14'),(1453,3,46800,0,'+13'),(1453,4,46800,1,'+13'),(1453,5,43200,0,'+12'),(1453,6,46800,1,'+13'),(1453,7,43200,1,'+12'),(1453,8,39600,0,'+11'),(1453,9,43200,0,'+12'),(1454,0,12064,0,'LMT'),(1454,1,14400,0,'+04'),(1454,2,18000,0,'+05'),(1454,3,21600,0,'+06'),(1454,4,21600,1,'+06'),(1454,5,18000,0,'+05'),(1454,6,21600,1,'+06'),(1454,7,18000,1,'+05'),(1454,8,14400,0,'+04'),(1454,9,18000,0,'+05'),(1455,0,13720,0,'LMT'),(1455,1,14400,0,'+04'),(1455,2,18000,0,'+05'),(1455,3,21600,1,'+06'),(1455,4,21600,0,'+06'),(1455,5,18000,0,'+05'),(1455,6,21600,1,'+06'),(1455,7,18000,1,'+05'),(1455,8,14400,0,'+04'),(1455,9,21600,1,'+06'),(1455,10,18000,0,'+05'),(1456,0,14012,0,'LMT'),(1456,1,14400,0,'+04'),(1456,2,21600,1,'+06'),(1456,3,18000,0,'+05'),(1456,4,18000,0,'+05'),(1456,5,21600,1,'+06'),(1456,6,18000,1,'+05'),(1456,7,14400,0,'+04'),(1456,8,18000,0,'+05'),(1457,0,14012,0,'LMT'),(1457,1,14400,0,'+04'),(1457,2,21600,1,'+06'),(1457,3,18000,0,'+05'),(1457,4,18000,0,'+05'),(1457,5,21600,1,'+06'),(1457,6,18000,1,'+05'),(1457,7,14400,0,'+04'),(1457,8,18000,0,'+05'),(1458,0,12464,0,'LMT'),(1458,1,10800,0,'+03'),(1458,2,18000,0,'+05'),(1458,3,21600,0,'+06'),(1458,4,21600,1,'+06'),(1458,5,18000,0,'+05'),(1458,6,21600,1,'+06'),(1458,7,18000,1,'+05'),(1458,8,14400,0,'+04'),(1458,9,18000,0,'+05'),(1459,0,10660,0,'LMT'),(1459,1,10656,0,'BMT'),(1459,2,10800,0,'+03'),(1459,3,14400,1,'+04'),(1459,4,10800,0,'+03'),(1459,5,14400,1,'+04'),(1460,0,12368,0,'LMT'),(1460,1,14400,0,'+04'),(1460,2,10800,0,'+03'),(1461,0,11964,0,'LMT'),(1461,1,10800,0,'+03'),(1461,2,18000,1,'+05'),(1461,3,14400,0,'+04'),(1461,4,14400,0,'+04'),(1461,5,18000,1,'+05'),(1461,6,14400,1,'+04'),(1461,7,10800,0,'+03'),(1461,8,18000,1,'+05'),(1461,9,14400,0,'+04'),(1462,0,24124,0,'LMT'),(1462,1,24124,0,'BMT'),(1462,2,25200,0,'+07'),(1463,0,20100,0,'LMT'),(1463,1,21600,0,'+06'),(1463,2,28800,1,'+08'),(1463,3,25200,0,'+07'),(1463,4,25200,0,'+07'),(1463,5,28800,1,'+08'),(1463,6,25200,1,'+07'),(1463,7,21600,0,'+06'),(1463,8,25200,1,'+07'),(1463,9,25200,0,'+07'),(1464,0,8520,0,'LMT'),(1464,1,10800,1,'EEST'),(1464,2,7200,0,'EET'),(1465,0,17904,0,'LMT'),(1465,1,18000,0,'+05'),(1465,2,25200,1,'+07'),(1465,3,21600,0,'+06'),(1465,4,21600,0,'+06'),(1465,5,25200,1,'+07'),(1465,6,21600,1,'+06'),(1465,7,21600,1,'+06'),(1466,0,27580,0,'LMT'),(1466,1,27000,0,'+0730'),(1466,2,28800,0,'+08'),(1467,0,21200,0,'HMT'),(1467,1,19270,0,'MMT'),(1467,2,19800,0,'IST'),(1467,3,23400,1,'+0630'),(1468,0,27232,0,'LMT'),(1468,1,28800,0,'+08'),(1468,2,36000,1,'+10'),(1468,3,32400,0,'+09'),(1468,4,32400,0,'+09'),(1468,5,36000,1,'+10'),(1468,6,32400,1,'+09'),(1468,7,28800,0,'+08'),(1468,8,36000,0,'+10'),(1468,9,36000,1,'+10'),(1468,10,32400,0,'+09'),(1469,0,27480,0,'LMT'),(1469,1,25200,0,'+07'),(1469,2,28800,0,'+08'),(1469,3,32400,0,'+09'),(1469,4,36000,1,'+10'),(1469,5,32400,1,'+09'),(1469,6,28800,0,'+08'),(1470,0,29143,0,'LMT'),(1470,1,32400,1,'CDT'),(1470,2,28800,0,'CST'),(1471,0,29143,0,'LMT'),(1471,1,32400,1,'CDT'),(1471,2,28800,0,'CST'),(1472,0,19164,0,'LMT'),(1472,1,19172,0,'MMT'),(1472,2,19800,0,'+0530'),(1472,3,21600,1,'+06'),(1472,4,23400,1,'+0630'),(1472,5,23400,0,'+0630'),(1472,6,21600,0,'+06'),(1472,7,19800,0,'+0530'),(1473,0,21700,0,'LMT'),(1473,1,21200,0,'HMT'),(1473,2,23400,0,'+0630'),(1473,3,19800,0,'+0530'),(1473,4,21600,0,'+06'),(1473,5,25200,1,'+07'),(1474,0,8712,0,'LMT'),(1474,1,10800,1,'EEST'),(1474,2,7200,0,'EET'),(1475,0,21700,0,'LMT'),(1475,1,21200,0,'HMT'),(1475,2,23400,0,'+0630'),(1475,3,19800,0,'+0530'),(1475,4,21600,0,'+06'),(1475,5,25200,1,'+07'),(1476,0,30140,0,'LMT'),(1476,1,28800,0,'+08'),(1476,2,32400,0,'+09'),(1477,0,13272,0,'LMT'),(1477,1,14400,0,'+04'),(1478,0,16512,0,'LMT'),(1478,1,18000,0,'+05'),(1478,2,25200,1,'+07'),(1478,3,21600,0,'+06'),(1478,4,21600,0,'+06'),(1478,5,25200,1,'+07'),(1478,6,21600,1,'+06'),(1478,7,18000,0,'+05'),(1479,0,8148,0,'LMT'),(1479,1,10800,1,'EEST'),(1479,2,7200,0,'EET'),(1479,3,7200,0,'EET'),(1479,4,10800,1,'EEST'),(1479,5,10800,0,'+03'),(1479,6,7200,0,'EET'),(1480,0,8272,0,'LMT'),(1480,1,10800,1,'EEST'),(1480,2,7200,0,'EET'),(1480,3,10800,1,'IDT'),(1480,4,7200,0,'IST'),(1480,5,7200,0,'EET'),(1481,0,29143,0,'LMT'),(1481,1,32400,1,'CDT'),(1481,2,28800,0,'CST'),(1482,0,8423,0,'LMT'),(1482,1,10800,1,'EEST'),(1482,2,7200,0,'EET'),(1482,3,10800,1,'IDT'),(1482,4,7200,0,'IST'),(1482,5,7200,0,'EET'),(1483,0,25600,0,'LMT'),(1483,1,25590,0,'PLMT'),(1483,2,25200,0,'+07'),(1483,3,28800,0,'+08'),(1483,4,32400,0,'+09'),(1483,5,25200,0,'+07'),(1484,0,27402,0,'LMT'),(1484,1,28800,0,'HKT'),(1484,2,32400,1,'HKST'),(1484,3,30600,1,'HKWT'),(1484,4,32400,0,'JST'),(1484,5,28800,0,'HKT'),(1484,6,32400,1,'HKST'),(1485,0,21996,0,'LMT'),(1485,1,21600,0,'+06'),(1485,2,28800,1,'+08'),(1485,3,25200,0,'+07'),(1486,0,25025,0,'LMT'),(1486,1,25025,0,'IMT'),(1486,2,25200,0,'+07'),(1486,3,32400,1,'+09'),(1486,4,28800,0,'+08'),(1486,5,28800,0,'+08'),(1486,6,32400,1,'+09'),(1486,7,28800,1,'+08'),(1486,8,25200,0,'+07'),(1486,9,32400,0,'+09'),(1486,10,32400,1,'+09'),(1486,11,28800,0,'+08'),(1487,0,6952,0,'LMT'),(1487,1,7016,0,'IMT'),(1487,2,10800,1,'EEST'),(1487,3,7200,0,'EET'),(1487,4,10800,0,'+03'),(1487,5,14400,1,'+04'),(1487,6,10800,1,'EEST'),(1487,7,7200,0,'EET'),(1487,8,10800,1,'EEST'),(1487,9,7200,0,'EET'),(1487,10,10800,0,'+03'),(1488,0,25632,0,'LMT'),(1488,1,25632,0,'BMT'),(1488,2,26400,0,'+0720'),(1488,3,27000,0,'+0730'),(1488,4,32400,0,'+09'),(1488,5,28800,0,'+08'),(1488,6,25200,0,'WIB'),(1489,0,33768,0,'LMT'),(1489,1,32400,0,'+09'),(1489,2,34200,0,'+0930'),(1489,3,32400,0,'WIT'),(1490,0,8454,0,'LMT'),(1490,1,8440,0,'JMT'),(1490,2,10800,1,'IDT'),(1490,3,7200,0,'IST'),(1490,4,14400,1,'IDDT'),(1490,5,10800,1,'IDT'),(1491,0,16608,0,'LMT'),(1491,1,14400,0,'+04'),(1491,2,16200,0,'+0430'),(1492,0,38076,0,'LMT'),(1492,1,39600,0,'+11'),(1492,2,46800,1,'+13'),(1492,3,43200,0,'+12'),(1492,4,43200,0,'+12'),(1492,5,46800,1,'+13'),(1492,6,43200,1,'+12'),(1492,7,39600,0,'+11'),(1492,8,43200,0,'+12'),(1493,0,16092,0,'LMT'),(1493,1,19800,0,'+0530'),(1493,2,23400,1,'+0630'),(1493,3,18000,0,'+05'),(1493,4,21600,1,'PKST'),(1493,5,18000,0,'PKT'),(1494,0,21020,0,'LMT'),(1494,1,21600,0,'+06'),(1495,0,20476,0,'LMT'),(1495,1,19800,0,'+0530'),(1495,2,20700,0,'+0545'),(1496,0,20476,0,'LMT'),(1496,1,19800,0,'+0530'),(1496,2,20700,0,'+0545'),(1497,0,32533,0,'LMT'),(1497,1,28800,0,'+08'),(1497,2,36000,1,'+10'),(1497,3,32400,0,'+09'),(1497,4,32400,0,'+09'),(1497,5,36000,1,'+10'),(1497,6,32400,1,'+09'),(1497,7,28800,0,'+08'),(1497,8,39600,1,'+11'),(1497,9,36000,0,'+10'),(1497,10,36000,0,'+10'),(1497,11,39600,0,'+11'),(1497,12,32400,0,'+09'),(1498,0,21200,0,'HMT'),(1498,1,19270,0,'MMT'),(1498,2,19800,0,'IST'),(1498,3,23400,1,'+0630'),(1499,0,22286,0,'LMT'),(1499,1,21600,0,'+06'),(1499,2,28800,1,'+08'),(1499,3,25200,0,'+07'),(1499,4,25200,0,'+07'),(1499,5,28800,1,'+08'),(1499,6,25200,1,'+07'),(1499,7,21600,0,'+06'),(1499,8,28800,0,'+08'),(1499,9,28800,1,'+08'),(1499,10,25200,0,'+07'),(1500,0,24406,0,'LMT'),(1500,1,24925,0,'SMT'),(1500,2,25200,0,'+07'),(1500,3,26400,1,'+0720'),(1500,4,26400,0,'+0720'),(1500,5,27000,0,'+0730'),(1500,6,32400,0,'+09'),(1500,7,28800,0,'+08'),(1501,0,26480,0,'LMT'),(1501,1,27000,0,'+0730'),(1501,2,30000,1,'+0820'),(1501,3,28800,0,'+08'),(1501,4,32400,0,'+09'),(1501,5,28800,0,'+08'),(1502,0,11212,0,'LMT'),(1502,1,10800,0,'+03'),(1503,0,27250,0,'LMT'),(1503,1,28800,0,'CST'),(1503,2,36000,1,'+10'),(1503,3,32400,0,'+09'),(1503,4,32400,1,'CDT'),(1503,5,28800,0,'CST'),(1503,6,32400,1,'CDT'),(1504,0,27250,0,'LMT'),(1504,1,28800,0,'CST'),(1504,2,36000,1,'+10'),(1504,3,32400,0,'+09'),(1504,4,32400,1,'CDT'),(1504,5,28800,0,'CST'),(1504,6,32400,1,'CDT'),(1505,0,36192,0,'LMT'),(1505,1,36000,0,'+10'),(1505,2,43200,1,'+12'),(1505,3,39600,0,'+11'),(1505,4,39600,0,'+11'),(1505,5,43200,1,'+12'),(1505,6,39600,1,'+11'),(1505,7,36000,0,'+10'),(1505,8,43200,0,'+12'),(1505,9,43200,1,'+12'),(1505,10,39600,0,'+11'),(1506,0,28656,0,'LMT'),(1506,1,28656,0,'MMT'),(1506,2,28800,0,'+08'),(1506,3,32400,0,'+09'),(1506,4,28800,0,'WITA'),(1507,0,29040,0,'LMT'),(1507,1,32400,1,'PDT'),(1507,2,28800,0,'PST'),(1507,3,32400,0,'JST'),(1507,4,28800,0,'PST'),(1508,0,13272,0,'LMT'),(1508,1,14400,0,'+04'),(1509,0,8008,0,'LMT'),(1509,1,10800,1,'EEST'),(1509,2,7200,0,'EET'),(1509,3,7200,0,'EET'),(1509,4,10800,1,'EEST'),(1510,0,20928,0,'LMT'),(1510,1,21600,0,'+06'),(1510,2,28800,1,'+08'),(1510,3,25200,0,'+07'),(1510,4,25200,0,'+07'),(1510,5,28800,1,'+08'),(1510,6,25200,1,'+07'),(1510,7,21600,0,'+06'),(1510,8,25200,0,'+07'),(1511,0,19900,0,'LMT'),(1511,1,21600,0,'+06'),(1511,2,28800,1,'+08'),(1511,3,25200,0,'+07'),(1511,4,25200,0,'+07'),(1511,5,28800,1,'+08'),(1511,6,25200,1,'+07'),(1511,7,21600,0,'+06'),(1511,8,25200,1,'+07'),(1511,9,25200,0,'+07'),(1512,0,17610,0,'LMT'),(1512,1,18000,0,'+05'),(1512,2,25200,1,'+07'),(1512,3,21600,0,'+06'),(1512,4,21600,0,'+06'),(1512,5,25200,1,'+07'),(1512,6,21600,1,'+06'),(1512,7,18000,0,'+05'),(1512,8,25200,0,'+07'),(1512,9,25200,1,'+07'),(1512,10,21600,0,'+06'),(1513,0,12324,0,'LMT'),(1513,1,10800,0,'+03'),(1513,2,18000,0,'+05'),(1513,3,21600,1,'+06'),(1513,4,21600,0,'+06'),(1513,5,18000,0,'+05'),(1513,6,21600,1,'+06'),(1513,7,18000,1,'+05'),(1513,8,14400,0,'+04'),(1513,9,18000,0,'+05'),(1514,0,24124,0,'LMT'),(1514,1,24124,0,'BMT'),(1514,2,25200,0,'+07'),(1515,0,26240,0,'LMT'),(1515,1,26240,0,'PMT'),(1515,2,27000,0,'+0730'),(1515,3,32400,0,'+09'),(1515,4,28800,0,'+08'),(1515,5,28800,0,'WITA'),(1515,6,25200,0,'WIB'),(1516,0,30180,0,'LMT'),(1516,1,30600,0,'KST'),(1516,2,32400,0,'JST'),(1516,3,32400,0,'KST'),(1517,0,12368,0,'LMT'),(1517,1,14400,0,'+04'),(1517,2,10800,0,'+03'),(1518,0,15268,0,'LMT'),(1518,1,14400,0,'+04'),(1518,2,18000,0,'+05'),(1518,3,21600,1,'+06'),(1518,4,21600,0,'+06'),(1518,5,18000,0,'+05'),(1518,6,21600,1,'+06'),(1518,7,18000,1,'+05'),(1518,8,14400,0,'+04'),(1518,9,21600,0,'+06'),(1518,10,21600,1,'+06'),(1519,0,15712,0,'LMT'),(1519,1,14400,0,'+04'),(1519,2,18000,0,'+05'),(1519,3,21600,1,'+06'),(1519,4,21600,0,'+06'),(1519,5,18000,0,'+05'),(1519,6,21600,1,'+06'),(1519,7,18000,1,'+05'),(1519,8,21600,0,'+06'),(1519,9,21600,1,'+06'),(1519,10,18000,0,'+05'),(1520,0,23087,0,'LMT'),(1520,1,23087,0,'RMT'),(1520,2,23400,0,'+0630'),(1520,3,32400,0,'+09'),(1520,4,23400,0,'+0630'),(1521,0,11212,0,'LMT'),(1521,1,10800,0,'+03'),(1522,0,25600,0,'LMT'),(1522,1,25590,0,'PLMT'),(1522,2,25200,0,'+07'),(1522,3,28800,0,'+08'),(1522,4,32400,0,'+09'),(1522,5,25200,0,'+07'),(1523,0,34248,0,'LMT'),(1523,1,32400,0,'+09'),(1523,2,43200,1,'+12'),(1523,3,39600,0,'+11'),(1523,4,39600,0,'+11'),(1523,5,43200,1,'+12'),(1523,6,39600,1,'+11'),(1523,7,36000,0,'+10'),(1523,8,39600,0,'+11'),(1524,0,16073,0,'LMT'),(1524,1,14400,0,'+04'),(1524,2,18000,0,'+05'),(1524,3,21600,1,'+06'),(1524,4,21600,0,'+06'),(1524,5,18000,0,'+05'),(1524,6,21600,1,'+06'),(1525,0,30472,0,'LMT'),(1525,1,30600,0,'KST'),(1525,2,32400,0,'JST'),(1525,3,36000,1,'KDT'),(1525,4,32400,0,'KST'),(1525,5,34200,1,'KDT'),(1525,6,36000,1,'KDT'),(1526,0,29143,0,'LMT'),(1526,1,32400,1,'CDT'),(1526,2,28800,0,'CST'),(1527,0,24925,0,'LMT'),(1527,1,24925,0,'SMT'),(1527,2,25200,0,'+07'),(1527,3,26400,1,'+0720'),(1527,4,26400,0,'+0720'),(1527,5,27000,0,'+0730'),(1527,6,32400,0,'+09'),(1527,7,28800,0,'+08'),(1528,0,36892,0,'LMT'),(1528,1,36000,0,'+10'),(1528,2,43200,1,'+12'),(1528,3,39600,0,'+11'),(1528,4,39600,0,'+11'),(1528,5,43200,1,'+12'),(1528,6,39600,1,'+11'),(1528,7,36000,0,'+10'),(1528,8,43200,0,'+12'),(1528,9,43200,1,'+12'),(1528,10,39600,0,'+11'),(1529,0,29160,0,'LMT'),(1529,1,28800,0,'CST'),(1529,2,32400,0,'JST'),(1529,3,32400,1,'CDT'),(1529,4,28800,0,'CST'),(1530,0,16631,0,'LMT'),(1530,1,18000,0,'+05'),(1530,2,25200,1,'+07'),(1530,3,21600,0,'+06'),(1530,4,21600,0,'+06'),(1530,5,25200,1,'+07'),(1530,6,21600,1,'+06'),(1530,7,18000,0,'+05'),(1531,0,10751,0,'LMT'),(1531,1,10751,0,'TBMT'),(1531,2,10800,0,'+03'),(1531,3,18000,1,'+05'),(1531,4,14400,0,'+04'),(1531,5,14400,0,'+04'),(1531,6,18000,1,'+05'),(1531,7,14400,1,'+04'),(1531,8,10800,0,'+03'),(1531,9,14400,1,'+04'),(1531,10,14400,0,'+04'),(1532,0,12344,0,'LMT'),(1532,1,12344,0,'TMT'),(1532,2,12600,0,'+0330'),(1532,3,18000,1,'+05'),(1532,4,14400,0,'+04'),(1532,5,16200,1,'+0430'),(1532,6,12600,0,'+0330'),(1533,0,8454,0,'LMT'),(1533,1,8440,0,'JMT'),(1533,2,10800,1,'IDT'),(1533,3,7200,0,'IST'),(1533,4,14400,1,'IDDT'),(1533,5,10800,1,'IDT'),(1534,0,21516,0,'LMT'),(1534,1,19800,0,'+0530'),(1534,2,21600,0,'+06'),(1535,0,21516,0,'LMT'),(1535,1,19800,0,'+0530'),(1535,2,21600,0,'+06'),(1536,0,33539,0,'LMT'),(1536,1,36000,1,'JDT'),(1536,2,32400,0,'JST'),(1536,3,32400,0,'JST'),(1537,0,20391,0,'LMT'),(1537,1,21600,0,'+06'),(1537,2,28800,1,'+08'),(1537,3,25200,0,'+07'),(1537,4,25200,0,'+07'),(1537,5,28800,1,'+08'),(1537,6,25200,1,'+07'),(1537,7,21600,0,'+06'),(1537,8,25200,1,'+07'),(1537,9,25200,0,'+07'),(1538,0,28656,0,'LMT'),(1538,1,28656,0,'MMT'),(1538,2,28800,0,'+08'),(1538,3,32400,0,'+09'),(1538,4,28800,0,'WITA'),(1539,0,25652,0,'LMT'),(1539,1,25200,0,'+07'),(1539,2,32400,1,'+09'),(1539,3,28800,0,'+08'),(1540,0,25652,0,'LMT'),(1540,1,25200,0,'+07'),(1540,2,32400,1,'+09'),(1540,3,28800,0,'+08'),(1541,0,21020,0,'LMT'),(1541,1,21600,0,'+06'),(1542,0,34374,0,'LMT'),(1542,1,28800,0,'+08'),(1542,2,32400,0,'+09'),(1542,3,39600,0,'+11'),(1542,4,43200,1,'+12'),(1542,5,39600,0,'+11'),(1542,6,43200,1,'+12'),(1542,7,39600,1,'+11'),(1542,8,36000,0,'+10'),(1542,9,43200,0,'+12'),(1542,10,43200,1,'+12'),(1542,11,36000,0,'+10'),(1543,0,24124,0,'LMT'),(1543,1,24124,0,'BMT'),(1543,2,25200,0,'+07'),(1544,0,31651,0,'LMT'),(1544,1,32400,0,'+09'),(1544,2,39600,1,'+11'),(1544,3,36000,0,'+10'),(1544,4,36000,0,'+10'),(1544,5,39600,1,'+11'),(1544,6,36000,1,'+10'),(1544,7,32400,0,'+09'),(1544,8,39600,0,'+11'),(1544,9,39600,1,'+11'),(1544,10,36000,0,'+10'),(1545,0,31138,0,'LMT'),(1545,1,28800,0,'+08'),(1545,2,36000,1,'+10'),(1545,3,32400,0,'+09'),(1545,4,32400,0,'+09'),(1545,5,36000,1,'+10'),(1545,6,32400,1,'+09'),(1545,7,28800,0,'+08'),(1545,8,36000,0,'+10'),(1545,9,36000,1,'+10'),(1545,10,32400,0,'+09'),(1546,0,23087,0,'LMT'),(1546,1,23087,0,'RMT'),(1546,2,23400,0,'+0630'),(1546,3,32400,0,'+09'),(1546,4,23400,0,'+0630'),(1547,0,14553,0,'LMT'),(1547,1,13505,0,'PMT'),(1547,2,14400,0,'+04'),(1547,3,21600,1,'+06'),(1547,4,18000,0,'+05'),(1547,5,18000,0,'+05'),(1547,6,21600,1,'+06'),(1547,7,18000,1,'+05'),(1547,8,14400,0,'+04'),(1547,9,21600,0,'+06'),(1547,10,21600,1,'+06'),(1547,11,18000,0,'+05'),(1548,0,10680,0,'LMT'),(1548,1,10800,0,'+03'),(1548,2,18000,1,'+05'),(1548,3,14400,0,'+04'),(1548,4,14400,0,'+04'),(1548,5,18000,1,'+05'),(1548,6,14400,1,'+04'),(1548,7,10800,0,'+03'),(1548,8,18000,1,'+05'),(1548,9,14400,0,'+04'),(1549,0,-6160,0,'LMT'),(1549,1,-6872,0,'HMT'),(1549,2,-3600,1,'-01'),(1549,3,-7200,0,'-02'),(1549,4,-3600,1,'-01'),(1549,5,-7200,0,'-02'),(1549,6,-7200,0,'-02'),(1549,7,0,1,'+00'),(1549,8,-3600,0,'-01'),(1549,9,-3600,0,'-01'),(1549,10,0,0,'WET'),(1549,11,0,1,'+00'),(1549,12,-3600,0,'-01'),(1550,0,-15558,0,'LMT'),(1550,1,-14400,0,'AST'),(1550,2,-10800,1,'ADT'),(1551,0,-3696,0,'LMT'),(1551,1,-3600,0,'-01'),(1551,2,0,0,'WET'),(1551,3,3600,1,'WEST'),(1551,4,0,0,'WET'),(1551,5,3600,1,'WEST'),(1552,0,-5644,0,'LMT'),(1552,1,-7200,0,'-02'),(1552,2,-3600,1,'-01'),(1552,3,-7200,0,'-02'),(1552,4,-3600,0,'-01'),(1553,0,-1624,0,'LMT'),(1553,1,0,0,'WET'),(1553,2,3600,1,'WEST'),(1553,3,0,0,'WET'),(1554,0,-1624,0,'LMT'),(1554,1,0,0,'WET'),(1554,2,3600,1,'WEST'),(1554,3,0,0,'WET'),(1555,0,2580,0,'LMT'),(1555,1,7200,1,'CEST'),(1555,2,3600,0,'CET'),(1555,3,3600,0,'CET'),(1555,4,7200,1,'CEST'),(1555,5,7200,1,'CEST'),(1555,6,3600,0,'CET'),(1556,0,-4056,0,'LMT'),(1556,1,-4056,0,'FMT'),(1556,2,0,1,'+00'),(1556,3,-3600,0,'-01'),(1556,4,0,1,'+00'),(1556,5,-3600,0,'-01'),(1556,6,-3600,0,'-01'),(1556,7,3600,1,'+01'),(1556,8,3600,1,'WEST'),(1556,9,0,0,'WET'),(1556,10,0,0,'WET'),(1556,11,0,0,'WET'),(1556,12,3600,1,'WEST'),(1557,0,-5280,0,'LMT'),(1557,1,0,1,'+00'),(1557,2,-3600,0,'-01'),(1557,3,-3600,0,'-01'),(1557,4,0,1,'+00'),(1557,5,0,0,'GMT'),(1558,0,-7200,0,'-02'),(1559,0,-968,0,'LMT'),(1559,1,0,0,'GMT'),(1560,0,-13884,0,'LMT'),(1560,1,-13884,0,'SMT'),(1560,2,-10800,1,'-03'),(1560,3,-14400,0,'-04'),(1560,4,-7200,1,'-02'),(1560,5,-10800,0,'-03'),(1560,6,-10800,1,'-03'),(1561,0,36292,0,'LMT'),(1561,1,39600,1,'AEDT'),(1561,2,36000,0,'AEST'),(1561,3,39600,1,'AEDT'),(1561,4,36000,0,'AEST'),(1562,0,32400,0,'ACST'),(1562,1,37800,1,'ACDT'),(1562,2,34200,0,'ACST'),(1562,3,37800,1,'ACDT'),(1562,4,34200,0,'ACST'),(1563,0,36728,0,'LMT'),(1563,1,39600,1,'AEDT'),(1563,2,36000,0,'AEST'),(1563,3,39600,1,'AEDT'),(1563,4,36000,0,'AEST'),(1564,0,32400,0,'ACST'),(1564,1,37800,1,'ACDT'),(1564,2,34200,0,'ACST'),(1564,3,37800,1,'ACDT'),(1564,4,34200,0,'ACST'),(1565,0,36292,0,'LMT'),(1565,1,39600,1,'AEDT'),(1565,2,36000,0,'AEST'),(1565,3,39600,1,'AEDT'),(1565,4,36000,0,'AEST'),(1566,0,34528,0,'LMT'),(1566,1,36000,0,'AEST'),(1566,2,39600,1,'AEDT'),(1566,3,39600,1,'AEDT'),(1566,4,36000,0,'AEST'),(1567,0,32400,0,'ACST'),(1567,1,37800,1,'ACDT'),(1567,2,34200,0,'ACST'),(1568,0,30928,0,'LMT'),(1568,1,35100,1,'+0945'),(1568,2,31500,0,'+0845'),(1568,3,35100,1,'+0945'),(1568,4,31500,0,'+0845'),(1569,0,35356,0,'LMT'),(1569,1,36000,0,'AEST'),(1569,2,39600,1,'AEDT'),(1569,3,39600,1,'AEDT'),(1569,4,36000,0,'AEST'),(1570,0,38180,0,'LMT'),(1570,1,36000,0,'AEST'),(1570,2,41400,1,'+1130'),(1570,3,37800,0,'+1030'),(1570,4,39600,1,'+11'),(1571,0,35756,0,'LMT'),(1571,1,39600,1,'AEDT'),(1571,2,36000,0,'AEST'),(1571,3,39600,1,'AEDT'),(1571,4,36000,0,'AEST'),(1572,0,38180,0,'LMT'),(1572,1,36000,0,'AEST'),(1572,2,41400,1,'+1130'),(1572,3,37800,0,'+1030'),(1572,4,39600,1,'+11'),(1573,0,34792,0,'LMT'),(1573,1,39600,1,'AEDT'),(1573,2,36000,0,'AEST'),(1573,3,39600,1,'AEDT'),(1573,4,36000,0,'AEST'),(1574,0,36292,0,'LMT'),(1574,1,39600,1,'AEDT'),(1574,2,36000,0,'AEST'),(1574,3,39600,1,'AEDT'),(1574,4,36000,0,'AEST'),(1575,0,32400,0,'ACST'),(1575,1,37800,1,'ACDT'),(1575,2,34200,0,'ACST'),(1576,0,27804,0,'LMT'),(1576,1,32400,1,'AWDT'),(1576,2,28800,0,'AWST'),(1576,3,32400,1,'AWDT'),(1576,4,28800,0,'AWST'),(1577,0,36728,0,'LMT'),(1577,1,39600,1,'AEDT'),(1577,2,36000,0,'AEST'),(1577,3,39600,1,'AEDT'),(1577,4,36000,0,'AEST'),(1578,0,32400,0,'ACST'),(1578,1,37800,1,'ACDT'),(1578,2,34200,0,'ACST'),(1578,3,37800,1,'ACDT'),(1578,4,34200,0,'ACST'),(1579,0,36292,0,'LMT'),(1579,1,39600,1,'AEDT'),(1579,2,36000,0,'AEST'),(1579,3,39600,1,'AEDT'),(1579,4,36000,0,'AEST'),(1580,0,35356,0,'LMT'),(1580,1,36000,0,'AEST'),(1580,2,39600,1,'AEDT'),(1580,3,39600,1,'AEDT'),(1580,4,36000,0,'AEST'),(1581,0,34792,0,'LMT'),(1581,1,39600,1,'AEDT'),(1581,2,36000,0,'AEST'),(1581,3,39600,1,'AEDT'),(1581,4,36000,0,'AEST'),(1582,0,27804,0,'LMT'),(1582,1,32400,1,'AWDT'),(1582,2,28800,0,'AWST'),(1582,3,32400,1,'AWDT'),(1582,4,28800,0,'AWST'),(1583,0,32400,0,'ACST'),(1583,1,37800,1,'ACDT'),(1583,2,34200,0,'ACST'),(1583,3,37800,1,'ACDT'),(1583,4,34200,0,'ACST'),(1584,0,-16272,0,'LMT'),(1584,1,-14400,1,'-04'),(1584,2,-18000,0,'-05'),(1584,3,-14400,0,'-04'),(1584,4,-18000,0,'-05'),(1585,0,-7780,0,'LMT'),(1585,1,-3600,1,'-01'),(1585,2,-7200,0,'-02'),(1586,0,-11188,0,'LMT'),(1586,1,-7200,1,'-02'),(1586,2,-10800,0,'-03'),(1587,0,-14404,0,'LMT'),(1587,1,-10800,1,'-03'),(1587,2,-14400,0,'-04'),(1588,0,7200,1,'CEST'),(1588,1,3600,0,'CET'),(1588,2,7200,1,'CEST'),(1588,3,3600,0,'CET'),(1589,0,-18000,1,'CDT'),(1589,1,-21600,0,'CST'),(1589,2,-18000,1,'CWT'),(1589,3,-18000,1,'CPT'),(1590,0,-15264,0,'LMT'),(1590,1,-10800,1,'ADT'),(1590,2,-14400,0,'AST'),(1590,3,-10800,1,'AWT'),(1590,4,-10800,1,'APT'),(1591,0,-23316,0,'LMT'),(1591,1,-18000,1,'CDT'),(1591,2,-21600,0,'CST'),(1591,3,-18000,1,'CWT'),(1591,4,-18000,1,'CPT'),(1591,5,-18000,1,'CDT'),(1591,6,-21600,0,'CST'),(1592,0,-19052,0,'LMT'),(1592,1,-14400,1,'EDT'),(1592,2,-18000,0,'EST'),(1592,3,-14400,1,'EWT'),(1592,4,-14400,1,'EPT'),(1593,0,-27232,0,'LMT'),(1593,1,-21600,1,'MDT'),(1593,2,-25200,0,'MST'),(1593,3,-21600,1,'MWT'),(1593,4,-21600,1,'MPT'),(1594,0,-12652,0,'LMT'),(1594,1,-9052,1,'NDT'),(1594,2,-12652,0,'NST'),(1594,3,-9000,1,'NDT'),(1594,4,-12600,0,'NST'),(1594,5,-9000,1,'NPT'),(1594,6,-9000,1,'NWT'),(1594,7,-5400,1,'NDDT'),(1594,8,-9000,1,'NDT'),(1595,0,-29548,0,'LMT'),(1595,1,-25200,1,'PDT'),(1595,2,-28800,0,'PST'),(1595,3,-25200,1,'PWT'),(1595,4,-25200,1,'PPT'),(1596,0,-25116,0,'LMT'),(1596,1,-21600,1,'MDT'),(1596,2,-25200,0,'MST'),(1596,3,-21600,1,'MWT'),(1596,4,-21600,1,'MPT'),(1596,5,-21600,0,'CST'),(1597,0,-32412,0,'LMT'),(1597,1,-28800,1,'YDT'),(1597,2,-32400,0,'YST'),(1597,3,-28800,1,'YWT'),(1597,4,-28800,1,'YPT'),(1597,5,-25200,1,'YDDT'),(1597,6,-28800,0,'PST'),(1597,7,-25200,1,'PDT'),(1598,0,-16966,0,'LMT'),(1598,1,-16966,0,'SMT'),(1598,2,-18000,0,'-05'),(1598,3,-14400,0,'-04'),(1598,4,-14400,1,'-04'),(1598,5,-10800,1,'-03'),(1598,6,-10800,1,'-03'),(1598,7,-14400,0,'-04'),(1599,0,-26248,0,'LMT'),(1599,1,-26248,0,'EMT'),(1599,2,-21600,1,'-06'),(1599,3,-25200,0,'-07'),(1599,4,-25200,0,'-07'),(1599,5,-21600,0,'-06'),(1599,6,-18000,1,'-05'),(1600,0,-19768,0,'LMT'),(1600,1,-19776,0,'HMT'),(1600,2,-14400,1,'CDT'),(1600,3,-18000,0,'CST'),(1600,4,-18000,0,'CST'),(1600,5,-14400,1,'CDT'),(1601,0,10800,1,'EEST'),(1601,1,7200,0,'EET'),(1602,0,-18000,0,'EST'),(1603,0,-14400,1,'EDT'),(1603,1,-18000,0,'EST'),(1603,2,-14400,1,'EWT'),(1603,3,-14400,1,'EPT'),(1604,0,7509,0,'LMT'),(1604,1,10800,1,'EEST'),(1604,2,7200,0,'EET'),(1604,3,10800,1,'EEST'),(1605,0,-1500,0,'LMT'),(1605,1,-1521,0,'DMT'),(1605,2,2079,1,'IST'),(1605,3,3600,1,'BST'),(1605,4,0,0,'GMT'),(1605,5,3600,1,'IST'),(1605,6,0,0,'GMT'),(1605,7,0,1,'GMT'),(1605,8,3600,0,'IST'),(1605,9,3600,0,'IST'),(1606,0,0,0,'GMT'),(1607,0,0,0,'GMT'),(1608,0,-3600,0,'-01'),(1609,0,-36000,0,'-10'),(1610,0,-39600,0,'-11'),(1611,0,-43200,0,'-12'),(1612,0,-7200,0,'-02'),(1613,0,-10800,0,'-03'),(1614,0,-14400,0,'-04'),(1615,0,-18000,0,'-05'),(1616,0,-21600,0,'-06'),(1617,0,-25200,0,'-07'),(1618,0,-28800,0,'-08'),(1619,0,-32400,0,'-09'),(1620,0,0,0,'GMT'),(1621,0,3600,0,'+01'),(1622,0,36000,0,'+10'),(1623,0,39600,0,'+11'),(1624,0,43200,0,'+12'),(1625,0,46800,0,'+13'),(1626,0,50400,0,'+14'),(1627,0,7200,0,'+02'),(1628,0,10800,0,'+03'),(1629,0,14400,0,'+04'),(1630,0,18000,0,'+05'),(1631,0,21600,0,'+06'),(1632,0,25200,0,'+07'),(1633,0,28800,0,'+08'),(1634,0,32400,0,'+09'),(1635,0,0,0,'GMT'),(1636,0,0,0,'GMT'),(1637,0,0,0,'UTC'),(1638,0,0,0,'UTC'),(1639,0,0,0,'UTC'),(1640,0,0,0,'UTC'),(1641,0,1172,0,'LMT'),(1641,1,4772,1,'NST'),(1641,2,1172,0,'AMT'),(1641,3,4772,1,'NST'),(1641,4,1172,0,'AMT'),(1641,5,1200,0,'+0020'),(1641,6,4800,1,'+0120'),(1641,7,4800,1,'+0120'),(1641,8,3600,0,'CET'),(1641,9,7200,1,'CEST'),(1641,10,7200,1,'CEST'),(1641,11,7200,1,'CEST'),(1641,12,3600,0,'CET'),(1641,13,3600,0,'CET'),(1642,0,364,0,'LMT'),(1642,1,0,0,'WET'),(1642,2,3600,0,'CET'),(1642,3,7200,1,'CEST'),(1642,4,3600,0,'CET'),(1643,0,11532,0,'LMT'),(1643,1,10800,0,'+03'),(1643,2,18000,1,'+05'),(1643,3,14400,0,'+04'),(1643,4,14400,0,'+04'),(1643,5,18000,1,'+05'),(1643,6,14400,1,'+04'),(1643,7,10800,0,'+03'),(1643,8,14400,0,'+04'),(1644,0,5692,0,'LMT'),(1644,1,5692,0,'AMT'),(1644,2,10800,1,'EEST'),(1644,3,7200,0,'EET'),(1644,4,3600,0,'CET'),(1644,5,7200,1,'CEST'),(1644,6,10800,1,'EEST'),(1644,7,7200,0,'EET'),(1644,8,10800,1,'EEST'),(1644,9,7200,0,'EET'),(1645,0,-75,0,'LMT'),(1645,1,3600,1,'BST'),(1645,2,0,0,'GMT'),(1645,3,7200,1,'BDST'),(1645,4,3600,0,'BST'),(1645,5,3600,1,'BST'),(1645,6,0,0,'GMT'),(1645,7,0,0,'GMT'),(1646,0,4920,0,'LMT'),(1646,1,3600,0,'CET'),(1646,2,3600,0,'CET'),(1646,3,7200,1,'CEST'),(1646,4,7200,1,'CEST'),(1646,5,7200,1,'CEST'),(1646,6,3600,0,'CET'),(1647,0,3208,0,'LMT'),(1647,1,7200,1,'CEST'),(1647,2,3600,0,'CET'),(1647,3,7200,1,'CEST'),(1647,4,3600,0,'CET'),(1647,5,10800,1,'CEMT'),(1647,6,10800,1,'CEMT'),(1647,7,7200,1,'CEST'),(1647,8,3600,0,'CET'),(1648,0,3464,0,'PMT'),(1648,1,7200,1,'CEST'),(1648,2,3600,0,'CET'),(1648,3,7200,1,'CEST'),(1648,4,3600,0,'CET'),(1648,5,0,1,'GMT'),(1648,6,7200,1,'CEST'),(1648,7,3600,0,'CET'),(1649,0,1050,0,'BMT'),(1649,1,0,0,'WET'),(1649,2,3600,0,'CET'),(1649,3,7200,1,'CEST'),(1649,4,3600,0,'CET'),(1649,5,7200,1,'CEST'),(1649,6,3600,1,'WEST'),(1649,7,0,0,'WET'),(1649,8,0,0,'WET'),(1649,9,7200,1,'CEST'),(1649,10,3600,0,'CET'),(1650,0,6264,0,'LMT'),(1650,1,6264,0,'BMT'),(1650,2,10800,1,'EEST'),(1650,3,7200,0,'EET'),(1650,4,10800,1,'EEST'),(1650,5,7200,0,'EET'),(1650,6,10800,1,'EEST'),(1650,7,7200,0,'EET'),(1651,0,4580,0,'LMT'),(1651,1,7200,1,'CEST'),(1651,2,3600,0,'CET'),(1651,3,7200,1,'CEST'),(1651,4,3600,0,'CET'),(1651,5,3600,0,'CET'),(1651,6,7200,1,'CEST'),(1652,0,1786,0,'BMT'),(1652,1,7200,1,'CEST'),(1652,2,3600,0,'CET'),(1652,3,7200,1,'CEST'),(1652,4,3600,0,'CET'),(1653,0,6920,0,'LMT'),(1653,1,6900,0,'CMT'),(1653,2,6264,0,'BMT'),(1653,3,10800,1,'EEST'),(1653,4,7200,0,'EET'),(1653,5,7200,0,'EET'),(1653,6,10800,1,'EEST'),(1653,7,3600,0,'CET'),(1653,8,7200,1,'CEST'),(1653,9,7200,1,'CEST'),(1653,10,14400,1,'MSD'),(1653,11,10800,0,'MSK'),(1653,12,10800,0,'MSK'),(1653,13,14400,1,'MSD'),(1653,14,10800,1,'EEST'),(1653,15,7200,0,'EET'),(1654,0,3020,0,'CMT'),(1654,1,7200,1,'CEST'),(1654,2,3600,0,'CET'),(1654,3,3600,0,'CET'),(1654,4,7200,1,'CEST'),(1654,5,7200,1,'CEST'),(1654,6,3600,0,'CET'),(1655,0,-1500,0,'LMT'),(1655,1,-1521,0,'DMT'),(1655,2,2079,1,'IST'),(1655,3,3600,1,'BST'),(1655,4,0,0,'GMT'),(1655,5,3600,1,'IST'),(1655,6,0,0,'GMT'),(1655,7,0,1,'GMT'),(1655,8,3600,0,'IST'),(1655,9,3600,0,'IST'),(1656,0,-1284,0,'LMT'),(1656,1,3600,1,'BST'),(1656,2,0,0,'GMT'),(1656,3,7200,1,'BDST'),(1656,4,3600,0,'CET'),(1656,5,7200,1,'CEST'),(1656,6,3600,0,'CET'),(1657,0,-75,0,'LMT'),(1657,1,3600,1,'BST'),(1657,2,0,0,'GMT'),(1657,3,7200,1,'BDST'),(1657,4,3600,0,'BST'),(1657,5,3600,1,'BST'),(1657,6,0,0,'GMT'),(1657,7,0,0,'GMT'),(1658,0,5989,0,'LMT'),(1658,1,5989,0,'HMT'),(1658,2,10800,1,'EEST'),(1658,3,7200,0,'EET'),(1658,4,10800,1,'EEST'),(1658,5,7200,0,'EET'),(1659,0,-75,0,'LMT'),(1659,1,3600,1,'BST'),(1659,2,0,0,'GMT'),(1659,3,7200,1,'BDST'),(1659,4,3600,0,'BST'),(1659,5,3600,1,'BST'),(1659,6,0,0,'GMT'),(1659,7,0,0,'GMT'),(1660,0,6952,0,'LMT'),(1660,1,7016,0,'IMT'),(1660,2,10800,1,'EEST'),(1660,3,7200,0,'EET'),(1660,4,10800,0,'+03'),(1660,5,14400,1,'+04'),(1660,6,10800,1,'EEST'),(1660,7,7200,0,'EET'),(1660,8,10800,1,'EEST'),(1660,9,7200,0,'EET'),(1660,10,10800,0,'+03'),(1661,0,-75,0,'LMT'),(1661,1,3600,1,'BST'),(1661,2,0,0,'GMT'),(1661,3,7200,1,'BDST'),(1661,4,3600,0,'BST'),(1661,5,3600,1,'BST'),(1661,6,0,0,'GMT'),(1661,7,0,0,'GMT'),(1662,0,4920,0,'LMT'),(1662,1,7200,1,'CEST'),(1662,2,3600,0,'CET'),(1662,3,7200,1,'CEST'),(1662,4,3600,0,'CET'),(1662,5,10800,1,'EEST'),(1662,6,7200,0,'EET'),(1662,7,14400,1,'MSD'),(1662,8,10800,0,'MSK'),(1662,9,10800,0,'MSK'),(1662,10,14400,1,'MSD'),(1662,11,10800,1,'EEST'),(1662,12,7200,0,'EET'),(1662,13,10800,0,'+03'),(1662,14,7200,0,'EET'),(1663,0,7324,0,'LMT'),(1663,1,7324,0,'KMT'),(1663,2,7200,0,'EET'),(1663,3,10800,0,'MSK'),(1663,4,3600,0,'CET'),(1663,5,7200,1,'CEST'),(1663,6,7200,1,'CEST'),(1663,7,14400,1,'MSD'),(1663,8,10800,0,'MSK'),(1663,9,14400,1,'MSD'),(1663,10,10800,1,'EEST'),(1663,11,10800,1,'EEST'),(1663,12,7200,0,'EET'),(1664,0,11928,0,'LMT'),(1664,1,10800,0,'+03'),(1664,2,18000,1,'+05'),(1664,3,14400,0,'+04'),(1664,4,14400,0,'+04'),(1664,5,18000,1,'+05'),(1664,6,14400,1,'+04'),(1664,7,10800,0,'+03'),(1665,0,-2205,0,'LMT'),(1665,1,3600,1,'WEST'),(1665,2,0,0,'WET'),(1665,3,3600,1,'WEST'),(1665,4,0,0,'WET'),(1665,5,7200,1,'WEMT'),(1665,6,0,0,'WET'),(1665,7,3600,0,'CET'),(1665,8,3600,0,'CET'),(1665,9,7200,1,'CEST'),(1665,10,3600,1,'WEST'),(1665,11,0,0,'WET'),(1666,0,4920,0,'LMT'),(1666,1,3600,0,'CET'),(1666,2,3600,0,'CET'),(1666,3,7200,1,'CEST'),(1666,4,7200,1,'CEST'),(1666,5,7200,1,'CEST'),(1666,6,3600,0,'CET'),(1667,0,-75,0,'LMT'),(1667,1,3600,1,'BST'),(1667,2,0,0,'GMT'),(1667,3,7200,1,'BDST'),(1667,4,3600,0,'BST'),(1667,5,3600,1,'BST'),(1667,6,0,0,'GMT'),(1667,7,0,0,'GMT'),(1668,0,1476,0,'LMT'),(1668,1,7200,1,'CEST'),(1668,2,3600,0,'CET'),(1668,3,7200,1,'CEST'),(1668,4,3600,0,'CET'),(1668,5,3600,1,'WEST'),(1668,6,0,0,'WET'),(1668,7,0,0,'WET'),(1668,8,3600,1,'WEST'),(1668,9,3600,0,'WET'),(1668,10,7200,1,'WEST'),(1668,11,7200,1,'WEST'),(1668,12,7200,1,'CEST'),(1668,13,3600,0,'CET'),(1669,0,-884,0,'LMT'),(1669,1,3600,1,'WEST'),(1669,2,0,0,'WET'),(1669,3,7200,1,'WEMT'),(1669,4,0,0,'WET'),(1669,5,7200,1,'CEST'),(1669,6,3600,0,'CET'),(1669,7,7200,1,'CEST'),(1669,8,3600,0,'CET'),(1669,9,7200,1,'CEST'),(1669,10,3600,0,'CET'),(1670,0,3484,0,'LMT'),(1670,1,7200,1,'CEST'),(1670,2,3600,0,'CET'),(1670,3,3600,0,'CET'),(1670,4,7200,1,'CEST'),(1670,5,7200,1,'CEST'),(1670,6,3600,0,'CET'),(1671,0,5989,0,'LMT'),(1671,1,5989,0,'HMT'),(1671,2,10800,1,'EEST'),(1671,3,7200,0,'EET'),(1671,4,10800,1,'EEST'),(1671,5,7200,0,'EET'),(1672,0,6616,0,'LMT'),(1672,1,6600,0,'MMT'),(1672,2,7200,0,'EET'),(1672,3,10800,0,'MSK'),(1672,4,3600,0,'CET'),(1672,5,7200,1,'CEST'),(1672,6,7200,1,'CEST'),(1672,7,14400,1,'MSD'),(1672,8,10800,0,'MSK'),(1672,9,14400,1,'MSD'),(1672,10,10800,1,'EEST'),(1672,11,7200,0,'EET'),(1672,12,10800,0,'+03'),(1673,0,1772,0,'LMT'),(1673,1,561,0,'PMT'),(1673,2,3600,1,'WEST'),(1673,3,0,0,'WET'),(1673,4,3600,1,'WEST'),(1673,5,7200,1,'WEMT'),(1673,6,0,0,'WET'),(1673,7,7200,1,'CEST'),(1673,8,3600,0,'CET'),(1673,9,7200,1,'CEST'),(1673,10,3600,0,'CET'),(1674,0,9017,0,'LMT'),(1674,1,9017,0,'MMT'),(1674,2,12679,1,'MST'),(1674,3,9079,0,'MMT'),(1674,4,16279,1,'MDST'),(1674,5,14400,1,'MSD'),(1674,6,10800,0,'MSK'),(1674,7,14400,1,'MSD'),(1674,8,18000,1,'+05'),(1674,9,7200,0,'EET'),(1674,10,10800,0,'MSK'),(1674,11,14400,1,'MSD'),(1674,12,10800,1,'EEST'),(1674,13,7200,0,'EET'),(1674,14,14400,0,'MSK'),(1674,15,14400,1,'MSD'),(1674,16,10800,0,'MSK'),(1675,0,8008,0,'LMT'),(1675,1,10800,1,'EEST'),(1675,2,7200,0,'EET'),(1675,3,7200,0,'EET'),(1675,4,10800,1,'EEST'),(1676,0,2580,0,'LMT'),(1676,1,7200,1,'CEST'),(1676,2,3600,0,'CET'),(1676,3,3600,0,'CET'),(1676,4,7200,1,'CEST'),(1676,5,7200,1,'CEST'),(1676,6,3600,0,'CET'),(1677,0,561,0,'LMT'),(1677,1,561,0,'PMT'),(1677,2,3600,1,'WEST'),(1677,3,0,0,'WET'),(1677,4,3600,1,'WEST'),(1677,5,0,0,'WET'),(1677,6,3600,0,'CET'),(1677,7,7200,1,'CEST'),(1677,8,7200,1,'CEST'),(1677,9,7200,1,'WEMT'),(1677,10,3600,0,'CET'),(1677,11,7200,1,'CEST'),(1677,12,3600,0,'CET'),(1678,0,4920,0,'LMT'),(1678,1,3600,0,'CET'),(1678,2,3600,0,'CET'),(1678,3,7200,1,'CEST'),(1678,4,7200,1,'CEST'),(1678,5,7200,1,'CEST'),(1678,6,3600,0,'CET'),(1679,0,3464,0,'PMT'),(1679,1,7200,1,'CEST'),(1679,2,3600,0,'CET'),(1679,3,7200,1,'CEST'),(1679,4,3600,0,'CET'),(1679,5,0,1,'GMT'),(1679,6,7200,1,'CEST'),(1679,7,3600,0,'CET'),(1680,0,5794,0,'LMT'),(1680,1,5794,0,'RMT'),(1680,2,9394,1,'LST'),(1680,3,7200,0,'EET'),(1680,4,10800,0,'MSK'),(1680,5,3600,0,'CET'),(1680,6,7200,1,'CEST'),(1680,7,7200,1,'CEST'),(1680,8,14400,1,'MSD'),(1680,9,10800,0,'MSK'),(1680,10,14400,1,'MSD'),(1680,11,10800,1,'EEST'),(1680,12,7200,0,'EET'),(1680,13,10800,1,'EEST'),(1680,14,7200,0,'EET'),(1681,0,2996,0,'RMT'),(1681,1,7200,1,'CEST'),(1681,2,3600,0,'CET'),(1681,3,3600,0,'CET'),(1681,4,7200,1,'CEST'),(1681,5,7200,1,'CEST'),(1681,6,3600,0,'CET'),(1682,0,12020,0,'LMT'),(1682,1,10800,0,'+03'),(1682,2,14400,0,'+04'),(1682,3,18000,1,'+05'),(1682,4,14400,0,'+04'),(1682,5,18000,1,'+05'),(1682,6,14400,1,'+04'),(1682,7,10800,0,'+03'),(1682,8,10800,1,'+03'),(1682,9,14400,1,'+04'),(1682,10,14400,0,'+04'),(1683,0,2996,0,'RMT'),(1683,1,7200,1,'CEST'),(1683,2,3600,0,'CET'),(1683,3,3600,0,'CET'),(1683,4,7200,1,'CEST'),(1683,5,7200,1,'CEST'),(1683,6,3600,0,'CET'),(1684,0,4920,0,'LMT'),(1684,1,3600,0,'CET'),(1684,2,3600,0,'CET'),(1684,3,7200,1,'CEST'),(1684,4,7200,1,'CEST'),(1684,5,7200,1,'CEST'),(1684,6,3600,0,'CET'),(1685,0,11058,0,'LMT'),(1685,1,10800,0,'+03'),(1685,2,18000,1,'+05'),(1685,3,14400,0,'+04'),(1685,4,14400,0,'+04'),(1685,5,18000,1,'+05'),(1685,6,14400,1,'+04'),(1685,7,10800,0,'+03'),(1685,8,14400,0,'+04'),(1686,0,8184,0,'LMT'),(1686,1,8160,0,'SMT'),(1686,2,7200,0,'EET'),(1686,3,10800,0,'MSK'),(1686,4,3600,0,'CET'),(1686,5,7200,1,'CEST'),(1686,6,7200,1,'CEST'),(1686,7,14400,1,'MSD'),(1686,8,10800,0,'MSK'),(1686,9,14400,1,'MSD'),(1686,10,10800,1,'EEST'),(1686,11,10800,1,'EEST'),(1686,12,7200,0,'EET'),(1686,13,14400,0,'MSK'),(1686,14,10800,0,'MSK'),(1687,0,4920,0,'LMT'),(1687,1,3600,0,'CET'),(1687,2,3600,0,'CET'),(1687,3,7200,1,'CEST'),(1687,4,7200,1,'CEST'),(1687,5,7200,1,'CEST'),(1687,6,3600,0,'CET'),(1688,0,7016,0,'IMT'),(1688,1,7200,0,'EET'),(1688,2,3600,0,'CET'),(1688,3,7200,1,'CEST'),(1688,4,3600,0,'CET'),(1688,5,10800,1,'EEST'),(1688,6,7200,0,'EET'),(1688,7,10800,1,'EEST'),(1688,8,10800,1,'EEST'),(1688,9,7200,0,'EET'),(1689,0,3614,0,'SET'),(1689,1,3600,0,'CET'),(1689,2,7200,1,'CEST'),(1689,3,7200,1,'CEST'),(1689,4,3600,0,'CET'),(1690,0,5940,0,'LMT'),(1690,1,5940,0,'TMT'),(1690,2,7200,1,'CEST'),(1690,3,3600,0,'CET'),(1690,4,3600,0,'CET'),(1690,5,7200,0,'EET'),(1690,6,10800,0,'MSK'),(1690,7,7200,1,'CEST'),(1690,8,14400,1,'MSD'),(1690,9,10800,0,'MSK'),(1690,10,14400,1,'MSD'),(1690,11,10800,1,'EEST'),(1690,12,7200,0,'EET'),(1690,13,7200,0,'EET'),(1690,14,10800,1,'EEST'),(1690,15,10800,1,'EEST'),(1691,0,4760,0,'LMT'),(1691,1,3600,0,'CET'),(1691,2,7200,1,'CEST'),(1691,3,3600,0,'CET'),(1691,4,7200,1,'CEST'),(1692,0,6920,0,'LMT'),(1692,1,6900,0,'CMT'),(1692,2,6264,0,'BMT'),(1692,3,10800,1,'EEST'),(1692,4,7200,0,'EET'),(1692,5,7200,0,'EET'),(1692,6,10800,1,'EEST'),(1692,7,3600,0,'CET'),(1692,8,7200,1,'CEST'),(1692,9,7200,1,'CEST'),(1692,10,14400,1,'MSD'),(1692,11,10800,0,'MSK'),(1692,12,10800,0,'MSK'),(1692,13,14400,1,'MSD'),(1692,14,10800,1,'EEST'),(1692,15,7200,0,'EET'),(1693,0,11616,0,'LMT'),(1693,1,10800,0,'+03'),(1693,2,18000,1,'+05'),(1693,3,14400,0,'+04'),(1693,4,14400,0,'+04'),(1693,5,18000,1,'+05'),(1693,6,14400,1,'+04'),(1693,7,10800,0,'+03'),(1693,8,10800,1,'+03'),(1693,9,7200,0,'+02'),(1693,10,14400,1,'+04'),(1693,11,14400,0,'+04'),(1694,0,5352,0,'LMT'),(1694,1,3600,0,'CET'),(1694,2,7200,1,'CEST'),(1694,3,3600,0,'CET'),(1694,4,7200,1,'CEST'),(1694,5,14400,1,'MSD'),(1694,6,10800,0,'MSK'),(1694,7,10800,0,'MSK'),(1694,8,14400,1,'MSD'),(1694,9,7200,0,'EET'),(1694,10,10800,1,'EEST'),(1694,11,10800,1,'EEST'),(1694,12,7200,0,'EET'),(1695,0,1786,0,'BMT'),(1695,1,7200,1,'CEST'),(1695,2,3600,0,'CET'),(1695,3,7200,1,'CEST'),(1695,4,3600,0,'CET'),(1696,0,2996,0,'RMT'),(1696,1,7200,1,'CEST'),(1696,2,3600,0,'CET'),(1696,3,3600,0,'CET'),(1696,4,7200,1,'CEST'),(1696,5,7200,1,'CEST'),(1696,6,3600,0,'CET'),(1697,0,3921,0,'LMT'),(1697,1,7200,1,'CEST'),(1697,2,3600,0,'CET'),(1697,3,7200,1,'CEST'),(1697,4,3600,0,'CET'),(1697,5,7200,1,'CEST'),(1697,6,3600,0,'CET'),(1698,0,6076,0,'LMT'),(1698,1,5040,0,'WMT'),(1698,2,5736,0,'KMT'),(1698,3,3600,0,'CET'),(1698,4,7200,0,'EET'),(1698,5,10800,0,'MSK'),(1698,6,3600,0,'CET'),(1698,7,7200,1,'CEST'),(1698,8,7200,1,'CEST'),(1698,9,14400,1,'MSD'),(1698,10,10800,0,'MSK'),(1698,11,14400,1,'MSD'),(1698,12,10800,1,'EEST'),(1698,13,7200,0,'EET'),(1698,14,7200,1,'CEST'),(1698,15,3600,0,'CET'),(1698,16,7200,0,'EET'),(1698,17,10800,1,'EEST'),(1699,0,10660,0,'LMT'),(1699,1,10800,0,'+03'),(1699,2,14400,0,'+04'),(1699,3,18000,1,'+05'),(1699,4,14400,0,'+04'),(1699,5,18000,1,'+05'),(1699,6,14400,1,'+04'),(1699,7,10800,0,'+03'),(1699,8,14400,0,'+04'),(1700,0,5040,0,'LMT'),(1700,1,5040,0,'WMT'),(1700,2,7200,1,'CEST'),(1700,3,3600,0,'CET'),(1700,4,7200,1,'CEST'),(1700,5,3600,0,'CET'),(1700,6,10800,1,'EEST'),(1700,7,7200,0,'EET'),(1700,8,7200,0,'EET'),(1700,9,7200,1,'CEST'),(1700,10,3600,0,'CET'),(1701,0,4920,0,'LMT'),(1701,1,3600,0,'CET'),(1701,2,3600,0,'CET'),(1701,3,7200,1,'CEST'),(1701,4,7200,1,'CEST'),(1701,5,7200,1,'CEST'),(1701,6,3600,0,'CET'),(1702,0,8440,0,'LMT'),(1702,1,8400,0,'+0220'),(1702,2,7200,0,'EET'),(1702,3,10800,0,'MSK'),(1702,4,3600,0,'CET'),(1702,5,7200,1,'CEST'),(1702,6,7200,1,'CEST'),(1702,7,14400,1,'MSD'),(1702,8,10800,0,'MSK'),(1702,9,14400,1,'MSD'),(1702,10,10800,1,'EEST'),(1702,11,10800,1,'EEST'),(1702,12,7200,0,'EET'),(1703,0,1786,0,'BMT'),(1703,1,7200,1,'CEST'),(1703,2,3600,0,'CET'),(1703,3,7200,1,'CEST'),(1703,4,3600,0,'CET'),(1704,0,0,0,'-00'),(1705,0,-75,0,'LMT'),(1705,1,3600,1,'BST'),(1705,2,0,0,'GMT'),(1705,3,7200,1,'BDST'),(1705,4,3600,0,'BST'),(1705,5,3600,1,'BST'),(1705,6,0,0,'GMT'),(1705,7,0,0,'GMT'),(1706,0,-75,0,'LMT'),(1706,1,3600,1,'BST'),(1706,2,0,0,'GMT'),(1706,3,7200,1,'BDST'),(1706,4,3600,0,'BST'),(1706,5,3600,1,'BST'),(1706,6,0,0,'GMT'),(1706,7,0,0,'GMT'),(1707,0,0,0,'GMT'),(1708,0,0,0,'GMT'),(1709,0,0,0,'GMT'),(1710,0,0,0,'GMT'),(1711,0,0,0,'GMT'),(1712,0,-36000,0,'HST'),(1713,0,27402,0,'LMT'),(1713,1,28800,0,'HKT'),(1713,2,32400,1,'HKST'),(1713,3,30600,1,'HKWT'),(1713,4,32400,0,'JST'),(1713,5,28800,0,'HKT'),(1713,6,32400,1,'HKST'),(1714,0,-5280,0,'LMT'),(1714,1,0,1,'+00'),(1714,2,-3600,0,'-01'),(1714,3,-3600,0,'-01'),(1714,4,0,1,'+00'),(1714,5,0,0,'GMT'),(1715,0,8836,0,'LMT'),(1715,1,10800,0,'EAT'),(1715,2,9000,0,'+0230'),(1715,3,9900,0,'+0245'),(1715,4,10800,0,'EAT'),(1716,0,17380,0,'LMT'),(1716,1,18000,0,'+05'),(1716,2,21600,0,'+06'),(1717,0,25200,0,'+07'),(1718,0,23400,0,'+0630'),(1719,0,8836,0,'LMT'),(1719,1,10800,0,'EAT'),(1719,2,9000,0,'+0230'),(1719,3,9900,0,'+0245'),(1719,4,10800,0,'EAT'),(1720,0,0,0,'-00'),(1720,1,18000,0,'+05'),(1721,0,13308,0,'LMT'),(1721,1,14400,0,'+04'),(1722,0,17640,0,'LMT'),(1722,1,17640,0,'MMT'),(1722,2,18000,0,'+05'),(1723,0,13800,0,'LMT'),(1723,1,18000,1,'+05'),(1723,2,14400,0,'+04'),(1724,0,8836,0,'LMT'),(1724,1,10800,0,'EAT'),(1724,2,9000,0,'+0230'),(1724,3,9900,0,'+0245'),(1724,4,10800,0,'EAT'),(1725,0,13312,0,'LMT'),(1725,1,14400,0,'+04'),(1726,0,12344,0,'LMT'),(1726,1,12344,0,'TMT'),(1726,2,12600,0,'+0330'),(1726,3,18000,1,'+05'),(1726,4,14400,0,'+04'),(1726,5,16200,1,'+0430'),(1726,6,12600,0,'+0330'),(1727,0,8454,0,'LMT'),(1727,1,8440,0,'JMT'),(1727,2,10800,1,'IDT'),(1727,3,7200,0,'IST'),(1727,4,14400,1,'IDDT'),(1727,5,10800,1,'IDT'),(1728,0,-18430,0,'LMT'),(1728,1,-18430,0,'KMT'),(1728,2,-18000,0,'EST'),(1728,3,-14400,1,'EDT'),(1729,0,33539,0,'LMT'),(1729,1,36000,1,'JDT'),(1729,2,32400,0,'JST'),(1729,3,32400,0,'JST'),(1730,0,40160,0,'LMT'),(1730,1,39600,0,'+11'),(1730,2,36000,0,'+10'),(1730,3,32400,0,'+09'),(1730,4,-43200,0,'-12'),(1730,5,43200,0,'+12'),(1731,0,3164,0,'LMT'),(1731,1,7200,1,'CEST'),(1731,2,3600,0,'CET'),(1731,3,7200,0,'EET'),(1732,0,7200,1,'MEST'),(1732,1,3600,0,'MET'),(1732,2,7200,1,'MEST'),(1732,3,3600,0,'MET'),(1733,0,-25200,0,'MST'),(1734,0,-21600,1,'MDT'),(1734,1,-25200,0,'MST'),(1734,2,-21600,1,'MWT'),(1734,3,-21600,1,'MPT'),(1735,0,-28084,0,'LMT'),(1735,1,-25200,0,'MST'),(1735,2,-28800,0,'PST'),(1735,3,-25200,1,'PDT'),(1735,4,-25200,1,'PWT'),(1735,5,-25200,1,'PPT'),(1736,0,-25540,0,'LMT'),(1736,1,-25200,0,'MST'),(1736,2,-21600,0,'CST'),(1736,3,-28800,0,'PST'),(1736,4,-21600,1,'MDT'),(1736,5,-25200,0,'MST'),(1737,0,-23796,0,'LMT'),(1737,1,-25200,0,'MST'),(1737,2,-21600,0,'CST'),(1737,3,-18000,1,'CDT'),(1737,4,-18000,1,'CWT'),(1738,0,41944,0,'LMT'),(1738,1,45000,1,'NZST'),(1738,2,41400,0,'NZMT'),(1738,3,43200,1,'NZST'),(1738,4,46800,1,'NZDT'),(1738,5,43200,0,'NZST'),(1738,6,43200,0,'NZST'),(1739,0,44028,0,'LMT'),(1739,1,44100,0,'+1215'),(1739,2,49500,1,'+1345'),(1739,3,45900,0,'+1245'),(1739,4,45900,0,'+1245'),(1740,0,-25196,0,'LMT'),(1740,1,-21600,1,'MDT'),(1740,2,-25200,0,'MST'),(1740,3,-21600,1,'MWT'),(1740,4,-21600,1,'MPT'),(1741,0,29143,0,'LMT'),(1741,1,32400,1,'CDT'),(1741,2,28800,0,'CST'),(1742,0,-25200,1,'PDT'),(1742,1,-28800,0,'PST'),(1742,2,-25200,1,'PWT'),(1742,3,-25200,1,'PPT'),(1743,0,45184,0,'LMT'),(1743,1,-41216,0,'LMT'),(1743,2,-41400,0,'-1130'),(1743,3,-36000,1,'-10'),(1743,4,-39600,0,'-11'),(1743,5,46800,0,'+13'),(1743,6,50400,1,'+14'),(1744,0,41944,0,'LMT'),(1744,1,45000,1,'NZST'),(1744,2,41400,0,'NZMT'),(1744,3,43200,1,'NZST'),(1744,4,46800,1,'NZDT'),(1744,5,43200,0,'NZST'),(1744,6,43200,0,'NZST'),(1745,0,35312,0,'PMMT'),(1745,1,36000,0,'+10'),(1745,2,32400,0,'+09'),(1745,3,39600,0,'+11'),(1746,0,44028,0,'LMT'),(1746,1,44100,0,'+1215'),(1746,2,49500,1,'+1345'),(1746,3,45900,0,'+1245'),(1746,4,45900,0,'+1245'),(1747,0,36428,0,'LMT'),(1747,1,36000,0,'+10'),(1747,2,32400,0,'+09'),(1747,3,36000,0,'+10'),(1748,0,-26248,0,'LMT'),(1748,1,-26248,0,'EMT'),(1748,2,-21600,1,'-06'),(1748,3,-25200,0,'-07'),(1748,4,-25200,0,'-07'),(1748,5,-21600,0,'-06'),(1748,6,-18000,1,'-05'),(1749,0,40396,0,'LMT'),(1749,1,43200,1,'+12'),(1749,2,39600,0,'+11'),(1750,0,-41060,0,'LMT'),(1750,1,-43200,0,'-12'),(1750,2,-39600,0,'-11'),(1750,3,46800,0,'+13'),(1751,0,-41096,0,'LMT'),(1751,1,-39600,0,'-11'),(1751,2,46800,0,'+13'),(1752,0,42944,0,'LMT'),(1752,1,46800,1,'+13'),(1752,2,43200,0,'+12'),(1753,0,43200,0,'+12'),(1754,0,-21504,0,'LMT'),(1754,1,-18000,0,'-05'),(1754,2,-18000,1,'-05'),(1754,3,-21600,0,'-06'),(1755,0,-32388,0,'LMT'),(1755,1,-32400,0,'-09'),(1756,0,38388,0,'LMT'),(1756,1,39600,0,'+11'),(1757,0,34740,0,'LMT'),(1757,1,36000,0,'GST'),(1757,2,32400,0,'+09'),(1757,3,39600,1,'GDT'),(1757,4,36000,0,'ChST'),(1758,0,-37886,0,'LMT'),(1758,1,-37800,0,'HST'),(1758,2,-34200,1,'HDT'),(1758,3,-34200,1,'HWT'),(1758,4,-34200,1,'HPT'),(1758,5,-36000,0,'HST'),(1759,0,-37886,0,'LMT'),(1759,1,-37800,0,'HST'),(1759,2,-34200,1,'HDT'),(1759,3,-34200,1,'HWT'),(1759,4,-34200,1,'HPT'),(1759,5,-36000,0,'HST'),(1760,0,-37760,0,'LMT'),(1760,1,-38400,0,'-1040'),(1760,2,-36000,0,'-10'),(1760,3,50400,0,'+14'),(1761,0,39116,0,'LMT'),(1761,1,39600,0,'+11'),(1761,2,32400,0,'+09'),(1761,3,36000,0,'+10'),(1761,4,43200,0,'+12'),(1761,5,39600,0,'+11'),(1762,0,40160,0,'LMT'),(1762,1,39600,0,'+11'),(1762,2,36000,0,'+10'),(1762,3,32400,0,'+09'),(1762,4,-43200,0,'-12'),(1762,5,43200,0,'+12'),(1763,0,41088,0,'LMT'),(1763,1,39600,0,'+11'),(1763,2,32400,0,'+09'),(1763,3,36000,0,'+10'),(1763,4,43200,0,'+12'),(1764,0,-33480,0,'LMT'),(1764,1,-34200,0,'-0930'),(1765,0,45432,0,'LMT'),(1765,1,-40968,0,'LMT'),(1765,2,-39600,0,'SST'),(1766,0,40060,0,'LMT'),(1766,1,41400,0,'+1130'),(1766,2,32400,0,'+09'),(1766,3,43200,0,'+12'),(1767,0,-40780,0,'LMT'),(1767,1,-40800,0,'-1120'),(1767,2,-41400,0,'-1130'),(1767,3,-39600,0,'-11'),(1768,0,40312,0,'LMT'),(1768,1,40320,0,'+1112'),(1768,2,41400,0,'+1130'),(1768,3,45000,1,'+1230'),(1768,4,41400,0,'+1130'),(1768,5,39600,0,'+11'),(1768,6,43200,1,'+12'),(1768,7,39600,0,'+11'),(1769,0,39948,0,'LMT'),(1769,1,43200,1,'+12'),(1769,2,39600,0,'+11'),(1769,3,43200,1,'+12'),(1769,4,39600,0,'+11'),(1770,0,45432,0,'LMT'),(1770,1,-40968,0,'LMT'),(1770,2,-39600,0,'SST'),(1771,0,32400,0,'+09'),(1772,0,-31220,0,'LMT'),(1772,1,-30600,0,'-0830'),(1772,2,-28800,0,'-08'),(1773,0,37972,0,'LMT'),(1773,1,39600,0,'+11'),(1773,2,32400,0,'+09'),(1773,3,36000,0,'+10'),(1773,4,39600,0,'+11'),(1774,0,37972,0,'LMT'),(1774,1,39600,0,'+11'),(1774,2,32400,0,'+09'),(1774,3,36000,0,'+10'),(1774,4,39600,0,'+11'),(1775,0,36000,0,'+10'),(1776,0,-38344,0,'LMT'),(1776,1,-37800,0,'-1030'),(1776,2,-36000,0,'-10'),(1776,3,-34200,1,'-0930'),(1777,0,34740,0,'LMT'),(1777,1,36000,0,'GST'),(1777,2,32400,0,'+09'),(1777,3,39600,1,'GDT'),(1777,4,36000,0,'ChST'),(1778,0,45432,0,'LMT'),(1778,1,-40968,0,'LMT'),(1778,2,-39600,0,'SST'),(1779,0,-35896,0,'LMT'),(1779,1,-36000,0,'-10'),(1780,0,43200,0,'+12'),(1781,0,44360,0,'LMT'),(1781,1,44400,0,'+1220'),(1781,2,46800,0,'+13'),(1781,3,50400,1,'+14'),(1781,4,46800,0,'+13'),(1781,5,50400,1,'+14'),(1782,0,36428,0,'LMT'),(1782,1,36000,0,'+10'),(1782,2,32400,0,'+09'),(1782,3,36000,0,'+10'),(1783,0,43200,0,'+12'),(1784,0,43200,0,'+12'),(1785,0,36428,0,'LMT'),(1785,1,36000,0,'+10'),(1785,2,32400,0,'+09'),(1785,3,36000,0,'+10'),(1786,0,5040,0,'LMT'),(1786,1,5040,0,'WMT'),(1786,2,7200,1,'CEST'),(1786,3,3600,0,'CET'),(1786,4,7200,1,'CEST'),(1786,5,3600,0,'CET'),(1786,6,10800,1,'EEST'),(1786,7,7200,0,'EET'),(1786,8,7200,0,'EET'),(1786,9,7200,1,'CEST'),(1786,10,3600,0,'CET'),(1787,0,-2205,0,'LMT'),(1787,1,3600,1,'WEST'),(1787,2,0,0,'WET'),(1787,3,3600,1,'WEST'),(1787,4,0,0,'WET'),(1787,5,7200,1,'WEMT'),(1787,6,0,0,'WET'),(1787,7,3600,0,'CET'),(1787,8,3600,0,'CET'),(1787,9,7200,1,'CEST'),(1787,10,3600,1,'WEST'),(1787,11,0,0,'WET'),(1788,0,29160,0,'LMT'),(1788,1,28800,0,'CST'),(1788,2,32400,0,'JST'),(1788,3,32400,1,'CDT'),(1788,4,28800,0,'CST'),(1789,0,30472,0,'LMT'),(1789,1,30600,0,'KST'),(1789,2,32400,0,'JST'),(1789,3,36000,1,'KDT'),(1789,4,32400,0,'KST'),(1789,5,34200,1,'KDT'),(1789,6,36000,1,'KDT'),(1790,0,24925,0,'LMT'),(1790,1,24925,0,'SMT'),(1790,2,25200,0,'+07'),(1790,3,26400,1,'+0720'),(1790,4,26400,0,'+0720'),(1790,5,27000,0,'+0730'),(1790,6,32400,0,'+09'),(1790,7,28800,0,'+08'),(1791,0,-15865,0,'LMT'),(1791,1,-14400,0,'AST'),(1791,2,-10800,1,'APT'),(1791,3,-10800,1,'AWT'),(1792,0,-15264,0,'LMT'),(1792,1,-10800,1,'ADT'),(1792,2,-14400,0,'AST'),(1792,3,-10800,1,'AWT'),(1792,4,-10800,1,'APT'),(1793,0,-25116,0,'LMT'),(1793,1,-21600,1,'MDT'),(1793,2,-25200,0,'MST'),(1793,3,-21600,1,'MWT'),(1793,4,-21600,1,'MPT'),(1793,5,-21600,0,'CST'),(1794,0,-21036,0,'LMT'),(1794,1,-18000,1,'CDT'),(1794,2,-21600,0,'CST'),(1794,3,-18000,0,'EST'),(1794,4,-18000,1,'CWT'),(1794,5,-18000,1,'CPT'),(1794,6,-21600,0,'CST'),(1795,0,-19088,0,'LMT'),(1795,1,-19176,0,'CMT'),(1795,2,-18000,0,'EST'),(1796,0,-17762,0,'LMT'),(1796,1,-14400,1,'EDT'),(1796,2,-18000,0,'EST'),(1796,3,-14400,1,'EWT'),(1796,4,-14400,1,'EPT'),(1797,0,-37886,0,'LMT'),(1797,1,-37800,0,'HST'),(1797,2,-34200,1,'HDT'),(1797,3,-34200,1,'HWT'),(1797,4,-34200,1,'HPT'),(1797,5,-36000,0,'HST'),(1798,0,-26898,0,'LMT'),(1798,1,-21600,1,'MDT'),(1798,2,-25200,0,'MST'),(1798,3,-21600,1,'MWT'),(1799,0,-25196,0,'LMT'),(1799,1,-21600,1,'MDT'),(1799,2,-25200,0,'MST'),(1799,3,-21600,1,'MWT'),(1799,4,-21600,1,'MPT'),(1800,0,-31220,0,'LMT'),(1800,1,-30600,0,'-0830'),(1800,2,-28800,0,'-08'),(1801,0,-28378,0,'LMT'),(1801,1,-25200,1,'PDT'),(1801,2,-28800,0,'PST'),(1801,3,-25200,1,'PWT'),(1801,4,-25200,1,'PPT'),(1802,0,-32388,0,'LMT'),(1802,1,-32400,0,'-09'),(1803,0,-35976,0,'LMT'),(1803,1,-36000,0,'AST'),(1803,2,-32400,1,'AWT'),(1803,3,-32400,1,'APT'),(1803,4,-36000,0,'AHST'),(1803,5,-32400,1,'AHDT'),(1803,6,-32400,0,'YST'),(1803,7,-28800,1,'AKDT'),(1803,8,-32400,0,'AKST'),(1804,0,6952,0,'LMT'),(1804,1,7016,0,'IMT'),(1804,2,10800,1,'EEST'),(1804,3,7200,0,'EET'),(1804,4,10800,0,'+03'),(1804,5,14400,1,'+04'),(1804,6,10800,1,'EEST'),(1804,7,7200,0,'EET'),(1804,8,10800,1,'EEST'),(1804,9,7200,0,'EET'),(1804,10,10800,0,'+03'),(1805,0,0,0,'UTC'),(1806,0,-35976,0,'LMT'),(1806,1,-36000,0,'AST'),(1806,2,-32400,1,'AWT'),(1806,3,-32400,1,'APT'),(1806,4,-36000,0,'AHST'),(1806,5,-32400,1,'AHDT'),(1806,6,-32400,0,'YST'),(1806,7,-28800,1,'AKDT'),(1806,8,-32400,0,'AKST'),(1807,0,-42398,0,'LMT'),(1807,1,-39600,0,'NST'),(1807,2,-36000,1,'NWT'),(1807,3,-36000,1,'NPT'),(1807,4,-39600,0,'BST'),(1807,5,-36000,1,'BDT'),(1807,6,-36000,0,'AHST'),(1807,7,-32400,1,'HDT'),(1807,8,-36000,0,'HST'),(1808,0,-26898,0,'LMT'),(1808,1,-21600,1,'MDT'),(1808,2,-25200,0,'MST'),(1808,3,-21600,1,'MWT'),(1809,0,-21036,0,'LMT'),(1809,1,-18000,1,'CDT'),(1809,2,-21600,0,'CST'),(1809,3,-18000,0,'EST'),(1809,4,-18000,1,'CWT'),(1809,5,-18000,1,'CPT'),(1809,6,-21600,0,'CST'),(1810,0,-20678,0,'LMT'),(1810,1,-18000,1,'CDT'),(1810,2,-21600,0,'CST'),(1810,3,-18000,1,'CWT'),(1810,4,-18000,1,'CPT'),(1810,5,-18000,0,'EST'),(1810,6,-14400,1,'EDT'),(1811,0,-17762,0,'LMT'),(1811,1,-14400,1,'EDT'),(1811,2,-18000,0,'EST'),(1811,3,-14400,1,'EWT'),(1811,4,-14400,1,'EPT'),(1812,0,-37886,0,'LMT'),(1812,1,-37800,0,'HST'),(1812,2,-34200,1,'HDT'),(1812,3,-34200,1,'HWT'),(1812,4,-34200,1,'HPT'),(1812,5,-36000,0,'HST'),(1813,0,-20790,0,'LMT'),(1813,1,-18000,1,'CDT'),(1813,2,-21600,0,'CST'),(1813,3,-18000,1,'CWT'),(1813,4,-18000,1,'CPT'),(1813,5,-18000,0,'EST'),(1813,6,-21600,0,'CST'),(1814,0,-19931,0,'LMT'),(1814,1,-21600,0,'CST'),(1814,2,-18000,0,'EST'),(1814,3,-14400,1,'EWT'),(1814,4,-14400,1,'EPT'),(1814,5,-14400,1,'EDT'),(1815,0,-25196,0,'LMT'),(1815,1,-21600,1,'MDT'),(1815,2,-25200,0,'MST'),(1815,3,-21600,1,'MWT'),(1815,4,-21600,1,'MPT'),(1816,0,-28378,0,'LMT'),(1816,1,-25200,1,'PDT'),(1816,2,-28800,0,'PST'),(1816,3,-25200,1,'PWT'),(1816,4,-25200,1,'PPT'),(1817,0,-28378,0,'LMT'),(1817,1,-25200,1,'PDT'),(1817,2,-28800,0,'PST'),(1817,3,-25200,1,'PWT'),(1817,4,-25200,1,'PPT'),(1818,0,45432,0,'LMT'),(1818,1,-40968,0,'LMT'),(1818,2,-39600,0,'SST'),(1819,0,0,0,'UTC'),(1820,0,0,0,'UTC'),(1821,0,9017,0,'LMT'),(1821,1,9017,0,'MMT'),(1821,2,12679,1,'MST'),(1821,3,9079,0,'MMT'),(1821,4,16279,1,'MDST'),(1821,5,14400,1,'MSD'),(1821,6,10800,0,'MSK'),(1821,7,14400,1,'MSD'),(1821,8,18000,1,'+05'),(1821,9,7200,0,'EET'),(1821,10,10800,0,'MSK'),(1821,11,14400,1,'MSD'),(1821,12,10800,1,'EEST'),(1821,13,7200,0,'EET'),(1821,14,14400,0,'MSK'),(1821,15,14400,1,'MSD'),(1821,16,10800,0,'MSK'),(1822,0,3600,1,'WEST'),(1822,1,0,0,'WET'),(1823,0,0,0,'UTC');
/*!40000 ALTER TABLE `time_zone_transition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL DEFAULT '0',
  `max_updates` int(11) unsigned NOT NULL DEFAULT '0',
  `max_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8_bin NOT NULL DEFAULT 'mysql_native_password',
  `authentication_string` text COLLATE utf8_bin,
  `password_expired` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `password_last_changed` timestamp NULL DEFAULT NULL,
  `password_lifetime` smallint(5) unsigned DEFAULT NULL,
  `account_locked` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('localhost','root','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'mysql_native_password','*196BDEDE2AE4F84CA44C47D54D78478C7E2BD7B7','N','2020-05-21 15:32:52',NULL,'N'),('localhost','mysql.session','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'mysql_native_password','*THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE','N','2020-05-21 15:32:47',NULL,'Y'),('localhost','mysql.sys','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'mysql_native_password','*THISISNOTAVALIDPASSWORDTHATCANBEUSEDHERE','N','2020-05-21 15:32:47',NULL,'Y'),('%','root','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'mysql_native_password','*196BDEDE2AE4F84CA44C47D54D78478C7E2BD7B7','N','2020-05-21 15:32:52',NULL,'N'),('%','chamilo','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','','','','',0,0,0,0,'mysql_native_password','*8129D5D9FE250DBA2EC058D5BF160986444414E0','N','2020-05-21 15:32:52',NULL,'N');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `thread_id` bigint(21) unsigned NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumblob NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `user_host` mediumtext NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `sql_text` mediumblob NOT NULL,
  `thread_id` bigint(21) unsigned NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-21 16:14:04
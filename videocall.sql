-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: videocall
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

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
-- Table structure for table `doc_shares`
--

DROP TABLE IF EXISTS `doc_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_shares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `shared_by` int(11) NOT NULL,
  `shared_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `shared_to` int(11) NOT NULL,
  `doc_owner` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shared_by` (`shared_by`),
  KEY `shared_to` (`shared_to`),
  KEY `doc_owner` (`doc_owner`),
  CONSTRAINT `doc_shares_ibfk_1` FOREIGN KEY (`shared_by`) REFERENCES `users` (`id`),
  CONSTRAINT `doc_shares_ibfk_2` FOREIGN KEY (`shared_to`) REFERENCES `users` (`id`),
  CONSTRAINT `doc_shares_ibfk_3` FOREIGN KEY (`doc_owner`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `document` longblob NOT NULL,
  `doc_type` varchar(5) NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `uploaded_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uploaded_to` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uploaded_by` (`uploaded_by`),
  KEY `uploaded_to` (`uploaded_to`),
  CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`),
  CONSTRAINT `documents_ibfk_2` FOREIGN KEY (`uploaded_to`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification` longtext NOT NULL,
  `sent_by` int(11) NOT NULL,
  `sent_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sent_to` int(11) NOT NULL,
  `sent_for` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sent_by` (`sent_by`),
  KEY `sent_to` (`sent_to`),
  KEY `sent_for` (`sent_for`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`sent_by`) REFERENCES `users` (`id`),
  CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`sent_to`) REFERENCES `users` (`id`),
  CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`sent_for`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `type` int(10) NOT NULL,
  `password` varchar(11) NOT NULL,
  `registered_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `registered_by` (`registered_by`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`registered_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_log`
--

DROP TABLE IF EXISTS `video_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `call_from` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `call_to_1` int(11) NOT NULL,
  `call_to_2` int(11) NOT NULL,
  `end_time` time DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `day` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `call_from` (`call_from`),
  KEY `call_to_1` (`call_to_1`),
  KEY `call_to_2` (`call_to_2`),
  CONSTRAINT `video_log_ibfk_1` FOREIGN KEY (`call_from`) REFERENCES `users` (`id`),
  CONSTRAINT `video_log_ibfk_2` FOREIGN KEY (`call_to_1`) REFERENCES `users` (`id`),
  CONSTRAINT `video_log_ibfk_3` FOREIGN KEY (`call_to_2`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-09 17:26:45

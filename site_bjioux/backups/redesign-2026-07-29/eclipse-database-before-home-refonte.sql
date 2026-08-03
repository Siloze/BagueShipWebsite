/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.12-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: bagueship
-- ------------------------------------------------------
-- Server version	11.4.12-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `wp_actionscheduler_actions`
--

DROP TABLE IF EXISTS `wp_actionscheduler_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(191) NOT NULL,
  `status` varchar(20) NOT NULL,
  `scheduled_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  `priority` tinyint(3) unsigned NOT NULL DEFAULT 10,
  `args` varchar(191) DEFAULT NULL,
  `schedule` longtext DEFAULT NULL,
  `group_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `extended_args` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `hook_status_scheduled_date_gmt` (`hook`(163),`status`,`scheduled_date_gmt`),
  KEY `status_scheduled_date_gmt` (`status`,`scheduled_date_gmt`),
  KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  KEY `args` (`args`),
  KEY `group_id` (`group_id`),
  KEY `last_attempt_gmt` (`last_attempt_gmt`),
  KEY `claim_id_status_priority_scheduled_date_gmt` (`claim_id`,`status`,`priority`,`scheduled_date_gmt`),
  KEY `status_last_attempt_gmt` (`status`,`last_attempt_gmt`),
  KEY `status_claim_id` (`status`,`claim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_actions`
--

LOCK TABLES `wp_actionscheduler_actions` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_actions` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_actions` VALUES
(5,'action_scheduler/migration_hook','pending','2026-07-20 16:29:15','2026-07-20 16:29:15',10,'[]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564955;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564955;}',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(6,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[15,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(7,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[16,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(8,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[17,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(9,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[18,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(10,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[19,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(11,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[20,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(12,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[21,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(13,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[15,2]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(14,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[22,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(15,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[23,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(16,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[24,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(17,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[25,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(18,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[26,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(19,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[27,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(20,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[28,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(21,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[22,2]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(22,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[29,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(23,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[30,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(24,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[31,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(25,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[32,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(26,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[33,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(27,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[34,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(28,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[35,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(29,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[29,2]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(30,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:17','2026-07-20 16:28:17',10,'[36,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564897;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564897;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(31,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:18','2026-07-20 16:28:18',10,'[37,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564898;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564898;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(32,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:18','2026-07-20 16:28:18',10,'[38,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564898;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564898;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(33,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:18','2026-07-20 16:28:18',10,'[39,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564898;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564898;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(34,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:18','2026-07-20 16:28:18',10,'[40,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564898;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564898;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(35,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:18','2026-07-20 16:28:18',10,'[41,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564898;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564898;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(36,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:18','2026-07-20 16:28:18',10,'[42,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564898;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564898;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(37,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:18','2026-07-20 16:28:18',10,'[36,2]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564898;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564898;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(38,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:18','2026-07-20 16:28:18',10,'[16,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564898;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564898;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(39,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:18','2026-07-20 16:28:18',10,'[17,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564898;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564898;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(40,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:18','2026-07-20 16:28:18',10,'[18,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564898;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564898;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(41,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:18','2026-07-20 16:28:18',10,'[19,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564898;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564898;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(42,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:18','2026-07-20 16:28:18',10,'[20,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564898;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564898;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(43,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:18','2026-07-20 16:28:18',10,'[21,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564898;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564898;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(44,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[113,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(45,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[114,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(46,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[115,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(47,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[116,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(48,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[117,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(49,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[118,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(50,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[23,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(51,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[24,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(52,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[25,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(53,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[26,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(54,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[27,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(55,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[28,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(56,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[119,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(57,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[120,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(58,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[121,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(59,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[122,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(60,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[123,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(61,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[124,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(62,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[30,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(63,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[31,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(64,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[32,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(65,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[33,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(66,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[34,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(67,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[35,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(68,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[125,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(69,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[126,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(70,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[127,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(71,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[128,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(72,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[129,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(73,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[130,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(74,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[37,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(75,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[38,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(76,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[39,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(77,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[40,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(78,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[41,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(79,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[42,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(80,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:19','2026-07-20 16:28:19',10,'[131,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564899;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564899;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(81,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:20','2026-07-20 16:28:20',10,'[132,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564900;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564900;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(82,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:20','2026-07-20 16:28:20',10,'[133,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564900;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564900;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(83,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:20','2026-07-20 16:28:20',10,'[134,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564900;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564900;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(84,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:20','2026-07-20 16:28:20',10,'[135,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564900;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564900;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(85,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:28:20','2026-07-20 16:28:20',10,'[136,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564900;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564900;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(86,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[113,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(87,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[114,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(88,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[115,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(89,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[116,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(90,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[117,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(91,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[118,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(92,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[150,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(93,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[151,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(94,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[152,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(95,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[153,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(96,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[154,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(97,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[155,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(98,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[119,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(99,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[120,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(100,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[121,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(101,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[122,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(102,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[123,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(103,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[124,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(104,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[156,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(105,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[157,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(106,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[158,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(107,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[159,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(108,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[160,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(109,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[161,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(110,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[125,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(111,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[126,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(112,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[127,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(113,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[128,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(114,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[129,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(115,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[130,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(116,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[162,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(117,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[163,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(118,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[164,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(119,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[165,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(120,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[166,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(121,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[167,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(122,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[131,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(123,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[132,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(124,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[133,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(125,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[134,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(126,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[135,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(127,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[136,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(128,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:27','2026-07-20 16:29:27',10,'[168,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564967;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564967;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(129,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:28','2026-07-20 16:29:28',10,'[169,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564968;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564968;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(130,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:28','2026-07-20 16:29:28',10,'[170,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564968;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564968;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(131,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:28','2026-07-20 16:29:28',10,'[171,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564968;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564968;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(132,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:28','2026-07-20 16:29:28',10,'[172,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564968;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564968;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(133,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-20 16:29:28','2026-07-20 16:29:28',10,'[173,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1784564968;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1784564968;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(134,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[150,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(135,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[151,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(136,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[152,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(137,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[153,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(138,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[154,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(139,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[155,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(140,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[187,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(141,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[188,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(142,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[189,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(143,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[190,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(144,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[191,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(145,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[192,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(146,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[156,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(147,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[157,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(148,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[158,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(149,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[159,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(150,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[160,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(151,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[161,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(152,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[193,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(153,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[194,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(154,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[195,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(155,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[196,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(156,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[197,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(157,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[198,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(158,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[162,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(159,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[163,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(160,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[164,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(161,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[165,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(162,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[166,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(163,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[167,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(164,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[199,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(165,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[200,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(166,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:09','2026-07-29 17:01:09',10,'[201,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344469;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344469;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(167,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:10','2026-07-29 17:01:10',10,'[202,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344470;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344470;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(168,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:10','2026-07-29 17:01:10',10,'[203,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344470;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344470;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(169,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:10','2026-07-29 17:01:10',10,'[204,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344470;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344470;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(170,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:10','2026-07-29 17:01:10',10,'[168,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344470;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344470;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(171,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:10','2026-07-29 17:01:10',10,'[169,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344470;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344470;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(172,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:10','2026-07-29 17:01:10',10,'[170,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344470;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344470;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(173,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:10','2026-07-29 17:01:10',10,'[171,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344470;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344470;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(174,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:10','2026-07-29 17:01:10',10,'[172,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344470;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344470;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(175,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:10','2026-07-29 17:01:10',10,'[173,3]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344470;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344470;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(176,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:10','2026-07-29 17:01:10',10,'[205,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344470;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344470;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(177,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:10','2026-07-29 17:01:10',10,'[206,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344470;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344470;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(178,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:10','2026-07-29 17:01:10',10,'[207,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344470;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344470;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(179,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:10','2026-07-29 17:01:10',10,'[208,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344470;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344470;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(180,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:10','2026-07-29 17:01:10',10,'[209,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344470;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344470;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL),
(181,'woocommerce_run_product_attribute_lookup_update_callback','pending','2026-07-29 17:01:10','2026-07-29 17:01:10',10,'[210,1]','O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1785344470;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1785344470;}',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,NULL);
/*!40000 ALTER TABLE `wp_actionscheduler_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_actionscheduler_claims`
--

DROP TABLE IF EXISTS `wp_actionscheduler_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_created_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`claim_id`),
  KEY `date_created_gmt` (`date_created_gmt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_claims`
--

LOCK TABLES `wp_actionscheduler_claims` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_claims` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_actionscheduler_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_actionscheduler_groups`
--

DROP TABLE IF EXISTS `wp_actionscheduler_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_groups`
--

LOCK TABLES `wp_actionscheduler_groups` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_groups` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_groups` VALUES
(1,'action-scheduler-migration'),
(2,'woocommerce-db-updates');
/*!40000 ALTER TABLE `wp_actionscheduler_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_actionscheduler_logs`
--

DROP TABLE IF EXISTS `wp_actionscheduler_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` bigint(20) unsigned NOT NULL,
  `message` text NOT NULL,
  `log_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `action_id` (`action_id`),
  KEY `log_date_gmt` (`log_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_actionscheduler_logs`
--

LOCK TABLES `wp_actionscheduler_logs` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_logs` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_logs` VALUES
(1,5,'action created','2026-07-20 16:28:15','2026-07-20 16:28:15'),
(2,6,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(3,7,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(4,8,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(5,9,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(6,10,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(7,11,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(8,12,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(9,13,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(10,14,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(11,15,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(12,16,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(13,17,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(14,18,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(15,19,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(16,20,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(17,21,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(18,22,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(19,23,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(20,24,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(21,25,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(22,26,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(23,27,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(24,28,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(25,29,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(26,30,'action created','2026-07-20 16:28:16','2026-07-20 16:28:16'),
(27,31,'action created','2026-07-20 16:28:17','2026-07-20 16:28:17'),
(28,32,'action created','2026-07-20 16:28:17','2026-07-20 16:28:17'),
(29,33,'action created','2026-07-20 16:28:17','2026-07-20 16:28:17'),
(30,34,'action created','2026-07-20 16:28:17','2026-07-20 16:28:17'),
(31,35,'action created','2026-07-20 16:28:17','2026-07-20 16:28:17'),
(32,36,'action created','2026-07-20 16:28:17','2026-07-20 16:28:17'),
(33,37,'action created','2026-07-20 16:28:17','2026-07-20 16:28:17'),
(34,38,'action created','2026-07-20 16:28:17','2026-07-20 16:28:17'),
(35,39,'action created','2026-07-20 16:28:17','2026-07-20 16:28:17'),
(36,40,'action created','2026-07-20 16:28:17','2026-07-20 16:28:17'),
(37,41,'action created','2026-07-20 16:28:17','2026-07-20 16:28:17'),
(38,42,'action created','2026-07-20 16:28:17','2026-07-20 16:28:17'),
(39,43,'action created','2026-07-20 16:28:17','2026-07-20 16:28:17'),
(40,44,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(41,45,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(42,46,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(43,47,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(44,48,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(45,49,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(46,50,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(47,51,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(48,52,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(49,53,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(50,54,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(51,55,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(52,56,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(53,57,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(54,58,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(55,59,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(56,60,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(57,61,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(58,62,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(59,63,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(60,64,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(61,65,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(62,66,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(63,67,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(64,68,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(65,69,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(66,70,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(67,71,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(68,72,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(69,73,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(70,74,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(71,75,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(72,76,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(73,77,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(74,78,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(75,79,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(76,80,'action created','2026-07-20 16:28:18','2026-07-20 16:28:18'),
(77,81,'action created','2026-07-20 16:28:19','2026-07-20 16:28:19'),
(78,82,'action created','2026-07-20 16:28:19','2026-07-20 16:28:19'),
(79,83,'action created','2026-07-20 16:28:19','2026-07-20 16:28:19'),
(80,84,'action created','2026-07-20 16:28:19','2026-07-20 16:28:19'),
(81,85,'action created','2026-07-20 16:28:19','2026-07-20 16:28:19'),
(82,86,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(83,87,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(84,88,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(85,89,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(86,90,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(87,91,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(88,92,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(89,93,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(90,94,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(91,95,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(92,96,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(93,97,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(94,98,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(95,99,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(96,100,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(97,101,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(98,102,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(99,103,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(100,104,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(101,105,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(102,106,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(103,107,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(104,108,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(105,109,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(106,110,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(107,111,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(108,112,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(109,113,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(110,114,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(111,115,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(112,116,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(113,117,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(114,118,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(115,119,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(116,120,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(117,121,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(118,122,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(119,123,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(120,124,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(121,125,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(122,126,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(123,127,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(124,128,'action created','2026-07-20 16:29:26','2026-07-20 16:29:26'),
(125,129,'action created','2026-07-20 16:29:27','2026-07-20 16:29:27'),
(126,130,'action created','2026-07-20 16:29:27','2026-07-20 16:29:27'),
(127,131,'action created','2026-07-20 16:29:27','2026-07-20 16:29:27'),
(128,132,'action created','2026-07-20 16:29:27','2026-07-20 16:29:27'),
(129,133,'action created','2026-07-20 16:29:27','2026-07-20 16:29:27'),
(130,134,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(131,135,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(132,136,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(133,137,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(134,138,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(135,139,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(136,140,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(137,141,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(138,142,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(139,143,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(140,144,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(141,145,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(142,146,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(143,147,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(144,148,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(145,149,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(146,150,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(147,151,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(148,152,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(149,153,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(150,154,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(151,155,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(152,156,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(153,157,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(154,158,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(155,159,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(156,160,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(157,161,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(158,162,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(159,163,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(160,164,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(161,165,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(162,166,'action created','2026-07-29 17:01:08','2026-07-29 17:01:08'),
(163,167,'action created','2026-07-29 17:01:09','2026-07-29 17:01:09'),
(164,168,'action created','2026-07-29 17:01:09','2026-07-29 17:01:09'),
(165,169,'action created','2026-07-29 17:01:09','2026-07-29 17:01:09'),
(166,170,'action created','2026-07-29 17:01:09','2026-07-29 17:01:09'),
(167,171,'action created','2026-07-29 17:01:09','2026-07-29 17:01:09'),
(168,172,'action created','2026-07-29 17:01:09','2026-07-29 17:01:09'),
(169,173,'action created','2026-07-29 17:01:09','2026-07-29 17:01:09'),
(170,174,'action created','2026-07-29 17:01:09','2026-07-29 17:01:09'),
(171,175,'action created','2026-07-29 17:01:09','2026-07-29 17:01:09'),
(172,176,'action created','2026-07-29 17:01:09','2026-07-29 17:01:09'),
(173,177,'action created','2026-07-29 17:01:09','2026-07-29 17:01:09'),
(174,178,'action created','2026-07-29 17:01:09','2026-07-29 17:01:09'),
(175,179,'action created','2026-07-29 17:01:09','2026-07-29 17:01:09'),
(176,180,'action created','2026-07-29 17:01:09','2026-07-29 17:01:09'),
(177,181,'action created','2026-07-29 17:01:09','2026-07-29 17:01:09');
/*!40000 ALTER TABLE `wp_actionscheduler_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10)),
  KEY `woo_idx_comment_type` (`comment_type`),
  KEY `woo_idx_comment_date_type` (`comment_date_gmt`,`comment_type`,`comment_approved`,`comment_post_ID`),
  KEY `woo_idx_comment_approved_type` (`comment_approved`,`comment_type`,`comment_post_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES
(1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2026-07-20 16:28:14','2026-07-20 16:28:14','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com/\">Gravatar</a>.',0,'1','','comment',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES
(1,'cron','a:8:{i:1784564894;a:3:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1784564895;a:3:{s:20:\"jetpack_clean_nonces\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:20:\"jetpack_v2_heartbeat\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:33:\"wc_admin_process_orders_milestone\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1784564896;a:1:{s:30:\"wp_1_wc_regenerate_images_cron\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:39:\"wp_1_wc_regenerate_images_cron_interval\";s:4:\"args\";a:0:{}s:8:\"interval\";i:300;}}}i:1784568493;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1784570293;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1784572093;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1784651294;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','on'),
(2,'siteurl','http://localhost:8080','on'),
(3,'home','http://localhost:8080','on'),
(4,'blogname','Eclipse','on'),
(5,'blogdescription','Boutique WordPress WooCommerce pour bijoux en acier.','on'),
(6,'users_can_register','0','on'),
(7,'admin_email','admin@bagueship.local','on'),
(8,'start_of_week','1','on'),
(9,'use_balanceTags','0','on'),
(10,'use_smilies','1','on'),
(11,'require_name_email','1','on'),
(12,'comments_notify','1','on'),
(13,'posts_per_rss','10','on'),
(14,'rss_use_excerpt','0','on'),
(15,'mailserver_url','mail.example.com','on'),
(16,'mailserver_login','login@example.com','on'),
(17,'mailserver_pass','','on'),
(18,'mailserver_port','110','on'),
(19,'default_category','1','on'),
(20,'default_comment_status','open','on'),
(21,'default_ping_status','open','on'),
(22,'default_pingback_flag','1','on'),
(23,'posts_per_page','10','on'),
(24,'date_format','F j, Y','on'),
(25,'time_format','g:i a','on'),
(26,'links_updated_date_format','F j, Y g:i a','on'),
(27,'comment_moderation','0','on'),
(28,'moderation_notify','1','on'),
(29,'permalink_structure','/%postname%/','on'),
(30,'rewrite_rules','a:211:{s:24:\"^wc-auth/v([1]{1})/(.*)?\";s:63:\"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]\";s:21:\"^wc/file/transient/?$\";s:33:\"index.php?wc-transient-file-name=\";s:24:\"^wc/file/transient/(.+)$\";s:44:\"index.php?wc-transient-file-name=$matches[1]\";s:22:\"^wc-api/v([1-3]{1})/?$\";s:51:\"index.php?wc-api-version=$matches[1]&wc-api-route=/\";s:24:\"^wc-api/v([1-3]{1})(.*)?\";s:61:\"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]\";s:11:\"boutique/?$\";s:27:\"index.php?post_type=product\";s:41:\"boutique/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:36:\"boutique/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:28:\"boutique/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=product&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:15:\"^checkout-link$\";s:28:\"index.php?checkout-link=true\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:43:\"category/(.+?)/wc/file/transient(/(.*))?/?$\";s:65:\"index.php?category_name=$matches[1]&wc/file/transient=$matches[3]\";s:32:\"category/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?category_name=$matches[1]&wc-api=$matches[3]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:40:\"tag/([^/]+)/wc/file/transient(/(.*))?/?$\";s:55:\"index.php?tag=$matches[1]&wc/file/transient=$matches[3]\";s:29:\"tag/([^/]+)/wc-api(/(.*))?/?$\";s:44:\"index.php?tag=$matches[1]&wc-api=$matches[3]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:44:\"brand/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?product_brand=$matches[1]&feed=$matches[2]\";s:39:\"brand/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?product_brand=$matches[1]&feed=$matches[2]\";s:20:\"brand/(.+?)/embed/?$\";s:46:\"index.php?product_brand=$matches[1]&embed=true\";s:32:\"brand/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?product_brand=$matches[1]&paged=$matches[2]\";s:14:\"brand/(.+?)/?$\";s:35:\"index.php?product_brand=$matches[1]\";s:55:\"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:50:\"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:31:\"product-category/(.+?)/embed/?$\";s:44:\"index.php?product_cat=$matches[1]&embed=true\";s:43:\"product-category/(.+?)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_cat=$matches[1]&paged=$matches[2]\";s:25:\"product-category/(.+?)/?$\";s:33:\"index.php?product_cat=$matches[1]\";s:52:\"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:47:\"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:28:\"product-tag/([^/]+)/embed/?$\";s:44:\"index.php?product_tag=$matches[1]&embed=true\";s:40:\"product-tag/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_tag=$matches[1]&paged=$matches[2]\";s:22:\"product-tag/([^/]+)/?$\";s:33:\"index.php?product_tag=$matches[1]\";s:35:\"product/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"product/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"product/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"product/([^/]+)/embed/?$\";s:40:\"index.php?product=$matches[1]&embed=true\";s:28:\"product/([^/]+)/trackback/?$\";s:34:\"index.php?product=$matches[1]&tb=1\";s:48:\"product/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:43:\"product/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:36:\"product/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&paged=$matches[2]\";s:43:\"product/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&cpage=$matches[2]\";s:44:\"product/([^/]+)/wc/file/transient(/(.*))?/?$\";s:59:\"index.php?product=$matches[1]&wc/file/transient=$matches[3]\";s:33:\"product/([^/]+)/wc-api(/(.*))?/?$\";s:48:\"index.php?product=$matches[1]&wc-api=$matches[3]\";s:50:\"product/[^/]+/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:61:\"product/[^/]+/attachment/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:39:\"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:50:\"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:32:\"product/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?product=$matches[1]&page=$matches[2]\";s:24:\"product/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"product/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"product/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:44:\"bagueship_notify/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:54:\"bagueship_notify/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:74:\"bagueship_notify/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:69:\"bagueship_notify/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:69:\"bagueship_notify/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:50:\"bagueship_notify/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:33:\"bagueship_notify/([^/]+)/embed/?$\";s:49:\"index.php?bagueship_notify=$matches[1]&embed=true\";s:37:\"bagueship_notify/([^/]+)/trackback/?$\";s:43:\"index.php?bagueship_notify=$matches[1]&tb=1\";s:45:\"bagueship_notify/([^/]+)/page/?([0-9]{1,})/?$\";s:56:\"index.php?bagueship_notify=$matches[1]&paged=$matches[2]\";s:52:\"bagueship_notify/([^/]+)/comment-page-([0-9]{1,})/?$\";s:56:\"index.php?bagueship_notify=$matches[1]&cpage=$matches[2]\";s:53:\"bagueship_notify/([^/]+)/wc/file/transient(/(.*))?/?$\";s:68:\"index.php?bagueship_notify=$matches[1]&wc/file/transient=$matches[3]\";s:42:\"bagueship_notify/([^/]+)/wc-api(/(.*))?/?$\";s:57:\"index.php?bagueship_notify=$matches[1]&wc-api=$matches[3]\";s:59:\"bagueship_notify/[^/]+/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:70:\"bagueship_notify/[^/]+/attachment/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:48:\"bagueship_notify/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:59:\"bagueship_notify/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:41:\"bagueship_notify/([^/]+)(?:/([0-9]+))?/?$\";s:55:\"index.php?bagueship_notify=$matches[1]&page=$matches[2]\";s:33:\"bagueship_notify/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"bagueship_notify/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"bagueship_notify/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"bagueship_notify/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"bagueship_notify/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:39:\"bagueship_notify/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:12:\"sitemap\\.xml\";s:23:\"index.php?sitemap=index\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=10&cpage=$matches[1]\";s:28:\"wc/file/transient(/(.*))?/?$\";s:40:\"index.php?&wc/file/transient=$matches[2]\";s:17:\"wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:37:\"comments/wc/file/transient(/(.*))?/?$\";s:40:\"index.php?&wc/file/transient=$matches[2]\";s:26:\"comments/wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:40:\"search/(.+)/wc/file/transient(/(.*))?/?$\";s:53:\"index.php?s=$matches[1]&wc/file/transient=$matches[3]\";s:29:\"search/(.+)/wc-api(/(.*))?/?$\";s:42:\"index.php?s=$matches[1]&wc-api=$matches[3]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:43:\"author/([^/]+)/wc/file/transient(/(.*))?/?$\";s:63:\"index.php?author_name=$matches[1]&wc/file/transient=$matches[3]\";s:32:\"author/([^/]+)/wc-api(/(.*))?/?$\";s:52:\"index.php?author_name=$matches[1]&wc-api=$matches[3]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc/file/transient(/(.*))?/?$\";s:93:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc/file/transient=$matches[5]\";s:54:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:52:\"([0-9]{4})/([0-9]{1,2})/wc/file/transient(/(.*))?/?$\";s:77:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc/file/transient=$matches[4]\";s:41:\"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:66:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:39:\"([0-9]{4})/wc/file/transient(/(.*))?/?$\";s:56:\"index.php?year=$matches[1]&wc/file/transient=$matches[3]\";s:28:\"([0-9]{4})/wc-api(/(.*))?/?$\";s:45:\"index.php?year=$matches[1]&wc-api=$matches[3]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:36:\"(.?.+?)/wc/file/transient(/(.*))?/?$\";s:60:\"index.php?pagename=$matches[1]&wc/file/transient=$matches[3]\";s:25:\"(.?.+?)/wc-api(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&wc-api=$matches[3]\";s:28:\"(.?.+?)/order-pay(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&order-pay=$matches[3]\";s:33:\"(.?.+?)/order-received(/(.*))?/?$\";s:57:\"index.php?pagename=$matches[1]&order-received=$matches[3]\";s:25:\"(.?.+?)/orders(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&orders=$matches[3]\";s:29:\"(.?.+?)/view-order(/(.*))?/?$\";s:53:\"index.php?pagename=$matches[1]&view-order=$matches[3]\";s:28:\"(.?.+?)/downloads(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&downloads=$matches[3]\";s:31:\"(.?.+?)/edit-account(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-account=$matches[3]\";s:31:\"(.?.+?)/edit-address(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-address=$matches[3]\";s:34:\"(.?.+?)/payment-methods(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&payment-methods=$matches[3]\";s:32:\"(.?.+?)/lost-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&lost-password=$matches[3]\";s:34:\"(.?.+?)/customer-logout(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&customer-logout=$matches[3]\";s:37:\"(.?.+?)/add-payment-method(/(.*))?/?$\";s:61:\"index.php?pagename=$matches[1]&add-payment-method=$matches[3]\";s:40:\"(.?.+?)/delete-payment-method(/(.*))?/?$\";s:64:\"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]\";s:45:\"(.?.+?)/set-default-payment-method(/(.*))?/?$\";s:69:\"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]\";s:42:\".?.+?/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:53:\".?.+?/attachment/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:31:\".?.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:36:\"([^/]+)/wc/file/transient(/(.*))?/?$\";s:56:\"index.php?name=$matches[1]&wc/file/transient=$matches[3]\";s:25:\"([^/]+)/wc-api(/(.*))?/?$\";s:45:\"index.php?name=$matches[1]&wc-api=$matches[3]\";s:42:\"[^/]+/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:53:\"[^/]+/attachment/([^/]+)/wc/file/transient(/(.*))?/?$\";s:62:\"index.php?attachment=$matches[1]&wc/file/transient=$matches[3]\";s:31:\"[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\"[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','on'),
(31,'hack_file','0','on'),
(32,'blog_charset','UTF-8','on'),
(33,'moderation_keys','','off'),
(34,'active_plugins','a:2:{i:0;s:33:\"bagueship-core/bagueship-core.php\";i:1;s:27:\"woocommerce/woocommerce.php\";}','on'),
(35,'category_base','','on'),
(36,'ping_sites','https://rpc.pingomatic.com/','on'),
(37,'comment_max_links','2','on'),
(38,'gmt_offset','0','on'),
(39,'default_email_category','1','on'),
(40,'recently_edited','','off'),
(41,'template','bagueship','on'),
(42,'stylesheet','bagueship','on'),
(43,'comment_registration','0','on'),
(44,'html_type','text/html','on'),
(45,'use_trackback','0','on'),
(46,'default_role','subscriber','on'),
(47,'db_version','61833','on'),
(48,'uploads_use_yearmonth_folders','1','on'),
(49,'upload_path','','on'),
(50,'blog_public','1','on'),
(51,'default_link_category','2','on'),
(52,'show_on_front','page','on'),
(53,'tag_base','','on'),
(54,'show_avatars','1','on'),
(55,'avatar_rating','G','on'),
(56,'upload_url_path','','on'),
(57,'thumbnail_size_w','150','on'),
(58,'thumbnail_size_h','150','on'),
(59,'thumbnail_crop','1','on'),
(60,'medium_size_w','300','on'),
(61,'medium_size_h','300','on'),
(62,'avatar_default','mystery','on'),
(63,'large_size_w','1024','on'),
(64,'large_size_h','1024','on'),
(65,'image_default_link_type','none','on'),
(66,'image_default_size','','on'),
(67,'image_default_align','','on'),
(68,'close_comments_for_old_posts','0','on'),
(69,'close_comments_days_old','14','on'),
(70,'thread_comments','1','on'),
(71,'thread_comments_depth','5','on'),
(72,'page_comments','0','on'),
(73,'comments_per_page','50','on'),
(74,'default_comments_page','newest','on'),
(75,'comment_order','asc','on'),
(76,'sticky_posts','a:0:{}','on'),
(77,'widget_categories','a:0:{}','on'),
(78,'widget_text','a:0:{}','on'),
(79,'widget_rss','a:0:{}','on'),
(80,'uninstall_plugins','a:0:{}','off'),
(81,'timezone_string','','on'),
(82,'page_for_posts','0','on'),
(83,'page_on_front','10','on'),
(84,'default_post_format','0','on'),
(85,'link_manager_enabled','0','on'),
(86,'finished_splitting_shared_terms','1','on'),
(87,'site_icon','0','on'),
(88,'medium_large_size_w','768','on'),
(89,'medium_large_size_h','0','on'),
(90,'wp_page_for_privacy_policy','3','on'),
(91,'show_comments_cookies_opt_in','1','on'),
(92,'admin_email_lifespan','1800116893','on'),
(93,'disallowed_keys','','off'),
(94,'comment_previously_approved','1','on'),
(95,'auto_plugin_theme_update_emails','a:0:{}','off'),
(96,'auto_update_core_dev','enabled','on'),
(97,'auto_update_core_minor','enabled','on'),
(98,'auto_update_core_major','enabled','on'),
(99,'wp_force_deactivated_plugins','a:0:{}','on'),
(100,'wp_attachment_pages_enabled','0','on'),
(101,'wp_notes_notify','1','on'),
(102,'initial_db_version','61833','on'),
(103,'wp_user_roles','a:9:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:115:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"manage_woocommerce\";b:1;s:16:\"create_customers\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop manager\";s:12:\"capabilities\";a:93:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"edit_theme_options\";b:1;s:18:\"manage_woocommerce\";b:1;s:16:\"create_customers\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}s:21:\"gestionnaire_boutique\";a:2:{s:4:\"name\";s:21:\"Gestionnaire boutique\";s:12:\"capabilities\";a:12:{s:4:\"read\";b:1;s:18:\"manage_woocommerce\";b:1;s:13:\"edit_products\";b:1;s:12:\"edit_product\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:16:\"edit_shop_orders\";b:1;s:16:\"read_shop_orders\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;}}s:15:\"editeur_contenu\";a:2:{s:4:\"name\";s:15:\"Editeur contenu\";s:12:\"capabilities\";a:5:{s:4:\"read\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"upload_files\";b:1;}}}','on'),
(104,'fresh_site','0','off'),
(105,'user_count','1','off'),
(106,'widget_block','a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}','auto'),
(107,'sidebars_widgets','a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}','auto'),
(108,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(109,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(110,'widget_archives','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(111,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(112,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(113,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(114,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(115,'widget_meta','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(116,'widget_search','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(117,'widget_recent-posts','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(118,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(119,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(120,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(121,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(122,'_transient_wp_core_block_css_files','a:2:{s:7:\"version\";s:5:\"7.0.1\";s:5:\"files\";a:596:{i:0;s:31:\"accordion-heading/style-rtl.css\";i:1;s:35:\"accordion-heading/style-rtl.min.css\";i:2;s:27:\"accordion-heading/style.css\";i:3;s:31:\"accordion-heading/style.min.css\";i:4;s:28:\"accordion-item/style-rtl.css\";i:5;s:32:\"accordion-item/style-rtl.min.css\";i:6;s:24:\"accordion-item/style.css\";i:7;s:28:\"accordion-item/style.min.css\";i:8;s:29:\"accordion-panel/style-rtl.css\";i:9;s:33:\"accordion-panel/style-rtl.min.css\";i:10;s:25:\"accordion-panel/style.css\";i:11;s:29:\"accordion-panel/style.min.css\";i:12;s:23:\"accordion/style-rtl.css\";i:13;s:27:\"accordion/style-rtl.min.css\";i:14;s:19:\"accordion/style.css\";i:15;s:23:\"accordion/style.min.css\";i:16;s:22:\"archives/style-rtl.css\";i:17;s:26:\"archives/style-rtl.min.css\";i:18;s:18:\"archives/style.css\";i:19;s:22:\"archives/style.min.css\";i:20;s:20:\"audio/editor-rtl.css\";i:21;s:24:\"audio/editor-rtl.min.css\";i:22;s:16:\"audio/editor.css\";i:23;s:20:\"audio/editor.min.css\";i:24;s:19:\"audio/style-rtl.css\";i:25;s:23:\"audio/style-rtl.min.css\";i:26;s:15:\"audio/style.css\";i:27;s:19:\"audio/style.min.css\";i:28;s:19:\"audio/theme-rtl.css\";i:29;s:23:\"audio/theme-rtl.min.css\";i:30;s:15:\"audio/theme.css\";i:31;s:19:\"audio/theme.min.css\";i:32;s:21:\"avatar/editor-rtl.css\";i:33;s:25:\"avatar/editor-rtl.min.css\";i:34;s:17:\"avatar/editor.css\";i:35;s:21:\"avatar/editor.min.css\";i:36;s:20:\"avatar/style-rtl.css\";i:37;s:24:\"avatar/style-rtl.min.css\";i:38;s:16:\"avatar/style.css\";i:39;s:20:\"avatar/style.min.css\";i:40;s:25:\"breadcrumbs/style-rtl.css\";i:41;s:29:\"breadcrumbs/style-rtl.min.css\";i:42;s:21:\"breadcrumbs/style.css\";i:43;s:25:\"breadcrumbs/style.min.css\";i:44;s:21:\"button/editor-rtl.css\";i:45;s:25:\"button/editor-rtl.min.css\";i:46;s:17:\"button/editor.css\";i:47;s:21:\"button/editor.min.css\";i:48;s:20:\"button/style-rtl.css\";i:49;s:24:\"button/style-rtl.min.css\";i:50;s:16:\"button/style.css\";i:51;s:20:\"button/style.min.css\";i:52;s:22:\"buttons/editor-rtl.css\";i:53;s:26:\"buttons/editor-rtl.min.css\";i:54;s:18:\"buttons/editor.css\";i:55;s:22:\"buttons/editor.min.css\";i:56;s:21:\"buttons/style-rtl.css\";i:57;s:25:\"buttons/style-rtl.min.css\";i:58;s:17:\"buttons/style.css\";i:59;s:21:\"buttons/style.min.css\";i:60;s:22:\"calendar/style-rtl.css\";i:61;s:26:\"calendar/style-rtl.min.css\";i:62;s:18:\"calendar/style.css\";i:63;s:22:\"calendar/style.min.css\";i:64;s:25:\"categories/editor-rtl.css\";i:65;s:29:\"categories/editor-rtl.min.css\";i:66;s:21:\"categories/editor.css\";i:67;s:25:\"categories/editor.min.css\";i:68;s:24:\"categories/style-rtl.css\";i:69;s:28:\"categories/style-rtl.min.css\";i:70;s:20:\"categories/style.css\";i:71;s:24:\"categories/style.min.css\";i:72;s:19:\"code/editor-rtl.css\";i:73;s:23:\"code/editor-rtl.min.css\";i:74;s:15:\"code/editor.css\";i:75;s:19:\"code/editor.min.css\";i:76;s:18:\"code/style-rtl.css\";i:77;s:22:\"code/style-rtl.min.css\";i:78;s:14:\"code/style.css\";i:79;s:18:\"code/style.min.css\";i:80;s:18:\"code/theme-rtl.css\";i:81;s:22:\"code/theme-rtl.min.css\";i:82;s:14:\"code/theme.css\";i:83;s:18:\"code/theme.min.css\";i:84;s:22:\"columns/editor-rtl.css\";i:85;s:26:\"columns/editor-rtl.min.css\";i:86;s:18:\"columns/editor.css\";i:87;s:22:\"columns/editor.min.css\";i:88;s:21:\"columns/style-rtl.css\";i:89;s:25:\"columns/style-rtl.min.css\";i:90;s:17:\"columns/style.css\";i:91;s:21:\"columns/style.min.css\";i:92;s:33:\"comment-author-name/style-rtl.css\";i:93;s:37:\"comment-author-name/style-rtl.min.css\";i:94;s:29:\"comment-author-name/style.css\";i:95;s:33:\"comment-author-name/style.min.css\";i:96;s:29:\"comment-content/style-rtl.css\";i:97;s:33:\"comment-content/style-rtl.min.css\";i:98;s:25:\"comment-content/style.css\";i:99;s:29:\"comment-content/style.min.css\";i:100;s:26:\"comment-date/style-rtl.css\";i:101;s:30:\"comment-date/style-rtl.min.css\";i:102;s:22:\"comment-date/style.css\";i:103;s:26:\"comment-date/style.min.css\";i:104;s:31:\"comment-edit-link/style-rtl.css\";i:105;s:35:\"comment-edit-link/style-rtl.min.css\";i:106;s:27:\"comment-edit-link/style.css\";i:107;s:31:\"comment-edit-link/style.min.css\";i:108;s:32:\"comment-reply-link/style-rtl.css\";i:109;s:36:\"comment-reply-link/style-rtl.min.css\";i:110;s:28:\"comment-reply-link/style.css\";i:111;s:32:\"comment-reply-link/style.min.css\";i:112;s:30:\"comment-template/style-rtl.css\";i:113;s:34:\"comment-template/style-rtl.min.css\";i:114;s:26:\"comment-template/style.css\";i:115;s:30:\"comment-template/style.min.css\";i:116;s:42:\"comments-pagination-numbers/editor-rtl.css\";i:117;s:46:\"comments-pagination-numbers/editor-rtl.min.css\";i:118;s:38:\"comments-pagination-numbers/editor.css\";i:119;s:42:\"comments-pagination-numbers/editor.min.css\";i:120;s:34:\"comments-pagination/editor-rtl.css\";i:121;s:38:\"comments-pagination/editor-rtl.min.css\";i:122;s:30:\"comments-pagination/editor.css\";i:123;s:34:\"comments-pagination/editor.min.css\";i:124;s:33:\"comments-pagination/style-rtl.css\";i:125;s:37:\"comments-pagination/style-rtl.min.css\";i:126;s:29:\"comments-pagination/style.css\";i:127;s:33:\"comments-pagination/style.min.css\";i:128;s:29:\"comments-title/editor-rtl.css\";i:129;s:33:\"comments-title/editor-rtl.min.css\";i:130;s:25:\"comments-title/editor.css\";i:131;s:29:\"comments-title/editor.min.css\";i:132;s:23:\"comments/editor-rtl.css\";i:133;s:27:\"comments/editor-rtl.min.css\";i:134;s:19:\"comments/editor.css\";i:135;s:23:\"comments/editor.min.css\";i:136;s:22:\"comments/style-rtl.css\";i:137;s:26:\"comments/style-rtl.min.css\";i:138;s:18:\"comments/style.css\";i:139;s:22:\"comments/style.min.css\";i:140;s:20:\"cover/editor-rtl.css\";i:141;s:24:\"cover/editor-rtl.min.css\";i:142;s:16:\"cover/editor.css\";i:143;s:20:\"cover/editor.min.css\";i:144;s:19:\"cover/style-rtl.css\";i:145;s:23:\"cover/style-rtl.min.css\";i:146;s:15:\"cover/style.css\";i:147;s:19:\"cover/style.min.css\";i:148;s:22:\"details/editor-rtl.css\";i:149;s:26:\"details/editor-rtl.min.css\";i:150;s:18:\"details/editor.css\";i:151;s:22:\"details/editor.min.css\";i:152;s:21:\"details/style-rtl.css\";i:153;s:25:\"details/style-rtl.min.css\";i:154;s:17:\"details/style.css\";i:155;s:21:\"details/style.min.css\";i:156;s:20:\"embed/editor-rtl.css\";i:157;s:24:\"embed/editor-rtl.min.css\";i:158;s:16:\"embed/editor.css\";i:159;s:20:\"embed/editor.min.css\";i:160;s:19:\"embed/style-rtl.css\";i:161;s:23:\"embed/style-rtl.min.css\";i:162;s:15:\"embed/style.css\";i:163;s:19:\"embed/style.min.css\";i:164;s:19:\"embed/theme-rtl.css\";i:165;s:23:\"embed/theme-rtl.min.css\";i:166;s:15:\"embed/theme.css\";i:167;s:19:\"embed/theme.min.css\";i:168;s:19:\"file/editor-rtl.css\";i:169;s:23:\"file/editor-rtl.min.css\";i:170;s:15:\"file/editor.css\";i:171;s:19:\"file/editor.min.css\";i:172;s:18:\"file/style-rtl.css\";i:173;s:22:\"file/style-rtl.min.css\";i:174;s:14:\"file/style.css\";i:175;s:18:\"file/style.min.css\";i:176;s:23:\"footnotes/style-rtl.css\";i:177;s:27:\"footnotes/style-rtl.min.css\";i:178;s:19:\"footnotes/style.css\";i:179;s:23:\"footnotes/style.min.css\";i:180;s:23:\"freeform/editor-rtl.css\";i:181;s:27:\"freeform/editor-rtl.min.css\";i:182;s:19:\"freeform/editor.css\";i:183;s:23:\"freeform/editor.min.css\";i:184;s:22:\"gallery/editor-rtl.css\";i:185;s:26:\"gallery/editor-rtl.min.css\";i:186;s:18:\"gallery/editor.css\";i:187;s:22:\"gallery/editor.min.css\";i:188;s:21:\"gallery/style-rtl.css\";i:189;s:25:\"gallery/style-rtl.min.css\";i:190;s:17:\"gallery/style.css\";i:191;s:21:\"gallery/style.min.css\";i:192;s:21:\"gallery/theme-rtl.css\";i:193;s:25:\"gallery/theme-rtl.min.css\";i:194;s:17:\"gallery/theme.css\";i:195;s:21:\"gallery/theme.min.css\";i:196;s:20:\"group/editor-rtl.css\";i:197;s:24:\"group/editor-rtl.min.css\";i:198;s:16:\"group/editor.css\";i:199;s:20:\"group/editor.min.css\";i:200;s:19:\"group/style-rtl.css\";i:201;s:23:\"group/style-rtl.min.css\";i:202;s:15:\"group/style.css\";i:203;s:19:\"group/style.min.css\";i:204;s:19:\"group/theme-rtl.css\";i:205;s:23:\"group/theme-rtl.min.css\";i:206;s:15:\"group/theme.css\";i:207;s:19:\"group/theme.min.css\";i:208;s:21:\"heading/style-rtl.css\";i:209;s:25:\"heading/style-rtl.min.css\";i:210;s:17:\"heading/style.css\";i:211;s:21:\"heading/style.min.css\";i:212;s:19:\"html/editor-rtl.css\";i:213;s:23:\"html/editor-rtl.min.css\";i:214;s:15:\"html/editor.css\";i:215;s:19:\"html/editor.min.css\";i:216;s:19:\"icon/editor-rtl.css\";i:217;s:23:\"icon/editor-rtl.min.css\";i:218;s:15:\"icon/editor.css\";i:219;s:19:\"icon/editor.min.css\";i:220;s:18:\"icon/style-rtl.css\";i:221;s:22:\"icon/style-rtl.min.css\";i:222;s:14:\"icon/style.css\";i:223;s:18:\"icon/style.min.css\";i:224;s:20:\"image/editor-rtl.css\";i:225;s:24:\"image/editor-rtl.min.css\";i:226;s:16:\"image/editor.css\";i:227;s:20:\"image/editor.min.css\";i:228;s:19:\"image/style-rtl.css\";i:229;s:23:\"image/style-rtl.min.css\";i:230;s:15:\"image/style.css\";i:231;s:19:\"image/style.min.css\";i:232;s:19:\"image/theme-rtl.css\";i:233;s:23:\"image/theme-rtl.min.css\";i:234;s:15:\"image/theme.css\";i:235;s:19:\"image/theme.min.css\";i:236;s:29:\"latest-comments/style-rtl.css\";i:237;s:33:\"latest-comments/style-rtl.min.css\";i:238;s:25:\"latest-comments/style.css\";i:239;s:29:\"latest-comments/style.min.css\";i:240;s:27:\"latest-posts/editor-rtl.css\";i:241;s:31:\"latest-posts/editor-rtl.min.css\";i:242;s:23:\"latest-posts/editor.css\";i:243;s:27:\"latest-posts/editor.min.css\";i:244;s:26:\"latest-posts/style-rtl.css\";i:245;s:30:\"latest-posts/style-rtl.min.css\";i:246;s:22:\"latest-posts/style.css\";i:247;s:26:\"latest-posts/style.min.css\";i:248;s:18:\"list/style-rtl.css\";i:249;s:22:\"list/style-rtl.min.css\";i:250;s:14:\"list/style.css\";i:251;s:18:\"list/style.min.css\";i:252;s:22:\"loginout/style-rtl.css\";i:253;s:26:\"loginout/style-rtl.min.css\";i:254;s:18:\"loginout/style.css\";i:255;s:22:\"loginout/style.min.css\";i:256;s:19:\"math/editor-rtl.css\";i:257;s:23:\"math/editor-rtl.min.css\";i:258;s:15:\"math/editor.css\";i:259;s:19:\"math/editor.min.css\";i:260;s:18:\"math/style-rtl.css\";i:261;s:22:\"math/style-rtl.min.css\";i:262;s:14:\"math/style.css\";i:263;s:18:\"math/style.min.css\";i:264;s:25:\"media-text/editor-rtl.css\";i:265;s:29:\"media-text/editor-rtl.min.css\";i:266;s:21:\"media-text/editor.css\";i:267;s:25:\"media-text/editor.min.css\";i:268;s:24:\"media-text/style-rtl.css\";i:269;s:28:\"media-text/style-rtl.min.css\";i:270;s:20:\"media-text/style.css\";i:271;s:24:\"media-text/style.min.css\";i:272;s:19:\"more/editor-rtl.css\";i:273;s:23:\"more/editor-rtl.min.css\";i:274;s:15:\"more/editor.css\";i:275;s:19:\"more/editor.min.css\";i:276;s:30:\"navigation-link/editor-rtl.css\";i:277;s:34:\"navigation-link/editor-rtl.min.css\";i:278;s:26:\"navigation-link/editor.css\";i:279;s:30:\"navigation-link/editor.min.css\";i:280;s:29:\"navigation-link/style-rtl.css\";i:281;s:33:\"navigation-link/style-rtl.min.css\";i:282;s:25:\"navigation-link/style.css\";i:283;s:29:\"navigation-link/style.min.css\";i:284;s:38:\"navigation-overlay-close/style-rtl.css\";i:285;s:42:\"navigation-overlay-close/style-rtl.min.css\";i:286;s:34:\"navigation-overlay-close/style.css\";i:287;s:38:\"navigation-overlay-close/style.min.css\";i:288;s:33:\"navigation-submenu/editor-rtl.css\";i:289;s:37:\"navigation-submenu/editor-rtl.min.css\";i:290;s:29:\"navigation-submenu/editor.css\";i:291;s:33:\"navigation-submenu/editor.min.css\";i:292;s:25:\"navigation/editor-rtl.css\";i:293;s:29:\"navigation/editor-rtl.min.css\";i:294;s:21:\"navigation/editor.css\";i:295;s:25:\"navigation/editor.min.css\";i:296;s:24:\"navigation/style-rtl.css\";i:297;s:28:\"navigation/style-rtl.min.css\";i:298;s:20:\"navigation/style.css\";i:299;s:24:\"navigation/style.min.css\";i:300;s:23:\"nextpage/editor-rtl.css\";i:301;s:27:\"nextpage/editor-rtl.min.css\";i:302;s:19:\"nextpage/editor.css\";i:303;s:23:\"nextpage/editor.min.css\";i:304;s:24:\"page-list/editor-rtl.css\";i:305;s:28:\"page-list/editor-rtl.min.css\";i:306;s:20:\"page-list/editor.css\";i:307;s:24:\"page-list/editor.min.css\";i:308;s:23:\"page-list/style-rtl.css\";i:309;s:27:\"page-list/style-rtl.min.css\";i:310;s:19:\"page-list/style.css\";i:311;s:23:\"page-list/style.min.css\";i:312;s:24:\"paragraph/editor-rtl.css\";i:313;s:28:\"paragraph/editor-rtl.min.css\";i:314;s:20:\"paragraph/editor.css\";i:315;s:24:\"paragraph/editor.min.css\";i:316;s:23:\"paragraph/style-rtl.css\";i:317;s:27:\"paragraph/style-rtl.min.css\";i:318;s:19:\"paragraph/style.css\";i:319;s:23:\"paragraph/style.min.css\";i:320;s:35:\"post-author-biography/style-rtl.css\";i:321;s:39:\"post-author-biography/style-rtl.min.css\";i:322;s:31:\"post-author-biography/style.css\";i:323;s:35:\"post-author-biography/style.min.css\";i:324;s:30:\"post-author-name/style-rtl.css\";i:325;s:34:\"post-author-name/style-rtl.min.css\";i:326;s:26:\"post-author-name/style.css\";i:327;s:30:\"post-author-name/style.min.css\";i:328;s:26:\"post-author/editor-rtl.css\";i:329;s:30:\"post-author/editor-rtl.min.css\";i:330;s:22:\"post-author/editor.css\";i:331;s:26:\"post-author/editor.min.css\";i:332;s:25:\"post-author/style-rtl.css\";i:333;s:29:\"post-author/style-rtl.min.css\";i:334;s:21:\"post-author/style.css\";i:335;s:25:\"post-author/style.min.css\";i:336;s:33:\"post-comments-count/style-rtl.css\";i:337;s:37:\"post-comments-count/style-rtl.min.css\";i:338;s:29:\"post-comments-count/style.css\";i:339;s:33:\"post-comments-count/style.min.css\";i:340;s:33:\"post-comments-form/editor-rtl.css\";i:341;s:37:\"post-comments-form/editor-rtl.min.css\";i:342;s:29:\"post-comments-form/editor.css\";i:343;s:33:\"post-comments-form/editor.min.css\";i:344;s:32:\"post-comments-form/style-rtl.css\";i:345;s:36:\"post-comments-form/style-rtl.min.css\";i:346;s:28:\"post-comments-form/style.css\";i:347;s:32:\"post-comments-form/style.min.css\";i:348;s:32:\"post-comments-link/style-rtl.css\";i:349;s:36:\"post-comments-link/style-rtl.min.css\";i:350;s:28:\"post-comments-link/style.css\";i:351;s:32:\"post-comments-link/style.min.css\";i:352;s:26:\"post-content/style-rtl.css\";i:353;s:30:\"post-content/style-rtl.min.css\";i:354;s:22:\"post-content/style.css\";i:355;s:26:\"post-content/style.min.css\";i:356;s:23:\"post-date/style-rtl.css\";i:357;s:27:\"post-date/style-rtl.min.css\";i:358;s:19:\"post-date/style.css\";i:359;s:23:\"post-date/style.min.css\";i:360;s:27:\"post-excerpt/editor-rtl.css\";i:361;s:31:\"post-excerpt/editor-rtl.min.css\";i:362;s:23:\"post-excerpt/editor.css\";i:363;s:27:\"post-excerpt/editor.min.css\";i:364;s:26:\"post-excerpt/style-rtl.css\";i:365;s:30:\"post-excerpt/style-rtl.min.css\";i:366;s:22:\"post-excerpt/style.css\";i:367;s:26:\"post-excerpt/style.min.css\";i:368;s:34:\"post-featured-image/editor-rtl.css\";i:369;s:38:\"post-featured-image/editor-rtl.min.css\";i:370;s:30:\"post-featured-image/editor.css\";i:371;s:34:\"post-featured-image/editor.min.css\";i:372;s:33:\"post-featured-image/style-rtl.css\";i:373;s:37:\"post-featured-image/style-rtl.min.css\";i:374;s:29:\"post-featured-image/style.css\";i:375;s:33:\"post-featured-image/style.min.css\";i:376;s:34:\"post-navigation-link/style-rtl.css\";i:377;s:38:\"post-navigation-link/style-rtl.min.css\";i:378;s:30:\"post-navigation-link/style.css\";i:379;s:34:\"post-navigation-link/style.min.css\";i:380;s:27:\"post-template/style-rtl.css\";i:381;s:31:\"post-template/style-rtl.min.css\";i:382;s:23:\"post-template/style.css\";i:383;s:27:\"post-template/style.min.css\";i:384;s:24:\"post-terms/style-rtl.css\";i:385;s:28:\"post-terms/style-rtl.min.css\";i:386;s:20:\"post-terms/style.css\";i:387;s:24:\"post-terms/style.min.css\";i:388;s:31:\"post-time-to-read/style-rtl.css\";i:389;s:35:\"post-time-to-read/style-rtl.min.css\";i:390;s:27:\"post-time-to-read/style.css\";i:391;s:31:\"post-time-to-read/style.min.css\";i:392;s:24:\"post-title/style-rtl.css\";i:393;s:28:\"post-title/style-rtl.min.css\";i:394;s:20:\"post-title/style.css\";i:395;s:24:\"post-title/style.min.css\";i:396;s:26:\"preformatted/style-rtl.css\";i:397;s:30:\"preformatted/style-rtl.min.css\";i:398;s:22:\"preformatted/style.css\";i:399;s:26:\"preformatted/style.min.css\";i:400;s:24:\"pullquote/editor-rtl.css\";i:401;s:28:\"pullquote/editor-rtl.min.css\";i:402;s:20:\"pullquote/editor.css\";i:403;s:24:\"pullquote/editor.min.css\";i:404;s:23:\"pullquote/style-rtl.css\";i:405;s:27:\"pullquote/style-rtl.min.css\";i:406;s:19:\"pullquote/style.css\";i:407;s:23:\"pullquote/style.min.css\";i:408;s:23:\"pullquote/theme-rtl.css\";i:409;s:27:\"pullquote/theme-rtl.min.css\";i:410;s:19:\"pullquote/theme.css\";i:411;s:23:\"pullquote/theme.min.css\";i:412;s:39:\"query-pagination-numbers/editor-rtl.css\";i:413;s:43:\"query-pagination-numbers/editor-rtl.min.css\";i:414;s:35:\"query-pagination-numbers/editor.css\";i:415;s:39:\"query-pagination-numbers/editor.min.css\";i:416;s:31:\"query-pagination/editor-rtl.css\";i:417;s:35:\"query-pagination/editor-rtl.min.css\";i:418;s:27:\"query-pagination/editor.css\";i:419;s:31:\"query-pagination/editor.min.css\";i:420;s:30:\"query-pagination/style-rtl.css\";i:421;s:34:\"query-pagination/style-rtl.min.css\";i:422;s:26:\"query-pagination/style.css\";i:423;s:30:\"query-pagination/style.min.css\";i:424;s:25:\"query-title/style-rtl.css\";i:425;s:29:\"query-title/style-rtl.min.css\";i:426;s:21:\"query-title/style.css\";i:427;s:25:\"query-title/style.min.css\";i:428;s:25:\"query-total/style-rtl.css\";i:429;s:29:\"query-total/style-rtl.min.css\";i:430;s:21:\"query-total/style.css\";i:431;s:25:\"query-total/style.min.css\";i:432;s:20:\"query/editor-rtl.css\";i:433;s:24:\"query/editor-rtl.min.css\";i:434;s:16:\"query/editor.css\";i:435;s:20:\"query/editor.min.css\";i:436;s:19:\"quote/style-rtl.css\";i:437;s:23:\"quote/style-rtl.min.css\";i:438;s:15:\"quote/style.css\";i:439;s:19:\"quote/style.min.css\";i:440;s:19:\"quote/theme-rtl.css\";i:441;s:23:\"quote/theme-rtl.min.css\";i:442;s:15:\"quote/theme.css\";i:443;s:19:\"quote/theme.min.css\";i:444;s:23:\"read-more/style-rtl.css\";i:445;s:27:\"read-more/style-rtl.min.css\";i:446;s:19:\"read-more/style.css\";i:447;s:23:\"read-more/style.min.css\";i:448;s:18:\"rss/editor-rtl.css\";i:449;s:22:\"rss/editor-rtl.min.css\";i:450;s:14:\"rss/editor.css\";i:451;s:18:\"rss/editor.min.css\";i:452;s:17:\"rss/style-rtl.css\";i:453;s:21:\"rss/style-rtl.min.css\";i:454;s:13:\"rss/style.css\";i:455;s:17:\"rss/style.min.css\";i:456;s:21:\"search/editor-rtl.css\";i:457;s:25:\"search/editor-rtl.min.css\";i:458;s:17:\"search/editor.css\";i:459;s:21:\"search/editor.min.css\";i:460;s:20:\"search/style-rtl.css\";i:461;s:24:\"search/style-rtl.min.css\";i:462;s:16:\"search/style.css\";i:463;s:20:\"search/style.min.css\";i:464;s:20:\"search/theme-rtl.css\";i:465;s:24:\"search/theme-rtl.min.css\";i:466;s:16:\"search/theme.css\";i:467;s:20:\"search/theme.min.css\";i:468;s:24:\"separator/editor-rtl.css\";i:469;s:28:\"separator/editor-rtl.min.css\";i:470;s:20:\"separator/editor.css\";i:471;s:24:\"separator/editor.min.css\";i:472;s:23:\"separator/style-rtl.css\";i:473;s:27:\"separator/style-rtl.min.css\";i:474;s:19:\"separator/style.css\";i:475;s:23:\"separator/style.min.css\";i:476;s:23:\"separator/theme-rtl.css\";i:477;s:27:\"separator/theme-rtl.min.css\";i:478;s:19:\"separator/theme.css\";i:479;s:23:\"separator/theme.min.css\";i:480;s:24:\"shortcode/editor-rtl.css\";i:481;s:28:\"shortcode/editor-rtl.min.css\";i:482;s:20:\"shortcode/editor.css\";i:483;s:24:\"shortcode/editor.min.css\";i:484;s:24:\"site-logo/editor-rtl.css\";i:485;s:28:\"site-logo/editor-rtl.min.css\";i:486;s:20:\"site-logo/editor.css\";i:487;s:24:\"site-logo/editor.min.css\";i:488;s:23:\"site-logo/style-rtl.css\";i:489;s:27:\"site-logo/style-rtl.min.css\";i:490;s:19:\"site-logo/style.css\";i:491;s:23:\"site-logo/style.min.css\";i:492;s:27:\"site-tagline/editor-rtl.css\";i:493;s:31:\"site-tagline/editor-rtl.min.css\";i:494;s:23:\"site-tagline/editor.css\";i:495;s:27:\"site-tagline/editor.min.css\";i:496;s:26:\"site-tagline/style-rtl.css\";i:497;s:30:\"site-tagline/style-rtl.min.css\";i:498;s:22:\"site-tagline/style.css\";i:499;s:26:\"site-tagline/style.min.css\";i:500;s:25:\"site-title/editor-rtl.css\";i:501;s:29:\"site-title/editor-rtl.min.css\";i:502;s:21:\"site-title/editor.css\";i:503;s:25:\"site-title/editor.min.css\";i:504;s:24:\"site-title/style-rtl.css\";i:505;s:28:\"site-title/style-rtl.min.css\";i:506;s:20:\"site-title/style.css\";i:507;s:24:\"site-title/style.min.css\";i:508;s:26:\"social-link/editor-rtl.css\";i:509;s:30:\"social-link/editor-rtl.min.css\";i:510;s:22:\"social-link/editor.css\";i:511;s:26:\"social-link/editor.min.css\";i:512;s:27:\"social-links/editor-rtl.css\";i:513;s:31:\"social-links/editor-rtl.min.css\";i:514;s:23:\"social-links/editor.css\";i:515;s:27:\"social-links/editor.min.css\";i:516;s:26:\"social-links/style-rtl.css\";i:517;s:30:\"social-links/style-rtl.min.css\";i:518;s:22:\"social-links/style.css\";i:519;s:26:\"social-links/style.min.css\";i:520;s:21:\"spacer/editor-rtl.css\";i:521;s:25:\"spacer/editor-rtl.min.css\";i:522;s:17:\"spacer/editor.css\";i:523;s:21:\"spacer/editor.min.css\";i:524;s:20:\"spacer/style-rtl.css\";i:525;s:24:\"spacer/style-rtl.min.css\";i:526;s:16:\"spacer/style.css\";i:527;s:20:\"spacer/style.min.css\";i:528;s:20:\"table/editor-rtl.css\";i:529;s:24:\"table/editor-rtl.min.css\";i:530;s:16:\"table/editor.css\";i:531;s:20:\"table/editor.min.css\";i:532;s:19:\"table/style-rtl.css\";i:533;s:23:\"table/style-rtl.min.css\";i:534;s:15:\"table/style.css\";i:535;s:19:\"table/style.min.css\";i:536;s:19:\"table/theme-rtl.css\";i:537;s:23:\"table/theme-rtl.min.css\";i:538;s:15:\"table/theme.css\";i:539;s:19:\"table/theme.min.css\";i:540;s:23:\"tag-cloud/style-rtl.css\";i:541;s:27:\"tag-cloud/style-rtl.min.css\";i:542;s:19:\"tag-cloud/style.css\";i:543;s:23:\"tag-cloud/style.min.css\";i:544;s:28:\"template-part/editor-rtl.css\";i:545;s:32:\"template-part/editor-rtl.min.css\";i:546;s:24:\"template-part/editor.css\";i:547;s:28:\"template-part/editor.min.css\";i:548;s:27:\"template-part/theme-rtl.css\";i:549;s:31:\"template-part/theme-rtl.min.css\";i:550;s:23:\"template-part/theme.css\";i:551;s:27:\"template-part/theme.min.css\";i:552;s:24:\"term-count/style-rtl.css\";i:553;s:28:\"term-count/style-rtl.min.css\";i:554;s:20:\"term-count/style.css\";i:555;s:24:\"term-count/style.min.css\";i:556;s:30:\"term-description/style-rtl.css\";i:557;s:34:\"term-description/style-rtl.min.css\";i:558;s:26:\"term-description/style.css\";i:559;s:30:\"term-description/style.min.css\";i:560;s:23:\"term-name/style-rtl.css\";i:561;s:27:\"term-name/style-rtl.min.css\";i:562;s:19:\"term-name/style.css\";i:563;s:23:\"term-name/style.min.css\";i:564;s:28:\"term-template/editor-rtl.css\";i:565;s:32:\"term-template/editor-rtl.min.css\";i:566;s:24:\"term-template/editor.css\";i:567;s:28:\"term-template/editor.min.css\";i:568;s:27:\"term-template/style-rtl.css\";i:569;s:31:\"term-template/style-rtl.min.css\";i:570;s:23:\"term-template/style.css\";i:571;s:27:\"term-template/style.min.css\";i:572;s:27:\"text-columns/editor-rtl.css\";i:573;s:31:\"text-columns/editor-rtl.min.css\";i:574;s:23:\"text-columns/editor.css\";i:575;s:27:\"text-columns/editor.min.css\";i:576;s:26:\"text-columns/style-rtl.css\";i:577;s:30:\"text-columns/style-rtl.min.css\";i:578;s:22:\"text-columns/style.css\";i:579;s:26:\"text-columns/style.min.css\";i:580;s:19:\"verse/style-rtl.css\";i:581;s:23:\"verse/style-rtl.min.css\";i:582;s:15:\"verse/style.css\";i:583;s:19:\"verse/style.min.css\";i:584;s:20:\"video/editor-rtl.css\";i:585;s:24:\"video/editor-rtl.min.css\";i:586;s:16:\"video/editor.css\";i:587;s:20:\"video/editor.min.css\";i:588;s:19:\"video/style-rtl.css\";i:589;s:23:\"video/style-rtl.min.css\";i:590;s:15:\"video/style.css\";i:591;s:19:\"video/style.min.css\";i:592;s:19:\"video/theme-rtl.css\";i:593;s:23:\"video/theme-rtl.min.css\";i:594;s:15:\"video/theme.css\";i:595;s:19:\"video/theme.min.css\";}}','on'),
(125,'_transient_doing_cron','1785354184.2600769996643066406250','on'),
(126,'action_scheduler_hybrid_store_demarkation','4','auto'),
(127,'schema-ActionScheduler_StoreSchema','8.0.1784564894','auto'),
(128,'schema-ActionScheduler_LoggerSchema','3.0.1784564894','auto'),
(134,'woocommerce_newly_installed','yes','auto'),
(135,'woocommerce_order_stats_has_fulfillment_column','no','off'),
(136,'woocommerce_schema_version','920','auto'),
(137,'woocommerce_store_address','','on'),
(138,'woocommerce_store_address_2','','on'),
(139,'woocommerce_store_city','','on'),
(140,'woocommerce_default_country','FR:75','on'),
(141,'woocommerce_store_postcode','','on'),
(142,'woocommerce_allowed_countries','all','on'),
(143,'woocommerce_all_except_countries','','on'),
(144,'woocommerce_specific_allowed_countries','','on'),
(145,'woocommerce_ship_to_countries','','on'),
(146,'woocommerce_specific_ship_to_countries','','on'),
(147,'woocommerce_default_customer_address','base','on'),
(148,'woocommerce_address_autocomplete_enabled','no','on'),
(149,'woocommerce_calc_taxes','yes','on'),
(150,'woocommerce_enable_coupons','yes','on'),
(151,'woocommerce_calc_discounts_sequentially','no','off'),
(152,'woocommerce_currency','EUR','on'),
(153,'woocommerce_currency_pos','left','on'),
(154,'woocommerce_price_thousand_sep',',','on'),
(155,'woocommerce_price_decimal_sep','.','on'),
(156,'woocommerce_price_num_decimals','2','on'),
(157,'woocommerce_shop_page_id','11','on'),
(158,'woocommerce_cart_redirect_after_add','no','on'),
(159,'woocommerce_enable_ajax_add_to_cart','yes','on'),
(160,'woocommerce_placeholder_image','4','on'),
(161,'woocommerce_weight_unit','lbs','on'),
(162,'woocommerce_dimension_unit','in','on'),
(163,'woocommerce_enable_reviews','yes','on'),
(164,'woocommerce_review_rating_verification_label','yes','off'),
(165,'woocommerce_review_rating_verification_required','no','off'),
(166,'woocommerce_enable_review_rating','yes','on'),
(167,'woocommerce_review_rating_required','yes','off'),
(168,'woocommerce_manage_stock','yes','on'),
(169,'woocommerce_hold_stock_minutes','60','off'),
(170,'woocommerce_notify_low_stock','yes','off'),
(171,'woocommerce_notify_no_stock','yes','off'),
(172,'woocommerce_stock_email_recipient','admin@bagueship.local','off'),
(173,'woocommerce_notify_low_stock_amount','2','off'),
(174,'woocommerce_notify_no_stock_amount','0','on'),
(175,'woocommerce_hide_out_of_stock_items','no','on'),
(176,'woocommerce_stock_format','','on'),
(177,'woocommerce_file_download_method','force','off'),
(178,'woocommerce_downloads_redirect_fallback_allowed','no','off'),
(179,'woocommerce_downloads_require_login','no','off'),
(180,'woocommerce_downloads_grant_access_after_payment','yes','off'),
(181,'woocommerce_downloads_deliver_inline','','off'),
(182,'woocommerce_downloads_add_hash_to_filename','yes','on'),
(183,'woocommerce_downloads_count_partial','yes','on'),
(185,'woocommerce_attribute_lookup_direct_updates','no','on'),
(186,'woocommerce_attribute_lookup_optimized_updates','no','on'),
(187,'woocommerce_product_match_featured_image_by_sku','no','on'),
(188,'woocommerce_prices_include_tax','no','on'),
(189,'woocommerce_tax_based_on','shipping','on'),
(190,'woocommerce_shipping_tax_class','inherit','on'),
(191,'woocommerce_tax_round_at_subtotal','no','on'),
(192,'woocommerce_tax_classes','','on'),
(193,'woocommerce_tax_display_shop','excl','on'),
(194,'woocommerce_tax_display_cart','excl','on'),
(195,'woocommerce_price_display_suffix','','on'),
(196,'woocommerce_tax_total_display','itemized','off'),
(197,'woocommerce_enable_shipping_calc','yes','off'),
(198,'woocommerce_shipping_cost_requires_address','no','on'),
(199,'woocommerce_shipping_hide_rates_when_free','no','off'),
(200,'woocommerce_ship_to_destination','billing','off'),
(201,'woocommerce_shipping_debug_mode','no','on'),
(202,'woocommerce_enable_guest_checkout','yes','off'),
(203,'woocommerce_enable_checkout_login_reminder','no','off'),
(204,'woocommerce_enable_delayed_account_creation','yes','off'),
(205,'woocommerce_enable_signup_and_login_from_checkout','no','off'),
(206,'woocommerce_enable_myaccount_registration','yes','off'),
(207,'woocommerce_registration_generate_password','yes','off'),
(208,'woocommerce_registration_generate_username','yes','off'),
(209,'woocommerce_erasure_request_removes_order_data','no','off'),
(210,'woocommerce_erasure_request_removes_download_data','no','off'),
(211,'woocommerce_allow_bulk_remove_personal_data','no','off'),
(212,'woocommerce_registration_privacy_policy_text','Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].','on'),
(213,'woocommerce_checkout_privacy_policy_text','Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].','on'),
(214,'woocommerce_delete_inactive_accounts','a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}','off'),
(215,'woocommerce_trash_pending_orders','','off'),
(216,'woocommerce_trash_failed_orders','','off'),
(217,'woocommerce_trash_cancelled_orders','','off'),
(218,'woocommerce_anonymize_refunded_orders','a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}','off'),
(219,'woocommerce_anonymize_completed_orders','a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}','off'),
(220,'woocommerce_email_from_address','admin@bagueship.local','off'),
(221,'woocommerce_email_header_image','','off'),
(222,'woocommerce_email_header_image_width','120','on'),
(223,'woocommerce_email_header_alignment','left','on'),
(224,'woocommerce_email_font_family','Helvetica','on'),
(225,'woocommerce_email_footer_text','{site_title}<br />{store_address}','off'),
(226,'woocommerce_email_base_color','#720eec','off'),
(227,'woocommerce_email_background_color','#f7f7f7','off'),
(228,'woocommerce_email_body_background_color','#ffffff','off'),
(229,'woocommerce_email_text_color','#3c3c3c','off'),
(230,'woocommerce_email_footer_text_color','#3c3c3c','off'),
(231,'woocommerce_email_auto_sync_with_theme','no','off'),
(232,'woocommerce_pos_store_address','','on'),
(233,'woocommerce_pos_store_phone','','on'),
(234,'woocommerce_pos_store_email','admin@bagueship.local','on'),
(235,'woocommerce_pos_refund_returns_policy','','on'),
(236,'woocommerce_cart_page_id','12','off'),
(237,'woocommerce_checkout_page_id','13','off'),
(238,'woocommerce_myaccount_page_id','14','off'),
(239,'woocommerce_terms_page_id','','off'),
(240,'woocommerce_force_ssl_checkout','no','on'),
(241,'woocommerce_unforce_ssl_checkout','no','on'),
(242,'woocommerce_checkout_pay_endpoint','order-pay','on'),
(243,'woocommerce_checkout_order_received_endpoint','order-received','on'),
(244,'woocommerce_myaccount_add_payment_method_endpoint','add-payment-method','on'),
(245,'woocommerce_myaccount_delete_payment_method_endpoint','delete-payment-method','on'),
(246,'woocommerce_myaccount_set_default_payment_method_endpoint','set-default-payment-method','on'),
(247,'woocommerce_myaccount_orders_endpoint','orders','on'),
(248,'woocommerce_myaccount_view_order_endpoint','view-order','on'),
(249,'woocommerce_myaccount_downloads_endpoint','downloads','on'),
(250,'woocommerce_myaccount_edit_account_endpoint','edit-account','on'),
(251,'woocommerce_myaccount_edit_address_endpoint','edit-address','on'),
(252,'woocommerce_myaccount_payment_methods_endpoint','payment-methods','on'),
(253,'woocommerce_myaccount_lost_password_endpoint','lost-password','on'),
(254,'woocommerce_logout_endpoint','customer-logout','on'),
(255,'woocommerce_api_enabled','no','on'),
(256,'woocommerce_allow_tracking','no','on'),
(257,'woocommerce_show_marketplace_suggestions','yes','off'),
(258,'woocommerce_custom_orders_table_enabled','no','on'),
(259,'woocommerce_analytics_enabled','yes','on'),
(260,'woocommerce_feature_rate_limit_checkout_enabled','no','on'),
(261,'woocommerce_feature_order_attribution_enabled','yes','on'),
(262,'woocommerce_feature_site_visibility_badge_enabled','yes','on'),
(263,'woocommerce_hpos_datastore_caching_enabled','no','on'),
(264,'woocommerce_feature_remote_logging_enabled','yes','on'),
(265,'woocommerce_feature_deferred_transactional_emails_enabled','no','on'),
(266,'woocommerce_feature_customer_review_request_enabled','no','on'),
(267,'woocommerce_feature_email_improvements_enabled','no','on'),
(268,'_transient_timeout_wc_settings_email_improvements_reverted','1784564910','off'),
(269,'_transient_wc_settings_email_improvements_reverted','yes','off'),
(270,'woocommerce_email_improvements_disabled_count','1','auto'),
(271,'woocommerce_email_improvements_first_disabled_at','2026-07-20 16:28:15','auto'),
(272,'woocommerce_email_improvements_last_disabled_at','2026-07-20 16:28:15','auto'),
(273,'woocommerce_feature_blueprint_enabled','yes','on'),
(274,'woocommerce_feature_cost_of_goods_sold_enabled','no','on'),
(275,'woocommerce_hpos_fts_index_enabled','no','on'),
(276,'woocommerce_feature_block_email_editor_enabled','no','on'),
(277,'woocommerce_feature_point_of_sale_enabled','yes','on'),
(278,'woocommerce_feature_mcp_integration_enabled','no','on'),
(279,'woocommerce_feature_destroy-empty-sessions_enabled','no','on'),
(280,'woocommerce_feature_rest_api_caching_enabled','no','on'),
(281,'woocommerce_feature_product_instance_caching_enabled','no','on'),
(282,'woocommerce_single_image_width','600','on'),
(283,'woocommerce_thumbnail_image_width','300','on'),
(284,'woocommerce_checkout_highlight_required_fields','yes','on'),
(285,'woocommerce_demo_store','no','off'),
(286,'wc_downloads_approved_directories_mode','enabled','auto'),
(287,'woocommerce_permalinks','a:5:{s:12:\"product_base\";s:7:\"product\";s:13:\"category_base\";s:16:\"product-category\";s:8:\"tag_base\";s:11:\"product-tag\";s:14:\"attribute_base\";s:0:\"\";s:22:\"use_verbose_page_rules\";b:0;}','auto'),
(288,'_transient_wc_attribute_taxonomies','a:0:{}','on'),
(292,'default_product_cat','15','auto'),
(293,'woocommerce_refund_returns_page_id','9','auto'),
(294,'_transient_timeout__wc_activation_redirect','1784564925','off'),
(295,'_transient__wc_activation_redirect','1','off'),
(296,'woocommerce_paypal_settings','a:25:{s:7:\"enabled\";s:2:\"no\";s:5:\"title\";s:6:\"PayPal\";s:11:\"description\";s:85:\"Pay via PayPal; you can pay with your credit card if you don\'t have a PayPal account.\";s:5:\"email\";s:21:\"admin@bagueship.local\";s:8:\"advanced\";s:0:\"\";s:8:\"testmode\";s:2:\"no\";s:13:\"paymentaction\";s:4:\"sale\";s:14:\"paypal_buttons\";s:3:\"yes\";s:14:\"invoice_prefix\";s:3:\"WC-\";s:13:\"send_shipping\";s:3:\"yes\";s:16:\"address_override\";s:2:\"no\";s:5:\"debug\";s:2:\"no\";s:9:\"image_url\";s:0:\"\";s:16:\"ipn_notification\";s:3:\"yes\";s:14:\"receiver_email\";s:21:\"admin@bagueship.local\";s:14:\"identity_token\";s:0:\"\";s:11:\"api_details\";s:0:\"\";s:12:\"api_username\";s:0:\"\";s:12:\"api_password\";s:0:\"\";s:13:\"api_signature\";s:0:\"\";s:20:\"sandbox_api_username\";s:0:\"\";s:20:\"sandbox_api_password\";s:0:\"\";s:21:\"sandbox_api_signature\";s:0:\"\";s:28:\"transact_onboarding_complete\";s:2:\"no\";s:12:\"_should_load\";s:2:\"no\";}','on'),
(297,'woocommerce_version','10.8.1','auto'),
(298,'woocommerce_db_version','10.8.1','auto'),
(299,'woocommerce_store_id','64af185d-23e4-439f-87be-fd042da3a119','auto'),
(300,'woocommerce_admin_install_timestamp','1784564895','auto'),
(301,'woocommerce_inbox_variant_assignment','12','auto'),
(302,'woocommerce_remote_variant_assignment','101','auto'),
(303,'woocommerce_attribute_lookup_enabled','no','auto'),
(304,'_transient_timeout__woocommerce_upload_directory_status','1784651295','off'),
(305,'_transient__woocommerce_upload_directory_status','protected','off'),
(306,'_transient_woocommerce_activated_plugin','woocommerce/woocommerce.php','on'),
(307,'_transient_jetpack_autoloader_plugin_paths','a:1:{i:0;s:29:\"{{WP_PLUGIN_DIR}}/woocommerce\";}','on'),
(308,'woocommerce_admin_notices','a:2:{i:0;s:20:\"no_secure_connection\";i:1;s:14:\"template_files\";}','auto'),
(309,'woocommerce_maxmind_geolocation_settings','a:1:{s:15:\"database_prefix\";s:32:\"x6tgaolmjc0Ygu5HhquaVp6m55v0pc6b\";}','on'),
(310,'_transient_woocommerce_webhook_ids_status_active','a:0:{}','on'),
(311,'widget_woocommerce_widget_cart','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(312,'widget_woocommerce_layered_nav_filters','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(313,'widget_woocommerce_layered_nav','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(314,'widget_woocommerce_price_filter','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(315,'widget_woocommerce_product_categories','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(316,'widget_woocommerce_product_search','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(317,'widget_woocommerce_product_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(318,'widget_woocommerce_products','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(319,'widget_woocommerce_recently_viewed_products','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(320,'widget_woocommerce_top_rated_products','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(321,'widget_woocommerce_recent_reviews','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(322,'widget_woocommerce_rating_filter','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(323,'widget_wc_brands_brand_description','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(324,'widget_woocommerce_brand_nav','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(325,'widget_wc_brands_brand_thumbnails','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(326,'_site_transient_timeout_woocommerce_blocks_patterns','1787156895','off'),
(327,'_site_transient_woocommerce_blocks_patterns','a:2:{s:7:\"version\";s:6:\"10.8.1\";s:8:\"patterns\";a:41:{i:0;a:11:{s:5:\"title\";s:6:\"Banner\";s:4:\"slug\";s:25:\"woocommerce-blocks/banner\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:10:\"banner.php\";}i:1;a:11:{s:5:\"title\";s:23:\"Coming Soon Entire Site\";s:4:\"slug\";s:35:\"woocommerce/coming-soon-entire-site\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:17:\"launch-your-store\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:27:\"coming-soon-entire-site.php\";}i:2;a:11:{s:5:\"title\";s:22:\"Coming Soon Store Only\";s:4:\"slug\";s:34:\"woocommerce/coming-soon-store-only\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:17:\"launch-your-store\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:26:\"coming-soon-store-only.php\";}i:3;a:11:{s:5:\"title\";s:11:\"Coming Soon\";s:4:\"slug\";s:23:\"woocommerce/coming-soon\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:17:\"launch-your-store\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:15:\"coming-soon.php\";}i:4;a:11:{s:5:\"title\";s:29:\"Content Right with Image Left\";s:4:\"slug\";s:48:\"woocommerce-blocks/content-right-with-image-left\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, About\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:28:\"content-right-image-left.php\";}i:5;a:11:{s:5:\"title\";s:29:\"Featured Category Cover Image\";s:4:\"slug\";s:48:\"woocommerce-blocks/featured-category-cover-image\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, Intro\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:33:\"featured-category-cover-image.php\";}i:6;a:11:{s:5:\"title\";s:24:\"Featured Category Triple\";s:4:\"slug\";s:43:\"woocommerce-blocks/featured-category-triple\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:28:\"featured-category-triple.php\";}i:7;a:11:{s:5:\"title\";s:12:\"Large Footer\";s:4:\"slug\";s:31:\"woocommerce-blocks/footer-large\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/footer\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:16:\"footer-large.php\";}i:8;a:11:{s:5:\"title\";s:23:\"Footer with Simple Menu\";s:4:\"slug\";s:37:\"woocommerce-blocks/footer-simple-menu\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/footer\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:22:\"footer-simple-menu.php\";}i:9;a:11:{s:5:\"title\";s:19:\"Footer with 3 Menus\";s:4:\"slug\";s:38:\"woocommerce-blocks/footer-with-3-menus\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/footer\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:23:\"footer-with-3-menus.php\";}i:10;a:11:{s:5:\"title\";s:28:\"Four Image Grid Content Left\";s:4:\"slug\";s:47:\"woocommerce-blocks/four-image-grid-content-left\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, About\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:32:\"four-image-grid-content-left.php\";}i:11;a:11:{s:5:\"title\";s:20:\"Centered Header Menu\";s:4:\"slug\";s:39:\"woocommerce-blocks/header-centered-menu\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/header\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:27:\"header-centered-pattern.php\";}i:12;a:11:{s:5:\"title\";s:23:\"Distraction Free Header\";s:4:\"slug\";s:42:\"woocommerce-blocks/header-distraction-free\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/header\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:27:\"header-distraction-free.php\";}i:13;a:11:{s:5:\"title\";s:16:\"Essential Header\";s:4:\"slug\";s:35:\"woocommerce-blocks/header-essential\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/header\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:20:\"header-essential.php\";}i:14;a:11:{s:5:\"title\";s:12:\"Large Header\";s:4:\"slug\";s:31:\"woocommerce-blocks/header-large\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/header\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:16:\"header-large.php\";}i:15;a:11:{s:5:\"title\";s:14:\"Minimal Header\";s:4:\"slug\";s:33:\"woocommerce-blocks/header-minimal\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:25:\"core/template-part/header\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:18:\"header-minimal.php\";}i:16;a:11:{s:5:\"title\";s:46:\"Heading with Three Columns of Content and Link\";s:4:\"slug\";s:66:\"woocommerce-blocks/heading-with-three-columns-of-content-with-link\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:21:\"WooCommerce, Services\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:51:\"heading-with-three-columns-of-content-with-link.php\";}i:17;a:11:{s:5:\"title\";s:20:\"Hero Product 3 Split\";s:4:\"slug\";s:39:\"woocommerce-blocks/hero-product-3-split\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:24:\"hero-product-3-split.php\";}i:18;a:11:{s:5:\"title\";s:23:\"Hero Product Chessboard\";s:4:\"slug\";s:42:\"woocommerce-blocks/hero-product-chessboard\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:27:\"hero-product-chessboard.php\";}i:19;a:11:{s:5:\"title\";s:18:\"Hero Product Split\";s:4:\"slug\";s:37:\"woocommerce-blocks/hero-product-split\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, Intro\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:22:\"hero-product-split.php\";}i:20;a:11:{s:5:\"title\";s:33:\"Centered Content with Image Below\";s:4:\"slug\";s:52:\"woocommerce-blocks/centered-content-with-image-below\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, Intro\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:43:\"intro-centered-content-with-image-below.php\";}i:21;a:11:{s:5:\"title\";s:22:\"Just Arrived Full Hero\";s:4:\"slug\";s:41:\"woocommerce-blocks/just-arrived-full-hero\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:18:\"WooCommerce, Intro\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:26:\"just-arrived-full-hero.php\";}i:22;a:11:{s:5:\"title\";s:33:\"No Products Found - Clear Filters\";s:4:\"slug\";s:43:\"woocommerce/no-products-found-clear-filters\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:2:\"no\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:29:\"no-products-found-filters.php\";}i:23;a:11:{s:5:\"title\";s:17:\"No Products Found\";s:4:\"slug\";s:29:\"woocommerce/no-products-found\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:2:\"no\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:21:\"no-products-found.php\";}i:24;a:11:{s:5:\"title\";s:19:\"Default Coming Soon\";s:4:\"slug\";s:36:\"woocommerce/page-coming-soon-default\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:28:\"page-coming-soon-default.php\";}i:25;a:11:{s:5:\"title\";s:25:\"Coming Soon Image Gallery\";s:4:\"slug\";s:42:\"woocommerce/page-coming-soon-image-gallery\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:34:\"page-coming-soon-image-gallery.php\";}i:26;a:11:{s:5:\"title\";s:30:\"Coming Soon Minimal Left Image\";s:4:\"slug\";s:47:\"woocommerce/page-coming-soon-minimal-left-image\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:39:\"page-coming-soon-minimal-left-image.php\";}i:27;a:11:{s:5:\"title\";s:24:\"Coming Soon Modern Black\";s:4:\"slug\";s:41:\"woocommerce/page-coming-soon-modern-black\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:33:\"page-coming-soon-modern-black.php\";}i:28;a:11:{s:5:\"title\";s:29:\"Coming Soon Split Right Image\";s:4:\"slug\";s:46:\"woocommerce/page-coming-soon-split-right-image\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:38:\"page-coming-soon-split-right-image.php\";}i:29;a:11:{s:5:\"title\";s:34:\"Coming Soon with Header and Footer\";s:4:\"slug\";s:47:\"woocommerce/page-coming-soon-with-header-footer\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:11:\"coming-soon\";s:6:\"source\";s:39:\"page-coming-soon-with-header-footer.php\";}i:30;a:11:{s:5:\"title\";s:28:\"Product Collection 3 Columns\";s:4:\"slug\";s:47:\"woocommerce-blocks/product-collection-3-columns\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:32:\"product-collection-3-columns.php\";}i:31;a:11:{s:5:\"title\";s:28:\"Product Collection 4 Columns\";s:4:\"slug\";s:47:\"woocommerce-blocks/product-collection-4-columns\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:32:\"product-collection-4-columns.php\";}i:32;a:11:{s:5:\"title\";s:28:\"Product Collection 5 Columns\";s:4:\"slug\";s:47:\"woocommerce-blocks/product-collection-5-columns\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:32:\"product-collection-5-columns.php\";}i:33;a:11:{s:5:\"title\";s:47:\"Product Collection: Featured Products 5 Columns\";s:4:\"slug\";s:65:\"woocommerce-blocks/product-collection-featured-products-5-columns\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:50:\"product-collection-featured-products-5-columns.php\";}i:34;a:11:{s:5:\"title\";s:15:\"Product Gallery\";s:4:\"slug\";s:48:\"woocommerce-blocks/product-query-product-gallery\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:29:\"WooCommerce, featured-selling\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:36:\"core/query/woocommerce/product-query\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:33:\"product-query-product-gallery.php\";}i:35;a:11:{s:5:\"title\";s:14:\"Product Search\";s:4:\"slug\";s:31:\"woocommerce/product-search-form\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:2:\"no\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:23:\"product-search-form.php\";}i:36;a:11:{s:5:\"title\";s:16:\"Related Products\";s:4:\"slug\";s:35:\"woocommerce-blocks/related-products\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:11:\"WooCommerce\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:5:\"false\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:20:\"related-products.php\";}i:37;a:11:{s:5:\"title\";s:33:\"Social: Follow Us on Social Media\";s:4:\"slug\";s:51:\"woocommerce-blocks/social-follow-us-in-social-media\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:25:\"WooCommerce, social-media\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:36:\"social-follow-us-in-social-media.php\";}i:38;a:11:{s:5:\"title\";s:22:\"Testimonials 3 Columns\";s:4:\"slug\";s:41:\"woocommerce-blocks/testimonials-3-columns\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:20:\"WooCommerce, Reviews\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:26:\"testimonials-3-columns.php\";}i:39;a:11:{s:5:\"title\";s:18:\"Testimonial Single\";s:4:\"slug\";s:38:\"woocommerce-blocks/testimonials-single\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:20:\"WooCommerce, Reviews\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:23:\"testimonials-single.php\";}i:40;a:11:{s:5:\"title\";s:37:\"Three Columns with Images and Content\";s:4:\"slug\";s:56:\"woocommerce-blocks/three-columns-with-images-and-content\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";s:0:\"\";s:10:\"categories\";s:21:\"WooCommerce, Services\";s:8:\"keywords\";s:0:\"\";s:10:\"blockTypes\";s:0:\"\";s:8:\"inserter\";s:0:\"\";s:11:\"featureFlag\";s:0:\"\";s:13:\"templateTypes\";s:0:\"\";s:6:\"source\";s:41:\"three-columns-with-images-and-content.php\";}}}','off'),
(328,'woocommerce_checkout_phone_field','optional','auto'),
(329,'woocommerce_checkout_company_field','hidden','auto'),
(330,'woocommerce_checkout_address_2_field','optional','auto'),
(331,'_transient_timeout_woocommerce_blocks_asset_api_script_data','1787156895','off'),
(332,'_transient_woocommerce_blocks_asset_api_script_data','{\"script_data\":{\"assets\\/client\\/blocks\\/wc-settings.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-settings.js\",\"version\":\"5cdaba16c87338181b77\",\"dependencies\":[\"wc-types\",\"wp-hooks\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-types.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-types.js\",\"version\":\"f3ab56d2923288ac7721\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-entities.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-entities.js\",\"version\":\"f24edbc53d0d6914962b\",\"dependencies\":[\"wc-settings\",\"wp-core-data\",\"wp-data\",\"wp-i18n\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-middleware.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-middleware.js\",\"version\":\"2c049fe250c153b7cac8\",\"dependencies\":[\"wp-api-fetch\",\"wp-polyfill\",\"wp-url\"]},\"assets\\/client\\/blocks\\/wc-blocks-data.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-data.js\",\"version\":\"b3c5c63391af29efa131\",\"dependencies\":[\"wc-blocks-checkout-events\",\"wc-blocks-registry\",\"wc-settings\",\"wc-types\",\"wp-api-fetch\",\"wp-data\",\"wp-data-controls\",\"wp-deprecated\",\"wp-dom\",\"wp-element\",\"wp-hooks\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-notices\",\"wp-polyfill\",\"wp-url\"]},\"assets\\/client\\/blocks\\/wc-blocks-vendors.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-vendors.js\",\"version\":\"5f5370c4ac22a4916f87\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-registry.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-registry.js\",\"version\":\"bb54b6869c8b2a477616\",\"dependencies\":[\"react-jsx-runtime\",\"wc-settings\",\"wp-data\",\"wp-deprecated\",\"wp-element\",\"wp-hooks\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks.js\",\"version\":\"888fc7fc921d3d5b4e0e\",\"dependencies\":[\"react-jsx-runtime\",\"wp-blocks\",\"wp-compose\",\"wp-element\",\"wp-hooks\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-shared-context.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-shared-context.js\",\"version\":\"621353d8a3a7c8d44b41\",\"dependencies\":[\"react-jsx-runtime\",\"wp-element\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-shared-hocs.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-shared-hocs.js\",\"version\":\"81d21446ddb1d5f22bf3\",\"dependencies\":[\"react-jsx-runtime\",\"wc-blocks-data-store\",\"wc-blocks-shared-context\",\"wc-types\",\"wp-data\",\"wp-element\",\"wp-is-shallow-equal\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/price-format.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/price-format.js\",\"version\":\"0df720e448f7ab3c5d0d\",\"dependencies\":[\"wc-settings\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-blocks-frontend-vendors-frontend.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-blocks-frontend-vendors-frontend.js\",\"version\":\"faf32ee6ad045929d3b2\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-cart-checkout-vendors-frontend.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-cart-checkout-vendors-frontend.js\",\"version\":\"e5df053d8bcfb11ea868\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/wc-cart-checkout-base-frontend.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-cart-checkout-base-frontend.js\",\"version\":\"5eecc58b7a7b61cb8ff3\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/blocks-checkout.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/blocks-checkout.js\",\"version\":\"551d5b2440510fefe23d\",\"dependencies\":[\"wc-cart-checkout-base\",\"wc-cart-checkout-vendors\",\"react\",\"react-dom\",\"react-jsx-runtime\",\"wc-blocks-checkout-events\",\"wc-blocks-components\",\"wc-blocks-data-store\",\"wc-blocks-registry\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-compose\",\"wp-data\",\"wp-deprecated\",\"wp-element\",\"wp-html-entities\",\"wp-i18n\",\"wp-is-shallow-equal\",\"wp-notices\",\"wp-polyfill\",\"wp-primitives\",\"wp-warning\"]},\"assets\\/client\\/blocks\\/blocks-checkout-events.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/blocks-checkout-events.js\",\"version\":\"1cd9ffa6e3cff96ad1b2\",\"dependencies\":[\"wc-types\",\"wp-polyfill\"]},\"assets\\/client\\/blocks\\/blocks-components.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/blocks-components.js\",\"version\":\"37e67f86787124e3e52d\",\"dependencies\":[\"wc-cart-checkout-base\",\"wc-cart-checkout-vendors\",\"react\",\"react-dom\",\"react-jsx-runtime\",\"wc-blocks-data-store\",\"wc-sanitize\",\"wc-settings\",\"wc-types\",\"wp-a11y\",\"wp-compose\",\"wp-data\",\"wp-deprecated\",\"wp-element\",\"wp-html-entities\",\"wp-i18n\",\"wp-notices\",\"wp-polyfill\",\"wp-primitives\"]},\"assets\\/client\\/blocks\\/wc-schema-parser.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/blocks\\/wc-schema-parser.js\",\"version\":\"63baa6fbe2326b07d735\",\"dependencies\":[\"wp-polyfill\"]},\"assets\\/client\\/admin\\/sanitize\\/index.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/admin\\/sanitize\\/index.js\",\"version\":\"6cc3684099bd6a5547b8\",\"dependencies\":[]},\"assets\\/client\\/admin\\/customer-effort-score\\/index.js\":{\"src\":\"http:\\/\\/localhost:8080\\/wp-content\\/plugins\\/woocommerce\\/assets\\/client\\/admin\\/customer-effort-score\\/index.js\",\"version\":\"6dbfcb0ea3cf69cfaadb\",\"dependencies\":[\"react\",\"wc-experimental\",\"wc-navigation\",\"wc-store-data\",\"wc-tracks\",\"wp-api-fetch\",\"wp-components\",\"wp-compose\",\"wp-data\",\"wp-data-controls\",\"wp-element\",\"wp-i18n\"]}},\"version\":\"wc-10.8.1\",\"hash\":\"c4fd35af69f586c95a4a08f914d22f90\"}','off'),
(335,'theme_mods_twentytwentyfive','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1784564896;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}','off'),
(336,'current_theme','Bagueship','auto'),
(337,'theme_switched','','auto'),
(340,'theme_mods_bagueship','a:2:{s:18:\"nav_menu_locations\";a:2:{s:7:\"primary\";i:18;s:6:\"footer\";i:19;}s:18:\"custom_css_post_id\";i:-1;}','auto'),
(341,'woocommerce_maybe_regenerate_images_hash','991b1ca641921cf0f5baf7a2fe85861b','auto'),
(342,'wp_1_wc_regenerate_images_batch_099fd5cf5928530f2da52b30197f0341','a:1:{i:0;a:1:{s:13:\"attachment_id\";s:1:\"4\";}}','off'),
(343,'woocommerce_coming_soon','no','auto'),
(345,'product_cat_children','a:0:{}','auto'),
(346,'_transient_product-transient-version','1785344469','on'),
(347,'_transient_product_query-transient-version','1785344469','on'),
(350,'_transient_woocommerce_product_task_has_product_transient','yes','on'),
(351,'woocommerce_task_list_tracked_completed_tasks','a:1:{i:0;s:8:\"products\";}','auto'),
(370,'_transient_timeout_wc_term_counts','1787156897','off'),
(371,'_transient_wc_term_counts','a:3:{s:14:\"17_product_cat\";i:2;s:14:\"16_product_cat\";i:2;s:14:\"15_product_cat\";i:0;}','off'),
(374,'_transient_shipping-transient-version','1784564897','on'),
(384,'bagueship_core_migration_version','20260618_legal_footer','auto'),
(409,'current_theme_supports_woocommerce','yes','auto'),
(410,'woocommerce_queue_flush_rewrite_rules','no','auto'),
(411,'_transient_wp_styles_for_blocks','a:2:{s:4:\"hash\";s:32:\"d4c194055311dd6a9e111c5556cddc2a\";s:6:\"blocks\";a:7:{s:32:\"0368537a03d4b05ed11f802c802c5153\";s:0:\"\";s:32:\"500888137eafa12a508de2c588d9ffdd\";s:46:\":root :where(.wp-block-icon svg){width: 24px;}\";s:32:\"a6036e6eb2ad2df7ed8860b807868647\";s:0:\"\";s:32:\"3b46efc0a10c1dae38f584ad199c3544\";s:120:\":where(.wp-block-post-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-post-template.is-layout-grid){gap: 1.25em;}\";s:32:\"ab4df16c9e454bfed8a404309545590d\";s:120:\":where(.wp-block-term-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-term-template.is-layout-grid){gap: 1.25em;}\";s:32:\"68ec5cad52d993402775a7503ba9efb7\";s:102:\":where(.wp-block-columns.is-layout-flex){gap: 2em;}:where(.wp-block-columns.is-layout-grid){gap: 2em;}\";s:32:\"b8b4aa19e69b9b2de0f5c27097467bd6\";s:69:\":root :where(.wp-block-pullquote){font-size: 1.5em;line-height: 1.6;}\";}}','on'),
(454,'jetpack_connection_active_plugins','a:1:{s:11:\"woocommerce\";a:1:{s:4:\"name\";s:11:\"WooCommerce\";}}','auto'),
(455,'_transient_timeout_wc_shipping_method_count','1787159766','off'),
(456,'_transient_wc_shipping_method_count','a:4:{s:7:\"version\";s:10:\"1784564897\";s:6:\"legacy\";i:0;s:7:\"enabled\";i:2;s:8:\"disabled\";i:0;}','off'),
(459,'_transient_timeout_as-post-store-dependencies-met','1785430865','off'),
(460,'_transient_as-post-store-dependencies-met','yes','off'),
(461,'_site_transient_timeout_theme_roots','1785346267','off'),
(462,'_site_transient_theme_roots','a:4:{s:9:\"bagueship\";s:7:\"/themes\";s:16:\"twentytwentyfive\";s:7:\"/themes\";s:16:\"twentytwentyfour\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";}','off'),
(479,'_transient_timeout_wc_product_children_15','1787936548','off'),
(480,'_transient_wc_product_children_15','a:2:{s:3:\"all\";a:6:{i:0;i:187;i:1;i:188;i:2;i:189;i:3;i:190;i:4;i:191;i:5;i:192;}s:7:\"visible\";a:6:{i:0;i:187;i:1;i:188;i:2;i:189;i:3;i:190;i:4;i:191;i:5;i:192;}}','off'),
(481,'_transient_timeout_wc_var_prices_15','1787936548','off'),
(482,'_transient_wc_var_prices_15','{\"4173c8e28f114c545d779c47fd7e2df1\":{\"price\":{\"187\":\"380.00\",\"188\":\"380.00\",\"189\":\"380.00\",\"190\":\"380.00\",\"191\":\"380.00\",\"192\":\"380.00\"},\"regular_price\":{\"187\":\"380.00\",\"188\":\"380.00\",\"189\":\"380.00\",\"190\":\"380.00\",\"191\":\"380.00\",\"192\":\"380.00\"},\"sale_price\":{\"187\":\"380.00\",\"188\":\"380.00\",\"189\":\"380.00\",\"190\":\"380.00\",\"191\":\"380.00\",\"192\":\"380.00\"}},\"f9e544f77b7eac7add281ef28ca5559f\":{\"price\":{\"187\":\"380.00\",\"188\":\"380.00\",\"189\":\"380.00\",\"190\":\"380.00\",\"191\":\"380.00\",\"192\":\"380.00\"},\"regular_price\":{\"187\":\"380.00\",\"188\":\"380.00\",\"189\":\"380.00\",\"190\":\"380.00\",\"191\":\"380.00\",\"192\":\"380.00\"},\"sale_price\":{\"187\":\"380.00\",\"188\":\"380.00\",\"189\":\"380.00\",\"190\":\"380.00\",\"191\":\"380.00\",\"192\":\"380.00\"}}}','off'),
(483,'_transient_timeout_wc_product_children_22','1787936548','off'),
(484,'_transient_wc_product_children_22','a:2:{s:3:\"all\";a:6:{i:0;i:193;i:1;i:194;i:2;i:195;i:3;i:196;i:4;i:197;i:5;i:198;}s:7:\"visible\";a:6:{i:0;i:193;i:1;i:194;i:2;i:195;i:3;i:196;i:4;i:197;i:5;i:198;}}','off'),
(485,'_transient_timeout_wc_var_prices_22','1787936548','off'),
(486,'_transient_wc_var_prices_22','{\"4173c8e28f114c545d779c47fd7e2df1\":{\"price\":{\"193\":\"420.00\",\"194\":\"420.00\",\"195\":\"420.00\",\"196\":\"420.00\",\"197\":\"420.00\",\"198\":\"420.00\"},\"regular_price\":{\"193\":\"420.00\",\"194\":\"420.00\",\"195\":\"420.00\",\"196\":\"420.00\",\"197\":\"420.00\",\"198\":\"420.00\"},\"sale_price\":{\"193\":\"420.00\",\"194\":\"420.00\",\"195\":\"420.00\",\"196\":\"420.00\",\"197\":\"420.00\",\"198\":\"420.00\"}},\"f9e544f77b7eac7add281ef28ca5559f\":{\"price\":{\"193\":\"420.00\",\"194\":\"420.00\",\"195\":\"420.00\",\"196\":\"420.00\",\"197\":\"420.00\",\"198\":\"420.00\"},\"regular_price\":{\"193\":\"420.00\",\"194\":\"420.00\",\"195\":\"420.00\",\"196\":\"420.00\",\"197\":\"420.00\",\"198\":\"420.00\"},\"sale_price\":{\"193\":\"420.00\",\"194\":\"420.00\",\"195\":\"420.00\",\"196\":\"420.00\",\"197\":\"420.00\",\"198\":\"420.00\"}}}','off'),
(487,'_transient_timeout_wc_product_children_29','1787936548','off'),
(488,'_transient_wc_product_children_29','a:2:{s:3:\"all\";a:6:{i:0;i:199;i:1;i:200;i:2;i:201;i:3;i:202;i:4;i:203;i:5;i:204;}s:7:\"visible\";a:6:{i:0;i:199;i:1;i:200;i:2;i:201;i:3;i:202;i:4;i:203;i:5;i:204;}}','off'),
(489,'_transient_timeout_wc_var_prices_29','1787936548','off'),
(490,'_transient_wc_var_prices_29','{\"4173c8e28f114c545d779c47fd7e2df1\":{\"price\":{\"199\":\"360.00\",\"200\":\"360.00\",\"201\":\"360.00\",\"202\":\"360.00\",\"203\":\"360.00\",\"204\":\"360.00\"},\"regular_price\":{\"199\":\"360.00\",\"200\":\"360.00\",\"201\":\"360.00\",\"202\":\"360.00\",\"203\":\"360.00\",\"204\":\"360.00\"},\"sale_price\":{\"199\":\"360.00\",\"200\":\"360.00\",\"201\":\"360.00\",\"202\":\"360.00\",\"203\":\"360.00\",\"204\":\"360.00\"}},\"f9e544f77b7eac7add281ef28ca5559f\":{\"price\":{\"199\":\"360.00\",\"200\":\"360.00\",\"201\":\"360.00\",\"202\":\"360.00\",\"203\":\"360.00\",\"204\":\"360.00\"},\"regular_price\":{\"199\":\"360.00\",\"200\":\"360.00\",\"201\":\"360.00\",\"202\":\"360.00\",\"203\":\"360.00\",\"204\":\"360.00\"},\"sale_price\":{\"199\":\"360.00\",\"200\":\"360.00\",\"201\":\"360.00\",\"202\":\"360.00\",\"203\":\"360.00\",\"204\":\"360.00\"}}}','off'),
(491,'_transient_timeout_wc_product_children_36','1787936548','off'),
(492,'_transient_wc_product_children_36','a:2:{s:3:\"all\";a:6:{i:0;i:205;i:1;i:206;i:2;i:207;i:3;i:208;i:4;i:209;i:5;i:210;}s:7:\"visible\";a:6:{i:0;i:205;i:1;i:206;i:2;i:207;i:3;i:208;i:4;i:209;i:5;i:210;}}','off'),
(493,'_transient_timeout_wc_var_prices_36','1787936548','off'),
(494,'_transient_wc_var_prices_36','{\"4173c8e28f114c545d779c47fd7e2df1\":{\"price\":{\"205\":\"340.00\",\"206\":\"340.00\",\"207\":\"340.00\",\"208\":\"340.00\",\"209\":\"340.00\",\"210\":\"340.00\"},\"regular_price\":{\"205\":\"340.00\",\"206\":\"340.00\",\"207\":\"340.00\",\"208\":\"340.00\",\"209\":\"340.00\",\"210\":\"340.00\"},\"sale_price\":{\"205\":\"340.00\",\"206\":\"340.00\",\"207\":\"340.00\",\"208\":\"340.00\",\"209\":\"340.00\",\"210\":\"340.00\"}},\"f9e544f77b7eac7add281ef28ca5559f\":{\"price\":{\"205\":\"340.00\",\"206\":\"340.00\",\"207\":\"340.00\",\"208\":\"340.00\",\"209\":\"340.00\",\"210\":\"340.00\"},\"regular_price\":{\"205\":\"340.00\",\"206\":\"340.00\",\"207\":\"340.00\",\"208\":\"340.00\",\"209\":\"340.00\",\"210\":\"340.00\"},\"sale_price\":{\"205\":\"340.00\",\"206\":\"340.00\",\"207\":\"340.00\",\"208\":\"340.00\",\"209\":\"340.00\",\"210\":\"340.00\"}}}','off'),
(495,'bagueship_promise_page_version','1','off'),
(501,'_site_transient_timeout_wp_theme_files_patterns-e81eaef7b1e940bb892f5f03a4b08bb2','1785354242','off'),
(502,'_site_transient_wp_theme_files_patterns-e81eaef7b1e940bb892f5f03a4b08bb2','a:2:{s:7:\"version\";s:5:\"1.0.0\";s:8:\"patterns\";a:0:{}}','off'),
(503,'woocommerce_email_from_name','Eclipse','auto'),
(504,'bagueship_legal_info','a:1:{s:12:\"company_name\";s:7:\"Eclipse\";}','auto'),
(505,'bagueship_eclipse_brand_version','2','off');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2553 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES
(1,2,'_wp_page_template','default'),
(2,3,'_wp_page_template','default'),
(3,4,'_wp_attached_file','woocommerce-placeholder.webp'),
(4,4,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:1200;s:4:\"file\";s:28:\"woocommerce-placeholder.webp\";s:8:\"filesize\";i:9892;s:5:\"sizes\";a:4:{s:6:\"medium\";a:5:{s:4:\"file\";s:36:\"woocommerce-placeholder-300x300.webp\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:1362;}s:5:\"large\";a:5:{s:4:\"file\";s:38:\"woocommerce-placeholder-1024x1024.webp\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:6032;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:36:\"woocommerce-placeholder-150x150.webp\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:662;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:36:\"woocommerce-placeholder-768x768.webp\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:4240;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}'),
(5,15,'_sku','BAG-ABSTRACT-OPENWORK'),
(6,15,'total_sales','0'),
(7,15,'_tax_status','taxable'),
(8,15,'_tax_class',''),
(9,15,'_manage_stock','no'),
(10,15,'_backorders','no'),
(11,15,'_sold_individually','no'),
(12,15,'_virtual','no'),
(13,15,'_downloadable','no'),
(14,15,'_download_limit','-1'),
(15,15,'_download_expiry','-1'),
(16,15,'_stock',NULL),
(17,15,'_stock_status','instock'),
(18,15,'_wc_average_rating','0'),
(19,15,'_wc_review_count','0'),
(20,15,'_product_version','10.8.1'),
(21,15,'_product_attributes','a:1:{s:6:\"taille\";a:6:{s:4:\"name\";s:6:\"taille\";s:5:\"value\";s:27:\"52 | 54 | 56 | 58 | 60 | 62\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:0;}}'),
(144,15,'_featured','yes'),
(145,15,'_bagueship_model_file','abstract-openwork-cuff.glb'),
(146,15,'_bagueship_matiere','Acier inoxydable'),
(147,15,'_bagueship_finition','Argent sculptural'),
(148,15,'_bagueship_largeur','Anneau ouvert'),
(149,15,'_bagueship_poids_bijou','Selon taille'),
(150,15,'_bagueship_fabrication','Modèle 3D Abstract'),
(151,15,'_bagueship_packaging','Livré en écrin Eclipse.'),
(152,22,'_sku','BAG-ABSTRACT-WAVY'),
(153,22,'total_sales','0'),
(154,22,'_tax_status','taxable'),
(155,22,'_tax_class',''),
(156,22,'_manage_stock','no'),
(157,22,'_backorders','no'),
(158,22,'_sold_individually','no'),
(159,22,'_virtual','no'),
(160,22,'_downloadable','no'),
(161,22,'_download_limit','-1'),
(162,22,'_download_expiry','-1'),
(163,22,'_stock',NULL),
(164,22,'_stock_status','instock'),
(165,22,'_wc_average_rating','0'),
(166,22,'_wc_review_count','0'),
(167,22,'_product_version','10.8.1'),
(168,22,'_product_attributes','a:1:{s:6:\"taille\";a:6:{s:4:\"name\";s:6:\"taille\";s:5:\"value\";s:27:\"52 | 54 | 56 | 58 | 60 | 62\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:0;}}'),
(291,22,'_featured','yes'),
(292,22,'_bagueship_model_file','wavy-silver-cuff.glb'),
(293,22,'_bagueship_matiere','Acier inoxydable'),
(294,22,'_bagueship_finition','Argent poli'),
(295,22,'_bagueship_largeur','Cuff ondulé'),
(296,22,'_bagueship_poids_bijou','Selon taille'),
(297,22,'_bagueship_fabrication','Modèle 3D Abstract'),
(298,22,'_bagueship_packaging','Livré en écrin Eclipse.'),
(299,29,'_sku','BAG-FINGER-CHROME'),
(300,29,'total_sales','0'),
(301,29,'_tax_status','taxable'),
(302,29,'_tax_class',''),
(303,29,'_manage_stock','no'),
(304,29,'_backorders','no'),
(305,29,'_sold_individually','no'),
(306,29,'_virtual','no'),
(307,29,'_downloadable','no'),
(308,29,'_download_limit','-1'),
(309,29,'_download_expiry','-1'),
(310,29,'_stock',NULL),
(311,29,'_stock_status','instock'),
(312,29,'_wc_average_rating','0'),
(313,29,'_wc_review_count','0'),
(314,29,'_product_version','10.8.1'),
(315,29,'_product_attributes','a:1:{s:6:\"taille\";a:6:{s:4:\"name\";s:6:\"taille\";s:5:\"value\";s:27:\"52 | 54 | 56 | 58 | 60 | 62\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:0;}}'),
(438,29,'_featured','yes'),
(439,29,'_bagueship_model_file','chrome-embrace.glb'),
(440,29,'_bagueship_matiere','Acier inoxydable'),
(441,29,'_bagueship_finition','Chrome miroir'),
(442,29,'_bagueship_largeur','Profil enveloppant'),
(443,29,'_bagueship_poids_bijou','Selon taille'),
(444,29,'_bagueship_fabrication','Modèle 3D Finger'),
(445,29,'_bagueship_packaging','Livré en écrin Eclipse.'),
(446,36,'_sku','BAG-FINGER-CURVED'),
(447,36,'total_sales','0'),
(448,36,'_tax_status','taxable'),
(449,36,'_tax_class',''),
(450,36,'_manage_stock','no'),
(451,36,'_backorders','no'),
(452,36,'_sold_individually','no'),
(453,36,'_virtual','no'),
(454,36,'_downloadable','no'),
(455,36,'_download_limit','-1'),
(456,36,'_download_expiry','-1'),
(457,36,'_stock',NULL),
(458,36,'_stock_status','instock'),
(459,36,'_wc_average_rating','0'),
(460,36,'_wc_review_count','0'),
(461,36,'_product_version','10.8.1'),
(462,36,'_product_attributes','a:1:{s:6:\"taille\";a:6:{s:4:\"name\";s:6:\"taille\";s:5:\"value\";s:27:\"52 | 54 | 56 | 58 | 60 | 62\";s:8:\"position\";i:0;s:10:\"is_visible\";i:1;s:12:\"is_variation\";i:1;s:11:\"is_taxonomy\";i:0;}}'),
(585,36,'_featured','yes'),
(586,36,'_bagueship_model_file','curved-bar-silver-ring.glb'),
(587,36,'_bagueship_matiere','Acier inoxydable'),
(588,36,'_bagueship_finition','Argent satiné'),
(589,36,'_bagueship_largeur','Barre courbée'),
(590,36,'_bagueship_poids_bijou','Selon taille'),
(591,36,'_bagueship_fabrication','Modèle 3D Finger'),
(592,36,'_bagueship_packaging','Livré en écrin Eclipse.'),
(1957,187,'_variation_description',''),
(1958,187,'_sku','BAG-ABSTRACT-OPENWORK-52'),
(1959,187,'_regular_price','380'),
(1960,187,'total_sales','0'),
(1961,187,'_tax_status','taxable'),
(1962,187,'_tax_class','parent'),
(1963,187,'_manage_stock','yes'),
(1964,187,'_backorders','no'),
(1965,187,'_sold_individually','no'),
(1966,187,'_virtual','no'),
(1967,187,'_downloadable','no'),
(1968,187,'_download_limit','-1'),
(1969,187,'_download_expiry','-1'),
(1970,187,'_stock','8'),
(1971,187,'_stock_status','instock'),
(1972,187,'_wc_average_rating','0'),
(1973,187,'_wc_review_count','0'),
(1974,187,'attribute_taille','52'),
(1975,187,'_price','380'),
(1976,187,'_product_version','10.8.1'),
(1977,188,'_variation_description',''),
(1978,188,'_sku','BAG-ABSTRACT-OPENWORK-54'),
(1979,188,'_regular_price','380'),
(1980,188,'total_sales','0'),
(1981,188,'_tax_status','taxable'),
(1982,188,'_tax_class','parent'),
(1983,188,'_manage_stock','yes'),
(1984,188,'_backorders','no'),
(1985,188,'_sold_individually','no'),
(1986,188,'_virtual','no'),
(1987,188,'_downloadable','no'),
(1988,188,'_download_limit','-1'),
(1989,188,'_download_expiry','-1'),
(1990,188,'_stock','8'),
(1991,188,'_stock_status','instock'),
(1992,188,'_wc_average_rating','0'),
(1993,188,'_wc_review_count','0'),
(1994,188,'attribute_taille','54'),
(1995,188,'_price','380'),
(1996,188,'_product_version','10.8.1'),
(1997,189,'_variation_description',''),
(1998,189,'_sku','BAG-ABSTRACT-OPENWORK-56'),
(1999,189,'_regular_price','380'),
(2000,189,'total_sales','0'),
(2001,189,'_tax_status','taxable'),
(2002,189,'_tax_class','parent'),
(2003,189,'_manage_stock','yes'),
(2004,189,'_backorders','no'),
(2005,189,'_sold_individually','no'),
(2006,189,'_virtual','no'),
(2007,189,'_downloadable','no'),
(2008,189,'_download_limit','-1'),
(2009,189,'_download_expiry','-1'),
(2010,189,'_stock','8'),
(2011,189,'_stock_status','instock'),
(2012,189,'_wc_average_rating','0'),
(2013,189,'_wc_review_count','0'),
(2014,189,'attribute_taille','56'),
(2015,189,'_price','380'),
(2016,189,'_product_version','10.8.1'),
(2017,190,'_variation_description',''),
(2018,190,'_sku','BAG-ABSTRACT-OPENWORK-58'),
(2019,190,'_regular_price','380'),
(2020,190,'total_sales','0'),
(2021,190,'_tax_status','taxable'),
(2022,190,'_tax_class','parent'),
(2023,190,'_manage_stock','yes'),
(2024,190,'_backorders','no'),
(2025,190,'_sold_individually','no'),
(2026,190,'_virtual','no'),
(2027,190,'_downloadable','no'),
(2028,190,'_download_limit','-1'),
(2029,190,'_download_expiry','-1'),
(2030,190,'_stock','8'),
(2031,190,'_stock_status','instock'),
(2032,190,'_wc_average_rating','0'),
(2033,190,'_wc_review_count','0'),
(2034,190,'attribute_taille','58'),
(2035,190,'_price','380'),
(2036,190,'_product_version','10.8.1'),
(2037,191,'_variation_description',''),
(2038,191,'_sku','BAG-ABSTRACT-OPENWORK-60'),
(2039,191,'_regular_price','380'),
(2040,191,'total_sales','0'),
(2041,191,'_tax_status','taxable'),
(2042,191,'_tax_class','parent'),
(2043,191,'_manage_stock','yes'),
(2044,191,'_backorders','no'),
(2045,191,'_sold_individually','no'),
(2046,191,'_virtual','no'),
(2047,191,'_downloadable','no'),
(2048,191,'_download_limit','-1'),
(2049,191,'_download_expiry','-1'),
(2050,191,'_stock','8'),
(2051,191,'_stock_status','instock'),
(2052,191,'_wc_average_rating','0'),
(2053,191,'_wc_review_count','0'),
(2054,191,'attribute_taille','60'),
(2055,191,'_price','380'),
(2056,191,'_product_version','10.8.1'),
(2057,192,'_variation_description',''),
(2058,192,'_sku','BAG-ABSTRACT-OPENWORK-62'),
(2059,192,'_regular_price','380'),
(2060,192,'total_sales','0'),
(2061,192,'_tax_status','taxable'),
(2062,192,'_tax_class','parent'),
(2063,192,'_manage_stock','yes'),
(2064,192,'_backorders','no'),
(2065,192,'_sold_individually','no'),
(2066,192,'_virtual','no'),
(2067,192,'_downloadable','no'),
(2068,192,'_download_limit','-1'),
(2069,192,'_download_expiry','-1'),
(2070,192,'_stock','8'),
(2071,192,'_stock_status','instock'),
(2072,192,'_wc_average_rating','0'),
(2073,192,'_wc_review_count','0'),
(2074,192,'attribute_taille','62'),
(2075,192,'_price','380'),
(2076,192,'_product_version','10.8.1'),
(2079,193,'_variation_description',''),
(2080,193,'_sku','BAG-ABSTRACT-WAVY-52'),
(2081,193,'_regular_price','420'),
(2082,193,'total_sales','0'),
(2083,193,'_tax_status','taxable'),
(2084,193,'_tax_class','parent'),
(2085,193,'_manage_stock','yes'),
(2086,193,'_backorders','no'),
(2087,193,'_sold_individually','no'),
(2088,193,'_virtual','no'),
(2089,193,'_downloadable','no'),
(2090,193,'_download_limit','-1'),
(2091,193,'_download_expiry','-1'),
(2092,193,'_stock','8'),
(2093,193,'_stock_status','instock'),
(2094,193,'_wc_average_rating','0'),
(2095,193,'_wc_review_count','0'),
(2096,193,'attribute_taille','52'),
(2097,193,'_price','420'),
(2098,193,'_product_version','10.8.1'),
(2099,194,'_variation_description',''),
(2100,194,'_sku','BAG-ABSTRACT-WAVY-54'),
(2101,194,'_regular_price','420'),
(2102,194,'total_sales','0'),
(2103,194,'_tax_status','taxable'),
(2104,194,'_tax_class','parent'),
(2105,194,'_manage_stock','yes'),
(2106,194,'_backorders','no'),
(2107,194,'_sold_individually','no'),
(2108,194,'_virtual','no'),
(2109,194,'_downloadable','no'),
(2110,194,'_download_limit','-1'),
(2111,194,'_download_expiry','-1'),
(2112,194,'_stock','8'),
(2113,194,'_stock_status','instock'),
(2114,194,'_wc_average_rating','0'),
(2115,194,'_wc_review_count','0'),
(2116,194,'attribute_taille','54'),
(2117,194,'_price','420'),
(2118,194,'_product_version','10.8.1'),
(2119,195,'_variation_description',''),
(2120,195,'_sku','BAG-ABSTRACT-WAVY-56'),
(2121,195,'_regular_price','420'),
(2122,195,'total_sales','0'),
(2123,195,'_tax_status','taxable'),
(2124,195,'_tax_class','parent'),
(2125,195,'_manage_stock','yes'),
(2126,195,'_backorders','no'),
(2127,195,'_sold_individually','no'),
(2128,195,'_virtual','no'),
(2129,195,'_downloadable','no'),
(2130,195,'_download_limit','-1'),
(2131,195,'_download_expiry','-1'),
(2132,195,'_stock','8'),
(2133,195,'_stock_status','instock'),
(2134,195,'_wc_average_rating','0'),
(2135,195,'_wc_review_count','0'),
(2136,195,'attribute_taille','56'),
(2137,195,'_price','420'),
(2138,195,'_product_version','10.8.1'),
(2139,196,'_variation_description',''),
(2140,196,'_sku','BAG-ABSTRACT-WAVY-58'),
(2141,196,'_regular_price','420'),
(2142,196,'total_sales','0'),
(2143,196,'_tax_status','taxable'),
(2144,196,'_tax_class','parent'),
(2145,196,'_manage_stock','yes'),
(2146,196,'_backorders','no'),
(2147,196,'_sold_individually','no'),
(2148,196,'_virtual','no'),
(2149,196,'_downloadable','no'),
(2150,196,'_download_limit','-1'),
(2151,196,'_download_expiry','-1'),
(2152,196,'_stock','8'),
(2153,196,'_stock_status','instock'),
(2154,196,'_wc_average_rating','0'),
(2155,196,'_wc_review_count','0'),
(2156,196,'attribute_taille','58'),
(2157,196,'_price','420'),
(2158,196,'_product_version','10.8.1'),
(2159,197,'_variation_description',''),
(2160,197,'_sku','BAG-ABSTRACT-WAVY-60'),
(2161,197,'_regular_price','420'),
(2162,197,'total_sales','0'),
(2163,197,'_tax_status','taxable'),
(2164,197,'_tax_class','parent'),
(2165,197,'_manage_stock','yes'),
(2166,197,'_backorders','no'),
(2167,197,'_sold_individually','no'),
(2168,197,'_virtual','no'),
(2169,197,'_downloadable','no'),
(2170,197,'_download_limit','-1'),
(2171,197,'_download_expiry','-1'),
(2172,197,'_stock','8'),
(2173,197,'_stock_status','instock'),
(2174,197,'_wc_average_rating','0'),
(2175,197,'_wc_review_count','0'),
(2176,197,'attribute_taille','60'),
(2177,197,'_price','420'),
(2178,197,'_product_version','10.8.1'),
(2179,198,'_variation_description',''),
(2180,198,'_sku','BAG-ABSTRACT-WAVY-62'),
(2181,198,'_regular_price','420'),
(2182,198,'total_sales','0'),
(2183,198,'_tax_status','taxable'),
(2184,198,'_tax_class','parent'),
(2185,198,'_manage_stock','yes'),
(2186,198,'_backorders','no'),
(2187,198,'_sold_individually','no'),
(2188,198,'_virtual','no'),
(2189,198,'_downloadable','no'),
(2190,198,'_download_limit','-1'),
(2191,198,'_download_expiry','-1'),
(2192,198,'_stock','8'),
(2193,198,'_stock_status','instock'),
(2194,198,'_wc_average_rating','0'),
(2195,198,'_wc_review_count','0'),
(2196,198,'attribute_taille','62'),
(2197,198,'_price','420'),
(2198,198,'_product_version','10.8.1'),
(2201,199,'_variation_description',''),
(2202,199,'_sku','BAG-FINGER-CHROME-52'),
(2203,199,'_regular_price','360'),
(2204,199,'total_sales','0'),
(2205,199,'_tax_status','taxable'),
(2206,199,'_tax_class','parent'),
(2207,199,'_manage_stock','yes'),
(2208,199,'_backorders','no'),
(2209,199,'_sold_individually','no'),
(2210,199,'_virtual','no'),
(2211,199,'_downloadable','no'),
(2212,199,'_download_limit','-1'),
(2213,199,'_download_expiry','-1'),
(2214,199,'_stock','8'),
(2215,199,'_stock_status','instock'),
(2216,199,'_wc_average_rating','0'),
(2217,199,'_wc_review_count','0'),
(2218,199,'attribute_taille','52'),
(2219,199,'_price','360'),
(2220,199,'_product_version','10.8.1'),
(2221,200,'_variation_description',''),
(2222,200,'_sku','BAG-FINGER-CHROME-54'),
(2223,200,'_regular_price','360'),
(2224,200,'total_sales','0'),
(2225,200,'_tax_status','taxable'),
(2226,200,'_tax_class','parent'),
(2227,200,'_manage_stock','yes'),
(2228,200,'_backorders','no'),
(2229,200,'_sold_individually','no'),
(2230,200,'_virtual','no'),
(2231,200,'_downloadable','no'),
(2232,200,'_download_limit','-1'),
(2233,200,'_download_expiry','-1'),
(2234,200,'_stock','8'),
(2235,200,'_stock_status','instock'),
(2236,200,'_wc_average_rating','0'),
(2237,200,'_wc_review_count','0'),
(2238,200,'attribute_taille','54'),
(2239,200,'_price','360'),
(2240,200,'_product_version','10.8.1'),
(2241,201,'_variation_description',''),
(2242,201,'_sku','BAG-FINGER-CHROME-56'),
(2243,201,'_regular_price','360'),
(2244,201,'total_sales','0'),
(2245,201,'_tax_status','taxable'),
(2246,201,'_tax_class','parent'),
(2247,201,'_manage_stock','yes'),
(2248,201,'_backorders','no'),
(2249,201,'_sold_individually','no'),
(2250,201,'_virtual','no'),
(2251,201,'_downloadable','no'),
(2252,201,'_download_limit','-1'),
(2253,201,'_download_expiry','-1'),
(2254,201,'_stock','8'),
(2255,201,'_stock_status','instock'),
(2256,201,'_wc_average_rating','0'),
(2257,201,'_wc_review_count','0'),
(2258,201,'attribute_taille','56'),
(2259,201,'_price','360'),
(2260,201,'_product_version','10.8.1'),
(2261,202,'_variation_description',''),
(2262,202,'_sku','BAG-FINGER-CHROME-58'),
(2263,202,'_regular_price','360'),
(2264,202,'total_sales','0'),
(2265,202,'_tax_status','taxable'),
(2266,202,'_tax_class','parent'),
(2267,202,'_manage_stock','yes'),
(2268,202,'_backorders','no'),
(2269,202,'_sold_individually','no'),
(2270,202,'_virtual','no'),
(2271,202,'_downloadable','no'),
(2272,202,'_download_limit','-1'),
(2273,202,'_download_expiry','-1'),
(2274,202,'_stock','8'),
(2275,202,'_stock_status','instock'),
(2276,202,'_wc_average_rating','0'),
(2277,202,'_wc_review_count','0'),
(2278,202,'attribute_taille','58'),
(2279,202,'_price','360'),
(2280,202,'_product_version','10.8.1'),
(2281,203,'_variation_description',''),
(2282,203,'_sku','BAG-FINGER-CHROME-60'),
(2283,203,'_regular_price','360'),
(2284,203,'total_sales','0'),
(2285,203,'_tax_status','taxable'),
(2286,203,'_tax_class','parent'),
(2287,203,'_manage_stock','yes'),
(2288,203,'_backorders','no'),
(2289,203,'_sold_individually','no'),
(2290,203,'_virtual','no'),
(2291,203,'_downloadable','no'),
(2292,203,'_download_limit','-1'),
(2293,203,'_download_expiry','-1'),
(2294,203,'_stock','8'),
(2295,203,'_stock_status','instock'),
(2296,203,'_wc_average_rating','0'),
(2297,203,'_wc_review_count','0'),
(2298,203,'attribute_taille','60'),
(2299,203,'_price','360'),
(2300,203,'_product_version','10.8.1'),
(2301,204,'_variation_description',''),
(2302,204,'_sku','BAG-FINGER-CHROME-62'),
(2303,204,'_regular_price','360'),
(2304,204,'total_sales','0'),
(2305,204,'_tax_status','taxable'),
(2306,204,'_tax_class','parent'),
(2307,204,'_manage_stock','yes'),
(2308,204,'_backorders','no'),
(2309,204,'_sold_individually','no'),
(2310,204,'_virtual','no'),
(2311,204,'_downloadable','no'),
(2312,204,'_download_limit','-1'),
(2313,204,'_download_expiry','-1'),
(2314,204,'_stock','8'),
(2315,204,'_stock_status','instock'),
(2316,204,'_wc_average_rating','0'),
(2317,204,'_wc_review_count','0'),
(2318,204,'attribute_taille','62'),
(2319,204,'_price','360'),
(2320,204,'_product_version','10.8.1'),
(2323,205,'_variation_description',''),
(2324,205,'_sku','BAG-FINGER-CURVED-52'),
(2325,205,'_regular_price','340'),
(2326,205,'total_sales','0'),
(2327,205,'_tax_status','taxable'),
(2328,205,'_tax_class','parent'),
(2329,205,'_manage_stock','yes'),
(2330,205,'_backorders','no'),
(2331,205,'_sold_individually','no'),
(2332,205,'_virtual','no'),
(2333,205,'_downloadable','no'),
(2334,205,'_download_limit','-1'),
(2335,205,'_download_expiry','-1'),
(2336,205,'_stock','8'),
(2337,205,'_stock_status','instock'),
(2338,205,'_wc_average_rating','0'),
(2339,205,'_wc_review_count','0'),
(2340,205,'attribute_taille','52'),
(2341,205,'_price','340'),
(2342,205,'_product_version','10.8.1'),
(2343,206,'_variation_description',''),
(2344,206,'_sku','BAG-FINGER-CURVED-54'),
(2345,206,'_regular_price','340'),
(2346,206,'total_sales','0'),
(2347,206,'_tax_status','taxable'),
(2348,206,'_tax_class','parent'),
(2349,206,'_manage_stock','yes'),
(2350,206,'_backorders','no'),
(2351,206,'_sold_individually','no'),
(2352,206,'_virtual','no'),
(2353,206,'_downloadable','no'),
(2354,206,'_download_limit','-1'),
(2355,206,'_download_expiry','-1'),
(2356,206,'_stock','8'),
(2357,206,'_stock_status','instock'),
(2358,206,'_wc_average_rating','0'),
(2359,206,'_wc_review_count','0'),
(2360,206,'attribute_taille','54'),
(2361,206,'_price','340'),
(2362,206,'_product_version','10.8.1'),
(2363,207,'_variation_description',''),
(2364,207,'_sku','BAG-FINGER-CURVED-56'),
(2365,207,'_regular_price','340'),
(2366,207,'total_sales','0'),
(2367,207,'_tax_status','taxable'),
(2368,207,'_tax_class','parent'),
(2369,207,'_manage_stock','yes'),
(2370,207,'_backorders','no'),
(2371,207,'_sold_individually','no'),
(2372,207,'_virtual','no'),
(2373,207,'_downloadable','no'),
(2374,207,'_download_limit','-1'),
(2375,207,'_download_expiry','-1'),
(2376,207,'_stock','8'),
(2377,207,'_stock_status','instock'),
(2378,207,'_wc_average_rating','0'),
(2379,207,'_wc_review_count','0'),
(2380,207,'attribute_taille','56'),
(2381,207,'_price','340'),
(2382,207,'_product_version','10.8.1'),
(2383,208,'_variation_description',''),
(2384,208,'_sku','BAG-FINGER-CURVED-58'),
(2385,208,'_regular_price','340'),
(2386,208,'total_sales','0'),
(2387,208,'_tax_status','taxable'),
(2388,208,'_tax_class','parent'),
(2389,208,'_manage_stock','yes'),
(2390,208,'_backorders','no'),
(2391,208,'_sold_individually','no'),
(2392,208,'_virtual','no'),
(2393,208,'_downloadable','no'),
(2394,208,'_download_limit','-1'),
(2395,208,'_download_expiry','-1'),
(2396,208,'_stock','8'),
(2397,208,'_stock_status','instock'),
(2398,208,'_wc_average_rating','0'),
(2399,208,'_wc_review_count','0'),
(2400,208,'attribute_taille','58'),
(2401,208,'_price','340'),
(2402,208,'_product_version','10.8.1'),
(2403,209,'_variation_description',''),
(2404,209,'_sku','BAG-FINGER-CURVED-60'),
(2405,209,'_regular_price','340'),
(2406,209,'total_sales','0'),
(2407,209,'_tax_status','taxable'),
(2408,209,'_tax_class','parent'),
(2409,209,'_manage_stock','yes'),
(2410,209,'_backorders','no'),
(2411,209,'_sold_individually','no'),
(2412,209,'_virtual','no'),
(2413,209,'_downloadable','no'),
(2414,209,'_download_limit','-1'),
(2415,209,'_download_expiry','-1'),
(2416,209,'_stock','8'),
(2417,209,'_stock_status','instock'),
(2418,209,'_wc_average_rating','0'),
(2419,209,'_wc_review_count','0'),
(2420,209,'attribute_taille','60'),
(2421,209,'_price','340'),
(2422,209,'_product_version','10.8.1'),
(2423,210,'_variation_description',''),
(2424,210,'_sku','BAG-FINGER-CURVED-62'),
(2425,210,'_regular_price','340'),
(2426,210,'total_sales','0'),
(2427,210,'_tax_status','taxable'),
(2428,210,'_tax_class','parent'),
(2429,210,'_manage_stock','yes'),
(2430,210,'_backorders','no'),
(2431,210,'_sold_individually','no'),
(2432,210,'_virtual','no'),
(2433,210,'_downloadable','no'),
(2434,210,'_download_limit','-1'),
(2435,210,'_download_expiry','-1'),
(2436,210,'_stock','8'),
(2437,210,'_stock_status','instock'),
(2438,210,'_wc_average_rating','0'),
(2439,210,'_wc_review_count','0'),
(2440,210,'attribute_taille','62'),
(2441,210,'_price','340'),
(2442,210,'_product_version','10.8.1'),
(2445,211,'_menu_item_type','post_type'),
(2446,211,'_menu_item_menu_item_parent','0'),
(2447,211,'_menu_item_object_id','10'),
(2448,211,'_menu_item_object','page'),
(2449,211,'_menu_item_target',''),
(2450,211,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(2451,211,'_menu_item_xfn',''),
(2452,211,'_menu_item_url',''),
(2453,212,'_menu_item_type','post_type'),
(2454,212,'_menu_item_menu_item_parent','0'),
(2455,212,'_menu_item_object_id','11'),
(2456,212,'_menu_item_object','page'),
(2457,212,'_menu_item_target',''),
(2458,212,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(2459,212,'_menu_item_xfn',''),
(2460,212,'_menu_item_url',''),
(2461,213,'_menu_item_type','post_type'),
(2462,213,'_menu_item_menu_item_parent','0'),
(2463,213,'_menu_item_object_id','51'),
(2464,213,'_menu_item_object','page'),
(2465,213,'_menu_item_target',''),
(2466,213,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(2467,213,'_menu_item_xfn',''),
(2468,213,'_menu_item_url',''),
(2469,214,'_menu_item_type','post_type'),
(2470,214,'_menu_item_menu_item_parent','0'),
(2471,214,'_menu_item_object_id','53'),
(2472,214,'_menu_item_object','page'),
(2473,214,'_menu_item_target',''),
(2474,214,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(2475,214,'_menu_item_xfn',''),
(2476,214,'_menu_item_url',''),
(2477,215,'_menu_item_type','post_type'),
(2478,215,'_menu_item_menu_item_parent','0'),
(2479,215,'_menu_item_object_id','56'),
(2480,215,'_menu_item_object','page'),
(2481,215,'_menu_item_target',''),
(2482,215,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(2483,215,'_menu_item_xfn',''),
(2484,215,'_menu_item_url',''),
(2485,216,'_menu_item_type','post_type'),
(2486,216,'_menu_item_menu_item_parent','0'),
(2487,216,'_menu_item_object_id','56'),
(2488,216,'_menu_item_object','page'),
(2489,216,'_menu_item_target',''),
(2490,216,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(2491,216,'_menu_item_xfn',''),
(2492,216,'_menu_item_url',''),
(2493,217,'_menu_item_type','post_type'),
(2494,217,'_menu_item_menu_item_parent','0'),
(2495,217,'_menu_item_object_id','57'),
(2496,217,'_menu_item_object','page'),
(2497,217,'_menu_item_target',''),
(2498,217,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(2499,217,'_menu_item_xfn',''),
(2500,217,'_menu_item_url',''),
(2501,218,'_menu_item_type','post_type'),
(2502,218,'_menu_item_menu_item_parent','0'),
(2503,218,'_menu_item_object_id','54'),
(2504,218,'_menu_item_object','page'),
(2505,218,'_menu_item_target',''),
(2506,218,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(2507,218,'_menu_item_xfn',''),
(2508,218,'_menu_item_url',''),
(2509,219,'_menu_item_type','post_type'),
(2510,219,'_menu_item_menu_item_parent','0'),
(2511,219,'_menu_item_object_id','59'),
(2512,219,'_menu_item_object','page'),
(2513,219,'_menu_item_target',''),
(2514,219,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(2515,219,'_menu_item_xfn',''),
(2516,219,'_menu_item_url',''),
(2517,220,'_menu_item_type','post_type'),
(2518,220,'_menu_item_menu_item_parent','0'),
(2519,220,'_menu_item_object_id','60'),
(2520,220,'_menu_item_object','page'),
(2521,220,'_menu_item_target',''),
(2522,220,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(2523,220,'_menu_item_xfn',''),
(2524,220,'_menu_item_url',''),
(2525,221,'_menu_item_type','post_type'),
(2526,221,'_menu_item_menu_item_parent','0'),
(2527,221,'_menu_item_object_id','44'),
(2528,221,'_menu_item_object','page'),
(2529,221,'_menu_item_target',''),
(2530,221,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(2531,221,'_menu_item_xfn',''),
(2532,221,'_menu_item_url',''),
(2533,222,'_menu_item_type','post_type'),
(2534,222,'_menu_item_menu_item_parent','0'),
(2535,222,'_menu_item_object_id','43'),
(2536,222,'_menu_item_object','page'),
(2537,222,'_menu_item_target',''),
(2538,222,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(2539,222,'_menu_item_xfn',''),
(2540,222,'_menu_item_url',''),
(2541,223,'_menu_item_type','post_type'),
(2542,223,'_menu_item_menu_item_parent','0'),
(2543,223,'_menu_item_object_id','62'),
(2544,223,'_menu_item_object','page'),
(2545,223,'_menu_item_target',''),
(2546,223,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(2547,223,'_menu_item_xfn',''),
(2548,223,'_menu_item_url',''),
(2549,15,'_price','380'),
(2550,22,'_price','420'),
(2551,29,'_price','360'),
(2552,36,'_price','340');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `type_status_author` (`post_type`,`post_status`,`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES
(1,1,'2026-07-20 16:28:14','2026-07-20 16:28:14','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2026-07-20 16:28:14','2026-07-20 16:28:14','',0,'http://localhost:8080/?p=1',0,'post','',1),
(2,1,'2026-07-20 16:28:14','2026-07-20 16:28:14','<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\">\n<!-- wp:paragraph -->\n<p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p>\n<!-- /wp:paragraph -->\n</blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\">\n<!-- wp:paragraph -->\n<p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p>\n<!-- /wp:paragraph -->\n</blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost:8080/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->','Sample Page','','publish','closed','open','','sample-page','','','2026-07-20 16:28:14','2026-07-20 16:28:14','',0,'http://localhost:8080/?page_id=2',0,'page','',0),
(3,1,'2026-07-20 16:28:14','2026-07-20 16:28:14','<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we are</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://localhost:8080.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Comments</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Media</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Cookies</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Embedded content from other websites</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we share your data with</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">How long we retain your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">What rights you have over your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Where your data is sent</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p>\n<!-- /wp:paragraph -->\n','Privacy Policy','','draft','closed','open','','privacy-policy','','','2026-07-20 16:28:14','2026-07-20 16:28:14','',0,'http://localhost:8080/?page_id=3',0,'page','',0),
(4,0,'2026-07-20 16:28:15','2026-07-20 16:28:15','','woocommerce-placeholder','','inherit','open','closed','','woocommerce-placeholder','','','2026-07-20 16:28:15','2026-07-20 16:28:15','',0,'http://localhost:8080/wp-content/uploads/2026/07/woocommerce-placeholder.webp',0,'attachment','image/webp',0),
(5,1,'2026-07-20 16:28:15','2026-07-20 16:28:15','','Shop','','publish','closed','closed','','shop','','','2026-07-20 16:28:15','2026-07-20 16:28:15','',0,'http://localhost:8080/?page_id=5',0,'page','',0),
(6,1,'2026-07-20 16:28:15','2026-07-20 16:28:15','<!-- wp:woocommerce/cart -->\n<div class=\"wp-block-woocommerce-cart alignwide is-loading\"><!-- wp:woocommerce/filled-cart-block -->\n<div class=\"wp-block-woocommerce-filled-cart-block\"><!-- wp:woocommerce/cart-items-block -->\n<div class=\"wp-block-woocommerce-cart-items-block\"><!-- wp:woocommerce/cart-line-items-block -->\n<div class=\"wp-block-woocommerce-cart-line-items-block\"></div>\n<!-- /wp:woocommerce/cart-line-items-block -->\n\n<!-- wp:woocommerce/product-collection {\"queryId\":0,\"query\":{\"perPage\":3,\"pages\":1,\"offset\":0,\"postType\":\"product\",\"order\":\"asc\",\"orderBy\":\"title\",\"search\":\"\",\"exclude\":[],\"inherit\":false,\"taxQuery\":{},\"isProductCollectionBlock\":true,\"featured\":false,\"woocommerceOnSale\":false,\"woocommerceStockStatus\":[\"instock\",\"outofstock\",\"onbackorder\"],\"woocommerceAttributes\":[],\"woocommerceHandPickedProducts\":[],\"filterable\":false,\"relatedBy\":{\"categories\":true,\"tags\":true}},\"tagName\":\"div\",\"displayLayout\":{\"type\":\"flex\",\"columns\":3,\"shrinkColumns\":true},\"dimensions\":{\"widthType\":\"fill\"},\"collection\":\"woocommerce/product-collection/cross-sells\",\"hideControls\":[\"filterable\"],\"queryContextIncludes\":[\"collection\"],\"__privatePreviewState\":{\"isPreview\":true,\"previewMessage\":\"Actual products will vary depending on the page being viewed.\"}} -->\n<div class=\"wp-block-woocommerce-product-collection\"><!-- wp:heading {\"textAlign\":\"left\",\"style\":{\"spacing\":{\"margin\":{\"bottom\":\"1rem\"}}}} -->\n<h2 class=\"wp-block-heading has-text-align-left\" style=\"margin-bottom:1rem\">You may be interested in&hellip;</h2>\n\n<!-- /wp:heading -->\n\n<!-- wp:woocommerce/product-template -->\n<!-- wp:woocommerce/product-image {\"showSaleBadge\":false,\"imageSizing\":\"thumbnail\",\"isDescendentOfQueryLoop\":true} -->\n<!-- wp:woocommerce/product-sale-badge {\"align\":\"right\"} /-->\n<!-- /wp:woocommerce/product-image -->\n\n<!-- wp:post-title {\"textAlign\":\"center\",\"isLink\":true,\"style\":{\"spacing\":{\"margin\":{\"bottom\":\"0.75rem\",\"top\":\"0\"}},\"typography\":{\"lineHeight\":\"1.4\"}},\"fontSize\":\"medium\",\"__woocommerceNamespace\":\"woocommerce/product-collection/product-title\"} /-->\n\n<!-- wp:woocommerce/product-price {\"isDescendentOfQueryLoop\":true,\"textAlign\":\"center\",\"fontSize\":\"small\"} /-->\n\n<!-- wp:woocommerce/product-button {\"textAlign\":\"center\",\"isDescendentOfQueryLoop\":true,\"fontSize\":\"small\"} /-->\n<!-- /wp:woocommerce/product-template --></div>\n<!-- /wp:woocommerce/product-collection --></div>\n\n<!-- /wp:woocommerce/cart-items-block -->\n\n<!-- wp:woocommerce/cart-totals-block -->\n<div class=\"wp-block-woocommerce-cart-totals-block\"><!-- wp:woocommerce/cart-order-summary-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-block\"><!-- wp:woocommerce/cart-order-summary-heading-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-heading-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-heading-block -->\n\n<!-- wp:woocommerce/cart-order-summary-coupon-form-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-coupon-form-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-coupon-form-block -->\n\n<!-- wp:woocommerce/cart-order-summary-subtotal-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-subtotal-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-subtotal-block -->\n\n<!-- wp:woocommerce/cart-order-summary-fee-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-fee-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-fee-block -->\n\n<!-- wp:woocommerce/cart-order-summary-discount-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-discount-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-discount-block -->\n\n<!-- wp:woocommerce/cart-order-summary-shipping-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-shipping-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-shipping-block -->\n\n<!-- wp:woocommerce/cart-order-summary-taxes-block -->\n<div class=\"wp-block-woocommerce-cart-order-summary-taxes-block\"></div>\n<!-- /wp:woocommerce/cart-order-summary-taxes-block --></div>\n<!-- /wp:woocommerce/cart-order-summary-block -->\n\n<!-- wp:woocommerce/cart-express-payment-block -->\n<div class=\"wp-block-woocommerce-cart-express-payment-block\"></div>\n<!-- /wp:woocommerce/cart-express-payment-block -->\n\n<!-- wp:woocommerce/proceed-to-checkout-block -->\n<div class=\"wp-block-woocommerce-proceed-to-checkout-block\"></div>\n<!-- /wp:woocommerce/proceed-to-checkout-block -->\n\n<!-- wp:woocommerce/cart-accepted-payment-methods-block -->\n<div class=\"wp-block-woocommerce-cart-accepted-payment-methods-block\"></div>\n<!-- /wp:woocommerce/cart-accepted-payment-methods-block --></div>\n<!-- /wp:woocommerce/cart-totals-block --></div>\n<!-- /wp:woocommerce/filled-cart-block -->\n\n<!-- wp:woocommerce/empty-cart-block -->\n<div class=\"wp-block-woocommerce-empty-cart-block\"><!-- wp:heading {\"textAlign\":\"center\",\"className\":\"with-empty-cart-icon wc-block-cart__empty-cart__title\"} -->\n<h2 class=\"wp-block-heading has-text-align-center with-empty-cart-icon wc-block-cart__empty-cart__title\">Your cart is currently empty!</h2>\n<!-- /wp:heading -->\n\n<!-- wp:separator {\"className\":\"is-style-dots\"} -->\n<hr class=\"wp-block-separator has-alpha-channel-opacity is-style-dots\"/>\n<!-- /wp:separator -->\n\n<!-- wp:heading {\"textAlign\":\"center\"} -->\n<h2 class=\"wp-block-heading has-text-align-center\">New in store</h2>\n<!-- /wp:heading -->\n\n<!-- wp:woocommerce/product-new {\"columns\":4,\"rows\":1} /--></div>\n<!-- /wp:woocommerce/empty-cart-block --></div>\n<!-- /wp:woocommerce/cart -->','Cart','','publish','closed','closed','','cart','','','2026-07-20 16:28:15','2026-07-20 16:28:15','',0,'http://localhost:8080/?page_id=6',0,'page','',0),
(7,1,'2026-07-20 16:28:15','2026-07-20 16:28:15','<!-- wp:woocommerce/checkout -->\n<div class=\"wp-block-woocommerce-checkout alignwide wc-block-checkout is-loading\"><!-- wp:woocommerce/checkout-fields-block -->\n<div class=\"wp-block-woocommerce-checkout-fields-block\"><!-- wp:woocommerce/checkout-express-payment-block -->\n<div class=\"wp-block-woocommerce-checkout-express-payment-block\"></div>\n<!-- /wp:woocommerce/checkout-express-payment-block -->\n\n<!-- wp:woocommerce/checkout-contact-information-block -->\n<div class=\"wp-block-woocommerce-checkout-contact-information-block\"></div>\n<!-- /wp:woocommerce/checkout-contact-information-block -->\n\n<!-- wp:woocommerce/checkout-shipping-method-block -->\n<div class=\"wp-block-woocommerce-checkout-shipping-method-block\"></div>\n<!-- /wp:woocommerce/checkout-shipping-method-block -->\n\n<!-- wp:woocommerce/checkout-pickup-options-block -->\n<div class=\"wp-block-woocommerce-checkout-pickup-options-block\"></div>\n<!-- /wp:woocommerce/checkout-pickup-options-block -->\n\n<!-- wp:woocommerce/checkout-shipping-address-block -->\n<div class=\"wp-block-woocommerce-checkout-shipping-address-block\"></div>\n<!-- /wp:woocommerce/checkout-shipping-address-block -->\n\n<!-- wp:woocommerce/checkout-billing-address-block -->\n<div class=\"wp-block-woocommerce-checkout-billing-address-block\"></div>\n<!-- /wp:woocommerce/checkout-billing-address-block -->\n\n<!-- wp:woocommerce/checkout-shipping-methods-block -->\n<div class=\"wp-block-woocommerce-checkout-shipping-methods-block\"></div>\n<!-- /wp:woocommerce/checkout-shipping-methods-block -->\n\n<!-- wp:woocommerce/checkout-payment-block -->\n<div class=\"wp-block-woocommerce-checkout-payment-block\"></div>\n<!-- /wp:woocommerce/checkout-payment-block -->\n\n<!-- wp:woocommerce/checkout-additional-information-block -->\n<div class=\"wp-block-woocommerce-checkout-additional-information-block\"></div>\n<!-- /wp:woocommerce/checkout-additional-information-block -->\n\n<!-- wp:woocommerce/checkout-order-note-block -->\n<div class=\"wp-block-woocommerce-checkout-order-note-block\"></div>\n<!-- /wp:woocommerce/checkout-order-note-block -->\n\n<!-- wp:woocommerce/checkout-terms-block -->\n<div class=\"wp-block-woocommerce-checkout-terms-block\"></div>\n<!-- /wp:woocommerce/checkout-terms-block -->\n\n<!-- wp:woocommerce/checkout-actions-block -->\n<div class=\"wp-block-woocommerce-checkout-actions-block\"></div>\n<!-- /wp:woocommerce/checkout-actions-block --></div>\n<!-- /wp:woocommerce/checkout-fields-block -->\n\n<!-- wp:woocommerce/checkout-totals-block -->\n<div class=\"wp-block-woocommerce-checkout-totals-block\"><!-- wp:woocommerce/checkout-order-summary-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-block\"><!-- wp:woocommerce/checkout-order-summary-cart-items-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-cart-items-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-cart-items-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-coupon-form-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-coupon-form-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-coupon-form-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-subtotal-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-subtotal-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-subtotal-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-fee-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-fee-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-fee-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-discount-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-discount-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-discount-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-shipping-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-shipping-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-shipping-block -->\n\n<!-- wp:woocommerce/checkout-order-summary-taxes-block -->\n<div class=\"wp-block-woocommerce-checkout-order-summary-taxes-block\"></div>\n<!-- /wp:woocommerce/checkout-order-summary-taxes-block --></div>\n<!-- /wp:woocommerce/checkout-order-summary-block --></div>\n<!-- /wp:woocommerce/checkout-totals-block --></div>\n<!-- /wp:woocommerce/checkout -->','Checkout','','publish','closed','closed','','checkout','','','2026-07-20 16:28:15','2026-07-20 16:28:15','',0,'http://localhost:8080/?page_id=7',0,'page','',0),
(8,1,'2026-07-20 16:28:15','2026-07-20 16:28:15','<!-- wp:shortcode -->[woocommerce_my_account]<!-- /wp:shortcode -->','My account','','publish','closed','closed','','my-account','','','2026-07-20 16:28:15','2026-07-20 16:28:15','',0,'http://localhost:8080/?page_id=8',0,'page','',0),
(9,1,'2026-07-20 16:28:15','0000-00-00 00:00:00','<!-- wp:paragraph -->\n<p><b>This is a sample page.</b></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Overview</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Our refund and returns policy lasts 30 days. If 30 days have passed since your purchase, we can’t offer you a full refund or exchange.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>To be eligible for a return, your item must be unused and in the same condition that you received it. It must also be in the original packaging.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Several types of goods are exempt from being returned. Perishable goods such as food, flowers, newspapers or magazines cannot be returned. We also do not accept products that are intimate or sanitary goods, hazardous materials, or flammable liquids or gases.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Additional non-returnable items:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul>\n<li>Gift cards</li>\n<li>Downloadable software products</li>\n<li>Some health and personal care items</li>\n</ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>To complete your return, we require a receipt or proof of purchase.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Please do not send your purchase back to the manufacturer.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>There are certain situations where only partial refunds are granted:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul>\n<li>Book with obvious signs of use</li>\n<li>CD, DVD, VHS tape, software, video game, cassette tape, or vinyl record that has been opened.</li>\n<li>Any item not in its original condition, is damaged or missing parts for reasons not due to our error.</li>\n<li>Any item that is returned more than 30 days after delivery</li>\n</ul>\n<!-- /wp:list -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Refunds</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Once your return is received and inspected, we will send you an email to notify you that we have received your returned item. We will also notify you of the approval or rejection of your refund.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you are approved, then your refund will be processed, and a credit will automatically be applied to your credit card or original method of payment, within a certain amount of days.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Late or missing refunds</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>If you haven’t received a refund yet, first check your bank account again.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Then contact your credit card company, it may take some time before your refund is officially posted.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Next contact your bank. There is often some processing time before a refund is posted.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you’ve done all of this and you still have not received your refund yet, please contact us at {email address}.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Sale items</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Only regular priced items may be refunded. Sale items cannot be refunded.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Exchanges</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We only replace items if they are defective or damaged. If you need to exchange it for the same item, send us an email at {email address} and send your item to: {physical address}.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Gifts</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>If the item was marked as a gift when purchased and shipped directly to you, you’ll receive a gift credit for the value of your return. Once the returned item is received, a gift certificate will be mailed to you.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If the item wasn’t marked as a gift when purchased, or the gift giver had the order shipped to themselves to give to you later, we will send a refund to the gift giver and they will find out about your return.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Shipping returns</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>To return your product, you should mail your product to: {physical address}.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>You will be responsible for paying for your own shipping costs for returning your item. Shipping costs are non-refundable. If you receive a refund, the cost of return shipping will be deducted from your refund.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Depending on where you live, the time it may take for your exchanged product to reach you may vary.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>If you are returning more expensive items, you may consider using a trackable shipping service or purchasing shipping insurance. We don’t guarantee that we will receive your returned item.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Need help?</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Contact us at {email} for questions related to refunds and returns.</p>\n<!-- /wp:paragraph -->','Refund and Returns Policy','','draft','closed','closed','','refund_returns','','','2026-07-20 16:28:15','0000-00-00 00:00:00','',0,'http://localhost:8080/?page_id=9',0,'page','',0),
(10,0,'2026-07-20 16:28:16','2026-07-20 16:28:16','','Accueil','','publish','closed','closed','','accueil','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',0,'http://localhost:8080/?page_id=10',0,'page','',0),
(11,0,'2026-07-20 16:28:16','2026-07-20 16:28:16','','Boutique','','publish','closed','closed','','boutique','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',0,'http://localhost:8080/?page_id=11',0,'page','',0),
(12,0,'2026-07-20 16:28:16','2026-07-20 16:28:16','[woocommerce_cart]','Panier','','publish','closed','closed','','panier','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',0,'http://localhost:8080/?page_id=12',0,'page','',0),
(13,0,'2026-07-20 16:28:16','2026-07-20 16:28:16','[woocommerce_checkout]','Commande','','publish','closed','closed','','commande','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',0,'http://localhost:8080/?page_id=13',0,'page','',0),
(14,0,'2026-07-20 16:28:16','2026-07-20 16:28:16','La commande invitée reste active, et la création de compte est proposée en fin de commande.','Mon compte','','publish','closed','closed','','mon-compte','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',0,'http://localhost:8080/?page_id=14',0,'page','',0),
(15,0,'2026-07-20 16:28:16','2026-07-20 16:28:16','Abstract Openwork Cuff met en avant un volume ajouré et sculptural. Le modèle 3D affiché sur le site correspond au fichier GLB réel de la collection Abstract.','Abstract Openwork Cuff','Bague ajourée en acier argenté, dessinée comme une structure ouverte.','publish','open','closed','','abstract-openwork-cuff','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/?product=abstract-openwork-cuff',0,'product','',0),
(22,0,'2026-07-20 16:28:16','2026-07-20 16:28:16','Wavy Silver Cuff reprend une géométrie souple et lumineuse. Le rendu du site utilise son vrai modèle GLB.','Wavy Silver Cuff','Bague cuff ondulée, acier clair et silhouette fluide.','publish','open','closed','','wavy-silver-cuff','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/?product=wavy-silver-cuff',0,'product','',0),
(29,0,'2026-07-20 16:28:16','2026-07-20 16:28:16','Chrome Embrace est la première pièce de la collection Finger. Son aperçu, sa carte collection et sa page produit utilisent son GLB réel.','Chrome Embrace','Anneau chromé enveloppant, pensé pour suivre le doigt.','publish','open','closed','','chrome-embrace','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/?product=chrome-embrace',0,'product','',0),
(36,0,'2026-07-20 16:28:16','2026-07-20 16:28:16','Curved Bar Silver Ring complète la collection Finger avec une ligne plus directe. Le site charge son modèle GLB réel.','Curved Bar Silver Ring','Bague argentée à barre courbée, minimale et tendue.','publish','open','closed','','curved-bar-silver-ring','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/?product=curved-bar-silver-ring',0,'product','',0),
(43,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Mentions légales</h2><p>Cette page permet d’identifier l’éditeur du site Eclipse et les principaux responsables du service.</p><div class=\"legal-card\"><h2>Identité de l’éditeur</h2><p><strong>Éditeur du site :</strong> <span class=\"legal-missing\">[À compléter : raison sociale ou nom commercial]</span></p><p><strong>Forme juridique :</strong> <span class=\"legal-missing\">[À compléter : forme juridique]</span></p><p><strong>Adresse du siège :</strong> <span class=\"legal-missing\">[À compléter : adresse complète]</span></p><p><strong>SIRET :</strong> <span class=\"legal-missing\">[À compléter : numéro SIRET]</span></p><p><strong>TVA intracommunautaire :</strong> <span class=\"legal-missing\">[À compléter : numéro de TVA ou mention non applicable]</span></p><p><strong>Directeur de publication :</strong> <span class=\"legal-missing\">[À compléter : nom du responsable de publication]</span></p><p><strong>Contact :</strong> <span class=\"legal-missing\">[À compléter : adresse email de contact]</span></p><p><strong>Téléphone :</strong> <span class=\"legal-missing\">[À compléter : numéro de téléphone ou mention non disponible]</span></p></div><div class=\"legal-card\"><h2>Hébergement</h2><p><strong>Hébergeur :</strong> <span class=\"legal-missing\">[À compléter : nom, adresse et contact de l’hébergeur]</span></p></div><div class=\"legal-card\"><h2>Propriété intellectuelle</h2><p>Les textes, visuels, modèles 3D, éléments graphiques, logos, interfaces et contenus du site sont protégés. Toute reproduction, extraction, modification ou réutilisation sans autorisation écrite préalable est interdite, sauf exceptions prévues par la loi.</p></div><div class=\"legal-card\"><h2>Données personnelles</h2><p>Pour toute demande liée aux données personnelles, contactez : <span class=\"legal-missing\">[À compléter : contact données personnelles]</span>.</p></div>','Mentions légales','','publish','closed','closed','','mentions-legales','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',0,'http://localhost:8080/?page_id=43',0,'page','',0),
(44,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Conditions générales d’utilisation et de vente</h2><p>Les présentes conditions encadrent l’accès au site Eclipse, la navigation, les commandes, les précommandes, les paiements, la livraison, les retours et les garanties applicables aux bijoux vendus en ligne.</p><h2>1. Identité du vendeur</h2><div class=\"legal-card\"><h2>Identité de l’éditeur</h2><p><strong>Éditeur du site :</strong> <span class=\"legal-missing\">[À compléter : raison sociale ou nom commercial]</span></p><p><strong>Forme juridique :</strong> <span class=\"legal-missing\">[À compléter : forme juridique]</span></p><p><strong>Adresse du siège :</strong> <span class=\"legal-missing\">[À compléter : adresse complète]</span></p><p><strong>SIRET :</strong> <span class=\"legal-missing\">[À compléter : numéro SIRET]</span></p><p><strong>TVA intracommunautaire :</strong> <span class=\"legal-missing\">[À compléter : numéro de TVA ou mention non applicable]</span></p><p><strong>Directeur de publication :</strong> <span class=\"legal-missing\">[À compléter : nom du responsable de publication]</span></p><p><strong>Contact :</strong> <span class=\"legal-missing\">[À compléter : adresse email de contact]</span></p><p><strong>Téléphone :</strong> <span class=\"legal-missing\">[À compléter : numéro de téléphone ou mention non disponible]</span></p></div><h2>2. Produits</h2><p>Eclipse vend des bijoux, principalement des bagues en acier inoxydable. Les caractéristiques essentielles sont indiquées sur chaque fiche produit : modèle, matériau, finition, taille, prix, disponibilité, statut de précommande éventuel et visuel 3D lorsque disponible.</p><h2>3. Prix</h2><p>Les prix sont affichés en euros. Les éventuels frais de livraison, remises, taxes et frais additionnels sont indiqués avant validation de la commande. Pour les précommandes, le prix peut être inférieur au prix public prévu afin de soutenir la fabrication ou le lancement d’une collection.</p><h2>4. Commande</h2><p>Le client sélectionne un produit, une taille, une quantité, puis valide son panier. Avant paiement, un récapitulatif permet de vérifier la commande et de corriger les erreurs éventuelles. La commande devient ferme après confirmation du paiement ou validation du mode de paiement disponible.</p><h2>5. Paiement</h2><p>Le paiement s’effectue via les moyens proposés au moment de la commande. Le site doit afficher clairement le prestataire de paiement actif avant mise en production. Aucune donnée complète de carte bancaire n’est destinée à être stockée par Eclipse.</p><h2>6. Précommandes</h2><p>Une précommande concerne un produit non immédiatement disponible. La fiche produit indique le statut, le prix de soutien et, lorsqu’elle est connue, une estimation d’expédition. En cas de modification significative du délai, le client est informé par email. Les droits légaux du consommateur restent applicables, sauf exception prévue par la loi.</p><h2>7. Livraison</h2><p>La livraison est prévue en France via Mondial Relay. Le délai indicatif est de 1 à 2 semaines et les frais de livraison sont de 3 €, sauf indication différente affichée avant validation de commande. Pour toute question de suivi : <span class=\"legal-missing\">[À compléter : email livraison]</span>. Une page de suivi permet aussi de retrouver les informations de commande lorsque le transporteur les communique.</p><h2>8. Droit de rétractation</h2><p>Conformément aux règles applicables à la vente à distance, le consommateur dispose en principe d’un délai de 14 jours pour exercer son droit de rétractation à compter de la réception du produit. Eclipse ne prévoit pas d’exclusion commerciale spécifique au droit de retour à ce stade, hors limites impératives prévues par la loi. La demande peut être envoyée à : <span class=\"legal-missing\">[À compléter : email rétractation]</span>.</p><h2>9. Retours et remboursements</h2><p>Les produits doivent être retournés complets, non portés au-delà d’un simple essayage, non dégradés et dans leur emballage lorsque cela est possible. L’adresse de retour est : <span class=\"legal-missing\">[À compléter : adresse de retour]</span>. Le remboursement intervient après réception et contrôle du produit retourné, selon le moyen de paiement initial lorsque techniquement possible.</p><h2>10. Garantie commerciale 1 an</h2><p>Eclipse propose une garantie commerciale d’un an couvrant les défauts anormaux de fabrication dans des conditions normales d’usage. Elle ne couvre pas l’usure normale, les rayures liées au port, les chocs, pertes, vols, modifications, mauvaise utilisation ou entretien inadapté. Cette garantie commerciale s’ajoute aux garanties légales.</p><h2>11. Garanties légales</h2><p>Le client bénéficie des garanties légales applicables, notamment la garantie légale de conformité et la garantie contre les vices cachés, dans les conditions prévues par le droit français.</p><h2>12. Données personnelles</h2><p>Les données nécessaires à la commande, au paiement, à la livraison, au service client, à la prévention de la fraude et aux obligations comptables sont traitées conformément à la politique de confidentialité. Contact données personnelles : <span class=\"legal-missing\">[À compléter : contact données personnelles]</span>.</p><h2>13. Cookies</h2><p>Le site peut utiliser des cookies nécessaires à son fonctionnement et, selon les choix de l’utilisateur, des traceurs optionnels. Le consentement peut être accepté, refusé ou modifié depuis la page dédiée.</p><h2>14. Responsabilité</h2><p>Eclipse s’efforce d’assurer l’accès au site et l’exactitude des informations publiées. Des interruptions techniques, erreurs ou évolutions de stock peuvent toutefois survenir. Les photographies, rendus 3D et couleurs peuvent varier selon les écrans.</p><h2>15. Médiation et litiges</h2><p>En cas de litige, le client contacte d’abord Eclipse afin de rechercher une solution amiable. Si le différend persiste, le consommateur peut recourir au médiateur suivant : <span class=\"legal-missing\">[À compléter : médiateur de la consommation]</span> - <span class=\"legal-missing\">[À compléter : URL du médiateur]</span>.</p><h2>16. Droit applicable</h2><p>Les présentes conditions sont soumises au droit français, sous réserve des règles impératives protectrices du consommateur.</p>','CGU','','publish','closed','closed','','conditions-generales-utilisation','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',0,'http://localhost:8080/?page_id=44',0,'page','',0),
(45,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Conditions générales d’utilisation et de vente</h2><p>Les présentes conditions encadrent l’accès au site Eclipse, la navigation, les commandes, les précommandes, les paiements, la livraison, les retours et les garanties applicables aux bijoux vendus en ligne.</p><h2>1. Identité du vendeur</h2><div class=\"legal-card\"><h2>Identité de l’éditeur</h2><p><strong>Éditeur du site :</strong> <span class=\"legal-missing\">[À compléter : raison sociale ou nom commercial]</span></p><p><strong>Forme juridique :</strong> <span class=\"legal-missing\">[À compléter : forme juridique]</span></p><p><strong>Adresse du siège :</strong> <span class=\"legal-missing\">[À compléter : adresse complète]</span></p><p><strong>SIRET :</strong> <span class=\"legal-missing\">[À compléter : numéro SIRET]</span></p><p><strong>TVA intracommunautaire :</strong> <span class=\"legal-missing\">[À compléter : numéro de TVA ou mention non applicable]</span></p><p><strong>Directeur de publication :</strong> <span class=\"legal-missing\">[À compléter : nom du responsable de publication]</span></p><p><strong>Contact :</strong> <span class=\"legal-missing\">[À compléter : adresse email de contact]</span></p><p><strong>Téléphone :</strong> <span class=\"legal-missing\">[À compléter : numéro de téléphone ou mention non disponible]</span></p></div><h2>2. Produits</h2><p>Eclipse vend des bijoux, principalement des bagues en acier inoxydable. Les caractéristiques essentielles sont indiquées sur chaque fiche produit : modèle, matériau, finition, taille, prix, disponibilité, statut de précommande éventuel et visuel 3D lorsque disponible.</p><h2>3. Prix</h2><p>Les prix sont affichés en euros. Les éventuels frais de livraison, remises, taxes et frais additionnels sont indiqués avant validation de la commande. Pour les précommandes, le prix peut être inférieur au prix public prévu afin de soutenir la fabrication ou le lancement d’une collection.</p><h2>4. Commande</h2><p>Le client sélectionne un produit, une taille, une quantité, puis valide son panier. Avant paiement, un récapitulatif permet de vérifier la commande et de corriger les erreurs éventuelles. La commande devient ferme après confirmation du paiement ou validation du mode de paiement disponible.</p><h2>5. Paiement</h2><p>Le paiement s’effectue via les moyens proposés au moment de la commande. Le site doit afficher clairement le prestataire de paiement actif avant mise en production. Aucune donnée complète de carte bancaire n’est destinée à être stockée par Eclipse.</p><h2>6. Précommandes</h2><p>Une précommande concerne un produit non immédiatement disponible. La fiche produit indique le statut, le prix de soutien et, lorsqu’elle est connue, une estimation d’expédition. En cas de modification significative du délai, le client est informé par email. Les droits légaux du consommateur restent applicables, sauf exception prévue par la loi.</p><h2>7. Livraison</h2><p>La livraison est prévue en France via Mondial Relay. Le délai indicatif est de 1 à 2 semaines et les frais de livraison sont de 3 €, sauf indication différente affichée avant validation de commande. Pour toute question de suivi : <span class=\"legal-missing\">[À compléter : email livraison]</span>. Une page de suivi permet aussi de retrouver les informations de commande lorsque le transporteur les communique.</p><h2>8. Droit de rétractation</h2><p>Conformément aux règles applicables à la vente à distance, le consommateur dispose en principe d’un délai de 14 jours pour exercer son droit de rétractation à compter de la réception du produit. Eclipse ne prévoit pas d’exclusion commerciale spécifique au droit de retour à ce stade, hors limites impératives prévues par la loi. La demande peut être envoyée à : <span class=\"legal-missing\">[À compléter : email rétractation]</span>.</p><h2>9. Retours et remboursements</h2><p>Les produits doivent être retournés complets, non portés au-delà d’un simple essayage, non dégradés et dans leur emballage lorsque cela est possible. L’adresse de retour est : <span class=\"legal-missing\">[À compléter : adresse de retour]</span>. Le remboursement intervient après réception et contrôle du produit retourné, selon le moyen de paiement initial lorsque techniquement possible.</p><h2>10. Garantie commerciale 1 an</h2><p>Eclipse propose une garantie commerciale d’un an couvrant les défauts anormaux de fabrication dans des conditions normales d’usage. Elle ne couvre pas l’usure normale, les rayures liées au port, les chocs, pertes, vols, modifications, mauvaise utilisation ou entretien inadapté. Cette garantie commerciale s’ajoute aux garanties légales.</p><h2>11. Garanties légales</h2><p>Le client bénéficie des garanties légales applicables, notamment la garantie légale de conformité et la garantie contre les vices cachés, dans les conditions prévues par le droit français.</p><h2>12. Données personnelles</h2><p>Les données nécessaires à la commande, au paiement, à la livraison, au service client, à la prévention de la fraude et aux obligations comptables sont traitées conformément à la politique de confidentialité. Contact données personnelles : <span class=\"legal-missing\">[À compléter : contact données personnelles]</span>.</p><h2>13. Cookies</h2><p>Le site peut utiliser des cookies nécessaires à son fonctionnement et, selon les choix de l’utilisateur, des traceurs optionnels. Le consentement peut être accepté, refusé ou modifié depuis la page dédiée.</p><h2>14. Responsabilité</h2><p>Eclipse s’efforce d’assurer l’accès au site et l’exactitude des informations publiées. Des interruptions techniques, erreurs ou évolutions de stock peuvent toutefois survenir. Les photographies, rendus 3D et couleurs peuvent varier selon les écrans.</p><h2>15. Médiation et litiges</h2><p>En cas de litige, le client contacte d’abord Eclipse afin de rechercher une solution amiable. Si le différend persiste, le consommateur peut recourir au médiateur suivant : <span class=\"legal-missing\">[À compléter : médiateur de la consommation]</span> - <span class=\"legal-missing\">[À compléter : URL du médiateur]</span>.</p><h2>16. Droit applicable</h2><p>Les présentes conditions sont soumises au droit français, sous réserve des règles impératives protectrices du consommateur.</p>','Conditions générales de vente','','publish','closed','closed','','conditions-generales-de-vente','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',0,'http://localhost:8080/?page_id=45',0,'page','',0),
(46,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Conditions de précommande</h2><p>Certains produits peuvent être proposés en précommande avec un prix de soutien inférieur au prix public prévu. La fiche produit et le panier indiquent le statut de précommande, le prix appliqué et, lorsqu’elle est connue, l’estimation d’expédition.</p><p>Une précommande confirme une intention d’achat avant disponibilité immédiate du produit. Les délais annoncés sont des estimations liées à la fabrication, aux contrôles qualité et à la logistique. En cas de changement significatif de délai, le client est informé par email.</p><p>Sauf mention contraire sur la fiche produit, les droits légaux du consommateur restent applicables, notamment les garanties légales et les règles de rétractation prévues dans les CGU/CGV.</p>','Conditions de précommande','','publish','closed','closed','','conditions-de-precommande','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/?page_id=46',0,'page','',0),
(47,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Politique de confidentialité</h2><p>Cette politique explique comment Eclipse collecte et utilise les données personnelles nécessaires au fonctionnement du site, aux commandes et aux demandes client.</p><h2>Responsable du traitement</h2><p><span class=\"legal-missing\">[À compléter : raison sociale]</span> est responsable des traitements réalisés via le site. Contact données personnelles : <span class=\"legal-missing\">[À compléter : contact données personnelles]</span>.</p><h2>Données collectées</h2><p>Selon les usages du site, les données peuvent inclure : identité, email, téléphone, adresses de facturation et livraison, contenu des messages, informations de commande, historique d’achat, statut de paiement, données techniques de navigation et choix cookies.</p><h2>Finalités</h2><p>Les données sont utilisées pour traiter les commandes, livrer les produits, gérer le service client, envoyer les alertes précommande demandées, respecter les obligations comptables et fiscales, sécuriser le site, gérer les retours et garanties, et améliorer l’expérience lorsque le consentement le permet.</p><h2>Destinataires et outils utilisés ou prévus</h2><p>Les données peuvent être transmises aux prestataires strictement nécessaires : hébergeur OVH, WordPress/WooCommerce pour la boutique, prestataire de paiement Stripe lorsqu’il sera activé, transporteur Mondial Relay, outil de newsletter lorsqu’il sera choisi, réseaux sociaux utilisés pour la communication de marque, outils email, comptabilité et autorités lorsque la loi l’exige.</p><h2>Durées de conservation</h2><p>Les données sont conservées pendant la durée nécessaire à leur finalité : gestion client et commande, obligations comptables, preuve contractuelle, demandes de garantie ou contentieux éventuel. Les durées précises doivent être validées selon l’organisation réelle de Eclipse.</p><h2>Droits</h2><p>Vous pouvez demander l’accès, la rectification, l’effacement, la limitation, l’opposition ou la portabilité de vos données lorsque ces droits s’appliquent. Vous pouvez aussi retirer votre consentement pour les traitements fondés sur celui-ci.</p>[bagueship_personal_data_request_form]','Politique de confidentialité','','publish','closed','closed','','politique-de-confidentialite','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',0,'http://localhost:8080/?page_id=47',0,'page','',0),
(48,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Données personnelles</h2><p>Vous pouvez demander un export ou une suppression de vos données personnelles via le formulaire ci-dessous.</p>[bagueship_personal_data_request_form]','Données personnelles','','publish','closed','closed','','donnees-personnelles','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',0,'http://localhost:8080/?page_id=48',0,'page','',0),
(49,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Politique cookies</h2><p>Le site utilise des cookies nécessaires au panier, à la commande, à la sécurité et à la conservation de certains choix. Ces cookies sont indispensables au service demandé.</p><p>Les éventuels cookies de mesure d’audience, newsletter, publicité, personnalisation, paiement Stripe ou réseaux sociaux ne doivent être déposés qu’après consentement lorsque la réglementation l’exige. Les outils exacts devront être confirmés avant la mise en production des traceurs optionnels.</p><h2>Modifier mon choix</h2><p>Vous pouvez modifier votre choix à tout moment depuis ce lien.</p>[bagueship_cookie_preferences]','Politique cookies','','publish','closed','closed','','politique-cookies','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',0,'http://localhost:8080/?page_id=49',0,'page','',0),
(50,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Livraison et retours</h2><p>La livraison est prévue en France via Mondial Relay. Le délai indicatif est de 1 à 2 semaines et les frais de livraison sont de 3 €, sauf indication différente affichée avant validation de commande.</p><p>Les retours sont traités via la page Retour de produit. Eclipse ne prévoit pas d’exclusion commerciale spécifique au droit de retour à ce stade, hors limites impératives prévues par la loi.</p><p>Contact livraison : <span class=\"legal-missing\">[À compléter : email livraison]</span>.</p>','Livraison et retours','','publish','closed','closed','','livraison-et-retours','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',0,'http://localhost:8080/?page_id=50',0,'page','',0),
(51,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Guide des tailles</h2><p>Mesurez le diamètre intérieur d’une bague qui vous va déjà, ou mesurez votre tour de doigt avec une bande de papier fine. En cas d’hésitation, contactez-nous avant commande.</p>','Guide des tailles','','publish','closed','closed','','guide-des-tailles','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/?page_id=51',0,'page','',0),
(52,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Entretien</h2><p>Nettoyez votre bague avec un chiffon doux. Évitez les chocs, produits abrasifs et contacts prolongés avec des produits chimiques afin de préserver la finition.</p>','Entretien','','publish','closed','closed','','entretien','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/?page_id=52',0,'page','',0),
(53,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>À propos</h2><p>Eclipse construit un univers de bijoux en acier, sculptural, sombre et accessible, avec des pièces pensées comme des objets visuels forts.</p>','À propos','','publish','closed','closed','','a-propos','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',0,'http://localhost:8080/?page_id=53',0,'page','',0),
(54,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Questions</h2><h3>Comment choisir ma taille ?</h3><p>Consultez le guide des tailles ou contactez-nous si vous hésitez entre deux tailles.</p><h3>Les bagues sont-elles en acier ?</h3><p>Oui, les fiches produit indiquent la matière et la finition de chaque modèle.</p><h3>Comment fonctionne une précommande ?</h3><p>La précommande permet de soutenir le lancement d’une collection avec un prix inférieur au prix public prévu. Le délai estimé est indiqué lorsqu’il est connu.</p><h3>Puis-je retourner une bague ?</h3><p>Oui, lorsque les conditions légales et commerciales de retour sont remplies. Utilisez la page Retour de produit.</p><h3>Comment suivre mon colis ?</h3><p>Utilisez la page Suivre le colis avec votre numéro de commande et votre email.</p>','Questions','','publish','closed','closed','','questions','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/?page_id=54',0,'page','',0),
(55,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Questions</h2><h3>Comment choisir ma taille ?</h3><p>Consultez le guide des tailles ou contactez-nous si vous hésitez entre deux tailles.</p><h3>Les bagues sont-elles en acier ?</h3><p>Oui, les fiches produit indiquent la matière et la finition de chaque modèle.</p><h3>Comment fonctionne une précommande ?</h3><p>La précommande permet de soutenir le lancement d’une collection avec un prix inférieur au prix public prévu. Le délai estimé est indiqué lorsqu’il est connu.</p><h3>Puis-je retourner une bague ?</h3><p>Oui, lorsque les conditions légales et commerciales de retour sont remplies. Utilisez la page Retour de produit.</p><h3>Comment suivre mon colis ?</h3><p>Utilisez la page Suivre le colis avec votre numéro de commande et votre email.</p>','FAQ','','publish','closed','closed','','faq','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/?page_id=55',0,'page','',0),
(56,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Contact</h2><p>Une question sur une taille, une commande, une précommande ou un retour ? Écrivez-nous ici.</p>[bagueship_contact_form]','Contact','','publish','closed','closed','','contact','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',0,'http://localhost:8080/?page_id=56',0,'page','',0),
(57,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Suivre le colis</h2><p>Les commandes sont prévues en livraison France via Mondial Relay, avec un délai indicatif de 1 à 2 semaines et des frais de livraison de 3 €.</p><p>Renseignez votre numéro de commande et l’email utilisé lors de l’achat pour retrouver les informations de suivi disponibles.</p>[woocommerce_order_tracking]<p>Si le suivi transporteur n’apparaît pas encore, contactez-nous via la page contact avec votre numéro de commande.</p>','Suivre le colis','','publish','closed','closed','','suivre-le-colis','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/?page_id=57',0,'page','',0),
(58,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Suivre le colis</h2><p>Les commandes sont prévues en livraison France via Mondial Relay, avec un délai indicatif de 1 à 2 semaines et des frais de livraison de 3 €.</p><p>Renseignez votre numéro de commande et l’email utilisé lors de l’achat pour retrouver les informations de suivi disponibles.</p>[woocommerce_order_tracking]<p>Si le suivi transporteur n’apparaît pas encore, contactez-nous via la page contact avec votre numéro de commande.</p>','Suivi de commande','','publish','closed','closed','','suivi-de-commande','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/?page_id=58',0,'page','',0),
(59,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Retour de produit</h2><p>Vous pouvez demander un retour depuis cette page. Indiquez le numéro de commande, l’email utilisé et le motif de la demande.</p><p>Adresse de retour : <span class=\"legal-missing\">[À compléter : adresse de retour]</span>.</p><p>Les retours doivent être envoyés complets, protégés, non abîmés et accompagnés des informations de commande.</p>[bagueship_withdrawal_form]','Retour de produit','','publish','closed','closed','','retour-de-produit','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',0,'http://localhost:8080/?page_id=59',0,'page','',0),
(60,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Garantie 1 an</h2><p>Chaque bague Eclipse bénéficie d’une garantie commerciale d’un an contre les défauts anormaux de fabrication constatés dans des conditions normales d’usage.</p><p>La garantie ne couvre pas l’usure normale, les rayures, chocs, pertes, vols, modifications, mauvaise utilisation, exposition inadaptée ou entretien contraire aux recommandations.</p><p>Pour ouvrir une demande, contactez-nous avec le numéro de commande, des photos nettes et une description du problème.</p>','Garantie 1 an','','publish','closed','closed','','garantie-1-an','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',0,'http://localhost:8080/?page_id=60',0,'page','',0),
(61,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Retour de produit</h2><p>Vous pouvez demander un retour depuis cette page. Indiquez le numéro de commande, l’email utilisé et le motif de la demande.</p><p>Adresse de retour : <span class=\"legal-missing\">[À compléter : adresse de retour]</span>.</p><p>Les retours doivent être envoyés complets, protégés, non abîmés et accompagnés des informations de commande.</p>[bagueship_withdrawal_form]','Rétractation','','publish','closed','closed','','retractation','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',0,'http://localhost:8080/?page_id=61',0,'page','',0),
(62,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Devenir ambassadeur / ambassadrice</h2><p>Eclipse recherche des profils capables de porter l’univers de la marque avec sincérité : créateurs, modèles, stylistes, photographes, artistes, ou simplement personnes avec une vraie présence visuelle.</p><p>Présentez-vous brièvement, ajoutez vos réseaux et expliquez pourquoi l’univers Eclipse vous parle.</p>[bagueship_ambassador_form]','Devenir ambassadeur / ambassadrice','','publish','closed','closed','','devenir-ambassadeur','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',0,'http://localhost:8080/?page_id=62',0,'page','',0),
(63,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Maintenance</h2><p>La boutique est temporairement indisponible pendant une opération de maintenance.</p>','Maintenance','','publish','closed','closed','','maintenance','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/?page_id=63',0,'page','',0),
(64,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Paiement échoué</h2><p>Le paiement n’a pas pu être validé. Vous pouvez réessayer ou retourner à la boutique.</p><p><a class=\"button\" href=\"http://localhost:8080/boutique/\">Retour boutique</a></p>','Paiement échoué','','publish','closed','closed','','paiement-echoue','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/?page_id=64',0,'page','',0),
(78,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Mentions légales</h2><p>Cette page permet d’identifier l’éditeur du site Eclipse et les principaux responsables du service.</p><div class=\"legal-card\"><h2>Identité de l’éditeur</h2><p><strong>Éditeur du site :</strong> <span class=\"legal-missing\">[À compléter : raison sociale ou nom commercial]</span></p><p><strong>Forme juridique :</strong> <span class=\"legal-missing\">[À compléter : forme juridique]</span></p><p><strong>Adresse du siège :</strong> <span class=\"legal-missing\">[À compléter : adresse complète]</span></p><p><strong>SIRET :</strong> <span class=\"legal-missing\">[À compléter : numéro SIRET]</span></p><p><strong>TVA intracommunautaire :</strong> <span class=\"legal-missing\">[À compléter : numéro de TVA ou mention non applicable]</span></p><p><strong>Directeur de publication :</strong> <span class=\"legal-missing\">[À compléter : nom du responsable de publication]</span></p><p><strong>Contact :</strong> <span class=\"legal-missing\">[À compléter : adresse email de contact]</span></p><p><strong>Téléphone :</strong> <span class=\"legal-missing\">[À compléter : numéro de téléphone ou mention non disponible]</span></p></div><div class=\"legal-card\"><h2>Hébergement</h2><p><strong>Hébergeur :</strong> <span class=\"legal-missing\">[À compléter : nom, adresse et contact de l’hébergeur]</span></p></div><div class=\"legal-card\"><h2>Propriété intellectuelle</h2><p>Les textes, visuels, modèles 3D, éléments graphiques, logos, interfaces et contenus du site sont protégés. Toute reproduction, extraction, modification ou réutilisation sans autorisation écrite préalable est interdite, sauf exceptions prévues par la loi.</p></div><div class=\"legal-card\"><h2>Données personnelles</h2><p>Pour toute demande liée aux données personnelles, contactez : <span class=\"legal-missing\">[À compléter : contact données personnelles]</span>.</p></div>','Mentions légales','','inherit','closed','closed','','43-revision-v1','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',43,'http://localhost:8080/?p=78',0,'revision','',0),
(79,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Conditions générales d’utilisation et de vente</h2><p>Les présentes conditions encadrent l’accès au site Eclipse, la navigation, les commandes, les précommandes, les paiements, la livraison, les retours et les garanties applicables aux bijoux vendus en ligne.</p><h2>1. Identité du vendeur</h2><div class=\"legal-card\"><h2>Identité de l’éditeur</h2><p><strong>Éditeur du site :</strong> <span class=\"legal-missing\">[À compléter : raison sociale ou nom commercial]</span></p><p><strong>Forme juridique :</strong> <span class=\"legal-missing\">[À compléter : forme juridique]</span></p><p><strong>Adresse du siège :</strong> <span class=\"legal-missing\">[À compléter : adresse complète]</span></p><p><strong>SIRET :</strong> <span class=\"legal-missing\">[À compléter : numéro SIRET]</span></p><p><strong>TVA intracommunautaire :</strong> <span class=\"legal-missing\">[À compléter : numéro de TVA ou mention non applicable]</span></p><p><strong>Directeur de publication :</strong> <span class=\"legal-missing\">[À compléter : nom du responsable de publication]</span></p><p><strong>Contact :</strong> <span class=\"legal-missing\">[À compléter : adresse email de contact]</span></p><p><strong>Téléphone :</strong> <span class=\"legal-missing\">[À compléter : numéro de téléphone ou mention non disponible]</span></p></div><h2>2. Produits</h2><p>Eclipse vend des bijoux, principalement des bagues en acier inoxydable. Les caractéristiques essentielles sont indiquées sur chaque fiche produit : modèle, matériau, finition, taille, prix, disponibilité, statut de précommande éventuel et visuel 3D lorsque disponible.</p><h2>3. Prix</h2><p>Les prix sont affichés en euros. Les éventuels frais de livraison, remises, taxes et frais additionnels sont indiqués avant validation de la commande. Pour les précommandes, le prix peut être inférieur au prix public prévu afin de soutenir la fabrication ou le lancement d’une collection.</p><h2>4. Commande</h2><p>Le client sélectionne un produit, une taille, une quantité, puis valide son panier. Avant paiement, un récapitulatif permet de vérifier la commande et de corriger les erreurs éventuelles. La commande devient ferme après confirmation du paiement ou validation du mode de paiement disponible.</p><h2>5. Paiement</h2><p>Le paiement s’effectue via les moyens proposés au moment de la commande. Le site doit afficher clairement le prestataire de paiement actif avant mise en production. Aucune donnée complète de carte bancaire n’est destinée à être stockée par Eclipse.</p><h2>6. Précommandes</h2><p>Une précommande concerne un produit non immédiatement disponible. La fiche produit indique le statut, le prix de soutien et, lorsqu’elle est connue, une estimation d’expédition. En cas de modification significative du délai, le client est informé par email. Les droits légaux du consommateur restent applicables, sauf exception prévue par la loi.</p><h2>7. Livraison</h2><p>La livraison est prévue en France via Mondial Relay. Le délai indicatif est de 1 à 2 semaines et les frais de livraison sont de 3 €, sauf indication différente affichée avant validation de commande. Pour toute question de suivi : <span class=\"legal-missing\">[À compléter : email livraison]</span>. Une page de suivi permet aussi de retrouver les informations de commande lorsque le transporteur les communique.</p><h2>8. Droit de rétractation</h2><p>Conformément aux règles applicables à la vente à distance, le consommateur dispose en principe d’un délai de 14 jours pour exercer son droit de rétractation à compter de la réception du produit. Eclipse ne prévoit pas d’exclusion commerciale spécifique au droit de retour à ce stade, hors limites impératives prévues par la loi. La demande peut être envoyée à : <span class=\"legal-missing\">[À compléter : email rétractation]</span>.</p><h2>9. Retours et remboursements</h2><p>Les produits doivent être retournés complets, non portés au-delà d’un simple essayage, non dégradés et dans leur emballage lorsque cela est possible. L’adresse de retour est : <span class=\"legal-missing\">[À compléter : adresse de retour]</span>. Le remboursement intervient après réception et contrôle du produit retourné, selon le moyen de paiement initial lorsque techniquement possible.</p><h2>10. Garantie commerciale 1 an</h2><p>Eclipse propose une garantie commerciale d’un an couvrant les défauts anormaux de fabrication dans des conditions normales d’usage. Elle ne couvre pas l’usure normale, les rayures liées au port, les chocs, pertes, vols, modifications, mauvaise utilisation ou entretien inadapté. Cette garantie commerciale s’ajoute aux garanties légales.</p><h2>11. Garanties légales</h2><p>Le client bénéficie des garanties légales applicables, notamment la garantie légale de conformité et la garantie contre les vices cachés, dans les conditions prévues par le droit français.</p><h2>12. Données personnelles</h2><p>Les données nécessaires à la commande, au paiement, à la livraison, au service client, à la prévention de la fraude et aux obligations comptables sont traitées conformément à la politique de confidentialité. Contact données personnelles : <span class=\"legal-missing\">[À compléter : contact données personnelles]</span>.</p><h2>13. Cookies</h2><p>Le site peut utiliser des cookies nécessaires à son fonctionnement et, selon les choix de l’utilisateur, des traceurs optionnels. Le consentement peut être accepté, refusé ou modifié depuis la page dédiée.</p><h2>14. Responsabilité</h2><p>Eclipse s’efforce d’assurer l’accès au site et l’exactitude des informations publiées. Des interruptions techniques, erreurs ou évolutions de stock peuvent toutefois survenir. Les photographies, rendus 3D et couleurs peuvent varier selon les écrans.</p><h2>15. Médiation et litiges</h2><p>En cas de litige, le client contacte d’abord Eclipse afin de rechercher une solution amiable. Si le différend persiste, le consommateur peut recourir au médiateur suivant : <span class=\"legal-missing\">[À compléter : médiateur de la consommation]</span> - <span class=\"legal-missing\">[À compléter : URL du médiateur]</span>.</p><h2>16. Droit applicable</h2><p>Les présentes conditions sont soumises au droit français, sous réserve des règles impératives protectrices du consommateur.</p>','CGU','','inherit','closed','closed','','44-revision-v1','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',44,'http://localhost:8080/?p=79',0,'revision','',0),
(80,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Conditions générales d’utilisation et de vente</h2><p>Les présentes conditions encadrent l’accès au site Eclipse, la navigation, les commandes, les précommandes, les paiements, la livraison, les retours et les garanties applicables aux bijoux vendus en ligne.</p><h2>1. Identité du vendeur</h2><div class=\"legal-card\"><h2>Identité de l’éditeur</h2><p><strong>Éditeur du site :</strong> <span class=\"legal-missing\">[À compléter : raison sociale ou nom commercial]</span></p><p><strong>Forme juridique :</strong> <span class=\"legal-missing\">[À compléter : forme juridique]</span></p><p><strong>Adresse du siège :</strong> <span class=\"legal-missing\">[À compléter : adresse complète]</span></p><p><strong>SIRET :</strong> <span class=\"legal-missing\">[À compléter : numéro SIRET]</span></p><p><strong>TVA intracommunautaire :</strong> <span class=\"legal-missing\">[À compléter : numéro de TVA ou mention non applicable]</span></p><p><strong>Directeur de publication :</strong> <span class=\"legal-missing\">[À compléter : nom du responsable de publication]</span></p><p><strong>Contact :</strong> <span class=\"legal-missing\">[À compléter : adresse email de contact]</span></p><p><strong>Téléphone :</strong> <span class=\"legal-missing\">[À compléter : numéro de téléphone ou mention non disponible]</span></p></div><h2>2. Produits</h2><p>Eclipse vend des bijoux, principalement des bagues en acier inoxydable. Les caractéristiques essentielles sont indiquées sur chaque fiche produit : modèle, matériau, finition, taille, prix, disponibilité, statut de précommande éventuel et visuel 3D lorsque disponible.</p><h2>3. Prix</h2><p>Les prix sont affichés en euros. Les éventuels frais de livraison, remises, taxes et frais additionnels sont indiqués avant validation de la commande. Pour les précommandes, le prix peut être inférieur au prix public prévu afin de soutenir la fabrication ou le lancement d’une collection.</p><h2>4. Commande</h2><p>Le client sélectionne un produit, une taille, une quantité, puis valide son panier. Avant paiement, un récapitulatif permet de vérifier la commande et de corriger les erreurs éventuelles. La commande devient ferme après confirmation du paiement ou validation du mode de paiement disponible.</p><h2>5. Paiement</h2><p>Le paiement s’effectue via les moyens proposés au moment de la commande. Le site doit afficher clairement le prestataire de paiement actif avant mise en production. Aucune donnée complète de carte bancaire n’est destinée à être stockée par Eclipse.</p><h2>6. Précommandes</h2><p>Une précommande concerne un produit non immédiatement disponible. La fiche produit indique le statut, le prix de soutien et, lorsqu’elle est connue, une estimation d’expédition. En cas de modification significative du délai, le client est informé par email. Les droits légaux du consommateur restent applicables, sauf exception prévue par la loi.</p><h2>7. Livraison</h2><p>La livraison est prévue en France via Mondial Relay. Le délai indicatif est de 1 à 2 semaines et les frais de livraison sont de 3 €, sauf indication différente affichée avant validation de commande. Pour toute question de suivi : <span class=\"legal-missing\">[À compléter : email livraison]</span>. Une page de suivi permet aussi de retrouver les informations de commande lorsque le transporteur les communique.</p><h2>8. Droit de rétractation</h2><p>Conformément aux règles applicables à la vente à distance, le consommateur dispose en principe d’un délai de 14 jours pour exercer son droit de rétractation à compter de la réception du produit. Eclipse ne prévoit pas d’exclusion commerciale spécifique au droit de retour à ce stade, hors limites impératives prévues par la loi. La demande peut être envoyée à : <span class=\"legal-missing\">[À compléter : email rétractation]</span>.</p><h2>9. Retours et remboursements</h2><p>Les produits doivent être retournés complets, non portés au-delà d’un simple essayage, non dégradés et dans leur emballage lorsque cela est possible. L’adresse de retour est : <span class=\"legal-missing\">[À compléter : adresse de retour]</span>. Le remboursement intervient après réception et contrôle du produit retourné, selon le moyen de paiement initial lorsque techniquement possible.</p><h2>10. Garantie commerciale 1 an</h2><p>Eclipse propose une garantie commerciale d’un an couvrant les défauts anormaux de fabrication dans des conditions normales d’usage. Elle ne couvre pas l’usure normale, les rayures liées au port, les chocs, pertes, vols, modifications, mauvaise utilisation ou entretien inadapté. Cette garantie commerciale s’ajoute aux garanties légales.</p><h2>11. Garanties légales</h2><p>Le client bénéficie des garanties légales applicables, notamment la garantie légale de conformité et la garantie contre les vices cachés, dans les conditions prévues par le droit français.</p><h2>12. Données personnelles</h2><p>Les données nécessaires à la commande, au paiement, à la livraison, au service client, à la prévention de la fraude et aux obligations comptables sont traitées conformément à la politique de confidentialité. Contact données personnelles : <span class=\"legal-missing\">[À compléter : contact données personnelles]</span>.</p><h2>13. Cookies</h2><p>Le site peut utiliser des cookies nécessaires à son fonctionnement et, selon les choix de l’utilisateur, des traceurs optionnels. Le consentement peut être accepté, refusé ou modifié depuis la page dédiée.</p><h2>14. Responsabilité</h2><p>Eclipse s’efforce d’assurer l’accès au site et l’exactitude des informations publiées. Des interruptions techniques, erreurs ou évolutions de stock peuvent toutefois survenir. Les photographies, rendus 3D et couleurs peuvent varier selon les écrans.</p><h2>15. Médiation et litiges</h2><p>En cas de litige, le client contacte d’abord Eclipse afin de rechercher une solution amiable. Si le différend persiste, le consommateur peut recourir au médiateur suivant : <span class=\"legal-missing\">[À compléter : médiateur de la consommation]</span> - <span class=\"legal-missing\">[À compléter : URL du médiateur]</span>.</p><h2>16. Droit applicable</h2><p>Les présentes conditions sont soumises au droit français, sous réserve des règles impératives protectrices du consommateur.</p>','Conditions générales de vente','','inherit','closed','closed','','45-revision-v1','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',45,'http://localhost:8080/?p=80',0,'revision','',0),
(81,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Conditions de précommande</h2><p>Certains produits peuvent être proposés en précommande avec un prix de soutien inférieur au prix public prévu. La fiche produit et le panier indiquent le statut de précommande, le prix appliqué et, lorsqu’elle est connue, l’estimation d’expédition.</p><p>Une précommande confirme une intention d’achat avant disponibilité immédiate du produit. Les délais annoncés sont des estimations liées à la fabrication, aux contrôles qualité et à la logistique. En cas de changement significatif de délai, le client est informé par email.</p><p>Sauf mention contraire sur la fiche produit, les droits légaux du consommateur restent applicables, notamment les garanties légales et les règles de rétractation prévues dans les CGU/CGV.</p>','Conditions de précommande','','inherit','closed','closed','','46-revision-v1','','','2026-07-20 16:28:17','2026-07-20 16:28:17','',46,'http://localhost:8080/?p=81',0,'revision','',0),
(82,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Politique de confidentialité</h2><p>Cette politique explique comment Eclipse collecte et utilise les données personnelles nécessaires au fonctionnement du site, aux commandes et aux demandes client.</p><h2>Responsable du traitement</h2><p><span class=\"legal-missing\">[À compléter : raison sociale]</span> est responsable des traitements réalisés via le site. Contact données personnelles : <span class=\"legal-missing\">[À compléter : contact données personnelles]</span>.</p><h2>Données collectées</h2><p>Selon les usages du site, les données peuvent inclure : identité, email, téléphone, adresses de facturation et livraison, contenu des messages, informations de commande, historique d’achat, statut de paiement, données techniques de navigation et choix cookies.</p><h2>Finalités</h2><p>Les données sont utilisées pour traiter les commandes, livrer les produits, gérer le service client, envoyer les alertes précommande demandées, respecter les obligations comptables et fiscales, sécuriser le site, gérer les retours et garanties, et améliorer l’expérience lorsque le consentement le permet.</p><h2>Destinataires et outils utilisés ou prévus</h2><p>Les données peuvent être transmises aux prestataires strictement nécessaires : hébergeur OVH, WordPress/WooCommerce pour la boutique, prestataire de paiement Stripe lorsqu’il sera activé, transporteur Mondial Relay, outil de newsletter lorsqu’il sera choisi, réseaux sociaux utilisés pour la communication de marque, outils email, comptabilité et autorités lorsque la loi l’exige.</p><h2>Durées de conservation</h2><p>Les données sont conservées pendant la durée nécessaire à leur finalité : gestion client et commande, obligations comptables, preuve contractuelle, demandes de garantie ou contentieux éventuel. Les durées précises doivent être validées selon l’organisation réelle de Eclipse.</p><h2>Droits</h2><p>Vous pouvez demander l’accès, la rectification, l’effacement, la limitation, l’opposition ou la portabilité de vos données lorsque ces droits s’appliquent. Vous pouvez aussi retirer votre consentement pour les traitements fondés sur celui-ci.</p>[bagueship_personal_data_request_form]','Politique de confidentialité','','inherit','closed','closed','','47-revision-v1','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',47,'http://localhost:8080/?p=82',0,'revision','',0),
(83,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Données personnelles</h2><p>Vous pouvez demander un export ou une suppression de vos données personnelles via le formulaire ci-dessous.</p>[bagueship_personal_data_request_form]','Données personnelles','','inherit','closed','closed','','48-revision-v1','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',48,'http://localhost:8080/?p=83',0,'revision','',0),
(84,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Politique cookies</h2><p>Le site utilise des cookies nécessaires au panier, à la commande, à la sécurité et à la conservation de certains choix. Ces cookies sont indispensables au service demandé.</p><p>Les éventuels cookies de mesure d’audience, newsletter, publicité, personnalisation, paiement Stripe ou réseaux sociaux ne doivent être déposés qu’après consentement lorsque la réglementation l’exige. Les outils exacts devront être confirmés avant la mise en production des traceurs optionnels.</p><h2>Modifier mon choix</h2><p>Vous pouvez modifier votre choix à tout moment depuis ce lien.</p>[bagueship_cookie_preferences]','Politique cookies','','inherit','closed','closed','','49-revision-v1','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',49,'http://localhost:8080/?p=84',0,'revision','',0),
(85,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Livraison et retours</h2><p>La livraison est prévue en France via Mondial Relay. Le délai indicatif est de 1 à 2 semaines et les frais de livraison sont de 3 €, sauf indication différente affichée avant validation de commande.</p><p>Les retours sont traités via la page Retour de produit. Eclipse ne prévoit pas d’exclusion commerciale spécifique au droit de retour à ce stade, hors limites impératives prévues par la loi.</p><p>Contact livraison : <span class=\"legal-missing\">[À compléter : email livraison]</span>.</p>','Livraison et retours','','inherit','closed','closed','','50-revision-v1','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',50,'http://localhost:8080/?p=85',0,'revision','',0),
(86,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Guide des tailles</h2><p>Mesurez le diamètre intérieur d’une bague qui vous va déjà, ou mesurez votre tour de doigt avec une bande de papier fine. En cas d’hésitation, contactez-nous avant commande.</p>','Guide des tailles','','inherit','closed','closed','','51-revision-v1','','','2026-07-20 16:28:17','2026-07-20 16:28:17','',51,'http://localhost:8080/?p=86',0,'revision','',0),
(87,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Entretien</h2><p>Nettoyez votre bague avec un chiffon doux. Évitez les chocs, produits abrasifs et contacts prolongés avec des produits chimiques afin de préserver la finition.</p>','Entretien','','inherit','closed','closed','','52-revision-v1','','','2026-07-20 16:28:17','2026-07-20 16:28:17','',52,'http://localhost:8080/?p=87',0,'revision','',0),
(88,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>À propos</h2><p>Eclipse construit un univers de bijoux en acier, sculptural, sombre et accessible, avec des pièces pensées comme des objets visuels forts.</p>','À propos','','inherit','closed','closed','','53-revision-v1','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',53,'http://localhost:8080/?p=88',0,'revision','',0),
(89,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Questions</h2><h3>Comment choisir ma taille ?</h3><p>Consultez le guide des tailles ou contactez-nous si vous hésitez entre deux tailles.</p><h3>Les bagues sont-elles en acier ?</h3><p>Oui, les fiches produit indiquent la matière et la finition de chaque modèle.</p><h3>Comment fonctionne une précommande ?</h3><p>La précommande permet de soutenir le lancement d’une collection avec un prix inférieur au prix public prévu. Le délai estimé est indiqué lorsqu’il est connu.</p><h3>Puis-je retourner une bague ?</h3><p>Oui, lorsque les conditions légales et commerciales de retour sont remplies. Utilisez la page Retour de produit.</p><h3>Comment suivre mon colis ?</h3><p>Utilisez la page Suivre le colis avec votre numéro de commande et votre email.</p>','Questions','','inherit','closed','closed','','54-revision-v1','','','2026-07-20 16:28:17','2026-07-20 16:28:17','',54,'http://localhost:8080/?p=89',0,'revision','',0),
(90,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Questions</h2><h3>Comment choisir ma taille ?</h3><p>Consultez le guide des tailles ou contactez-nous si vous hésitez entre deux tailles.</p><h3>Les bagues sont-elles en acier ?</h3><p>Oui, les fiches produit indiquent la matière et la finition de chaque modèle.</p><h3>Comment fonctionne une précommande ?</h3><p>La précommande permet de soutenir le lancement d’une collection avec un prix inférieur au prix public prévu. Le délai estimé est indiqué lorsqu’il est connu.</p><h3>Puis-je retourner une bague ?</h3><p>Oui, lorsque les conditions légales et commerciales de retour sont remplies. Utilisez la page Retour de produit.</p><h3>Comment suivre mon colis ?</h3><p>Utilisez la page Suivre le colis avec votre numéro de commande et votre email.</p>','FAQ','','inherit','closed','closed','','55-revision-v1','','','2026-07-20 16:28:17','2026-07-20 16:28:17','',55,'http://localhost:8080/?p=90',0,'revision','',0),
(91,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Contact</h2><p>Une question sur une taille, une commande, une précommande ou un retour ? Écrivez-nous ici.</p>[bagueship_contact_form]','Contact','','inherit','closed','closed','','56-revision-v1','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',56,'http://localhost:8080/?p=91',0,'revision','',0),
(92,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Suivre le colis</h2><p>Les commandes sont prévues en livraison France via Mondial Relay, avec un délai indicatif de 1 à 2 semaines et des frais de livraison de 3 €.</p><p>Renseignez votre numéro de commande et l’email utilisé lors de l’achat pour retrouver les informations de suivi disponibles.</p>[woocommerce_order_tracking]<p>Si le suivi transporteur n’apparaît pas encore, contactez-nous via la page contact avec votre numéro de commande.</p>','Suivre le colis','','inherit','closed','closed','','57-revision-v1','','','2026-07-20 16:28:17','2026-07-20 16:28:17','',57,'http://localhost:8080/?p=92',0,'revision','',0),
(93,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Suivre le colis</h2><p>Les commandes sont prévues en livraison France via Mondial Relay, avec un délai indicatif de 1 à 2 semaines et des frais de livraison de 3 €.</p><p>Renseignez votre numéro de commande et l’email utilisé lors de l’achat pour retrouver les informations de suivi disponibles.</p>[woocommerce_order_tracking]<p>Si le suivi transporteur n’apparaît pas encore, contactez-nous via la page contact avec votre numéro de commande.</p>','Suivi de commande','','inherit','closed','closed','','58-revision-v1','','','2026-07-20 16:28:17','2026-07-20 16:28:17','',58,'http://localhost:8080/?p=93',0,'revision','',0),
(94,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Retour de produit</h2><p>Vous pouvez demander un retour depuis cette page. Indiquez le numéro de commande, l’email utilisé et le motif de la demande.</p><p>Adresse de retour : <span class=\"legal-missing\">[À compléter : adresse de retour]</span>.</p><p>Les retours doivent être envoyés complets, protégés, non abîmés et accompagnés des informations de commande.</p>[bagueship_withdrawal_form]','Retour de produit','','inherit','closed','closed','','59-revision-v1','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',59,'http://localhost:8080/?p=94',0,'revision','',0),
(95,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Garantie 1 an</h2><p>Chaque bague Eclipse bénéficie d’une garantie commerciale d’un an contre les défauts anormaux de fabrication constatés dans des conditions normales d’usage.</p><p>La garantie ne couvre pas l’usure normale, les rayures, chocs, pertes, vols, modifications, mauvaise utilisation, exposition inadaptée ou entretien contraire aux recommandations.</p><p>Pour ouvrir une demande, contactez-nous avec le numéro de commande, des photos nettes et une description du problème.</p>','Garantie 1 an','','inherit','closed','closed','','60-revision-v1','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',60,'http://localhost:8080/?p=95',0,'revision','',0),
(96,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Retour de produit</h2><p>Vous pouvez demander un retour depuis cette page. Indiquez le numéro de commande, l’email utilisé et le motif de la demande.</p><p>Adresse de retour : <span class=\"legal-missing\">[À compléter : adresse de retour]</span>.</p><p>Les retours doivent être envoyés complets, protégés, non abîmés et accompagnés des informations de commande.</p>[bagueship_withdrawal_form]','Rétractation','','inherit','closed','closed','','61-revision-v1','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',61,'http://localhost:8080/?p=96',0,'revision','',0),
(97,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Devenir ambassadeur / ambassadrice</h2><p>Eclipse recherche des profils capables de porter l’univers de la marque avec sincérité : créateurs, modèles, stylistes, photographes, artistes, ou simplement personnes avec une vraie présence visuelle.</p><p>Présentez-vous brièvement, ajoutez vos réseaux et expliquez pourquoi l’univers Eclipse vous parle.</p>[bagueship_ambassador_form]','Devenir ambassadeur / ambassadrice','','inherit','closed','closed','','62-revision-v1','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',62,'http://localhost:8080/?p=97',0,'revision','',0),
(98,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Maintenance</h2><p>La boutique est temporairement indisponible pendant une opération de maintenance.</p>','Maintenance','','inherit','closed','closed','','63-revision-v1','','','2026-07-20 16:28:17','2026-07-20 16:28:17','',63,'http://localhost:8080/?p=98',0,'revision','',0),
(99,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','<h2>Paiement échoué</h2><p>Le paiement n’a pas pu être validé. Vous pouvez réessayer ou retourner à la boutique.</p><p><a class=\"button\" href=\"http://localhost:8080/boutique/\">Retour boutique</a></p>','Paiement échoué','','inherit','closed','closed','','64-revision-v1','','','2026-07-20 16:28:17','2026-07-20 16:28:17','',64,'http://localhost:8080/?p=99',0,'revision','',0),
(108,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','','Accueil','','inherit','closed','closed','','10-revision-v1','','','2026-07-20 16:28:17','2026-07-20 16:28:17','',10,'http://localhost:8080/?p=108',0,'revision','',0),
(109,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','','Boutique','','inherit','closed','closed','','11-revision-v1','','','2026-07-20 16:28:17','2026-07-20 16:28:17','',11,'http://localhost:8080/?p=109',0,'revision','',0),
(110,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','[woocommerce_cart]','Panier','','inherit','closed','closed','','12-revision-v1','','','2026-07-20 16:28:17','2026-07-20 16:28:17','',12,'http://localhost:8080/?p=110',0,'revision','',0),
(111,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','[woocommerce_checkout]','Commande','','inherit','closed','closed','','13-revision-v1','','','2026-07-20 16:28:17','2026-07-20 16:28:17','',13,'http://localhost:8080/?p=111',0,'revision','',0),
(112,0,'2026-07-20 16:28:17','2026-07-20 16:28:17','La commande invitée reste active, et la création de compte est proposée en fin de commande.','Mon compte','','inherit','closed','closed','','14-revision-v1','','','2026-07-20 16:28:17','2026-07-20 16:28:17','',14,'http://localhost:8080/?p=112',0,'revision','',0),
(187,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Abstract Openwork Cuff - 52','taille: 52','publish','closed','closed','','abstract-openwork-cuff-52','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',15,'http://localhost:8080/?post_type=product_variation&p=187',0,'product_variation','',0),
(188,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Abstract Openwork Cuff - 54','taille: 54','publish','closed','closed','','abstract-openwork-cuff-54','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',15,'http://localhost:8080/?post_type=product_variation&p=188',0,'product_variation','',0),
(189,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Abstract Openwork Cuff - 56','taille: 56','publish','closed','closed','','abstract-openwork-cuff-56','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',15,'http://localhost:8080/?post_type=product_variation&p=189',0,'product_variation','',0),
(190,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Abstract Openwork Cuff - 58','taille: 58','publish','closed','closed','','abstract-openwork-cuff-58','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',15,'http://localhost:8080/?post_type=product_variation&p=190',0,'product_variation','',0),
(191,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Abstract Openwork Cuff - 60','taille: 60','publish','closed','closed','','abstract-openwork-cuff-60','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',15,'http://localhost:8080/?post_type=product_variation&p=191',0,'product_variation','',0),
(192,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Abstract Openwork Cuff - 62','taille: 62','publish','closed','closed','','abstract-openwork-cuff-62','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',15,'http://localhost:8080/?post_type=product_variation&p=192',0,'product_variation','',0),
(193,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Wavy Silver Cuff - 52','taille: 52','publish','closed','closed','','wavy-silver-cuff-52','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',22,'http://localhost:8080/?post_type=product_variation&p=193',0,'product_variation','',0),
(194,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Wavy Silver Cuff - 54','taille: 54','publish','closed','closed','','wavy-silver-cuff-54','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',22,'http://localhost:8080/?post_type=product_variation&p=194',0,'product_variation','',0),
(195,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Wavy Silver Cuff - 56','taille: 56','publish','closed','closed','','wavy-silver-cuff-56','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',22,'http://localhost:8080/?post_type=product_variation&p=195',0,'product_variation','',0),
(196,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Wavy Silver Cuff - 58','taille: 58','publish','closed','closed','','wavy-silver-cuff-58','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',22,'http://localhost:8080/?post_type=product_variation&p=196',0,'product_variation','',0),
(197,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Wavy Silver Cuff - 60','taille: 60','publish','closed','closed','','wavy-silver-cuff-60','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',22,'http://localhost:8080/?post_type=product_variation&p=197',0,'product_variation','',0),
(198,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Wavy Silver Cuff - 62','taille: 62','publish','closed','closed','','wavy-silver-cuff-62','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',22,'http://localhost:8080/?post_type=product_variation&p=198',0,'product_variation','',0),
(199,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Chrome Embrace - 52','taille: 52','publish','closed','closed','','chrome-embrace-52','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',29,'http://localhost:8080/?post_type=product_variation&p=199',0,'product_variation','',0),
(200,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Chrome Embrace - 54','taille: 54','publish','closed','closed','','chrome-embrace-54','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',29,'http://localhost:8080/?post_type=product_variation&p=200',0,'product_variation','',0),
(201,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Chrome Embrace - 56','taille: 56','publish','closed','closed','','chrome-embrace-56','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',29,'http://localhost:8080/?post_type=product_variation&p=201',0,'product_variation','',0),
(202,0,'2026-07-29 17:01:08','2026-07-29 17:01:08','','Chrome Embrace - 58','taille: 58','publish','closed','closed','','chrome-embrace-58','','','2026-07-29 17:01:08','2026-07-29 17:01:08','',29,'http://localhost:8080/?post_type=product_variation&p=202',0,'product_variation','',0),
(203,0,'2026-07-29 17:01:09','2026-07-29 17:01:09','','Chrome Embrace - 60','taille: 60','publish','closed','closed','','chrome-embrace-60','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',29,'http://localhost:8080/?post_type=product_variation&p=203',0,'product_variation','',0),
(204,0,'2026-07-29 17:01:09','2026-07-29 17:01:09','','Chrome Embrace - 62','taille: 62','publish','closed','closed','','chrome-embrace-62','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',29,'http://localhost:8080/?post_type=product_variation&p=204',0,'product_variation','',0),
(205,0,'2026-07-29 17:01:09','2026-07-29 17:01:09','','Curved Bar Silver Ring - 52','taille: 52','publish','closed','closed','','curved-bar-silver-ring-52','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',36,'http://localhost:8080/?post_type=product_variation&p=205',0,'product_variation','',0),
(206,0,'2026-07-29 17:01:09','2026-07-29 17:01:09','','Curved Bar Silver Ring - 54','taille: 54','publish','closed','closed','','curved-bar-silver-ring-54','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',36,'http://localhost:8080/?post_type=product_variation&p=206',0,'product_variation','',0),
(207,0,'2026-07-29 17:01:09','2026-07-29 17:01:09','','Curved Bar Silver Ring - 56','taille: 56','publish','closed','closed','','curved-bar-silver-ring-56','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',36,'http://localhost:8080/?post_type=product_variation&p=207',0,'product_variation','',0),
(208,0,'2026-07-29 17:01:09','2026-07-29 17:01:09','','Curved Bar Silver Ring - 58','taille: 58','publish','closed','closed','','curved-bar-silver-ring-58','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',36,'http://localhost:8080/?post_type=product_variation&p=208',0,'product_variation','',0),
(209,0,'2026-07-29 17:01:09','2026-07-29 17:01:09','','Curved Bar Silver Ring - 60','taille: 60','publish','closed','closed','','curved-bar-silver-ring-60','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',36,'http://localhost:8080/?post_type=product_variation&p=209',0,'product_variation','',0),
(210,0,'2026-07-29 17:01:09','2026-07-29 17:01:09','','Curved Bar Silver Ring - 62','taille: 62','publish','closed','closed','','curved-bar-silver-ring-62','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',36,'http://localhost:8080/?post_type=product_variation&p=210',0,'product_variation','',0),
(211,0,'2026-07-29 17:01:09','2026-07-29 17:01:09',' ','','','publish','closed','closed','','211','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/211/',0,'nav_menu_item','',0),
(212,0,'2026-07-29 17:01:09','2026-07-29 17:01:09',' ','','','publish','closed','closed','','212','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/212/',2,'nav_menu_item','',0),
(213,0,'2026-07-29 17:01:09','2026-07-29 17:01:09',' ','','','publish','closed','closed','','213','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/213/',3,'nav_menu_item','',0),
(214,0,'2026-07-29 17:01:09','2026-07-29 17:01:09',' ','','','publish','closed','closed','','214','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/214/',4,'nav_menu_item','',0),
(215,0,'2026-07-29 17:01:09','2026-07-29 17:01:09',' ','','','publish','closed','closed','','215','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/215/',5,'nav_menu_item','',0),
(216,0,'2026-07-29 17:01:09','2026-07-29 17:01:09',' ','','','publish','closed','closed','','216','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/216/',0,'nav_menu_item','',0),
(217,0,'2026-07-29 17:01:09','2026-07-29 17:01:09',' ','','','publish','closed','closed','','217','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/217/',2,'nav_menu_item','',0),
(218,0,'2026-07-29 17:01:09','2026-07-29 17:01:09',' ','','','publish','closed','closed','','218','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/218/',3,'nav_menu_item','',0),
(219,0,'2026-07-29 17:01:09','2026-07-29 17:01:09',' ','','','publish','closed','closed','','219','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/219/',4,'nav_menu_item','',0),
(220,0,'2026-07-29 17:01:09','2026-07-29 17:01:09',' ','','','publish','closed','closed','','220','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/220/',5,'nav_menu_item','',0),
(221,0,'2026-07-29 17:01:09','2026-07-29 17:01:09',' ','','','publish','closed','closed','','221','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/221/',6,'nav_menu_item','',0),
(222,0,'2026-07-29 17:01:09','2026-07-29 17:01:09',' ','','','publish','closed','closed','','222','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/222/',7,'nav_menu_item','',0),
(223,0,'2026-07-29 17:01:09','2026-07-29 17:01:09',' ','','','publish','closed','closed','','223','','','2026-07-29 17:01:09','2026-07-29 17:01:09','',0,'http://localhost:8080/223/',8,'nav_menu_item','',0),
(224,0,'2026-07-29 17:19:28','2026-07-29 17:19:28','','Promesse','','publish','closed','closed','','promesse','','','2026-07-29 17:19:28','2026-07-29 17:19:28','',0,'http://localhost:8080/promesse/',0,'page','',0),
(225,0,'2026-07-29 17:19:28','2026-07-29 17:19:28','','Promesse','','publish','closed','closed','','promesse','','','2026-07-29 17:19:28','2026-07-29 17:19:28','',0,'http://localhost:8080/promesse/',0,'page','',0),
(226,0,'2026-07-29 19:25:19','2026-07-29 19:25:19','<h2>Mentions légales</h2><p>Cette page permet d’identifier l’éditeur du site Eclipse et les principaux responsables du service.</p><div class=\"legal-card\"><h2>Identité de l’éditeur</h2><p><strong>Éditeur du site :</strong> <span class=\"legal-missing\">[À compléter : raison sociale ou nom commercial]</span></p><p><strong>Forme juridique :</strong> <span class=\"legal-missing\">[À compléter : forme juridique]</span></p><p><strong>Adresse du siège :</strong> <span class=\"legal-missing\">[À compléter : adresse complète]</span></p><p><strong>SIRET :</strong> <span class=\"legal-missing\">[À compléter : numéro SIRET]</span></p><p><strong>TVA intracommunautaire :</strong> <span class=\"legal-missing\">[À compléter : numéro de TVA ou mention non applicable]</span></p><p><strong>Directeur de publication :</strong> <span class=\"legal-missing\">[À compléter : nom du responsable de publication]</span></p><p><strong>Contact :</strong> <span class=\"legal-missing\">[À compléter : adresse email de contact]</span></p><p><strong>Téléphone :</strong> <span class=\"legal-missing\">[À compléter : numéro de téléphone ou mention non disponible]</span></p></div><div class=\"legal-card\"><h2>Hébergement</h2><p><strong>Hébergeur :</strong> <span class=\"legal-missing\">[À compléter : nom, adresse et contact de l’hébergeur]</span></p></div><div class=\"legal-card\"><h2>Propriété intellectuelle</h2><p>Les textes, visuels, modèles 3D, éléments graphiques, logos, interfaces et contenus du site sont protégés. Toute reproduction, extraction, modification ou réutilisation sans autorisation écrite préalable est interdite, sauf exceptions prévues par la loi.</p></div><div class=\"legal-card\"><h2>Données personnelles</h2><p>Pour toute demande liée aux données personnelles, contactez : <span class=\"legal-missing\">[À compléter : contact données personnelles]</span>.</p></div>','Mentions légales','','inherit','closed','closed','','43-revision-v1','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',43,'http://localhost:8080/?p=226',0,'revision','',0),
(227,0,'2026-07-29 19:25:19','2026-07-29 19:25:19','<h2>Conditions générales d’utilisation et de vente</h2><p>Les présentes conditions encadrent l’accès au site Eclipse, la navigation, les commandes, les précommandes, les paiements, la livraison, les retours et les garanties applicables aux bijoux vendus en ligne.</p><h2>1. Identité du vendeur</h2><div class=\"legal-card\"><h2>Identité de l’éditeur</h2><p><strong>Éditeur du site :</strong> <span class=\"legal-missing\">[À compléter : raison sociale ou nom commercial]</span></p><p><strong>Forme juridique :</strong> <span class=\"legal-missing\">[À compléter : forme juridique]</span></p><p><strong>Adresse du siège :</strong> <span class=\"legal-missing\">[À compléter : adresse complète]</span></p><p><strong>SIRET :</strong> <span class=\"legal-missing\">[À compléter : numéro SIRET]</span></p><p><strong>TVA intracommunautaire :</strong> <span class=\"legal-missing\">[À compléter : numéro de TVA ou mention non applicable]</span></p><p><strong>Directeur de publication :</strong> <span class=\"legal-missing\">[À compléter : nom du responsable de publication]</span></p><p><strong>Contact :</strong> <span class=\"legal-missing\">[À compléter : adresse email de contact]</span></p><p><strong>Téléphone :</strong> <span class=\"legal-missing\">[À compléter : numéro de téléphone ou mention non disponible]</span></p></div><h2>2. Produits</h2><p>Eclipse vend des bijoux, principalement des bagues en acier inoxydable. Les caractéristiques essentielles sont indiquées sur chaque fiche produit : modèle, matériau, finition, taille, prix, disponibilité, statut de précommande éventuel et visuel 3D lorsque disponible.</p><h2>3. Prix</h2><p>Les prix sont affichés en euros. Les éventuels frais de livraison, remises, taxes et frais additionnels sont indiqués avant validation de la commande. Pour les précommandes, le prix peut être inférieur au prix public prévu afin de soutenir la fabrication ou le lancement d’une collection.</p><h2>4. Commande</h2><p>Le client sélectionne un produit, une taille, une quantité, puis valide son panier. Avant paiement, un récapitulatif permet de vérifier la commande et de corriger les erreurs éventuelles. La commande devient ferme après confirmation du paiement ou validation du mode de paiement disponible.</p><h2>5. Paiement</h2><p>Le paiement s’effectue via les moyens proposés au moment de la commande. Le site doit afficher clairement le prestataire de paiement actif avant mise en production. Aucune donnée complète de carte bancaire n’est destinée à être stockée par Eclipse.</p><h2>6. Précommandes</h2><p>Une précommande concerne un produit non immédiatement disponible. La fiche produit indique le statut, le prix de soutien et, lorsqu’elle est connue, une estimation d’expédition. En cas de modification significative du délai, le client est informé par email. Les droits légaux du consommateur restent applicables, sauf exception prévue par la loi.</p><h2>7. Livraison</h2><p>La livraison est prévue en France via Mondial Relay. Le délai indicatif est de 1 à 2 semaines et les frais de livraison sont de 3 €, sauf indication différente affichée avant validation de commande. Pour toute question de suivi : <span class=\"legal-missing\">[À compléter : email livraison]</span>. Une page de suivi permet aussi de retrouver les informations de commande lorsque le transporteur les communique.</p><h2>8. Droit de rétractation</h2><p>Conformément aux règles applicables à la vente à distance, le consommateur dispose en principe d’un délai de 14 jours pour exercer son droit de rétractation à compter de la réception du produit. Eclipse ne prévoit pas d’exclusion commerciale spécifique au droit de retour à ce stade, hors limites impératives prévues par la loi. La demande peut être envoyée à : <span class=\"legal-missing\">[À compléter : email rétractation]</span>.</p><h2>9. Retours et remboursements</h2><p>Les produits doivent être retournés complets, non portés au-delà d’un simple essayage, non dégradés et dans leur emballage lorsque cela est possible. L’adresse de retour est : <span class=\"legal-missing\">[À compléter : adresse de retour]</span>. Le remboursement intervient après réception et contrôle du produit retourné, selon le moyen de paiement initial lorsque techniquement possible.</p><h2>10. Garantie commerciale 1 an</h2><p>Eclipse propose une garantie commerciale d’un an couvrant les défauts anormaux de fabrication dans des conditions normales d’usage. Elle ne couvre pas l’usure normale, les rayures liées au port, les chocs, pertes, vols, modifications, mauvaise utilisation ou entretien inadapté. Cette garantie commerciale s’ajoute aux garanties légales.</p><h2>11. Garanties légales</h2><p>Le client bénéficie des garanties légales applicables, notamment la garantie légale de conformité et la garantie contre les vices cachés, dans les conditions prévues par le droit français.</p><h2>12. Données personnelles</h2><p>Les données nécessaires à la commande, au paiement, à la livraison, au service client, à la prévention de la fraude et aux obligations comptables sont traitées conformément à la politique de confidentialité. Contact données personnelles : <span class=\"legal-missing\">[À compléter : contact données personnelles]</span>.</p><h2>13. Cookies</h2><p>Le site peut utiliser des cookies nécessaires à son fonctionnement et, selon les choix de l’utilisateur, des traceurs optionnels. Le consentement peut être accepté, refusé ou modifié depuis la page dédiée.</p><h2>14. Responsabilité</h2><p>Eclipse s’efforce d’assurer l’accès au site et l’exactitude des informations publiées. Des interruptions techniques, erreurs ou évolutions de stock peuvent toutefois survenir. Les photographies, rendus 3D et couleurs peuvent varier selon les écrans.</p><h2>15. Médiation et litiges</h2><p>En cas de litige, le client contacte d’abord Eclipse afin de rechercher une solution amiable. Si le différend persiste, le consommateur peut recourir au médiateur suivant : <span class=\"legal-missing\">[À compléter : médiateur de la consommation]</span> - <span class=\"legal-missing\">[À compléter : URL du médiateur]</span>.</p><h2>16. Droit applicable</h2><p>Les présentes conditions sont soumises au droit français, sous réserve des règles impératives protectrices du consommateur.</p>','CGU','','inherit','closed','closed','','44-revision-v1','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',44,'http://localhost:8080/?p=227',0,'revision','',0),
(228,0,'2026-07-29 19:25:19','2026-07-29 19:25:19','<h2>Conditions générales d’utilisation et de vente</h2><p>Les présentes conditions encadrent l’accès au site Eclipse, la navigation, les commandes, les précommandes, les paiements, la livraison, les retours et les garanties applicables aux bijoux vendus en ligne.</p><h2>1. Identité du vendeur</h2><div class=\"legal-card\"><h2>Identité de l’éditeur</h2><p><strong>Éditeur du site :</strong> <span class=\"legal-missing\">[À compléter : raison sociale ou nom commercial]</span></p><p><strong>Forme juridique :</strong> <span class=\"legal-missing\">[À compléter : forme juridique]</span></p><p><strong>Adresse du siège :</strong> <span class=\"legal-missing\">[À compléter : adresse complète]</span></p><p><strong>SIRET :</strong> <span class=\"legal-missing\">[À compléter : numéro SIRET]</span></p><p><strong>TVA intracommunautaire :</strong> <span class=\"legal-missing\">[À compléter : numéro de TVA ou mention non applicable]</span></p><p><strong>Directeur de publication :</strong> <span class=\"legal-missing\">[À compléter : nom du responsable de publication]</span></p><p><strong>Contact :</strong> <span class=\"legal-missing\">[À compléter : adresse email de contact]</span></p><p><strong>Téléphone :</strong> <span class=\"legal-missing\">[À compléter : numéro de téléphone ou mention non disponible]</span></p></div><h2>2. Produits</h2><p>Eclipse vend des bijoux, principalement des bagues en acier inoxydable. Les caractéristiques essentielles sont indiquées sur chaque fiche produit : modèle, matériau, finition, taille, prix, disponibilité, statut de précommande éventuel et visuel 3D lorsque disponible.</p><h2>3. Prix</h2><p>Les prix sont affichés en euros. Les éventuels frais de livraison, remises, taxes et frais additionnels sont indiqués avant validation de la commande. Pour les précommandes, le prix peut être inférieur au prix public prévu afin de soutenir la fabrication ou le lancement d’une collection.</p><h2>4. Commande</h2><p>Le client sélectionne un produit, une taille, une quantité, puis valide son panier. Avant paiement, un récapitulatif permet de vérifier la commande et de corriger les erreurs éventuelles. La commande devient ferme après confirmation du paiement ou validation du mode de paiement disponible.</p><h2>5. Paiement</h2><p>Le paiement s’effectue via les moyens proposés au moment de la commande. Le site doit afficher clairement le prestataire de paiement actif avant mise en production. Aucune donnée complète de carte bancaire n’est destinée à être stockée par Eclipse.</p><h2>6. Précommandes</h2><p>Une précommande concerne un produit non immédiatement disponible. La fiche produit indique le statut, le prix de soutien et, lorsqu’elle est connue, une estimation d’expédition. En cas de modification significative du délai, le client est informé par email. Les droits légaux du consommateur restent applicables, sauf exception prévue par la loi.</p><h2>7. Livraison</h2><p>La livraison est prévue en France via Mondial Relay. Le délai indicatif est de 1 à 2 semaines et les frais de livraison sont de 3 €, sauf indication différente affichée avant validation de commande. Pour toute question de suivi : <span class=\"legal-missing\">[À compléter : email livraison]</span>. Une page de suivi permet aussi de retrouver les informations de commande lorsque le transporteur les communique.</p><h2>8. Droit de rétractation</h2><p>Conformément aux règles applicables à la vente à distance, le consommateur dispose en principe d’un délai de 14 jours pour exercer son droit de rétractation à compter de la réception du produit. Eclipse ne prévoit pas d’exclusion commerciale spécifique au droit de retour à ce stade, hors limites impératives prévues par la loi. La demande peut être envoyée à : <span class=\"legal-missing\">[À compléter : email rétractation]</span>.</p><h2>9. Retours et remboursements</h2><p>Les produits doivent être retournés complets, non portés au-delà d’un simple essayage, non dégradés et dans leur emballage lorsque cela est possible. L’adresse de retour est : <span class=\"legal-missing\">[À compléter : adresse de retour]</span>. Le remboursement intervient après réception et contrôle du produit retourné, selon le moyen de paiement initial lorsque techniquement possible.</p><h2>10. Garantie commerciale 1 an</h2><p>Eclipse propose une garantie commerciale d’un an couvrant les défauts anormaux de fabrication dans des conditions normales d’usage. Elle ne couvre pas l’usure normale, les rayures liées au port, les chocs, pertes, vols, modifications, mauvaise utilisation ou entretien inadapté. Cette garantie commerciale s’ajoute aux garanties légales.</p><h2>11. Garanties légales</h2><p>Le client bénéficie des garanties légales applicables, notamment la garantie légale de conformité et la garantie contre les vices cachés, dans les conditions prévues par le droit français.</p><h2>12. Données personnelles</h2><p>Les données nécessaires à la commande, au paiement, à la livraison, au service client, à la prévention de la fraude et aux obligations comptables sont traitées conformément à la politique de confidentialité. Contact données personnelles : <span class=\"legal-missing\">[À compléter : contact données personnelles]</span>.</p><h2>13. Cookies</h2><p>Le site peut utiliser des cookies nécessaires à son fonctionnement et, selon les choix de l’utilisateur, des traceurs optionnels. Le consentement peut être accepté, refusé ou modifié depuis la page dédiée.</p><h2>14. Responsabilité</h2><p>Eclipse s’efforce d’assurer l’accès au site et l’exactitude des informations publiées. Des interruptions techniques, erreurs ou évolutions de stock peuvent toutefois survenir. Les photographies, rendus 3D et couleurs peuvent varier selon les écrans.</p><h2>15. Médiation et litiges</h2><p>En cas de litige, le client contacte d’abord Eclipse afin de rechercher une solution amiable. Si le différend persiste, le consommateur peut recourir au médiateur suivant : <span class=\"legal-missing\">[À compléter : médiateur de la consommation]</span> - <span class=\"legal-missing\">[À compléter : URL du médiateur]</span>.</p><h2>16. Droit applicable</h2><p>Les présentes conditions sont soumises au droit français, sous réserve des règles impératives protectrices du consommateur.</p>','Conditions générales de vente','','inherit','closed','closed','','45-revision-v1','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',45,'http://localhost:8080/?p=228',0,'revision','',0),
(229,0,'2026-07-29 19:25:19','2026-07-29 19:25:19','<h2>Politique de confidentialité</h2><p>Cette politique explique comment Eclipse collecte et utilise les données personnelles nécessaires au fonctionnement du site, aux commandes et aux demandes client.</p><h2>Responsable du traitement</h2><p><span class=\"legal-missing\">[À compléter : raison sociale]</span> est responsable des traitements réalisés via le site. Contact données personnelles : <span class=\"legal-missing\">[À compléter : contact données personnelles]</span>.</p><h2>Données collectées</h2><p>Selon les usages du site, les données peuvent inclure : identité, email, téléphone, adresses de facturation et livraison, contenu des messages, informations de commande, historique d’achat, statut de paiement, données techniques de navigation et choix cookies.</p><h2>Finalités</h2><p>Les données sont utilisées pour traiter les commandes, livrer les produits, gérer le service client, envoyer les alertes précommande demandées, respecter les obligations comptables et fiscales, sécuriser le site, gérer les retours et garanties, et améliorer l’expérience lorsque le consentement le permet.</p><h2>Destinataires et outils utilisés ou prévus</h2><p>Les données peuvent être transmises aux prestataires strictement nécessaires : hébergeur OVH, WordPress/WooCommerce pour la boutique, prestataire de paiement Stripe lorsqu’il sera activé, transporteur Mondial Relay, outil de newsletter lorsqu’il sera choisi, réseaux sociaux utilisés pour la communication de marque, outils email, comptabilité et autorités lorsque la loi l’exige.</p><h2>Durées de conservation</h2><p>Les données sont conservées pendant la durée nécessaire à leur finalité : gestion client et commande, obligations comptables, preuve contractuelle, demandes de garantie ou contentieux éventuel. Les durées précises doivent être validées selon l’organisation réelle de Eclipse.</p><h2>Droits</h2><p>Vous pouvez demander l’accès, la rectification, l’effacement, la limitation, l’opposition ou la portabilité de vos données lorsque ces droits s’appliquent. Vous pouvez aussi retirer votre consentement pour les traitements fondés sur celui-ci.</p>[bagueship_personal_data_request_form]','Politique de confidentialité','','inherit','closed','closed','','47-revision-v1','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',47,'http://localhost:8080/?p=229',0,'revision','',0),
(230,0,'2026-07-29 19:25:19','2026-07-29 19:25:19','<h2>Livraison et retours</h2><p>La livraison est prévue en France via Mondial Relay. Le délai indicatif est de 1 à 2 semaines et les frais de livraison sont de 3 €, sauf indication différente affichée avant validation de commande.</p><p>Les retours sont traités via la page Retour de produit. Eclipse ne prévoit pas d’exclusion commerciale spécifique au droit de retour à ce stade, hors limites impératives prévues par la loi.</p><p>Contact livraison : <span class=\"legal-missing\">[À compléter : email livraison]</span>.</p>','Livraison et retours','','inherit','closed','closed','','50-revision-v1','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',50,'http://localhost:8080/?p=230',0,'revision','',0),
(231,0,'2026-07-29 19:25:19','2026-07-29 19:25:19','<h2>À propos</h2><p>Eclipse construit un univers de bijoux en acier, sculptural, sombre et accessible, avec des pièces pensées comme des objets visuels forts.</p>','À propos','','inherit','closed','closed','','53-revision-v1','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',53,'http://localhost:8080/?p=231',0,'revision','',0),
(232,0,'2026-07-29 19:25:19','2026-07-29 19:25:19','<h2>Garantie 1 an</h2><p>Chaque bague Eclipse bénéficie d’une garantie commerciale d’un an contre les défauts anormaux de fabrication constatés dans des conditions normales d’usage.</p><p>La garantie ne couvre pas l’usure normale, les rayures, chocs, pertes, vols, modifications, mauvaise utilisation, exposition inadaptée ou entretien contraire aux recommandations.</p><p>Pour ouvrir une demande, contactez-nous avec le numéro de commande, des photos nettes et une description du problème.</p>','Garantie 1 an','','inherit','closed','closed','','60-revision-v1','','','2026-07-29 19:25:19','2026-07-29 19:25:19','',60,'http://localhost:8080/?p=232',0,'revision','',0),
(233,0,'2026-07-29 19:25:19','2026-07-29 19:25:19','<h2>Devenir ambassadeur / ambassadrice</h2><p>Eclipse recherche des profils capables de porter l’univers de la marque avec sincérité : créateurs, modèles, stylistes, photographes, artistes, ou simplement personnes avec une vraie présence visuelle.</p><p>Présentez-vous brièvement, ajoutez vos réseaux et expliquez pourquoi l’univers Eclipse vous parle.</p>[bagueship_ambassador_form]','Devenir ambassadeur / ambassadrice','','inherit','closed','closed','','62-revision-v1','','','2026-07-29 19:26:18','2026-07-29 19:26:18','',62,'http://localhost:8080/?p=233',0,'revision','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES
(1,1,0),
(15,4,0),
(15,16,0),
(22,4,0),
(22,16,0),
(29,4,0),
(29,17,0),
(36,4,0),
(36,17,0),
(211,18,0),
(212,18,0),
(213,18,0),
(214,18,0),
(215,18,0),
(216,19,0),
(217,19,0),
(218,19,0),
(219,19,0),
(220,19,0),
(221,19,0),
(222,19,0),
(223,19,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES
(1,1,'category','',0,1),
(2,2,'product_type','',0,0),
(3,3,'product_type','',0,0),
(4,4,'product_type','',0,4),
(5,5,'product_type','',0,0),
(6,6,'product_visibility','',0,0),
(7,7,'product_visibility','',0,0),
(8,8,'product_visibility','',0,0),
(9,9,'product_visibility','',0,0),
(10,10,'product_visibility','',0,0),
(11,11,'product_visibility','',0,0),
(12,12,'product_visibility','',0,0),
(13,13,'product_visibility','',0,0),
(14,14,'product_visibility','',0,0),
(15,15,'product_cat','',0,0),
(16,16,'product_cat','',0,2),
(17,17,'product_cat','',0,2),
(18,18,'nav_menu','',0,5),
(19,19,'nav_menu','',0,8);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
INSERT INTO `wp_termmeta` VALUES
(1,16,'bagueship_tagline','Volumes ouverts, lignes sculpturales et reflets francs.'),
(2,16,'bagueship_price_from','À partir de 380 €'),
(3,16,'bagueship_status','Disponible'),
(4,16,'bagueship_collection_state','available'),
(5,16,'bagueship_order','1'),
(6,17,'bagueship_tagline','Courbes portées près du doigt, acier miroir et profils enveloppants.'),
(7,17,'bagueship_price_from','À partir de 340 €'),
(8,17,'bagueship_status','Disponible'),
(9,17,'bagueship_collection_state','available'),
(10,17,'bagueship_order','2'),
(11,15,'product_count_product_cat','0'),
(12,16,'product_count_product_cat','2'),
(13,17,'product_count_product_cat','2');
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES
(1,'Uncategorized','uncategorized',0),
(2,'simple','simple',0),
(3,'grouped','grouped',0),
(4,'variable','variable',0),
(5,'external','external',0),
(6,'exclude-from-search','exclude-from-search',0),
(7,'exclude-from-catalog','exclude-from-catalog',0),
(8,'featured','featured',0),
(9,'outofstock','outofstock',0),
(10,'rated-1','rated-1',0),
(11,'rated-2','rated-2',0),
(12,'rated-3','rated-3',0),
(13,'rated-4','rated-4',0),
(14,'rated-5','rated-5',0),
(15,'Uncategorized','uncategorized',0),
(16,'Abstract','abstract',0),
(17,'Finger','finger',0),
(18,'Primary','primary',0),
(19,'Footer','footer',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES
(1,1,'nickname','admin'),
(2,1,'first_name',''),
(3,1,'last_name',''),
(4,1,'description',''),
(5,1,'rich_editing','true'),
(6,1,'syntax_highlighting','true'),
(7,1,'comment_shortcuts','false'),
(8,1,'admin_color','modern'),
(9,1,'use_ssl','0'),
(10,1,'show_admin_bar_front','true'),
(11,1,'locale',''),
(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
(13,1,'wp_user_level','10'),
(14,1,'dismissed_wp_pointers',''),
(15,1,'show_welcome_panel','1');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES
(1,'admin','$wp$2y$10$NwNh6.e1c41T89cs0MoiqOR7ivf1UaF/r.pFHLsWI/RWDCXRNCwxa','admin','admin@bagueship.local','http://localhost:8080','2026-07-20 16:28:14','',0,'admin');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_admin_note_actions`
--

DROP TABLE IF EXISTS `wp_wc_admin_note_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_admin_note_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `note_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  `status` varchar(255) NOT NULL,
  `actioned_text` varchar(255) NOT NULL,
  `nonce_action` varchar(255) DEFAULT NULL,
  `nonce_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `note_id` (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_admin_note_actions`
--

LOCK TABLES `wp_wc_admin_note_actions` WRITE;
/*!40000 ALTER TABLE `wp_wc_admin_note_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_admin_note_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_admin_notes`
--

DROP TABLE IF EXISTS `wp_wc_admin_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_admin_notes` (
  `note_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `locale` varchar(20) NOT NULL,
  `title` longtext NOT NULL,
  `content` longtext NOT NULL,
  `content_data` longtext DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `source` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` datetime DEFAULT NULL,
  `is_snoozable` tinyint(1) NOT NULL DEFAULT 0,
  `layout` varchar(20) NOT NULL DEFAULT '',
  `image` varchar(200) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `icon` varchar(200) NOT NULL DEFAULT 'info',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_admin_notes`
--

LOCK TABLES `wp_wc_admin_notes` WRITE;
/*!40000 ALTER TABLE `wp_wc_admin_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_admin_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_category_lookup`
--

DROP TABLE IF EXISTS `wp_wc_category_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_category_lookup` (
  `category_tree_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`category_tree_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_category_lookup`
--

LOCK TABLES `wp_wc_category_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_category_lookup` DISABLE KEYS */;
INSERT INTO `wp_wc_category_lookup` VALUES
(16,16),
(17,17);
/*!40000 ALTER TABLE `wp_wc_category_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_customer_lookup`
--

DROP TABLE IF EXISTS `wp_wc_customer_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_customer_lookup` (
  `customer_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `username` varchar(60) NOT NULL DEFAULT '',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` char(2) NOT NULL DEFAULT '',
  `postcode` varchar(20) NOT NULL DEFAULT '',
  `city` varchar(100) NOT NULL DEFAULT '',
  `state` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_customer_lookup`
--

LOCK TABLES `wp_wc_customer_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_customer_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_customer_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_download_log`
--

DROP TABLE IF EXISTS `wp_wc_download_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_download_log` (
  `download_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `user_ip_address` varchar(100) DEFAULT '',
  PRIMARY KEY (`download_log_id`),
  KEY `permission_id` (`permission_id`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_download_log`
--

LOCK TABLES `wp_wc_download_log` WRITE;
/*!40000 ALTER TABLE `wp_wc_download_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_download_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_coupon_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_coupon_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_coupon_lookup` (
  `order_id` bigint(20) unsigned NOT NULL,
  `coupon_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount_amount` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_id`,`coupon_id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_coupon_lookup`
--

LOCK TABLES `wp_wc_order_coupon_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_coupon_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_coupon_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_product_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_product_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_product_lookup` (
  `order_item_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `variation_id` bigint(20) unsigned NOT NULL,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `product_qty` int(11) NOT NULL,
  `product_net_revenue` double NOT NULL DEFAULT 0,
  `product_gross_revenue` double NOT NULL DEFAULT 0,
  `coupon_amount` double NOT NULL DEFAULT 0,
  `tax_amount` double NOT NULL DEFAULT 0,
  `shipping_amount` double NOT NULL DEFAULT 0,
  `shipping_tax_amount` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_item_id`,`order_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  KEY `date_created` (`date_created`),
  KEY `customer_product_date` (`customer_id`,`product_id`,`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_product_lookup`
--

LOCK TABLES `wp_wc_order_product_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_product_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_product_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_stats`
--

DROP TABLE IF EXISTS `wp_wc_order_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_stats` (
  `order_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_paid` datetime DEFAULT '0000-00-00 00:00:00',
  `date_completed` datetime DEFAULT '0000-00-00 00:00:00',
  `num_items_sold` int(11) NOT NULL DEFAULT 0,
  `total_sales` double NOT NULL DEFAULT 0,
  `tax_total` double NOT NULL DEFAULT 0,
  `shipping_total` double NOT NULL DEFAULT 0,
  `net_total` double NOT NULL DEFAULT 0,
  `returning_customer` tinyint(1) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `customer_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `date_created` (`date_created`),
  KEY `customer_id` (`customer_id`),
  KEY `status` (`status`),
  KEY `idx_date_paid_status_parent` (`date_paid`,`status`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_stats`
--

LOCK TABLES `wp_wc_order_stats` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_order_tax_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_tax_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_order_tax_lookup` (
  `order_id` bigint(20) unsigned NOT NULL,
  `tax_rate_id` bigint(20) unsigned NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_tax` double NOT NULL DEFAULT 0,
  `order_tax` double NOT NULL DEFAULT 0,
  `total_tax` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_id`,`tax_rate_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_order_tax_lookup`
--

LOCK TABLES `wp_wc_order_tax_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_order_tax_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_order_tax_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_product_attributes_lookup`
--

DROP TABLE IF EXISTS `wp_wc_product_attributes_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_product_attributes_lookup` (
  `product_id` bigint(20) NOT NULL,
  `product_or_parent_id` bigint(20) NOT NULL,
  `taxonomy` varchar(32) NOT NULL,
  `term_id` bigint(20) NOT NULL,
  `is_variation_attribute` tinyint(1) NOT NULL,
  `in_stock` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_or_parent_id`,`term_id`,`product_id`,`taxonomy`),
  KEY `is_variation_attribute_term_id` (`is_variation_attribute`,`term_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_product_attributes_lookup`
--

LOCK TABLES `wp_wc_product_attributes_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_product_attributes_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_product_attributes_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_product_download_directories`
--

DROP TABLE IF EXISTS `wp_wc_product_download_directories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_product_download_directories` (
  `url_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(256) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`url_id`),
  KEY `url` (`url`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_product_download_directories`
--

LOCK TABLES `wp_wc_product_download_directories` WRITE;
/*!40000 ALTER TABLE `wp_wc_product_download_directories` DISABLE KEYS */;
INSERT INTO `wp_wc_product_download_directories` VALUES
(1,'file:///var/www/html/wp-content/uploads/woocommerce_uploads/',1),
(2,'http://localhost:8080/wp-content/uploads/woocommerce_uploads/',1);
/*!40000 ALTER TABLE `wp_wc_product_download_directories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_product_meta_lookup`
--

DROP TABLE IF EXISTS `wp_wc_product_meta_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_product_meta_lookup` (
  `product_id` bigint(20) NOT NULL,
  `sku` varchar(100) DEFAULT '',
  `global_unique_id` varchar(100) DEFAULT '',
  `virtual` tinyint(1) DEFAULT 0,
  `downloadable` tinyint(1) DEFAULT 0,
  `min_price` decimal(19,4) DEFAULT NULL,
  `max_price` decimal(19,4) DEFAULT NULL,
  `onsale` tinyint(1) DEFAULT 0,
  `stock_quantity` double DEFAULT NULL,
  `stock_status` varchar(100) DEFAULT 'instock',
  `rating_count` bigint(20) DEFAULT 0,
  `average_rating` decimal(3,2) DEFAULT 0.00,
  `total_sales` bigint(20) DEFAULT 0,
  `tax_status` varchar(100) DEFAULT 'taxable',
  `tax_class` varchar(100) DEFAULT '',
  PRIMARY KEY (`product_id`),
  KEY `virtual` (`virtual`),
  KEY `downloadable` (`downloadable`),
  KEY `stock_status` (`stock_status`),
  KEY `stock_quantity` (`stock_quantity`),
  KEY `onsale` (`onsale`),
  KEY `min_max_price` (`min_price`,`max_price`),
  KEY `sku` (`sku`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_product_meta_lookup`
--

LOCK TABLES `wp_wc_product_meta_lookup` WRITE;
/*!40000 ALTER TABLE `wp_wc_product_meta_lookup` DISABLE KEYS */;
INSERT INTO `wp_wc_product_meta_lookup` VALUES
(15,'BAG-ABSTRACT-OPENWORK','',0,0,380.0000,380.0000,0,NULL,'instock',0,0.00,0,'taxable',''),
(22,'BAG-ABSTRACT-WAVY','',0,0,420.0000,420.0000,0,NULL,'instock',0,0.00,0,'taxable',''),
(29,'BAG-FINGER-CHROME','',0,0,360.0000,360.0000,0,NULL,'instock',0,0.00,0,'taxable',''),
(36,'BAG-FINGER-CURVED','',0,0,340.0000,340.0000,0,NULL,'instock',0,0.00,0,'taxable',''),
(187,'BAG-ABSTRACT-OPENWORK-52','',0,0,380.0000,380.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(188,'BAG-ABSTRACT-OPENWORK-54','',0,0,380.0000,380.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(189,'BAG-ABSTRACT-OPENWORK-56','',0,0,380.0000,380.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(190,'BAG-ABSTRACT-OPENWORK-58','',0,0,380.0000,380.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(191,'BAG-ABSTRACT-OPENWORK-60','',0,0,380.0000,380.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(192,'BAG-ABSTRACT-OPENWORK-62','',0,0,380.0000,380.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(193,'BAG-ABSTRACT-WAVY-52','',0,0,420.0000,420.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(194,'BAG-ABSTRACT-WAVY-54','',0,0,420.0000,420.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(195,'BAG-ABSTRACT-WAVY-56','',0,0,420.0000,420.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(196,'BAG-ABSTRACT-WAVY-58','',0,0,420.0000,420.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(197,'BAG-ABSTRACT-WAVY-60','',0,0,420.0000,420.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(198,'BAG-ABSTRACT-WAVY-62','',0,0,420.0000,420.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(199,'BAG-FINGER-CHROME-52','',0,0,360.0000,360.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(200,'BAG-FINGER-CHROME-54','',0,0,360.0000,360.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(201,'BAG-FINGER-CHROME-56','',0,0,360.0000,360.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(202,'BAG-FINGER-CHROME-58','',0,0,360.0000,360.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(203,'BAG-FINGER-CHROME-60','',0,0,360.0000,360.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(204,'BAG-FINGER-CHROME-62','',0,0,360.0000,360.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(205,'BAG-FINGER-CURVED-52','',0,0,340.0000,340.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(206,'BAG-FINGER-CURVED-54','',0,0,340.0000,340.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(207,'BAG-FINGER-CURVED-56','',0,0,340.0000,340.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(208,'BAG-FINGER-CURVED-58','',0,0,340.0000,340.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(209,'BAG-FINGER-CURVED-60','',0,0,340.0000,340.0000,0,8,'instock',0,0.00,0,'taxable','parent'),
(210,'BAG-FINGER-CURVED-62','',0,0,340.0000,340.0000,0,8,'instock',0,0.00,0,'taxable','parent');
/*!40000 ALTER TABLE `wp_wc_product_meta_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_rate_limits`
--

DROP TABLE IF EXISTS `wp_wc_rate_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_rate_limits` (
  `rate_limit_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rate_limit_key` varchar(200) NOT NULL,
  `rate_limit_expiry` bigint(20) unsigned NOT NULL,
  `rate_limit_remaining` smallint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rate_limit_id`),
  UNIQUE KEY `rate_limit_key` (`rate_limit_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_rate_limits`
--

LOCK TABLES `wp_wc_rate_limits` WRITE;
/*!40000 ALTER TABLE `wp_wc_rate_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_rate_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_reserved_stock`
--

DROP TABLE IF EXISTS `wp_wc_reserved_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_reserved_stock` (
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `stock_quantity` double NOT NULL DEFAULT 0,
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id_expires` (`product_id`,`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_reserved_stock`
--

LOCK TABLES `wp_wc_reserved_stock` WRITE;
/*!40000 ALTER TABLE `wp_wc_reserved_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_reserved_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_tax_rate_classes`
--

DROP TABLE IF EXISTS `wp_wc_tax_rate_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_tax_rate_classes` (
  `tax_rate_class_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_class_id`),
  UNIQUE KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_tax_rate_classes`
--

LOCK TABLES `wp_wc_tax_rate_classes` WRITE;
/*!40000 ALTER TABLE `wp_wc_tax_rate_classes` DISABLE KEYS */;
INSERT INTO `wp_wc_tax_rate_classes` VALUES
(1,'Reduced rate','reduced-rate'),
(2,'Zero rate','zero-rate');
/*!40000 ALTER TABLE `wp_wc_tax_rate_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_wc_webhooks`
--

DROP TABLE IF EXISTS `wp_wc_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_wc_webhooks` (
  `webhook_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(200) NOT NULL,
  `name` text NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `delivery_url` text NOT NULL,
  `secret` text NOT NULL,
  `topic` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT 0,
  `pending_delivery` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`webhook_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_wc_webhooks`
--

LOCK TABLES `wp_wc_webhooks` WRITE;
/*!40000 ALTER TABLE `wp_wc_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_wc_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_api_keys`
--

DROP TABLE IF EXISTS `wp_woocommerce_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `permissions` varchar(10) NOT NULL,
  `consumer_key` char(64) NOT NULL,
  `consumer_secret` char(43) NOT NULL,
  `nonces` longtext DEFAULT NULL,
  `truncated_key` char(7) NOT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `consumer_key` (`consumer_key`),
  KEY `consumer_secret` (`consumer_secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_api_keys`
--

LOCK TABLES `wp_woocommerce_api_keys` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_attribute_taxonomies`
--

DROP TABLE IF EXISTS `wp_woocommerce_attribute_taxonomies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) NOT NULL,
  `attribute_label` varchar(200) DEFAULT NULL,
  `attribute_type` varchar(20) NOT NULL,
  `attribute_orderby` varchar(20) NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_attribute_taxonomies`
--

LOCK TABLES `wp_woocommerce_attribute_taxonomies` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_attribute_taxonomies` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_attribute_taxonomies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_downloadable_product_permissions`
--

DROP TABLE IF EXISTS `wp_woocommerce_downloadable_product_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `download_id` varchar(36) NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `order_key` varchar(200) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `downloads_remaining` varchar(9) DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  KEY `order_id` (`order_id`),
  KEY `user_order_remaining_expires` (`user_id`,`order_id`,`downloads_remaining`,`access_expires`),
  KEY `idx_user_email` (`user_email`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_downloadable_product_permissions`
--

LOCK TABLES `wp_woocommerce_downloadable_product_permissions` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_downloadable_product_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_downloadable_product_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_log`
--

DROP TABLE IF EXISTS `wp_woocommerce_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `context` longtext DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_log`
--

LOCK TABLES `wp_woocommerce_log` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_order_itemmeta`
--

DROP TABLE IF EXISTS `wp_woocommerce_order_itemmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_order_itemmeta`
--

LOCK TABLES `wp_woocommerce_order_itemmeta` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_order_itemmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_order_itemmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_order_items`
--

DROP TABLE IF EXISTS `wp_woocommerce_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_name` text NOT NULL,
  `order_item_type` varchar(200) NOT NULL DEFAULT '',
  `order_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_order_items`
--

LOCK TABLES `wp_woocommerce_order_items` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_payment_tokenmeta`
--

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokenmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_token_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `payment_token_id` (`payment_token_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_payment_tokenmeta`
--

LOCK TABLES `wp_woocommerce_payment_tokenmeta` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokenmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokenmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_payment_tokens`
--

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gateway_id` varchar(200) NOT NULL,
  `token` text NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `type` varchar(200) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`token_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_payment_tokens`
--

LOCK TABLES `wp_woocommerce_payment_tokens` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_payment_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_sessions`
--

DROP TABLE IF EXISTS `wp_woocommerce_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_key` char(32) NOT NULL,
  `session_value` longtext NOT NULL,
  `session_expiry` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `session_key` (`session_key`),
  KEY `session_expiry` (`session_expiry`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_sessions`
--

LOCK TABLES `wp_woocommerce_sessions` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_sessions` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_sessions` VALUES
(1,'t_d7d01ef7ea36c6d06066a1d17097c6','a:8:{s:22:\"shipping_for_package_0\";s:866:\"a:2:{s:12:\"package_hash\";s:40:\"wc_ship_88356ff48f3f5f2d798aa0011926dab6\";s:5:\"rates\";a:2:{s:11:\"flat_rate:1\";O:16:\"WC_Shipping_Rate\":2:{s:7:\"\0*\0data\";a:9:{s:2:\"id\";s:11:\"flat_rate:1\";s:9:\"method_id\";s:9:\"flat_rate\";s:11:\"instance_id\";i:1;s:5:\"label\";s:9:\"Flat rate\";s:4:\"cost\";s:1:\"0\";s:5:\"taxes\";a:0:{}s:10:\"tax_status\";s:7:\"taxable\";s:11:\"description\";s:0:\"\";s:13:\"delivery_time\";s:0:\"\";}s:12:\"\0*\0meta_data\";a:1:{s:5:\"Items\";s:31:\"Wavy Silver Cuff - 52 &times; 1\";}}s:15:\"free_shipping:2\";O:16:\"WC_Shipping_Rate\":2:{s:7:\"\0*\0data\";a:9:{s:2:\"id\";s:15:\"free_shipping:2\";s:9:\"method_id\";s:13:\"free_shipping\";s:11:\"instance_id\";i:2;s:5:\"label\";s:13:\"Free shipping\";s:4:\"cost\";s:1:\"0\";s:5:\"taxes\";a:0:{}s:10:\"tax_status\";s:7:\"taxable\";s:11:\"description\";s:0:\"\";s:13:\"delivery_time\";s:0:\"\";}s:12:\"\0*\0meta_data\";a:1:{s:5:\"Items\";s:31:\"Wavy Silver Cuff - 52 &times; 1\";}}}}\";s:25:\"previous_shipping_methods\";s:66:\"a:1:{i:0;a:2:{i:0;s:11:\"flat_rate:1\";i:1;s:15:\"free_shipping:2\";}}\";s:23:\"chosen_shipping_methods\";s:29:\"a:1:{i:0;s:11:\"flat_rate:1\";}\";s:22:\"shipping_method_counts\";s:14:\"a:1:{i:0;i:2;}\";s:11:\"cart_totals\";s:396:\"a:15:{s:8:\"subtotal\";s:3:\"420\";s:12:\"subtotal_tax\";d:0;s:14:\"shipping_total\";s:1:\"0\";s:12:\"shipping_tax\";d:0;s:14:\"shipping_taxes\";a:0:{}s:14:\"discount_total\";d:0;s:12:\"discount_tax\";d:0;s:19:\"cart_contents_total\";s:3:\"420\";s:17:\"cart_contents_tax\";i:0;s:19:\"cart_contents_taxes\";a:0:{}s:9:\"fee_total\";s:1:\"0\";s:7:\"fee_tax\";d:0;s:9:\"fee_taxes\";a:0:{}s:5:\"total\";s:6:\"420.00\";s:9:\"total_tax\";d:0;}\";s:4:\"cart\";s:447:\"a:1:{s:32:\"66d62169f72b49a9adf4a773701afb90\";a:11:{s:3:\"key\";s:32:\"66d62169f72b49a9adf4a773701afb90\";s:10:\"product_id\";i:22;s:12:\"variation_id\";i:156;s:9:\"variation\";a:1:{s:16:\"attribute_taille\";s:2:\"52\";}s:8:\"quantity\";i:1;s:9:\"data_hash\";s:32:\"ec2b713beb72d9d53064f26979ace75e\";s:13:\"line_tax_data\";a:2:{s:8:\"subtotal\";a:0:{}s:5:\"total\";a:0:{}}s:13:\"line_subtotal\";d:420;s:17:\"line_subtotal_tax\";d:0;s:10:\"line_total\";d:420;s:8:\"line_tax\";d:0;}}\";s:21:\"chosen_payment_method\";s:14:\"bagueship_test\";s:8:\"customer\";s:740:\"a:28:{s:2:\"id\";s:1:\"0\";s:13:\"date_modified\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:0:\"\";s:7:\"address\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:4:\"city\";s:0:\"\";s:5:\"state\";s:2:\"75\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:2:\"FR\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";s:14:\"shipping_phone\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:14:\"shipping_state\";s:0:\"\";s:17:\"shipping_postcode\";s:0:\"\";s:16:\"shipping_country\";s:2:\"FR\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:9:\"meta_data\";a:0:{}}\";}',1784740566);
/*!40000 ALTER TABLE `wp_woocommerce_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_shipping_zone_locations`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` bigint(20) unsigned NOT NULL,
  `location_code` varchar(200) NOT NULL,
  `location_type` varchar(40) NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `zone_id` (`zone_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_shipping_zone_locations`
--

LOCK TABLES `wp_woocommerce_shipping_zone_locations` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_locations` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_shipping_zone_locations` VALUES
(1,1,'FR','country');
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_shipping_zone_methods`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) unsigned NOT NULL,
  `instance_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `method_id` varchar(200) NOT NULL,
  `method_order` bigint(20) unsigned NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`instance_id`),
  KEY `zone_id` (`zone_id`),
  KEY `method_id` (`method_id`(20))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_shipping_zone_methods`
--

LOCK TABLES `wp_woocommerce_shipping_zone_methods` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_methods` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_shipping_zone_methods` VALUES
(1,1,'flat_rate',1,1),
(1,2,'free_shipping',2,1);
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zone_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_shipping_zones`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(200) NOT NULL,
  `zone_order` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`zone_id`),
  KEY `zone_order_id` (`zone_order`,`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_shipping_zones`
--

LOCK TABLES `wp_woocommerce_shipping_zones` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zones` DISABLE KEYS */;
INSERT INTO `wp_woocommerce_shipping_zones` VALUES
(1,'France',0);
/*!40000 ALTER TABLE `wp_woocommerce_shipping_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_tax_rate_locations`
--

DROP TABLE IF EXISTS `wp_woocommerce_tax_rate_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_code` varchar(200) NOT NULL,
  `tax_rate_id` bigint(20) unsigned NOT NULL,
  `location_type` varchar(40) NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_tax_rate_locations`
--

LOCK TABLES `wp_woocommerce_tax_rate_locations` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rate_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rate_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_woocommerce_tax_rates`
--

DROP TABLE IF EXISTS `wp_woocommerce_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(2) NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) NOT NULL DEFAULT '',
  `tax_rate` varchar(8) NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) unsigned NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT 0,
  `tax_rate_shipping` int(1) NOT NULL DEFAULT 1,
  `tax_rate_order` bigint(20) unsigned NOT NULL,
  `tax_rate_class` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`),
  KEY `tax_rate_state` (`tax_rate_state`(2)),
  KEY `tax_rate_class` (`tax_rate_class`(10)),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_woocommerce_tax_rates`
--

LOCK TABLES `wp_woocommerce_tax_rates` WRITE;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_woocommerce_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-07-29 20:54:54

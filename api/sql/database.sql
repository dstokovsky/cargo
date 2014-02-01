-- MySQL dump 10.13  Distrib 5.5.35, for Linux (x86_64)
--
-- Host: localhost    Database: cargo
-- ------------------------------------------------------
-- Server version	5.5.35

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$toy7JEdqy3NK$Iy4/KhuzKDxOpsMh9KASgLYyXsFhPDZCdXPG1IxittA=','2014-01-26 15:09:32',1,'admin','','','admin@admin.localhost',1,1,'2014-01-26 15:09:14');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4h0t8n0n3xgjbcu3k065hgbeen9ibtr9','MGFmNDUwZjc5NmNjOTlmOTc3MTJmMTcwNTM2Nzg4ZTYyZTUyMWU1Zjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-02-09 15:09:33');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `surname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `age` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name_idx` (`firstname`,`surname`),
  KEY `created_at_idx` (`created_at`),
  KEY `updated_at_idx` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Paul','Crowe',28,'male','2014-01-23 21:08:26','2014-01-28 17:27:32'),(2,'Rob','Fitz',23,'male','2014-01-23 21:09:25','2014-01-23 21:09:25'),(3,'Ben','O\'Carolan',0,'male','2014-01-28 16:33:40','2014-01-28 16:33:40'),(4,'Victor','',28,'male','2014-01-28 16:36:39','2014-01-28 16:36:39'),(5,'Peter','Mac',29,'male','2014-01-28 16:37:11','2014-01-28 16:37:11'),(6,'John','Barry',18,'male','2014-01-28 16:37:40','2014-01-28 16:37:40'),(7,'Sarah','Lane',30,'female','2014-01-28 16:38:07','2014-01-28 16:38:07'),(8,'Susan','Downe',28,'female','2014-01-28 16:39:15','2014-01-28 16:39:15'),(9,'Jack','Stam',28,'male','2014-01-28 16:39:40','2014-01-28 16:39:40'),(10,'Amy','Lane',24,'female','2014-01-28 16:40:01','2014-01-28 16:40:01'),(11,'Sandra','Phelan',28,'female','2014-01-28 16:40:22','2014-01-28 16:40:22'),(12,'Laura','Murphy',33,'female','2014-01-28 16:41:04','2014-01-28 16:41:04'),(13,'Lisa','Daly',28,'female','2014-01-28 16:41:37','2014-01-28 16:41:37'),(14,'Mark','Johnson',28,'male','2014-01-28 17:42:11','2014-01-28 17:42:11'),(15,'Seamus','Crowe',24,'male','2014-01-28 16:41:59','2014-01-28 16:41:59'),(16,'Daren','Slater',28,'male','2014-01-28 16:42:26','2014-01-28 16:42:26'),(17,'Dara','Zoltan',48,'male','2014-01-28 16:42:49','2014-01-28 16:42:49'),(18,'Marie','D',28,'female','2014-01-28 16:43:09','2014-01-28 16:43:09'),(19,'Catriona','Long',28,'female','2014-01-28 16:43:33','2014-01-28 16:43:33'),(20,'Katy','Couch',28,'female','2014-01-28 16:43:57','2014-01-28 16:43:57');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_friends`
--

DROP TABLE IF EXISTS `user_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_friends` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `friend_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_friend_unq_idx` (`user_id`,`friend_id`),
  KEY `friend_id_fk_idx` (`friend_id`),
  KEY `created_at_idx` (`created_at`),
  KEY `updated_at_idx` (`updated_at`),
  CONSTRAINT `user_friends_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `user_friends_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_friends`
--

LOCK TABLES `user_friends` WRITE;
/*!40000 ALTER TABLE `user_friends` DISABLE KEYS */;
INSERT INTO `user_friends` VALUES (1,1,2,'2014-01-28 19:29:47','2014-01-28 19:29:47'),(2,2,1,'2014-01-28 19:30:13','2014-01-28 19:30:13'),(3,2,3,'2014-01-28 19:30:13','2014-01-28 19:30:13'),(4,3,2,'2014-01-28 19:31:53','2014-01-28 19:31:53'),(5,3,4,'2014-01-28 19:31:53','2014-01-28 19:31:53'),(6,3,5,'2014-01-28 19:31:53','2014-01-28 19:31:53'),(7,3,7,'2014-01-28 19:31:53','2014-01-28 19:31:53'),(8,4,3,'2014-01-28 19:35:32','2014-01-28 19:35:32'),(9,5,3,'2014-01-28 19:37:08','2014-01-28 19:37:08'),(10,5,6,'2014-01-28 19:37:08','2014-01-28 19:37:08'),(11,5,11,'2014-01-28 19:37:08','2014-01-28 19:37:08'),(12,5,10,'2014-01-28 19:37:08','2014-01-28 19:37:08'),(13,5,7,'2014-01-28 19:37:22','2014-01-28 19:37:22'),(14,6,5,'2014-01-28 19:37:58','2014-01-28 19:37:58'),(15,7,3,'2014-01-28 19:39:42','2014-01-28 19:39:42'),(16,7,5,'2014-01-28 19:39:42','2014-01-28 19:39:42'),(17,7,12,'2014-01-28 19:39:42','2014-01-28 19:39:42'),(18,7,8,'2014-01-28 19:40:07','2014-01-28 19:40:07'),(19,7,20,'2014-01-28 19:44:13','2014-01-28 19:44:13'),(20,8,7,'2014-01-28 19:44:51','2014-01-28 19:44:51'),(21,9,12,'2014-01-28 19:45:15','2014-01-28 19:45:15'),(22,10,5,'2014-01-28 19:45:28','2014-01-28 19:45:28'),(23,10,11,'2014-01-28 19:45:33','2014-01-28 19:45:33'),(24,11,5,'2014-01-28 19:45:45','2014-01-28 19:45:45'),(25,11,10,'2014-01-28 19:45:51','2014-01-28 19:45:51'),(26,11,19,'2014-01-28 19:45:59','2014-01-28 19:45:59'),(27,11,20,'2014-01-28 19:46:04','2014-01-28 19:46:04'),(28,12,7,'2014-01-28 19:47:06','2014-01-28 19:47:06'),(29,12,9,'2014-01-28 19:47:06','2014-01-28 19:47:06'),(30,12,13,'2014-01-28 19:47:06','2014-01-28 19:47:06'),(31,12,20,'2014-01-28 19:47:28','2014-01-28 19:47:28'),(32,13,12,'2014-01-28 19:48:26','2014-01-28 19:48:26'),(33,13,14,'2014-01-28 19:48:26','2014-01-28 19:48:26'),(34,13,20,'2014-01-28 19:48:26','2014-01-28 19:48:26'),(35,14,13,'2014-01-28 19:49:05','2014-01-28 19:49:05'),(36,14,15,'2014-01-28 19:49:05','2014-01-28 19:49:05'),(37,15,14,'2014-01-28 19:49:24','2014-01-28 19:49:24'),(38,16,18,'2014-01-28 19:49:42','2014-01-28 19:49:42'),(39,16,20,'2014-01-28 19:49:53','2014-01-28 19:49:53'),(40,17,18,'2014-01-28 19:50:08','2014-01-28 19:50:08'),(41,17,20,'2014-01-28 19:50:15','2014-01-28 19:50:15'),(42,18,17,'2014-01-28 19:50:27','2014-01-28 19:50:27'),(43,19,11,'2014-01-28 19:50:44','2014-01-28 19:50:44'),(44,19,20,'2014-01-28 19:50:49','2014-01-28 19:50:49'),(45,20,7,'2014-01-28 19:51:05','2014-01-28 19:51:05'),(46,20,11,'2014-01-28 19:51:12','2014-01-28 19:51:12'),(47,20,12,'2014-01-28 19:51:16','2014-01-28 19:51:16'),(48,20,13,'2014-01-28 19:51:24','2014-01-28 19:51:24'),(49,20,16,'2014-01-28 19:51:29','2014-01-28 19:51:29'),(50,20,17,'2014-01-28 19:51:37','2014-01-28 19:51:37'),(51,20,19,'2014-01-28 19:51:42','2014-01-28 19:51:42');
/*!40000 ALTER TABLE `user_friends` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-02-01 15:38:59

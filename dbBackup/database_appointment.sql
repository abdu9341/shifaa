-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: appointment
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add basic info',7,'add_basicinfo'),(26,'Can change basic info',7,'change_basicinfo'),(27,'Can delete basic info',7,'delete_basicinfo'),(28,'Can view basic info',7,'view_basicinfo'),(29,'Can add department',8,'add_department'),(30,'Can change department',8,'change_department'),(31,'Can delete department',8,'delete_department'),(32,'Can view department',8,'view_department'),(33,'Can add date',9,'add_date'),(34,'Can change date',9,'change_date'),(35,'Can delete date',9,'delete_date'),(36,'Can view date',9,'view_date');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$mJSzP0jcIYD2tUNRYfMhXv$ouN/DM4fin2yoTyEEy9ZfOu+QilCI8JzSKzuCBZtWE8=','2022-03-09 12:59:04.805672',1,'admin','','','admin@gmail.com',1,1,'2022-03-10 06:01:36.534794');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-03-10 06:03:59.041682','1','mondey',1,'[{\"added\": {}}]',9,1),(2,'2022-03-10 06:04:40.485727','2','tuesday',1,'[{\"added\": {}}]',9,1),(3,'2022-03-10 06:04:50.433467','3','wednesday',1,'[{\"added\": {}}]',9,1),(4,'2022-03-10 06:04:54.985645','4','thursday',1,'[{\"added\": {}}]',9,1),(5,'2022-03-10 06:04:59.642068','5','saturday',1,'[{\"added\": {}}]',9,1),(6,'2022-03-10 06:05:04.529697','6','sunday',1,'[{\"added\": {}}]',9,1),(7,'2022-03-10 06:06:37.209563','1','Surgery',1,'[{\"added\": {}}]',8,1),(8,'2022-03-10 06:08:29.195500','1','saturday',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(9,'2022-03-10 06:08:39.602587','2','sunday',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(10,'2022-03-10 06:08:52.872798','3','mondey',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(11,'2022-03-10 06:09:10.218837','4','tuesday',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(12,'2022-03-10 06:09:18.958884','5','wednesday',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(13,'2022-03-10 06:09:26.968518','6','thursday',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(14,'2022-03-10 06:12:38.929616','1','mondey',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(15,'2022-03-10 06:12:55.705715','2','tuesday',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(16,'2022-03-10 06:13:04.412816','3','wednesday',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(17,'2022-03-10 06:13:14.675209','4','thursday',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(18,'2022-03-10 06:13:23.025202','5','saturday',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(19,'2022-03-10 06:13:29.731137','6','sunday',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',9,1),(20,'2022-03-10 06:14:55.221752','2','Orthopedic',1,'[{\"added\": {}}]',8,1),(21,'2022-03-10 06:15:35.639296','3','Neurosurgery',1,'[{\"added\": {}}]',8,1),(22,'2022-03-10 06:16:11.334871','4','Vascular Surgery',1,'[{\"added\": {}}]',8,1),(23,'2022-03-10 06:17:19.359893','5','Urology',1,'[{\"added\": {}}]',8,1),(24,'2022-03-10 06:18:06.511367','6','Thoracic Surgery',1,'[{\"added\": {}}]',8,1),(25,'2022-03-10 06:19:12.560494','7','Internal Surgery',1,'[{\"added\": {}}]',8,1),(26,'2022-03-10 06:19:52.408646','8','Internal Cardiology',1,'[{\"added\": {}}]',8,1),(27,'2022-03-10 06:20:27.833589','9','Internal Thoracic',1,'[{\"added\": {}}]',8,1),(28,'2022-03-09 06:32:13.500491','1','Surgery',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(29,'2022-03-09 06:33:10.756576','2','Orthopedic',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(30,'2022-03-09 06:33:48.671469','3','Neurosurgery',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(31,'2022-03-09 06:34:00.442711','4','Vascular Surgery',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(32,'2022-03-09 06:34:09.474062','5','Urology',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(33,'2022-03-09 06:34:24.258696','6','Thoracic Surgery',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(34,'2022-03-09 06:34:34.459204','7','Internal Surgery',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(35,'2022-03-09 06:35:00.967246','8','Internal Cardiology',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(36,'2022-03-09 06:35:11.404118','9','Internal Thoracic',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(37,'2022-03-08 07:17:17.396304','10','Internal Thoracic',1,'[{\"added\": {}}]',8,1),(38,'2022-03-08 07:17:51.287819','1','Surgery',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(39,'2022-03-08 07:17:55.358626','2','Orthopedic',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(40,'2022-03-08 07:17:59.969438','3','Neurosurgery',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(41,'2022-03-08 07:18:04.901924','4','Vascular Surgery',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(42,'2022-03-08 07:18:09.640662','5','Urology',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(43,'2022-03-08 07:18:14.250536','6','Thoracic Surgery',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(44,'2022-03-08 07:18:18.977264','7','Internal Surgery',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(45,'2022-03-08 07:18:23.891873','8','Internal Cardiology',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(46,'2022-03-08 07:18:28.747830','9','Internal Thoracic',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(47,'2022-03-08 07:42:43.931770','1','Surgery',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(48,'2022-03-08 07:43:02.045204','1','هند محمد شمس الدين',3,'',7,1),(49,'2022-03-08 08:28:33.713014','2','Orthopedic',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(50,'2022-03-08 08:29:47.376657','3','Patemhan',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(51,'2022-03-08 08:29:52.985548','2','Patemhan',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(52,'2022-03-08 08:36:42.976806','4','patemhan',3,'',7,1),(53,'2022-03-08 08:57:39.205025','3','هند محمد شمس الدين',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(54,'2022-03-08 09:25:40.285253','8','Internal Cardiology - 1',2,'[{\"changed\": {\"fields\": [\"Name\", \"Arabic name\"]}}]',8,1),(55,'2022-03-08 09:26:06.685911','8','Internal Cardiology - 1',2,'[]',8,1),(56,'2022-03-08 09:29:13.058688','9','Internal Thoracic',2,'[]',8,1),(57,'2022-03-08 09:29:18.240556','10','Internal Thoracic',2,'[]',8,1),(58,'2022-03-08 09:29:32.482674','9','Internal Thoracic',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(59,'2022-03-08 09:29:37.425647','10','Internal Thoracic',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(60,'2022-03-08 09:30:12.595657','9','Internal Thoracic',2,'[{\"changed\": {\"fields\": [\"Date\"]}}]',8,1),(61,'2022-03-08 09:30:40.878880','9','Internal Thoracic',2,'[{\"changed\": {\"fields\": [\"Date\"]}}]',8,1),(62,'2022-03-08 09:30:47.062744','10','Internal Thoracic',2,'[]',8,1),(63,'2022-03-08 09:31:09.018778','8','Internal Cardiology - 1',2,'[]',8,1),(64,'2022-03-08 09:33:25.962998','8','Internal Cardiology - 1',2,'[]',8,1),(65,'2022-03-08 09:33:59.861158','8','Internal Cardiology',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',8,1),(66,'2022-03-08 09:34:42.154038','8','Internal Cardiology',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(67,'2022-03-08 09:35:20.385749','8','Internal Cardiology - 1',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',8,1),(68,'2022-03-08 09:43:33.488566','8','Internal Cardiology - 1',2,'[{\"changed\": {\"fields\": [\"Arabic name\"]}}]',8,1),(69,'2022-03-08 09:45:11.941712','9','Internal Cardiology - 1',2,'[{\"changed\": {\"fields\": [\"Name\", \"Arabic name\", \"Date\"]}}]',8,1),(70,'2022-03-08 09:46:09.822272','10','Internal Thoracic',2,'[{\"changed\": {\"fields\": [\"Arabic name\", \"Date\"]}}]',8,1),(71,'2022-03-08 09:48:31.305286','11','Thoracic  Endoscopy',1,'[{\"added\": {}}]',8,1),(72,'2022-03-08 09:58:57.416690','9','Internal Cardiology - 2',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',8,1),(73,'2022-03-08 10:16:32.528745','1','Surgery',2,'[{\"changed\": {\"fields\": [\"Date\"]}}]',8,1),(74,'2022-03-08 10:16:43.156907','1','Surgery',2,'[{\"changed\": {\"fields\": [\"Date\"]}}]',8,1),(75,'2022-03-08 10:16:56.984992','11','Thoracic  Endoscopy',2,'[{\"changed\": {\"fields\": [\"Date\"]}}]',8,1),(76,'2022-03-08 10:17:23.167799','11','Thoracic  Endoscopy',2,'[]',8,1),(77,'2022-03-08 10:18:03.559265','8','Internal Cardiology - 1',2,'[]',8,1),(78,'2022-03-08 10:18:07.710695','9','Internal Cardiology - 2',2,'[]',8,1),(79,'2022-03-04 10:29:12.072157','8','Internal Thoracic',2,'[{\"changed\": {\"fields\": [\"Name\", \"Arabic name\", \"Date\"]}}]',8,1),(80,'2022-03-04 10:29:54.151345','9','Thoracic Endoscopy',2,'[{\"changed\": {\"fields\": [\"Name\", \"Arabic name\", \"Date\"]}}]',8,1),(81,'2022-03-04 10:30:28.262691','10','Internal Cardiology - 1',2,'[{\"changed\": {\"fields\": [\"Name\", \"Arabic name\", \"Date\"]}}]',8,1),(82,'2022-03-04 10:30:49.661845','11','Internal Cardiology - 2',2,'[{\"changed\": {\"fields\": [\"Name\", \"Arabic name\", \"Date\"]}}]',8,1),(83,'2022-03-08 10:38:28.348752','1','Surgery',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(84,'2022-03-08 10:38:36.244414','2','Orthopedic',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(85,'2022-03-08 10:39:07.084373','5','patemhan',3,'',7,1),(86,'2022-03-08 10:39:07.094364','3','هند محمد شمس الدين',3,'',7,1),(87,'2022-03-08 10:39:07.105498','2','Patemhan',3,'',7,1),(88,'2022-03-08 10:50:20.929045','7','patemhan',3,'',7,1),(89,'2022-03-08 10:50:20.940073','6','patemhan',3,'',7,1),(90,'2022-03-08 10:53:41.880461','8','patemhan',3,'',7,1),(91,'2022-03-08 11:26:54.284975','4','Vascular Surgery',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(92,'2022-03-08 13:53:50.465840','10','Internal Cardiology - 1',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(93,'2022-03-08 13:55:57.913123','2','Orthopedic',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(94,'2022-03-08 14:23:53.681146','13','Osman',3,'',7,1),(95,'2022-03-08 14:23:53.691682','12','patemhan',3,'',7,1),(96,'2022-03-08 14:23:53.702403','14','Turkistan',3,'',7,1),(97,'2022-03-08 14:23:53.709600','10','patemhan13',3,'',7,1),(98,'2022-03-08 14:23:53.719883','9','patemhan',3,'',7,1),(99,'2022-03-08 14:23:53.726781','11','patemhan',3,'',7,1),(100,'2022-03-08 14:39:53.613390','1','Surgery',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(101,'2022-03-08 14:40:32.007100','2','Orthopedic',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(102,'2022-03-08 17:11:49.452756','18','هند محمد شمس الدين',3,'',7,1),(103,'2022-03-08 17:11:49.465230','17','Osman',3,'',7,1),(104,'2022-03-08 17:11:49.473740','16','Turkistan',3,'',7,1),(105,'2022-03-08 17:11:49.482724','15','patemhan',3,'',7,1),(106,'2022-03-08 17:15:26.886373','1','Surgery',2,'[{\"changed\": {\"fields\": [\"Count\"]}}]',8,1),(107,'2022-03-08 17:55:53.904299','23','عمر الحسين',3,'',7,1),(108,'2022-03-08 17:55:53.914577','22','Turkistan',3,'',7,1),(109,'2022-03-08 17:55:53.924974','21','محمدشيخ خليل',3,'',7,1),(110,'2022-03-08 17:55:53.931222','20','اسامة كنصفرة',3,'',7,1),(111,'2022-03-08 17:55:53.953377','19','patemhan',3,'',7,1),(112,'2022-03-09 12:59:18.572520','28','Abdullah uday',3,'',7,1),(113,'2022-03-09 12:59:18.582529','27','patemhan',3,'',7,1),(114,'2022-03-09 12:59:18.589599','26','Turkistan',3,'',7,1),(115,'2022-03-09 12:59:18.598483','25','patemhan',3,'',7,1),(116,'2022-03-09 12:59:18.606112','24','Osman',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'patient','basicinfo'),(9,'patient','date'),(8,'patient','department'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-03-10 06:00:44.013178'),(2,'auth','0001_initial','2022-03-10 06:00:46.735344'),(3,'admin','0001_initial','2022-03-10 06:00:47.453298'),(4,'admin','0002_logentry_remove_auto_add','2022-03-10 06:00:47.509332'),(5,'admin','0003_logentry_add_action_flag_choices','2022-03-10 06:00:47.570121'),(6,'contenttypes','0002_remove_content_type_name','2022-03-10 06:00:48.390932'),(7,'auth','0002_alter_permission_name_max_length','2022-03-10 06:00:48.999396'),(8,'auth','0003_alter_user_email_max_length','2022-03-10 06:00:49.264792'),(9,'auth','0004_alter_user_username_opts','2022-03-10 06:00:49.311038'),(10,'auth','0005_alter_user_last_login_null','2022-03-10 06:00:49.545321'),(11,'auth','0006_require_contenttypes_0002','2022-03-10 06:00:49.564563'),(12,'auth','0007_alter_validators_add_error_messages','2022-03-10 06:00:49.608498'),(13,'auth','0008_alter_user_username_max_length','2022-03-10 06:00:49.867195'),(14,'auth','0009_alter_user_last_name_max_length','2022-03-10 06:00:50.125142'),(15,'auth','0010_alter_group_name_max_length','2022-03-10 06:00:50.373436'),(16,'auth','0011_update_proxy_permissions','2022-03-10 06:00:50.416629'),(17,'auth','0012_alter_user_first_name_max_length','2022-03-10 06:00:50.877439'),(18,'patient','0001_initial','2022-03-10 06:00:51.003324'),(19,'patient','0002_auto_20220308_0925','2022-03-10 06:00:51.429966'),(20,'patient','0003_department','2022-03-10 06:00:51.599840'),(21,'patient','0004_auto_20220308_1246','2022-03-10 06:00:52.183246'),(22,'patient','0005_auto_20220308_1446','2022-03-10 06:00:53.491633'),(23,'patient','0006_alter_basicinfo_department','2022-03-10 06:00:53.756971'),(24,'patient','0007_rename_remark_department_count','2022-03-10 06:00:53.827751'),(25,'sessions','0001_initial','2022-03-10 06:00:53.970434'),(26,'patient','0002_alter_department_name','2022-03-08 09:25:18.471665'),(27,'patient','0003_alter_basicinfo_department','2022-03-08 10:42:22.054912'),(28,'patient','0004_auto_20220308_1354','2022-03-08 10:54:44.670152');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('dkiptbcv1hoti492cxp2ckdqh59mdwqp','.eJxVjDsOwjAQBe_iGlmO4y8lfc5grde7JIBsKZ8KcXdkKQW0b2beWyQ49jkdG61pKeIqBnH53TLgk2oH5QH13iS2uq9Lll2RJ93k1Aq9bqf7dzDDNvea2Y0-Oo8OAlljDMVCzBazR6W8Bj1oUJYDclSZXXCahrGQL0jeRPH5Avo-OH4:1nRV9a:8dS89MvzMSGmyvpw-5-7CAQaEhwogurYfo6fXpFDI5Y','2022-03-22 08:25:10.183964'),('iidapb1e8kx29eu3wpqxclsjmuwweb5x','.eJxVjDsOwjAQBe_iGlmO4y8lfc5grde7JIBsKZ8KcXdkKQW0b2beWyQ49jkdG61pKeIqBnH53TLgk2oH5QH13iS2uq9Lll2RJ93k1Aq9bqf7dzDDNvea2Y0-Oo8OAlljDMVCzBazR6W8Bj1oUJYDclSZXXCahrGQL0jeRPH5Avo-OH4:1nRW4h:ygofu6YoMTDfWuTbZllwAUXDknOFw01FbJ8En_PFek0','2022-03-22 09:24:11.427540'),('kbqrff7nyvljm3z07vws6wvgsyrubcyg','.eJxVjDsOwjAQBe_iGlmO4y8lfc5grde7JIBsKZ8KcXdkKQW0b2beWyQ49jkdG61pKeIqBnH53TLgk2oH5QH13iS2uq9Lll2RJ93k1Aq9bqf7dzDDNvea2Y0-Oo8OAlljDMVCzBazR6W8Bj1oUJYDclSZXXCahrGQL0jeRPH5Avo-OH4:1nRert:lTjcWzR6Tb8mPa8FLM6lQJrjaKCxa5fWdzWZqVvnsg8','2022-03-22 18:47:33.953581'),('prvtf00sgbzb2b5asz9du3ys713nmx4x','.eJxVjDsOwjAQBe_iGlmO4y8lfc5grde7JIBsKZ8KcXdkKQW0b2beWyQ49jkdG61pKeIqBnH53TLgk2oH5QH13iS2uq9Lll2RJ93k1Aq9bqf7dzDDNvea2Y0-Oo8OAlljDMVCzBazR6W8Bj1oUJYDclSZXXCahrGQL0jeRPH5Avo-OH4:1nSBti:cHpSbSyd6X-mt0ZLh-Jr_0isYWpGBr1ZsQ69LmizhAw','2022-03-24 06:03:38.873117'),('vusgv70ifewjzunzloge3cappk82sy93','.eJxVjDsOwjAQBe_iGlmO4y8lfc5grde7JIBsKZ8KcXdkKQW0b2beWyQ49jkdG61pKeIqBnH53TLgk2oH5QH13iS2uq9Lll2RJ93k1Aq9bqf7dzDDNvea2Y0-Oo8OAlljDMVCzBazR6W8Bj1oUJYDclSZXXCahrGQL0jeRPH5Avo-OH4:1nRvuC:9IBMGrd09NT2ibCw39jx_4_vDoZRHZjlMk88im14DJI','2022-03-23 12:59:04.814426'),('xzqcdyjbevo49hqn19v8ma3kl8ve2f6a','.eJxVjDsOwjAQBe_iGlmO4y8lfc5grde7JIBsKZ8KcXdkKQW0b2beWyQ49jkdG61pKeIqBnH53TLgk2oH5QH13iS2uq9Lll2RJ93k1Aq9bqf7dzDDNvea2Y0-Oo8OAlljDMVCzBazR6W8Bj1oUJYDclSZXXCahrGQL0jeRPH5Avo-OH4:1nSBs2:anF8aWcLPBeKM7oqF-eSIA-tpXAVpvE3YN4s-pqrSLk','2022-03-24 06:01:54.382309');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_basicinfo`
--

DROP TABLE IF EXISTS `patient_basicinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_basicinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `age` smallint DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `marriage` varchar(20) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `department` varchar(23) DEFAULT NULL,
  `department_arabic` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_basicinfo`
--

LOCK TABLES `patient_basicinfo` WRITE;
/*!40000 ALTER TABLE `patient_basicinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_basicinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_date`
--

DROP TABLE IF EXISTS `patient_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_date` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_date`
--

LOCK TABLES `patient_date` WRITE;
/*!40000 ALTER TABLE `patient_date` DISABLE KEYS */;
INSERT INTO `patient_date` VALUES (1,'mondey'),(2,'tuesday'),(3,'wednesday'),(4,'thursday'),(5,'saturday'),(6,'sunday');
/*!40000 ALTER TABLE `patient_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_department`
--

DROP TABLE IF EXISTS `patient_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(23) NOT NULL,
  `count` smallint DEFAULT NULL,
  `arabic_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_department`
--

LOCK TABLES `patient_department` WRITE;
/*!40000 ALTER TABLE `patient_department` DISABLE KEYS */;
INSERT INTO `patient_department` VALUES (1,'Surgery',3,'الجِرَاْحَةُ العَاْمَّةْ'),(2,'Orthopedic',15,'الجِرَاْحَةُ العَظْمِيَّةْ'),(3,'Neurosurgery',0,'الجِرَاْحَةُ العَصَبِيَّةْ'),(4,'Vascular Surgery',30,'الجِرَاْحَةُ الوِعَاْئِيَّةْ'),(5,'Urology',0,'الجِرَاْحَةُ البَوْلِيَّة'),(6,'Thoracic Surgery',0,'الجِرَاْحَةُ الصَدْرِيَّة'),(7,'Internal Surgery',0,'دَاخِلية العَاْمَّةْ'),(8,'Internal Thoracic',25,'دَاخِلية الصَدْرِيَّة'),(9,'Thoracic Endoscopy',10,'دَاخِلية الصَدْرِيَّة تنظير'),(10,'Internal Cardiology - 1',2,'دَاخِلية القَلْبِيَّةْ الأول'),(11,'Internal Cardiology - 2',0,'دَاخِلية القَلْبِيَّةْ الثاني');
/*!40000 ALTER TABLE `patient_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_department_date`
--

DROP TABLE IF EXISTS `patient_department_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_department_date` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `department_id` bigint NOT NULL,
  `date_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `patient_department_date_department_id_date_id_a041d06d_uniq` (`department_id`,`date_id`),
  KEY `patient_department_date_date_id_a0befaa9_fk_patient_date_id` (`date_id`),
  CONSTRAINT `patient_department_d_department_id_055db108_fk_patient_d` FOREIGN KEY (`department_id`) REFERENCES `patient_department` (`id`),
  CONSTRAINT `patient_department_date_date_id_a0befaa9_fk_patient_date_id` FOREIGN KEY (`date_id`) REFERENCES `patient_date` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_department_date`
--

LOCK TABLES `patient_department_date` WRITE;
/*!40000 ALTER TABLE `patient_department_date` DISABLE KEYS */;
INSERT INTO `patient_department_date` VALUES (1,1,1),(2,1,2),(40,1,3),(4,1,4),(5,1,5),(6,1,6),(7,2,1),(8,2,2),(9,2,3),(10,2,5),(11,3,4),(12,3,5),(13,4,3),(14,4,4),(15,4,5),(16,5,2),(17,6,4),(18,7,1),(19,7,2),(20,7,3),(21,7,5),(22,7,6),(23,8,1),(26,8,5),(35,9,3),(37,10,1),(42,10,2),(43,10,3),(38,10,5),(44,10,6),(45,11,1),(46,11,2),(41,11,3),(47,11,5),(48,11,6);
/*!40000 ALTER TABLE `patient_department_date` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-09 15:59:31

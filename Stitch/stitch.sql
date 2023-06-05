-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: stitch
-- ------------------------------------------------------
-- Server version	10.5.19-MariaDB-0+deb11u2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
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
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add usuarios',7,'add_usuarios'),(26,'Can change usuarios',7,'change_usuarios'),(27,'Can delete usuarios',7,'delete_usuarios'),(28,'Can view usuarios',7,'view_usuarios'),(29,'Can add auth group',8,'add_authgroup'),(30,'Can change auth group',8,'change_authgroup'),(31,'Can delete auth group',8,'delete_authgroup'),(32,'Can view auth group',8,'view_authgroup'),(33,'Can add auth group permissions',9,'add_authgrouppermissions'),(34,'Can change auth group permissions',9,'change_authgrouppermissions'),(35,'Can delete auth group permissions',9,'delete_authgrouppermissions'),(36,'Can view auth group permissions',9,'view_authgrouppermissions'),(37,'Can add auth permission',10,'add_authpermission'),(38,'Can change auth permission',10,'change_authpermission'),(39,'Can delete auth permission',10,'delete_authpermission'),(40,'Can view auth permission',10,'view_authpermission'),(41,'Can add auth user',11,'add_authuser'),(42,'Can change auth user',11,'change_authuser'),(43,'Can delete auth user',11,'delete_authuser'),(44,'Can view auth user',11,'view_authuser'),(45,'Can add auth user groups',12,'add_authusergroups'),(46,'Can change auth user groups',12,'change_authusergroups'),(47,'Can delete auth user groups',12,'delete_authusergroups'),(48,'Can view auth user groups',12,'view_authusergroups'),(49,'Can add auth user user permissions',13,'add_authuseruserpermissions'),(50,'Can change auth user user permissions',13,'change_authuseruserpermissions'),(51,'Can delete auth user user permissions',13,'delete_authuseruserpermissions'),(52,'Can view auth user user permissions',13,'view_authuseruserpermissions'),(53,'Can add django admin log',14,'add_djangoadminlog'),(54,'Can change django admin log',14,'change_djangoadminlog'),(55,'Can delete django admin log',14,'delete_djangoadminlog'),(56,'Can view django admin log',14,'view_djangoadminlog'),(57,'Can add django content type',15,'add_djangocontenttype'),(58,'Can change django content type',15,'change_djangocontenttype'),(59,'Can delete django content type',15,'delete_djangocontenttype'),(60,'Can view django content type',15,'view_djangocontenttype'),(61,'Can add django migrations',16,'add_djangomigrations'),(62,'Can change django migrations',16,'change_djangomigrations'),(63,'Can delete django migrations',16,'delete_djangomigrations'),(64,'Can view django migrations',16,'view_djangomigrations'),(65,'Can add django session',17,'add_djangosession'),(66,'Can change django session',17,'change_djangosession'),(67,'Can delete django session',17,'delete_djangosession'),(68,'Can view django session',17,'view_djangosession'),(69,'Can add perfil',18,'add_perfil'),(70,'Can change perfil',18,'change_perfil'),(71,'Can delete perfil',18,'delete_perfil'),(72,'Can view perfil',18,'view_perfil'),(73,'Can add producto',19,'add_producto'),(74,'Can change producto',19,'change_producto'),(75,'Can delete producto',19,'delete_producto'),(76,'Can view producto',19,'view_producto'),(77,'Can add carrito',20,'add_carrito'),(78,'Can change carrito',20,'change_carrito'),(79,'Can delete carrito',20,'delete_carrito'),(80,'Can view carrito',20,'view_carrito'),(81,'Can add estacion',21,'add_estacion'),(82,'Can change estacion',21,'change_estacion'),(83,'Can delete estacion',21,'delete_estacion'),(84,'Can view estacion',21,'view_estacion'),(85,'Can add estacion producto',22,'add_estacionproducto'),(86,'Can change estacion producto',22,'change_estacionproducto'),(87,'Can delete estacion producto',22,'delete_estacionproducto'),(88,'Can view estacion producto',22,'view_estacionproducto'),(89,'Can add etiqueta',23,'add_etiqueta'),(90,'Can change etiqueta',23,'change_etiqueta'),(91,'Can delete etiqueta',23,'delete_etiqueta'),(92,'Can view etiqueta',23,'view_etiqueta'),(93,'Can add favoritos',25,'add_favoritos'),(94,'Can change favoritos',25,'change_favoritos'),(95,'Can delete favoritos',25,'delete_favoritos'),(96,'Can view favoritos',25,'view_favoritos'),(97,'Can add producto etiqueta',24,'add_productoetiqueta'),(98,'Can change producto etiqueta',24,'change_productoetiqueta'),(99,'Can delete producto etiqueta',24,'delete_productoetiqueta'),(100,'Can view producto etiqueta',24,'view_productoetiqueta');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$n4ru6aLaDjQe78CRoCkUgM$I5tkQNSAF9eZtEo03F6+pgWz4llv0dbUVsFh4WEL+dY=','2023-05-27 17:52:01.821606',1,'ricardo','','','',1,1,'2023-05-24 10:56:44.154559');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_comprador` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(250) DEFAULT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(10) DEFAULT NULL,
  `order_id` varchar(200) NOT NULL,
  `realizado` tinyint(1) NOT NULL,
  `precio_producto` decimal(10,2) DEFAULT NULL,
  `precio_total_carrito` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_comprador` (`id_comprador`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_comprador`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (45,1,1,'producto1','2023-05-29',1,'usuarioDOS_556',1,220.99,NULL),(49,1,4,'producto4','2023-05-30',1,'usuarioDOS_791',1,100.00,NULL),(59,1,1,'producto1','2023-05-31',1,'usuarioDOS_250',1,220.99,NULL),(61,1,4,'producto4','2023-05-31',1,'usuarioDOS_250',1,100.00,NULL),(67,13,4,'camiseta nike sport','2023-06-03',1,'usuarionuevo_240',1,45.00,NULL),(68,13,1,'Chaqueta northface','2023-06-03',1,'usuarionuevo_240',1,220.99,NULL),(69,13,1,'Chaqueta northface','2023-06-04',1,'usuarionuevo_78',1,220.99,NULL),(71,13,4,'camiseta nike sport','2023-06-04',1,'usuarionuevo_78',1,45.00,NULL),(72,13,7,'chaqueta nike','2023-06-04',1,'usuarionuevo_78',1,421.00,NULL),(73,13,11,'pantalones jordan','2023-06-04',1,'usuarionuevo_78',1,123.00,NULL),(74,13,1,'Chaqueta northface','2023-06-04',1,'usuarionuevo_219',1,220.99,NULL),(75,13,7,'chaqueta nike','2023-06-04',1,'usuarionuevo_219',1,421.00,NULL),(76,13,7,'chaqueta nike','2023-06-04',1,'usuarionuevo_219',1,421.00,NULL),(77,13,11,'pantalones jordan','2023-06-04',1,'usuarionuevo_219',1,123.00,NULL),(78,13,1,'Chaqueta northface','2023-06-04',1,'usuarionuevo_219',1,220.99,NULL),(80,13,4,'camiseta nike sport','2023-06-04',1,'usuarionuevo_219',1,45.00,NULL),(84,13,7,'chaqueta nike','2023-06-04',5,'usuarionuevo_282',1,421.00,NULL),(85,13,1,'Chaqueta northface','2023-06-04',1,'usuarionuevo_709',1,220.99,NULL),(87,13,11,'pantalones jordan','2023-06-04',15,'usuarionuevo_709',1,123.00,7739.00),(88,13,7,'chaqueta nike','2023-06-04',14,'usuarionuevo_709',1,421.00,7739.00),(89,13,14,'Chaqueta negra nike sport','2023-06-05',5,'usuarionuevo_709',1,15.00,75.00),(90,13,7,'chaqueta nike','2023-06-05',44,'usuarionuevo_557',1,421.00,18524.00),(92,13,12,'Chquetón nike negro','2023-06-05',1,'usuarionuevo_11',1,123.99,243.99),(94,13,15,'Chaqueta deportiva nike','2023-06-05',1,'usuarionuevo_11',1,120.00,243.99);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-05-29 08:43:38.183142','80','Carrito object (80)',3,'',20,1),(2,'2023-05-29 08:43:38.185977','79','Carrito object (79)',3,'',20,1),(3,'2023-05-29 08:43:38.187517','78','Carrito object (78)',3,'',20,1),(4,'2023-05-29 08:43:38.193025','77','Carrito object (77)',3,'',20,1),(5,'2023-05-29 08:43:38.194460','76','Carrito object (76)',3,'',20,1),(6,'2023-05-29 08:43:38.196375','75','Carrito object (75)',3,'',20,1),(7,'2023-05-29 08:43:38.197629','74','Carrito object (74)',3,'',20,1),(8,'2023-05-29 08:43:38.199059','73','Carrito object (73)',3,'',20,1),(9,'2023-05-29 08:43:38.200339','72','Carrito object (72)',3,'',20,1),(10,'2023-05-29 08:43:38.201772','71','Carrito object (71)',3,'',20,1),(11,'2023-05-29 08:43:38.203943','70','Carrito object (70)',3,'',20,1),(12,'2023-05-29 08:43:38.205483','69','Carrito object (69)',3,'',20,1),(13,'2023-05-29 08:43:38.207127','68','Carrito object (68)',3,'',20,1),(14,'2023-05-29 08:43:38.208926','67','Carrito object (67)',3,'',20,1),(15,'2023-05-29 08:43:38.210412','66','Carrito object (66)',3,'',20,1),(16,'2023-05-29 08:43:38.212055','65','Carrito object (65)',3,'',20,1),(17,'2023-05-29 08:43:38.214160','64','Carrito object (64)',3,'',20,1),(18,'2023-05-29 08:43:38.215502','63','Carrito object (63)',3,'',20,1),(19,'2023-05-29 08:43:38.216791','62','Carrito object (62)',3,'',20,1),(20,'2023-05-29 08:43:38.218189','61','Carrito object (61)',3,'',20,1),(21,'2023-05-29 08:43:38.219397','60','Carrito object (60)',3,'',20,1),(22,'2023-05-29 08:43:38.221235','59','Carrito object (59)',3,'',20,1),(23,'2023-05-29 08:43:38.222581','58','Carrito object (58)',3,'',20,1),(24,'2023-05-29 08:43:38.224149','57','Carrito object (57)',3,'',20,1),(25,'2023-05-29 08:43:38.225436','56','Carrito object (56)',3,'',20,1),(26,'2023-05-29 08:43:38.227135','55','Carrito object (55)',3,'',20,1),(27,'2023-05-29 08:43:38.228259','54','Carrito object (54)',3,'',20,1),(28,'2023-05-29 08:43:38.229413','53','Carrito object (53)',3,'',20,1),(29,'2023-05-29 08:43:38.230723','52','Carrito object (52)',3,'',20,1),(30,'2023-05-29 08:43:38.232053','51','Carrito object (51)',3,'',20,1),(31,'2023-05-29 08:43:38.234223','50','Carrito object (50)',3,'',20,1),(32,'2023-05-29 08:43:38.236492','49','Carrito object (49)',3,'',20,1),(33,'2023-05-29 08:43:38.237995','48','Carrito object (48)',3,'',20,1),(34,'2023-05-29 08:43:38.239345','47','Carrito object (47)',3,'',20,1),(35,'2023-05-29 08:43:38.241371','46','Carrito object (46)',3,'',20,1),(36,'2023-05-29 08:43:38.242631','45','Carrito object (45)',3,'',20,1),(37,'2023-05-29 08:43:38.243748','44','Carrito object (44)',3,'',20,1),(38,'2023-05-29 08:43:38.244899','43','Carrito object (43)',3,'',20,1),(39,'2023-05-29 08:43:38.246047','42','Carrito object (42)',3,'',20,1),(40,'2023-05-29 08:43:38.247829','41','Carrito object (41)',3,'',20,1),(41,'2023-05-29 08:43:38.249204','40','Carrito object (40)',3,'',20,1),(42,'2023-05-29 08:43:38.250526','39','Carrito object (39)',3,'',20,1),(43,'2023-05-29 08:43:38.252024','38','Carrito object (38)',3,'',20,1),(44,'2023-05-29 08:43:38.253778','37','Carrito object (37)',3,'',20,1),(45,'2023-05-29 08:43:38.255994','36','Carrito object (36)',3,'',20,1),(46,'2023-05-29 08:43:38.257794','35','Carrito object (35)',3,'',20,1),(47,'2023-05-29 08:43:38.259694','34','Carrito object (34)',3,'',20,1),(48,'2023-05-29 08:43:38.261235','33','Carrito object (33)',3,'',20,1),(49,'2023-05-29 08:43:38.262574','32','Carrito object (32)',3,'',20,1),(50,'2023-05-29 08:43:38.263788','31','Carrito object (31)',3,'',20,1),(51,'2023-05-29 08:43:38.265532','30','Carrito object (30)',3,'',20,1),(52,'2023-05-29 08:43:38.266738','29','Carrito object (29)',3,'',20,1),(53,'2023-05-29 08:43:38.268108','28','Carrito object (28)',3,'',20,1),(54,'2023-05-29 08:43:38.269403','27','Carrito object (27)',3,'',20,1),(55,'2023-05-29 08:43:38.271209','26','Carrito object (26)',3,'',20,1),(56,'2023-05-29 08:43:38.272470','25','Carrito object (25)',3,'',20,1),(57,'2023-05-29 08:43:38.274225','24','Carrito object (24)',3,'',20,1),(58,'2023-05-29 08:43:38.276018','23','Carrito object (23)',3,'',20,1),(59,'2023-05-29 08:43:38.277415','22','Carrito object (22)',3,'',20,1),(60,'2023-05-29 08:43:38.279309','21','Carrito object (21)',3,'',20,1),(61,'2023-05-29 08:43:38.280769','20','Carrito object (20)',3,'',20,1),(62,'2023-05-29 08:43:38.282760','19','Carrito object (19)',3,'',20,1),(63,'2023-05-29 08:43:38.284671','18','Carrito object (18)',3,'',20,1),(64,'2023-05-29 08:43:38.285997','17','Carrito object (17)',3,'',20,1),(65,'2023-05-29 08:43:38.287524','16','Carrito object (16)',3,'',20,1),(66,'2023-05-29 08:43:38.288899','15','Carrito object (15)',3,'',20,1),(67,'2023-05-29 08:43:38.290262','14','Carrito object (14)',3,'',20,1),(68,'2023-05-29 08:43:38.291809','13','Carrito object (13)',3,'',20,1),(69,'2023-05-29 08:43:38.293861','12','Carrito object (12)',3,'',20,1),(70,'2023-05-29 08:43:38.295289','11','Carrito object (11)',3,'',20,1),(71,'2023-05-29 08:43:38.296635','10','Carrito object (10)',3,'',20,1),(72,'2023-05-29 08:43:38.298002','9','Carrito object (9)',3,'',20,1),(73,'2023-05-29 08:43:38.299347','8','Carrito object (8)',3,'',20,1),(74,'2023-05-29 08:43:38.301426','7','Carrito object (7)',3,'',20,1),(75,'2023-05-29 08:43:38.302787','6','Carrito object (6)',3,'',20,1),(76,'2023-05-29 08:43:38.304013','5','Carrito object (5)',3,'',20,1),(77,'2023-05-29 08:43:38.305440','4','Carrito object (4)',3,'',20,1),(78,'2023-05-29 08:43:38.306743','3','Carrito object (3)',3,'',20,1),(79,'2023-05-29 08:43:38.308923','2','Carrito object (2)',3,'',20,1),(80,'2023-05-29 08:43:38.310485','1','Carrito object (1)',3,'',20,1),(81,'2023-05-29 09:12:25.750389','95','Carrito object (95)',3,'',20,1),(82,'2023-05-29 09:12:25.756553','94','Carrito object (94)',3,'',20,1),(83,'2023-05-29 09:12:25.758087','93','Carrito object (93)',3,'',20,1),(84,'2023-05-29 09:12:25.759395','92','Carrito object (92)',3,'',20,1),(85,'2023-05-29 09:12:25.760630','91','Carrito object (91)',3,'',20,1),(86,'2023-05-29 09:12:25.762519','90','Carrito object (90)',3,'',20,1),(87,'2023-05-29 09:12:25.764772','89','Carrito object (89)',3,'',20,1),(88,'2023-05-29 09:12:25.766048','88','Carrito object (88)',3,'',20,1),(89,'2023-05-29 09:12:25.768241','87','Carrito object (87)',3,'',20,1),(90,'2023-05-29 09:12:25.770972','86','Carrito object (86)',3,'',20,1),(91,'2023-05-29 09:12:25.772595','85','Carrito object (85)',3,'',20,1),(92,'2023-05-29 09:12:25.774034','84','Carrito object (84)',3,'',20,1),(93,'2023-05-29 09:12:25.777207','83','Carrito object (83)',3,'',20,1),(94,'2023-05-29 09:12:25.778377','82','Carrito object (82)',3,'',20,1),(95,'2023-05-29 09:12:25.779569','81','Carrito object (81)',3,'',20,1),(96,'2023-05-29 09:18:24.239004','105','Carrito object (105)',3,'',20,1),(97,'2023-05-29 09:18:24.240625','104','Carrito object (104)',3,'',20,1),(98,'2023-05-29 09:18:24.241893','103','Carrito object (103)',3,'',20,1),(99,'2023-05-29 09:18:24.243190','102','Carrito object (102)',3,'',20,1),(100,'2023-05-29 09:18:24.246047','101','Carrito object (101)',3,'',20,1),(101,'2023-05-29 09:18:24.247296','100','Carrito object (100)',3,'',20,1),(102,'2023-05-29 09:18:24.248550','99','Carrito object (99)',3,'',20,1),(103,'2023-05-29 09:18:24.249866','98','Carrito object (98)',3,'',20,1),(104,'2023-05-29 09:18:24.251293','97','Carrito object (97)',3,'',20,1),(105,'2023-05-29 09:18:24.254478','96','Carrito object (96)',3,'',20,1),(106,'2023-05-29 09:32:09.627586','116','Carrito object (116)',3,'',20,1),(107,'2023-05-29 09:32:09.632796','115','Carrito object (115)',3,'',20,1),(108,'2023-05-29 09:32:09.634667','114','Carrito object (114)',3,'',20,1),(109,'2023-05-29 09:32:09.637161','113','Carrito object (113)',3,'',20,1),(110,'2023-05-29 09:32:09.640346','112','Carrito object (112)',3,'',20,1),(111,'2023-05-29 09:32:09.641880','111','Carrito object (111)',3,'',20,1),(112,'2023-05-29 09:32:09.643193','110','Carrito object (110)',3,'',20,1),(113,'2023-05-29 09:32:09.644498','109','Carrito object (109)',3,'',20,1),(114,'2023-05-29 09:32:09.645753','108','Carrito object (108)',3,'',20,1),(115,'2023-05-29 09:32:09.648797','107','Carrito object (107)',3,'',20,1),(116,'2023-05-29 09:32:09.651693','106','Carrito object (106)',3,'',20,1),(117,'2023-05-29 09:38:06.027341','132','Carrito object (132)',3,'',20,1),(118,'2023-05-29 09:38:06.032430','131','Carrito object (131)',3,'',20,1),(119,'2023-05-29 09:38:06.033836','130','Carrito object (130)',3,'',20,1),(120,'2023-05-29 09:38:06.035175','129','Carrito object (129)',3,'',20,1),(121,'2023-05-29 09:38:06.037210','128','Carrito object (128)',3,'',20,1),(122,'2023-05-29 09:38:06.039653','127','Carrito object (127)',3,'',20,1),(123,'2023-05-29 09:38:06.041119','126','Carrito object (126)',3,'',20,1),(124,'2023-05-29 09:38:06.042398','125','Carrito object (125)',3,'',20,1),(125,'2023-05-29 09:38:06.043628','124','Carrito object (124)',3,'',20,1),(126,'2023-05-29 09:38:06.045521','123','Carrito object (123)',3,'',20,1),(127,'2023-05-29 09:38:06.046764','122','Carrito object (122)',3,'',20,1),(128,'2023-05-29 09:38:06.047912','121','Carrito object (121)',3,'',20,1),(129,'2023-05-29 09:38:06.049223','120','Carrito object (120)',3,'',20,1),(130,'2023-05-29 09:38:06.050468','119','Carrito object (119)',3,'',20,1),(131,'2023-05-29 09:38:06.053818','118','Carrito object (118)',3,'',20,1),(132,'2023-05-29 09:38:06.056407','117','Carrito object (117)',3,'',20,1),(133,'2023-05-29 09:59:15.351968','194','Carrito object (194)',3,'',20,1),(134,'2023-05-29 09:59:15.360648','193','Carrito object (193)',3,'',20,1),(135,'2023-05-29 09:59:15.366343','192','Carrito object (192)',3,'',20,1),(136,'2023-05-29 09:59:15.370754','191','Carrito object (191)',3,'',20,1),(137,'2023-05-29 09:59:15.375389','190','Carrito object (190)',3,'',20,1),(138,'2023-05-29 09:59:15.380249','189','Carrito object (189)',3,'',20,1),(139,'2023-05-29 09:59:15.385164','188','Carrito object (188)',3,'',20,1),(140,'2023-05-29 09:59:15.389880','187','Carrito object (187)',3,'',20,1),(141,'2023-05-29 09:59:15.394739','186','Carrito object (186)',3,'',20,1),(142,'2023-05-29 09:59:15.399202','185','Carrito object (185)',3,'',20,1),(143,'2023-05-29 09:59:15.403402','184','Carrito object (184)',3,'',20,1),(144,'2023-05-29 09:59:15.409127','183','Carrito object (183)',3,'',20,1),(145,'2023-05-29 09:59:15.413662','182','Carrito object (182)',3,'',20,1),(146,'2023-05-29 09:59:15.418144','181','Carrito object (181)',3,'',20,1),(147,'2023-05-29 09:59:15.422742','180','Carrito object (180)',3,'',20,1),(148,'2023-05-29 09:59:15.429344','179','Carrito object (179)',3,'',20,1),(149,'2023-05-29 09:59:15.439579','178','Carrito object (178)',3,'',20,1),(150,'2023-05-29 09:59:15.444590','177','Carrito object (177)',3,'',20,1),(151,'2023-05-29 09:59:15.450425','176','Carrito object (176)',3,'',20,1),(152,'2023-05-29 09:59:15.455140','175','Carrito object (175)',3,'',20,1),(153,'2023-05-29 09:59:15.463706','174','Carrito object (174)',3,'',20,1),(154,'2023-05-29 09:59:15.468652','173','Carrito object (173)',3,'',20,1),(155,'2023-05-29 09:59:15.473246','172','Carrito object (172)',3,'',20,1),(156,'2023-05-29 09:59:15.479222','171','Carrito object (171)',3,'',20,1),(157,'2023-05-29 09:59:15.484171','170','Carrito object (170)',3,'',20,1),(158,'2023-05-29 09:59:15.489374','169','Carrito object (169)',3,'',20,1),(159,'2023-05-29 09:59:15.494935','168','Carrito object (168)',3,'',20,1),(160,'2023-05-29 09:59:15.501287','167','Carrito object (167)',3,'',20,1),(161,'2023-05-29 09:59:15.505998','166','Carrito object (166)',3,'',20,1),(162,'2023-05-29 09:59:15.511550','165','Carrito object (165)',3,'',20,1),(163,'2023-05-29 09:59:15.518530','164','Carrito object (164)',3,'',20,1),(164,'2023-05-29 09:59:15.523225','163','Carrito object (163)',3,'',20,1),(165,'2023-05-29 09:59:15.528646','162','Carrito object (162)',3,'',20,1),(166,'2023-05-29 09:59:15.533282','161','Carrito object (161)',3,'',20,1),(167,'2023-05-29 09:59:15.538110','160','Carrito object (160)',3,'',20,1),(168,'2023-05-29 09:59:15.543880','159','Carrito object (159)',3,'',20,1),(169,'2023-05-29 09:59:15.551825','158','Carrito object (158)',3,'',20,1),(170,'2023-05-29 09:59:15.556692','157','Carrito object (157)',3,'',20,1),(171,'2023-05-29 09:59:15.562618','156','Carrito object (156)',3,'',20,1),(172,'2023-05-29 09:59:15.567038','155','Carrito object (155)',3,'',20,1),(173,'2023-05-29 09:59:15.570994','154','Carrito object (154)',3,'',20,1),(174,'2023-05-29 09:59:15.575944','153','Carrito object (153)',3,'',20,1),(175,'2023-05-29 09:59:15.580498','152','Carrito object (152)',3,'',20,1),(176,'2023-05-29 09:59:15.584874','151','Carrito object (151)',3,'',20,1),(177,'2023-05-29 09:59:15.589614','150','Carrito object (150)',3,'',20,1),(178,'2023-05-29 09:59:15.594941','149','Carrito object (149)',3,'',20,1),(179,'2023-05-29 09:59:15.601002','148','Carrito object (148)',3,'',20,1),(180,'2023-05-29 09:59:15.605855','147','Carrito object (147)',3,'',20,1),(181,'2023-05-29 09:59:15.611664','146','Carrito object (146)',3,'',20,1),(182,'2023-05-29 09:59:15.616514','145','Carrito object (145)',3,'',20,1),(183,'2023-05-29 09:59:15.621106','144','Carrito object (144)',3,'',20,1),(184,'2023-05-29 09:59:15.625881','143','Carrito object (143)',3,'',20,1),(185,'2023-05-29 09:59:15.631293','142','Carrito object (142)',3,'',20,1),(186,'2023-05-29 09:59:15.635815','141','Carrito object (141)',3,'',20,1),(187,'2023-05-29 09:59:15.640778','140','Carrito object (140)',3,'',20,1),(188,'2023-05-29 09:59:15.646484','139','Carrito object (139)',3,'',20,1),(189,'2023-05-29 09:59:15.651146','138','Carrito object (138)',3,'',20,1),(190,'2023-05-29 09:59:15.656273','137','Carrito object (137)',3,'',20,1),(191,'2023-05-29 09:59:15.661702','136','Carrito object (136)',3,'',20,1),(192,'2023-05-29 09:59:15.666457','135','Carrito object (135)',3,'',20,1),(193,'2023-05-29 09:59:15.670957','134','Carrito object (134)',3,'',20,1),(194,'2023-05-29 09:59:15.676864','133','Carrito object (133)',3,'',20,1),(195,'2023-05-29 10:20:24.928220','203','Carrito object (203)',3,'',20,1),(196,'2023-05-29 10:20:24.937395','202','Carrito object (202)',3,'',20,1),(197,'2023-05-29 10:20:24.942324','201','Carrito object (201)',3,'',20,1),(198,'2023-05-29 10:20:24.947606','200','Carrito object (200)',3,'',20,1),(199,'2023-05-29 10:20:24.952467','199','Carrito object (199)',3,'',20,1),(200,'2023-05-29 10:20:24.960769','198','Carrito object (198)',3,'',20,1),(201,'2023-05-29 10:20:24.965677','197','Carrito object (197)',3,'',20,1),(202,'2023-05-29 10:20:24.970014','196','Carrito object (196)',3,'',20,1),(203,'2023-05-29 10:20:24.974087','195','Carrito object (195)',3,'',20,1),(204,'2023-05-29 10:38:21.938191','208','Carrito object (208)',3,'',20,1),(205,'2023-05-29 10:38:21.946497','207','Carrito object (207)',3,'',20,1),(206,'2023-05-29 10:38:21.950421','206','Carrito object (206)',3,'',20,1),(207,'2023-05-29 10:38:21.954222','205','Carrito object (205)',3,'',20,1),(208,'2023-05-29 10:38:21.957670','204','Carrito object (204)',3,'',20,1),(209,'2023-05-29 10:50:21.533349','209','Carrito object (209)',3,'',20,1),(210,'2023-05-29 10:53:59.141655','214','Carrito object (214)',3,'',20,1),(211,'2023-05-29 10:53:59.143366','213','Carrito object (213)',3,'',20,1),(212,'2023-05-29 10:53:59.144970','212','Carrito object (212)',3,'',20,1),(213,'2023-05-29 10:53:59.146525','211','Carrito object (211)',3,'',20,1),(214,'2023-05-29 10:53:59.147922','210','Carrito object (210)',3,'',20,1),(215,'2023-05-29 11:02:49.209709','215','Carrito object (215)',3,'',20,1),(216,'2023-05-29 11:23:34.785209','1','Carrito object (1)',3,'',20,1),(217,'2023-05-29 11:24:18.177937','3','Carrito object (3)',3,'',20,1),(218,'2023-05-29 11:24:18.185524','2','Carrito object (2)',3,'',20,1),(219,'2023-05-29 11:25:17.473954','6','Carrito object (6)',3,'',20,1),(220,'2023-05-29 11:25:17.481239','5','Carrito object (5)',3,'',20,1),(221,'2023-05-29 11:25:17.484510','4','Carrito object (4)',3,'',20,1),(222,'2023-05-29 11:26:29.436540','9','Carrito object (9)',3,'',20,1),(223,'2023-05-29 11:26:29.445344','8','Carrito object (8)',3,'',20,1),(224,'2023-05-29 11:26:29.448527','7','Carrito object (7)',3,'',20,1),(225,'2023-05-29 11:28:05.501016','13','Carrito object (13)',3,'',20,1),(226,'2023-05-29 11:28:05.508170','12','Carrito object (12)',3,'',20,1),(227,'2023-05-29 11:28:05.514029','11','Carrito object (11)',3,'',20,1),(228,'2023-05-29 11:28:05.519143','10','Carrito object (10)',3,'',20,1),(229,'2023-05-29 11:29:00.548684','14','Carrito object (14)',3,'',20,1),(230,'2023-05-29 11:30:48.077425','19','Carrito object (19)',3,'',20,1),(231,'2023-05-29 11:30:48.087823','18','Carrito object (18)',3,'',20,1),(232,'2023-05-29 11:30:48.090434','17','Carrito object (17)',3,'',20,1),(233,'2023-05-29 11:30:48.092928','16','Carrito object (16)',3,'',20,1),(234,'2023-05-29 11:30:48.095164','15','Carrito object (15)',3,'',20,1),(235,'2023-05-29 11:38:43.742701','23','Carrito object (23)',3,'',20,1),(236,'2023-05-29 11:38:43.748739','22','Carrito object (22)',3,'',20,1),(237,'2023-05-29 11:39:16.268174','26','Carrito object (26)',3,'',20,1),(238,'2023-05-29 11:39:16.274791','25','Carrito object (25)',3,'',20,1),(239,'2023-05-29 11:39:16.277752','24','Carrito object (24)',3,'',20,1),(240,'2023-05-29 11:39:16.280476','21','Carrito object (21)',3,'',20,1),(241,'2023-05-29 11:39:16.282596','20','Carrito object (20)',3,'',20,1),(242,'2023-05-29 11:40:46.655898','35','Carrito object (35)',3,'',20,1),(243,'2023-05-29 11:40:46.662537','34','Carrito object (34)',3,'',20,1),(244,'2023-05-29 11:40:46.665760','33','Carrito object (33)',3,'',20,1),(245,'2023-05-29 11:40:46.669405','32','Carrito object (32)',3,'',20,1),(246,'2023-05-29 11:40:46.672552','31','Carrito object (31)',3,'',20,1),(247,'2023-05-29 11:40:46.676049','30','Carrito object (30)',3,'',20,1),(248,'2023-05-29 11:40:46.677976','29','Carrito object (29)',3,'',20,1),(249,'2023-05-29 11:40:46.681169','28','Carrito object (28)',3,'',20,1),(250,'2023-05-29 11:40:46.683442','27','Carrito object (27)',3,'',20,1),(251,'2023-05-30 11:54:59.565583','1','Estacion object (1)',1,'[{\"added\": {}}]',21,1),(252,'2023-05-30 11:55:06.615139','2','Estacion object (2)',1,'[{\"added\": {}}]',21,1),(253,'2023-05-30 11:55:10.495146','3','Estacion object (3)',1,'[{\"added\": {}}]',21,1),(254,'2023-05-30 11:55:15.197476','4','Estacion object (4)',1,'[{\"added\": {}}]',21,1),(255,'2023-05-30 11:56:09.513645','1','EstacionProducto object (1)',1,'[{\"added\": {}}]',22,1),(256,'2023-05-30 11:56:14.012002','2','EstacionProducto object (2)',1,'[{\"added\": {}}]',22,1),(257,'2023-05-30 11:56:30.846381','3','EstacionProducto object (3)',1,'[{\"added\": {}}]',22,1),(258,'2023-05-30 11:56:36.809082','4','EstacionProducto object (4)',1,'[{\"added\": {}}]',22,1),(259,'2023-05-30 11:56:45.299356','5','EstacionProducto object (5)',1,'[{\"added\": {}}]',22,1),(260,'2023-05-30 13:51:43.411124','5','EstacionProducto object (5)',2,'[{\"changed\": {\"fields\": [\"Id producto\"]}}]',22,1),(261,'2023-05-31 08:22:03.597725','3','EstacionProducto object (3)',3,'',22,1),(262,'2023-05-31 08:59:55.285777','1','Etiqueta object (1)',1,'[{\"added\": {}}]',23,1),(263,'2023-05-31 09:00:04.104174','2','Etiqueta object (2)',1,'[{\"added\": {}}]',23,1),(264,'2023-05-31 09:00:32.191318','3','Etiqueta object (3)',1,'[{\"added\": {}}]',23,1),(265,'2023-05-31 09:09:58.610111','1','ProductoEtiqueta object (1)',1,'[{\"added\": {}}]',24,1),(266,'2023-05-31 09:10:02.235448','2','ProductoEtiqueta object (2)',1,'[{\"added\": {}}]',24,1),(267,'2023-05-31 09:10:06.922230','3','ProductoEtiqueta object (3)',1,'[{\"added\": {}}]',24,1),(268,'2023-05-31 09:10:16.189880','4','ProductoEtiqueta object (4)',1,'[{\"added\": {}}]',24,1),(269,'2023-05-31 09:10:22.042081','5','ProductoEtiqueta object (5)',1,'[{\"added\": {}}]',24,1),(270,'2023-05-31 09:57:21.127682','3','Etiqueta object (3)',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',23,1),(271,'2023-05-31 11:19:51.211011','1','Favoritos object (1)',3,'',25,1),(272,'2023-05-31 11:59:09.514467','5','Favoritos object (5)',3,'',25,1),(273,'2023-05-31 11:59:09.521656','4','Favoritos object (4)',3,'',25,1),(274,'2023-05-31 11:59:09.525430','3','Favoritos object (3)',3,'',25,1),(275,'2023-05-31 11:59:09.527152','2','Favoritos object (2)',3,'',25,1),(276,'2023-05-31 17:29:59.737427','62','Carrito object (62)',3,'',20,1),(277,'2023-05-31 17:50:38.845337','4','Etiqueta object (4)',1,'[{\"added\": {}}]',23,1),(278,'2023-05-31 17:50:44.395339','5','Etiqueta object (5)',1,'[{\"added\": {}}]',23,1),(279,'2023-05-31 17:50:53.939107','6','Etiqueta object (6)',1,'[{\"added\": {}}]',23,1),(280,'2023-05-31 17:50:59.887891','7','Etiqueta object (7)',1,'[{\"added\": {}}]',23,1),(281,'2023-05-31 17:52:09.299851','6','Etiqueta object (6)',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',23,1),(282,'2023-05-31 19:23:32.662157','9','Perfil object (9)',3,'',18,1),(283,'2023-06-01 08:44:34.838046','6','ProductoEtiqueta object (6)',1,'[{\"added\": {}}]',24,1),(284,'2023-06-01 09:39:02.355735','3','Producto object (3)',2,'[{\"changed\": {\"fields\": [\"Propietario\"]}}]',19,1),(285,'2023-06-01 13:42:58.577563','1','Producto object (1)',2,'[{\"changed\": {\"fields\": [\"Foto\"]}}]',19,1),(286,'2023-06-02 17:17:47.938969','9','Usuarios object (9)',2,'[{\"changed\": {\"fields\": [\"Rol\"]}}]',7,1),(287,'2023-06-02 17:43:14.654339','11','Usuarios object (11)',2,'[{\"changed\": {\"fields\": [\"Rol\"]}}]',7,1),(288,'2023-06-02 18:11:01.303241','1','Producto object (1)',2,'[{\"changed\": {\"fields\": [\"Foto\"]}}]',19,1),(289,'2023-06-02 19:54:16.424798','1','Producto object (1)',2,'[{\"changed\": {\"fields\": [\"Foto\"]}}]',19,1),(290,'2023-06-02 20:07:08.375465','2','Producto object (2)',3,'',19,1),(291,'2023-06-02 21:02:52.227234','6','Producto object (6)',1,'[{\"added\": {}}]',19,1),(292,'2023-06-02 21:03:24.383827','12','Usuarios object (12)',1,'[{\"added\": {}}]',7,1),(293,'2023-06-02 21:03:55.465383','8','Etiqueta object (8)',1,'[{\"added\": {}}]',23,1),(294,'2023-06-02 21:04:39.225995','9','Etiqueta object (9)',1,'[{\"added\": {}}]',23,1),(295,'2023-06-02 21:19:45.967677','7','Producto object (7)',1,'[{\"added\": {}}]',19,1),(296,'2023-06-04 14:04:11.131804','3','Producto object (3)',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',19,1),(297,'2023-06-04 14:04:25.963074','15','ProductoEtiqueta object (15)',1,'[{\"added\": {}}]',24,1),(298,'2023-06-04 14:04:41.030736','16','ProductoEtiqueta object (16)',1,'[{\"added\": {}}]',24,1),(299,'2023-06-04 14:05:01.546004','16','ProductoEtiqueta object (16)',2,'[{\"changed\": {\"fields\": [\"Id producto\"]}}]',24,1),(300,'2023-06-04 14:05:58.719568','17','ProductoEtiqueta object (17)',1,'[{\"added\": {}}]',24,1),(301,'2023-06-04 15:39:24.372526','14','Producto object (14)',2,'[{\"changed\": {\"fields\": [\"Nombre\", \"Descripcion\"]}}]',19,1),(302,'2023-06-04 15:39:35.563213','14','Producto object (14)',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',19,1),(303,'2023-06-05 07:53:27.906256','3','Producto object (3)',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',19,1),(304,'2023-06-05 08:44:24.967821','1','EstacionProducto object (1)',2,'[{\"changed\": {\"fields\": [\"Id estacion\"]}}]',22,1),(305,'2023-06-05 08:45:31.231091','4','EstacionProducto object (4)',2,'[{\"changed\": {\"fields\": [\"Id producto\"]}}]',22,1),(306,'2023-06-05 08:47:01.487504','6','EstacionProducto object (6)',1,'[{\"added\": {}}]',22,1),(307,'2023-06-05 08:47:06.894303','6','EstacionProducto object (6)',2,'[]',22,1),(308,'2023-06-05 08:47:42.633140','6','EstacionProducto object (6)',2,'[{\"changed\": {\"fields\": [\"Id estacion\"]}}]',22,1),(309,'2023-06-05 08:48:07.538258','7','EstacionProducto object (7)',1,'[{\"added\": {}}]',22,1),(310,'2023-06-05 08:48:26.031793','8','EstacionProducto object (8)',1,'[{\"added\": {}}]',22,1),(311,'2023-06-05 08:48:31.629129','9','EstacionProducto object (9)',1,'[{\"added\": {}}]',22,1),(312,'2023-06-05 08:48:46.191150','10','EstacionProducto object (10)',1,'[{\"added\": {}}]',22,1),(313,'2023-06-05 08:48:56.866696','11','EstacionProducto object (11)',1,'[{\"added\": {}}]',22,1),(314,'2023-06-05 08:49:07.156243','11','EstacionProducto object (11)',2,'[{\"changed\": {\"fields\": [\"Id producto\"]}}]',22,1),(315,'2023-06-05 08:59:54.300344','12','EstacionProducto object (12)',1,'[{\"added\": {}}]',22,1),(316,'2023-06-05 09:00:00.905651','13','EstacionProducto object (13)',1,'[{\"added\": {}}]',22,1),(317,'2023-06-05 09:00:08.232238','14','EstacionProducto object (14)',1,'[{\"added\": {}}]',22,1),(318,'2023-06-05 09:00:23.723851','15','EstacionProducto object (15)',1,'[{\"added\": {}}]',22,1),(319,'2023-06-05 09:00:28.784208','16','EstacionProducto object (16)',1,'[{\"added\": {}}]',22,1),(320,'2023-06-05 09:00:53.743114','17','EstacionProducto object (17)',1,'[{\"added\": {}}]',22,1),(321,'2023-06-05 09:01:08.163393','18','EstacionProducto object (18)',1,'[{\"added\": {}}]',22,1),(322,'2023-06-05 09:01:13.569685','19','EstacionProducto object (19)',1,'[{\"added\": {}}]',22,1),(323,'2023-06-05 09:01:23.933593','20','EstacionProducto object (20)',1,'[{\"added\": {}}]',22,1),(324,'2023-06-05 09:01:28.789861','21','EstacionProducto object (21)',1,'[{\"added\": {}}]',22,1),(325,'2023-06-05 09:01:34.848337','22','EstacionProducto object (22)',1,'[{\"added\": {}}]',22,1),(326,'2023-06-05 09:01:40.112724','23','EstacionProducto object (23)',1,'[{\"added\": {}}]',22,1),(327,'2023-06-05 09:01:59.263820','24','EstacionProducto object (24)',1,'[{\"added\": {}}]',22,1),(328,'2023-06-05 09:02:03.726563','25','EstacionProducto object (25)',1,'[{\"added\": {}}]',22,1),(329,'2023-06-05 09:02:23.584350','26','EstacionProducto object (26)',1,'[{\"added\": {}}]',22,1),(330,'2023-06-05 09:02:31.289875','27','EstacionProducto object (27)',1,'[{\"added\": {}}]',22,1),(331,'2023-06-05 09:02:39.745050','28','EstacionProducto object (28)',1,'[{\"added\": {}}]',22,1),(332,'2023-06-05 09:03:41.689509','29','EstacionProducto object (29)',1,'[{\"added\": {}}]',22,1),(333,'2023-06-05 09:03:56.302115','30','EstacionProducto object (30)',1,'[{\"added\": {}}]',22,1),(334,'2023-06-05 09:04:07.206141','31','EstacionProducto object (31)',1,'[{\"added\": {}}]',22,1),(335,'2023-06-05 09:04:15.596349','32','EstacionProducto object (32)',1,'[{\"added\": {}}]',22,1),(336,'2023-06-05 09:04:24.982526','33','EstacionProducto object (33)',1,'[{\"added\": {}}]',22,1),(337,'2023-06-05 09:04:34.147695','34','EstacionProducto object (34)',1,'[{\"added\": {}}]',22,1),(338,'2023-06-05 09:04:39.039172','35','EstacionProducto object (35)',1,'[{\"added\": {}}]',22,1),(339,'2023-06-05 09:05:53.919321','21','EstacionProducto object (21)',3,'',22,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'webserviceapp','authgroup'),(9,'webserviceapp','authgrouppermissions'),(10,'webserviceapp','authpermission'),(11,'webserviceapp','authuser'),(12,'webserviceapp','authusergroups'),(13,'webserviceapp','authuseruserpermissions'),(20,'webserviceapp','carrito'),(14,'webserviceapp','djangoadminlog'),(15,'webserviceapp','djangocontenttype'),(16,'webserviceapp','djangomigrations'),(17,'webserviceapp','djangosession'),(21,'webserviceapp','estacion'),(22,'webserviceapp','estacionproducto'),(23,'webserviceapp','etiqueta'),(25,'webserviceapp','favoritos'),(18,'webserviceapp','perfil'),(19,'webserviceapp','producto'),(24,'webserviceapp','productoetiqueta'),(7,'webserviceapp','usuarios');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-04-02 21:57:47.747647'),(2,'auth','0001_initial','2023-04-02 21:57:47.960021'),(3,'admin','0001_initial','2023-04-02 21:57:48.015106'),(4,'admin','0002_logentry_remove_auto_add','2023-04-02 21:57:48.020319'),(5,'admin','0003_logentry_add_action_flag_choices','2023-04-02 21:57:48.025348'),(6,'contenttypes','0002_remove_content_type_name','2023-04-02 21:57:48.051873'),(7,'auth','0002_alter_permission_name_max_length','2023-04-02 21:57:48.075238'),(8,'auth','0003_alter_user_email_max_length','2023-04-02 21:57:48.082572'),(9,'auth','0004_alter_user_username_opts','2023-04-02 21:57:48.087311'),(10,'auth','0005_alter_user_last_login_null','2023-04-02 21:57:48.108922'),(11,'auth','0006_require_contenttypes_0002','2023-04-02 21:57:48.110735'),(12,'auth','0007_alter_validators_add_error_messages','2023-04-02 21:57:48.115667'),(13,'auth','0008_alter_user_username_max_length','2023-04-02 21:57:48.122907'),(14,'auth','0009_alter_user_last_name_max_length','2023-04-02 21:57:48.130244'),(15,'auth','0010_alter_group_name_max_length','2023-04-02 21:57:48.155015'),(16,'auth','0011_update_proxy_permissions','2023-04-02 21:57:48.159828'),(17,'auth','0012_alter_user_first_name_max_length','2023-04-02 21:57:48.166787'),(18,'sessions','0001_initial','2023-04-02 21:57:48.181561'),(19,'webserviceapp','0001_initial','2023-04-02 21:58:32.824050'),(20,'webserviceapp','0002_authgroup_authgrouppermissions_authpermission_and_more','2023-05-25 08:11:07.153995'),(21,'webserviceapp','0003_carrito','2023-05-25 08:28:28.877813'),(22,'webserviceapp','0003_carrito_estacion_estacionproducto_etiqueta_favoritos_and_more','2023-06-04 10:15:02.944735');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1qa51x44x5g27rvz0tsg8pcjovzwxvoa','.eJxVjMsOgjAQRf-la9JAX0xZuvcLjGmGTpGqaRNK3Rj_XUhY6PLce3LezGFdZ1dLWFwkNrCONb_biP4R0n7QHdMtc5_TusSR7wo_3sLPmcLzdLh_gRnLvGeDnrCXZJUFL8hLtLZDalGPQcoJBEgDRD0oYTcSBgx0oFuPPWhF7Rb1oazIhsu1YZHcQayWikvMqYZXdkZZ9vkCzjFFBA:1q6DVW:TdOhq9pxeWrb8E9PfcRsts961ELCoswziZECA_223c8','2023-06-19 16:56:38.360668'),('3nz5kpcr137ac0mxgdh8443ajp3ajb8k','eyJjZXN0YSI6W119:1q2coS:CjlyHnwGFbzybtemVRsSN32zE4S4kGnQo1G3IkxtwY0','2023-06-09 19:09:20.259396'),('675qgecmvup2tdjh2spda54s941b08ym','eyJub21icmUiOiJyaWNhcmRvIn0:1pj5mP:0mHNqce1rHVxQcHtfXMl2fNRDsoPY3Jq38TcrqoxL6A','2023-04-16 22:02:29.170298'),('bt2m0zuqjskfusxcjeiea973lgrknwgl','.eJyrVkpOLS5JVLKKrlbKTIkvKMpPKU0uyVeyMtRRSk7MK8lMSUwBcmp10KSNkKVNLEwwFBjj10-K8STrHinSsbUAwbOXog:1q2cgH:f-kYFU-WaeimMI8b7R-j5OZlLmOHE3aaaZq1TCj_uVQ','2023-06-09 19:00:53.439938'),('onc8h3ach0nbxb3wc1uy6l0zckxjlye1','eyJub21icmUiOiJyaWNhcmRvIn0:1pj5jT:LU3o17RtDz7k_ibAUZieJ7pyV8x6l0J3Yyq-w_SM5l8','2023-04-16 21:59:27.310669'),('s5tlxk92ca76d32hr028vb1c8phpox4s','eyJjZXN0YSI6W119:1q2bfe:KayGBsAR-O9Mpalm0g7FlHoyjinxv1K8WZJhn9BwxTk','2023-06-09 17:56:10.303198'),('yeb3q6v7o715g0j22vxa91ol6pjgqozp','.eJxVjMsOwiAQRf-FtSG8GVy69xvIwFCpGpqUdmX8dyXpQpf3npPzYhH3rca9lzXOxM5MstPvlzA_ShuA7thuC89L29Y58aHwg3Z-Xag8L4f7F6jY68gWO6HXFEyArChrDEEiCbSpaD2BAu2AyINR4buUAwcSrMjowRoS7P0B4GI3MQ:1q1mBE:DT1z8ZcKnUaoXka4A0rees286c5gJaQOIGF6LbAN8Bg','2023-06-07 10:57:20.553012');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estacion`
--

DROP TABLE IF EXISTS `estacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacion`
--

LOCK TABLES `estacion` WRITE;
/*!40000 ALTER TABLE `estacion` DISABLE KEYS */;
INSERT INTO `estacion` VALUES (1,'Primavera'),(2,'Verano'),(3,'Otoño'),(4,'Invierno');
/*!40000 ALTER TABLE `estacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estacion_producto`
--

DROP TABLE IF EXISTS `estacion_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estacion_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_estacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_producto` (`id_producto`),
  KEY `id_estacion` (`id_estacion`),
  CONSTRAINT `estacion_producto_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`),
  CONSTRAINT `estacion_producto_ibfk_2` FOREIGN KEY (`id_estacion`) REFERENCES `estacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacion_producto`
--

LOCK TABLES `estacion_producto` WRITE;
/*!40000 ALTER TABLE `estacion_producto` DISABLE KEYS */;
INSERT INTO `estacion_producto` VALUES (1,1,4),(6,4,2),(7,7,3),(8,7,1),(9,7,2),(10,1,3),(12,11,1),(13,11,3),(14,11,4),(15,12,4),(16,12,3),(17,14,1),(18,13,2),(19,13,3),(20,13,4),(22,14,3),(23,14,4),(24,15,2),(25,15,1),(26,16,4),(27,17,1),(28,17,4),(30,19,4),(31,20,1),(32,21,4),(33,22,2),(34,23,4),(35,24,2);
/*!40000 ALTER TABLE `estacion_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiqueta`
--

DROP TABLE IF EXISTS `etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etiqueta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiqueta`
--

LOCK TABLES `etiqueta` WRITE;
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
INSERT INTO `etiqueta` VALUES (1,'Hombre'),(2,'Mujer'),(3,'Niños'),(4,'Chaqueta'),(5,'Camiseta'),(6,'Pantalones'),(7,'Sneakers');
/*!40000 ALTER TABLE `etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_producto` (`id_producto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`),
  CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
INSERT INTO `favoritos` VALUES (23,4,13,'2023-06-05'),(24,13,13,'2023-06-05'),(25,23,13,'2023-06-05');
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `pais` varchar(200) NOT NULL,
  `dni` char(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `perfil_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (10,2,'123123199','rua see 12309090','2023-05-10','Barbados','12198989t'),(11,1,'698786709','rua see 12309090','2023-06-05','Peru','56870967Y'),(12,13,'12312324','calle reee,123','2023-06-11','Afghanistan','12345678l');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `propietario` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `foto` varchar(250) NOT NULL,
  `talla` varchar(20) NOT NULL,
  `fecha_subida` date NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `propietario` (`propietario`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`propietario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Chaqueta northface','nuevo',1,220.99,'chaqueta1.png','L','2023-06-01','descripcion del producto 1 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),(4,'camiseta nike sport','nuevo',9,45.00,'camiseta1.png','M','2023-06-01','camiseta negra nike sport'),(7,'chaqueta nike','nuevo',1,421.00,'chaqueta4.png','L','2023-06-02','Chaqueta nike gris nueva'),(11,'pantalones jordan','Segunda mano',1,123.00,'productos/pantalones1.png','L','2023-06-02','pantalones jordan negros'),(12,'Chquetón nike negro','nuevo',9,123.99,'chaqueta5.png','M','2023-06-01','Chquetón Nike negro impermeable detalla xl  '),(13,'Chaqueta nike','nuevo',9,89.98,'chaqueta6.png','XL','2023-06-02','Chaqueta nike deportiva de selección francesa para mujeres'),(14,'Chaqueta negra nike sport','Segunda mano',9,15.00,'chaqueta7.png','L','2023-06-01','chaqueta negra nike de segunda mano'),(15,'Chaqueta deportiva nike','Segunda mano',9,120.00,'chaqueta8.png','S','2023-06-01','Chaqueta beige deportiva para mujeres'),(16,'Chaqueta nike ','nuevo',9,139.99,'chaqueta10.png','S','2023-06-01','Nike Sportswear Therma-FIT Repel'),(17,'Chaqueta negra nike ','nuevo',9,123.99,'productos/chaqueta11.png','M','2023-06-04','Chaqueta negra nike sport talla M para mujeres'),(19,'Chaqueta negra nike sport','nuevo',9,230.99,'productos/chaqueta13.png','XL','2023-06-04','Chaqueta negra snike sportswear talla grande para mujeres'),(20,'Chaqueta blanca y negra','nuevo',9,99.99,'productos/chaqueta14.png','XS','2023-06-02','Chaqueta blanca y negra nike sport para niños'),(21,'Chaqueta nike','nuevo',9,120.99,'productos/chaqueta15.png','S','2023-06-02','Chaqueta nike sport para niños color beige talla S'),(22,'Chaqueta azul oscuro','nuevo',9,110.99,'productos/chaqueta16.png','XS','2023-06-03','Chaqueta nike sport para niños y niñas color azul'),(23,'Chaqueta nike ','nuevo',9,120.99,'productos/chaqueta17.png','S','2023-06-02','Chaquetón negro nike impermeable para niños'),(24,'Chaqueta de colores ','nuevo',9,130.99,'productos/chaqueta18.png','S','2023-06-03','Chaqueta de color azul, blanco y rosa para niños'),(25,'camiseta nike sport','nuevo',9,123.89,'productos/camiseta2.png','XS','2023-06-02','Camiseta color gris nike sport para mujeres'),(26,'camiseta nike sport','nuevo',9,89.99,'productos/camiseta3.png','M','2023-06-03','Camiseta nike rosa sport para mujeres\r\n'),(27,'camiseta nike barcelona','nuevo',9,180.99,'productos/camiseta4.png','S','2023-06-04','Camiseta del fc Barcelona para niños'),(28,'Camiseta nike blanca','nuevo',9,170.99,'productos/camiseta5.png','L','2023-06-01','Camiseta de la selección de ingleterra '),(29,'Camiseta nike ','nuevo',9,89.99,'productos/camiseta6.png','XL','2023-06-02','Camiseta nike negra sport para hombres\r\n'),(30,'pantalon negro nike','Segunda mano',9,130.12,'productos/pantalon2.png','L','2023-06-01','Pantalón nike negro sport para hombres'),(31,'Pantalón urbano','nuevo',9,123.99,'productos/pantalon3.png','M','2023-06-03','Pantalón urbano color beige para hombres'),(32,'Pantalón corto','nuevo',9,56.99,'productos/pantalon4.png','M','2023-06-01','Pantalón corto para gimnasio de mujeres'),(33,'Pantalón corto','Segunda mano',9,49.99,'productos/pantalon5.png','L','2023-06-01','Pantalón corto color ceste sport para hombres\r\n'),(34,'Leggins negros','nuevo',9,45.99,'productos/pantalon6.png','M','2023-06-03','Leggins nike para mujeres sport talla M'),(35,'Jordan 1 high OG','nuevo',9,230.99,'productos/sneakers1.png','40','2023-06-03','Jordan 1 High OG color celeste y blanco para hombres'),(36,'Jordan 1 High Zoom','nuevo',9,450.99,'productos/sneakers2.png','43','2023-06-02','Jordan 1 high Zoom color gris,blanco y rojo para hombres'),(37,'Jordan 1 high retro','nuevo',9,220.99,'productos/sneakers3.png','43','2023-06-02','Jordan 1 retro High color negro, blanco y rojo para hombres'),(38,'Air jordan 1 high','nuevo',9,239.99,'productos/sneakers4.png','40','2023-06-01','Jordan 1 college navy gris oscuro y blanco para mujeres'),(39,'Air jordan 1 high','nuevo',9,230.99,'productos/sneakers5.png','43','2023-06-02','Jordan 1 high OG verde y blanco para mujeres');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_etiqueta`
--

DROP TABLE IF EXISTS `producto_etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_etiqueta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_etiqueta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_producto` (`id_producto`),
  KEY `id_etiqueta` (`id_etiqueta`),
  CONSTRAINT `producto_etiqueta_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`),
  CONSTRAINT `producto_etiqueta_ibfk_2` FOREIGN KEY (`id_etiqueta`) REFERENCES `etiqueta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_etiqueta`
--

LOCK TABLES `producto_etiqueta` WRITE;
/*!40000 ALTER TABLE `producto_etiqueta` DISABLE KEYS */;
INSERT INTO `producto_etiqueta` VALUES (4,4,1),(11,1,4),(12,1,1),(14,11,6),(17,4,5),(18,7,4),(19,7,1),(25,12,4),(26,12,1),(27,13,4),(28,13,1),(29,14,4),(30,14,2),(31,15,4),(32,15,2),(33,16,4),(34,16,2),(35,17,2),(36,17,4),(39,19,2),(40,19,4),(41,20,3),(42,20,4),(43,21,3),(44,21,4),(45,22,3),(46,22,4),(47,23,3),(48,23,4),(49,24,3),(50,24,4),(51,25,2),(52,25,5),(53,26,2),(54,26,5),(55,27,3),(56,27,5),(57,28,1),(58,28,5),(59,29,1),(60,29,5),(61,30,1),(62,30,6),(63,31,1),(64,31,6),(65,32,2),(66,32,6),(67,33,1),(68,33,6),(69,34,2),(70,34,6),(71,35,1),(72,35,7),(73,36,1),(74,36,7),(75,37,1),(76,37,7),(77,38,2),(78,38,7),(79,39,2),(80,39,7);
/*!40000 ALTER TABLE `producto_etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `rol` tinyint(1) NOT NULL,
  `email` varchar(250) NOT NULL,
  `token` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'usuarioDOS','pbkdf2_sha256$390000$IXGxxUTCKWOWJ3cEFl3oWz$cLvOnw+/w3T/6NZA7nv2He93Nii4hPbvogwr9UqSOhA=',1,'ricardo@gmail.com','fake token'),(2,'usuarioMODIFICADO','pbkdf2_sha256$390000$J8nsuQmefhsJlJx8pziBNn$yLrUGwtClBbqlx5QJ8YptGLj1wErI8XoUcsU6cePnpk=',0,'usuario@gmail.com','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjpudWxsLCJ1c2VybmFtZSI6InVzdWFyaW8ifQ.GIS_Td1ZWFwS9TG_69vxboECfNO6tfNELKPw8L1Rahg'),(9,'ricardo apaza','pbkdf2_sha256$390000$ZugVqYRFIDJi043PEl5vF2$iwQDaPF9UTm9CZdHxy2v/whoDOGAbK+ve49YdbINoyE=',1,'ricardo123@gmail.com','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjpudWxsLCJ1c2VybmFtZSI6InJpY2FyZG8gYXBhemEifQ.IuX1dbFRQ1jaoEIbDA8fZIA-TACFADKR6gaFF5---ds'),(11,'ricardowapso','pbkdf2_sha256$390000$B739gs1qqlWqkzO05DUNFQ$KOUP/XkOwHvFVj/b1QFaoXwo0bZB4CO9FKiGla6qdvc=',1,'ricardo4@gmail.com','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjpudWxsLCJ1c2VybmFtZSI6InJpY2FyZG93YXBzbyJ9.VAj64_4DGMEUjBqRKj9oRO6VLLVuqrWuBzGl7Aepcas'),(13,'usuarionuevo','pbkdf2_sha256$390000$j2ja2o9y2TwhDAuuygpd8k$NN4bl98QfrzadcW6CJcUGHtxFVT+HHiN8ukwJDHyn2o=',1,'usuarionuevo@gmail.com','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjpudWxsLCJ1c2VybmFtZSI6InVzdWFyaW9udWV2byJ9.B9yCPvxpQjXnMLlIenzXUj03vw22Vn7ff7D0iDdxJPo');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-05 19:29:07

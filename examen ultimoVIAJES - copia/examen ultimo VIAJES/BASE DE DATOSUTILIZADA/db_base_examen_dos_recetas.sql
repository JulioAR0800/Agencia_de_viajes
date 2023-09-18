CREATE DATABASE  IF NOT EXISTS `db_base_examen_dos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_base_examen_dos`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: db_base_examen_dos
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(145) NOT NULL,
  `descripcion` text,
  `instrucciones` varchar(145) DEFAULT NULL,
  `bajo_tiempo` tinyint DEFAULT NULL,
  `fecha_cocinado` datetime DEFAULT NULL,
  `travel_date_from` datetime DEFAULT NULL,
  `travel_date_to` datetime DEFAULT NULL,
  `usuario_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fore_idx` (`usuario_id`),
  CONSTRAINT `fore` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (7,'Buenos aires, Argentina','Go to messi ',NULL,NULL,NULL,'2023-07-03 00:00:00','2023-09-02 00:00:00',7,'2023-07-02 17:50:26','2023-07-02 17:50:26'),(8,'Lima,Peru','go to lima ',NULL,NULL,NULL,'2023-07-05 00:00:00','2023-08-16 00:00:00',8,'2023-07-02 18:40:14','2023-07-02 19:37:08'),(12,'miami, USA ','GO TO USA',NULL,NULL,NULL,'2023-07-12 00:00:00','2023-10-18 00:00:00',7,'2023-07-02 19:10:22','2023-07-02 19:10:22'),(13,'puerto rico, holanda ','go to holanda',NULL,NULL,NULL,'2023-07-05 00:00:00','2023-07-19 00:00:00',8,'2023-07-02 19:29:51','2023-07-02 19:37:06'),(14,'madrid, españa','go to españa',NULL,NULL,NULL,'2023-07-04 00:00:00','2023-10-19 00:00:00',8,'2023-07-02 19:31:07','2023-07-02 19:37:07'),(15,'hola, holanda','go to holanda',NULL,NULL,NULL,'2023-07-12 00:00:00','2023-08-02 00:00:00',4,'2023-07-02 19:31:22','2023-07-02 19:31:22'),(16,'santiago, Chile','go to Chile',NULL,NULL,NULL,'2023-07-07 00:00:00','2023-08-16 00:00:00',4,'2023-07-02 19:32:08','2023-07-02 19:32:08'),(17,'la paz, Bolivia','Go to bolivia ',NULL,NULL,NULL,'2023-07-05 00:00:00','2023-07-14 00:00:00',8,'2023-07-02 19:32:29','2023-07-02 19:37:03'),(18,'Cajamarca, Peru','Go to peru',NULL,NULL,NULL,'2023-07-06 00:00:00','2023-07-11 00:00:00',4,'2023-07-02 19:32:43','2023-07-02 19:32:43'),(19,'cañete, peru ','Go to peru',NULL,NULL,NULL,'2023-07-06 00:00:00','2023-08-09 00:00:00',4,'2023-07-02 19:32:57','2023-07-02 19:32:57'),(20,'tumbes, Peru','Go to peru',NULL,NULL,NULL,'2023-07-20 00:00:00','2023-07-13 00:00:00',4,'2023-07-02 19:33:18','2023-07-02 19:33:18'),(21,'Piura, Peru','Go to Peru',NULL,NULL,NULL,'2023-09-07 00:00:00','2023-10-26 00:00:00',4,'2023-07-02 19:33:35','2023-07-02 19:33:35'),(22,'trujillo, Peru','Go to Trujillo',NULL,NULL,NULL,'2023-07-20 00:00:00','2023-10-26 00:00:00',4,'2023-07-02 19:33:57','2023-07-02 19:33:57'),(23,'lambayeque, Peru','go to Peru',NULL,NULL,NULL,'2023-07-19 00:00:00','2024-01-24 00:00:00',4,'2023-07-02 19:34:25','2023-07-02 19:34:25'),(24,'la libertad, Peru','go to la libertad',NULL,NULL,NULL,'2023-07-13 00:00:00','2023-11-02 00:00:00',4,'2023-07-02 19:34:41','2023-07-02 19:34:41'),(25,'lambayeque, Peru','Go to lambayeque',NULL,NULL,NULL,'2023-07-05 00:00:00','2023-09-06 00:00:00',8,'2023-07-02 19:36:01','2023-07-02 19:36:01'),(26,'ROMA, ITALIA','GO TO ITALIA',NULL,NULL,NULL,'2023-07-26 00:00:00','2023-08-08 00:00:00',8,'2023-07-02 19:37:00','2023-07-02 19:37:00'),(27,'HOLANDA, SUECIA ','GO TO SUECIA',NULL,NULL,NULL,'2023-07-04 00:00:00','2023-07-27 00:00:00',9,'2023-07-02 19:49:09','2023-07-02 19:49:09'),(28,'paris, FRANCIA FRANCIA','GO TO FRANCIA',NULL,NULL,NULL,'2023-07-04 00:00:00','2023-07-26 00:00:00',10,'2023-07-02 19:54:38','2023-07-02 19:54:38');
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-02 19:56:30

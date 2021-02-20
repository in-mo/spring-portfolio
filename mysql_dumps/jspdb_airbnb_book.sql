-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jspdb
-- ------------------------------------------------------
-- Server version	5.7.32-log

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
-- Table structure for table `airbnb_book`
--

DROP TABLE IF EXISTS `airbnb_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airbnb_book` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(45) COLLATE utf8_bin NOT NULL,
  `cost` int(11) NOT NULL,
  `check_in` varchar(20) COLLATE utf8_bin NOT NULL,
  `check_out` varchar(20) COLLATE utf8_bin NOT NULL,
  `cnt_of_person` int(11) NOT NULL,
  `no_num` int(11) NOT NULL,
  `reg_date` datetime NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airbnb_book`
--

LOCK TABLES `airbnb_book` WRITE;
/*!40000 ALTER TABLE `airbnb_book` DISABLE KEYS */;
INSERT INTO `airbnb_book` VALUES (1,'test',87600,'2021-2-8','2021-2-10',4,1,'2021-02-05 13:43:07'),(2,'test',121400,'2021-2-10','2021-2-13',3,1,'2021-02-05 15:23:24'),(3,'test',121400,'2021-2-15','2021-2-18',2,1,'2021-02-05 17:42:08'),(4,'test',87600,'2021-2-25','2021-2-26',1,1,'2021-02-05 20:16:11'),(7,'test',53800,'2021-3-5','2021-3-6',1,1,'2021-02-05 20:52:50'),(13,'asdf1234',48800,'2021-2-23','2021-2-26',2,9,'2021-02-17 12:30:30'),(14,'asdf1234',39200,'2021-2-20','2021-2-22',1,9,'2021-02-17 21:29:56');
/*!40000 ALTER TABLE `airbnb_book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-18 10:49:26

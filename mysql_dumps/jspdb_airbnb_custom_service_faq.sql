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
-- Table structure for table `airbnb_custom_service_faq`
--

DROP TABLE IF EXISTS `airbnb_custom_service_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airbnb_custom_service_faq` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(45) COLLATE utf8_bin NOT NULL,
  `subject` varchar(100) COLLATE utf8_bin NOT NULL,
  `content` varchar(2000) COLLATE utf8_bin NOT NULL,
  `readcount` int(11) NOT NULL,
  `reg_date` datetime NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airbnb_custom_service_faq`
--

LOCK TABLES `airbnb_custom_service_faq` WRITE;
/*!40000 ALTER TABLE `airbnb_custom_service_faq` DISABLE KEYS */;
INSERT INTO `airbnb_custom_service_faq` VALUES (2,'관리자','테스트 2','테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2\r\n\r\n테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2테스트 2',8,'2021-02-09 10:24:12'),(3,'관리자','테스트3','테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3\r\n\r\n테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3',28,'2021-02-09 10:26:06'),(4,'관리자','123','123',5,'2021-02-09 16:04:20'),(5,'관리자','21312312312312312312312312312','12312313',5,'2021-02-09 16:07:56'),(6,'관리자','111','2323',2,'2021-02-09 16:09:26'),(7,'관리자','44','44',1,'2021-02-09 16:09:32'),(8,'관리자','23','123',1,'2021-02-09 16:09:38'),(9,'관리자','51515','1515',1,'2021-02-09 16:09:44'),(10,'관리자','34234','234',7,'2021-02-09 16:09:50'),(11,'관리자','123','테스트용테스트테스트용\r\n테스트용테스트용테스트용\r\n테스트용테스트용테스트용\r\n\r\n테스트용테스트용\r\n테스트용테스트용용테스트용테스트용',1,'2021-02-09 16:10:00');
/*!40000 ALTER TABLE `airbnb_custom_service_faq` ENABLE KEYS */;
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

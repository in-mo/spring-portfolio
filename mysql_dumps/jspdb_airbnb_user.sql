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
-- Table structure for table `airbnb_user`
--

DROP TABLE IF EXISTS `airbnb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airbnb_user` (
  `id` varchar(45) COLLATE utf8_bin NOT NULL,
  `password` varchar(60) COLLATE utf8_bin NOT NULL,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `tel` varchar(45) COLLATE utf8_bin NOT NULL,
  `uuid` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `filename` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `uploadpath` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `reg_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airbnb_user`
--

LOCK TABLES `airbnb_user` WRITE;
/*!40000 ALTER TABLE `airbnb_user` DISABLE KEYS */;
INSERT INTO `airbnb_user` VALUES ('admin','$2a$10$hHrGikQk.733JaLaAJi2oOm6lL8nfYkWzSAPrCF53k7WxnHpsz0JC','유인모','yin5946@naver.com','010-2052-9054','d0f9ea95-eae0-4ba5-aea9-e9024caa7b14','11.gif','2021/02/17','2021-02-10 10:00:00'),('asdf1234','$2a$10$R1W1MI.wp.XUG.Rhek6YB.dWgJMKOmt95TPGDKkLtVNUjdN4DzHze','유인모','yin5946@naver.com','123-1231-2312','b2e8c4d3-dcff-47e0-859b-9c0e9ecb9f1d','11.gif','2021/02/17','2021-02-15 22:29:47'),('test','$2a$10$MSV/ZFSmQVdO6Xz4uYRjn.MvkdQP5X3NZFWl8L1zGtnuawm0LjOEm','유인모','yin5946@naver.com','123-1231-2312',NULL,NULL,NULL,'2021-02-10 10:00:00');
/*!40000 ALTER TABLE `airbnb_user` ENABLE KEYS */;
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

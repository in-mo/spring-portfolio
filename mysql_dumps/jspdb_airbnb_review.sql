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
-- Table structure for table `airbnb_review`
--

DROP TABLE IF EXISTS `airbnb_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airbnb_review` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(45) COLLATE utf8_bin NOT NULL,
  `comment` varchar(2000) COLLATE utf8_bin NOT NULL,
  `score` varchar(5) COLLATE utf8_bin NOT NULL,
  `no_num` int(11) NOT NULL,
  `book_num` int(11) DEFAULT NULL,
  `reg_date` datetime NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airbnb_review`
--

LOCK TABLES `airbnb_review` WRITE;
/*!40000 ALTER TABLE `airbnb_review` DISABLE KEYS */;
INSERT INTO `airbnb_review` VALUES (1,'test','후기 등록 1\n후기 등록 1\n후기 등록 1\n후기 등록 1후기 등록 1후기 등록 1\n후기 등록 1후기 등록 1후기 등록 1','5',1,1,'2021-02-05 18:52:09'),(2,'test','후기 작성 테스트 2 후기 작성 테스트 2후기 작성 테스트 2후기 작성 테스트 2후기 작성 테스트 2후기 작성 테스트 2후기 작성 테스트 2후기 작성 테스트 2\n\n후기 작성 테스트 2후기 작성 테스트 2후기 작성 테스트 2후기 작성 테스트 2후기 작성 테스트 2후기 작성 테스트 2후기 작성 테스트 2후기 작성 테스트 2\n\n후기 작성 테스트 2후기 작성 테스트 2','4',1,1,'2021-02-08 12:30:20'),(4,'asdf1234','후기테스트 3\n후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3후기테스트 3','4.5',9,13,'2021-02-17 12:40:15'),(5,'asdf1234','후기테스트 2후기테스트 2후기테스트 2후기테스트 2\n후기테스트 2후기테스트 2후기테스트 2후기테스트 2후기테스트 2\n후기테스트 2후기테스트 2\n후기테스트 2후기테스트 2후기테스트 2\n\n후기테스트 2','5',9,13,'2021-02-17 12:43:22'),(6,'asdf1234','후기테스트 1\n\n후기테스트 1후기테스트 1\n\n후기테스트 1후기테스트 1후기테스트 1\n후기테스트 1후기테스트 1','1',9,13,'2021-02-17 13:55:43');
/*!40000 ALTER TABLE `airbnb_review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-18 10:49:25

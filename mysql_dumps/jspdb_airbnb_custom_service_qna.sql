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
-- Table structure for table `airbnb_custom_service_qna`
--

DROP TABLE IF EXISTS `airbnb_custom_service_qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airbnb_custom_service_qna` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) COLLATE utf8_bin NOT NULL,
  `type` varchar(45) COLLATE utf8_bin NOT NULL,
  `id` varchar(45) COLLATE utf8_bin NOT NULL,
  `subject` varchar(100) COLLATE utf8_bin NOT NULL,
  `content` varchar(2000) COLLATE utf8_bin NOT NULL,
  `re_ref` int(11) NOT NULL,
  `re_lev` int(11) NOT NULL,
  `reg_date` datetime NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airbnb_custom_service_qna`
--

LOCK TABLES `airbnb_custom_service_qna` WRITE;
/*!40000 ALTER TABLE `airbnb_custom_service_qna` DISABLE KEYS */;
INSERT INTO `airbnb_custom_service_qna` VALUES (1,'답변대기','문의','test','123','123',1,0,'2021-02-10 11:14:58'),(5,'답변대기','예약','test','23','232323',5,0,'2021-02-10 14:26:01'),(6,'답변완료','환불','test','ㅁㄴㅇㄹ','ㅁㄴㅇㄻㄴㅇㄹ',6,0,'2021-02-10 14:27:38'),(7,'답변완료','호스트','test','34','34',7,0,'2021-02-10 14:29:56'),(8,'답변완료','환불','test','ㅅㅀ','324',8,0,'2021-02-10 14:30:04'),(9,'답변완료','호스트','test','62345','4523452',9,0,'2021-02-10 14:30:17'),(10,'답변완료','예약','test','123','123',10,0,'2021-02-10 14:30:25'),(11,'답변완료','예약','test','5254','2345',11,0,'2021-02-10 14:30:34'),(12,'답변완료','예약','test','144','12341243',12,0,'2021-02-10 14:30:46'),(13,'답변완료','예약','test','12341234','12431432',13,0,'2021-02-10 14:30:54'),(14,'답변대기','기타문의','test','1234515','12341243',14,0,'2021-02-10 14:31:02'),(15,'답변대기','환불','test','666','66',15,0,'2021-02-10 14:31:08'),(18,'문의답변','문의답변','관리자','답변','답변 테스트 33\n\n답변 테스트 222\n\n답변 테스트 222\n\n답변 테스트 222',11,1,'2021-02-10 20:27:11'),(19,'문의답변','문의답변','관리자','답변','ㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㅇㄴㄹ\nㅁㄴㅇ\nㅁㄴ\nㅇㄹ\nㅁㄴㅇㄹ\nㅁ\nㄴㅇㄹ',9,1,'2021-02-10 20:35:15'),(20,'문의답변','문의답변','관리자','답변','3123',12,1,'2021-02-11 14:08:44'),(21,'문의답변','문의답변','관리자','답변','ghgh',10,1,'2021-02-11 14:12:52'),(23,'문의답변','문의답변','관리자','답변','ㅑㅑㅑ123',8,1,'2021-02-11 14:59:18'),(24,'문의답변','문의답변','관리자','답변','ㅁㄴㅇㄻㄴㅇㄹ\n11111',7,1,'2021-02-11 15:18:48'),(25,'문의답변','문의답변','관리자','답변','asdfasdf\nasdfasdf',6,1,'2021-02-11 20:22:44'),(26,'답변완료','환불','test','1231','123',26,0,'2021-02-11 21:24:33'),(27,'답변완료','환불','test','23443','234',27,0,'2021-02-11 21:26:00'),(58,'문의답변','문의답변','관리자','답변','123ㅎ',26,1,'2021-02-16 15:45:26'),(59,'문의답변','문의답변','관리자','답변','asdf',13,1,'2021-02-16 15:51:50'),(61,'답변대기','문의','asdf1234','123','123\r\n\r\n123\r\n\r\n123',61,0,'2021-02-17 14:09:27'),(62,'답변대기','문의','asdf1234','44545','454545',62,0,'2021-02-17 14:19:04'),(64,'문의답변','문의답변','관리자','답변','32132',27,1,'2021-02-17 14:40:46');
/*!40000 ALTER TABLE `airbnb_custom_service_qna` ENABLE KEYS */;
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

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
-- Table structure for table `airbnb_host_image`
--

DROP TABLE IF EXISTS `airbnb_host_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airbnb_host_image` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) COLLATE utf8_bin NOT NULL,
  `filename` varchar(1000) COLLATE utf8_bin NOT NULL,
  `uploadpath` varchar(1000) COLLATE utf8_bin NOT NULL,
  `noNum` int(11) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airbnb_host_image`
--

LOCK TABLES `airbnb_host_image` WRITE;
/*!40000 ALTER TABLE `airbnb_host_image` DISABLE KEYS */;
INSERT INTO `airbnb_host_image` VALUES (6,'6b71a38a-9a94-40cf-b8e5-4c9f4348938a','IMG_0778.JPG','2021/02/08',2),(7,'8f546f79-e415-4511-8d91-b871ad9bfab1','IMG_1074 (1).JPG','2021/02/08',2),(29,'642dfc3c-097a-41e9-b629-072855c1ad18','pexels-bella-white-635279.jpg','2021/02/20',9),(30,'7b4968fc-8a88-4869-aa4b-d3660e7ed77d','pexels-bri-schneiter-346529.jpg','2021/02/20',9),(31,'f367d7f3-a6a0-49aa-9a90-94c6b9a7fe53','pexels-christian-heitz-842711.jpg','2021/02/20',8),(32,'a5ce5a97-9374-455d-80b0-77e3fd96539e','pexels-craig-adderley-1563356.jpg','2021/02/20',8),(33,'98906da0-6374-4355-890f-0ea40eab7470','pexels-david-bartus-1166209.jpg','2021/02/20',7),(34,'2739cd34-b0a6-4e2a-8710-b8070796e84c','pexels-eberhard-grossgasteiger-844297.jpg','2021/02/20',7),(35,'8cadd242-81c6-4182-bdf6-643f60bc6838','pexels-eberhard-grossgasteiger-1612351.jpg','2021/02/20',6),(36,'ee03ffd6-381b-451c-a8ec-c94aa9023d11','pexels-ian-turnell-709552.jpg','2021/02/20',6),(37,'a3bd31b7-e226-403c-96bb-2011c26f548f','pexels-james-wheeler-414612.jpg','2021/02/20',5),(38,'97c08f27-2f38-492d-8a7b-d0a29543dbaa','pexels-james-wheeler-417074.jpg','2021/02/20',5),(39,'8695b45b-761d-4073-93fb-91381e79b55d','pexels-kelsey-johnson-2331569.jpg','2021/02/20',4),(40,'18662fc9-2896-48ad-9238-0302d863ce10','pexels-maxime-francis-2246476.jpg','2021/02/20',4),(41,'a5b3d294-1d7e-42b2-9f6a-316c32b1c2b6','pexels-pixabay-33109.jpg','2021/02/20',3),(42,'2df16add-878a-4100-87d4-cfcd07700a58','pexels-pixabay-35888.jpg','2021/02/20',3),(43,'bb7f58f2-b424-4c97-8b51-a38a9bdde24b','pexels-pixabay-36717.jpg','2021/02/20',1),(44,'bf83ee57-9b87-4621-9020-495e163740b5','pexels-pixabay-235615.jpg','2021/02/20',1),(45,'21512136-f5da-4c24-84a5-0af09e634a15','pexels-pixabay-235621.jpg','2021/02/20',1),(46,'3e286bc0-86ad-46e3-9576-95a84bc30645','pexels-pixabay-235734.jpg','2021/02/20',1),(47,'d7a483ca-c771-4021-a18b-4d4248f4a209','pexels-pixabay-247431.jpg','2021/02/20',1),(48,'c1ea6e3e-d6ff-4547-9a9a-658b833cb9c5','pexels-vlad-alexandru-popa-1402787.jpg','2021/02/20',2),(49,'22340663-342a-4f96-a95f-d13a6aa979e7','pexels-tan-danh-1329711.jpg','2021/02/20',2),(50,'d8a7afe9-6320-404e-b873-0e965b5ce251','pexels-roberto-nickson-2775196.jpg','2021/02/20',12),(51,'bc261270-f143-4d44-8894-64f557844fc2','pexels-quintin-gellar-313782.jpg','2021/02/20',12),(52,'314fe74d-f934-4fb6-92d8-f03277609f91','pexels-pixabay-414144.jpg','2021/02/20',12);
/*!40000 ALTER TABLE `airbnb_host_image` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-20 13:27:43

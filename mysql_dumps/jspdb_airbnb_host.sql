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
-- Table structure for table `airbnb_host`
--

DROP TABLE IF EXISTS `airbnb_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airbnb_host` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(45) COLLATE utf8_bin NOT NULL,
  `classification` varchar(45) COLLATE utf8_bin NOT NULL,
  `housetype` varchar(45) COLLATE utf8_bin NOT NULL,
  `staytype` varchar(35) COLLATE utf8_bin NOT NULL,
  `countofperson` int(11) NOT NULL,
  `countofbedroom` int(11) NOT NULL,
  `countofbed` int(11) NOT NULL,
  `countofsofebed` int(11) NOT NULL,
  `countofsofe` int(11) NOT NULL,
  `countofblanket` int(11) NOT NULL,
  `countofbathroom` int(11) NOT NULL,
  `postcode` varchar(30) COLLATE utf8_bin NOT NULL,
  `address1` varchar(100) COLLATE utf8_bin NOT NULL,
  `address2` varchar(100) COLLATE utf8_bin NOT NULL,
  `amenities` varchar(200) COLLATE utf8_bin NOT NULL,
  `safety` varchar(100) COLLATE utf8_bin NOT NULL,
  `usefull` varchar(100) COLLATE utf8_bin NOT NULL,
  `hostComment` varchar(1600) COLLATE utf8_bin NOT NULL,
  `cost` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8_bin NOT NULL,
  `reg_date` datetime NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airbnb_host`
--

LOCK TABLES `airbnb_host` WRITE;
/*!40000 ALTER TABLE `airbnb_host` DISABLE KEYS */;
INSERT INTO `airbnb_host` VALUES (1,'test','주택','펜션','개인실',5,2,3,2,2,3,2,'06302','서울 강남구 양재천로 163','123','필수 품목,무선인터넷,업무 가능 공간/책상,옷장/서랍장','구급상자,화재 감지기','자쿠지,주방,수영장','숙소설명\r\n\r\n숙소설명\r\n\r\n\r\n숙소설명숙소설명숙소설명숙소설명\r\n\r\n숙소설명숙소설명숙소설명\r\n\r\n\r\n숙소설명숙소설명숙소설명\r\n\r\n\r\n숙소설명숙소설명숙소설명',30000,'제목1제목1제목1제목1','2021-02-05 09:14:26'),(2,'test','아파트','레지던스','개인실',4,0,2,1,1,1,1,'46729','부산 강서구 가달1로 7','1','필수 품목,TV,조식,게스트 전용 출입문','구급상자,화재 감지기','세탁 공간-건조기,세탁 공간-세탁기,헬스장','아파트 입니다\r\n\r\n아파트 입니다아파트 입니다\r\n\r\n아파트 입니다아파트 입니다아파트 입니다\r\n\r\n아파트 입니다아파트 입니다아파트 입니다아파트 입니다',1000,'아파트 입니다','2021-02-08 12:45:58'),(3,'test','독특한 숙소','보트','다인실',1,0,1,0,0,0,1,'23036','인천 강화군 강화읍 갑룡길 3','2','난방,업무 가능 공간/책상,옷장/서랍장','소화기','주방','독특한 숙소입니다.\r\n\r\n독특한 숙소입니다.\r\n\r\n\r\n독특한 숙소입니다.독특한 숙소입니다.독특한 숙소입니다.',2000,'독특한 숙소입니다.','2021-02-08 12:47:53'),(4,'test','부티크 호텔','아파트 호텔','다인실',1,0,1,0,0,0,1,'42463','대구 남구 경상길 1','232','에어콘','구급상자,일산화탄소 감지기','자쿠지,세탁 공간-세탁기','호텔 입니다.\r\n\r\n호텔 입니다.\r\n\r\n호텔 입니다.호텔 입니다.호텔 입니다.\r\n\r\n호텔 입니다.호텔 입니다.',3000,'호텔 입니다.','2021-02-08 12:49:15'),(5,'test','주택','방갈로','개인실',1,0,1,0,0,0,1,'46770','부산 강서구 거가대로 2659','2','에어콘,조식,업무 가능 공간/책상','소화기','세탁 공간-세탁기','주택입니다2.\r\n\r\n주택입니다2.\r\n\r\n주택입니다2.주택입니다2.\r\n\r\n주택입니다2.주택입니다2.\r\n\r\n주택입니다2.주택입니다2.',4000,'주택입니다2.','2021-02-08 12:50:55'),(6,'test','독특한 숙소','캠핑카','다인실',2,0,1,0,0,0,1,'49376','부산 사하구 감내1로 7','2','에어콘','구급상자','수영장','테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1\r\n테스트1테스트1테스트1테스트1\r\n테스트1\r\n테스트1\r\n\r\n테스트1테스트1테스트1테스트1테스트1\r\n테스트1테스트1테스트1테스트1테스트1테스트1',5000,'테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1','2021-02-08 19:21:07'),(7,'test','부티크 호텔','레지던스','다인실',5,2,1,0,0,0,1,'48798','부산 동구 고관로 5','23','조식','구급상자','수영장','숙소 설명숙소 설명숙소 설명숙소 설명\r\n숙소 설명숙소 설명숙소 설명숙소 설명숙소 설명\r\n숙소 설명숙소 설명숙소 설명숙소 설명숙소 설명\r\n숙소 설명숙소 설명숙소 설명\r\n\r\n숙소 설명숙소 설명숙소 설명숙소 설명',6000,'제목제목제목제목제목제목제목제목제목제목','2021-02-08 19:29:36'),(8,'test','독특한 숙소','농장 체험 숙박','다인실',6,2,3,1,1,1,2,'48060','부산 해운대구 APEC로 17','33','에어콘,헤어드라이기,벽난로','구급상자,화재 감지기','주방,헬스장','게스트에게 숙소에 대한 설명해주세요.게스트에게 숙소에 대한 설명해주세요.\r\n게스트에게 숙소에 대한 설명해주세요.게스트에게 숙소에 대한 설명해주세요.\r\n\r\n게스트에게 숙소에 대한 설명해주세요.게스트에게 숙소에 대한 설명해주세요.\r\n게스트에게 숙소에 대한 설명해주세요.\r\n게스트에게 숙소에 대한 설명해주세요.게스트에게 숙소에 대한 설명해주세요.\r\n\r\n게스트에게 숙소에 대한 설명해주세요.',7000,'숙소의 제목을 만드세요.숙소의 제목을 만드세요.','2021-02-08 19:31:02'),(9,'test','주택','타운하우스','다인실',7,2,3,1,1,1,2,'46990','부산 사상구 가야대로 1','123','에어콘,조식','구급상자','주방','게스트에게 숙소에 대한 설명해주세요.\r\n숙소의 장점, 특별한 편의시설(예: 빠른 게스트에게 숙소에 대한 설명해주세요.\r\n숙소의 장점, 특별한 편의시설(예: 빠른 게스트에게 숙소에 대한 설명해주세요.\r\n숙소의 장점, 특별한 편의시설(예: 빠른 ',8000,'특징과 장점을 강조하는 제목특징과 장점을 강조하는 제목','2021-02-08 19:34:10'),(12,'asdf1234','아파트','공동주택','집 전체',3,1,2,1,1,1,2,'06313','서울 강남구 논현로 4','논논논','에어콘','구급상자','헬스장','른 와이파이 또는 주차 시른 와이파이 또는 주차 시른 와이파이 또는 주차 시\r\n른 와이파이 또는 주차 시른 와이파이 또는 주차 시\r\n\r\n른 와이파이 또는 주차 시른 와이파이 또는 주차 시른 와이파이 또는 주차 시',10000,'숙소의 특징과 장점을 강조하는숙소의 특징과 장점을 강조하는','2021-02-17 11:55:01');
/*!40000 ALTER TABLE `airbnb_host` ENABLE KEYS */;
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

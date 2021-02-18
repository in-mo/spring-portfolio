# spring-portfolio
# 개발 환경 : MySQl 5.7

# 회원 정보
    관리자 정보
    id : admin
    password : admin1234

    일반 회원 정보
    id : asdf1234
    password : asdf1234

# 예약 테이블
```SQL
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
 ) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin
 ```
 
# 고객센터 FAQ 게시판 테이블
 ```SQL
 CREATE TABLE `airbnb_custom_service_faq` (
   `num` int(11) NOT NULL AUTO_INCREMENT,
   `id` varchar(45) COLLATE utf8_bin NOT NULL,
   `subject` varchar(100) COLLATE utf8_bin NOT NULL,
   `content` varchar(2000) COLLATE utf8_bin NOT NULL,
   `readcount` int(11) NOT NULL,
   `reg_date` datetime NOT NULL,
   PRIMARY KEY (`num`)
 ) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin
 ```
 
 # 고객센터 QnA 게시판 테이블
 ```SQL
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
 ) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_bin
 ```
 
 # 숙박지 테이블
 ```SQL
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
 ) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin
 ```
 
 # 숙박지 이미지 테이블
 ```SQL
 CREATE TABLE `airbnb_host_image` (
   `num` int(11) NOT NULL AUTO_INCREMENT,
   `uuid` varchar(36) COLLATE utf8_bin NOT NULL,
   `filename` varchar(1000) COLLATE utf8_bin NOT NULL,
   `uploadpath` varchar(1000) COLLATE utf8_bin NOT NULL,
   `noNum` int(11) NOT NULL,
   PRIMARY KEY (`num`)
 ) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin
```

# 회원이 저장한 숙박지 테이블
```SQL
CREATE TABLE `airbnb_host_save` (
   `num` int(11) NOT NULL AUTO_INCREMENT,
   `host_num` int(11) NOT NULL,
   `id` varchar(45) COLLATE utf8_bin NOT NULL,
   `isSave` varchar(5) COLLATE utf8_bin NOT NULL,
   PRIMARY KEY (`num`)
 ) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin
 ```
 # 검색 지역 테이블
 ```SQL
 CREATE TABLE `airbnb_location` (
   `location` varchar(9) COLLATE utf8_bin NOT NULL,
   PRIMARY KEY (`location`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
 ```
 
 # 메일 인증번호 테이블
 ```SQL
 CREATE TABLE `airbnb_mail_certified` (
   `email` varchar(100) COLLATE utf8_bin NOT NULL,
   `number` varchar(6) COLLATE utf8_bin NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
 ```
 # 후기 및 평점 테이블
 ```SQL
 CREATE TABLE `airbnb_review` (
   `num` int(11) NOT NULL AUTO_INCREMENT,
   `id` varchar(45) COLLATE utf8_bin NOT NULL,
   `comment` varchar(2000) COLLATE utf8_bin NOT NULL,
   `score` varchar(5) COLLATE utf8_bin NOT NULL,
   `no_num` int(11) NOT NULL,
   `book_num` int(11) DEFAULT NULL,
   `reg_date` datetime NOT NULL,
   PRIMARY KEY (`num`)
 ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin
 ```
 
 # 회원 정보 테이블
 ```SQL
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
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin
 ```

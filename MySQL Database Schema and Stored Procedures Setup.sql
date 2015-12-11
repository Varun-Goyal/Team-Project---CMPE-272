-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: infra
-- ------------------------------------------------------
-- Server version	5.6.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `ADMIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADMIN_NAME` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `FNAME` varchar(45) DEFAULT NULL,
  `LNAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_ID`),
  UNIQUE KEY `ADMIN_NAME_UNIQUE` (`ADMIN_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'awaise267@gmail.com','12345','Mohammad','Awaise');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `REQUEST_ID` int(11) DEFAULT NULL,
  `COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMMENT_TEXT` varchar(1000) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`COMMENT_ID`),
  UNIQUE KEY `COMMENT_ID_UNIQUE` (`COMMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,'Good',1),(18,16,'Test',2),(16,17,'What',2);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img_map`
--

DROP TABLE IF EXISTS `img_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img_map` (
  `REQUEST_ID` int(11) NOT NULL,
  `IMG_PATH` varchar(200) NOT NULL,
  PRIMARY KEY (`REQUEST_ID`,`IMG_PATH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img_map`
--

LOCK TABLES `img_map` WRITE;
/*!40000 ALTER TABLE `img_map` DISABLE KEYS */;
INSERT INTO `img_map` VALUES (1,'C://abc/123');
/*!40000 ALTER TABLE `img_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailing_list`
--

DROP TABLE IF EXISTS `mailing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailing_list` (
  `ZIPCODE` int(11) NOT NULL,
  `EMAIL_ID` varchar(100) NOT NULL,
  `STATE` varchar(45) NOT NULL,
  `COUNTRY` varchar(45) NOT NULL,
  PRIMARY KEY (`ZIPCODE`,`STATE`,`EMAIL_ID`,`COUNTRY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailing_list`
--

LOCK TABLES `mailing_list` WRITE;
/*!40000 ALTER TABLE `mailing_list` DISABLE KEYS */;
INSERT INTO `mailing_list` VALUES (95112,'kartikpatil990@gmail.com','CA','US'),(95112,'tes2t@test.com','CA','US'),(95112,'test@test.com','CA','US'),(95126,'awaise267@gmail.com','CA','US');
/*!40000 ALTER TABLE `mailing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `REQUEST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME_OF_INFRA` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `ZIPCODE` int(11) DEFAULT NULL,
  `COUNTRY` varchar(45) DEFAULT NULL,
  `STATE` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `DATE_UPLOADED` date DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `IS_ACTIVE` int(11) DEFAULT NULL,
  `LAT` double DEFAULT NULL,
  `LNG` double DEFAULT NULL,
  `IMAGEFILE` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`REQUEST_ID`),
  UNIQUE KEY `REQUEST_ID_UNIQUE` (`REQUEST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,'GOLDEN_GATE','SF',95111,'USA','CA','Crack','2015-11-01',1,1,38,-122,NULL),(8,'undefined','undefined',12345,'US','undefined','undefined','2015-12-08',2,1,37,-122,NULL),(9,'Test','San Jose',12345,'US','CA','Test','2015-12-08',2,1,37,-122,NULL),(10,'Test','San Jose',95126,'US','CA','Test','2015-12-08',2,0,37,-122,NULL),(11,'Test','San Jose',94156,'US','CA','Test','2015-12-08',2,1,38,-122,NULL),(12,'Test','San Jose',94156,'US','CA','Test','2015-12-08',2,1,37.78,-122.42,NULL),(13,'Test','San Jose',95112,'US','CA','Test','2015-12-08',2,1,37.3456227,-121.8847222,NULL),(14,'Test','San Jose',94101,'US','CA','Test','2015-12-08',2,1,39.5,-98.35,NULL),(15,'Test','San Jose',95112,'US','CA','Test','2015-12-08',2,1,37.3456227,-121.8847222,NULL),(16,'Test','San Francisco',94101,'US','CA','Test','2015-12-08',2,1,39.5,-98.35,NULL),(17,'Statue Of Liberty','New York',10004,'US','NY','Broken in Half','2015-12-08',2,1,40.7038704,-74.0138541,'2_b04waqfXTbyA83wu57ptRf.JPG'),(18,'Test 3','Test ',95112,'US','CA','Test 3','2015-12-09',2,1,37.3456227,-121.8847222,'2_sWNZjXqiR9z52XBmGoIjHu.JPG');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_home`
--

DROP TABLE IF EXISTS `test_home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_home` (
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_home`
--

LOCK TABLES `test_home` WRITE;
/*!40000 ALTER TABLE `test_home` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upvotes`
--

DROP TABLE IF EXISTS `upvotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upvotes` (
  `REQUEST_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`REQUEST_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upvotes`
--

LOCK TABLES `upvotes` WRITE;
/*!40000 ALTER TABLE `upvotes` DISABLE KEYS */;
INSERT INTO `upvotes` VALUES (1,1);
/*!40000 ALTER TABLE `upvotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `GENDER` varchar(45) DEFAULT NULL,
  `FNAME` varchar(45) DEFAULT NULL,
  `LNAME` varchar(45) DEFAULT NULL,
  `ZIPCODE` int(11) DEFAULT NULL,
  `COUNTRY` varchar(45) DEFAULT NULL,
  `STATE` varchar(45) DEFAULT NULL,
  `LAT` double DEFAULT '39.5',
  `LNG` double DEFAULT '-98.35',
  `IMAGEFILE` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `Username_UNIQUE` (`USERNAME`),
  UNIQUE KEY `Email_UNIQUE` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'kartik','password','kartik@gmail.com','1990-11-09','Male','Kartik','Patil',95112,'USA','CA',39.5,-98.35,NULL),(2,'awaise','root','awaise@gmail.com','1990-01-01','Male','Awaise','Mohhamad',95112,'USA','CA',39.5,-98.35,NULL),(3,'awaise267@gmail.com','7OCRr','awaise267@gmail.com','1991-07-26','Male','Awaise','Mohammad',95112,'USA','California',39.5,-98.35,NULL),(4,'dasdas@dasd.com','12345','dasdas@dasd.com','2015-12-09','Male','czxczx','dasdas',12345,'czxc','CA',39.5,-98.35,NULL),(5,'awasdas@dasd.com','12345','awasdas@dasd.com','2015-07-08','Male','Test','Test',95112,'US','CA',39.5,-98.35,NULL),(6,'test@test.com','12345','test@test.com','2015-12-04','Female','Test','Test',95112,'USA','CA',39.5,-98.35,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'infra'
--

--
-- Dumping routines for database 'infra'
--
/*!50003 DROP PROCEDURE IF EXISTS `approve_posts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `approve_posts`(var1 INT)
BEGIN
update infra.request
set IS_ACTIVE=1 
where REQUEST_ID=var1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_posts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_posts`()
BEGIN

select r.REQUEST_ID, r.NAME_OF_INFRA, r.ADDRESS, r.ZIPCODE, r.COUNTRY, r.STATE, r.DESCRIPTION,
 r.DATE_UPLOADED, r.USER_ID , r.IS_ACTIVE,c.comment_id, c.comment_text, c.user_id ,r.Fname, uv.likes
 from 

(select r.REQUEST_ID, r.NAME_OF_INFRA, r.ADDRESS, r.ZIPCODE, r.COUNTRY, r.STATE, r.DESCRIPTION,
 r.DATE_UPLOADED, r.USER_ID , r.IS_ACTIVE, u.fname
 from infra.request R, infra.user u
 where r.IS_ACTIVE=1 
 and r.user_id=u.user_id) r
 
 left outer join infra.comments c
 on r.REQUEST_ID=c.REQUEST_ID
 
 left outer join (select count(user_id) as likes,REQUEST_ID 
 from infra.upvotes uv group by request_id) uv
 on uv.REQUEST_ID=r.REQUEST_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_posts_location_based` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_posts_location_based`(var1 INT)
BEGIN
select r.REQUEST_ID, r.NAME_OF_INFRA, r.ADDRESS, r.ZIPCODE, r.COUNTRY, r.STATE, r.DESCRIPTION,
 r.DATE_UPLOADED, r.USER_ID , r.IS_ACTIVE,c.comment_id, c.comment_text, c.user_id ,r.Fname, uv.likes
 from 

(select r.REQUEST_ID, r.NAME_OF_INFRA, r.ADDRESS, r.ZIPCODE, r.COUNTRY, r.STATE, r.DESCRIPTION,
 r.DATE_UPLOADED, r.USER_ID , r.IS_ACTIVE, u.fname
 from infra.request R, infra.user u
 where r.IS_ACTIVE=0 
 and r.user_id=u.user_id
 and r.ZIPCODE=var1) r
 
 left outer join infra.comments c
 on r.REQUEST_ID=c.REQUEST_ID
 
 left outer join (select count(user_id) as likes,REQUEST_ID 
 from infra.upvotes uv group by request_id) uv
 on uv.REQUEST_ID=r.REQUEST_ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_comments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_comments`(var1 int)
BEGIN
select C.REQUEST_ID,C.COMMENT_ID,C.COMMENT_TEXT,C.USER_ID,U.FNAME,U.LNAME,U.IMAGEFILE from infra.comments C INNER JOIN user U ON C.USER_ID = U.USER_ID
where REQUEST_ID=var1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_IMG_PATH` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_IMG_PATH`(var1 INT)
BEGIN
select REQUEST_ID,IMG_PATH from infra.IMG_MAP
 where REQUEST_ID=var1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_PENDING_POSTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_PENDING_POSTS`()
BEGIN
select r.REQUEST_ID, r.NAME_OF_INFRA, r.ADDRESS, r.ZIPCODE, r.COUNTRY, r.STATE, r.DESCRIPTION,
 r.DATE_UPLOADED, r.USER_ID , r.IS_ACTIVE
 from infra.request R
 where r.IS_ACTIVE=0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_comments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_comments`(REQUEST_ID INT,COMMENT_TEXT varchar(1000), USER_ID INT)
BEGIN
INSERT INTO `infra`.`comments` (`REQUEST_ID`, `COMMENT_TEXT`, `USER_ID`) 
VALUES (REQUEST_ID, COMMENT_TEXT, USER_ID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_IMG_MAP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_IMG_MAP`(REQUEST_ID INT, IMG_PATH varchar(200))
BEGIN
INSERT INTO `infra`.`IMG_MAP` (`REQUEST_ID`, `IMG_PATH`) VALUES (REQUEST_ID, IMG_PATH);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_REQUEST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_REQUEST`(REQUEST_ID INT, NAME_OF_INFRA varchar(50), 
ADDRESS varchar(50), ZIPCODE INT, COUNTRY varchar(50), STATE varchar(50), 
DESCRIPTION varchar(1000),DATE_UPLOADED DATE, USER_ID INT, FLAG INT)
BEGIN

INSERT INTO `infra`.`REQUEST`
 (`REQUEST_ID`, `NAME_OF_INFRA`, `ADDRESS`, `ZIPCODE`, `COUNTRY`, 
 `STATE`, `DESCRIPTION`, `DATE_UPLOADED`, `USER_ID`,`FLAG`) VALUES (REQUEST_ID, NAME_OF_INFRA, ADDRESS, ZIPCODE, COUNTRY, STATE, DESCRIPTION,
 DATE_UPLOADED, USER_ID,FLAG);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_upvotes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_upvotes`(REQUEST_ID INT ,USER_ID INT)
BEGIN
INSERT INTO `infra`.`upvotes` (`REQUEST_ID`, `USER_ID`) VALUES (REQUEST_ID, USER_ID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user`(USER_ID INT, USERNAME varchar(50), PASSWORD varchar(50),
EMAIL varchar(100), DOB DATE, GENDER VARCHAR(50), FNAME varchar(50), LNAME varchar(50),
ZIPCODE INT, COUNTRY varchar(50), state varchar(50))
BEGIN
INSERT INTO `infra`.`User` (`USER_ID`, 
`USERNAME`, `PASSWORD`, `EMAIL`, `DOB`, `GENDER`, `FNAME`, 
`LNAME`, `ZIPCODE`, `COUNTRY`, `STATE`) 

VALUES (USER_ID, USERNAME, PASSWORD, EMAIL, DOB, GENDER,
 FNAME, LNAME, ZIPCODE, COUNTRY, state);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LOGIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LOGIN`(uname varchar(50),pwd varchar(50))
BEGIN
SELECT USER_ID, FNAME, ZIPCODE 
	FROM infra.user
		where USERNAME=uname
		and PASSWORD=pwd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sorted_request` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sorted_request`(var1 INT)
BEGIN

SELECT R.REQUEST_ID, R.NAME_OF_INFRA, R.ADDRESS, R.ZIPCODE, R.COUNTRY, R.STATE, R.DESCRIPTION, R.DATE_UPLOADED, R.IMAGEFILE, U.FNAME, U.LNAME, 111.1111 *  DEGREES(ACOS(COS(RADIANS(R.LAT))* COS(RADIANS(USR.LAT))* COS(RADIANS(R.LNG - USR.LNG))+ SIN(RADIANS(R.LAT))* SIN(RADIANS(USR.LAT)))) as DISTANCE_IN_KM

FROM
infra.request R INNER JOIN infra.user U on R.USER_ID = U.USER_ID, infra.user USR

WHERE USR.USER_ID = var1 ORDER BY DISTANCE_IN_KM ASC

LIMIT 10;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-09 15:03:41

CREATE DATABASE  IF NOT EXISTS `oauth_test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `oauth_test`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: oauth_test
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `ID` int(11) NOT NULL,
  `HOUSE_NUMBER` varchar(255) DEFAULT NULL,
  `STREET` varchar(255) DEFAULT NULL,
  `ZIP_CODE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'1','Street X','12-341'),(2,'2','Street Y','12-342'),(3,'3','Street Z','12-343'),(4,'4','Street XX','12-344'),(5,'5','Street YY','12-345'),(6,'6','Street ZZ','12-346'),(7,'7','Street XXX','12-347');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authority` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AUTHORITY_NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES (1,'COMPANY_CREATE'),(4,'COMPANY_DELETE'),(2,'COMPANY_READ'),(3,'COMPANY_UPDATE'),(5,'DEPARTMENT_CREATE'),(8,'DEPARTMENT_DELETE'),(6,'DEPARTMENT_READ'),(7,'DEPARTMENT_UPDATE'),(9,'ROLE_COMPANY_READER');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `ID` int(11) NOT NULL,
  `REGISTRATION_NUMBER` varchar(255) DEFAULT NULL,
  `COMPANY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKJQP14DKMI2LH5KJAVV4T0DKQY` (`COMPANY_ID`),
  CONSTRAINT `FKJQP14DKMI2LH5KJAVV4T0DKQY` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'XYZ10ABC',1),(2,'XYZ11ABC',1),(3,'XYZ12ABC',1),(4,'XYZ13ABC',2);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UKS7T58YCLDRJRFTPUN092TKHU7` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (2,'Coca Cola'),(1,'Pepsi'),(3,'Sprite');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `COMPANY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKH1M88Q0F7SC0MK76KJU4KCN6F` (`COMPANY_ID`),
  CONSTRAINT `FKH1M88Q0F7SC0MK76KJU4KCN6F` FOREIGN KEY (`COMPANY_ID`) REFERENCES `company` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Sales & Marketing',1),(2,'Research & Development',1),(3,'Administration',1),(4,'Human Resources',2),(5,'Sales & Marketing',3);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SURNAME` varchar(255) NOT NULL,
  `ADDRESS_ID` int(11) DEFAULT NULL,
  `DEPARTMENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKBEJTWVG9BXUS2MFFSM3SWJ3U9` (`DEPARTMENT_ID`),
  KEY `FKGA73HDTPB67TWLR9C1I337TYT` (`ADDRESS_ID`),
  CONSTRAINT `FKBEJTWVG9BXUS2MFFSM3SWJ3U9` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `department` (`ID`),
  CONSTRAINT `FKGA73HDTPB67TWLR9C1I337TYT` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `address` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'John','William',1,1),(2,'Robert','James',2,2),(3,'Donald','Tyler',3,3);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_token`
--

DROP TABLE IF EXISTS `oauth_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_token` (
  `TOKEN_ID` varchar(255) DEFAULT NULL,
  `TOKEN` blob,
  `AUTHENTICATION_ID` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTHENTICATION` blob,
  `REFRESH_TOKEN` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AUTHENTICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
INSERT INTO `oauth_access_token` VALUES ('03dd9bc9f87476700b40a75c0ca3565a','¬\í\0sr\0Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken²ž6$ú\Î\0L\0additionalInformationt\0Ljava/util/Map;L\0\nexpirationt\0Ljava/util/Date;L\0refreshTokent\0?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\0scopet\0Ljava/util/Set;L\0	tokenTypet\0Ljava/lang/String;L\0valueq\0~\0xpsr\0java.util.Collections$EmptyMapY6…Z\Ü\ç\Ð\0\0xpsr\0java.util.DatehjKYt\0\0xpw\0\0c:ú\Þxsr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ßGc\ÐÉ·\0L\0\nexpirationq\0~\0xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\á\ncT\Ô^\0L\0valueq\0~\0xpt\0$1e72a91e-aaed-454e-8384-8de9cd0e5796sq\0~\0	w\0\0c\Ô\Ô\\xsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0ct\0Ljava/util/Collection;xpsr\0java.util.LinkedHashSet\Øl\×Z•\Ý*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writext\0bearert\0$cf13e78d-d9cf-4ddb-9490-136c6cc54a5f','d557e74143287f87984f133c7409755d','admin','spring-security-oauth2-read-write-client','¬\í\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication½@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenÓª(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableListü%1µ\ìŽ\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0cq\0~\0xpsr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0	w\0\0\0	sr\0>com.adamzareba.spring.security.oauth2.model.security.Authority¶—\ãBŠ0\'™\0L\0idt\0Ljava/lang/Long;L\0namet\0Ljava/lang/String;xpsr\0java.lang.Long;‹\äÌ#\ß\0J\0valuexr\0java.lang.Number†¬•”\à‹\0\0xp\0\0\0\0\0\0\0t\0COMPANY_CREATEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0COMPANY_READsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0COMPANY_UPDATEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0COMPANY_DELETEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0DEPARTMENT_CREATEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0DEPARTMENT_READsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0DEPARTMENT_UPDATEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0DEPARTMENT_DELETEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0	t\0ROLE_COMPANY_READERxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\00xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qi½\0L\0clientIdq\0~\0L\0requestParametersq\0~\0.L\0scopeq\0~\00xpt\0(spring-security-oauth2-read-write-clientsr\0%java.util.Collections$UnmodifiableMapñ¥¨þtõB\0L\0mq\0~\0.xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0(spring-security-oauth2-read-write-clientt\0usernamet\0adminxsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\Øl\×Z•\Ý*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writexsq\0~\0Aw\0\0\0?@\0\0\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0¤\0L\0roleq\0~\0xpt\0USERxsq\0~\06?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0Aw\0\0\0?@\0\0\0\0\0t\0resource-server-rest-apixsq\0~\0Aw\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0¤\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0	w\0\0\0	q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0!q\0~\0$q\0~\0\'q\0~\0*xq\0~\0Psr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\06?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\08q\0~\09q\0~\0:q\0~\0;q\0~\0<q\0~\0=x\0psr\09com.adamzareba.spring.security.oauth2.model.security.UserOž\Z8J†\í-\0Z\0accountExpiredZ\0\raccountLockedZ\0credentialsExpiredZ\0enabledL\0authoritiesq\0~\0L\0idq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xp\0\0\0sr\0/org.hibernate.collection.internal.PersistentBagecý? ‚\0\0L\0bagq\0~\0xr\0>org.hibernate.collection.internal.AbstractPersistentCollection\é\Ó\ÜM©;¥\0\nZ\0allowLoadOutsideTransactionI\0\ncachedSizeZ\0dirtyZ\0initializedZ\0\risTempSessionL\0keyt\0Ljava/io/Serializable;L\0ownerq\0~\0L\0roleq\0~\0L\0sessionFactoryUuidq\0~\0L\0storedSnapshotq\0~\0Wxp\0ÿÿÿÿ\0\0q\0~\0q\0~\0Tt\0Ecom.adamzareba.spring.security.oauth2.model.security.User.authoritiespsq\0~\0\0\0\0	w\0\0\0	q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0!q\0~\0$q\0~\0\'q\0~\0*xsq\0~\0\0\0\0	w\0\0\0	q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0!q\0~\0$q\0~\0\'q\0~\0*xq\0~\0t\0<$2a$08$qvrzQZ7jJ7oy2p/msL4M0.l83Cd0jNsX6AJUitbgRXGzge4j035hat\0admin','a818f236b07a2d49e4750fbf41c01f5f');
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_approvals`
--

DROP TABLE IF EXISTS `oauth_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_approvals` (
  `USERID` varchar(255) DEFAULT NULL,
  `CLIENTID` varchar(255) DEFAULT NULL,
  `SCOPE` varchar(255) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `EXPIRESAT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LASTMODIFIEDAT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_approvals`
--

LOCK TABLES `oauth_approvals` WRITE;
/*!40000 ALTER TABLE `oauth_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_details`
--

DROP TABLE IF EXISTS `oauth_client_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_details` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `RESOURCE_IDS` varchar(255) DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) DEFAULT NULL,
  `SCOPE` varchar(255) DEFAULT NULL,
  `AUTHORIZED_GRANT_TYPES` varchar(255) DEFAULT NULL,
  `WEB_SERVER_REDIRECT_URI` varchar(255) DEFAULT NULL,
  `AUTHORITIES` varchar(255) DEFAULT NULL,
  `ACCESS_TOKEN_VALIDITY` int(11) DEFAULT NULL,
  `REFRESH_TOKEN_VALIDITY` int(11) DEFAULT NULL,
  `ADDITIONAL_INFORMATION` varchar(4096) DEFAULT NULL,
  `AUTOAPPROVE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_details`
--

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
INSERT INTO `oauth_client_details` VALUES ('spring-security-oauth2-read-client','resource-server-rest-api','$2a$04$WGq2P9egiOYoOFemBRfsiO9qTcyJtNRnPKNBl5tokP7IP.eZn93km','read','password,authorization_code,refresh_token,implicit',NULL,'USER',10800,2592000,NULL,NULL),('spring-security-oauth2-read-write-client','resource-server-rest-api','$2a$04$soeOR.QFmClXeFIrhJVLWOQxfHjsJLSpWrU1iGxcMGdu.a5hvfY4W','read,write','password,authorization_code,refresh_token,implicit',NULL,'USER',10800,2592000,NULL,NULL);
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_token`
--

DROP TABLE IF EXISTS `oauth_client_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_token` (
  `TOKEN_ID` varchar(255) DEFAULT NULL,
  `TOKEN` blob,
  `AUTHENTICATION_ID` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AUTHENTICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_token`
--

LOCK TABLES `oauth_client_token` WRITE;
/*!40000 ALTER TABLE `oauth_client_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_code`
--

DROP TABLE IF EXISTS `oauth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_code` (
  `CODE` varchar(255) DEFAULT NULL,
  `AUTHENTICATION` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_code`
--

LOCK TABLES `oauth_code` WRITE;
/*!40000 ALTER TABLE `oauth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_token`
--

DROP TABLE IF EXISTS `oauth_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_token` (
  `TOKEN_ID` varchar(255) DEFAULT NULL,
  `TOKEN` blob,
  `AUTHENTICATION` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_token`
--

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
INSERT INTO `oauth_refresh_token` VALUES ('a818f236b07a2d49e4750fbf41c01f5f','¬\í\0sr\0Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\ßGc\ÐÉ·\0L\0\nexpirationt\0Ljava/util/Date;xr\0Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\á\ncT\Ô^\0L\0valuet\0Ljava/lang/String;xpt\0$1e72a91e-aaed-454e-8384-8de9cd0e5796sr\0java.util.DatehjKYt\0\0xpw\0\0c\Ô\Ô\\x','¬\í\0sr\0Aorg.springframework.security.oauth2.provider.OAuth2Authentication½@bR\0L\0\rstoredRequestt\0<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\0userAuthenticationt\02Lorg/springframework/security/core/Authentication;xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenÓª(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailst\0Ljava/lang/Object;xp\0sr\0&java.util.Collections$UnmodifiableListü%1µ\ìŽ\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0€\Ë^÷\0L\0cq\0~\0xpsr\0java.util.ArrayListx\Ò™\Ça\0I\0sizexp\0\0\0	w\0\0\0	sr\0>com.adamzareba.spring.security.oauth2.model.security.Authority¶—\ãBŠ0\'™\0L\0idt\0Ljava/lang/Long;L\0namet\0Ljava/lang/String;xpsr\0java.lang.Long;‹\äÌ#\ß\0J\0valuexr\0java.lang.Number†¬•”\à‹\0\0xp\0\0\0\0\0\0\0t\0COMPANY_CREATEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0COMPANY_READsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0COMPANY_UPDATEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0COMPANY_DELETEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0DEPARTMENT_CREATEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0DEPARTMENT_READsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0DEPARTMENT_UPDATEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0t\0DEPARTMENT_DELETEsq\0~\0\rsq\0~\0\0\0\0\0\0\0\0	t\0ROLE_COMPANY_READERxq\0~\0psr\0:org.springframework.security.oauth2.provider.OAuth2Request\0\0\0\0\0\0\0\0Z\0approvedL\0authoritiesq\0~\0L\0\nextensionst\0Ljava/util/Map;L\0redirectUriq\0~\0L\0refresht\0;Lorg/springframework/security/oauth2/provider/TokenRequest;L\0resourceIdst\0Ljava/util/Set;L\0\rresponseTypesq\0~\00xr\08org.springframework.security.oauth2.provider.BaseRequest6(z>£qi½\0L\0clientIdq\0~\0L\0requestParametersq\0~\0.L\0scopeq\0~\00xpt\0(spring-security-oauth2-read-write-clientsr\0%java.util.Collections$UnmodifiableMapñ¥¨þtõB\0L\0mq\0~\0.xpsr\0java.util.HashMap\ÚÁ\Ã`\Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\ngrant_typet\0passwordt\0	client_idt\0(spring-security-oauth2-read-write-clientt\0usernamet\0adminxsr\0%java.util.Collections$UnmodifiableSet€’Ñ›€U\0\0xq\0~\0	sr\0java.util.LinkedHashSet\Øl\×Z•\Ý*\0\0xr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0readt\0writexsq\0~\0Aw\0\0\0?@\0\0\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0¤\0L\0roleq\0~\0xpt\0USERxsq\0~\06?@\0\0\0\0\0\0w\0\0\0\0\0\0\0xppsq\0~\0Aw\0\0\0?@\0\0\0\0\0t\0resource-server-rest-apixsq\0~\0Aw\0\0\0?@\0\0\0\0\0\0xsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0¤\0L\0credentialsq\0~\0L\0	principalq\0~\0xq\0~\0sq\0~\0sq\0~\0\0\0\0	w\0\0\0	q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0!q\0~\0$q\0~\0\'q\0~\0*xq\0~\0Psr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxq\0~\06?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\08q\0~\09q\0~\0:q\0~\0;q\0~\0<q\0~\0=x\0psr\09com.adamzareba.spring.security.oauth2.model.security.UserOž\Z8J†\í-\0Z\0accountExpiredZ\0\raccountLockedZ\0credentialsExpiredZ\0enabledL\0authoritiesq\0~\0L\0idq\0~\0L\0passwordq\0~\0L\0usernameq\0~\0xp\0\0\0sr\0/org.hibernate.collection.internal.PersistentBagecý? ‚\0\0L\0bagq\0~\0xr\0>org.hibernate.collection.internal.AbstractPersistentCollection\é\Ó\ÜM©;¥\0\nZ\0allowLoadOutsideTransactionI\0\ncachedSizeZ\0dirtyZ\0initializedZ\0\risTempSessionL\0keyt\0Ljava/io/Serializable;L\0ownerq\0~\0L\0roleq\0~\0L\0sessionFactoryUuidq\0~\0L\0storedSnapshotq\0~\0Wxp\0ÿÿÿÿ\0\0q\0~\0q\0~\0Tt\0Ecom.adamzareba.spring.security.oauth2.model.security.User.authoritiespsq\0~\0\0\0\0	w\0\0\0	q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0!q\0~\0$q\0~\0\'q\0~\0*xsq\0~\0\0\0\0	w\0\0\0	q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0q\0~\0!q\0~\0$q\0~\0\'q\0~\0*xq\0~\0t\0<$2a$08$qvrzQZ7jJ7oy2p/msL4M0.l83Cd0jNsX6AJUitbgRXGzge4j035hat\0admin');
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `office` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ADDRESS_ID` int(11) DEFAULT NULL,
  `DEPARTMENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK4FFKMQMLNYV67LD0DCTCVJSFJ` (`DEPARTMENT_ID`),
  KEY `FKAK81M3GKJ8XQ5T48XUFLBJ0KN` (`ADDRESS_ID`),
  CONSTRAINT `FK4FFKMQMLNYV67LD0DCTCVJSFJ` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `department` (`ID`),
  CONSTRAINT `FKAK81M3GKJ8XQ5T48XUFLBJ0KN` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `address` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES (1,'Office of S&M Boston',4,1),(2,'Office of S&M New York',5,1),(3,'Office of R&D Boston',6,2),(4,'Office of A Los Angeles',7,3);
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_`
--

DROP TABLE IF EXISTS `user_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_` (
  `ID` int(11) NOT NULL,
  `ACCOUNT_EXPIRED` tinyint(1) DEFAULT NULL,
  `ACCOUNT_LOCKED` tinyint(1) DEFAULT NULL,
  `CREDENTIALS_EXPIRED` tinyint(1) DEFAULT NULL,
  `ENABLED` tinyint(1) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_USER_NAME` (`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_`
--

LOCK TABLES `user_` WRITE;
/*!40000 ALTER TABLE `user_` DISABLE KEYS */;
INSERT INTO `user_` VALUES (1,0,0,0,1,'$2a$08$qvrzQZ7jJ7oy2p/msL4M0.l83Cd0jNsX6AJUitbgRXGzge4j035ha','admin'),(2,0,0,0,1,'$2a$08$dwYz8O.qtUXboGosJFsS4u19LHKW7aCQ0LXXuNlRfjjGKwj5NfKSe','reader'),(3,0,0,0,1,'$2a$08$kPjzxewXRGNRiIuL4FtQH.mhMn7ZAFBYKB3ROz.J24IX8vDAcThsG','modifier'),(4,0,0,0,1,'$2a$08$vVXqh6S8TqfHMs1SlNTu/.J25iUCrpGBpyGExA.9yI.IlDRadR6Ea','reader2');
/*!40000 ALTER TABLE `user_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_authorities`
--

DROP TABLE IF EXISTS `users_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_authorities` (
  `USER_ID` int(11) NOT NULL,
  `AUTHORITY_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`,`AUTHORITY_ID`),
  KEY `USERS_AUTHORITIES_AUTHORITY_idx` (`AUTHORITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_authorities`
--

LOCK TABLES `users_authorities` WRITE;
/*!40000 ALTER TABLE `users_authorities` DISABLE KEYS */;
INSERT INTO `users_authorities` VALUES (1,1),(1,2),(2,2),(1,3),(3,3),(1,4),(1,5),(1,6),(2,6),(1,7),(3,7),(1,8),(1,9),(4,9);
/*!40000 ALTER TABLE `users_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-07 16:58:01

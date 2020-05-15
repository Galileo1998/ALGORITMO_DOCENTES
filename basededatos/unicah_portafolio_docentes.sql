-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: unicah_portafolio_docentes
-- ------------------------------------------------------
-- Server version	8.0.15
CREATE DATABASE unicah_portafolio_docentes;
USE unicah_portafolio_docentes;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asignaturas` (
  `idasignaturas` int(11) NOT NULL AUTO_INCREMENT,
  `dscAsignatura` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`idasignaturas`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
INSERT INTO `asignaturas` VALUES (1,'IF409PROGRAMACIÓN DE NEGOCIOS');
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campus`
--

DROP TABLE IF EXISTS `campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `campus` (
  `idcampus` int(11) NOT NULL AUTO_INCREMENT,
  `descCampus` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`idcampus`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campus`
--

LOCK TABLES `campus` WRITE;
/*!40000 ALTER TABLE `campus` DISABLE KEYS */;
INSERT INTO `campus` VALUES (1,'SAGRADO CORAZÓN DE JESÚS');
/*!40000 ALTER TABLE `campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carga_academica`
--

DROP TABLE IF EXISTS `carga_academica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `carga_academica` (
  `idcarga_academica` int(11) NOT NULL AUTO_INCREMENT,
  `campus` int(11) DEFAULT NULL,
  `periodo` varchar(120) DEFAULT NULL,
  `clase` int(11) DEFAULT NULL,
  `seccion` varchar(40) DEFAULT NULL,
  `catedratico` varchar(120) DEFAULT NULL,
  `horario` varchar(120) DEFAULT NULL,
  `edificio` varchar(40) DEFAULT NULL,
  `perfil` int(11) DEFAULT NULL,
  `horaCarga` datetime DEFAULT NULL,
  PRIMARY KEY (`idcarga_academica`),
  KEY `campus` (`campus`),
  KEY `clase` (`clase`),
  KEY `perfil` (`perfil`),
  CONSTRAINT `carga_academica_ibfk_1` FOREIGN KEY (`campus`) REFERENCES `campus` (`idcampus`),
  CONSTRAINT `carga_academica_ibfk_2` FOREIGN KEY (`clase`) REFERENCES `asignaturas` (`idasignaturas`),
  CONSTRAINT `carga_academica_ibfk_3` FOREIGN KEY (`perfil`) REFERENCES `perfiles` (`PerCod`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carga_academica`
--

LOCK TABLES `carga_academica` WRITE;
/*!40000 ALTER TABLE `carga_academica` DISABLE KEYS */;
INSERT INTO `carga_academica` VALUES (49,1,'2019 Segundo',1,'1301','RAFAEL EDGARDO MALDONADO                     ','20/05/19 - 17/08/19 | 13:00 - 16:50','F       L.07   ',3,'2019-07-17 23:32:56'),(50,1,'2019 Segundo',1,'1301','RAFAEL EDGARDO MALDONADO                     ','20/05/19 - 17/08/19 | 13:00 - 16:50','F       L.07   ',3,'2019-07-17 23:34:20'),(51,1,'2019 Segundo',1,'1301','RAFAEL EDGARDO MALDONADO                     ','20/05/19 - 17/08/19 | 13:00 - 16:50','F       L.07   ',3,'2019-07-17 23:36:02'),(52,1,'2019 Segundo',1,'1301','RAFAEL EDGARDO MALDONADO                     ','20/05/19 - 17/08/19 | 13:00 - 16:50','F       L.07   ',1,'2019-07-18 10:38:16'),(53,1,'2019 Segundo',1,'1301','RAFAEL EDGARDO MALDONADO                     ','20/05/19 - 17/08/19 | 13:00 - 16:50','F       L.07   ',1,'2019-07-18 13:02:36'),(54,1,'2019 Segundo',1,'1301','RAFAEL EDGARDO MALDONADO                     ','20/05/19 - 17/08/19 | 13:00 - 16:50','F       L.07   ',1,'2019-07-18 14:38:19'),(55,1,'2019 Segundo',1,'1301','RAFAEL EDGARDO MALDONADO                     ','20/05/19 - 17/08/19 | 13:00 - 16:50','F       L.07   ',1,'2019-07-18 15:52:42'),(56,1,'2019 Segundo',1,'1301','RAFAEL EDGARDO MALDONADO                     ','20/05/19 - 17/08/19 | 13:00 - 16:50','F       L.07   ',1,'2019-07-18 17:37:20'),(57,1,'2019 Segundo',1,'1301','RAFAEL EDGARDO MALDONADO                     ','20/05/19 - 17/08/19 | 13:00 - 16:50','F       L.07   ',5,'2019-07-18 18:34:24'),(58,1,'2019 Segundo',1,'1301','RAFAEL EDGARDO MALDONADO                     ','20/05/19 - 17/08/19 | 13:00 - 16:50','F       L.07   ',2,'2019-07-20 09:17:21');
/*!40000 ALTER TABLE `carga_academica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_carga`
--

DROP TABLE IF EXISTS `detalle_carga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detalle_carga` (
  `iddetalle_carga` int(11) NOT NULL AUTO_INCREMENT,
  `idestudiantes` int(11) DEFAULT NULL,
  `idcarga_academica` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddetalle_carga`),
  KEY `idcarga_academica` (`idcarga_academica`),
  KEY `idestudiantes` (`idestudiantes`),
  CONSTRAINT `detalle_carga_ibfk_2` FOREIGN KEY (`idcarga_academica`) REFERENCES `carga_academica` (`idcarga_academica`),
  CONSTRAINT `detalle_carga_ibfk_3` FOREIGN KEY (`idestudiantes`) REFERENCES `estudiantes` (`idestudiantes`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_carga`
--

LOCK TABLES `detalle_carga` WRITE;
/*!40000 ALTER TABLE `detalle_carga` DISABLE KEYS */;
INSERT INTO `detalle_carga` VALUES (1,1,49),(2,2,49),(3,3,49),(4,4,49),(5,5,49),(6,6,49),(7,7,49),(8,8,49),(9,9,49),(10,10,49),(11,11,49),(12,12,49),(13,13,49),(14,14,49),(15,15,49),(16,1,50),(17,2,50),(18,3,50),(19,4,50),(20,5,50),(21,6,50),(22,7,50),(23,8,50),(24,9,50),(25,10,50),(26,11,50),(27,12,50),(28,13,50),(29,14,50),(30,16,50),(31,1,51),(32,2,51),(33,3,51),(34,4,51),(35,5,51),(36,6,51),(37,7,51),(38,8,51),(39,9,51),(40,10,51),(41,11,51),(42,12,51),(43,13,51),(44,14,51),(45,16,51),(46,1,52),(47,2,52),(48,3,52),(49,4,52),(50,5,52),(51,6,52),(52,7,52),(53,8,52),(54,9,52),(55,10,52),(56,11,52),(57,12,52),(58,13,52),(59,14,52),(60,16,52),(61,1,53),(62,2,53),(63,3,53),(64,4,53),(65,5,53),(66,6,53),(67,7,53),(68,8,53),(69,9,53),(70,10,53),(71,11,53),(72,12,53),(73,13,53),(74,14,53),(75,16,53),(76,1,54),(77,2,54),(78,3,54),(79,4,54),(80,5,54),(81,6,54),(82,7,54),(83,8,54),(84,9,54),(85,10,54),(86,11,54),(87,12,54),(88,13,54),(89,14,54),(90,16,54),(91,1,55),(92,2,55),(93,3,55),(94,4,55),(95,5,55),(96,6,55),(97,7,55),(98,8,55),(99,9,55),(100,10,55),(101,11,55),(102,12,55),(103,13,55),(104,14,55),(105,16,55),(106,1,56),(107,2,56),(108,3,56),(109,4,56),(110,5,56),(111,6,56),(112,7,56),(113,8,56),(114,9,56),(115,10,56),(116,11,56),(117,12,56),(118,13,56),(119,14,56),(120,16,56),(121,1,57),(122,2,57),(123,3,57),(124,4,57),(125,5,57),(126,6,57),(127,7,57),(128,8,57),(129,9,57),(130,10,57),(131,11,57),(132,12,57),(133,13,57),(134,14,57),(135,16,57),(136,1,58),(137,2,58),(138,3,58),(139,4,58),(140,5,58),(141,6,58),(142,7,58),(143,8,58),(144,9,58),(145,10,58),(146,11,58),(147,12,58),(148,13,58),(149,14,58),(150,16,58);
/*!40000 ALTER TABLE `detalle_carga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_rol_usuario`
--

DROP TABLE IF EXISTS `detalle_rol_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `detalle_rol_usuario` (
  `UsrId` int(11) NOT NULL,
  `RolCod` varchar(5) NOT NULL,
  PRIMARY KEY (`UsrId`,`RolCod`),
  KEY `FK_RolCod_idx` (`RolCod`),
  CONSTRAINT `FK_RolCod` FOREIGN KEY (`RolCod`) REFERENCES `roles` (`RolCod`),
  CONSTRAINT `FK_UsrId` FOREIGN KEY (`UsrId`) REFERENCES `usuario` (`UsrId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_rol_usuario`
--

LOCK TABLES `detalle_rol_usuario` WRITE;
/*!40000 ALTER TABLE `detalle_rol_usuario` DISABLE KEYS */;
INSERT INTO `detalle_rol_usuario` VALUES (1,'ADM'),(7,'DEC'),(6,'DOC');
/*!40000 ALTER TABLE `detalle_rol_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `estudiantes` (
  `idestudiantes` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_estudiantes` varchar(40) DEFAULT NULL,
  `nombre_estudiantes` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idestudiantes`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,'0615199600256',' ERICK JOEL CORRALES REYES                                   '),(2,'0801199020260',' ERICK JOSUE FLORES MOTINO                                   '),(3,'0801199209332',' EDUARDO DAVID MEJIA OLIVA                                   '),(4,'0801199409164',' ANGEL MIGUEL CALLEJAS ALVAREZ                               '),(5,'0801199602120',' DAVID ALEXANDER MONCADA DAVILA                              '),(6,'0801199717795',' JONATHAN ARIEL  MEJIA HERNANDEZ                             '),(7,'0801199721219',' GERY ALEM TOME IZAGUIRRE                                    '),(8,'0801199809360',' CARLOS ALBERTO ROMERO RIVAS                                 '),(9,'0801199819971',' GEYSEL YESENIA RODRIGUEZ BARAHONA                           '),(10,'0809199800030',' ELIBERTH FABRICIO GALILEO GARCIA MARTINEZ                   '),(11,'0824199700864',' DENNIS MIGUEL  MCCOY DUBON                                  '),(12,'0826199400252',' LUIS ANDRES  MARTINEZ CERRATO                               '),(13,'1208199600249',' MARYURY MAYELA GUTIERREZ BAUTISTA                           '),(14,'1508199600360',' YIPSI YANELY AVILA MONCADA                                  '),(15,'1654986461651',' FELIPE TOLEDO'),(16,'1654986461652',' FRANCISCO RÍOS');
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultades`
--

DROP TABLE IF EXISTS `facultades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `facultades` (
  `FacCod` varchar(40) NOT NULL,
  `FacNom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FacCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultades`
--

LOCK TABLES `facultades` WRITE;
/*!40000 ALTER TABLE `facultades` DISABLE KEYS */;
INSERT INTO `facultades` VALUES ('ICC','Ingeniería en Ciencias de la Computación'),('II','Ingeniería Industrial');
/*!40000 ALTER TABLE `facultades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `perfiles` (
  `PerCod` int(11) NOT NULL AUTO_INCREMENT,
  `PerNom` varchar(60) DEFAULT NULL,
  `PerApe` varchar(60) DEFAULT NULL,
  `PerNacFech` date DEFAULT NULL,
  `PerIde` varchar(20) DEFAULT NULL,
  `PerEmpCod` varchar(45) DEFAULT NULL,
  `PerTel` varchar(20) DEFAULT NULL,
  `PerGen` varchar(5) DEFAULT NULL,
  `PerMail` varchar(80) DEFAULT NULL,
  `FacCod` varchar(40) DEFAULT NULL,
  `PerImg` varchar(250) DEFAULT NULL,
  `PerDesc` varchar(512) DEFAULT NULL,
  `PerEst` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`PerCod`),
  KEY `FacCod` (`FacCod`),
  CONSTRAINT `perfiles_ibfk_1` FOREIGN KEY (`FacCod`) REFERENCES `facultades` (`FacCod`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (1,'Eliberth Fabricio Galileo','Garcia','1998-01-08','0809199800030','101','31903136','fem','galileoga63@gmail.com','ICC','img/imgPerfiles/0809199800030.png','Decano de ICC','1'),(2,'Carlos','Romero','1998-05-08','0801-1998-09360','CA','88978978','masc','rome@gmail.com','ICC','url','dsc','1'),(3,'Lodiero','Marcos','1980-04-21','0610-1995-02578','100','8888888','masc','Marcos@gmail.com','ICC','url','dsc','1'),(4,'Dennis','McCoy','1997-11-05','0807-1997-10058','CA','885475874','masc','demimcu@gmail.com','ICC','URL','Desc','0'),(5,'Galileo','GarcÃ­a','2019-12-24','0809199900030','','465465465','fem','','ICC','','H','1');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `RolCod` varchar(5) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RolCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('ADM','Administrador'),('DEC','Decano'),('DOC','Docente');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario` (
  `UsrId` int(11) NOT NULL AUTO_INCREMENT,
  `UsrUsr` varchar(40) NOT NULL,
  `UsrPwd` varchar(60) NOT NULL,
  `UsrNom` varchar(120) NOT NULL,
  `UsrTel` varchar(20) DEFAULT NULL,
  `UsrMail` varchar(120) NOT NULL,
  `UsrstAcc` datetime DEFAULT NULL,
  `UsrEst` varchar(45) NOT NULL,
  `FacCod` varchar(45) NOT NULL,
  PRIMARY KEY (`UsrId`),
  KEY `FacCod` (`FacCod`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`FacCod`) REFERENCES `facultades` (`FacCod`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'galileo','1234','Eliberth Fabricio Galileo García Martínez','31903136','galileoga63@gmail.com','2019-07-21 18:21:24','1','ICC'),(5,'rome08','password','carlos','8998798','romerocarlos0805@gmail.com','2019-06-30 11:14:30','1','ICC'),(6,'joel','password','Eric','854548','joelreyes@gmail.com','2019-06-22 00:00:00','1','ICC'),(7,'luis','password','Andres','778278547','luis@gmail.com','2019-06-27 21:46:44','1','ICC'),(8,'demimcu','password','Dennis','8848484','demimcu@gmail.com','2019-06-25 23:30:43','0','ICC');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'unicah_portafolio_docentes'
--

--
-- Dumping routines for database 'unicah_portafolio_docentes'
--
/*!50003 DROP PROCEDURE IF EXISTS `BUSCAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BUSCAR_USUARIO`(USUARIO VARCHAR(40), CONTRA VARCHAR(40))
BEGIN
	IF EXISTS (SELECT * FROM usuario WHERE UsrUsr=USUARIO AND UsrPwd=CONTRA)
	THEN
		SELECT '1';
		UPDATE usuario SET UsrstAcc= NOW() WHERE UsrUsr=USUARIO AND UsrPwd=CONTRA;
    ELSE
		SELECT '0';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estudiantes_Carga` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estudiantes_Carga`(CUENTA VARCHAR(100), NOMBRE VARCHAR(100), IDCARGA INT, EXISTE INT)
BEGIN
	DECLARE IDEST INT;
    IF (EXISTE=0) THEN
		INSERT INTO estudiantes(cuenta_estudiantes, nombre_estudiantes) VALUES (CUENTA, NOMBRE);
		SET IDEST=(SELECT idestudiantes FROM estudiantes WHERE cuenta_estudiantes=CUENTA);
		INSERT INTO detalle_carga (idestudiantes, idcarga_academica) VALUES(IDEST, IDCARGA);
    ELSE
		SET IDEST=(SELECT idestudiantes FROM estudiantes WHERE cuenta_estudiantes=CUENTA);
		INSERT INTO detalle_carga (idestudiantes, idcarga_academica) VALUES(IDEST, IDCARGA);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EXISTE_CORREO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EXISTE_CORREO`(CORREO VARCHAR(40))
BEGIN
	IF EXISTS (SELECT * FROM usuario WHERE UsrMail=CORREO) THEN
		SELECT '1', (SELECT UsrPwd FROM usuario WHERE UsrMail=CORREO) AS PASS;
	ELSE
		SELECT '0';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `existe_estudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `existe_estudiante`(CUENTA VARCHAR(100))
BEGIN
	IF EXISTS(SELECT * FROM estudiantes WHERE cuenta_estudiantes=CUENTA) THEN
		SELECT '1';
     ELSE
		SELECT '0';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EXISTE_PERFIL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EXISTE_PERFIL`(PERFIL VARCHAR(40))
BEGIN
	IF EXISTS (SELECT * FROM PERFILES WHERE PerCod=PERFIL)
    THEN
		SELECT '1';
	ELSE
		SELECT '0';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EXISTE_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EXISTE_USUARIO`(USUARIO VARCHAR(40))
BEGIN
	IF EXISTS (SELECT * FROM USUARIO WHERE UsrId=USUARIO)
    THEN
		SELECT '1';
	ELSE
		SELECT '0';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_carga_academica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_carga_academica`(CAMPUS INT, PERIODO VARCHAR(100), CLASE INT,
SECCION VARCHAR(100), CATEDRA VARCHAR(100), HORARIO VARCHAR(100), EDIFICIO VARCHAR(50), PERFIL INT)
BEGIN
	SET SQL_SAFE_UPDATES = 0;
    INSERT INTO carga_academica (campus, periodo, clase, seccion, catedratico, horario, edificio, perfil, horaCarga)
    VALUES(CAMPUS, PERIODO, CLASE, SECCION, CATEDRA, HORARIO, EDIFICIO, PERFIL, now());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerCAMPUS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerCAMPUS`(CAMP VARCHAR(120))
BEGIN
	IF(EXISTS(SELECT * FROM campus WHERE descCampus=CAMP)) THEN
		SELECT idcampus FROM campus;
	ELSE
		SELECT '0';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerCargas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerCargas`(codigo INT)
BEGIN
	SELECT * FROM carga_academica WHERE perfil=codigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_Asignatura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_Asignatura`(ASIGN VARCHAR(120))
BEGIN
	IF(EXISTS(SELECT * FROM asignaturas WHERE dscAsignatura=ASIGN)) THEN
		SELECT idasignaturas FROM asignaturas;
	ELSE
		SELECT '0';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ROLES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ROLES`(USUARIO VARCHAR(60), PASS VARCHAR(60))
BEGIN
    DECLARE IDUSUARIO INT;
	DECLARE DOCENTE INT;
    DECLARE DECANO INT;
    DECLARE ADMINISTRADOR INT;
    
    SET IDUSUARIO = (SELECT UsrId FROM usuario WHERE UsrUsr=USUARIO AND UsrPwd=PASS);

    IF EXISTS(SELECT RolCod FROM detalle_rol_usuario WHERE UsrId = IDUSUARIO AND RolCod='DOC') THEN
		SET DOCENTE=1;
	ELSE
		SET DOCENTE=0;
	END IF;
    
    IF EXISTS(SELECT RolCod FROM detalle_rol_usuario WHERE UsrId = IDUSUARIO AND RolCod='DEC') THEN
		SET DECANO=1;
	ELSE
		SET DECANO=0;
	END IF;
    

    IF EXISTS(SELECT RolCod FROM detalle_rol_usuario WHERE UsrId = IDUSUARIO AND RolCod='ADM') THEN
		SET ADMINISTRADOR=1;
	ELSE
		SET ADMINISTRADOR=0;
	END IF;
	
    SELECT DOCENTE, DECANO, ADMINISTRADOR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ultimaCarga` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ultimaCarga`()
BEGIN
	SELECT  idcarga_academica FROM carga_academica ORDER BY idcarga_academica DESC LIMIT 1;
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

-- Dump completed on 2019-07-21 18:31:34

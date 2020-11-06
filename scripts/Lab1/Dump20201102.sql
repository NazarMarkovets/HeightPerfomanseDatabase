-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mu
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `fonts`
--

DROP TABLE IF EXISTS `fonts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fonts` (
  `idFonts` int NOT NULL AUTO_INCREMENT,
  `name_font` varchar(45) COLLATE utf8_bin NOT NULL,
  `size` int NOT NULL,
  `spacing` float NOT NULL,
  `color_for_headers` varchar(45) COLLATE utf8_bin NOT NULL,
  `color_for_text` varchar(45) COLLATE utf8_bin NOT NULL,
  `padding` float NOT NULL,
  `style` varchar(45) COLLATE utf8_bin NOT NULL,
  `saturation` varchar(45) COLLATE utf8_bin NOT NULL,
  `width` int NOT NULL,
  `custom_macket` blob NOT NULL,
  `fontsTEXT` text COLLATE utf8_bin,
  `fontsDATA` date DEFAULT NULL,
  PRIMARY KEY (`idFonts`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `format_type`
--

DROP TABLE IF EXISTS `format_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `format_type` (
  `idFormatType` int NOT NULL AUTO_INCREMENT,
  `nameFormat` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idFormatType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `macket_to_print`
--

DROP TABLE IF EXISTS `macket_to_print`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `macket_to_print` (
  `idMacket_to_Print` int NOT NULL AUTO_INCREMENT,
  `SizeByte` int NOT NULL,
  `fk_macket_to_formatType` int NOT NULL,
  `height` int NOT NULL,
  `width` int NOT NULL,
  `File` blob NOT NULL,
  `fk_macket_client` int NOT NULL,
  `individual_specific` text COLLATE utf8_bin,
  `macketDATA` date DEFAULT NULL,
  PRIMARY KEY (`idMacket_to_Print`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `order_start` date NOT NULL,
  `total_price` float NOT NULL,
  `order_done` date NOT NULL,
  `orderTEXT` text COLLATE utf8_bin NOT NULL,
  `orderVARCHAR` varchar(45) COLLATE utf8_bin DEFAULT ' ',
  `Details` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `fk_order_to_stat` int NOT NULL,
  `fk_order_user` int NOT NULL,
  PRIMARY KEY (`id_order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_macket`
--

DROP TABLE IF EXISTS `order_macket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_macket` (
  `id_order` int NOT NULL,
  `id_macket` int NOT NULL,
  PRIMARY KEY (`id_order`,`id_macket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_services`
--

DROP TABLE IF EXISTS `order_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_services` (
  `fk_order_id` int NOT NULL,
  `fk_service_id` int NOT NULL,
  `count` int NOT NULL,
  PRIMARY KEY (`fk_order_id`,`fk_service_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id_order_status` int NOT NULL AUTO_INCREMENT,
  `name_status` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT 'New',
  PRIMARY KEY (`id_order_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper` (
  `idPaper` int NOT NULL AUTO_INCREMENT,
  `name_paper` varchar(45) COLLATE utf8_bin NOT NULL,
  `iso_format` varchar(5) COLLATE utf8_bin NOT NULL,
  `height` int NOT NULL,
  `width` int NOT NULL,
  `fk_paper_to_bright` int NOT NULL,
  `fk_paper_to_density` int NOT NULL,
  `thickness` float NOT NULL,
  `color` varchar(45) COLLATE utf8_bin NOT NULL,
  `covering` varchar(45) COLLATE utf8_bin NOT NULL,
  `description` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT 'not added',
  PRIMARY KEY (`idPaper`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paper_brightness`
--

DROP TABLE IF EXISTS `paper_brightness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper_brightness` (
  `idPaper_brightness` int NOT NULL AUTO_INCREMENT,
  `brighnessLvl` float NOT NULL,
  `describe` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idPaper_brightness`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paper_density`
--

DROP TABLE IF EXISTS `paper_density`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper_density` (
  `id_density` int NOT NULL AUTO_INCREMENT,
  `density_lvl` varchar(45) COLLATE utf8_bin NOT NULL,
  `desc` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_density`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `serivces`
--

DROP TABLE IF EXISTS `serivces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serivces` (
  `idSerivces` int NOT NULL AUTO_INCREMENT,
  `name_service` varchar(200) COLLATE utf8_bin NOT NULL,
  `Description` text COLLATE utf8_bin NOT NULL,
  `Price` float NOT NULL,
  `code_service` varchar(100) COLLATE utf8_bin NOT NULL,
  `fk_service_paper` int NOT NULL,
  `serviceDATE` date DEFAULT NULL,
  `fk_service_fonts` int NOT NULL,
  PRIMARY KEY (`idSerivces`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `nameUser` varchar(45) COLLATE utf8_bin NOT NULL,
  `snameUser` varchar(45) COLLATE utf8_bin NOT NULL,
  `age` int NOT NULL,
  `totalSpent` float NOT NULL DEFAULT '0',
  `emailUser` varchar(45) COLLATE utf8_bin NOT NULL,
  `phoneNumb` varchar(45) COLLATE utf8_bin NOT NULL,
  `gender` tinyint DEFAULT NULL,
  `fk_user_to_role` int NOT NULL,
  `History` text COLLATE utf8_bin,
  `registerDate` date NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `idStatusUser` int NOT NULL AUTO_INCREMENT,
  `nameStatus` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT 'Customer',
  PRIMARY KEY (`idStatusUser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-02 18:48:08
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: my
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `fonts`
--

DROP TABLE IF EXISTS `fonts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fonts` (
  `idFonts` int NOT NULL AUTO_INCREMENT,
  `name_font` varchar(45) COLLATE utf8_bin NOT NULL,
  `size` int NOT NULL,
  `spacing` float NOT NULL,
  `color_for_headers` varchar(45) COLLATE utf8_bin NOT NULL,
  `color_for_text` varchar(45) COLLATE utf8_bin NOT NULL,
  `padding` float NOT NULL,
  `style` varchar(45) COLLATE utf8_bin NOT NULL,
  `saturation` varchar(45) COLLATE utf8_bin NOT NULL,
  `width` int NOT NULL,
  `custom_macket` blob NOT NULL,
  `fontsTEXT` text COLLATE utf8_bin,
  `fontsDATA` date DEFAULT NULL,
  PRIMARY KEY (`idFonts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `format_type`
--

DROP TABLE IF EXISTS `format_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `format_type` (
  `idFormatType` int NOT NULL AUTO_INCREMENT,
  `nameFormat` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idFormatType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `macket_to_print`
--

DROP TABLE IF EXISTS `macket_to_print`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `macket_to_print` (
  `idMacket_to_Print` int NOT NULL AUTO_INCREMENT,
  `SizeByte` int NOT NULL,
  `fk_macket_to_formatType` int NOT NULL,
  `height` int NOT NULL,
  `width` int NOT NULL,
  `File` blob NOT NULL,
  `fk_macket_client` int NOT NULL,
  `individual_specific` text COLLATE utf8_bin,
  `macketDATA` date DEFAULT NULL,
  PRIMARY KEY (`idMacket_to_Print`),
  KEY `fk_macket_to_formatType_idx` (`fk_macket_to_formatType`),
  CONSTRAINT `fk_macket_to_formatType` FOREIGN KEY (`fk_macket_to_formatType`) REFERENCES `format_type` (`idFormatType`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `order_start` date NOT NULL,
  `total_price` float NOT NULL,
  `order_done` date NOT NULL,
  `orderTEXT` text COLLATE utf8_bin NOT NULL,
  `orderVARCHAR` varchar(45) COLLATE utf8_bin DEFAULT ' ',
  `Details` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `fk_order_to_stat` int NOT NULL,
  `fk_order_user` int NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `fk_order_to_stat_idx` (`fk_order_to_stat`),
  KEY `fk_order_user_idx` (`fk_order_user`),
  CONSTRAINT `fk_order_to_stat` FOREIGN KEY (`fk_order_to_stat`) REFERENCES `order_status` (`id_order_status`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_order_user` FOREIGN KEY (`fk_order_user`) REFERENCES `user` (`idUser`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_macket`
--

DROP TABLE IF EXISTS `order_macket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_macket` (
  `id_order` int NOT NULL,
  `id_macket` int NOT NULL,
  PRIMARY KEY (`id_order`,`id_macket`),
  KEY `id_macket_idx` (`id_macket`),
  CONSTRAINT `id_macket` FOREIGN KEY (`id_macket`) REFERENCES `macket_to_print` (`idMacket_to_Print`) ON UPDATE RESTRICT,
  CONSTRAINT `id_order` FOREIGN KEY (`id_order`) REFERENCES `order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_services`
--

DROP TABLE IF EXISTS `order_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_services` (
  `fk_order_id` int NOT NULL,
  `fk_service_id` int NOT NULL,
  `count` int NOT NULL,
  PRIMARY KEY (`fk_order_id`,`fk_service_id`),
  KEY `fk_service_id_idx` (`fk_service_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`fk_order_id`) REFERENCES `order` (`id_order`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_service_id` FOREIGN KEY (`fk_service_id`) REFERENCES `serivces` (`idSerivces`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `id_order_status` int NOT NULL AUTO_INCREMENT,
  `name_status` varchar(45) COLLATE utf8_bin NOT NULL DEFAULT 'New',
  PRIMARY KEY (`id_order_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper` (
  `idPaper` int NOT NULL AUTO_INCREMENT,
  `name_paper` varchar(45) COLLATE utf8_bin NOT NULL,
  `iso_format` varchar(5) COLLATE utf8_bin NOT NULL,
  `height` int NOT NULL,
  `width` int NOT NULL,
  `fk_paper_to_bright` int NOT NULL,
  `fk_paper_to_density` int NOT NULL,
  `thickness` float NOT NULL,
  `color` varchar(45) COLLATE utf8_bin NOT NULL,
  `covering` varchar(45) COLLATE utf8_bin NOT NULL,
  `description` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT 'not added',
  PRIMARY KEY (`idPaper`),
  KEY `fk_paper_to_bright_idx` (`fk_paper_to_bright`),
  KEY `fk_paper_to_density_idx` (`fk_paper_to_density`),
  CONSTRAINT `fk_paper_to_bright` FOREIGN KEY (`fk_paper_to_bright`) REFERENCES `paper_brightness` (`idPaper_brightness`) ON UPDATE CASCADE,
  CONSTRAINT `fk_paper_to_density` FOREIGN KEY (`fk_paper_to_density`) REFERENCES `paper_density` (`id_density`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paper_brightness`
--

DROP TABLE IF EXISTS `paper_brightness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper_brightness` (
  `idPaper_brightness` int NOT NULL AUTO_INCREMENT,
  `brighnessLvl` float NOT NULL,
  `describe` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idPaper_brightness`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paper_density`
--

DROP TABLE IF EXISTS `paper_density`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paper_density` (
  `id_density` int NOT NULL AUTO_INCREMENT,
  `density_lvl` varchar(45) COLLATE utf8_bin NOT NULL,
  `desc` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id_density`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `serivces`
--

DROP TABLE IF EXISTS `serivces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serivces` (
  `idSerivces` int NOT NULL AUTO_INCREMENT,
  `name_service` varchar(200) COLLATE utf8_bin NOT NULL,
  `Description` text COLLATE utf8_bin NOT NULL,
  `Price` float NOT NULL,
  `code_service` varchar(100) COLLATE utf8_bin NOT NULL,
  `fk_service_paper` int NOT NULL,
  `serviceDATE` date DEFAULT NULL,
  `fk_service_fonts` int NOT NULL,
  PRIMARY KEY (`idSerivces`),
  KEY `fk_service_paper_idx` (`fk_service_paper`),
  KEY `fk_service_fonts_idx` (`fk_service_fonts`),
  CONSTRAINT `fk_service_fonts` FOREIGN KEY (`fk_service_fonts`) REFERENCES `fonts` (`idFonts`),
  CONSTRAINT `fk_service_paper` FOREIGN KEY (`fk_service_paper`) REFERENCES `paper` (`idPaper`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `nameUser` varchar(45) COLLATE utf8_bin NOT NULL,
  `snameUser` varchar(45) COLLATE utf8_bin NOT NULL,
  `age` int NOT NULL,
  `totalSpent` float NOT NULL DEFAULT '0',
  `emailUser` varchar(45) COLLATE utf8_bin NOT NULL,
  `phoneNumb` varchar(45) COLLATE utf8_bin NOT NULL,
  `gender` tinyint DEFAULT NULL,
  `fk_user_to_role` int NOT NULL,
  `History` text COLLATE utf8_bin,
  `registerDate` date NOT NULL,
  PRIMARY KEY (`idUser`),
  KEY `fk_status_idx` (`fk_user_to_role`),
  CONSTRAINT `fk_user_to_role` FOREIGN KEY (`fk_user_to_role`) REFERENCES `user_role` (`idStatusUser`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `idStatusUser` int NOT NULL AUTO_INCREMENT,
  `nameStatus` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT 'Customer',
  PRIMARY KEY (`idStatusUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-02 18:48:08

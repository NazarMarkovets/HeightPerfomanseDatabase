-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mu
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mu
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mu` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `mu` ;

-- -----------------------------------------------------
-- Table `mu`.`fonts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mu`.`fonts` (
  `idFonts` INT NOT NULL AUTO_INCREMENT,
  `name_font` VARCHAR(100) NOT NULL,
  `size` INT NOT NULL,
  `spacing` FLOAT NOT NULL,
  `color_for_headers` VARCHAR(45) NOT NULL,
  `color_for_text` VARCHAR(45) NOT NULL,
  `padding` FLOAT NOT NULL,
  `style` VARCHAR(45) NOT NULL,
  `saturation` VARCHAR(45) NOT NULL,
  `width` INT NOT NULL,
  `custom_macket` BLOB NULL DEFAULT NULL,
  `fontsTEXT` TEXT NULL DEFAULT NULL,
  `fontsDATA` CHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`idFonts`))
ENGINE = MyISAM
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mu`.`format_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mu`.`format_type` (
  `idFormatType` INT NOT NULL AUTO_INCREMENT,
  `nameFormat` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFormatType`))
ENGINE = MyISAM
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mu`.`macket_to_print`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mu`.`macket_to_print` (
  `idMacket_to_Print` INT NOT NULL AUTO_INCREMENT,
  `SizeByte` FLOAT NOT NULL,
  `fk_macket_to_formatType` INT NOT NULL,
  `height` FLOAT NOT NULL,
  `width` FLOAT NOT NULL,
  `File` BLOB NULL DEFAULT NULL,
  `individual_specific` TEXT NULL DEFAULT NULL,
  `macketDATA` CHAR(10) NULL DEFAULT NULL,
  `macketVARCHAR` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMacket_to_Print`))
ENGINE = MyISAM
AUTO_INCREMENT = 50
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mu`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mu`.`order` (
  `id_order` INT NOT NULL AUTO_INCREMENT,
  `order_start` CHAR(10) NOT NULL,
  `total_price` FLOAT NOT NULL,
  `order_done` CHAR(10) NOT NULL,
  `Details` TEXT NOT NULL,
  `orderVARCHAR` VARCHAR(45) NULL DEFAULT ' ',
  `fk_order_to_stat` INT NOT NULL,
  `fk_order_user` INT NOT NULL,
  PRIMARY KEY (`id_order`))
ENGINE = MyISAM
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mu`.`order_macket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mu`.`order_macket` (
  `id_order` INT NOT NULL,
  `id_macket` INT NOT NULL,
  PRIMARY KEY (`id_order`, `id_macket`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mu`.`order_services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mu`.`order_services` (
  `fk_order_id` INT NOT NULL,
  `fk_service_id` INT NOT NULL,
  `count` INT NOT NULL,
  PRIMARY KEY (`fk_order_id`, `fk_service_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mu`.`order_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mu`.`order_status` (
  `id_order_status` INT NOT NULL AUTO_INCREMENT,
  `name_status` VARCHAR(45) NOT NULL DEFAULT 'New',
  PRIMARY KEY (`id_order_status`))
ENGINE = MyISAM
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mu`.`paper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mu`.`paper` (
  `idPaper` INT NOT NULL AUTO_INCREMENT,
  `name_paper` VARCHAR(45) NOT NULL,
  `iso_format` VARCHAR(5) NOT NULL,
  `height` INT NOT NULL,
  `width` INT NOT NULL,
  `fk_paper_to_bright` INT NOT NULL,
  `fk_paper_to_density` INT NOT NULL,
  `thickness` FLOAT NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `covering` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `paperDATE` CHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idPaper`))
ENGINE = MyISAM
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mu`.`paper_brightness`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mu`.`paper_brightness` (
  `idPaper_brightness` INT NOT NULL AUTO_INCREMENT,
  `brighnessLvl` FLOAT NOT NULL,
  `describe` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPaper_brightness`))
ENGINE = MyISAM
AUTO_INCREMENT = 50
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mu`.`paper_density`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mu`.`paper_density` (
  `id_density` INT NOT NULL AUTO_INCREMENT,
  `density_lvl` FLOAT NOT NULL,
  `desc` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_density`))
ENGINE = MyISAM
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mu`.`services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mu`.`services` (
  `idSerivces` INT NOT NULL AUTO_INCREMENT,
  `name_service` VARCHAR(200) NOT NULL,
  `Description` TEXT NOT NULL,
  `Price` FLOAT NOT NULL,
  `code_service` VARCHAR(100) NOT NULL,
  `fk_service_paper` INT NOT NULL,
  `serviceDATE` CHAR(11) NULL DEFAULT NULL,
  `fk_service_fonts` INT NOT NULL,
  PRIMARY KEY (`idSerivces`))
ENGINE = MyISAM
AUTO_INCREMENT = 87
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mu`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mu`.`user` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `nameUser` VARCHAR(45) NOT NULL,
  `snameUser` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `totalSpent` FLOAT NOT NULL DEFAULT '0',
  `emailUser` VARCHAR(100) NOT NULL,
  `phoneNumb` VARCHAR(45) NOT NULL,
  `gender` TINYINT NULL DEFAULT NULL,
  `fk_user_to_role` INT NOT NULL DEFAULT '3',
  `History` TEXT NULL DEFAULT NULL,
  `registerDate` CHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = MyISAM
AUTO_INCREMENT = 4001
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `mu`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mu`.`user_role` (
  `idStatusUser` INT NOT NULL AUTO_INCREMENT,
  `nameStatus` VARCHAR(100) NOT NULL DEFAULT 'Customer',
  PRIMARY KEY (`idStatusUser`))
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

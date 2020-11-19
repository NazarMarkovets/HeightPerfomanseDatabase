-- mySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema my
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema my
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `my` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `my` ;

-- -----------------------------------------------------
-- Table `my`.`fonts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`fonts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `size` INT NOT NULL,
  `spacing` FLOAT NOT NULL,
  `padding` FLOAT NOT NULL,
  `width` INT NOT NULL,
  `macket` BLOB NULL DEFAULT NULL,
  `fontsTEXT` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `fontsDATE` CHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`format_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`format_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`macket_to_print`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`macket_to_print` (
 `id` INT NOT NULL AUTO_INCREMENT,
  `Size` FLOAT NOT NULL,
  `fk_macket_to_formatType` INT NOT NULL,
  `height` FLOAT NOT NULL,
  `width` FLOAT NOT NULL,
  `File` BLOB NULL DEFAULT NULL,
  `specific` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `macketDATE` CHAR(10) NULL DEFAULT NULL,
  `macketVARCHAR` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`order_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL DEFAULT 'New',
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `sname` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `age` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `gender` TINYINT NULL DEFAULT NULL,
  `fk_user_to_role` INT NOT NULL DEFAULT '3',
  `History` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' DEFAULT NULL,
  `registerDate` CHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_start` CHAR(10) NOT NULL,
  `order_done` CHAR(10) NOT NULL,
  `total_price` FLOAT NOT NULL,
  `details` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `orderVARCHAR` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL NULL DEFAULT ' ',
  `fk_order_to_stat` INT NOT NULL,
  `fk_order_user` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`order_macket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`order_macket` (
  `id_order` INT NOT NULL,
  `id_macket` INT NOT NULL,
  PRIMARY KEY (`id_order`, `id_macket`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`paper_colors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`paper_colors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `my`.`paper_covering`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`paper_covering` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `my`.`paper_brightness`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`paper_brightness` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Lvl` FLOAT NOT NULL,
  `describe` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`paper_density`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`paper_density` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lvl` FLOAT NOT NULL,
  `desc` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`paper_iso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`paper_iso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` CHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `height` INT NOT NULL,
  `width` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `my`.`paper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`paper` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL ,
  `fk_paper_to_iso` INT NOT NULL,
  `fk_paper_to_bright` INT NOT NULL,
  `fk_paper_to_density` INT NOT NULL,
  `thickness` FLOAT NOT NULL,
  `fk_paper_color` INT NOT NULL,
  `fk_paper_covering` INT NOT NULL,
  `description` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `paperDATE` CHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`services` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name_service` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `Description` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `Price` FLOAT NOT NULL,
  `code_service` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `fk_service_paper` INT NOT NULL,
  `serviceDATE` CHAR(11) NULL DEFAULT NULL,
  `fk_service_fonts` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`order_services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`order_services` (
  `fk_order_id` INT NOT NULL,
  `fk_service_id` INT NOT NULL,
  `count` INT NOT NULL,
  PRIMARY KEY (`fk_order_id`, `fk_service_id`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL DEFAULT 'Customer',
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

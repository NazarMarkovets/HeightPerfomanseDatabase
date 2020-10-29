-- MySQL Workbench Forward Engineering

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
CREATE SCHEMA IF NOT EXISTS `my` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `my` ;

-- -----------------------------------------------------
-- Table `my`.`fonts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`fonts` (
  `idFonts` INT NOT NULL AUTO_INCREMENT,
  `name_font` VARCHAR(45) NOT NULL,
  `size` INT NOT NULL,
  `spacing` FLOAT NOT NULL,
  `color_for_headers` VARCHAR(45) NOT NULL,
  `color_for_text` VARCHAR(45) NOT NULL,
  `padding` FLOAT NOT NULL,
  `style` VARCHAR(45) NOT NULL,
  `saturation` VARCHAR(45) NOT NULL,
  `width` INT NOT NULL,
  `custom_macket` BLOB NOT NULL,
  `Fontscol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idFonts`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`format_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`format_type` (
  `idFormatType` INT NOT NULL AUTO_INCREMENT,
  `nameFormat` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFormatType`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`macket_to_print`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`macket_to_print` (
  `idMacket_to_Print` INT NOT NULL AUTO_INCREMENT,
  `SizeByte` INT NOT NULL,
  `fk_macket_to_formatType` INT NOT NULL,
  `height` INT NOT NULL,
  `width` INT NOT NULL,
  `File` BLOB NOT NULL,
  `fk_macket_client` INT NOT NULL,
  `individual_specific` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMacket_to_Print`),
  INDEX `fk_macket_to_formatType_idx` (`fk_macket_to_formatType` ASC) VISIBLE,
  CONSTRAINT `fk_macket_to_formatType`
    FOREIGN KEY (`fk_macket_to_formatType`)
    REFERENCES `my`.`format_type` (`idFormatType`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin
COMMENT = 'CREATE TABLE IF NOT EXISTS `my`.`macket_to_print` (\\n  `idMacket_to_Print` INT NOT NULL AUTO_INCREMENT,\\n  `SizeByte` INT NOT NULL,\\n  `fk_macket_to_formatType` INT NOT NULL,\\n  `height` INT NOT NULL,\\n  `width` INT NOT NULL,\\n  `File` BLOB NOT NULL,\\n  `fk_macket_client` INT NOT NULL,\\n  `individual_specific` VARCHAR(45) NULL DEFAULT NULL,\\n  PRIMARY KEY (`idMacket_to_Print`),\\n  INDEX `fk_macket_to_formatType_idx` (`fk_macket_to_formatType` ASC) VISIBLE,\\n  CONSTRAINT `fk_macket_to_formatType`\\n    FOREIGN KEY (`fk_macket_to_formatType`)\\n    REFERENCES `my`.`format_type` (`idFormatType`)\\n    ON DELETE RESTRICT\\n    ON UPDATE CASCADE)\\nENGINE = InnoDB\\nDEFAULT CHARACTER SET = utf8\\nCOLLATE = utf8_bin\\n';


-- -----------------------------------------------------
-- Table `my`.`order_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`order_status` (
  `id_order_status` INT NOT NULL AUTO_INCREMENT,
  `name_status` VARCHAR(45) NOT NULL DEFAULT 'New',
  PRIMARY KEY (`id_order_status`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`user_role` (
  `idStatusUser` INT NOT NULL AUTO_INCREMENT,
  `nameStatus` VARCHAR(100) NOT NULL DEFAULT 'Customer',
  PRIMARY KEY (`idStatusUser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`user` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `nameUser` VARCHAR(45) NOT NULL,
  `snameUser` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `totalSpent` FLOAT NOT NULL DEFAULT '0',
  `emailUser` VARCHAR(45) NOT NULL,
  `phoneNumb` VARCHAR(45) NOT NULL,
  `gender` TINYINT NULL DEFAULT NULL,
  `fk_user_to_role` INT NOT NULL,
  PRIMARY KEY (`idUser`),
  INDEX `fk_status_idx` (`fk_user_to_role` ASC) VISIBLE,
  CONSTRAINT `fk_user_to_role`
    FOREIGN KEY (`fk_user_to_role`)
    REFERENCES `my`.`user_role` (`idStatusUser`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`order` (
  `id_order` INT NOT NULL AUTO_INCREMENT,
  `order_start` DATE NOT NULL,
  `total_price` FLOAT NOT NULL,
  `order_done` TIME NOT NULL,
  `orderINT` INT NOT NULL DEFAULT '0',
  `orderVARCHAR` VARCHAR(45) NULL DEFAULT ' ',
  `Details` VARCHAR(45) NULL DEFAULT NULL,
  `fk_order_to_stat` INT NOT NULL,
  `fk_order_user` INT NOT NULL,
  PRIMARY KEY (`id_order`),
  INDEX `fk_order_to_stat_idx` (`fk_order_to_stat` ASC) VISIBLE,
  INDEX `fk_order_user_idx` (`fk_order_user` ASC) VISIBLE,
  CONSTRAINT `fk_order_to_stat`
    FOREIGN KEY (`fk_order_to_stat`)
    REFERENCES `my`.`order_status` (`id_order_status`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_user`
    FOREIGN KEY (`fk_order_user`)
    REFERENCES `my`.`user` (`idUser`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`order_macket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`order_macket` (
  `id_order` INT NOT NULL,
  `id_macket` INT NOT NULL,
  PRIMARY KEY (`id_order`, `id_macket`),
  INDEX `id_macket_idx` (`id_macket` ASC) VISIBLE,
  CONSTRAINT `id_macket`
    FOREIGN KEY (`id_macket`)
    REFERENCES `my`.`macket_to_print` (`idMacket_to_Print`)
    ON UPDATE RESTRICT,
  CONSTRAINT `id_order`
    FOREIGN KEY (`id_order`)
    REFERENCES `my`.`order` (`id_order`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`paper_brightness`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`paper_brightness` (
  `idPaper_brightness` INT NOT NULL AUTO_INCREMENT,
  `brighnessLvl` FLOAT NOT NULL,
  `describe` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPaper_brightness`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`paper_density`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`paper_density` (
  `id_density` INT NOT NULL AUTO_INCREMENT,
  `density_lvl` VARCHAR(45) NOT NULL,
  `desc` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_density`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`paper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`paper` (
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
  `description` VARCHAR(150) NOT NULL DEFAULT 'not added',
  PRIMARY KEY (`idPaper`),
  INDEX `fk_paper_to_bright_idx` (`fk_paper_to_bright` ASC) VISIBLE,
  INDEX `fk_paper_to_density_idx` (`fk_paper_to_density` ASC) VISIBLE,
  CONSTRAINT `fk_paper_to_bright`
    FOREIGN KEY (`fk_paper_to_bright`)
    REFERENCES `my`.`paper_brightness` (`idPaper_brightness`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_paper_to_density`
    FOREIGN KEY (`fk_paper_to_density`)
    REFERENCES `my`.`paper_density` (`id_density`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`serivces`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`serivces` (
  `idSerivces` INT NOT NULL AUTO_INCREMENT,
  `name_service` VARCHAR(200) NOT NULL,
  `Description` VARCHAR(400) NOT NULL,
  `Price` FLOAT NOT NULL,
  `code_service` VARCHAR(100) NOT NULL,
  `fk_service_paper` INT NOT NULL,
  `serviceINT` INT NULL DEFAULT NULL,
  `serviceVARCHAR` VARCHAR(45) NULL DEFAULT NULL,
  `fk_service_fonts` INT NOT NULL,
  PRIMARY KEY (`idSerivces`),
  INDEX `fk_service_paper_idx` (`fk_service_paper` ASC) VISIBLE,
  INDEX `fk_service_fonts_idx` (`fk_service_fonts` ASC) VISIBLE,
  CONSTRAINT `fk_service_fonts`
    FOREIGN KEY (`fk_service_fonts`)
    REFERENCES `my`.`fonts` (`idFonts`),
  CONSTRAINT `fk_service_paper`
    FOREIGN KEY (`fk_service_paper`)
    REFERENCES `my`.`paper` (`idPaper`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `my`.`order_services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my`.`order_services` (
  `fk_order_id` INT NOT NULL,
  `fk_service_id` INT NOT NULL,
  `count` INT NOT NULL,
  PRIMARY KEY (`fk_order_id`, `fk_service_id`),
  INDEX `fk_service_id_idx` (`fk_service_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_id`
    FOREIGN KEY (`fk_order_id`)
    REFERENCES `my`.`order` (`id_order`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_service_id`
    FOREIGN KEY (`fk_service_id`)
    REFERENCES `my`.`serivces` (`idSerivces`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

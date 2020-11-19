-- ----------------------------------------------------------------------------
-- inSQL Workbench Migration
-- Migrated Schemata: in
-- Source Schemata: in
-- Created: Thu Nov 19 17:53:31 2020
-- Workbench Version: 8.0.22
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema in
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `in` ;
CREATE SCHEMA IF NOT EXISTS `inno` ;

-- ----------------------------------------------------------------------------
-- Table in.fonts
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`fonts` (
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

-- ----------------------------------------------------------------------------
-- Table in.format_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`format_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

-- ----------------------------------------------------------------------------
-- Table in.macket_to_print
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`macket_to_print` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Size` FLOAT NOT NULL,
  `fk_macket_to_formatType` INT NOT NULL,
  `height` FLOAT NOT NULL,
  `width` FLOAT NOT NULL,
  `File` BLOB NULL DEFAULT NULL,
  `specific` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `macketDATE` CHAR(10) NULL DEFAULT NULL,
  `macketVARCHAR` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_macket_to_formatType_idx` (`fk_macket_to_formatType` ASC) VISIBLE,
  CONSTRAINT `fk_macket_to_formatType`
    FOREIGN KEY (`fk_macket_to_formatType`)
    REFERENCES `inno`.`format_type` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

-- ----------------------------------------------------------------------------
-- Table in.order
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_start` CHAR(10) NOT NULL,
  `order_done` CHAR(10) NOT NULL,
  `total_price` FLOAT NOT NULL,
  `details` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `orderVARCHAR` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT ' ',
  `fk_order_to_stat` INT NOT NULL,
  `fk_order_user` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_to_stat_idx` (`fk_order_to_stat` ASC) VISIBLE,
  INDEX `fk_order_user_idx` (`fk_order_user` ASC) VISIBLE,
  CONSTRAINT `fk_order_to_stat`
    FOREIGN KEY (`fk_order_to_stat`)
    REFERENCES `inno`.`status` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_user`
    FOREIGN KEY (`fk_order_user`)
    REFERENCES `inno`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

-- ----------------------------------------------------------------------------
-- Table in.order_macket
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`order_macket` (
  `id_order` INT NOT NULL,
  `id_macket` INT NOT NULL,
  PRIMARY KEY (`id_order`, `id_macket`),
  INDEX `id_macket_idx` (`id_macket` ASC) VISIBLE,
  CONSTRAINT `id_macket`
    FOREIGN KEY (`id_macket`)
    REFERENCES `inno`.`macket_to_print` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_order`
    FOREIGN KEY (`id_order`)
    REFERENCES `inno`.`order` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

-- ----------------------------------------------------------------------------
-- Table in.order_services
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`order_services` (
  `fk_order_id` INT NOT NULL,
  `fk_service_id` INT NOT NULL,
  PRIMARY KEY (`fk_order_id`, `fk_service_id`),
  INDEX `fk_service_id_idx` (`fk_service_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_id`
    FOREIGN KEY (`fk_order_id`)
    REFERENCES `inno`.`order` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_service_id`
    FOREIGN KEY (`fk_service_id`)
    REFERENCES `inno`.`services` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

-- ----------------------------------------------------------------------------
-- Table in.paper
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`paper` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `fk_paper_to_iso` INT NOT NULL,
  `fk_paper_to_bright` INT NOT NULL,
  `fk_paper_to_density` INT NOT NULL,
  `thickness` FLOAT NOT NULL,
  `fk_paper_color` INT NOT NULL,
  `fk_paper_covering` INT NOT NULL,
  `description` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `paperDATE` CHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_paper_to_iso_idx` (`fk_paper_to_iso` ASC) VISIBLE,
  INDEX `fk_paper_to_bright_idx` (`fk_paper_to_bright` ASC) VISIBLE,
  INDEX `fk_paper_to_density_idx` (`fk_paper_to_density` ASC) VISIBLE,
  INDEX `fk_paper_color_idx` (`fk_paper_color` ASC) VISIBLE,
  INDEX `fk_paper_covering_idx` (`fk_paper_covering` ASC) VISIBLE,
  CONSTRAINT `fk_paper_color`
    FOREIGN KEY (`fk_paper_color`)
    REFERENCES `inno`.`paper_colors` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_paper_covering`
    FOREIGN KEY (`fk_paper_covering`)
    REFERENCES `inno`.`paper_covering` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_paper_to_bright`
    FOREIGN KEY (`fk_paper_to_bright`)
    REFERENCES `inno`.`paper_brightness` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_paper_to_density`
    FOREIGN KEY (`fk_paper_to_density`)
    REFERENCES `inno`.`paper_density` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_paper_to_iso`
    FOREIGN KEY (`fk_paper_to_iso`)
    REFERENCES `inno`.`paper_iso` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

-- ----------------------------------------------------------------------------
-- Table in.paper_brightness
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`paper_brightness` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Lvl` FLOAT NOT NULL,
  `describe` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

-- ----------------------------------------------------------------------------
-- Table in.paper_colors
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`paper_colors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table in.paper_covering
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`paper_covering` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table in.paper_density
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`paper_density` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lvl` FLOAT NOT NULL,
  `desc` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

-- ----------------------------------------------------------------------------
-- Table in.paper_iso
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`paper_iso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` CHAR(10) CHARACTER SET 'utf8' NOT NULL,
  `height` INT NOT NULL,
  `width` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table in.role
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL DEFAULT 'Customer',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

-- ----------------------------------------------------------------------------
-- Table in.services
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`services` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name_service` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `Description` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `Price` FLOAT NOT NULL,
  `code_service` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `fk_service_paper` INT NOT NULL,
  `serviceDATE` CHAR(11) NULL DEFAULT NULL,
  `fk_service_fonts` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_service_paper_idx` (`fk_service_paper` ASC) VISIBLE,
  INDEX `fk_service_fonts_idx` (`fk_service_fonts` ASC) VISIBLE,
  CONSTRAINT `fk_service_fonts`
    FOREIGN KEY (`fk_service_fonts`)
    REFERENCES `inno`.`fonts` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_service_paper`
    FOREIGN KEY (`fk_service_paper`)
    REFERENCES `inno`.`paper` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

-- ----------------------------------------------------------------------------
-- Table in.status
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL DEFAULT 'New',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

-- ----------------------------------------------------------------------------
-- Table in.user
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `inno`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `sname` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `age` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `gender` TINYINT NULL DEFAULT NULL,
  `fk_user_to_role` INT NOT NULL DEFAULT '3',
  `History` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `registerDate` CHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_to_role_idx` (`fk_user_to_role` ASC) VISIBLE,
  CONSTRAINT `fk_user_to_role`
    FOREIGN KEY (`fk_user_to_role`)
    REFERENCES `inno`.`role` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;
SET FOREIGN_KEY_CHECKS = 1;

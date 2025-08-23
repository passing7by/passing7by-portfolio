-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema passing7by_port
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema passing7by_port
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `passing7by_port` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `passing7by_port` ;

-- -----------------------------------------------------
-- Table `passing7by_port`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `passing7by_port`.`admin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password` CHAR(64) NOT NULL,
  `fail_count` INT NULL DEFAULT '0',
  `max_fail_count` INT NULL DEFAULT '5',
  `active` TINYINT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `passing7by_port`.`about`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `passing7by_port`.`about` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `title` VARCHAR(255) NULL DEFAULT NULL,
  `github_url` VARCHAR(255) NULL DEFAULT NULL,
  `blog_url` VARCHAR(255) NULL DEFAULT NULL,
  `email_url` VARCHAR(255) NULL DEFAULT NULL,
  `reg_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `mod_date` DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_admin_TO_about_1`
    FOREIGN KEY (`id`)
    REFERENCES `passing7by_port`.`admin` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `passing7by_port`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `passing7by_port`.`project` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `admin_id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `summary` TEXT NULL DEFAULT NULL,
  `team_size` INT NULL DEFAULT NULL,
  `key_features` TEXT NULL DEFAULT NULL,
  `tech_stack` TEXT NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `github_url` VARCHAR(255) NULL DEFAULT NULL,
  `demo_url` VARCHAR(255) NULL DEFAULT NULL,
  `ppt_url` VARCHAR(255) NULL DEFAULT NULL,
  `reg_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `mod_date` DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `FK_admin_TO_project_1` (`admin_id` ASC) VISIBLE,
  CONSTRAINT `FK_admin_TO_project_1`
    FOREIGN KEY (`admin_id`)
    REFERENCES `passing7by_port`.`admin` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `passing7by_port`.`image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `passing7by_port`.`image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `project_id` INT NULL DEFAULT NULL,
  `about_id` INT NULL DEFAULT NULL,
  `ori_name` VARCHAR(255) NULL DEFAULT NULL,
  `saved_name` CHAR(32) NOT NULL,
  `extension` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_project_TO_image_1` (`project_id` ASC) VISIBLE,
  INDEX `FK_about_TO_image_1` (`about_id` ASC) VISIBLE,
  CONSTRAINT `FK_about_TO_image_1`
    FOREIGN KEY (`about_id`)
    REFERENCES `passing7by_port`.`about` (`id`),
  CONSTRAINT `FK_project_TO_image_1`
    FOREIGN KEY (`project_id`)
    REFERENCES `passing7by_port`.`project` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `passing7by_port`.`project_note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `passing7by_port`.`project_note` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `project_id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_project_TO_project_note_1` (`project_id` ASC) VISIBLE,
  CONSTRAINT `FK_project_TO_project_note_1`
    FOREIGN KEY (`project_id`)
    REFERENCES `passing7by_port`.`project` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `passing7by_port`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `passing7by_port`.`section` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `project_id` INT NULL DEFAULT NULL,
  `about_id` INT NULL DEFAULT NULL,
  `title` VARCHAR(255) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_project_TO_section_1` (`project_id` ASC) VISIBLE,
  INDEX `FK_about_TO_section_1` (`about_id` ASC) VISIBLE,
  CONSTRAINT `FK_about_TO_section_1`
    FOREIGN KEY (`about_id`)
    REFERENCES `passing7by_port`.`about` (`id`),
  CONSTRAINT `FK_project_TO_section_1`
    FOREIGN KEY (`project_id`)
    REFERENCES `passing7by_port`.`project` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `passing7by_port`.`skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `passing7by_port`.`skill` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `about_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_about_TO_skill_1` (`about_id` ASC) VISIBLE,
  CONSTRAINT `FK_about_TO_skill_1`
    FOREIGN KEY (`about_id`)
    REFERENCES `passing7by_port`.`about` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

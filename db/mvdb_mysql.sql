-- MySQL Script generated by MySQL Workbench
-- Thu Jul 20 10:03:24 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`country` (
  `cou_id` INT NOT NULL AUTO_INCREMENT,
  `cou_name` VARCHAR(128) NOT NULL,
  `cou_iso_2` VARCHAR(2) NULL,
  `cou_iso_3` VARCHAR(3) NULL,
  PRIMARY KEY (`cou_id`),
  UNIQUE INDEX `cou_id_UNIQUE` (`cou_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medium`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medium` (
  `med_id` INT NOT NULL AUTO_INCREMENT,
  `med_name` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`med_id`),
  UNIQUE INDEX `med_id_UNIQUE` (`med_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`language` (
  `lan_id` INT NOT NULL AUTO_INCREMENT,
  `lan_name` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`lan_id`),
  UNIQUE INDEX `lan_id_UNIQUE` (`lan_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`movie` (
  `mov_id` INT NOT NULL AUTO_INCREMENT,
  `mov_title` VARCHAR(255) NOT NULL,
  `mov_release_date` DATE NULL,
  `mov_year` YEAR NULL,
  `mov_location` VARCHAR(64) NULL,
  `mov_actors` VARCHAR(255) NULL,
  `mov_synopsis` TEXT NULL,
  `mov_imdb_rating` FLOAT NULL,
  `mov_run_time` INT NULL,
  `mov_directors` VARCHAR(64) NULL,
  `mov_note` VARCHAR(128) NULL,
  `country_cou_id` INT NOT NULL,
  `medium_med_id` INT NOT NULL,
  `language_lan_id` INT NOT NULL,
  `mov_poster` VARCHAR(255) NULL,
  PRIMARY KEY (`mov_id`),
  UNIQUE INDEX `mov_id_UNIQUE` (`mov_id` ASC),
  INDEX `fk_movie_country1_idx` (`country_cou_id` ASC),
  INDEX `fk_movie_medium1_idx` (`medium_med_id` ASC),
  INDEX `fk_movie_language1_idx` (`language_lan_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genre` (
  `gen_id` INT NOT NULL AUTO_INCREMENT,
  `gen_name` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`gen_id`),
  UNIQUE INDEX `gen_id_UNIQUE` (`gen_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`genre_has_movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genre_has_movie` (
  `genre_gen_id` INT NOT NULL,
  `movie_mov_id` INT NOT NULL,
  PRIMARY KEY (`genre_gen_id`, `movie_mov_id`),
  INDEX `fk_genre_has_movie_movie1_idx` (`movie_mov_id` ASC),
  INDEX `fk_genre_has_movie_genre_idx` (`genre_gen_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `usr_id` INT NOT NULL AUTO_INCREMENT,
  `usr_firstname` VARCHAR(128) NOT NULL,
  `usr_lastname` VARCHAR(128) NOT NULL,
  `usr_email` VARCHAR(128) NOT NULL,
  `usr_password` VARCHAR(32) NOT NULL,
  `usr_token` VARCHAR(32) NULL,
  `usr_picture` VARCHAR(255) NULL,
  PRIMARY KEY (`usr_id`),
  UNIQUE INDEX `iduser_UNIQUE` (`usr_id` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

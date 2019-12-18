-- MySQL Script generated by MySQL Workbench
-- Wed Apr 10 12:39:15 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema master_instagram
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema master_instagram
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `master_instagram` DEFAULT CHARACTER SET utf8 ;
USE `master_instagram` ;

-- -----------------------------------------------------
-- Table `master_instagram`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `master_instagram`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(20) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(90) NOT NULL,
  `nick` VARCHAR(45) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `image` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `remember_token` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `nick_UNIQUE` (`nick` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `master_instagram`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `master_instagram`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `image_path` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_images_users_idx` (`user_id` ASC),
  CONSTRAINT `fk_images_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `master_instagram`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `master_instagram`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `master_instagram`.`comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `image_id` INT NOT NULL,
  `content` TEXT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_users_idx` (`user_id` ASC),
  INDEX `fk_comments_images_idx` (`image_id` ASC),
  CONSTRAINT `fk_comments_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `master_instagram`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_images`
    FOREIGN KEY (`image_id`)
    REFERENCES `master_instagram`.`images` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `master_instagram`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `master_instagram`.`likes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `image_id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_likes_users_idx` (`user_id` ASC),
  INDEX `fk_likes_images_idx` (`image_id` ASC),
  CONSTRAINT `fk_likes_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `master_instagram`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_images`
    FOREIGN KEY (`image_id`)
    REFERENCES `master_instagram`.`images` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `master_instagram` ;

-- -----------------------------------------------------
-- Placeholder table for view `master_instagram`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `master_instagram`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `master_instagram`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `master_instagram`.`view1`;
USE `master_instagram`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

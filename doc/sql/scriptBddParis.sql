-- MySQL Workbench Synchronization
-- Generated: 2017-02-08 09:40
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Anthony PERIQUET

CREATE SCHEMA `paris` ;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER SCHEMA `paris`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `paris`.`user` (
  `id` INT(11) NOT NULL,
  `lastname` VARCHAR(100) NULL DEFAULT NULL,
  `firstname` VARCHAR(60) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `password` VARCHAR(150) NULL DEFAULT NULL,
  `dateNaissance` DATE NULL DEFAULT NULL,
  `idAddress` INT(11) NOT NULL,
  `account` DECIMAL NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_utilisateur_address1_idx` (`idAddress` ASC),
  CONSTRAINT `fk_utilisateur_address1`
    FOREIGN KEY (`idAddress`)
    REFERENCES `paris`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `paris`.`address` (
  `id` INT(11) NOT NULL,
  `street` VARCHAR(45) NULL DEFAULT NULL,
  `postcode` VARCHAR(6) NULL DEFAULT NULL,
  `idCity` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `idCity`),
  INDEX `fk_address_city1_idx` (`idCity` ASC),
  CONSTRAINT `fk_address_city1`
    FOREIGN KEY (`idCity`)
    REFERENCES `paris`.`city` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `paris`.`city` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `idCountry` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_city_pays_idx` (`idCountry` ASC),
  CONSTRAINT `fk_city_pays`
    FOREIGN KEY (`idCountry`)
    REFERENCES `paris`.`country` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `paris`.`country` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `iso` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `paris`.`competition` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(60) NULL DEFAULT NULL,
  `active` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `paris`.`team` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `active` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `paris`.`event` (
  `id` INT(11) NOT NULL,
  `idCompetition` INT(11) NOT NULL,
  `idTeamHost` INT(11) NOT NULL,
  `idTeamGuest` INT(11) NOT NULL,
  `date` DATE NOT NULL,
  `coteHost` DECIMAL(5,2) NULL DEFAULT NULL,
  `coteTie` DECIMAL(5,2) NULL DEFAULT NULL,
  `coteGuest` DECIMAL(5,2) NULL DEFAULT NULL,
  `result` INT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_competition1_idx` (`idCompetition` ASC),
  INDEX `fk_event_team1_idx` (`idTeamHost` ASC),
  INDEX `fk_event_team2_idx` (`idTeamGuest` ASC),
  CONSTRAINT `fk_event_competition1`
    FOREIGN KEY (`idCompetition`)
    REFERENCES `paris`.`competition` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_team1`
    FOREIGN KEY (`idTeamHost`)
    REFERENCES `paris`.`team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_team2`
    FOREIGN KEY (`idTeamGuest`)
    REFERENCES `paris`.`team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `paris`.`competition_has_team` (
  `competition_id` INT(11) NOT NULL,
  `team_id` INT(11) NOT NULL,
  PRIMARY KEY (`competition_id`, `team_id`),
  INDEX `fk_competition_has_team_team1_idx` (`team_id` ASC),
  INDEX `fk_competition_has_team_competition1_idx` (`competition_id` ASC),
  CONSTRAINT `fk_competition_has_team_competition1`
    FOREIGN KEY (`competition_id`)
    REFERENCES `paris`.`competition` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_competition_has_team_team1`
    FOREIGN KEY (`team_id`)
    REFERENCES `paris`.`team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `paris`.`operation` (
  `id` INT(11) NOT NULL,
  `idOperationType` INT(11) NOT NULL,
  `idUser` INT(11) NOT NULL,
  `amount` DECIMAL(18,2) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_operation_opration_type1_idx` (`idOperationType` ASC),
  INDEX `fk_operation_user1_idx` (`idUser` ASC),
  CONSTRAINT `fk_operation_opration_type1`
    FOREIGN KEY (`idOperationType`)
    REFERENCES `paris`.`opration_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_operation_user1`
    FOREIGN KEY (`idUser`)
    REFERENCES `paris`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `paris`.`opration_type` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `paris`.`slideshow_item` (
  `id` INT(11) NOT NULL,
  `image` VARCHAR(45) NULL DEFAULT NULL,
  `idEvent` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_slideshow_item_event1_idx` (`idEvent` ASC),
  CONSTRAINT `fk_slideshow_item_event1`
    FOREIGN KEY (`idEvent`)
    REFERENCES `paris`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `paris`.`bet` (
  `idUser` INT(11) NOT NULL,
  `idEvent` INT(11) NOT NULL,
  `idBetOperation` INT(11) NOT NULL,
  `idWinOperation` INT(11) NULL DEFAULT NULL,
  `date` DATE NOT NULL,
  `quotation` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idUser`, `idEvent`, `idBetOperation`),
  INDEX `fk_user_has_event_event1_idx` (`idEvent` ASC),
  INDEX `fk_user_has_event_user1_idx` (`idUser` ASC),
  INDEX `fk_bet_operation1_idx` (`idBetOperation` ASC),
  INDEX `fk_bet_operation2_idx` (`idWinOperation` ASC),
  CONSTRAINT `fk_user_has_event_user1`
    FOREIGN KEY (`idUser`)
    REFERENCES `paris`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_event_event1`
    FOREIGN KEY (`idEvent`)
    REFERENCES `paris`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bet_operation1`
    FOREIGN KEY (`idBetOperation`)
    REFERENCES `paris`.`operation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bet_operation2`
    FOREIGN KEY (`idWinOperation`)
    REFERENCES `paris`.`operation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

RENAME TABLE opration_type TO operation_type ;


-- MySQL Script generated by MySQL Workbench
-- Fri Jul  6 11:17:10 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema laraquiz
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `laraquiz` ;

-- -----------------------------------------------------
-- Schema laraquiz
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `laraquiz` DEFAULT CHARACTER SET latin1 ;
USE `laraquiz` ;

-- -----------------------------------------------------
-- Table `laraquiz`.`migrations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`migrations` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`migrations` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `batch` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `laraquiz`.`password_resets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`password_resets` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`password_resets` (
  `email` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `token` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  INDEX `password_resets_email_index` (`email` ASC),
  INDEX `password_resets_token_index` (`token` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `laraquiz`.`questions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`questions` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`questions` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `topic_id` INT(10) NULL,
  `etapa_id` VARCHAR(45) NULL,
  `tipo` VARCHAR(20) NULL,
  `question_text` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `ponderation` INT UNSIGNED NULL,
  `inicial` TINYINT NULL,
  `answer_explanation` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `more_info_link` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  INDEX `questions_deleted_at_index` (`deleted_at` ASC),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `laraquiz`.`questions_options`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`questions_options` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`questions_options` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `option` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `puntaje` FLOAT NULL,
  `correct` TINYINT(4) NULL DEFAULT '0',
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_257_question_question_id_questions_option` (`question_id` ASC),
  INDEX `questions_options_deleted_at_index` (`deleted_at` ASC),
  CONSTRAINT `fk_257_question_question_id_questions_option`
    FOREIGN KEY (`question_id`)
    REFERENCES `laraquiz`.`questions` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `laraquiz`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`roles` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`roles` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `roles_deleted_at_index` (`deleted_at` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `laraquiz`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`users` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`users` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `email` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `password` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `role_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `remember_token` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_253_role_role_id_user` (`role_id` ASC),
  INDEX `users_deleted_at_index` (`deleted_at` ASC),
  CONSTRAINT `fk_253_role_role_id_user`
    FOREIGN KEY (`role_id`)
    REFERENCES `laraquiz`.`roles` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `laraquiz`.`results`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`results` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`results` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) UNSIGNED NOT NULL,
  `correct` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  `empresa_id` INT UNSIGNED NOT NULL,
  `question_id` INT(10) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `topico` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `user_id`, `topico`, `empresa_id`),
  INDEX `fk_254_user_user_id_result` (`user_id` ASC),
  INDEX `fk_257_question_question_id_result` (`question_id` ASC),
  INDEX `results_deleted_at_index` (`deleted_at` ASC),
  CONSTRAINT `fk_254_user_user_id_result`
    FOREIGN KEY (`user_id`)
    REFERENCES `laraquiz`.`users` (`id`),
  CONSTRAINT `fk_257_question_question_id_result`
    FOREIGN KEY (`question_id`)
    REFERENCES `laraquiz`.`questions` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `laraquiz`.`test_answers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`test_answers` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`test_answers` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `test_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `question_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `correct` TINYINT(4) NULL DEFAULT '0',
  `option_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `test_answers_deleted_at_index` (`deleted_at` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `laraquiz`.`tests`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`tests` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`tests` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `result` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `tests_deleted_at_index` (`deleted_at` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `laraquiz`.`topics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`topics` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`topics` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idetapa` VARCHAR(45) NOT NULL,
  `title` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `descripcion` VARCHAR(1500) NULL,
  PRIMARY KEY (`id`),
  INDEX `topics_deleted_at_index` (`deleted_at` ASC),
  INDEX `idetapa` (`idetapa` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `laraquiz`.`user_actions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`user_actions` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`user_actions` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  `action` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `action_model` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `action_id` INT(11) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_254_user_user_id_user_action` (`user_id` ASC),
  INDEX `user_actions_deleted_at_index` (`deleted_at` ASC),
  CONSTRAINT `fk_254_user_user_id_user_action`
    FOREIGN KEY (`user_id`)
    REFERENCES `laraquiz`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 28
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `laraquiz`.`empresas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`empresas` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`empresas` (
  `id` INT UNSIGNED NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `correo` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `rut_juridica` VARCHAR(22) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `etapa` VARCHAR(45) NULL,
  INDEX `user_id_idx` (`user_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `laraquiz`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laraquiz`.`etapas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`etapas` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`etapas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `descripcion` VARCHAR(1500) NULL,
  `requisitos` VARCHAR(1500) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laraquiz`.`documento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`documento` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`documento` (
  `id` INT NOT NULL,
  `ano` INT NULL,
  `link` VARCHAR(45) NULL,
  `descripcion` VARCHAR(220) NULL,
  `id_pregunta` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`, `id_pregunta`),
  INDEX `id_pregunta_idx` (`id_pregunta` ASC),
  CONSTRAINT `id_pregunta`
    FOREIGN KEY (`id_pregunta`)
    REFERENCES `laraquiz`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laraquiz`.`corresponde`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`corresponde` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`corresponde` (
  `id_topico` INT UNSIGNED NOT NULL,
  `id_pregunta` INT UNSIGNED NOT NULL,
  `pertenece` TINYINT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id_topico`, `id_pregunta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laraquiz`.`respuesta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`respuesta` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`respuesta` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `opcion` INT UNSIGNED NOT NULL,
  `pregunta` INT UNSIGNED NULL,
  `empresa` VARCHAR(45) NULL,
  `seleccionada` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laraquiz`.`nota_topico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`nota_topico` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`nota_topico` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `empresa` INT UNSIGNED NOT NULL,
  `topico` INT UNSIGNED NULL,
  `nota` VARCHAR(45) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laraquiz`.`solicituds`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `laraquiz`.`solicituds` ;

CREATE TABLE IF NOT EXISTS `laraquiz`.`solicituds` (
  `id` INT UNSIGNED NOT NULL,
  `id_empresa` INT UNSIGNED NULL,
  `tipo` VARCHAR(45) NULL,
  `respuesta` VARCHAR(45) NULL,
  `documento` VARCHAR(45) NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `empresa_idx` (`id_empresa` ASC),
  CONSTRAINT `empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `laraquiz`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

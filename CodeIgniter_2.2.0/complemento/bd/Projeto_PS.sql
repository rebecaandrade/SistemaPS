-- MySQL Script generated by MySQL Workbench
-- 03/13/15 17:08:49
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema projeto_ps
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projeto_ps
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projeto_ps` DEFAULT CHARACTER SET utf8 ;
USE `projeto_ps` ;

-- -----------------------------------------------------
-- Table `projeto_ps`.`tb_login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ps`.`tb_login` (
  `id_login` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `perfil` TINYINT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(100) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `semestre` VARCHAR(45) NOT NULL,
  `curso` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `foto` VARCHAR(200) NULL,
  `dinamica` TIME NULL,
  `apresentacao` TIME NULL,
  `num_de_ps` INT NULL,
  PRIMARY KEY (`id_login`),
  UNIQUE INDEX `id_login_UNIQUE` (`id_login` ASC),
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ps`.`tb_PS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ps`.`tb_PS` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `edicao` VARCHAR(45) NULL,
  `data_abertura` DATE NOT NULL,
  `data_dinamica` DATE NOT NULL,
  `data_apresentacao` DATE NOT NULL,
  `primeiro_horario_dinamica` TIME NOT NULL,
  `segundo_horario_dinamica` TIME NOT NULL,
  `primeiro_horario_apresentacao` TIME NOT NULL,
  `segundo_horario_apresentacao` TIME NOT NULL,
  `status_ps` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ps`.`tb_datas_validas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ps`.`tb_datas_validas` (
  `id_data` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `tipo` TINYINT NOT NULL,
  `tb_PS_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_data`),
  UNIQUE INDEX `id_data_UNIQUE` (`id_data` ASC),
  INDEX `fk_tb_datas_validas_tb_PS1_idx` (`tb_PS_id` ASC),
  CONSTRAINT `fk_tb_datas_validas_tb_PS1`
    FOREIGN KEY (`tb_PS_id`)
    REFERENCES `projeto_ps`.`tb_PS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ps`.`tb_horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ps`.`tb_horario` (
  `id_horario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `tempo` TIME NOT NULL,
  `tb_datas_validas_id_data` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_horario`),
  UNIQUE INDEX `id_horario_UNIQUE` (`id_horario` ASC),
  INDEX `fk_tb_horario_tb_datas_validas1_idx` (`tb_datas_validas_id_data` ASC),
  CONSTRAINT `fk_tb_horario_tb_datas_validas1`
    FOREIGN KEY (`tb_datas_validas_id_data`)
    REFERENCES `projeto_ps`.`tb_datas_validas` (`id_data`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ps`.`ta_login_x_tb_horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ps`.`ta_login_x_tb_horario` (
  `tb_login_id_login` INT UNSIGNED NOT NULL,
  `tb_horario_id_horario` INT UNSIGNED NOT NULL,
  `tb_PS_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`tb_login_id_login`, `tb_horario_id_horario`, `tb_PS_id`),
  INDEX `fk_tb_login_has_tb_horario_tb_horario1_idx` (`tb_horario_id_horario` ASC),
  INDEX `fk_tb_login_has_tb_horario_tb_login_idx` (`tb_login_id_login` ASC),
  INDEX `fk_tb_login_x_tb_horario_tb_PS1_idx` (`tb_PS_id` ASC),
  CONSTRAINT `fk_tb_login_has_tb_horario_tb_login`
    FOREIGN KEY (`tb_login_id_login`)
    REFERENCES `projeto_ps`.`tb_login` (`id_login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_login_has_tb_horario_tb_horario1`
    FOREIGN KEY (`tb_horario_id_horario`)
    REFERENCES `projeto_ps`.`tb_horario` (`id_horario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_login_x_tb_horario_tb_PS1`
    FOREIGN KEY (`tb_PS_id`)
    REFERENCES `projeto_ps`.`tb_PS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto_ps`.`ta_login_x_tb_PS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto_ps`.`ta_login_x_tb_PS` (
  `tb_login_id_login` INT UNSIGNED NOT NULL,
  `tb_PS_id` INT UNSIGNED NOT NULL,
  `feedback` TEXT NULL,
  `status_feed` TINYINT NULL,
  `entrevistado` TINYINT(1) NOT NULL DEFAULT 0,
  `entrevistador1` VARCHAR(45) NULL,
  `entrevistador2` VARCHAR(45) NULL,
  PRIMARY KEY (`tb_login_id_login`, `tb_PS_id`),
  INDEX `fk_tb_login_has_tb_PS_tb_PS1_idx` (`tb_PS_id` ASC),
  INDEX `fk_tb_login_has_tb_PS_tb_login1_idx` (`tb_login_id_login` ASC),
  CONSTRAINT `fk_tb_login_has_tb_PS_tb_login1`
    FOREIGN KEY (`tb_login_id_login`)
    REFERENCES `projeto_ps`.`tb_login` (`id_login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_login_has_tb_PS_tb_PS1`
    FOREIGN KEY (`tb_PS_id`)
    REFERENCES `projeto_ps`.`tb_PS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

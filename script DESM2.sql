-- MySQL Script generated by MySQL Workbench
-- Sat May 18 19:41:53 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema coleta_desm2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coleta_desm2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coleta_desm2` DEFAULT CHARACTER SET utf8 ;
USE `coleta_desm2` ;

-- -----------------------------------------------------
-- Table `coleta_desm2`.`tb_estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleta_desm2`.`tb_estado` (
  `cod_estado` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coleta_desm2`.`tb_estado_civil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleta_desm2`.`tb_estado_civil` (
  `cod_estado_civil` INT NOT NULL AUTO_INCREMENT,
  `estado_civil` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_estado_civil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coleta_desm2`.`tb_escolaridade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleta_desm2`.`tb_escolaridade` (
  `cod_escolaridade` INT NOT NULL AUTO_INCREMENT,
  `escolaridade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_escolaridade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coleta_desm2`.`tb_hobbie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleta_desm2`.`tb_hobbie` (
  `cod_hobbie` INT NOT NULL AUTO_INCREMENT,
  `hobbie` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_hobbie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coleta_desm2`.`tb_especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleta_desm2`.`tb_especialidade` (
  `cod_especialidade` INT NOT NULL AUTO_INCREMENT,
  `especialidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_especialidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coleta_desm2`.`tb_medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleta_desm2`.`tb_medico` (
  `cod_medico` INT NOT NULL AUTO_INCREMENT,
  `nome_medico` VARCHAR(45) NOT NULL,
  `cod_especialidade` INT NOT NULL,
  PRIMARY KEY (`cod_medico`),
  INDEX `fk_tb_medico_tb_especialidade_idx` (`cod_especialidade` ASC) VISIBLE,
  CONSTRAINT `fk_tb_medico_tb_especialidade`
    FOREIGN KEY (`cod_especialidade`)
    REFERENCES `coleta_desm2`.`tb_especialidade` (`cod_especialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coleta_desm2`.`tb_motivo_licenca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleta_desm2`.`tb_motivo_licenca` (
  `cod_motivo_licenca` INT NOT NULL AUTO_INCREMENT,
  `motivo_licenca` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cod_motivo_licenca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coleta_desm2`.`tb_colaborador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleta_desm2`.`tb_colaborador` (
  `cod_colaborador` INT NOT NULL AUTO_INCREMENT,
  `nome_colaborador` VARCHAR(45) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `sexo_colaborador` VARCHAR(45) NOT NULL,
  `salario` DECIMAL(10,2) NOT NULL,
  `qtd_filhos` INT NOT NULL,
  `possui_pet` VARCHAR(3) NOT NULL,
  `cod_estado_civil` INT NOT NULL,
  `cod_escolaridade` INT NOT NULL,
  `cod_hobbie` INT NOT NULL,
  `cod_estado` INT NOT NULL,
  PRIMARY KEY (`cod_colaborador`),
  INDEX `fk_tb_colaborador_tb_estado_civil1_idx` (`cod_estado_civil` ASC) VISIBLE,
  INDEX `fk_tb_colaborador_tb_escolaridade1_idx` (`cod_escolaridade` ASC) VISIBLE,
  INDEX `fk_tb_colaborador_tb_hobbie1_idx` (`cod_hobbie` ASC) VISIBLE,
  INDEX `fk_tb_colaborador_tb_estado1_idx` (`cod_estado` ASC) VISIBLE,
  CONSTRAINT `fk_tb_colaborador_tb_estado_civil1`
    FOREIGN KEY (`cod_estado_civil`)
    REFERENCES `coleta_desm2`.`tb_estado_civil` (`cod_estado_civil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_colaborador_tb_escolaridade1`
    FOREIGN KEY (`cod_escolaridade`)
    REFERENCES `coleta_desm2`.`tb_escolaridade` (`cod_escolaridade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_colaborador_tb_hobbie1`
    FOREIGN KEY (`cod_hobbie`)
    REFERENCES `coleta_desm2`.`tb_hobbie` (`cod_hobbie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_colaborador_tb_estado1`
    FOREIGN KEY (`cod_estado`)
    REFERENCES `coleta_desm2`.`tb_estado` (`cod_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coleta_desm2`.`tb_processamento_licenca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleta_desm2`.`tb_processamento_licenca` (
  `cod_processamento` INT NOT NULL AUTO_INCREMENT,
  `data_processamento` DATE NOT NULL,
  `inicio_licenca` DATE NOT NULL,
  `fim_licenca` DATE NOT NULL,
  `duracao_licenca` INT NOT NULL,
  `cod_colaborador` INT NOT NULL,
  `cod_medico` INT NOT NULL,
  `cod_motivo_licenca` INT NOT NULL,
  PRIMARY KEY (`cod_processamento`),
  INDEX `fk_tb_processamento_licenca_tb_colaborador1_idx` (`cod_colaborador` ASC) VISIBLE,
  INDEX `fk_tb_processamento_licenca_tb_medico1_idx` (`cod_medico` ASC) VISIBLE,
  INDEX `fk_tb_processamento_licenca_tb_motivo_licenca1_idx` (`cod_motivo_licenca` ASC) VISIBLE,
  CONSTRAINT `fk_tb_processamento_licenca_tb_colaborador1`
    FOREIGN KEY (`cod_colaborador`)
    REFERENCES `coleta_desm2`.`tb_colaborador` (`cod_colaborador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_processamento_licenca_tb_medico1`
    FOREIGN KEY (`cod_medico`)
    REFERENCES `coleta_desm2`.`tb_medico` (`cod_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_processamento_licenca_tb_motivo_licenca1`
    FOREIGN KEY (`cod_motivo_licenca`)
    REFERENCES `coleta_desm2`.`tb_motivo_licenca` (`cod_motivo_licenca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

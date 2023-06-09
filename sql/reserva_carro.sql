-- MySQL Script generated by MySQL Workbench
-- Wed May  3 14:48:52 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema reserva_carro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema reserva_carro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `reserva_carro` DEFAULT CHARACTER SET utf8 ;
USE `reserva_carro` ;

-- -----------------------------------------------------
-- Table `reserva_carro`.`carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reserva_carro`.`carro` (
  `idcarro` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(7) NOT NULL,
  `modelo` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`idcarro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reserva_carro`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reserva_carro`.`funcionario` (
  `idfuncionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` INT NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `telefone` INT NOT NULL,
  `funcao` VARCHAR(255) NOT NULL,
  `emprego` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idfuncionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reserva_carro`.`login_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reserva_carro`.`login_funcionario` (
  `idlogin_funcionario` INT NOT NULL AUTO_INCREMENT,
  `usuario_funcionario` VARCHAR(255) NOT NULL,
  `senha_funcionario` VARCHAR(255) NOT NULL,
  `funcionario_idfuncionario` INT NOT NULL,
  PRIMARY KEY (`idlogin_funcionario`),
  INDEX `fk_login_funcionario_funcionario1_idx` (`funcionario_idfuncionario` ASC),
  CONSTRAINT `fk_login_funcionario_funcionario1`
    FOREIGN KEY (`funcionario_idfuncionario`)
    REFERENCES `reserva_carro`.`funcionario` (`idfuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reserva_carro`.`agendamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reserva_carro`.`agendamento` (
  `idagenda` INT NOT NULL AUTO_INCREMENT,
  `carro_idcarro` INT NOT NULL,
  `entrada` DATE NOT NULL,
  `saida` DATE NOT NULL,
  `horario_entrada` TIME NOT NULL,
  `horario_saida` TIME NOT NULL,
  `data` DATE NOT NULL,
  `motivo` VARCHAR(255) NOT NULL,
  `intervalo` INT NULL,
  `cidade` VARCHAR(255) NOT NULL,
  `bairro` VARCHAR(255) NOT NULL,
  `login_funcionario_idlogin_funcionario` INT NOT NULL,
  PRIMARY KEY (`idagenda`),
  INDEX `fk_agendamento_carro1_idx` (`carro_idcarro` ASC),
  INDEX `fk_agendamento_login_funcionario1_idx` (`login_funcionario_idlogin_funcionario` ASC),
  CONSTRAINT `fk_agendamento_carro1`
    FOREIGN KEY (`carro_idcarro`)
    REFERENCES `reserva_carro`.`carro` (`idcarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamento_login_funcionario1`
    FOREIGN KEY (`login_funcionario_idlogin_funcionario`)
    REFERENCES `reserva_carro`.`login_funcionario` (`idlogin_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reserva_carro`.`historico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reserva_carro`.`historico` (
  `idhistorico` INT NOT NULL AUTO_INCREMENT,
  `funcionario_idfuncionario` INT NOT NULL,
  `entrada` DATE NOT NULL,
  `saida` DATE NOT NULL,
  `horario_entrada` TIME NOT NULL,
  `horario_saida` TIME NOT NULL,
  `motivo` VARCHAR(255) NOT NULL,
  `intervalo` INT NOT NULL,
  `kilometragem` DOUBLE NOT NULL,
  PRIMARY KEY (`idhistorico`),
  INDEX `fk_historico_funcionario1_idx` (`funcionario_idfuncionario` ASC),
  CONSTRAINT `fk_historico_funcionario1`
    FOREIGN KEY (`funcionario_idfuncionario`)
    REFERENCES `reserva_carro`.`funcionario` (`idfuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reserva_carro`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reserva_carro`.`login` (
  `idlogin` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idlogin`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

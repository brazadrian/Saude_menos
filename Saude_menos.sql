-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_SaudeMenos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_SaudeMenos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_SaudeMenos` ;
USE `db_SaudeMenos` ;

-- -----------------------------------------------------
-- Table `db_SaudeMenos`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_SaudeMenos`.`Endereco` (
  `id_endereco` INT NOT NULL AUTO_INCREMENT,
  `CEP` INT NOT NULL,
  `numero` INT NOT NULL,
  `complemento` VARCHAR(70) NULL,
  `rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NULL,
  `estado` CHAR(2) NULL,
  PRIMARY KEY (`id_endereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_SaudeMenos`.`Hospitais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_SaudeMenos`.`Hospitais` (
  `CNES` CHAR(7) NOT NULL,
  `CNPJ` CHAR(14) NOT NULL,
  `Nome` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`CNES`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_SaudeMenos`.`Laboratorios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_SaudeMenos`.`Laboratorios` (
  `CNES` CHAR(7) NOT NULL,
  `id_laboratorio` INT NOT NULL,
  `nome_laboratorio` VARCHAR(90) NOT NULL,
  `Hospitais_CNES` CHAR(7) NULL,
  PRIMARY KEY (`CNES`),
  UNIQUE INDEX `id_laboratorio_UNIQUE` (`id_laboratorio` ASC) VISIBLE,
  INDEX `fk_Laboratorios_Hospitais1_idx` (`Hospitais_CNES` ASC) VISIBLE,
  UNIQUE INDEX `Hospitais_CNES_UNIQUE` (`Hospitais_CNES` ASC) VISIBLE,
  CONSTRAINT `fk_Laboratorios_Hospitais1`
    FOREIGN KEY (`Hospitais_CNES`)
    REFERENCES `db_SaudeMenos`.`Hospitais` (`CNES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_SaudeMenos`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_SaudeMenos`.`Telefone` (
  `num_telefone` CHAR(9) NOT NULL,
  `DDD` CHAR(2) NOT NULL,
  PRIMARY KEY (`num_telefone`, `DDD`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_SaudeMenos`.`Hospitais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_SaudeMenos`.`Hospitais` (
  `CNES` CHAR(7) NOT NULL,
  `CNPJ` CHAR(14) NOT NULL,
  `Nome` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`CNES`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_SaudeMenos`.`Ambulatorios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_SaudeMenos`.`Ambulatorios` (
  `id_ambulatorio` INT NOT NULL AUTO_INCREMENT,
  `especialidade` VARCHAR(45) NOT NULL,
  `Hospitais_CNES` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`id_ambulatorio`, `Hospitais_CNES`),
  INDEX `fk_Ambulatorios_Hospitais1_idx` (`Hospitais_CNES` ASC) VISIBLE,
  CONSTRAINT `fk_Ambulatorios_Hospitais1`
    FOREIGN KEY (`Hospitais_CNES`)
    REFERENCES `db_SaudeMenos`.`Hospitais` (`CNES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_SaudeMenos`.`Pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_SaudeMenos`.`Pacientes` (
  `num_prontuario` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(90) NOT NULL,
  `NomeSocial` VARCHAR(90) NULL,
  `CPF` CHAR(11) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Sexo` VARCHAR(45) NOT NULL,
  `Ambulatorios_id_ambulatorio` INT NOT NULL,
  `Ambulatorios_Hospitais_CNES` VARCHAR(7) NOT NULL,
  `Endereco_id_endereco` INT NOT NULL,
  `Telefone_num_telefone` CHAR(9) NOT NULL,
  `Telefone_DDD` CHAR(2) NOT NULL,
  PRIMARY KEY (`num_prontuario`, `Ambulatorios_id_ambulatorio`, `Ambulatorios_Hospitais_CNES`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  INDEX `fk_Pacientes_Ambulatorios1_idx` (`Ambulatorios_id_ambulatorio` ASC, `Ambulatorios_Hospitais_CNES` ASC) VISIBLE,
  INDEX `fk_Pacientes_Endereco1_idx` (`Endereco_id_endereco` ASC) VISIBLE,
  INDEX `fk_Pacientes_Telefone1_idx` (`Telefone_num_telefone` ASC, `Telefone_DDD` ASC) VISIBLE,
  CONSTRAINT `fk_Pacientes_Ambulatorios1`
    FOREIGN KEY (`Ambulatorios_id_ambulatorio` , `Ambulatorios_Hospitais_CNES`)
    REFERENCES `db_SaudeMenos`.`Ambulatorios` (`id_ambulatorio` , `Hospitais_CNES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pacientes_Endereco1`
    FOREIGN KEY (`Endereco_id_endereco`)
    REFERENCES `db_SaudeMenos`.`Endereco` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pacientes_Telefone1`
    FOREIGN KEY (`Telefone_num_telefone` , `Telefone_DDD`)
    REFERENCES `db_SaudeMenos`.`Telefone` (`num_telefone` , `DDD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_SaudeMenos`.`Exames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_SaudeMenos`.`Exames` (
  `Data` DATETIME NULL,
  `id_exame` INT NOT NULL,
  `data-solicitacao` DATETIME NOT NULL,
  `data-realizacao` DATETIME NOT NULL,
  `grupo_exame` CHAR(1) NOT NULL,
  `cod_exame` CHAR(7) NOT NULL,
  `nome_exame` VARCHAR(45) NOT NULL,
  `Laboratorios_CNES` CHAR(7) NOT NULL,
  `Pacientes_num_prontuario` INT NOT NULL,
  PRIMARY KEY (`id_exame`, `Pacientes_num_prontuario`),
  INDEX `fk_Exames_Laboratorios1_idx` (`Laboratorios_CNES` ASC) VISIBLE,
  INDEX `fk_Exames_Pacientes1_idx` (`Pacientes_num_prontuario` ASC) VISIBLE,
  CONSTRAINT `fk_Exames_Laboratorios1`
    FOREIGN KEY (`Laboratorios_CNES`)
    REFERENCES `db_SaudeMenos`.`Laboratorios` (`CNES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exames_Pacientes1`
    FOREIGN KEY (`Pacientes_num_prontuario`)
    REFERENCES `db_SaudeMenos`.`Pacientes` (`num_prontuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_SaudeMenos`.`Pessoal de apoio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_SaudeMenos`.`Pessoal de apoio` (
  `CPF` CHAR(11) COLLATE 'Default Collation' NOT NULL,
  `Nome` VARCHAR(90) NOT NULL,
  `Matricula(UN)` INT NOT NULL AUTO_INCREMENT,
  `NomeSocial` VARCHAR(90) NULL,
  `Sexo` CHAR(1) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Salario` DECIMAL(10,2) NOT NULL,
  `Ambulatorios_id_ambulatorio` INT NOT NULL,
  `Ambulatorios_Hospitais_CNES1` VARCHAR(7) NOT NULL,
  `Endereco_id_endereco` INT NOT NULL,
  `Telefone_num_telefone` CHAR(9) NOT NULL,
  `Telefone_DDD` CHAR(2) NOT NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  INDEX `fk_Pessoal de apoio_Ambulatorios1_idx` (`Ambulatorios_id_ambulatorio` ASC, `Ambulatorios_Hospitais_CNES1` ASC) VISIBLE,
  INDEX `fk_Pessoal de apoio_Endereco1_idx` (`Endereco_id_endereco` ASC) VISIBLE,
  INDEX `fk_Pessoal de apoio_Telefone1_idx` (`Telefone_num_telefone` ASC, `Telefone_DDD` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoal de apoio_Ambulatorios`
    FOREIGN KEY (`Ambulatorios_id_ambulatorio` , `Ambulatorios_Hospitais_CNES1`)
    REFERENCES `db_SaudeMenos`.`Ambulatorios` (`id_ambulatorio` , `Hospitais_CNES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoal de apoio_Endereco`
    FOREIGN KEY (`Endereco_id_endereco`)
    REFERENCES `db_SaudeMenos`.`Endereco` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoal de apoio_Telefone`
    FOREIGN KEY (`Telefone_num_telefone` , `Telefone_DDD`)
    REFERENCES `db_SaudeMenos`.`Telefone` (`num_telefone` , `DDD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_SaudeMenos`.`Consultam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_SaudeMenos`.`Consultam` (
  `Data_consulta` DATETIME NOT NULL,
  PRIMARY KEY (`Data_consulta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_SaudeMenos`.`Medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_SaudeMenos`.`Medicos` (
  `CRM` INT NOT NULL,
  `UF_CRM` CHAR(2) NOT NULL,
  `CPF` VARCHAR(45) NOT NULL,
  `Nome` VARCHAR(90) NOT NULL,
  `NomeSocial` VARCHAR(90) NULL,
  `RQE` CHAR(4) NULL,
  `Especialidade` VARCHAR(45) NOT NULL,
  `Sexo` CHAR(1) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Salario` DECIMAL(10,2) NOT NULL,
  `Situacao` BIT(1) NULL,
  `Hospitais_CNES` VARCHAR(7) NOT NULL,
  `Endereco_id_endereco` INT NOT NULL,
  `Telefone_num_telefone` CHAR(9) NOT NULL,
  `Telefone_DDD` CHAR(2) NOT NULL,
  PRIMARY KEY (`CRM`, `UF_CRM`, `Hospitais_CNES`),
  INDEX `fk_Medicos_Hospitais1_idx` (`Hospitais_CNES` ASC) VISIBLE,
  INDEX `fk_Medicos_Endereco1_idx` (`Endereco_id_endereco` ASC) VISIBLE,
  INDEX `fk_Medicos_Telefone1_idx` (`Telefone_num_telefone` ASC, `Telefone_DDD` ASC) VISIBLE,
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  CONSTRAINT `fk_Medicos_Hospitais1`
    FOREIGN KEY (`Hospitais_CNES`)
    REFERENCES `db_SaudeMenos`.`Hospitais` (`CNES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medicos_Endereco1`
    FOREIGN KEY (`Endereco_id_endereco`)
    REFERENCES `db_SaudeMenos`.`Endereco` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medicos_Telefone1`
    FOREIGN KEY (`Telefone_num_telefone` , `Telefone_DDD`)
    REFERENCES `db_SaudeMenos`.`Telefone` (`num_telefone` , `DDD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_SaudeMenos`.`Diagnosticos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_SaudeMenos`.`Diagnosticos` (
  `id_Diagnostico` INT NOT NULL,
  `Paciente_CPF` VARCHAR(45) NOT NULL,
  `CID` VARCHAR(45) NOT NULL,
  `Medicos_CRM` INT NOT NULL,
  `Medicos_UF_CRM` CHAR(2) NOT NULL,
  `Medicos_Hospitais_CNES` VARCHAR(7) NOT NULL,
  `Pacientes_num_prontuario` INT NOT NULL,
  PRIMARY KEY (`id_Diagnostico`, `Medicos_CRM`, `Medicos_UF_CRM`, `Medicos_Hospitais_CNES`),
  INDEX `fk_Diagnosticos_Medicos1_idx` (`Medicos_CRM` ASC, `Medicos_UF_CRM` ASC, `Medicos_Hospitais_CNES` ASC) VISIBLE,
  INDEX `fk_Diagnosticos_Pacientes1_idx` (`Pacientes_num_prontuario` ASC) VISIBLE,
  CONSTRAINT `fk_Diagnosticos_Medicos1`
    FOREIGN KEY (`Medicos_CRM` , `Medicos_UF_CRM` , `Medicos_Hospitais_CNES`)
    REFERENCES `db_SaudeMenos`.`Medicos` (`CRM` , `UF_CRM` , `Hospitais_CNES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Diagnosticos_Pacientes1`
    FOREIGN KEY (`Pacientes_num_prontuario`)
    REFERENCES `db_SaudeMenos`.`Pacientes` (`num_prontuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_SaudeMenos`.`Clinicam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_SaudeMenos`.`Clinicam` (
  `Data` DATETIME NOT NULL,
  PRIMARY KEY (`Data`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_SaudeMenos`.`SolicitacoesExames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_SaudeMenos`.`SolicitacoesExames` (
  `Laboratorios_CNES` CHAR(7) NOT NULL,
  `Hospitais_CNES` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`Laboratorios_CNES`, `Hospitais_CNES`),
  INDEX `fk_Laboratorios_has_Hospitais_Hospitais1_idx` (`Hospitais_CNES` ASC) VISIBLE,
  INDEX `fk_Laboratorios_has_Hospitais_Laboratorios1_idx` (`Laboratorios_CNES` ASC) VISIBLE,
  CONSTRAINT `fk_Laboratorios_has_Hospitais_Laboratorios1`
    FOREIGN KEY (`Laboratorios_CNES`)
    REFERENCES `db_SaudeMenos`.`Laboratorios` (`CNES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Laboratorios_has_Hospitais_Hospitais1`
    FOREIGN KEY (`Hospitais_CNES`)
    REFERENCES `db_SaudeMenos`.`Hospitais` (`CNES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_SaudeMenos`.`Consultas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_SaudeMenos`.`Consultas` (
  `Pacientes_num_prontuario` INT NOT NULL,
  `Medicos_CRM` INT NOT NULL,
  `Medicos_UF_CRM` CHAR(2) NOT NULL,
  `Medicos_Hospitais_CNES` VARCHAR(7) NOT NULL,
  `lembradecriarosatributos` VARCHAR(45) NULL,
  PRIMARY KEY (`Pacientes_num_prontuario`, `Medicos_CRM`, `Medicos_UF_CRM`, `Medicos_Hospitais_CNES`),
  INDEX `fk_Pacientes_has_Medicos_Medicos1_idx` (`Medicos_CRM` ASC, `Medicos_UF_CRM` ASC, `Medicos_Hospitais_CNES` ASC) VISIBLE,
  INDEX `fk_Pacientes_has_Medicos_Pacientes1_idx` (`Pacientes_num_prontuario` ASC) VISIBLE,
  CONSTRAINT `fk_Pacientes_has_Medicos_Pacientes1`
    FOREIGN KEY (`Pacientes_num_prontuario`)
    REFERENCES `db_SaudeMenos`.`Pacientes` (`num_prontuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pacientes_has_Medicos_Medicos1`
    FOREIGN KEY (`Medicos_CRM` , `Medicos_UF_CRM` , `Medicos_Hospitais_CNES`)
    REFERENCES `db_SaudeMenos`.`Medicos` (`CRM` , `UF_CRM` , `Hospitais_CNES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

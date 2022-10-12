-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Saude_menos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Saude_menos`;
USE `Saude_menos`;

-- -----------------------------------------------------
-- Table `Saude_menos`.`Enderecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saude_menos`.`Enderecos` (
  `id_endereco` INT NOT NULL AUTO_INCREMENT,
  `cep` CHAR(11) NOT NULL,
  `rua` VARCHAR(90) NULL,
  `numero` INT NULL,
  `bairro` VARCHAR(45) NULL,
  `estado` CHAR(2) NULL DEFAULT 'PE',
  PRIMARY KEY (`id_endereco`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Saude_menos`.`Telefones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saude_menos`.`Telefones` (
  `ddd` CHAR(2) NOT NULL,
  `num_telefone` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`ddd`, `num_telefone`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saude_menos`.`Hospitais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saude_menos`.`Hospitais` (
  `cnes` VARCHAR(7) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cnpj` CHAR(14) NULL,
  `Enderecos_id_endereco` INT NOT NULL,
  `Telefones_ddd` CHAR(2) NOT NULL,
  `Telefones_num_telefone` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`cnes`),
  INDEX `fk_Hospitais_Enderecos1_idx` (`Enderecos_id_endereco` ASC) VISIBLE,
  INDEX `fk_Hospitais_Telefones1_idx` (`Telefones_ddd` ASC, `Telefones_num_telefone` ASC) VISIBLE,
  CONSTRAINT `fk_Hospitais_Enderecos1`
    FOREIGN KEY (`Enderecos_id_endereco`)
    REFERENCES `Saude_menos`.`Enderecos` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hospitais_Telefones1`
    FOREIGN KEY (`Telefones_ddd` , `Telefones_num_telefone`)
    REFERENCES `Saude_menos`.`Telefones` (`ddd` , `num_telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saude_menos`.`Ambulatorios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saude_menos`.`Ambulatorios` (
  `id_ambulatorios` INT NOT NULL AUTO_INCREMENT,
  `especialidade` VARCHAR(45) NOT NULL,
  `Hospitais_cnes` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`id_ambulatorios`, `Hospitais_cnes`),
  INDEX `fk_Ambulatorios_Hospitais1_idx` (`Hospitais_cnes` ASC) VISIBLE,
  CONSTRAINT `fk_Ambulatorios_Hospitais1`
    FOREIGN KEY (`Hospitais_cnes`)
    REFERENCES `Saude_menos`.`Hospitais` (`cnes`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saude_menos`.`Laboratorios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saude_menos`.`Laboratorios` (
  `cnes` VARCHAR(7) NOT NULL,
  `id_laboratorio` INT NOT NULL,
  `nome` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`cnes`),
  UNIQUE INDEX `id_laboratorio_UNIQUE` (`id_laboratorio` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saude_menos`.`Solicitacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saude_menos`.`Solicitacoes` (
  `Hospitais_cnes` VARCHAR(7) NOT NULL,
  `Laboratorios_cnes` VARCHAR(7) NOT NULL,
  `id_solicitacao` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`id_solicitacao`, `Hospitais_cnes`, `Laboratorios_cnes`),
  INDEX `fk_Hospitais_has_Laboratorios_Laboratorios1_idx` (`Laboratorios_cnes` ASC) VISIBLE,
  INDEX `fk_Hospitais_has_Laboratorios_Hospitais_idx` (`Hospitais_cnes` ASC) VISIBLE,
  CONSTRAINT `fk_Hospitais_has_Laboratorios_Hospitais`
    FOREIGN KEY (`Hospitais_cnes`)
    REFERENCES `Saude_menos`.`Hospitais` (`cnes`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Hospitais_has_Laboratorios_Laboratorios1`
    FOREIGN KEY (`Laboratorios_cnes`)
    REFERENCES `Saude_menos`.`Laboratorios` (`cnes`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saude_menos`.`Pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saude_menos`.`Pacientes` (
  `num_prontuario` INT NOT NULL AUTO_INCREMENT,
  `cpf` CHAR(11) NOT NULL,
  `nome` VARCHAR(90) NOT NULL,
  `nome_social` VARCHAR(90) NULL DEFAULT '',
  `email` VARCHAR(45) NULL,
  `sexo` CHAR(1) NOT NULL,
  `Enderecos_id_endereco` INT NOT NULL,
  `Telefones_ddd` CHAR(2) NOT NULL,
  `Telefones_num_telefone` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`num_prontuario`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_Pacientes_Enderecos1_idx` (`Enderecos_id_endereco` ASC) VISIBLE,
  INDEX `fk_Pacientes_Telefones1_idx` (`Telefones_ddd` ASC, `Telefones_num_telefone` ASC) VISIBLE,
  CONSTRAINT `fk_Pacientes_Enderecos1`
    FOREIGN KEY (`Enderecos_id_endereco`)
    REFERENCES `Saude_menos`.`Enderecos` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pacientes_Telefones1`
    FOREIGN KEY (`Telefones_ddd` , `Telefones_num_telefone`)
    REFERENCES `Saude_menos`.`Telefones` (`ddd` , `num_telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
PACK_KEYS = DEFAULT;


-- -----------------------------------------------------
-- Table `Saude_menos`.`Exames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saude_menos`.`Exames` (
  `id_exame` INT NOT NULL AUTO_INCREMENT,
  `data_solicitacao` DATE NOT NULL,
  `data_realizacao` DATETIME NULL,
  `grupo_exame` CHAR(1) NOT NULL,
  `cod_exame` CHAR(7) NOT NULL,
  `nome_exame` VARCHAR(90) NULL,
  `Laboratorios_cnes` VARCHAR(7) NOT NULL,
  `Pacientes_num_prontuario` INT NOT NULL,
  PRIMARY KEY (`id_exame`),
  INDEX `fk_Exames_Laboratorios1_idx` (`Laboratorios_cnes` ASC) VISIBLE,
  INDEX `fk_Exames_Pacientes1_idx` (`Pacientes_num_prontuario` ASC) VISIBLE,
  CONSTRAINT `fk_Exames_Laboratorios1`
    FOREIGN KEY (`Laboratorios_cnes`)
    REFERENCES `Saude_menos`.`Laboratorios` (`cnes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exames_Pacientes1`
    FOREIGN KEY (`Pacientes_num_prontuario`)
    REFERENCES `Saude_menos`.`Pacientes` (`num_prontuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saude_menos`.`Medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saude_menos`.`Medicos` (
  `cpf` CHAR(11) NOT NULL,
  `crm` VARCHAR(8) NULL COMMENT 'Antes era subdividida em duas colunas, UF-CRM e CRM. Agora, quando for fazer a inserção de dados, adicionar a UF nos caracteres\nEx.:\nPE1025',
  `nome` VARCHAR(90) NOT NULL,
  `nome_social` VARCHAR(90) NULL DEFAULT '',
  `rqe` CHAR(4) NULL,
  `especialidade` VARCHAR(45) NULL,
  `sexo` CHAR(1) NOT NULL,
  `email` VARCHAR(45) NULL,
  `salario` DECIMAL(10,2) NULL,
  `situacao` BIT NOT NULL,
  `Enderecos_id_endereco` INT NOT NULL,
  `Telefones_ddd` CHAR(2) NOT NULL,
  `Telefones_num_telefone` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_Medicos_Enderecos1_idx` (`Enderecos_id_endereco` ASC) VISIBLE,
  INDEX `fk_Medicos_Telefones1_idx` (`Telefones_ddd` ASC, `Telefones_num_telefone` ASC) VISIBLE,
  CONSTRAINT `fk_Medicos_Enderecos1`
    FOREIGN KEY (`Enderecos_id_endereco`)
    REFERENCES `Saude_menos`.`Enderecos` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medicos_Telefones1`
    FOREIGN KEY (`Telefones_ddd` , `Telefones_num_telefone`)
    REFERENCES `Saude_menos`.`Telefones` (`ddd` , `num_telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saude_menos`.`Diagnosticos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saude_menos`.`Diagnosticos` (
  `id_diagnostico` INT NOT NULL AUTO_INCREMENT,
  `nome_patologia` VARCHAR(45) NULL,
  `cid_sigla` CHAR(1) NOT NULL,
  `cid_cod` CHAR(3) NOT NULL,
  `Medicos_cpf` CHAR(11) NOT NULL,
  `Pacientes_num_prontuario` INT NOT NULL,
  PRIMARY KEY (`id_diagnostico`, `Pacientes_num_prontuario`),
  INDEX `fk_Diagnosticos_Medicos1_idx` (`Medicos_cpf` ASC) VISIBLE,
  INDEX `fk_Diagnosticos_Pacientes1_idx` (`Pacientes_num_prontuario` ASC) VISIBLE,
  CONSTRAINT `fk_Diagnosticos_Medicos1`
    FOREIGN KEY (`Medicos_cpf`)
    REFERENCES `Saude_menos`.`Medicos` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Diagnosticos_Pacientes1`
    FOREIGN KEY (`Pacientes_num_prontuario`)
    REFERENCES `Saude_menos`.`Pacientes` (`num_prontuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saude_menos`.`Consultas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saude_menos`.`Consultas` (
  `data_consulta` DATETIME NULL,
  `data_agendada` DATETIME NOT NULL,
  `Medicos_cpf` CHAR(11) NOT NULL,
  `Pacientes_num_prontuario` INT NOT NULL,
  PRIMARY KEY (`data_agendada`, `Medicos_cpf`, `Pacientes_num_prontuario`),
  INDEX `fk_Consultas_Medicos1_idx` (`Medicos_cpf` ASC) VISIBLE,
  INDEX `fk_Consultas_Pacientes1_idx` (`Pacientes_num_prontuario` ASC) VISIBLE,
  CONSTRAINT `fk_Consultas_Medicos1`
    FOREIGN KEY (`Medicos_cpf`)
    REFERENCES `Saude_menos`.`Medicos` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Consultas_Pacientes1`
    FOREIGN KEY (`Pacientes_num_prontuario`)
    REFERENCES `Saude_menos`.`Pacientes` (`num_prontuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Saude_menos`.`Pessoal_de_apoio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saude_menos`.`Pessoal_de_apoio` (
  `cpf` CHAR(11) NOT NULL,
  `matricula` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(90) NOT NULL,
  `nome_social` VARCHAR(90) NULL DEFAULT '',
  `sexo` CHAR(1) NOT NULL,
  `email` VARCHAR(45) NULL,
  `salario` DECIMAL(10,2) NOT NULL,
  `Ambulatorios_id_ambulatorios` INT NOT NULL,
  `Ambulatorios_Hospitais_cnes` VARCHAR(7) NOT NULL,
  `Enderecos_id_endereco` INT NOT NULL,
  `Telefones_ddd` CHAR(2) NOT NULL,
  `Telefones_num_telefone` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_Pessoal_de_apoio_Ambulatorios1_idx` (`Ambulatorios_id_ambulatorios` ASC, `Ambulatorios_Hospitais_cnes` ASC) VISIBLE,
  INDEX `fk_Pessoal_de_apoio_Enderecos1_idx` (`Enderecos_id_endereco` ASC) VISIBLE,
  INDEX `fk_Pessoal_de_apoio_Telefones1_idx` (`Telefones_ddd` ASC, `Telefones_num_telefone` ASC) VISIBLE,
  CONSTRAINT `fk_Pessoal_de_apoio_Ambulatorios1`
    FOREIGN KEY (`Ambulatorios_id_ambulatorios` , `Ambulatorios_Hospitais_cnes`)
    REFERENCES `Saude_menos`.`Ambulatorios` (`id_ambulatorios` , `Hospitais_cnes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoal_de_apoio_Enderecos1`
    FOREIGN KEY (`Enderecos_id_endereco`)
    REFERENCES `Saude_menos`.`Enderecos` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoal_de_apoio_Telefones1`
    FOREIGN KEY (`Telefones_ddd` , `Telefones_num_telefone`)
    REFERENCES `Saude_menos`.`Telefones` (`ddd` , `num_telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Alterações nas tabelas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Alterar char(11) para char(8) no CEP de enderecos
-- -----------------------------------------------------
ALTER TABLE `Saude_menos`.`Enderecos`
	MODIFY COLUMN `cep` CHAR(8) NOT NULL;

-- -----------------------------------------------------
-- Alterar XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- -----------------------------------------------------    
ALTER TABLE `Saude_menos`.`Enderecos`
	ADD COLUMN `cidade` CHAR(45) NULL DEFAULT 'Recife'
		AFTER `bairro`;

-- -----------------------------------------------------
-- Alterar XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- -----------------------------------------------------  
ALTER TABLE `Saude_menos`.`Exames`
	MODIFY COLUMN `cod_exame` CHAR(8);

-- -----------------------------------------------------
-- Alterar XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- -----------------------------------------------------  
ALTER TABLE `Saude_menos`.`Consultas`
	MODIFY COLUMN `data_consulta` DATETIME;

-- -----------------------------------------------------
-- Alterar XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-- -----------------------------------------------------  
ALTER TABLE


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
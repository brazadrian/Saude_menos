# Saúde Menos - Banco de Dados

- [x] Defina uma equipe de no máximo 3 pessoas;
- [x] Escolha **um** dos mini-mundos abaixo e desenvolva o seu projeto;
- [x] Elabora os diagramas do mini-mundo (domínios de negócio) escolhido:
  - [x] Modelagens de entidade relacionamento (MER)
  - [x] Modelagem relacional (MR)
- [x] Crie um documento simples do seu projeto de Banco de Dados que:
  - [x] **Descreva em mais detalhes o seu mini-mundo;**
  - [x] Descreva o modelo lógico (Diagrama MER);
  - [x] Descreva o modelo físico (Diagrama MR);
  - [x] Descreva as perguntas/relatórios (20) importantes que deverão ser implementados pelo seu projeto.
- [x] Anexe a esse documento os Scripts abaixo de uma forma organizada e bem documentada.
  - [x] Crie um script que irá conter todos dos scripts de criação (DDL) das tabelas e views do seu banco de dados (Todos os CREATES TABLE...);
  - [x] Crie alguns scripts (no mínimo 5) para alterar (DDL) as estruturas das tabelas;
  - [x] Crie um script para destruir (DDL) todas as tabelas, views, **procedimentos**, funções e dependências do seu banco de dados;
  - [x] Crie um script que irá realizar todos os inserts (DML) nas tabelas do seu banco de dados.
  - [x] Cada tabela deve ter no mínimo 10 registros, use o bom senso;
  - [x] Crie scripts (no mínimo 20) para deletar ou atualizar (DML) os dados inseridos nas tabelas.
- [x] Crie um script que irá realizar todas as suas consultas/perguntas/relatórios (DQL), é obrigatório uso de join e subselect na maioria das consultas. Devem criar no mínimo 20 scripts de SELECT;
- [x] Crie um script para criar todas as views (DDL) (no mínimo 10) dos principais relatórios do seu projeto.
- [x] ~~Crie um script que irá executar as procedures e funções do seu banco de dados. Use o PLSQL, como colocado em sala de aula, e devem fazer no mínimo 10 procedures/funções;~~

## Descrição do Minimundo: Sistema de saúde

O sistema de saúde é composto por um ou vários **Hospitais,** estes formados por um ou mais **Ambulatórios** e cada um destes está em um único **Hospital.** Os **Hospitais** são identificados pelo CNES, e também possuem nome, CNPJ e endereço.

Os **Médicos** clinicam em um único **Hospital**, cada um deles agregando um ou vários **Médicos.** Os **Médicos** são identificados pelo CPF, e os demais dados cadastrados são: RQE, CRM, especialidade, nome, nome social, telefone, sexo, e-mail, salário e endereço.

Os **Hospitais** solicitam exames clínicos em nenhum ou vários **Laboratórios**, cada um destes pode ter solicitações de nenhum ou vários **Hospitais**. Cada **Laboratório** é identificado pelo seu CNES, e também possuem o id_laboratório.

Os **Pacientes** consultam nenhum ou vários **Médicos**, e estes **Médicos** são consultados por nenhum ou vários **Pacientes.** Cada **Paciente** possui dados cadastrados no sistema - número do prontuário, nome, nome social, telefone, e-mail, sexo, endereço - e são identificados pelo CPF.

Os **Médicos** podem atribuir nenhum ou vários **Diagnósticos**, e cada **Diagnóstico** é atribuído por um único **Médico**. Os **Diagnósticos** armazenam o CPF do paciente, nome da patologia, CID, e são identificados pelo id_diagnostico.

Os **Ambulatórios** atendem nenhum ou vários **Pacientes**, enquanto estes só podem ser atendidos em um único **Ambulatório** identificado pelo id_ambulatorio.

O **Pessoal** **de apoio** está alocado a cada **Ambulatório**, e cada um destes conta com nenhum ou vários integrantes do **Pessoal de apoio.** O identificador do **Pessoal de Apoio** é o PDF, e os demais dados armazenados são: matricula, nome, nome social, telefone, sexo, e-mail, salário e endereço.

Os **Laboratórios** fazem nenhum ou vários **Exames**, e cada um dos **Exames** é feito em um único **Laboratório** identificado pelo CNES.

O **Paciente** realiza nenhum ou vários **Exames**, e cada **Exame** é realizado por um único **Paciente.** Os **Exames** são identificados pelo CPF do paciente e o id_laboratório; os demais dados armazenados são: CNES do laboratório, data do exame, horário e sala.

Cada **Paciente** pode receber nenhum ou vários **Diagnósticos**, e cada Diagnóstico é de um único **Paciente**. Cada **Diagnóstico** é identificado pelo id_diagnostico e CPF do paciente; também são armazenados o nome da patologia e o CID.

# Modelo Conceitual



![Modelo conceitual do Saúde Menos](https://github.com/brazadrian/Saude_menos/blob/main/ME%20-%20Modelo%20Entidade%20(ou%20Conceitual)/Modelo%20Conceitual%20-%20Sa%C3%BAdeMenos.png?raw=true)

## Entidades/Atributos

- Hospitais: CNES(pk), nome, CNPJ, endereco(atributo composto);
- Ambulatórios: id_ambulatorio(pk), especialidade;
- Laboratórios: CNES(pk), id_Laboratorio;
- Paciente: CPF(pk), num_prontuario, nome, nomesocial, telefone, email, sexo, endereco(atributo composto);
- Exames: paciente_cpf(pk composta), id_exame(pk composta), laboratorio_cnes, grupo_exame, data, horário, sala;
- Médicos: CPF(pk), RQE, CRM, especialidade, nome, nomesocial, telefone, sexo, email, salario, endereco(atributo composto);
- Diagnósticos: id_diagnostico(pk composta), paciente_cpf(pk composta), nomePatologia, cid;
- Pessoal de apoio: CPF(pk), matricula, nome, nomesocial, telefone, sexo, email, salario, endereco(atributo composto).

### Considerações sobre as escolhas das chaves primárias

> **Hospitais e Laboratórios**
> Escolhemos o **CNES** (Cadastro Nacional de Estabelecimentos de Saúde) por conta da sua unicidade em território nacional e tendo em vista que alguns estabelecimentos não têm CNPJ ou mesmo são filiais de empresas, ou distribuições de serviços estatais, os quais muitas vezes não têm esse tipo de cadastro, mas todos são obrigados a serem inscritos no CNES.
> **Paciente**
> A princípio era o CPF, mas, posteriormente, considerando que podem existir pacientes que não tenham CPF, como recém-nascidos, escolhemos como PK o **numéro de prontuário
> Exames**
> Tendo uma chave composta entre seu CPF e o id_exame, possibilitando que o mesmo paciente realize vários Exames no laboratório
> **Diagnósticos**
> Tendo uma chave composta entre o CPF do paciente e o id_paciente, possibilitando que o mesmo paciente receba vários diagnósticos
## **Relacionamentos**

- consulta;
- clinicam;
- fazem;
- solicitam;
- realiza;
- recebe;
- atende;
- formado;
- alocado;
- atribui.

# Modelo Lógico

![Modelo lógico com entidades e relacionamentos do Saúde Menos](https://github.com/brazadrian/Saude_menos/blob/main/MER%20-%20Modelo%20Entidade%20Relacionamento/MER%20-%20Sa%C3%BAdeMenos.png?raw=true)

## Tabelas

> 12 tabelas
- Enderecos:
  - `id_endereco`, `cep`, `rua`, `complemento`, `numero`, `bairro`, `cidade` e `estado`
- Telefones:
  - `ddd, num_telefone`
- Hospitais:
  - `cnes`, `nome`, `cnpj`, `Enderecos_id_endereco`, `Telefones_ddd`, `Telefones_num_telefone`
- Ambulatorios:
  - `id_ambulatorios`, `especialidade`, `Hospitais_cnes`
- Laboratorios:
  - `cnes`, `id_laboratorio`, `nome`
- Solicitacoes:
  - `Hospitais_cnes`, `Laboratorios_cnes`, `id_solicitacao`, `data`
- Pacientes:
  - `num_prontuario`, `cpf`, `nome`, `nome_social`, `data_nascimento`, `email`, `sexo`, `Enderecos_id_endereco`, `Telefones_ddd`, `Telefones_num_telefone`
- Exames:
  - `id_exame`, `data_solicitacao`, `data_realizacao`, `grupo_exame`, `cod_exame`, `nome_exame`, `Laboratorios_cnes`, `Pacientes_num_prontuario`
- Medicos:
  - `cpf`, `crm`, `nome`, `nome_social`, `rqe`, `especialidade`, `sexo`, `email`, `salario`, `situacao`, `Enderecos_id_endereco`, `Telefones_ddd`, `Telefones_num_telefone`, `Hospitais_cnes`
- Diagnosticos:
  - `id_diagnostico`, `nome_patologia`, `cid_sigla`, `cid_cod`, `Medicos_cpf`, `Pacientes_num_prontuario`
- Consultas:
  - `data_consulta`, `data_agendada`, `Medicos_cpf`, `Pacientes_num_prontuario`
- Pessoal_de_apoio:
  - `cpf`, `matricula`, `nome`, `nome_social`, `sexo`, `email`, `salario`, `Ambulatorios_id_ambulatorios`, `Ambulatorios_Hospitais_cnes`, `Enderecos_id_endereco`, `Telefones_ddd`, `Telefones_num_telefone`

# Modelo Físico

## DDL - Data Definition Language

---

### Criando Banco de dados e tabelas - DDL

> Criação do Banco de Dados
```sql
CREATE SCHEMA IF NOT EXISTS `Saude_menos`;
USE `Saude_menos`;
```

> Criação da tabela Endereços
```sql
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
```

> Criação da tabela Telefones
```sql
-- -----------------------------------------------------
-- Table `Saude_menos`.`Telefones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saude_menos`.`Telefones` (
  `ddd` CHAR(2) NOT NULL,
  `num_telefone` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`ddd`, `num_telefone`))
ENGINE = InnoDB;
```

> Criação da tabela Hospitais
```sql
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
```

> Criação da tabela Ambulatórios
```sql
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
```

> Criação da tabela Laboratórios
```sql
-- -----------------------------------------------------
-- Table `Saude_menos`.`Laboratorios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saude_menos`.`Laboratorios` (
  `cnes` VARCHAR(7) NOT NULL,
  `id_laboratorio` INT NOT NULL,
  `nome` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`cnes`),
  UNIQUE INDEX `id_laboratorio_UNIQUE` (`id_laboratorio` ASC) VISIBLE)
ENGINE = InnoDB;-- -----------------------------------------------------
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
```

> Criação da tabela Solicitações
```sql
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
```

> Criação da tabela Pacientes
```sql
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
```

> Criação da tabela Exames
```sql
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
```

> Criação da tabela Médicos
```sql
-- -----------------------------------------------------
-- Table `Saude_menos`.`Médicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Saude_menos`.`Medicos` (
  `cpf` CHAR(11) NOT NULL,
  `crm` VARCHAR(8) NULL,
  `nome` VARCHAR(90) NOT NULL,
  `nome_social` VARCHAR(90) NULL DEFAULT '',
  `rqe` CHAR(4) NULL,
  `especialidade` VARCHAR(45) NULL,
  `sexo` CHAR(1) NOT NULL,
  `email` VARCHAR(45) NULL,
  `salario` DECIMAL(10,2) NULL,
  `situacao` BOOLEAN NOT NULL,
  `Enderecos_id_endereco` INT NOT NULL,
  `Telefones_ddd` CHAR(2) NOT NULL,
  `Telefones_num_telefone` VARCHAR(9) NOT NULL,
  `Hospitais_cnes` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`cpf`, `Hospitais_cnes`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_Medicos_Enderecos1_idx` (`Enderecos_id_endereco` ASC) VISIBLE,
  INDEX `fk_Medicos_Telefones1_idx` (`Telefones_ddd` ASC, `Telefones_num_telefone` ASC) VISIBLE,
  INDEX `fk_Medicos_Hospitais1_idx` (`Hospitais_cnes` ASC) VISIBLE,
  CONSTRAINT `fk_Medicos_Enderecos1`
    FOREIGN KEY (`Enderecos_id_endereco`)
    REFERENCES `Saude_menos`.`Enderecos` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medicos_Telefones1`
    FOREIGN KEY (`Telefones_ddd` , `Telefones_num_telefone`)
    REFERENCES `Saude_menos`.`Telefones` (`ddd` , `num_telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medicos_Hospitais1`
    FOREIGN KEY (`Hospitais_cnes`)
    REFERENCES `Saude_menos`.`Hospitais` (`cnes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
```

> Criação da tabela Diagnósticos
```sql
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
```

> Criação da tabela Consultas
```sql
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
```

> Criação da tabela Pessoal de Apoio
```sql
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
```

### Alteração das estruturas das tabelas - DDL

> Endereços: Alterar char(11) para **char(8)** no CEP de **enderecos**
```sql
-- -----------------------------------------------------
-- Alterar char(11) para char(8) no CEP de enderecos
-- -----------------------------------------------------
ALTER TABLE `Saude_menos`.`Enderecos`
	MODIFY COLUMN `cep` CHAR(8) NOT NULL;
```

> Endereços: Adicionar coluna **cidade** depois de **bairro**
```sql
-- -----------------------------------------------------
-- Adicionar coluna cidade depois de bairro
-- -----------------------------------------------------    
ALTER TABLE `Saude_menos`.`Enderecos`
	ADD COLUMN `cidade` CHAR(45) NULL DEFAULT 'Recife'
		AFTER `bairro`;
```

> Endereços: Adicionar coluna **complemento** depois **numero**
```sql
-- -----------------------------------------------------
-- Adicionar coluna complemento depois numero
-- -----------------------------------------------------  
ALTER TABLE `Saude_menos`.`Enderecos`
	ADD COLUMN `complemento` VARCHAR(30)
    AFTER `numero`;
```

> Exames: Modificar coluna **cod_exame** para **char(8)**
```sql
-- -----------------------------------------------------
-- Modificar coluna cod_exame para char(8)
-- -----------------------------------------------------  
ALTER TABLE `Saude_menos`.`Exames`
	MODIFY COLUMN `cod_exame` CHAR(8);
```

> Consultas: Modificar coluna **data_consulta** para **datetime**
```sql
-- -----------------------------------------------------
-- Modificar coluna data_consulta para datetime
-- -----------------------------------------------------  
ALTER TABLE `Saude_menos`.`Consultas`
	MODIFY COLUMN `data_consulta` DATETIME;
```

> Pacientes: Adicionar coluna **data_nascimento**  depois de nome_social
```sql
-- -----------------------------------------------------
-- Adicionar coluna data_nascimento  depois de nome_social
-- -----------------------------------------------------      
ALTER TABLE `Saude_menos`.`Pacientes`
	ADD COLUMN `data_nascimento` DATE AFTER `nome_social`;
```

> Exames: Modificar coluna **data_solicitacao**  para **datetime**
```sql
-- -----------------------------------------------------
-- Modificar a coluna data_solicitacao de exames para datetime
-- -----------------------------------------------------
ALTER TABLE `Saude_menos`.`Exames`
	MODIFY COLUMN `data_solicitacao` DATETIME;
```

### Destruindo todo o banco de dados - DDL

```sql
TRUNCATE TABLE `Saude_menos`.`Pessoal_de_apoio`;
TRUNCATE TABLE `Saude_menos`.`Consultas`;
TRUNCATE TABLE `Saude_menos`.`Diagnosticos`;
TRUNCATE TABLE `Saude_menos`.`Exames`;
TRUNCATE TABLE `Saude_menos`.`Solicitacoes`;
DROP TABLE 'Saude_menos'.'Pessoal_de_apoio';
DROP TABLE 'Saude_menos'.'Consultas';
DROP TABLE 'Saude_menos'.'Diagnosticos';
DROP TABLE 'Saude_menos'.'Medicos';
DROP TABLE 'Saude_menos'.'Exames';
DROP TABLE 'Saude_menos'.'Pacientes';
DROP TABLE 'Saude_menos'.'Solicitacoes';
DROP TABLE 'Saude_menos'.'Laboratorios';
DROP TABLE 'Saude_menos'.'Ambulatorios';
DROP TABLE 'Saude_menos'.'Hospitais';
DROP TABLE 'Saude_menos'.'Telefones';
DROP TABLE 'Saude_menos'.'Enderecos';
DROP VIEW ConsultasPandemia;
DROP VIEW QuantidadeConsultas;
DROP VIEW QuantidadeAtendimento;
DROP VIEW SolicitacoespDia;
DROP VIEW MedicospEspecialidade;
DROP VIEW PacientesQuarentaMais;
DROP VIEW TelefonesPacientes;
DROP VIEW ConsultapDia;
DROP VIEW edrHsp;
DROP VIEW edrPac;
DROP DATABASE Saude_menos;
```

### Views - DDL

> Lista com os **hospitais** e seus respectivos endereços
```sql
CREATE VIEW edrHsp AS
SELECT edr.cep "CEP", edr.bairro "Bairro", edr.cidade "Cidade", edr.estado "UF", hsp.nome "Hospital", hsp.cnes "CNES"
FROM Enderecos AS edr
RIGHT JOIN Hospitais AS hsp
	ON hsp.Enderecos_id_endereco = edr.id_endereco;
```

> Lista com os **pacientes** e seus respectivos endereços
```sql
CREATE VIEW edrPac AS
SELECT edr.cep "CEP", edr.bairro "Bairro", edr.cidade "Cidade", edr.estado "UF", pac.nome "Nome", pac.cpf "CPF"
FROM Enderecos AS edr
RIGHT JOIN Pacientes AS pac
	ON pac.Enderecos_id_endereco = edr.id_endereco;
```

- As duas tabelas acima foram utilizadas na consulta nº 9 ([pacientes que moram no mesmo bairro que o hospital](https://www.notion.so/Sa-de-Menos-Banco-de-Dados-5ea69850d65e4f71bf7f5e5a9cc868cf))

> Lista das consultas realizadas entre Janeiro de 2020 e Outubro de 2022
> trazendo as Datas das consultas, Prontuário do paciente, CPF, Nome e Sexo do Paciente
> por ordem decrescentee
```sql
CREATE VIEW ConsultasPandemia AS
SELECT p.nome "Nome", p.cpf "CPF", p.num_prontuario "Nº Prontuário", p.sexo "Sexo", c.data_consulta "Data da Consulta"
	FROM Pacientes p
	INNER JOIN Consultas c ON p.num_prontuario =      c.Pacientes_num_prontuario
	WHERE c.data_consulta BETWEEN '2020-01-01 00:01' AND '2022-10-12'
		ORDER BY c.data_consulta DESC;
```

> Listar nome de pacientes e a quantidade de consultas realizadas por eles
> trazendo as colunas num_prontuario, cpf, nome, sexo
> ordenado pelo nome.
```sql
CREATE VIEW QuantidadeConsultas AS
SELECT pac.num_prontuario "Nº Prontuário", pac.cpf "CPF", pac.nome "Nome", pac.sexo "Sexo", cst.data_consulta "Consulta", COUNT(cst.Pacientes_num_prontuario)
FROM Consultas AS cst
	INNER JOIN Pacientes AS pac
	ON pac.num_prontuario = cst.Pacientes_num_prontuario
WHERE cst.data_consulta IS NOT NULL
GROUP BY cst.Pacientes_num_prontuario, pac.num_prontuario, pac.cpf, pac.nome, pac.sexo, cst.data_consulta
ORDER BY pac.nome;
```

> Listar os medicos, juntamente com os hospitais que trabalham e a quantidade de pacientes atendidos
> trazer as colunas nome (médico), nome (hospital)
> ordene por Hospital.
```sql
CREATE VIEW QuantidadeAtendimento AS
SELECT m.nome AS medico_nome, h.nome AS hospital_nome, COUNT(c.Pacientes_num_prontuario) AS qtdProntuarios
FROM Hospitais AS h
	INNER JOIN Medicos AS m
	ON h.cnes = m.Hospitais_cnes
	INNER JOIN Consultas AS c
	ON m.cpf = c.Medicos_cpf
GROUP BY c.Pacientes_num_prontuario, m.nome, h.nome
ORDER BY COUNT(c.Pacientes_num_prontuario);
```

> Conte a quantidade de solicitações realizadas por dia
> trazendo as colunas data (solicitação), nome do hospital e nome laboratório
> ordene por hospital.
```sql
CREATE VIEW SolicitacoespDia AS
SELECT COUNT(s.id_solicitacao) AS qtdSolicitacao, h.nome AS hospital_nome, l.nome AS laboratorio_nome
FROM Solicitacoes AS s
	INNER JOIN Hospitais AS h
	ON s.Hospitais_cnes = h.cnes
	INNER JOIN Laboratorios AS l
	ON s.Laboratorios_cnes = l.cnes
GROUP BY h.nome, l.nome
ORDER BY h.nome;
```

> Listar as especialidades contabilizando o número total de médicos por especialidade do hospital “xxxx”
> trazendo as colunas total de médicos e especialidade.
```sql
CREATE VIEW MedicospEspecialidade AS
SELECT COUNT(m.especialidade) AS medicos_especialistas, h.nome AS hospital_nome
FROM Medicos AS m
	INNER JOIN Hospitais AS h
	ON m.Hospitais_cnes = h.cnes
GROUP BY h.cnes
ORDER BY h.cnes;
```

> Listar nome, número de prontuario e data de nascimento de pacientes que nasceram entre 1940 1980.
```sql
CREATE VIEW PacientesQuarentaMais AS
SELECT nome, data_nascimento, num_prontuario
FROM Pacientes
WHERE data_nascimento BETWEEN '1940-01-01' AND '1980-01-01'
ORDER BY data_nascimento;
```

> Lista dos telefones dos pacientes, trazendo as colunas (número telefone, nome paciente), ordenado por nome paciente.
```sql
CREATE VIEW TelefonesPacientes AS
SELECT pac.nome 'Paciente', pac.Telefones_num_telefone 'Telefone'
FROM Telefones AS tel
	INNER JOIN Pacientes AS pac ON pac.Telefones_ddd = tel.ddd AND pac.Telefones_num_telefone = tel.num_telefone
ORDER BY pac.nome;
```

> Lista com os hospitais e seus respectivos endereços
```sql
CREATE VIEW edrHsp AS
SELECT edr.cep "CEP", edr.bairro "Bairro", edr.cidade "Cidade", edr.estado "UF", hsp.nome "Hospital", hsp.cnes "CNES"
FROM Enderecos AS edr
RIGHT JOIN Hospitais AS hsp
	ON hsp.Enderecos_id_endereco = edr.id_endereco;
```

> Lista com os pacientes e seus respectivos endereços
```sql
CREATE VIEW edrPac AS
SELECT edr.cep "CEP", edr.bairro "Bairro", edr.cidade "Cidade", edr.estado "UF", pac.nome "Nome", pac.cpf "CPF"
FROM Enderecos AS edr
RIGHT JOIN Pacientes AS pac
	ON pac.Enderecos_id_endereco = edr.id_endereco;
```

## DML - Data Manipulation Language

---

### Inserindo dados - DML

> Inserindo dados na tabela Endereços
```sql
-- -----------------------------------------------------
-- Inserindo dados na tabela Endereços
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Enderecos`
(`id_endereco`, `cep`, `rua`, `numero`, `bairro`) 
VALUES
(1, "26489116", "Rua Dona Dalva", 49, "Nova Descoberta"), 
(2, "26489416", "Rua Tamarindo", 70, "Iputinga"),
(3, "56289176", "Rua Gatinho", 341, "Boa Vista"),
(4, "98643586", "Rua da Cadeia Velha", 54, "Bairro do Recife"),
(5, "14256486", "Rua do Aragão", 65, "Boa Vista"),
(6, "50030170", "Rua  do Bom Jesus", 10, "Recife"),
(7, "23654321", "Rua do Crespo", 89, "Santo Antônio"),
(8, "98547623", "Rua do Imperador", 13, "Santo Antônio"), 
(9, "50936274", "Rua da Hora", 52, "Espinheiro"),
(10, "50043876", "Rua do Fogo", 14, "Santo Antônio"),
(11, "98345265", "Rua das Flores", 44, "Santo Antônio"),
(12, "98345265", "Rua Ministro Gilberto Gil", 172, "Iputinga"),
(13, "26489116", "Rua Dona Dalva", 2, "Nova Descoberta"), 
(14, "26489416", "Rua Tamarindo", 71, "Iputinga"),
(15, "56289176", "Rua Gatinho", 30, "Boa Vista"),
(16, "98643586", "Rua da Cadeia Velha", 20, "Recife"),
(17, "14256486", "Rua do Aragão", 56, "Boa Vista"),
(18, "50030170", "Rua  do Bom Jesus", 23, "Recife"),
(19, "23654321", "Rua do Crespo", 19, "Santo Antônio"),
(20, "98547623", "Rua do Imperador", 32, "Santo Antônio"), 
(21, "50936274", "Rua da Hora", 45, "Espinheiro"),
(22, "50043876", "Rua do Fogo", 13, "Santo Antônio"),
(23, "98345265", "Rua das Flores", 13, "Santo Antônio"),
(24, "98345265", "Rua Ministro Gilberto Gil", 13, "Iputinga"),
(25, "50043876", "Rua do Fogo", 35, "Santo Antônio"),
(26, "98345265", "Rua das Flores", 65, "Santo Antônio"),
(27, "98345265", "Rua Ministro Gilberto Gil", 2, "Iputinga"),
(28, "26489116", "Rua Dona Dalva", 23, "Nova Descoberta"), 
(29, "26489416", "Rua Tamarindo", 18, "Iputinga"),
(30, "56289176", "Rua Gatinho", 13, "Boa Vista"),
(31, "98643586", "Rua da Cadeia Velha", 27, "Recife"),
(32, "14256486", "Rua do Aragão", 13, "Boa Vista"),
(33, "50030170", "Rua  do Bom Jesus", 31, "Recife"),
(34, "23654321", "Rua do Crespo", 123, "Santo Antônio"),
(35, "98547623", "Rua do Imperador", 157, "Santo Antônio"), 
(36, "50936274", "Rua da Hora", 171, "Espinheiro"),
(37, "50043876", "Rua do Fogo", 192, "Santo Antônio"),
(38, "98345265", "Rua das Flores", 129, "Santo Antônio"),
(39, "98345265", "Rua Ministro Gilberto Gil", 1377, "Iputinga"),
(40, "50000000", "Rua Robeyoncé Lima", 5000, "Santo Amaro"),
(41, "88911372", "Rua Caetano da Silva", 44, "Morro dos Conventos"),
(42, "89564280", "Rua Lindóia", 12, "Sesi"),
(43, "64046455", "Avenida Governador Gayoso e Almendra", 10, "São João"),
(44, "58400074", "Rua Bartolomeu de Gusmão", 77, "Centro"),
(45, "81590603", "Rua Edson Luiz Dill", 17, "Uberaba"),
(46, "49503135", "Rua Manoel Messias dos Santos", 45, "Serrano"),
(47, "57044050", "Rua Capitão Correia", 130, "São Jorge"),
(48, "68908112", "Avenida Padre José de Anchieta", 27, "Jesus de Nazaré"),
(49, "64745265", "Rua Jutaí", 14, "Floresta Sul"),
(50, "79083410", "Rua dos Mascates", 65, "Jardim Aero Rancho"),
(51, "52131320", "Rua Vermelho e Amarelo", 13, "Foice e Martelo");
```

> Inserindo dados na tabela Telefones
```sql
-- -----------------------------------------------------
-- Inserindo dados na tabela Telefones
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Telefones` 
(`ddd`, `num_telefone`) 
values (81, 982341235),
(51, 981567843),
(44, 983524172),
(81, 981452634),
(75, 987345231),
(51, 986543421),
(35, 984762897),
(77, 986453731),
(81, 986356212),
(21, 987463732),
(61, 992621825),
(61, 982664821),
(51, 994317278),
(73, 991579762),
(83, 968710433),
(68, 989137456),
(64, 996374671),
(81, 981567843),
(81, 983524172),
(81, 987345231),
(81, 986543421),
(81, 984762897),
(81, 986453731),
(81, 987463732),
(81, 992621825),
(81, 982664821),
(81, 994317278),
(81, 991579762),
(81, 968710433),
(81, 989137456),
(81, 996374671),
(62, 986545130),
(75, 985452624),
(12, 967787966),
(97, 979655752),
(42, 975348420),
(85, 995228431),
(79, 971414208),
(69, 981230964),
(84, 979156703),
(83, 971867561);
```

> Inserindo dados na tabela Hospitais
```sql
-- -----------------------------------------------------
-- Inserindo dados na tabela Hospitais
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Hospitais`
(`cnes`, `nome`, `cnpj`, `Enderecos_id_endereco`, `Telefones_ddd`, `Telefones_num_telefone`) 
values (7648913, "Hospital Henrique Biruta", 46891567348926, 1, 81, 982341235 ),
(7623463, "Hospital Erika Vilas Ruins", 46291367308926, 2, 51, 981567843),
(7828463, "Hospital Gilmarzito", 46291362048626, 3, 44, 983524172),
(9623463, "Hospital Pereira Ramos", 20576367308916, 4, 81, 981452634),
(4389135, "Hospital Oswaldo Cruz", 93765409572632, 5, 75, 987345231),
(5647384, "Hospital do Tamboatá", NULL, 6, 51, 986543421);
```

> Inserindo dados na tabela Ambulatórios
```sql
-- -----------------------------------------------------
-- Inserindo dados na tabela Ambulatórios
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Ambulatorios`
(`id_ambulatorios`, `especialidade`, `Hospitais_cnes`)
values (1, "Cardiologia", "7648913"),
(2, "Dermatologia", "7623463"),
(3, "Neurologia", "7828463"),
(4, "Radioterapia", "9623463"),
(5, "Oftalmologia", "9623463"),
(6, "Pediatria", "4389135"),
(7, "Geriatria", "7828463"),
(8, "Ginecologia", "7623463"),
(9, "Psiquiatria", "7648913"),
(10, "Endoscopia", "4389135");
```

> Inserindo dados na tabela Laboratórios
```sql
-- -----------------------------------------------------
-- Inserindo dados na tabela Laboratórios
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Laboratorios`
(`cnes`, `id_laboratorio`, `nome`)
values (8435671, 1, "Glyson Cidrim"),
(5241761, 2, "Cerpe"),
(2534123, 3, "Louis Pasteur"),
(1012431, 4, "Adolfo Lutz"),
(9132652, 5, "DiagMax"),
(8241532, 6, "Edmar Victor"),
(2341278, 7, "José Rocha"),
(3849448, 8, "Real Lab"),
(9898752, 9, "Fleury"),
(2652181, 10, "Promix");
```

> Inserindo dados na tabela Solicitações
```sql
-- -----------------------------------------------------
-- Inserindo dados na tabela Solicitações
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Solicitacoes` (`Hospitais_cnes`, `Laboratorios_cnes`, `id_solicitacao`, `data`)
VALUES 
('7648913', '8435671', 1, '2022-09-07 13:45:00'), 
('7648913', '1012431', 2, '2022-09-12 12:43:00'), 
('4389135', '1012431', 3, '2022-09-13 10:43:00'), 
('4389135', '8435671', 4, '2022-09-20 10:45:00'), 
('4389135', '3849448', 5, '2022-09-21 10:33:00'), 
('4389135', '9898752', 6, '2022-09-25 12:43:00'), 
('4389135', '5241761', 7, '2022-09-25 13:27:00'), 
('5647384', '3849448', 8, '2022-09-28 13:30:00'), 
('7623463', '9898752', 9, '2022-09-29 12:40:00'), 
('7623463', '2652181', 10, '2022-09-30 17:30:00'), 
('7648913', '2652181', 11, '2022-10-01 09:10:00'), 
('5647384', '2534123', 12, '2022-10-02 08:30:00'), 
('4389135', '1012431', 13, '2022-10-03 10:27:00'), 
('7623463', '2652181', 14, '2022-10-03 10:30:00'), 
('7648913', '2652181', 15, '2022-10-04 09:50:00'), 
('7648913', '2534123', 16, '2022-10-05 14:10:40'), 
('5647384', '9132652', 17, '2022-10-05 15:30:00'), 
('7648913', '1012431', 18, '2022-10-06 08:47:00'), 
('7828463', '9132652', 19, '2022-10-07 09:50:00'), 
('7623463', '9132652', 20, '2022-10-08 10:35:00'), 
('7828463', '1012431', 21, '2022-10-08 15:35:00'), 
('7828463', '9132652', 22, '2022-10-09 17:35:00'), 
('9623463', '2341278', 23, '2022-10-10 16:35:00'), 
('5647384', '5241761', 24, '2022-10-11 16:50:00'), 
('4389135', '2341278', 25, '2022-10-11 17:35:00');
```

> Inserindo dados na tabela Pacientes
```sql
-- -----------------------------------------------------
-- Inserindo dados na tabela Pacientes
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Pacientes` 
(`num_prontuario`, `cpf`, `nome`, `nome_social`, `data_nascimento`, `email`, `sexo`, `Enderecos_id_endereco`, `Telefones_ddd`, `Telefones_num_telefone`) 
VALUES 
(1, '31246579812', 'Jhonas Carmanin Neto', 'Palmira Magalhães Barthon', '1984-09-01', NULL, 'F', 17, '35', '984762897'),
(2, '87946513232', 'Rinaldo Mota Arlia', 'Giselle Marcello Nespoli', '2003-05-01', NULL, 'F', 18, '77', '986453731'),
(5, '54665879789', 'Raimundo Nathan Ramos', 'Raquel Arruda Mendes', '1999-09-07', NULL, 'F', 19, '81', '986356212'),
(6, '87956423154', 'Neli Vogas Grilo', NULL, '1989-08-08', NULL, 'F', 20, '21', '987463732'),
(7, '87954631259', 'Cassio Azevedo Duarte',  NULL, '1999-09-07', NULL, 'M', 20, '21', '987463732'),
(8, '49842698976', 'Fabiano Stutz Amorim', NULL, '1998-10-18', NULL, 'M', 20, '21', '987463732'),
(9, '85976426887', 'Tiago Peçanha de Arruda', NULL, '2002-10-04', NULL, 'M', 21, '61', '992621825'),
(10, '23546887954', 'Kaique Negris Giron', NULL, '2002-04-12', NULL, 'M', 21, '61', '992621825'),
(11, '41258458468', 'Ana Peçanha Mayerhofer', NULL, '2001-12-04', NULL, 'F', 22, '61', '982664821'),
(12, '56421365789', 'Ledir Xavier Chaves', NULL, '2000-12-08', NULL, 'M', 22, '61', '982664821'),
(13, '55646898795', 'Fellipe Gabrig Silva', NULL, '2002-12-08', NULL, 'M', 23, '51', '994317278'),
(14, '91327847813', 'Herisomar Felizardo Melo', NULL, '1975-11-04', NULL, 'M', 23, '51', '994317278'),
(15, '32453455656', 'Thainá Darmont Portugal', NULL, '1984-12-24', NULL, 'M', 24, '73', '991579762'),
(16, '09876543454', 'Giselle Muniz Teixeira', NULL, '1985-10-12', NULL, 'M', 24, '73', '991579762'),
(17, '09230981324', 'Manuel Batista Barthon', NULL, '1975-05-13', NULL, 'M', 25, '83', '968710433'),
(18, '12903843878', 'Isabelle Mariane Emanuelly Silveira', NULL, '1977-04-25', NULL, 'M', 25, '83', '968710433'),
(19, '12387194639', 'Cristiano Rosa Oliveira', NULL, '1978-05-22', NULL, 'M', 25, '83', '968710433'),
(20, '09812889127', 'Lucas de Lima Leite', NULL, '1983-03-22', NULL, 'M', 26, '68', '989137456'),
(21, '90132898347', 'Jovenil Carminatti Siqueira', NULL, '1940-08-23', NULL, 'M', 27, '64', '996374671'),
(22, '08398344393', 'Estephany de Arruda Carino', NULL, '2000-01-01', NULL, 'M', 27, '64', '996374671'),
(23, '90832973243', 'Georgiane Souza Borralho', NULL, '2020-03-04', NULL, 'M', 28, '81', '981567843'),
(24, '09183182223', 'Jorge Furtado de Souza', NULL, '1995-04-03', NULL, 'M', 29, '81', '983524172'),
(25, '09289698798', 'Raimundo Valle Teixeira', NULL, '1964-06-04', NULL, 'M', 30, '81', '987345231'),
(3, '56487975487', 'Kamilly Maria Fernandes', NULL, '1975-08-04', NULL, 'M', 18, '77', '986453731'),
(4, '64994984168', 'Amanda Jéssica Moreira', NULL, '1988-09-04', NULL, 'M', 19, '81', '986356212');
```

> Inserindo dados na tabela Exames
```sql
-- -----------------------------------------------------
-- Inserindo dados na tabela Exames
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Exames`
(`id_exame`, `data_solicitacao`, `data_realizacao`, `grupo_exame`, `cod_exame`, `nome_exame`, `Laboratorios_cnes`, `Pacientes_num_prontuario`)
VALUES 
(1, '2022-02-12 14:22:00', '2022-05-12 14:00:00', 'A', '2345678', 'Endoscopia', 5241761, 1),
(2, '2022-10-03 14:22:00', '2022-10-09 10:00:00', 'A', 8654321, 'Radioterapia', 8435671, 2), 
(3, '2022-01-11 10:22:00', '2022-03-04 14:00:00', 'B', 8765431, 'Ginecologia', 2534123, 3), 
(4, '2022-02-10 11:22:00', '2022-02-20 16:00:00', 'B', 8765431, 'Ginecologia', 1012431, 2), 
(5, '2022-02-12 15:22:00', '2022-04-02 11:00:00', 'B', 8764321, 'Dermatologia', 9132652, 3), 
(6, '2022-03-28 09:22:00', '2022-05-10 10:00:00', 'B', 8754321, 'Oftalmologia', 8241532, 4), 
(7, '2022-01-29 08:20:00', '2022-03-05 08:00:00', 'D', 8764321, 'Dermatologia', 2341278, 5), 
(8, '2022-09-10 17:22:00', '2022-10-01 11:00:00', 'A', 8654321, 'Radioterapia', 3849448, 6), 
(9, '2022-08-17 07:22:00', '2022-09-03 15:00:00', 'A', 2345678, 'Endoscopia', 9898752, 7), 
(10, '2022-04-18 16:32:00', '2022-07-03 07:00:00', 'A', 8765431, 'Ginecologia', 2652181, 8);
```

> Inserindo dados na tabela Médicos
```sql
-- -----------------------------------------------------
-- Inserindo dados na tabela Médicos
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Medicos` 
(`cpf`, `crm`, `nome`, `nome_social`, `rqe`, `especialidade`, `sexo`, `email`, `salario`, `situacao`, `Enderecos_id_endereco`, `Telefones_ddd`, `Telefones_num_telefone`, `Hospitais_cnes`) 
VALUES
('46041385409', '1122PE', 'Rosinalda Quintanilha de Lima', NULL, '1555', 'Dermatologista', 'F', 'rosinalda.lima@hop.com', 5675.00, true, 41, '62', '986545130', '7648913'),
('62566822549', '4576PE', 'Margareth Portugal da Conceição', NULL, '3227', 'Psiquiatra', 'F', 'margareth.conceicao@gmail.com', '7500.00', false, 42, '83', '971867561', 7648913),
('65485147852', '6766BA', 'Pablo Carminatti Andrade', NULL, 'NULL', 'Residente', 'M', 'pablo.andrade@hoc.com', '2550', true, 43, '75', '985452624', 7623463), 
('25752804272', '2322PE', 'Maria Alice Albuquerque Anjos', NULL, '5465', 'Oftalmologista', 'F', 'maria.anjos@sus.com', '3550', true, 44, '12', '967787966', 7828463), 
('61353868915', '4501PE', 'Thainá Salomão Sarmanto', NULL, '7898', 'Geriatra', 'F', 'thaina.sarmato@sus.com', '8000', true, 45, '42', '975348420', 4389135), 
('78433203347', '3311PE', 'Arthur Louzano Robadey', NULL, '3245', 'Cardiologista', 'M', 'arthur.robadey@sus.com', '8900', true, 46, '85', '995228431', 5647384), 
('18275217598', '5454BA', 'Luana Reis Muniz', NULL, '9897', 'Ginecologista', 'F', 'luana.muniz@sus.com', '9500', true, 47, '79', '971414208', 7648913), 
('17756873254', '2188PB', 'Rosali Prucho Heizelmann', NULL, '9897', 'Ginecologista', 'F', 'rosali.heizelmann@sus.com', '8500', true, 48, '69', '981230964', 7623463), 
('43984534400', '2770RJ', 'Sergio Gomes Alentejo', NULL, '1003', 'Clínico Geral', 'M', 'sergio.alentejo@sus.com', '5600', true, 49, '84', '979156703', 7828463),
('60882111485', '3110PE', 'Otavio Garcia', NULL, '1003', 'Clínico Geral', 'M', 'otavio.garcia@sus.com', 5505, true, 50, '81', '987463732', 7828463);-- -----------------------------------------------------
-- Inserindo dados na tabela Diagnósticos
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Diagnosticos`
(`id_diagnostico`, `nome_patologia`, `cid_sigla`, `cid_cod`, `Medicos_cpf`, `Pacientes_num_prontuario`)
VALUES
(1, "Hipertensão", "A", 10, 65485147852, 1),
(2, "Melasma", "A", 11, 62566822549, 4),
(3, "Candidíase", "B", 12, 18275217598, 3),
(4, "Candidíase", "B", 13, 18275217598, 22),
(5, "Conjuntivite", "C", 14, 25752804272, 2),
(6, "Glaucoma", "D", 15, 25752804272, 6),
(7, "Candidíase", "D", 16, 17756873254, 8),
(8, "Catarata", "D", 17, 25752804272, 4),
(9, "Hipertensão", "A", 18, 60882111485, 7),
(10, "Melasma", "B", 19, 43984534400, 22);
```

> Inserindo dados na tabela Diagnósticos
```sql
-- -----------------------------------------------------
-- Inserindo dados na tabela Diagnósticos
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Diagnosticos`
(`id_diagnostico`, `nome_patologia`, `cid_sigla`, `cid_cod`, `Medicos_cpf`, `Pacientes_num_prontuario`)
VALUES
(1, "Hipertensão", "A", 10, 65485147852, 1),
(2, "Melasma", "A", 11, 62566822549, 4),
(3, "Candidíase", "B", 12, 18275217598, 3),
(4, "Candidíase", "B", 13, 18275217598, 22),
(5, "Conjuntivite", "C", 14, 25752804272, 2),
(6, "Glaucoma", "D", 15, 25752804272, 6),
(7, "Candidíase", "D", 16, 17756873254, 8),
(8, "Catarata", "D", 17, 25752804272, 4),
(9, "Hipertensão", "A", 18, 60882111485, 7),
(10, "Melasma", "B", 19, 43984534400, 22);
```

> Inserindo dados na tabela Consultas
```sql
-- -----------------------------------------------------
-- Inserindo dados na tabela Consultas
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Consultas`
(`data_consulta`, `data_agendada`, `Medicos_cpf`, `Pacientes_num_prontuario`)
VALUES
(NULL, '2020-10-08 16:50:00','65485147852', 3),
('2020-09-29 11:43:00', '2020-10-08 09:45:00','25752804272', 4),
('2020-08-02 16:50:00', '2020-11-08 11:15:00','78433203347', 6),
('2020-11-01 07:34:00', '2020-11-08 16:40:00','43984534400', 9),
('2020-10-18 11:22:00', '2020-11-08 14:45:00','62566822549', 2),
(NULL, '2020-10-08 14:35:00','18275217598', 7),
(NULL, '2020-12-08 15:40:00','17756873254', 8),
(NULL, '2020-12-08 10:25:00','61353868915', 5),
(NULL, '2020-12-08 15:50:00','46041385409', 1),
(NULL, '2020-10-08 17:10:00','60882111485', 10),
('2020-10-29 11:00:00', '2020-10-29 10:50:00','78433203347', 4),
('2022-03-20 15:20:00', '2022-03-20 14:45:00','43984534400', 4),
('2022-03-25 15:36:00', '2022-05-20 15:00:00','17756873254', 10),
('2022-03-23 10:36:00', '2022-05-23 08:00:00','17756873254', 8),
('2022-06-23 09:36:00', '2022-06-23 08:00:00','62566822549', 8);
```

> Inserindo dados na tabela Pessoal de Apoio
```sql
-- -----------------------------------------------------
-- Inserindo dados na tabela Pessoal_de_apoio
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Pessoal_de_apoio`
(`cpf`, `matricula`, `nome`, `nome_social`, `sexo`, `email`, `salario`, `Ambulatorios_id_ambulatorios`, `Ambulatorios_Hospitais_cnes`, `Enderecos_id_endereco`, `Telefones_ddd`, `Telefones_num_telefone`)
VALUES
(32015787451, 1, "Eduardo Barros", NULL, 'M', "eduardopintobarros@rhyta.com", 1800.00, 1, 7648913, 31, 12, 967787966),
(17019437559, 2, "Eduarda Correia",  NULL, 'F', "eduardaoliveiracorreia@dayrep.com", 1800.00, 2, 7623463, 32, 81, 981567843),
(22015287453, 3, "Sarah Alves",  NULL, 'F', "sarahferreiraalves@fleckens.hu", 1800.00, 3, 7828463, 33, 81, 982341235),
(08015427457, 4, "Willian Robinson",  NULL, 'M', "williecrobinson@dayrep.com", 1800.00, 4, 9623463, 34, 81, 982664821),
(03012325451, 5, "Kauan Gomes",  NULL, 'M', "kauancastrogomes@einrot.com", 1800.00, 5, 9623463, 35, 81, 983524172),
(07518848454, 6, "Kenneth Jamison",  NULL, 'M', "kennethtjamison@teleworm.us", 1800.00, 6, 4389135, 36, 81, 984762897),
(13098423412, 7, "Jason Jacobson",  NULL, 'M', "jasoncjacobson@jourrapide.com", 1800.00, 7, 7828463, 37, 81, 986356212),
(06315924413, 8, "Gabrielle Barbosa",  NULL, 'F', "gabriellefernandesbarbosa@dayrep.com", 1800.00, 8, 7623463, 38, 81, 983524172),
(18009420450, 9, "Dolores Payne",  NULL, 'F', "doloresdpayne@rhyta.com", 1800.00, 9, 7648913, 39, 81, 984762897),
(12000422455, 10, "James Bravo",  NULL, 'M', "jamesbbravo@jourrapide.com", 1800.00, 10, 4389135, 40, 81, 986356212);
```

### Deletando dados nas tabelas - DML

```sql
DELETE FROM `Saude_menos`.`Medicos` WHERE `cpf` = `62566822549`;
DELETE FROM `Saude_menos`.`Medicos` WHERE `cpf` = `460.413.854-09`;
```

### Atualizando dados nas tabelas - DML

```sql
-- -----------------------------------------------------
-- Atualizando dados nas tabelas
-- -----------------------------------------------------
UPDATE `Saude_menos`.`Pacientes`
SET `nome` = 'Gabriela Da Silva Sauro', `email` = 'gabidugerah@gmail.com'
WHERE num_prontuario = 1;
UPDATE `Saude_menos`.`Enderecos`
SET `cep` = "26489116"
WHERE `id_endereco` = '17';
UPDATE `Saude_menos`.`Exames`
SET `data_realizacao` = '2022-10-12 17:05:47'
WHERE `id_exame` = 1;
UPDATE `Saude_menos`.`Exames`
SET `data_realizacao` = '2022-10-03 12:25:17'
WHERE `id_exame` = 2;
UPDATE `Saude_menos`.`Pessoal_de_apoio`
SET `nome_social` = 'Silvio Da Santos Sauro'
WHERE `cpf` = '32015787451';
UPDATE `Saude_menos`.`Pessoal_de_apoio`
SET `Telefones_ddd` = '81', `Telefones_num_telefone` =  '988563267'
WHERE `cpf` = '17019437559';
UPDATE `Saude_menos`.`Pessoal_de_apoio`
SET `email` = 'robertinho123@hotmail.com'
WHERE `cpf` = '22015287453';
UPDATE `Saude_menos`.`Pacientes`
SET `nome_social` = 'Joana Antônia Ferreira'
WHERE `cpf` = '41258458468';
UPDATE `Saude_menos`.`Pacientes`
SET `nome` = 'Gabriel Da Silva Sauro', `sexo` = 'M'
WHERE `cpf` = '87956423154';
UPDATE `Saude_menos`.`Medicos`
SET `email` = 'drjuni0rt@yahoo.com'
WHERE `cpf` = '65485147852';
UPDATE `Saude_menos`.`Medicos`
SET `email` = 'draangela34@yahoo.com'
WHERE `cpf` = '25752804272';
UPDATE `Saude_menos`.`Pessoal_de_apoio`
SET `nome` = 'Joana Meneses Santos', `sexo` = 'F'
WHERE `cpf` = '87954631259';
UPDATE `Saude_menos`.`Solicitacoes`
SET `data` = '2022-09-07 16:25:17'
WHERE `id_solicitacao` = 1;
UPDATE `Saude_menos`.`Solicitacoes`
SET `Laboratorios_cnes` = '8435671'
WHERE `id_solicitacao` = 1;
UPDATE `Saude_menos`.`Consultas`
SET `Medicos_cpf` = '46041385409'
WHERE `Pacientes_num_prontuario` = '3';
```

## DQL - Data Query Language

---

### Consultas

> Consultas realizadas entre Janeiro de 2020 e Outubro de 2022
```sql
/*
1 (PRIMEIRA) CONSULTA
Listar as consultas realizadas entre Janeiro de 2020 e Outubro de 2022
trazendo as Datas das consultas, Prontuário do paciente, CPF, Nome e Sexo do Paciente
por ordem alfabética
*/
SELECT pac.nome "Nome", pac.cpf "CPF", pac.num_prontuario "Nº Prontuário", pac.sexo "Sexo", cst.data_consulta "Data da Consulta"
	FROM Pacientes as pac
	INNER JOIN Consultas AS cst ON pac.num_prontuario = cst.Pacientes_num_prontuario
	WHERE cst.data_consulta BETWEEN '2020-01-01 00:01' AND '2022-10-12'
		ORDER BY cst.data_consulta DESC;
```

> Listar médicos que têm PE no CRM
```sql
/*
2 (SEGUNDA) CONSULTA
Listar os médicos que têm o CRM emitido em Pernambuco
trazendo as colunas cpf, crm, nome, especialidade e telefone
por ordem crescente.
*/
SELECT med.cpf, med.crm, med.nome, med.especialidade, tel.num_telefone
	FROM Medicos AS med
	LEFT JOIN Telefones AS tel on med.Telefones_num_telefone = tel.num_telefone
    WHERE med.crm like '%PE'
		ORDER BY med.nome ASC;
```

> Pacientes que são do bairro do Santo Antônio e fizerma ao menos 1 exame
```sql
/*
3 (TERCEIRA) CONSULTA
Listar os pacientes que são do bairro de Santo Antônio e possuem ao menos 1 exame realizado,
trazendo as colunas num_prontuario, nome, cpf, sexo e nome_exame
*/
SELECT pac.num_prontuario "Prontuário", pac.nome "Nome", pac.cpf "CPF", pac.sexo "Sexo", exa.nome_exame "Exame"
	FROM Pacientes as pac
	INNER JOIN Enderecos AS edr ON edr.id_endereco = pac.Enderecos_id_endereco
	INNER JOIN Exames AS exa ON exa.Pacientes_num_prontuario = pac.num_prontuario
		WHERE edr.bairro = 'Santo Antônio';
```

> Listar nome dos pacientes e quantidades de consultas que eles tiveram
```sql
/*
4 (QUARTA) CONSULTA (incompleta)
Listar nome de pacientes e a quantidade de consultas realizadas por eles
trazendo as colunas num_prontuario,nome, sexo, cpf e a quantidade de consutlas
ordenado pelo nome.
*/
        
SELECT pac.num_prontuario "Nº Prontuário", pac.nome "Nome", pac.sexo "Sexo", pac.cpf, COUNT(cst.data_consulta) "Consultas"
	FROM Consultas AS cst
		INNER JOIN Pacientes AS pac
			ON cst.Pacientes_num_prontuario = pac.num_prontuario
        WHERE cst.data_consulta IS NOT NULL
        GROUP BY (pac.num_prontuario)
        ORDER BY pac.nome;
```

> Listar médicos que ganham menos que a média salarial dos demais
```sql
/*
5 (QUINTA) CONSULTA
Listar os médicos que ganham menos que a média salarial de todos os médicos cadastrados,
trazendo as colunas cpf, crm, nome, especialidade, salario e bairro 
ordenado por nome do médico.
*/
SELECT med.cpf "CPF", med.crm "CRM", med.nome "Nome", med.salario "Salário", e.bairro "Bairro"
	FROM Medicos AS med
		LEFT JOIN Enderecos e ON med.Enderecos_id_endereco = e.id_endereco
        GROUP BY med.cpf, med.crm, med.nome, med.salario, e.bairro
		HAVING salario < (SELECT AVG(salario) FROM Medicos)
			ORDER BY med.nome;
```

> Listar os médico sque ganham acima da média salarial
```sql
/*
6 (SEXTA) CONSULTA
Listar os médicos que ganham acima da média salarial de todos os médicos da especialidade Ginecologistas,
trazendo as colunas cpf, crm, nome, especialidade, salario e bairro
ordenado por nome do médico.
*/
SELECT med.cpf "CPF", med.crm "CRM", med.nome "Nome", med.especialidade "Especialidade", med.salario "Salário", edr.bairro "Bairro"
	FROM Medicos med
		INNER JOIN Enderecos AS edr
			ON med.Enderecos_id_endereco = edr.id_endereco
		WHERE med.especialidade LIKE "Ginecologi%"
		GROUP BY med.cpf, med.crm, med.nome, med.especialidade, med.salario, edr.bairro
		HAVING `salario` > (SELECT AVG(salario) FROM Medicos)
            ORDER BY med.nome;
```

> Listar pacientes e quantidades de exames realizadas por eles, relacionando com seus bairros
```sql
/*
7 (SÉTIMA) CONSULTA
Listar nome de pacientes e a quantidade de exames realizadas por eles,
trazendo as colunas nome, quantidade de exames, sexo e bairro
ordenado pelo bairro e depois por sexo.
*/
SELECT pac.nome "Nome", COUNT(exa.Pacientes_num_prontuario) "Exames", pac.sexo, edr.bairro "Bairro"
	FROM Saude_menos.Pacientes AS pac
	INNER JOIN Exames AS exa
		ON pac.num_prontuario = exa.Pacientes_num_prontuario
	INNER JOIN Enderecos AS edr
        ON pac.Enderecos_id_endereco = edr.id_endereco
			GROUP BY(pac.num_prontuario)
            ORDER BY edr.bairro DESC, pac.sexo;
```

> Quantas consultas os médicos fazem por dia
```sql
/*
8 (OITAVA) CONSULTA
Informe a soma de consultas realizadas por dia, 
trazendo as colunas Dia, Mês e ano da consulta, quantas o médico fez, seu nome e sexo
Ordenar pelas datas das consultas
*/
SELECT
    EXTRACT(DAY FROM cst.data_consulta) AS Dia,
    EXTRACT(MONTH FROM cst.data_consulta) AS `Mês`,
    EXTRACT(YEAR FROM cst.data_consulta) AS Ano,
    COUNT(cst.Medicos_cpf) "Consultas",
    med.nome "Médico"
FROM Consultas AS cst
	INNER JOIN Medicos AS med
		ON cst.Medicos_cpf = med.cpf
WHERE cst.data_consulta IS NOT NULL
GROUP BY(Dia)
ORDER BY cst.data_consulta;
```

> Listar pacientes que moram no mesmo bairro que o hospital
```sql
/*
9 (NONA) CONSULTA
Listar pacientes que moram no mesmo bairro que o Hospital,
trazendo as colunas: UF, Cidade, Bairro, nome do Hospital, nome do Paciente e seu número de Prontuário
ordenado por paciente
*/
SELECT edrPac.UF, edrPac.Cidade, edrPac.Bairro, edrHsp.Hospital, edrPac.Nome "Paciente", pac.num_prontuario "Prontuário"
FROM edrHsp
	INNER JOIN edrPac
		ON edrPac.Bairro = edrHsp.Bairro
    INNER JOIN Pacientes AS pac
		ON edrPac.CPF = pac.cpf
ORDER BY edrPac.Nome;
```

- Tabelas virtuals (views) utilizadas nesta consultas foram as [Lista de Endereços dos ****************************************************************Hospitais****************************************************************](https://www.notion.so/Sa-de-Menos-Banco-de-Dados-5ea69850d65e4f71bf7f5e5a9cc868cf) e [Lista de Endereços dos **Pacientes**](https://www.notion.so/Sa-de-Menos-Banco-de-Dados-5ea69850d65e4f71bf7f5e5a9cc868cf)

> Listar quantidade de casos diagnosticados, ordenando da doença que mais foi para a que menos foi
```sql
/*
10 (DÉCIMA) CONSULTA
Listar a quantidade de casos doenças diagnosticadas
trazendo o nome da doença e quantidade de diagnósticos
ordenar da doença mais diagnosticada para a menos diagnosticada.
*/
SELECT dgc.nome_patologia "Doença", COUNT(dgc.nome_patologia) "Qtd. Diagnósticos"
	FROM Diagnosticos AS dgc
GROUP BY dgc.nome_patologia
ORDER BY COUNT(dgc.nome_patologia) DESC;
```

> Produtividade de diagnósticos emitidos por médicos
```sql
/*
11 (DÉCIMA PRIMEIRA) CONSULTA
Listar a quantidade de vezes que os médicos diagnosticaram algum paciente
trazendo as colunas Quantidade de diagnósticos, nome do médico e seu CRM
ordenar por ordem Quantidade de  diagnósticos e depois pelo Nome do médico
*/
SELECT COUNT(dgc.nome_patologia) "Diagnósticos", med.nome "Médico", med.crm "CRM"
	FROM Diagnosticos AS dgc 
		INNER JOIN Medicos AS med
			ON med.cpf = dgc.Medicos_cpf
	GROUP BY med.nome 
	ORDER BY `Diagnósticos` DESC, med.nome;
```

> Quantidade de pacientes atendidos pelos hospitais e seus médicos
```sql
/*
12 (DÉCIMA SEGUNDA) CONSULTA
Listar os medicos, juntamente com os hospitais que eles trabalham e a quantidade de pacientes atendidos
trazer as colunas nome do médico, CRM, nome hospital e qtd de atendimentos
ordene por Hospitais e depois por Médicos
*/
SELECT med.nome "Médico", hsp.nome "Hospital", COUNT(cst.Pacientes_num_prontuario) "Pacientes atendidos"
	FROM Hospitais AS hsp 
		INNER JOIN Medicos AS med  
			ON hsp.cnes = med.Hospitais_cnes
		INNER JOIN Consultas AS cst
			ON med.cpf = cst.Medicos_cpf
	GROUP BY med.cpf
	ORDER BY hsp.nome, med.nome;
```

> Quantidade de exames realizados pelos laboratórios
```sql
/*
13 (DÉCIMA TERCEIRA) CONSULTA
Conte a quantidade de solicitações realizadas dos hospitais aos laboratórios
trazendo as colunas (quantidade de) Solicitações, Hospital e Laboratório
ordene por Hospital
*/
SELECT COUNT(slt.id_solicitacao) "Solicitações", hsp.nome "Hospiptal", lab.nome "Laboratório"
	FROM Solicitacoes AS slt
		INNER JOIN Hospitais AS hsp
			ON slt.Hospitais_cnes = hsp.cnes
		INNER JOIN Laboratorios AS lab
			ON slt.Laboratorios_cnes = lab.cnes
	GROUP BY hsp.nome, lab.nome
	ORDER BY hsp.nome;
```

> Consulta de médicos especialistas dentro de um hospital
```sql
/*
14 (DÉCIMA QUARTA) CONSULTA
Listar a quantidade de ḿédicos especialistas dos hospitais
trazendo a quantidade, sua especialidade e o nome do hospital em que trabalha
*/
SELECT COUNT(med.especialidade) "Especialistas", med.especialidade "Especialidade", hsp.nome "Hospital"
	FROM Medicos AS med
		INNER JOIN Hospitais AS hsp
			ON med.Hospitais_cnes = hsp.cnes
	GROUP BY med.rqe
	ORDER BY hsp.cnes;
```

> Listar pacientes que o DDD é 81
```sql
/*
15 (DÉCIMA QUINTA) CONSULTA
Listar os pacientes cujo DDD seja igual a “81”,
trazendo as colunas nome, ddd, num_telefone e cep
ordenar por nome do paciente
*/
SELECT pac.nome 'Nome' , tel.ddd "DDD", tel.num_telefone 'Número', edr.rua "Logradouro", edr.bairro "Bairro", edr.cidade "Cidade", edr.cep 'CEP'
	FROM Pacientes AS pac
		INNER JOIN Telefones AS tel
			ON tel.num_telefone = pac.Telefones_num_telefone
		INNER JOIN Enderecos AS edr
			ON edr.id_endereco = pac.Enderecos_id_endereco
			WHERE tel.ddd = '81'
	ORDER BY pac.nome;
```

> Listar pacientes que se chamam Silva e não realizaram, ainda, nenhum antedimento
```sql
/*
16 (DÉCIMA SEXTA) CONSULTA
Listar os pacientes que tem o sobrenome “Silva” e não realizaram nenhuma consulta,
trazendo as colunas num_prontuario, cpf, nome, nome_social e sexo.
*/
SELECT pac.num_prontuario, pac.cpf, pac.nome, pac.nome_social, cst.data_consulta
	FROM Pacientes as pac
		INNER JOIN Consultas as cst
			ON cst.Pacientes_num_prontuario = pac.num_prontuario AND cst.data_consulta IS NOT NULL
	WHERE pac.nome LIKE '%Silva%';
```

> Listar pacientes que moram no mesmo endereço
```sql
/*
17 (DÉCIMA SÉTIMA) CONSULTA
Listar pacientes que moram no mesmo endereço
Trazendo os campos Nome, id endereço, nome da rua, número, bairro e cidade
Ordenando pelo id_endereco para juntar todos os que moram na mesma casa
*/
SELECT pac.nome "Nome do Paciente", edr.id_endereco "ID-Endereço", edr.rua "Logradouro", edr.numero "Número", edr.bairro "Bairro", edr.cidade "Cidade"
	FROM Enderecos AS edr
	INNER JOIN Pacientes AS pac
		ON pac.Enderecos_id_endereco = edr.id_endereco
	ORDER BY edr.id_endereco;
```

> Pacientes que nasceram entre 1940 e 1980
```sql
/*
18 (DÉCIMA OITAVA) CONSULTA
Listar nome, número de prontuario e data de nascimento de pacientes que nasceram entre 1940 1980.
Ordenar do mais velho para o mais novo
*/
SELECT pac.nome "Nome", pac.data_nascimento "Data de nascimento", pac.num_prontuario "Prontuário"
	FROM Pacientes AS pac
		WHERE pac.data_nascimento BETWEEN '1940-01-01' AND '1980-12-31'
	ORDER BY pac.data_nascimento ASC;
```

> Lista de hospitais localizados na ILPI
```sql
/*
19 (DÉCIMA NONA) CONSULTA
Lista dos hospitais localizados no bairro da Boa Vista
trazendo as colunas (bairro e hospital).
*/
SELECT edr.bairro 'Bairro', hsp.nome 'Hospital'
	FROM Enderecos AS edr
		INNER JOIN Hospitais AS hsp
			ON hsp.Enderecos_id_endereco = edr.id_endereco
	WHERE edr.bairro = 'Boa Vista';
```

> Lista telefônica dos pacientes
```sql
/*
20 (VIGÉSIMA) CONSULTA
Lista dos telefones dos pacientes, trazendo as colunas (número telefone, nome paciente)
ordenado por nome paciente.
*/
SELECT pac.nome 'Paciente', pac.Telefones_ddd "DDD", pac.Telefones_num_telefone 'Telefone'
FROM Telefones AS tel
    INNER JOIN Pacientes AS pac
		ON pac.Telefones_ddd = tel.ddd AND pac.Telefones_num_telefone = tel.num_telefone
ORDER BY pac.nome;
```

> Média salarial de médicos que trabalham no Hospital X
```sql
/*
21 (VIGÉSIMA PRIMEIRA) CONSULTA
Média salarial dos médicos que trabalham no Hospital Gilmarzito.
*/
SELECT AVG(med.salario) "Média Salarial", med.Hospitais_cnes
	FROM Medicos AS med
WHERE med.Hospitais_cnes = (
	SELECT hsp.cnes
		FROM Hospitais AS hsp
	WHERE hsp.nome = "Hospital Gilmarzito"
);
```

---

### Tabela com Abreviações do Select

> Abreviações usadas nos selects das consultas.
| Nome ficção      | Alias | Label                   |
| ---------------- | ----- | ----------------------- |
| Ambulatórios     | amb   | Ambulatorios AS amb     |
| Consultas        | cst   | Consultas AS cst        |
| Diagnósticos     | dgn   | Diagnostico AS dgc      |
| Endereços        | edr   | Enderecos AS edr        |
| Exames           | exa   | Exames AS exa           |
| Hospitais        | hsp   | Hospitais AS hsp        |
| Laboratórios     | lab   | Laboratorios AS lab     |
| Médicos          | med   | Medicos AS med          |
| Pacientes        | pac   | Pacientes as pac        |
| Pessoal de apoio | pda   | Pessoal_de_apoio AS pda |
| Solicitações     | slt   | Solicitacoes AS slt     |
| Telefones        | tel   | Telefones AS tel        |

---

# Possíveis melhorias observadas e não implementadas no escopo deste projeto

- A criação de uma tabela sintomas, de n pra n com as consultas
  - Dividindo-se em sintomas físicos
  - Cutâneos
- Adicionar alergias na tabela Pacientes
- Fazer consultas que substituam o campo Nome, quando houver cadastro de Nome social do registro
- Selecionar os três médicos mais produtivos para ganharem bônus

---

# Referências

- **Repositório do Saúde Menos no GitHub**. Disponível em: <[https://github.com/brazadrian/Saude_menos](https://github.com/brazadrian/Saude_menos)>
- Documentação -13.2.11.6 **Subqueries with EXISTS or NOT EXISTS**. Disponível em: <[https://dev.mysql.com/doc/refman/8.0/en/exists-and-not-exists-subqueries.html](https://dev.mysql.com/doc/refman/8.0/en/exists-and-not-exists-subqueries.html)>

- **CNES - Cadastro Nacional de Estabelecimentos de Saúde**. Disponível em: [https://www.gov.br/saude/pt-br/acesso-a-informacao/acoes-e-programas/cebas/cnes-cadastro-nacional-de-estabelecimentos-de-saude#:~:text=O%20Cadastro%20Nacional%20de%20Estabelecimentos,eficaz%20e%20eficiente%20do%20SUS.](https://www.gov.br/saude/pt-br/acesso-a-informacao/acoes-e-programas/cebas/cnes-cadastro-nacional-de-estabelecimentos-de-saude#:~:text=O%20Cadastro%20Nacional%20de%20Estabelecimentos,eficaz%20e%20eficiente%20do%20SUS.)

- **Cadastro Nacional de Estabelecimentos de Saúde**. Disponível em: [http://cnes.datasus.gov.br/](http://cnes.datasus.gov.br/)
- **Ministério da Saúde. Manual de apoio aos gestores do SUS: organização da rede de laboratórios clínicos**. Disponível em: [https://bvsms.saude.gov.br/bvs/publicacoes/manual_apoio_gestores.pdf](https://bvsms.saude.gov.br/bvs/publicacoes/manual_apoio_gestores.pdf) 

- **Regulamento técnico sobre os estabelecimentos assistenciais de saúde**. Disponível em: [https://bvsms.saude.gov.br/bvs/saudelegis/anvisa/2002/rdc0050_21_02_2002.html](https://bvsms.saude.gov.br/bvs/saudelegis/anvisa/2002/rdc0050_21_02_2002.html)

- **Sobre a criação e Cadastro Nacional de Estabelecimentos de Saúde (CNES)** . Disponível em: [https://bvsms.saude.gov.br/bvs/saudelegis/gm/2015/prt1646_02_10_2015.html#:~:text=estabelecimento%20de%20sa%C3%BAde.-,Art.,bem%20como%20%C3%A0s%20suas%20renova%C3%A7%C3%B5es](https://bvsms.saude.gov.br/bvs/saudelegis/gm/2015/prt1646_02_10_2015.html#:~:text=estabelecimento%20de%20sa%C3%BAde.-,Art.,bem%20como%20%C3%A0s%20suas%20renova%C3%A7%C3%B5es)

- **O CNES  é obrigatório? Saiba por quê** . Disponível em: [https://blog.imedicina.com.br/o-cnes-e-obrigatorio-artigo-st/](https://blog.imedicina.com.br/o-cnes-e-obrigatorio-artigo-st/)

- **Saiba o que é CID e para que serve**. Disponível em:  [https://pebmed.com.br/cid-o-que-e-como-utilizar/#:~:text=A%20Classifica%C3%A7%C3%A3o%20Estat%C3%ADstica%20Internacional%20de,atrav%C3%A9s%20de%20uma%20padroniza%C3%A7%C3%A3o%20universal](https://pebmed.com.br/cid-o-que-e-como-utilizar/#:~:text=A%20Classifica%C3%A7%C3%A3o%20Estat%C3%ADstica%20Internacional%20de,atrav%C3%A9s%20de%20uma%20padroniza%C3%A7%C3%A3o%20universal)

- **LISTA CID-10 - A Classificação Internacional de Doenças e Problemas Relacionados à Saúde**. Disponível em: [https://www.medicinanet.com.br/cid10.htm#:~:text=A%20CID%2010%20fornece%20c%C3%B3digos,corresponde%20um%20c%C3%B3digo%20CID%2010](https://www.medicinanet.com.br/cid10.htm#:~:text=A%20CID%2010%20fornece%20c%C3%B3digos,corresponde%20um%20c%C3%B3digo%20CID%2010)

- **Ambulatório: 5 dicas valiosas**. Disponível em:  [https://www.sanarmed.com/ambulatorio-5-dicas-valiosas-carreiramed](https://www.sanarmed.com/ambulatorio-5-dicas-valiosas-carreiramed) 

- **Ambulatório médico: você sabe o que é**? Disponível em:  [https://blog.bidu.com.br/o-que-e-ambulatorio-medico/](https://blog.bidu.com.br/o-que-e-ambulatorio-medico/) 

- **Diferença entre laboratório Clínico Ambulatorial x Hospitalar**. Disponível em:  [https://www.saudebusiness.com/mercado/diferenas-entre-laboratrio-clnico-ambulatorial-x-hospitalar](https://www.saudebusiness.com/mercado/diferenas-entre-laboratrio-clnico-ambulatorial-x-hospitalar) 

- **O diagnóstico preciso ajuda no tratamento do paciente**. Disponível em:  [https://teleimagem.com.br/como-o-diagnostico-preciso-pode-ajudar-no-tratamento-do-paciente/#:~:text=O%20diagn%C3%B3stico%20preciso%20%C3%A9%20fundamental,natureza%20dos%20problemas%20de%20sa%C3%BAde](https://teleimagem.com.br/como-o-diagnostico-preciso-pode-ajudar-no-tratamento-do-paciente/#:~:text=O%20diagn%C3%B3stico%20preciso%20%C3%A9%20fundamental,natureza%20dos%20problemas%20de%20sa%C3%BAde) 

---

# Perspectivas e Conclusão

A descrição do minimundo chamou a atenção por estar bem completa, ficamos intrigados com a complexidade e desafio que seria construir tantas tabelas. A partir dessa, vivenciamos situações reais e tivemos contato com diversos problemas que surgem no cotidiano de um DBA. 

Também foi possível que nos debruçassemos sobre a realidade de sistemas de saúde e adquirirmos a compreensão da seriedade que prestam esses serviços e de por que é tão difícil o desenvolvimento de software para a área, pois sempre que eram levantados novos problemas vinham perguntas sobre acessibilidade, segurança, garantia de direitos, etc. 

Não foi fácil, mas finalizamos a entrega com novas perspectivas e conhecimentos.

---

# Colaboradores
<table>
  <tr>
    <td align="center"><a href="https://www.linkedin.com/in/wildestmaii/"><img src="https://media-exp1.licdn.com/dms/image/C4D03AQHNUS2ujDGLwg/profile-displayphoto-shrink_800_800/0/1659726701828?e=1671062400&v=beta&t=ENdrOV4vuJuxTikDchaBfbse_mXUHmXl45QlWKM15j0" width="100px;" alt=""/><br /><sub><b>Maiara Meneses</b></sub></a></td>
    <td align="center"><a href="https://www.linkedin.com/in/l%C3%ADvia-vit%C3%B3ria-6a5771230/"><img src="https://avatars.githubusercontent.com/u/114452531?v=4" width="100px;" alt=""/><br /><sub><b>Livia Vitória</b></sub></a></td>
    <td align="center"><a href="https://www.linkedin.com/in/brazadrian"><img src="https://avatars.githubusercontent.com/u/60609409?v=4" width="100px;" alt=""/><br /><sub><b>Gilmar Adrian</b></sub></a></td>
  </tr>


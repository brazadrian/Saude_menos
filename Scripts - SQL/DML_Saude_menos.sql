-- -----------------------------------------------------
-- Consultas no Schema Saude_menos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- OK nserindo dados na tabela Endereços
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Enderecos`
(`id_endereco`, `cep`, `rua`, `numero`, `bairro`) 
VALUES (1, "26489116", "Rua Dona Dalva", 49, "Nova Descoberta"), 
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
(24, "98345265", "Rua Ministro Gilberto Gil", 13, "Iputinga");

-- -----------------------------------------------------
-- Inserindo dados na tabela Endereços
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Enderecos`
(`cep`, `rua`, `numero`, `bairro`)
VALUES ("26489116", "Rua Dona Dalva", 12, "Nova Descoberta");

UPDATE Enderecos
SET cidade = "Recife";

SELECT * FROM Enderecos;

-- -----------------------------------------------------
-- Inserindo dados na tabela Endereços
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
(64, 996374671);

-- -----------------------------------------------------
-- Inserindo dados na tabela Endereços
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Hospitais`
(`cnes`, `nome`, `cnpj`, `Enderecos_id_endereco`, `Telefones_ddd`, `Telefones_num_telefone`) 
values (7648913, "Hospital Henrique Biruta", 46891567348926, 1, 81, 982341235 ),
(7623463, "Hospital Erika Vilas Ruins", 46291367308926, 2, 51, 981567843),
(7828463, "Hospital Gilmarzito", 46291362048626, 3, 44, 983524172),
(9623463, "Hospital Pereira Ramos", 20576367308916, 4, 81, 981452634),
(4389135, "Hospital Oswaldo Cruz", 93765409572632, 5, 75, 987345231);

-- -----------------------------------------------------
-- Inserindo dados na tabela Endereços
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Ambulatorios`
(`especialidade`, `Hospitais_cnes`)
values ("Cardiologia", "7648913"),
("Dermatologia", "7623463"),
("Neurologia", "7828463"),
("Radioterapia", "9623463"),
("Oftalmologia", "9623463"),
("Pediatria", "4389135"),
("Geriatria", "7828463"),
("Ginecologia", "7623463"),
("Psiquiatria", "7648913"),
("Endoscopia", "4389135");

-- -----------------------------------------------------
-- Inserindo dados na tabela Endereços
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Pacientes`
	(`cpf`, `nome`, `nome_social`, `email`, `sexo`, `Enderecos_id_endereco`, `Telefones_ddd`, `Telefones_num_telefone`) 
		VALUES
			(),
			(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- -----------------------------------------------------
-- Inserindo dados na tabela Endereços
-- -----------------------------------------------------
INSERT INTO `Saude_menos`.`Pacientes` 
(`cpf`,  `nome`, `nome_social`, `email`, `sexo`, `Enderecos_id_endereco`, `Telefones_ddd`, `Telefones_num_telefone`) 
values (22015787455, "Kamily Aguiar Paiva", NULL, "kamily.paiva@geradornv.com.br", 'F', inserirIdEndereco, 77, 986453731),
(12015700450, "Paulo Quintela Regufe", NULL, "paulo.regufe@geradornv.com.br", 'M', inserirIdEndereco, 35, 984762897),
(14045901400, "Ana Carolina da Silva Pedroso", NULL, "ana.pedroso@geradornv.com.br", 'F', inserirIdEndereco, 51, 986543421),
(18065911420, "Antônia Mota Marins", NULL, "antonia.marins@geradornv.com.br", 'F', inserirIdEndereco, 21, 987463732), 
(19045401488, "Everaldo Gonçalves Furtunato", NULL, "everaldo.furtunato@geradornv.com.br", 'M', inserirIdEndereco, 61, 992621825),
(19644001301, "Cristiano Spilman Mattos", NULL, "cristiano.mattos@geradornv.com.br", 'M', inserirIdEndereco, 61, 982664821),
(14042802003, "Kamily de Oliveira", NULL, "kamily.oliveira@geradornv.com.br", 'F', inserirIdEndereco, 73, 991579762),
(13345401404, "Katia Ramos", NULL, "katia.ramos@geradornv.com.br", 'F', inserirIdEndereco, 83, 968710433),
(14033801411, "Patrícia Carmo Zuniga", NULL, "patricia.zuniga@geradornv.com.br", 'F', inserirIdEndereco, 68, 989137456),
(11045001323, "Henry Figueredo", NULL, "henry.figueredoo@geradornv.com.br", 'M', inserirIdEndereco, 64, 996374671),
(10045800421, "Elizabeth Rabelo Macedo", NULL, "elizabeth.macedo@geradornv.com.br", 'F', inserirIdEndereco, 81, 986356212);








































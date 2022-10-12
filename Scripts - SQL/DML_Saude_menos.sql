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

INSERT INTO `Saude_menos`.`Enderecos`
(`cep`, `rua`, `numero`, `bairro`) 
VALUES
("50043876", "Rua do Fogo", 35, "Santo Antônio"),
("98345265", "Rua das Flores", 65, "Santo Antônio"),
("98345265", "Rua Ministro Gilberto Gil", 2, "Iputinga"),
("26489116", "Rua Dona Dalva", 23, "Nova Descoberta"), 
("26489416", "Rua Tamarindo", 18, "Iputinga"),
("56289176", "Rua Gatinho", 13, "Boa Vista"),
("98643586", "Rua da Cadeia Velha", 27, "Recife"),
("14256486", "Rua do Aragão", 13, "Boa Vista"),
("50030170", "Rua  do Bom Jesus", 31, "Recife"),
("23654321", "Rua do Crespo", 123, "Santo Antônio"),
("98547623", "Rua do Imperador", 157, "Santo Antônio"), 
("50936274", "Rua da Hora", 171, "Espinheiro"),
("50043876", "Rua do Fogo", 192, "Santo Antônio"),
("98345265", "Rua das Flores", 129, "Santo Antônio"),
("98345265", "Rua Ministro Gilberto Gil", 1377, "Iputinga"),
("50000000", "Rua Robeyoncé Lima", 5000, "Santo Amaro");

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
(81, 996374671);

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


-- -----------------------------------------------------
-- Inserindo dados na tabela Solicitações
-- -----------------------------------------------------
USE Saude_menos;
INSERT INTO `Saude_menos`.Solicitacoes (`Hospitais_cnes`,`Laboratorios_cnes`,`id_solicitacao`,`data`)
	VALUES
    ('7648913','8435671',1,'2022-09-7 13:45'),
	('7648913','8435671',2,'2022-09-12 12:43'),
	('8435671','5241761',3,'2022-09-13 13:31'),
	('8435671','5241761',4,'2022-09-14 12:00'),
	('8435671','2534123',5,'2022-09-15 13:00'),
	('7648913','1012431',6,'2022-09-15 16:30'),
	('9623463','8241532',7,'2022-09-15 17:00'),
	('9623463','9132652',8,NULL),
	('7648913','1012431',9,NULL),
	('7648913','9132652',10,NULL),
	('7648913','1012431',11,NULL),
	('7828463','3849448',12,NULL),
	('4389135','9132652',13,NULL),
	('4389135','8241532',14,NULL),
	('7828463','9132652',15,NULL),
	('5647384','8241532',16,NULL),
	('5647384','9132652',17,NULL),
	('5647384','3849448',18,NULL),
	('7828463','8241532',19,NULL),
	('7648913','2341278',20,NULL),
	('5647384','8241532',21,NULL),
	('7648913','2341278',22,NULL),
	('5647384','2341278',23,NULL),
	('4389135','2341278',24,NULL),
	('5647384','3849448',25,NULL),
	('5647384','3849448',26,NULL),
	('7648913','3849448',27,NULL),
	('5647384','9898752',28,NULL),
	('4389135','2652181',29,NULL),
	('7648913','9898752',30,NULL),
	('5647384','2652181',31,NULL),
	('7623463','9898752',32,NULL),
	('5647384','9898752',33,NULL),
	('5647384','2652181',34,NULL);


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
(7, '87954631259', 'Cassio Azevedo Duarte', '', '1999-09-07', NULL, 'M', 20, '21', '987463732'),
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


-- -----------------------------------------------------
-- Inserindo dados na tabela Exames
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Inserindo dados na tabela Médicos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Inserindo dados na tabela Diagnósticos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Inserindo dados na tabela Consultas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Inserindo dados na tabela Pessoal_de_apoio
-- -----------------------------------------------------







-- -----------------------------------------------------
-- Inserindo dados na tabela Pacientes
-- -----------------------------------------------------










































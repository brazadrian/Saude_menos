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
('60882111485', '3110PE', 'Otavio Garcia', NULL, '1003', 'Clínico Geral', 'M', 'otavio.garcia@sus.com', 5505, true, 50, '81', '987463732', 7828463);


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




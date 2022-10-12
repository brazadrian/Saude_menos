-- INSERT, DELETE E UPDATE

INSERT INTO `Saude_menos`.`Enderecos` (`id_endereco`, `cep`, `rua`, `numero`, `bairro`, `estado`, `cidade`) VALUES (NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO `Saude_menos`.`Enderecos`
(`id_endereco`, `cep`, `rua`, `numero`, `bairro`, `estado`) 
values (1, "26489116", "Rua Dona Dalva", 49, "Nova Descoberta", "PE"), 
(2, "26489416", "Rua Tamarindo", 70, "Iputinga", "PE"),
(3, "56289176", "Rua Gatinho", 341, "Boa Vista", "PE"),
(4, "98643586", "Rua da Cadeia Velha", 54, "Recife", "PE"),
(5, "14256486", "Rua do Aragão", 65, "Boa Vista", "PE"),
(6, "50030170", "Rua  do Bom Jesus", 10, "Recife", "PE"),
(7, "23654321", "Rua do Crespo", 89, "Santo Antônio", "PE"),
(8, "98547623", "Rua do Imperador", 13, "Santo Antônio", "PE"), 
(9, "50936274", "Rua da Hora", 52, "Espinheiro", "PE"),
(10, "50043876", "Rua do Fogo", 14, "Santo Antônio", "PE"),
(11, "98345265", "Rua das Flores", 44, "Santo Antônio", "PE"),
(12, "98345265", "Rua Ministro Gilberto Gil", 172, "Iputinga", "PE");

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

INSERT INTO `Saude_menos`.`Hospitais`
(`cnes`, `nome`, `cnpj`, `Enderecos_id_endereco`, `Telefones_ddd`, `Telefones_num_telefone`) 
values (7648913, "Hospital Henrique Biruta", 46891567348926, 1, 81, 982341235 ),
(7623463, "Hospital Erika Vilas Ruins", 46291367308926, 2, 51, 981567843),
(7828463, "Hospital Gilmarzito", 46291362048626, 3, 44, 983524172),
(9623463, "Hospital Pereira Ramos", 20576367308916, 4, 81, 981452634),
(4389135, "Hospital Oswaldo Cruz", 93765409572632, 5, 75, 987345231);

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


INSERT INTO `Saude_menos`.`Pacientes`
	(`cpf`, `nome`, `nome_social`, `email`, `sexo`, `Enderecos_id_endereco`, `Telefones_ddd`, `Telefones_num_telefone`) 
		VALUES
			(),
			(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO `Saude_menos`.`Pacientes` 
(`cpf`,  `nome`, `nome_social`, `email`, `sexo`, `Enderecos_id_endereco`, `Telefones_ddd`, `Telefones_num_telefone`) 
values (22015787455, "Kamily Aguiar Paiva", NULL, "kamily.paiva@geradornv.com.br", 'F', ??, 77, 986453731),
(12015700450, "Paulo Quintela Regufe", NULL, "paulo.regufe@geradornv.com.br", 'M', ??, 35, 984762897),
(14045901400, "Ana Carolina da Silva Pedroso", NULL, "ana.pedroso@geradornv.com.br", 'F', ??, 51, 986543421),
(18065911420, "Antônia Mota Marins", NULL, "antonia.marins@geradornv.com.br", 'F', ??, 21, 987463732), 
(19045401488, "Everaldo Gonçalves Furtunato", NULL, "everaldo.furtunato@geradornv.com.br", 'M', ??, 61, 992621825),
(19644001301, "Cristiano Spilman Mattos", NULL, "cristiano.mattos@geradornv.com.br", 'M', ??, 61, 982664821),
(14042802003, "Kamily de Oliveira", NULL, "kamily.oliveira@geradornv.com.br", 'F', ??, 73, 991579762),
(13345401404, "Katia Ramos", NULL, "katia.ramos@geradornv.com.br", 'F', ??, 83, 968710433),
(14033801411, "Patrícia Carmo Zuniga", NULL, "patricia.zuniga@geradornv.com.br", 'F', ??, 68, 989137456),
(11045001323, "Henry Figueredo", NULL, "henry.figueredoo@geradornv.com.br", 'M', ??, 64, 996374671),
(10045800421, "Elizabeth Rabelo Macedo", NULL, "elizabeth.macedo@geradornv.com.br", 'F', ??, 81, 986356212);








































-- CONSULTAS NO BANCO DE DADOS - SAÚDE MENOS

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

-- -----------------------------------------------------
        
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

-- -----------------------------------------------------

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
        
-- -----------------------------------------------------

/*
4 (QUARTA) CONSULTA (incompleta)
Listar nome de pacientes e a quantidade de consultas realizadas por eles
trazendo as colunas num_prontuario, cpf, nome, sexo
ordenado pelo nome.
*/
SELECT pac.num_prontuario "Nº Prontuário", pac.cpf "CPF", pac.nome "Nome", pac.sexo "Sexo", cst.data_consulta "Consulta", COUNT(cst.Pacientes_num_prontuario) ""
	FROM Consultas AS cst
		INNER JOIN Pacientes AS pac
        ON pac.num_prontuario = cst.Pacientes_num_prontuario
        WHERE cst.data_consulta IS NOT NULL
        GROUP BY cst.Pacientes_num_prontuario, pac.num_prontuario, pac.cpf, pac.nome, pac.sexo, cst.data_consulta
        ORDER BY pac.nome;
        
/*
SELECT COUNT(cst.Pacientes_num_prontuario), cst.data_consulta
	FROM Consultas AS cst
		INNER JOIN Pacientes AS pac;
*/

-- -----------------------------------------------------

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

-- -----------------------------------------------------

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

-- -----------------------------------------------------

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

-- -----------------------------------------------------

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

-- -----------------------------------------------------

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

/*

Tabela virtual criada para auxílio nesta consulta (9ª)

Lista com os hospitais e seus respectivos endereços
Lista com os pacientes e seus respectivos endereços

CREATE VIEW edrHsp AS
SELECT edr.cep "CEP", edr.bairro "Bairro", edr.cidade "Cidade", edr.estado "UF", hsp.nome "Hospital", hsp.cnes "CNES"
FROM Enderecos AS edr
RIGHT JOIN Hospitais AS hsp
	ON hsp.Enderecos_id_endereco = edr.id_endereco;

CREATE VIEW edrPac AS
SELECT edr.cep "CEP", edr.bairro "Bairro", edr.cidade "Cidade", edr.estado "UF", pac.nome "Nome", pac.cpf "CPF"
FROM Enderecos AS edr
RIGHT JOIN Pacientes AS pac
	ON pac.Enderecos_id_endereco = edr.id_endereco;
    
SELECT * FROM Pacientes
INNER JOIN Enderecos ON Enderecos.id_endereco = Pacientes.Enderecos_id_endereco;

Tabela virtual criada para auxílio nesta consulta (9ª)

*/

-- -----------------------------------------------------

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

-- -----------------------------------------------------

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

-- -----------------------------------------------------

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

-- -----------------------------------------------------

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

-- -----------------------------------------------------

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

-- -----------------------------------------------------

/*
15 (DÉCIMA QUINTA) CONSULTA
Listar os pacientes cujo dd seja igual a “81”,
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

-- -----------------------------------------------------

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

-- -----------------------------------------------------

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

/*
18 (DÉCIMA OITAVA) CONSULTA
Listar nome, número de prontuario e data de nascimento de pacientes que nasceram entre 1940 1980.
Ordenar do mais velho para o mais novo
*/

SELECT pac.nome "Nome", pac.data_nascimento "Data de nascimento", pac.num_prontuario "Prontuário"
	FROM Pacientes AS pac
		WHERE pac.data_nascimento BETWEEN '1940-01-01' AND '1980-12-31'
	ORDER BY pac.data_nascimento ASC;


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

-- CONSULTAS NO BANCO DE DADOS - SAÚDE MENOS

/*
1 (PRIMEIRA) CONSULTA
Listar as consultas realizadas entre Janeiro de 2020 e Outubro de 2022
trazendo as Datas das consultas, Prontuário do paciente, CPF, Nome e Sexo do Paciente
por ordem decrescente
*/

SELECT pac.nome "Nome", pac.cpf "CPF", pac.num_prontuario "Nº Prontuário", pac.sexo "Sexo", cst.data_consulta "Data da Consulta"
FROM Pacientes pac
	INNER JOIN Consultas cst ON pac.num_prontuario = cst.Pacientes_num_prontuario
WHERE cst.data_consulta BETWEEN '2020-01-01 00:01' AND '2022-10-12'
ORDER BY cst.data_consulta DESC;

/*
2 (SEGUNDA) CONSULTA
Listar os médicos que possuem nome iniciado com ”A”
trazendo as colunas cpf, crm, nome, especialidade e telefone
por ordem crescente.
*/

SELECT med.cpf, med.crm, med.nome, med.especialidade, tel.num_telefone
FROM Medicos as med
	INNER JOIN Telefones as tel on med.Telefones_num_telefone = tel.num_telefone
WHERE med.nome like 'A%'
ORDER BY med.nome;

/*
3 (TERCEIRA) CONSULTA
Listar os pacientes que são do bairro de Santo Antônio e possuem ao menos 1 exame realizado,
trazendo as colunas num_prontuario, cpf, nome, sexo e nome_exame
*/
-- colocar quantos exames eles fizeram (count)
SELECT pac.num_prontuario, pac.cpf, pac.nome, pac.sexo, exa.nome_exame
FROM Pacientes as pac
	INNER JOIN Enderecos as edr on edr.id_endereco = pac.Enderecos_id_endereco
	INNER JOIN Exames as exa on exa.Pacientes_num_prontuario = pac.num_prontuario
WHERE edr.bairro = 'Santo Antônio';


/*
4 (QUARTA) CONSULTA (incompleta)
Listar nome de pacientes e a quantidade de consultas realizadas por eles
trazendo as colunas num_prontuario, cpf, nome, sexo
ordenado pelo nome.
*/


SELECT pac.num_prontuario "Nº Prontuário", pac.nome "Nome", pac.sexo "Sexo", pac.cpf, COUNT(cst.data_consulta) "Consultas"
	FROM Consultas AS cst
		INNER JOIN Pacientes AS pac
			ON cst.Pacientes_num_prontuario = pac.num_prontuario
        WHERE cst.data_consulta IS NOT NULL
        GROUP BY (pac.num_prontuario)
        ORDER BY pac.nome;


/*
SELECT COUNT(cst.Pacientes_num_prontuario), cst.data_consulta
	FROM Consultas AS cst
		INNER JOIN Pacientes AS pac;
*/

/*
5 (QUINTA) CONSULTA
Listar os médicos que ganham menos que a média salarial de todos os médicos cadastrados,
trazendo as colunas cpf, crm, nome, especialidade, salario e bairro 
ordenado por nome do médico.
*/

SELECT med.cpf "CPF", med.crm "CRM", med.nome "Nome", med.salario "Salário", edr.bairro "Bairro"
FROM Medicos AS med
	LEFT JOIN Enderecos edr ON med.Enderecos_id_endereco = edr.id_endereco
GROUP BY med.cpf, med.crm, med.nome, med.salario, edr.bairro
HAVING salario < (SELECT AVG(salario)
FROM Medicos)
ORDER BY med.nome;

/*
6 (SEXTA) CONSULTA
Listar os médicos que ganham acima da média salarial de todos os médicos da especialidade clinica,
trazendo as colunas cpf, crm, nome, especialidade, salario e bairro
ordenado por nome do médico.
*/

SELECT med.cpf "CPF", med.crm "CRM", med.nome "Nome", med.especialidade "Especialidade", med.salario "Salário", edr.bairro "Bairro"
FROM Medicos med
	INNER JOIN Enderecos AS edr
	ON med.Enderecos_id_endereco = edr.id_endereco
WHERE especialidade = "Ginecologi%"
GROUP BY med.cpf, med.crm, med.nome, med.especialidade, med.salario, edr.bairro
HAVING 'salario' > (SELECT AVG(salario)
FROM Medicos)
ORDER BY med.nome;

/*
7 (SÉTIMA) CONSULTA
Listar nome de pacientes e a quantidade de exames realizadas por eles,
trazendo as colunas num_prontuario, cpf, nome, sexo e cidade
ordenado pelo nome.
*/
SELECT pac.num_prontuario, pac.cpf, pac.nome, pac.sexo, edr.cidade, (SELECT COUNT(exa.Pacientes_num_paciente)
	FROM Exames exa
	WHERE exa.Pacientes_num_paciente = pac.num_paciente) "Quantidade de exames"
FROM pacientes as pac
	INNER JOIN endereco as edr on edr.id_endereco = pac.Endereco_id_endereco
GROUP BY pac.nome
ORDER BY pac.nome;


/*
8 (OITAVA) CONSULTA
Informe a soma de consultas realizadas por dia, 
trazendo as colunas data_consulta, nome do médico, especialidade, sexo e email.
*/


/*
9 (NONA) CONSULTA
Listar nome de pacientes que moram na mesma rua que o Hospital,
trazendo as colunas num_prontuario, nome_social, nome, id_diagnostico, cid_sigla e cid_cod
ordene por paciente.
*/


/*
10 (DÉCIMA) CONSULTA
Listar a quantidade de casos de câncer e separar por sexo acometidos
trazendo as colunas sexo e nome_patologia
ordenar por ordem decrescente.
*/

SELECT COUNT(dgn.nome_patologia) AS Patologias, pac.sexo
FROM Diagnosticos AS dgn INNER JOIN Pacientes AS pac
	ON dgn.Pacientes_num_prontuario = pac.num_prontuario
GROUP BY pac.sexo
ORDER BY pac.sexo;


/*
11 (DÉCIMA PRIMEIRA) CONSULTA
Listar a quantidade das diferentes patologias registradas e separar por medicos envolvidos no tratamento
trazendo as colunas médicos e nome da patologia
ordenar por ordem crescente.
*/

SELECT COUNT(dgn.nome_patologia) AS Patologias, med.nome
FROM Diagnosticos AS dgn
	INNER JOIN medicos AS med
	ON med.cpf = dgn.Medicos_cpf
GROUP BY med.nome
ORDER BY med.nome;


/*
12 (DÉCIMA SEGUNDA) CONSULTA
Listar os medicos, juntamente com os hospitais que trabalham e a quantidade de pacientes atendidos
trazer as colunas nome do médico, nome do hospital.
ordene por Hospital.
*/

SELECT m.nome AS "Médicos", hsp.nome AS "Hospitais", COUNT(cst.Pacientes_num_prontuario) AS "Prontuarios"
FROM Hospitais AS hsp
	INNER JOIN Medicos AS med
	ON hsp.cnes = med.Hospitais_cnes
	INNER JOIN Consultas AS cst
	ON med.cpf = cst.Medicos_cpf
GROUP BY cst.Pacientes_num_prontuario, med.nome, hsp.nome
ORDER BY COUNT(cst.Pacientes_num_prontuario);


/*
13 (DÉCIMA TERCEIRA) CONSULTA
Conte a quantidade de solicitações realizadas por dia
trazendo as colunas data (solicitação), nome do hospital e nome laboratório
ordene por hospital.
*/

SELECT COUNT(slt.id_solicitacao) AS "Solicitações", hsp.nome AS "Hospital", lab.nome AS "Laboratório"
FROM Solicitacoes AS slt
	INNER JOIN Hospitais AS hsp
	ON slt.Hospitais_cnes = hsp.cnes
	INNER JOIN Laboratorios AS lab
	ON slt.Laboratorios_cnes = lab.cnes
GROUP BY hsp.nome, lab.nome
ORDER BY hsp.nome;


/*
14 (DÉCIMA QUARTA) CONSULTA
Listar as especialidades contabilizando o número total de médicos por especialidade do hospital “xxxx”
trazendo as colunas total de médicos e especialidade.
*/

SELECT COUNT(m.especialidade) AS "Médicos Especialistas", hsp.nome AS "Hospital"
FROM Medicos AS med
	INNER JOIN Hospitais AS hsp
	ON med.Hospitais_cnes = hsp.cnes
GROUP BY hsp.cnes
ORDER BY hsp.cnes;


/*
15 (DÉCIMA QUINTA) CONSULTA
Listar os pacientes cujo dd seja igual a "81",
trazendo as colunas nome, num_telefone e cep
ordenar por nome.
*/

SELECT pac.nome 'Nome' , tel.num_telefone 'Número', edr.cep 'CEP'
FROM Pacientes as pac
	INNER JOIN Telefones as tel on tel.num_telefone = pac.Telefones_num_telefone
	INNER JOIN Enderecos as edr on edr.id_endereco = pac.Enderecos_id_endereco
WHERE tel.ddd = '81'
ORDER BY pac.nome;


/*
16 (DÉCIMA SEXTA) CONSULTA
Listar os pacientes que tem o sobrenome “Silva” e não realizaram nenhum exame,
trazendo as colunas número do prontuario, cpf, nome, nome social e sexo.
*/

SELECT pac.num_prontuario, pac.cpf, pac.nome, pac.nome_social
FROM Pacientes as pac
	INNER JOIN Consultas as cst ON cst.Pacientes_num_prontuario
WHERE  pac.nome LIKE '%Silva%';


/*
17 (DÉCIMA SÉTIMA) CONSULTA
Listar pacientes que moram no mesmo endereço.
*/

SELECT pac.nome AS "Nome do Paciente", edr.id_endereco AS "ID do Endereço"
FROM Enderecos AS edr
INNER JOIN Pacientes AS pac
ON pac.Enderecos_id_endereco = edr.id_endereco
ORDER BY edr.id_endereco;


/*
18 (DÉCIMA OITAVA) CONSULTA
Listar nome, número de prontuario e data de nascimento de pacientes que nasceram entre 1940 1980.
*/

SELECT pac.nome, pac.data_nascimento, pac.num_prontuario
FROM Pacientes AS pac
WHERE pac.data_nascimento BETWEEN '1940-01-01' AND '1980-01-01'
ORDER BY pac.data_nascimento;


/*
19 (DÉCIMA NONA) CONSULTA
Lista dos hospitais localizados no bairro da Boa Vista, trazendo as colunas (bairro e hospital).
*/

SELECT edr.bairro 'Bairro', hsp.nome 'Hospital'
FROM Enderecos AS edr
	INNER JOIN Hospitais AS hsp ON hsp.Enderecos_id_endereco = edr.id_endereco
WHERE edr.bairro = 'Boa Vista';


/*
20 (VIGÉSIMA) CONSULTA
Lista dos telefones dos pacientes, trazendo as colunas (número telefone, nome paciente), ordenado por nome paciente.
*/

SELECT pac.nome 'Paciente', pac.Telefones_num_telefone 'Telefone'
FROM Telefones AS tel
	INNER JOIN Pacientes AS pac ON pac.Telefones_ddd = tel.ddd AND pac.Telefones_num_telefone = tel.num_telefone
ORDER BY pac.nome;


/*
21 (VIGÉSIMA PRIMEIRA) CONSULTA
Média salarial dos médicos que trabalham no Hospital Gilmarzito.
*/

SELECT AVG(med.salario) AS "Média Salarial"
FROM Medicos AS med
WHERE m.Hospitais_cnes = '7828463';


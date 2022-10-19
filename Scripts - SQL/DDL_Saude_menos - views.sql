-- VIEWS DE CONSULTAS NO BANCO DE DADOS - SAÚDE MENOS

/*
Listar as consultas realizadas entre Janeiro de 2020 e Outubro de 2022
trazendo as Datas das consultas, Prontuário do paciente, CPF, Nome e Sexo do Paciente
por ordem decrescente
*/

CREATE VIEW ConsultasPandemia AS
SELECT p.nome "Nome", p.cpf "CPF", p.num_prontuario "Nº Prontuário", p.sexo "Sexo", c.data_consulta "Data da Consulta"
	FROM Pacientes p
	INNER JOIN Consultas c ON p.num_prontuario =      c.Pacientes_num_prontuario
	WHERE c.data_consulta BETWEEN '2020-01-01 00:01' AND '2022-10-12'
		ORDER BY c.data_consulta DESC;

       
/*
Listar nome de pacientes e a quantidade de consultas realizadas por eles
trazendo as colunas num_prontuario, cpf, nome, sexo
ordenado pelo nome.
*/

CREATE VIEW QuantidadeConsultas AS
SELECT pac.num_prontuario "Nº Prontuário", pac.cpf "CPF", pac.nome "Nome", pac.sexo "Sexo", cst.data_consulta "Consulta", COUNT(cst.Pacientes_num_prontuario)
FROM Consultas AS cst
	INNER JOIN Pacientes AS pac
	ON pac.num_prontuario = cst.Pacientes_num_prontuario
WHERE cst.data_consulta IS NOT NULL
GROUP BY cst.Pacientes_num_prontuario, pac.num_prontuario, pac.cpf, pac.nome, pac.sexo, cst.data_consulta
ORDER BY pac.nome;


/*
Listar os medicos, juntamente com os hospitais que trabalham e a quantidade de pacientes atendidos
trazer as colunas nome (médico), nome (hospital)
ordene por Hospital. (2 join)
*/

CREATE VIEW QuantidadeAtendimento AS
SELECT m.nome AS medico_nome, h.nome AS hospital_nome, COUNT(c.Pacientes_num_prontuario) AS qtdProntuarios
FROM Hospitais AS h
	INNER JOIN Medicos AS m
	ON h.cnes = m.Hospitais_cnes
	INNER JOIN Consultas AS c
	ON m.cpf = c.Medicos_cpf
GROUP BY c.Pacientes_num_prontuario, m.nome, h.nome
ORDER BY COUNT(c.Pacientes_num_prontuario);


/*
Conte a quantidade de solicitações realizadas por dia
trazendo as colunas data (solicitação), nome do hospital e nome laboratório
ordene por hospital.
*/


CREATE VIEW SolicitacoespDia AS
SELECT COUNT(s.id_solicitacao) AS qtdSolicitacao, h.nome AS hospital_nome, l.nome AS laboratorio_nome
FROM Solicitacoes AS s
	INNER JOIN Hospitais AS h
	ON s.Hospitais_cnes = h.cnes
	INNER JOIN Laboratorios AS l
	ON s.Laboratorios_cnes = l.cnes
GROUP BY h.nome, l.nome
ORDER BY h.nome;


/*
Listar as especialidades contabilizando o número total de médicos por especialidade do hospital “xxxx”
trazendo as colunas total de médicos e especialidade.
*/


CREATE VIEW MedicospEspecialidade AS
SELECT COUNT(m.especialidade) AS medicos_especialistas, h.nome AS hospital_nome
FROM Medicos AS m
	INNER JOIN Hospitais AS h
	ON m.Hospitais_cnes = h.cnes
GROUP BY h.cnes
ORDER BY h.cnes;


/*
Listar nome, número de prontuario e data de nascimento de pacientes que nasceram entre 1940 1980.
*/

CREATE VIEW PacientesQuarentaMais AS
SELECT nome, data_nascimento, num_prontuario
FROM Pacientes
WHERE data_nascimento BETWEEN '1940-01-01' AND '1980-01-01'
ORDER BY data_nascimento;



/*
Lista dos telefones dos pacientes, trazendo as colunas (número telefone, nome paciente), ordenado por nome paciente.
*/

CREATE VIEW TelefonesPacientes AS
SELECT pac.nome 'Paciente', pac.Telefones_num_telefone 'Telefone'
FROM Telefones AS tel
	INNER JOIN Pacientes AS pac ON pac.Telefones_ddd = tel.ddd AND pac.Telefones_num_telefone = tel.num_telefone
ORDER BY pac.nome;


/*
Lista com os hospitais e seus respectivos endereços
*/

CREATE VIEW edrHsp AS
SELECT edr.cep "CEP", edr.bairro "Bairro", edr.cidade "Cidade", edr.estado "UF", hsp.nome "Hospital", hsp.cnes "CNES"
FROM Enderecos AS edr
RIGHT JOIN Hospitais AS hsp
	ON hsp.Enderecos_id_endereco = edr.id_endereco;



/*
Lista com os pacientes e seus respectivos endereços
*/

CREATE VIEW edrPac AS
SELECT edr.cep "CEP", edr.bairro "Bairro", edr.cidade "Cidade", edr.estado "UF", pac.nome "Nome", pac.cpf "CPF"
FROM Enderecos AS edr
RIGHT JOIN Pacientes AS pac
	ON pac.Enderecos_id_endereco = edr.id_endereco;

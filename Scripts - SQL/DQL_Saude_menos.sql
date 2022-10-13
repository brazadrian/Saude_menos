-- CONSULTAS NO BANCO DE DADOS - SAÚDE MENOS

/*
1 (PRIMEIRA) CONSULTA
Listar as consultas realizadas entre Janeiro de 2020 e Outubro de 2022
trazendo as Datas das consultas, Prontuário do paciente, CPF, Nome e Sexo do Paciente
por ordem decrescente
*/

SELECT p.nome "Nome", p.cpf "CPF", p.num_prontuario "Nº Prontuário", p.sexo "Sexo", c.data_consulta "Data da Consulta"
	FROM Pacientes p
	INNER JOIN Consultas c ON p.num_prontuario =      c.Pacientes_num_prontuario
	WHERE c.data_consulta BETWEEN '2020-01-01 00:01' AND '2022-10-12'
		ORDER BY c.data_consulta DESC;
        
/*
2 (SEGUNDA) CONSULTA
Listar os médicos que possuem nome iniciado com ”A”
trazendo as colunas cpf, crm, nome, especialidade e telefone
por ordem crescente.
*/

SELECT m.cpf, m.crm, m.nome, m.especialidade, t.num_telefone
	FROM Medicos as m
	INNER JOIN Telefones as t on m.Telefones_num_telefone = t.num_telefone
	WHERE m.nome like 'A%'
		ORDER BY m.nome;

/*
3 (TERCEIRA) CONSULTA
Listar os pacientes que são do bairro de Santo Antônio e possuem ao menos 1 exame realizado,
trazendo as colunas num_prontuario, cpf, nome, sexo e nome_exame
*/
-- colocar quantos exames eles fizeram (count)
SELECT p.num_prontuario, p.cpf, p.nome, p.sexo, ex.nome_exame
	FROM Pacientes as p 
	INNER JOIN Enderecos as e on e.id_endereco = p.Enderecos_id_endereco
	INNER JOIN Exames as ex on ex.Pacientes_num_prontuario = p.num_prontuario
		WHERE e.bairro = 'Santo Antônio';

/*
4 (QUARTA) CONSULTA
Listar nome de pacientes e a quantidade de consultas realizadas por eles
trazendo as colunas num_prontuario, cpf, nome, sexo
ordenado pelo nome.
*/

SELECT p.num_prontuario, p.cpf, p.nome, p.sexo, (SELECT COUNT(c.Pacientes_num_paciente) "Quantida de de consultas"
	FROM Consultas c WHERE c.Pacientes_num_prontuario = p.num_paciente) 
    FROM Pacientes as p
		ORDER BY p.nome;

SELECT p.num_prontuario, p.cpf, p.nome, p.sexo, (SELECT COUNT(c.Pacientes_num_paciente) "Quantida de de consultas"
	FROM Consultas c WHERE c.Pacientes_num_prontuario = p.num_paciente) 
    FROM Pacientes as p
		ORDER BY p.nome;

/*
5 (QUINTA) CONSULTA
Listar os médicos que ganham menos que a média salarial de todos os médicos cadastrados,
trazendo as colunas cpf, crm, nome, especialidade, salario e bairro 
ordenado por nome do médico.
*/

SELECT med.cpf "CPF", med.crm "CRM", med.nome "Nome", med.salario "Salário", e.bairro "Bairro"
	FROM medicos med
		INNER JOIN Enderecos e ON med.Enderecos_id_endereco = e.id_endereco
		HAVING salario < (SELECT AVG(salario) FROM Medicos)
			ORDER BY med.nome;

/*
6 (SEXTA) CONSULTA
Listar os médicos que ganham acima da média salarial de todos os médicos da especialidade clinica,
trazendo as colunas cpf, crm, nome, especialidade, salario e bairro
ordenado por nome do médico.
*/

SELECT med.cpf "CPF", med.crm "CRM", med.nome "Nome", med.salario "Salário", e.bairro "Bairro" FROM medicos med
	INNER JOIN Enderecos e ON med.Enderecos_id_endereco = e.id_endereco
	HAVING salario > (SELECT AVG(salario) FROM medicos)
		WHERE especialidade = "Clínico"
			ORDER BY med.nome;

/*
7 (SÉTIMA) CONSULTA
Listar nome de pacientes e a quantidade de exames realizadas por eles,
trazendo as colunas num_prontuario, cpf, nome, sexo e cidade
ordenado pelo nome.
*/
SELECT p.num_prontuario, p.cpf, p.nome, p.sexo, e.cidade, (SELECT COUNT(ex.Pacientes_num_paciente) FROM Exames ex WHERE ex.Pacientes_num_paciente = p.num_paciente) ”Quantidade de exames”
	FROM pacientes as p
	INNER JOIN endereco as e on e.id_endereco = p.Endereco_id_endereco
		GROUP BY p.nome
			ORDER BY p.nome;


/*
8 (OITAVA) CONSULTA
Informe a soma de consultas realizadas por dia, 
trazendo as colunas data_consulta, nome do médico, especialidade, sexo e email. (join)
*/


/*
9 (NONA) CONSULTA
Listar nome de pacientes que moram na mesma rua que o Hospital,
trazendo as colunas num_prontuario, nome_social, nome, id_diagnostico, cid_sigla e cid_cod
ordene por paciente. (2 join)
*/


/*
10 (DÉCIMA) CONSULTA
Listar a quantidade de casos de câncer e separar por sexo acometidos
trazendo as colunas sexo e nome_patologia
ordenar por ordem decrescente. (join)
*/


/*
11 (DÉCIMA PRIMEIRA) CONSULTA
Listar a quantidade das diferentes patologias registradas e separar por medicos envolvidos no tratamento
trazendo as colunas medicos e nome_patologia
ordenar por ordem crescente. (join)
*/


/*
12 (DÉCIMA SEGUNDA) CONSULTA
Listar os medicos, juntamente com os hospitais que trabalham e a quantidade de pacientes atendidos
trazer as colunas nome (médico), nome (hospital)
ordene por Hospital. (2 join)
*/

/*
13 (DÉCIMA TERCEIRA) CONSULTA
Informe a soma de solicitações realizadas por dia
trazendo as colunas data (solicitação), nome do hospital e nome laboratório
ordene por hospital. (2 join)
*/

/*
14 (DÉCIMA QUARTA) CONSULTA
Listar as especialidades contabilizando o número total de médicos por especialidade do hospital “xxxx”
trazendo as colunas total de médicos e especialidade. (join)
*/

/*
15 (DÉCIMA QUINTA) CONSULTA
Listar os pacientes cujo dd seja igual a “11”,
trazendo as colunas nome, num_telefone e cep
ordenar por nome. (2 join)
*/

SELECT p.nome, t.num_telefone, e.cep FROM pacientes as p 
	INNER JOIN Telefones as t on t.num_telefone = p.Telefones_num_telefone
	INNER JOIN Enderecos as e on e.id_endereco = p.Endereco_id_endereco
		WHERE t.ddd = ‘11’
ORDER BY p.nome;


/*
16 (DÉCIMA SEXTA) CONSULTA
Listar os pacientes que tem o sobrenome “Silva” e não realizaram nenhum exame,
trazendo as colunas num_prontuario, cpf, nome, nome_social e sexo.
*/

SELECT p.num_prontuario, p.cpf, p.nome, p.nome_social, p.sexo FROM paciente as p 
INNER JOIN Exames as ex ON ex.Pacientes_num_prontuario = p.num_prontuario
	WHERE ex.id_exame is null AND p.nome LIKE %Silva%;


/*
17 (DÉCIMA SÉTIMA) CONSULTA
*/



/*
18 (DÉCIMA OITAVA) CONSULTA
*/

/*
19 (DÉCIMA NONA) CONSULTA
*/

/*
20 (VIGÉSIMA) CONSULTA
*/´

















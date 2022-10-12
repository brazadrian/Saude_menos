USE `Saude_menos`;

SELECT
    p.num_prontuario,
    p.nome,
    p.nome_social,
    d.id_diagnostico,
    d.cid_sigla,
    d.cid_cod
FROM `Saude_menos`.`Pacientes` AS p
INNER JOIN `Saude_menos`.`Diagnosticos` AS d ON p.num_prontuario = d.Pacientes_num_prontuario;











SELECT p.nome "Nome", p.cpf "CPF", p.num_prontuario "Número do Prontuário", p.sexo "Sexo", c.data_consulta FROM Pacientes p
	INNER JOIN Consultas c ON p.num_prontuario =      c.Pacientes_num_prontuario
	WHERE c.data_consulta BETWEEN '2020-01-01' AND '2022-10-12'
	ORDER BY c.data_consulta DESC;
    
    
    
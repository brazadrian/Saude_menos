/*
9 (NONA) CONSULTA
Listar nome de pacientes que moram no mesmo bairro que o Hospital,
trazendo as colunas num_prontuario, nome_social, nome, id_diagnostico, cid_sigla e cid_cod
ordene por paciente. (2 join)
*/

SELECT *
FROM Enderecos, Pacientes -- , Hospitais
WHERE ;


SELECT *
FROM Hospitais AS hsp, Pacientes AS pac, Hospitais AS hsp
WHERE
	(SELECT edr.bairro
	FROM Enderecos AS edr
		INNER JOIN Hospitais AS edrHosp
		ON hsp.Enderecos_id_endereco = edr.id_endereco
        LIMIT 1
    )
    =
    (
    SELECT edr.bairro 
	FROM Enderecos AS edr 
		INNER JOIN Pacientes AS pac
		ON pac.Enderecos_id_endereco = edr.id_endereco
        LIMIT 1
    );
    

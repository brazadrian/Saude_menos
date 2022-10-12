USE `Saude_menos`;

CREATE  OR REPLACE VIEW `view_enfermos` AS
SELECT
    num_prontuario,
    nome,
    nome_social,
    id_diagnostico,
    cid_sigla,
    cid_cod,
    exists
    
FROM
     `Saude_menos`.`Pacientes` AS p
LEFT JOIN `Saude_menos`.`Diagnosticos` AS d ON p.num_prontuario = d.Pacientes_num_prontuario;

SELECT pac.nome, pac.data_nascimento, DATEDIFF(NOW(), data_nascimento)
FROM Pacientes AS pac;

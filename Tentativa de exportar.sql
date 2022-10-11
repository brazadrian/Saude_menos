use saude_menos;

SELECT * FROM `saude_menos`.`hospitais`
	INTO OUTFILE 'arquivo.csv'
		FIELDS TERMINATED BY '|'
			ENCLOSED BY '"'
				LINES TERMINATED BY '\n';

\copy staging_table (iddeparment, namedeparment, idmunicipality, namemunicipality)
FROM '/home/camper/Documentos/oscar/PostgresqlCountries/localidades.csv'
DELIMITER ','
CSV HEADER;

INSERT INTO country("id","name") VALUES (1,'Colombia');

DELETE FROM staging_table
WHERE iddeparment IS NULL OR namedeparment IS NULL;


-- Insert data into deparment table;
INSERT INTO deparment(id,name)
SELECT DISTINCT iddeparment, namedeparment
FROM staging_table;


-- Insert data into municipality table;
INSERT INTO municipality(id,name,iddeparment)
SELECT DISTINCT ON (idmunicipality) idmunicipality, namemunicipality,iddeparment
FROM staging_table;


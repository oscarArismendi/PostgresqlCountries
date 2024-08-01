
DROP DATABASE IF EXISTS world;
CREATE DATABASE world;
\c world;

CREATE TABLE country (
id serial,
name varchar(50),
CONSTRAINT country_pk PRIMARY KEY (id)
);

CREATE TABLE deparment (
id serial,
name varchar(50),
idcountry integer DEFAULT 1,
CONSTRAINT deparment_pk PRIMARY KEY (id),
CONSTRAINT fk_departament_country FOREIGN KEY (idcountry) REFERENCES country(id)
);

CREATE TABLE municipality (
id serial,
name varchar(50),
iddeparment integer,
CONSTRAINT municipality_pk PRIMARY KEY (id),
CONSTRAINT fk_municipality_departament FOREIGN KEY (iddeparment) REFERENCES deparment(id)
);


CREATE TABLE staging_table (
    iddeparment integer,
    namedeparment VARCHAR,
    idmunicipality integer,
    namemunicipality VARCHAR
);

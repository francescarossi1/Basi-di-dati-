-- punto1 
CREATE DATABASE IF NOT EXISTS universita;
USE universita;

CREATE TABLE studente (
  nome            VARCHAR(50) NOT NULL,
  numero_studente INT PRIMARY KEY,
  anno_corso      TINYINT NOT NULL,
  corso_laurea    VARCHAR(10) NOT NULL
);

CREATE TABLE insegnamento (
  nome_insegnamento   VARCHAR(100) NOT NULL,
  codice_insegnamento VARCHAR(10) PRIMARY KEY,
  ore                 TINYINT NOT NULL,
  dipartimento        VARCHAR(10) NOT NULL
);

CREATE TABLE modulo (
  identificatore_modulo INT PRIMARY KEY,
  codice_insegnamento   VARCHAR(10) NOT NULL,
  semestre              VARCHAR(20) NOT NULL,
  anno                  YEAR NOT NULL,
  docente               VARCHAR(50) NOT NULL,
  FOREIGN KEY (codice_insegnamento) REFERENCES insegnamento(codice_insegnamento)
);

CREATE TABLE votazione (
  numero_studente       INT,
  identificatore_modulo INT,
  voto                  CHAR(1) NOT NULL,
  PRIMARY KEY (numero_studente, identificatore_modulo),
  FOREIGN KEY (numero_studente) REFERENCES studente(numero_studente),
  FOREIGN KEY (identificatore_modulo) REFERENCES modulo(identificatore_modulo)
);

CREATE TABLE propedeuticita (
  codice_insegnamento  VARCHAR(10),
  codice_propedeuticita VARCHAR(10),
  PRIMARY KEY (codice_insegnamento, codice_propedeuticita),
  FOREIGN KEY (codice_insegnamento)   REFERENCES insegnamento(codice_insegnamento),
  FOREIGN KEY (codice_propedeuticita) REFERENCES insegnamento(codice_insegnamento)
);

-- punto2
INSERT INTO studente VALUES ('Smith',17,1,'CS'), ('Brown',8,2,'CS');

INSERT INTO insegnamento VALUES
 ('Introduzione all''informatica','CS1310',4,'CS'),
 ('Struttura dei dati','CS3320',4,'CS'),
 ('Matematica discreta','MATH2410',3,'MATH'),
 ('Basi di dati','CS3380',3,'CS');

INSERT INTO modulo VALUES
 (85,'MATH2410','Autunno',2004,'King'),
 (92,'CS1310','Autunno',2004,'Anderson'),
 (102,'CS3320','Primavera',2005,'Knuth'),
 (112,'MATH2410','Autunno',2005,'Chang'),
 (119,'CS1310','Autunno',2005,'Anderson'),
 (135,'CS3380','Autunno',2005,'Stone');

INSERT INTO votazione VALUES
 (17,112,'B'),(17,119,'C'),(8,85,'A'),(8,92,'A'),(8,102,'B'),(8,135,'A');

INSERT INTO propedeuticita VALUES
 ('CS3380','CS3320'),('CS3380','MATH2410'),('CS3320','CS1310');

-- punto 3
DELETE FROM votazione;
DELETE FROM propedeuticita;
DELETE FROM modulo;
DELETE FROM insegnamento;
DELETE FROM studente;

LOAD DATA LOCAL INFILE 'C:/percorso/es02_dati_csv/studente.csv'
INTO TABLE studente
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nome, numero_studente, anno_corso, corso_laurea);

LOAD DATA LOCAL INFILE 'C:/percorso/es02_dati_csv/insegnamento.csv'
INTO TABLE insegnamento
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nome_insegnamento, codice_insegnamento, ore, dipartimento);

LOAD DATA LOCAL INFILE 'C:/percorso/es02_dati_csv/modulo.csv'
INTO TABLE modulo
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(identificatore_modulo, codice_insegnamento, semestre, @anno, docente)
SET anno = 2000 + @anno;

LOAD DATA LOCAL INFILE 'C:/percorso/es02_dati_csv/votazione.csv'
INTO TABLE votazione
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(numero_studente, identificatore_modulo, voto);

LOAD DATA LOCAL INFILE 'C:/percorso/es02_dati_csv/propedeuticita.csv'
INTO TABLE propedeuticita
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(codice_insegnamento, codice_propedeuticita);
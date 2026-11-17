CREATE SCHEMA IF NOT EXISTS universita;
USE universita;

CREATE TABLE IF NOT EXISTS studente (
    nome            VARCHAR(30) NOT NULL,
    numero_studente INTEGER     NOT NULL,
    anno_corso      INTEGER     NOT NULL,
    corso_laurea    VARCHAR(10) NOT NULL,
    PRIMARY KEY (numero_studente)
);

CREATE TABLE IF NOT EXISTS insegnamento (
    nome_insegnamento   VARCHAR(50) NOT NULL,
    codice_insegnamento VARCHAR(10) NOT NULL,
    ore                 INTEGER     NOT NULL,
    dipartimento        VARCHAR(10) NOT NULL,
    PRIMARY KEY (codice_insegnamento)
);

CREATE TABLE IF NOT EXISTS modulo (
    identificatore_modulo INTEGER     NOT NULL,
    codice_insegnamento   VARCHAR(10) NOT NULL,
    semestre              VARCHAR(10) NOT NULL,
    anno                  INTEGER     NOT NULL,
    docente               VARCHAR(30) NOT NULL,
    PRIMARY KEY (identificatore_modulo),
    FOREIGN KEY (codice_insegnamento) REFERENCES insegnamento(codice_insegnamento)
);

CREATE TABLE IF NOT EXISTS votazione (
    numero_studente       INTEGER NOT NULL,
    identificatore_modulo INTEGER NOT NULL,
    voto                  CHAR(1) NOT NULL,
    PRIMARY KEY (numero_studente, identificatore_modulo),
    FOREIGN KEY (numero_studente)       REFERENCES studente(numero_studente),
    FOREIGN KEY (identificatore_modulo) REFERENCES modulo(identificatore_modulo)
);

CREATE TABLE IF NOT EXISTS propedeuticita (
    codice_insegnamento   VARCHAR(10) NOT NULL,
    codice_propedeuticita VARCHAR(10) NOT NULL,
    PRIMARY KEY (codice_insegnamento, codice_propedeuticita),
    FOREIGN KEY (codice_insegnamento)   REFERENCES insegnamento(codice_insegnamento),
    FOREIGN KEY (codice_propedeuticita) REFERENCES insegnamento(codice_insegnamento)
);

INSERT INTO studente VALUES ('Smith',17,1,'CS'),('Brown',8,2,'CS');
INSERT INTO insegnamento VALUES ('Introduzione all''informatica','CS1310',4,'CS'),('Struttura dei dati','CS3320',4,'CS'),('Matematica discreta','MATH2410',3,'MATH'),('Basi di dati','CS3380',3,'CS');
INSERT INTO modulo VALUES (85,'MATH2410','Autunno',2004,'King'),(92,'CS1310','Autunno',2004,'Anderson'),(102,'CS3320','Primavera',2005,'Knuth'),(112,'MATH2410','Autunno',2005,'Chang'),(119,'CS1310','Autunno',2005,'Anderson'),(135,'CS3380','Autunno',2005,'Stone');
INSERT INTO votazione VALUES (17,112,'B'),(17,119,'C'),(8,85,'A'),(8,92,'A'),(8,102,'B'),(8,135,'A');
INSERT INTO propedeuticita VALUES ('CS3380','CS3320'),('CS3380','MATH2410'),('CS3320','CS1310');
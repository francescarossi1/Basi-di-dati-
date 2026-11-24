DROP DATABASE IF EXISTS poste;
CREATE DATABASE poste;
USE poste;

-- Schema
CREATE TABLE clienti (
  codfisc   CHAR(16)    PRIMARY KEY,
  nome      VARCHAR(30),
  cognome   VARCHAR(30),
  indirizzo VARCHAR(60) NOT NULL,
  telefono  VARCHAR(15),
  CHECK (CHAR_LENGTH(codfisc) = 16)
);

CREATE TABLE uffici (
  nome      VARCHAR(30) PRIMARY KEY,
  citta     VARCHAR(30),
  indirizzo VARCHAR(60)
);

CREATE TABLE pacchetti (
  id              INT           PRIMARY KEY,
  cf_mittente     CHAR(16)      NOT NULL,
  indirizzo_dest  VARCHAR(60)   NOT NULL,
  tracking_number INT           NOT NULL UNIQUE,
  peso            DECIMAL(6,2)  CHECK (peso > 0),
  ufficio         VARCHAR(30),
  FOREIGN KEY (cf_mittente) REFERENCES clienti(codfisc)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (ufficio) REFERENCES uffici(nome)
    ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE impiegati (
  cf                 CHAR(16)    PRIMARY KEY,
  nome               VARCHAR(30),
  cognome            VARCHAR(30),
  data_inizio_lavoro DATE,
  salario            INT,
  ufficio            VARCHAR(30),
  CHECK (CHAR_LENGTH(cf) = 16),
  FOREIGN KEY (ufficio) REFERENCES uffici(nome)
    ON DELETE SET NULL ON UPDATE CASCADE
);

-- Dati
INSERT INTO clienti VALUES
  ('FRRLCI01T55F385O','Anna','Rossi','Via Spade 5',NULL),
  ('CMNECI01T55F385P','Barbara','Franchi','Via Roma 15','3320562983'),
  ('STYLCI11F15F435W','Claudio','Marchi','Via Napoli 13',NULL),
  ('PPRLAI91Y15F435S','Daniele','Bianchi','Via Cartoni 23','3399578634');

INSERT INTO uffici VALUES
  ('PostOne','Milano','Via Cigni 12'),
  ('PosteVeloci','Milano','Via Pesci 25'),
  ('SuperPoste','Ferrara','Via Aquila 1'),
  ('PostaLenta','Bologna','Via Lumaca 3');

INSERT INTO pacchetti VALUES
  (1,'FRRLCI01T55F385O','Via della Torre 12',1345, 4.56,'PostOne'),
  (2,'FRRLCI01T55F385O','Via Sasso 45',     1990, 2.45,'PosteVeloci'),
  (3,'CMNECI01T55F385P','Via Rossini 3',    2346,13.56,'PostOne'),
  (4,'STYLCI11F15F435W','Via Gatti 44',     2347,33.56,'PostOne'),
  (5,'CMNECI01T55F385P','Via Blu 31',       2348, 1.00,'PosteVeloci'),
  (6,'CMNECI01T55F385P','Via Arancia 77',   2333,15.00,'PostOne'),
  (7,'STYLCI11F15F435W','Via Verde 8',      2350, 6.20, NULL);

INSERT INTO impiegati VALUES
  ('FRRLCI01T55F398O','Anna','Ricci','2021-05-12',20000,'PostOne'),
  ('ANNKCI01T55F398F','Laura','Neri','2020-07-15',30000,'PostOne'),
  ('LVIRCR03S55F398O','Riccardo','Livi','2021-05-18',60000,'PosteVeloci'),
  ('PPRLAI91Y15F435S','Daniele','Bianchi','2022-08-02',25000,'SuperPoste'),
  ('VRDGLI95M41F205Z','Giulia','Verdi','2023-01-09',28000,NULL);

CREATE TABLE DIPENDENTE (
  CodiceFiscale  CHAR(16)       NOT NULL,
  Nome           VARCHAR(30)    NOT NULL,
  Cognome        VARCHAR(30)    NOT NULL,
  DataNascita    DATE           NOT NULL,
  Indirizzo      VARCHAR(100),
  Sesso          CHAR(1)        NOT NULL,
  Stipendio      DECIMAL(10,2)  NOT NULL,
  CF_supervisore CHAR(16),
  N_dip          INT            NOT NULL,
  CONSTRAINT pk_dipendente PRIMARY KEY (CodiceFiscale),
  CONSTRAINT fk_dip_supervisore FOREIGN KEY (CF_supervisore)
    REFERENCES DIPENDENTE(CodiceFiscale) ON DELETE SET NULL,
  CONSTRAINT chk_sesso CHECK (Sesso IN ('M','F')),
  CONSTRAINT chk_stipendio CHECK (Stipendio >= 0)
);




CREATE TABLE DIPARTIMENTO (
  Nome_dip     VARCHAR(30) NOT NULL,
  Numero_dip   INT         NOT NULL,
  CF_direttore CHAR(16),
  Data_inizio  DATE,
  CONSTRAINT pk_dipartimento PRIMARY KEY (Numero_dip),
  CONSTRAINT uq_nome_dip UNIQUE (Nome_dip),
  CONSTRAINT fk_dipart_direttore FOREIGN KEY (CF_direttore)
    REFERENCES DIPENDENTE(CodiceFiscale) ON DELETE SET NULL
);

CREATE TABLE SEDI_DIPARTIMENTO (
  Numero_dip INT         NOT NULL,
  Sede       VARCHAR(50) NOT NULL,
  CONSTRAINT pk_sedi PRIMARY KEY (Numero_dip, Sede),
  CONSTRAINT fk_sedi_dipart FOREIGN KEY (Numero_dip)
    REFERENCES DIPARTIMENTO(Numero_dip) ON DELETE CASCADE
);
CREATE TABLE PROGETTO (
  Nome_progetto   VARCHAR(30) NOT NULL,
  Numero_progetto INT         NOT NULL,
  Luogo           VARCHAR(50),
  Numero_dip      INT         NOT NULL,
  CONSTRAINT pk_progetto PRIMARY KEY (Numero_progetto),
  CONSTRAINT uq_nome_progetto UNIQUE (Nome_progetto),
  CONSTRAINT fk_prog_dipart FOREIGN KEY (Numero_dip)
    REFERENCES DIPARTIMENTO(Numero_dip) ON DELETE RESTRICT
);

CREATE TABLE LAVORA_SU (
  CF_dipendente   CHAR(16)     NOT NULL,
  Numero_progetto INT          NOT NULL,
  Ore             DECIMAL(4,1) NOT NULL,
  CONSTRAINT pk_lavora_su PRIMARY KEY (CF_dipendente, Numero_progetto),
  CONSTRAINT fk_lavora_dip FOREIGN KEY (CF_dipendente)
    REFERENCES DIPENDENTE(CodiceFiscale) ON DELETE CASCADE,
  CONSTRAINT fk_lavora_prog FOREIGN KEY (Numero_progetto)
    REFERENCES PROGETTO(Numero_progetto) ON DELETE CASCADE,
  CONSTRAINT chk_ore CHECK (Ore >= 0)
);

CREATE TABLE PARENTE (
  CF_dipendente CHAR(16)    NOT NULL,
  Nome_parente  VARCHAR(30) NOT NULL,
  Sesso         CHAR(1)     NOT NULL,
  DataNascita   DATE,
  Relazione     VARCHAR(20) NOT NULL,
  CONSTRAINT pk_parente PRIMARY KEY (CF_dipendente, Nome_parente),
  CONSTRAINT fk_parente_dip FOREIGN KEY (CF_dipendente)
    REFERENCES DIPENDENTE(CodiceFiscale) ON DELETE CASCADE,
  CONSTRAINT chk_sesso_parente CHECK (Sesso IN ('M','F'))
);

ALTER TABLE DIPENDENTE
  ADD CONSTRAINT fk_dip_dipartimento FOREIGN KEY (N_dip)
    REFERENCES DIPARTIMENTO(Numero_dip) ON DELETE RESTRICT;
    
SHOW TABLES;

INSERT INTO DIPARTIMENTO (Nome_dip, Numero_dip, CF_direttore, Data_inizio)
VALUES ('Direzione', 1, NULL, '2020-01-01');

INSERT INTO DIPENDENTE
  (CodiceFiscale, Nome, Cognome, DataNascita, Indirizzo, Sesso,
   Stipendio, CF_supervisore, N_dip)
VALUES
  ('RSSMRA70A01H501Z', 'Mario', 'Rossi', '1970-01-01',
   'Via Roma 1, Padova', 'M', 50000.00, NULL, 1);

UPDATE DIPARTIMENTO
   SET CF_direttore = 'RSSMRA70A01H501Z'
 WHERE Numero_dip = 1;

SELECT * FROM DIPARTIMENTO;
SELECT * FROM DIPENDENTE;
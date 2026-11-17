-- Dati di test aggiuntivi per l'Esercitazione 2 (da eseguire DOPO i dati di base, MySQL 8)
-- Ordine imposto dalle chiavi esterne: prima le tabelle riferite.
INSERT INTO studente (nome, numero_studente, anno_corso, Corso_laurea) VALUES
    ('Rossi',   31, 3, 'CS'),
    ('Bianchi', 42, 1, 'MATH'),
    ('Neri',    55, 2, 'CS');

INSERT INTO insegnamento (nome_insegnamento, codice_insegnamento, ore, dipartimento) VALUES
    ('Sistemi operativi',  'CS3350',   4, 'CS'),
    ('Analisi matematica', 'MATH1210', 5, 'MATH');

INSERT INTO modulo (identificatore_modulo, codice_insegnamento, semestre, anno, docente) VALUES
    (150, 'CS1310',   'Primavera', 2005, 'King'),
    (155, 'CS3320',   'Autunno',   2006, 'King'),
    (160, 'MATH2410', 'Primavera', 2006, 'Chang'),
    (165, 'CS3350',   'Autunno',   2005, 'Stone');

INSERT INTO votazione (numero_studente, identificatore_modulo, voto) VALUES
    (31, 85,  'B'),
    (31, 92,  'A'),
    (31, 150, 'C'),
    (42, 112, 'A'),
    (55, 150, 'A'),
    (55, 119, 'B'),
    (55, 102, 'C');

INSERT INTO propedeuticita (codice_insegnamento, codice_propedeuticita) VALUES
    ('CS3350',   'CS3320'),
    ('CS3320',   'MATH2410'),
    ('MATH2410', 'MATH1210');

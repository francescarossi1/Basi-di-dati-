-- 1
SELECT nome
FROM studente
WHERE corso_laurea = 'CS';
-- Atteso: Smith, Brown

-- 2
SELECT codice_insegnamento, nome_insegnamento
FROM insegnamento
WHERE dipartimento = 'CS' AND ore >= 4;

-- 3
SELECT DISTINCT docente
FROM modulo;

-- 4
SELECT DISTINCT i.nome_insegnamento
FROM modulo m
JOIN insegnamento i ON i.codice_insegnamento = m.codice_insegnamento
WHERE m.docente = 'King'
  AND m.anno BETWEEN 2004 AND 2005;

-- 5
SELECT m.codice_insegnamento, m.semestre, m.anno, s.nome, v.voto
FROM votazione v
JOIN modulo m   ON m.identificatore_modulo = v.identificatore_modulo
JOIN studente s ON s.numero_studente = v.numero_studente
WHERE m.docente = 'King';

-- 6
SELECT DISTINCT i.codice_insegnamento, i.nome_insegnamento
FROM insegnamento i
JOIN modulo m    ON m.codice_insegnamento = i.codice_insegnamento
JOIN votazione v ON v.identificatore_modulo = m.identificatore_modulo;

-- 7
SELECT s.nome, i.nome_insegnamento, i.codice_insegnamento,
       m.semestre, m.anno, v.voto
FROM studente s
JOIN votazione v    ON v.numero_studente = s.numero_studente
JOIN modulo m       ON m.identificatore_modulo = v.identificatore_modulo
JOIN insegnamento i ON i.codice_insegnamento = m.codice_insegnamento
WHERE s.corso_laurea = 'CS'
ORDER BY s.nome, m.anno, m.semestre;

-- 8
SELECT m1.codice_insegnamento,
       m1.identificatore_modulo AS modulo1,
       m2.identificatore_modulo AS modulo2,
       m1.docente AS docente1,
       m2.docente AS docente2
FROM modulo m1
JOIN modulo m2 ON m1.codice_insegnamento = m2.codice_insegnamento
              AND m1.identificatore_modulo < m2.identificatore_modulo;

-- 9
SELECT p1.codice_propedeuticita AS codice_intermedio,
       i1.nome_insegnamento     AS nome_intermedio,
       p2.codice_propedeuticita AS codice_secondo_livello,
       i2.nome_insegnamento     AS nome_secondo_livello
FROM propedeuticita p1
JOIN propedeuticita p2 ON p2.codice_insegnamento = p1.codice_propedeuticita
JOIN insegnamento i1   ON i1.codice_insegnamento = p1.codice_propedeuticita
JOIN insegnamento i2   ON i2.codice_insegnamento = p2.codice_propedeuticita
WHERE p1.codice_insegnamento = 'CS3380';
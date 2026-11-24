USE poste;

-- 1
-- Per ogni pacchetto, mostra il tracking number e il nome e la città dell'ufficio di partenza.
SELECT p.tracking_number, u.nome, u.citta
FROM pacchetti p
JOIN uffici u ON p.ufficio = u.nome;


-- 2
-- Mostra codice fiscale, nome e cognome dei clienti, con tracking number e peso dei loro 
-- pacchetti e i dati dell'ufficio di partenza.
SELECT c.codfisc, c.nome, c.cognome, p.peso, p.tracking_number, u.nome
FROM clienti c
JOIN pacchetti p ON p.cf_mittente = c.codfisc
JOIN uffici u ON u.nome = p.ufficio;


-- 3 
-- Mostra nome e cognome degli impiegati che lavorano nella stessa città dell'ufficio da cui è 
-- partito il pacchetto con tracking number 1990.
SELECT i.nome, i.cognome
FROM pacchetti p
JOIN uffici up ON up.nome = p.ufficio
JOIN uffici uc ON uc.citta = up.citta
JOIN impiegati i ON i.ufficio = uc.nome
WHERE p.tracking_number = 1990;


-- 4
-- Mostra nome, cognome e salario degli impiegati che guadagnano più di Daniele Baldi.
SELECT i.nome, i.cognome, i.salario
FROM impiegati i
JOIN impiegati im ON i.salario > im.salario
WHERE im.nome = "Daniele" AND im.cognome = "Bianchi";


-- 5 
-- Riscrivi la query 1 con NATURAL JOIN. Quante righe ti aspetti? Cosa ottieni?
SELECT tracking_number, nome, citta
FROM pacchetti
NATURAL JOIN uffici;
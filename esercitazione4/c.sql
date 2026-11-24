USE poste;

-- 10 
-- Mostra tutti gli uffici con il tracking number dei pacchetti partiti da lì. Gli uffici 
-- senza pacchetti devono comparire comunque.
SELECT u.nome AS ufficio, p.tracking_number
FROM uffici u
LEFT JOIN pacchetti p ON p.ufficio = u.nome;


-- 11
-- Mostra tutti i clienti e, se il cliente è anche un impiegato, l&#39;ufficio in cui lavora.
SELECT c.codfisc, c.nome, c.cognome, i.ufficio
FROM clienti c
LEFT JOIN impiegati i ON i.cf = c.codfisc;


-- 12 
-- Mostra tutti i clienti, con il tracking number dei loro pacchetti più pesanti di 5 kg, se ci sono.
SELECT c.nome, c.cognome, p.tracking_number
FROM clienti c
LEFT JOIN pacchetti p ON p.cf_mittente = c.codfisc
WHERE p.peso > 5;


-- 13
-- Mostra tutti gli impiegati con il nome del loro ufficio, anche quelli che non ne hanno uno.
SELECT i.nome, i.cognome, u.nome AS ufficio
FROM impiegati i
LEFT JOIN uffici u ON i.ufficio = u.nome;


-- 14
-- Mostra tutti i pacchetti e tutti gli uffici, abbinando ogni pacchetto al suo ufficio quando c'è, e
-- includendo sia i pacchetti senza ufficio sia gli uffici senza pacchetti. MySQL non ha FULL OUTER
-- JOIN: simulalo con una UNION.
SELECT p.tracking_number, u.nome AS ufficio
FROM pacchetti p
LEFT JOIN uffici u ON p.ufficio = u.nome
UNION
SELECT p.tracking_number, u.nome AS ufficio
FROM pacchetti p
RIGHT JOIN uffici u ON p.ufficio = u.nome;
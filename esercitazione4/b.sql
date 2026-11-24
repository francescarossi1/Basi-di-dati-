USE poste;

-- 6 
-- Mostra i clienti senza telefono. Prova prima con telefono = NULL, spiega il risultato, poi correggi.
-- SELECT * FROM Clienti WHERE telefono = NULL;   errore
SELECT * FROM clienti WHERE telefono IS NULL;


-- 7
-- Mostra i clienti il cui telefono è diverso da 3320562983
SELECT * FROM clienti WHERE telefono != '3320562983'  OR telefono is NULL;


-- 8 
-- Mostra gli impiegati che non lavorano in un ufficio di Milano, con NOT IN. Manca qualcuno? Se si correggi.
SELECT * FROM impiegati WHERE ufficio NOT IN (SELECT nome FROM uffici WHERE citta = "Milano");


-- 9 
-- Mostra gli uffici in cui non lavora nessun impiegato. Scrivi due versioni, con NOT IN e con NOT
-- EXISTS: Danno risultati diversi?
SELECT * FROM uffici WHERE nome NOT IN (SELECT ufficio FROM impiegati); -- 0 righe

SELECT * FROM uffici u WHERE NOT EXISTS (SELECT * FROM impiegati i WHERE i.ufficio = u.nome)  -- 1 riga: PostaLenta  
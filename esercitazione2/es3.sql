USE universita;

-- 1. Inserisci lo studente <Johnson, 25, 1, MATH>
INSERT INTO studente (nome, numero_studente, anno_corso, corso_laurea) VALUES ('Johnson', 25, 1, 'MATH');
-- Successo, la matricola 25 non esiste nel db


-- 2 Porta a 2 l&#39;anno di corso dello studente Smith. Quante righe cambierebbero se esistessero due
-- Smith?
UPDATE studente
SET anno_corso = 2
WHERE nome = 'Smith';
-- Successo: una riga modificata. Se esistessero due nomi smith si modificherebbero entrambi.
-- Per modificare effettivamente solo quello studente dovremo sceglierlo tramite numero_studente


-- 3. Inserisci l'insegnamento <Ingegneria della conoscenza, CS4390, 3, CS>
INSERT INTO insegnamento (nome_insegnamento, codice_insegnamento, ore, dipartimento) VALUES ("Ingegneria della conoscenza", "CS4390", 3, "CS");
-- Successo, non esiste un altro codice CS4390 nel DESCRIBE


-- 4. Elimina lo studente Smith con numero 17
DELETE FROM studente WHERE numero_studente = 17;
-- Errore 1451 chiave esterna. Nella tabella votazione ci sono delle referenze allo studente con matricola 17
-- Dovremo prima eliminare lo studente con matricola 17 dalla tabella votazione
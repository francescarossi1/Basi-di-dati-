-- E1. "Elenca i programmi a cui partecipa Marta Fumagalli"
SELECT nome
FROM   programmi
WHERE  codice IN (SELECT cod_programma
                  FROM   artisti
                  WHERE  nome_artista = 'Marta Fumagalli');

-- E2. "Elenca i programmi in cui lavora Marta Fumagalli oppure che hanno almeno
--      un sondaggio con share superiore a 17. Ogni programma deve comparire
--      una sola volta."
SELECT p.nome
FROM   programmi p, artisti a
WHERE  a.cod_programma = p.codice AND a.nome_artista = 'Marta Fumagalli'
UNION
SELECT p.nome
FROM   programmi p, sondaggi s
WHERE  s.cod_programma = p.codice AND s.share > 17;

-- E3. "Elenca i programmi che non hanno nessun artista"
SELECT p.nome
FROM   programmi p
WHERE  NOT EXISTS (SELECT * 
                   FROM   artisti a 
                   WHERE  a.cod_programma = p.codice);

-- E4. "Elenca i sondaggi con uno share piu' alto di tutti quelli del programma P22"
SELECT cod_programma, data_rilevazione, share
FROM   sondaggi
WHERE  EXISTS (SELECT share FROM sondaggi WHERE cod_programma = 'P22')
  OR  share > ALL (SELECT share
                    FROM   sondaggi
                    WHERE  cod_programma = 'P22');
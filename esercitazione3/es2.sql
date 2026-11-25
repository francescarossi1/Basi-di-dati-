use palinsesto;

-- 1. Artisti che partecipano a programmi di tipologia Quiz o Musicale. Un artista compare una volta per
-- ogni programma in cui lavora.
select nome_artista, cod_programma
from artisti
where exists (
    select *
    from programmi
    where programmi.codice = artisti.cod_programma
      and tipologia = 'Quiz'
)
union
select nome_artista, cod_programma
from artisti
where exists (
    select *
    from programmi
    where programmi.codice = artisti.cod_programma
      and tipologia = 'Musicale'
);

-- 2 Codici dei programmi che compaiono o in artisti o in sondaggi.
select cod_programma
from artisti
union
select cod_programma
from sondaggi;

select cod_programma
from artisti
union all
select cod_programma
from sondaggi;


-- 3. Quali artisti lavorano sia per Rete1 sia per Canale9?
select nome_artista
from artisti
where exists (
    select *
    from programmi
    where programmi.codice = artisti.cod_programma
      and rete = 'Rete1'
)
intersect
select nome_artista
from artisti
where exists (
    select *
    from programmi
    where programmi.codice = artisti.cod_programma
      and rete = 'Canale9'
);

-- 4. Quali artisti lavorano per Rete1 ma non per Canale9?
select nome_artista
from artisti
where exists (
    select *
    from programmi
    where programmi.codice = artisti.cod_programma
      and rete = 'Rete1'
)
except
select nome_artista
from artisti
where exists (
    select *
    from programmi
    where programmi.codice = artisti.cod_programma
      and rete = 'Canale9'
);

-- 5. Quali programmi non hanno nessun sondaggio?
select codice, nome
from programmi
where not exists (
    select *
    from sondaggi
    where sondaggi.cod_programma = programmi.codice
);

-- 6. Quali programmi hanno almeno due artisti?
select codice, nome
from programmi
where exists (
    select *
    from artisti a1
    where a1.cod_programma = programmi.codice
      and exists (
          select *
          from artisti a2
          where a2.cod_programma = programmi.codice
            and a2.nome_artista <> a1.nome_artista
      )
);

-- 7. Trova i sondaggi con uno share più alto di tutti i sondaggi del programma P03.
select cod_programma, data_rilevazione, spettatori, share
from sondaggi
where share > all (
    select share
    from sondaggi
    where cod_programma = 'P03'
);

-- 8. Trova il sondaggio con più spettatori e mostra il nome del programma e la data. Se più sondaggi
-- hanno lo stesso numero massimo di spettatori, mostrali tutti.
select (
    select nome
    from programmi
    where programmi.codice = sondaggi.cod_programma
) as nome_programma, data_rilevazione
from sondaggi
where spettatori = (
    select max(spettatori)
    from sondaggi
);

-- 9. Quali artisti lavorano in tutti i programmi di Rete1?
where not exists (
    select *
    from programmi p
    where p.rete = 'Rete1'
      and not exists (
          select *
          from artisti a2
          where a2.nome_artista = a.nome_artista
            and a2.cod_programma = p.codice
      )
);
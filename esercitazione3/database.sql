create schema palinsesto;
USE palinsesto;

create table programmi (
	codice varchar(10)  	NOT NULL,
    nome   varchar(128) 	NOT NULL,
    rete   varchar(64)  	NOT NULL,
    tipologia varchar(64) 	NOT NULL,
    primary key (codice)
);

create table artisti (
	cod_programma varchar(10) not null,
    nome_artista varchar(128) not null,
    primary key (nome_artista, cod_programma),
    foreign key (cod_programma) references programmi(codice) on delete cascade on update cascade
);

create table sondaggi (
	cod_programma varchar(10) not null,
    data_rilevazione date not null,
    spettatori  integer not null,
    share decimal(4,1) not null,
    primary key (data_rilevazione),
    check (spettatori > 0),
    check (share between 0 and 100),
    foreign key (cod_programma) references programmi(codice) on delete cascade on update cascade
);
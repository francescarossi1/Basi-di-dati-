USE palinsesto;

INSERT INTO programmi VALUES
 ('P01','Il Salotto di Sera','Rete3','Talk show'),
 ('P02','Cucina Sotto Pressione','Canale9','Cooking'),
 ('P03','Quiz Binario','Rete1','Quiz'),
 ('P05','Notte Nera','Rete2','Fiction'),
 ('P11','Festival della Canzone Inutile','Rete1','Musicale'),
 ('P17','Codice Rosso Live','Rete2','Documentario'),
 ('P20','Il Salotto del Mattino','Rete3','Talk show'),
 ('P22','Pilota Mai Andato in Onda','Canale9','Quiz');

INSERT INTO artisti VALUES
 ('P01','Marta Fumagalli'),('P01','Luca Brambilla'),
 ('P02','Ada Colombo'),('P02','Marta Fumagalli'),
 ('P03','Luca Brambilla'),
 ('P05','Irene Galli'),('P05','Tommaso Riva'),('P05','Sara Conti'),
 ('P11','Marta Fumagalli'),('P11','Giorgio Sala'),('P11','Nina Riva'),
 ('P11','Luca Brambilla'),
 ('P17','Paolo Ferri'),
 ('P22','Ada Colombo');

INSERT INTO sondaggi VALUES
 ('P01','2026-02-01',3200,14.2),('P01','2026-02-08',3500,15.1),
 ('P02','2026-02-03',1800, 8.0),
 ('P03','2026-02-02',4100,18.5),('P03','2026-02-09',3900,17.9),
 ('P05','2026-02-04',2500,11.0),('P05','2026-02-13',10500,60.0),
 ('P11','2026-02-10',10500,60.1),('P11','2026-02-11',9800,58.4),
 ('P17','2026-02-05',1200, 5.3),('P17','2026-02-12',1350, 6.1),
 ('P20','2026-02-06', 900,12.0);

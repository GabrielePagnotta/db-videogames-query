
/*SELECT*/

/* 1- Selezionare tutte le software house americane (3)*/
SELECT * 
FROM software_houses
WHERE country ='United States'

/*2-Selezionare tutti i giocatori della città di 'Rogahnland' (2)*/
SELECT *
FROM players
WHERE city = 'Rogahnland'

/*3- Selezionare tutti i giocatori il cui nome finisce per "a" (220)*/

SELECT *
FROM players 
WHERE name LIKE '%a'

/*4- Selezionare tutte le recensioni scritte dal giocatore con ID = 800 (11)*/

SELECT * 
FROM reviews
WHERE player_id = 800

/*5- Contare quanti tornei ci sono stati nell'anno 2015 (9)*/

SELECT *
FROM tournaments
WHERE [year] LIKE 2015

/*6- Selezionare tutti i premi che contengono nella descrizione la parola 'facere' (2)*/
SELECT * 
FROM awards
WHERE [description] LIKE '%facere%'

/*
7- Selezionare tutti i videogame che hanno la categoria 2 (FPS) o 6 (RPG),
mostrandoli una sola volta (del videogioco vogliamo solo l'ID) (287)*/

SELECT videogame_id
FROM category_videogame
WHERE category_id = 2 OR category_id = 6
GROUP BY videogame_id

/*8- Selezionare tutte le recensioni con voto compreso tra 2 e 4 (2947)*/
SELECT *
FROM reviews
WHERE rating BETWEEN 2 AND 4

/*9- Selezionare tutti i dati dei videogiochi rilasciati nell'anno 2020 (46)*/
SELECT *
FROM videogames 
WHERE YEAR(release_date) LIKE 2020

/*	10- Selezionare gli id dei videogame che hanno ricevuto almeno una recensione da stelle,
mostrandoli una sola volta (443)*/

SELECT videogame_id
FROM reviews
WHERE rating LIKE 5
GROUP BY videogame_id


/*GROUP BY */


/*1- Contare quante software house ci sono per ogni paese (3)*/

SELECT country
FROM software_houses
GROUP BY country

/*2- Contare quante recensioni ha ricevuto ogni videogioco (del videogioco vogliamo solo l'ID) (500)*/

SELECT videogame_id
FROM reviews
GROUP BY videogame_id

/*3- Contare quanti videogiochi hanno ciascuna */
/*classificazione PEGI (della classificazione PEGI vogliamo solo l'ID) (13)*/

SELECT pegi_label_id
FROM pegi_label_videogame
GROUP BY pegi_label_id


/*4- Mostrare il numero di videogiochi rilasciati ogni anno (11)*/

SELECT YEAR(release_date) as release_date
FROM videogames
GROUP BY YEAR(release_date);

/*5- Contare quanti videogiochi sono disponbili 
per ciascun device (del device vogliamo solo l'ID) (7)*/

SELECT COUNT(videogame_id) AS videogame_id
FROM device_videogame
GROUP BY device_id

/*6- Ordinare i videogame in base alla media delle recensioni (del videogioco vogliamo solo l'ID) (500)*/

SELECT AVG(rating)
FROM reviews
GROUP BY Videogame_id


/*JOIN*/


/*1- Selezionare i dati di tutti giocatori che hanno scritto almeno una recensione,
mostrandoli una sola volta (996)*/

SELECT DISTINCT players.*
FROM players
INNER JOIN reviews 
ON players.id=reviews.player_id
WHERE players.id IS NOT NULL

/*2- Sezionare tutti i videogame dei tornei tenuti nel 2016, mostrandoli una sola volta (226)*/

SELECT DISTINCT tournaments.year,videogames.name
FROM tournament_videogame
JOIN tournaments
ON tournament_videogame.tournament_id = tournaments.id
JOIN videogames
ON tournament_videogame.videogame_id = videogames.id
WHERE tournaments.year = 2016

/*3- Mostrare le categorie di ogni videogioco (1718)*/

SELECT categories.name,videogames.name
FROM category_videogame
JOIN categories
ON category_videogame.category_id = categories.id
JOIN videogames
ON category_videogame.videogame_id = videogames.id

/*4- Selezionare i dati di tutte le software house che hanno rilasciato almeno un gioco dopo il 2020,*/
/*mostrandoli una sola volta (6)*/

SELECT DISTINCT software_houses.id,software_houses.name
FROM videogames
JOIN software_houses
ON software_houses.id = videogames.software_house_id
WHERE YEAR(videogames.release_date) >= 2020

/*5- Selezionare i premi ricevuti da ogni software house per i videogiochi che ha prodotto (55)*/
SELECT DISTINCT videogames.name,awards.name
FROM award_videogame
JOIN videogames
ON videogames.id = award_videogame.videogame_id
JOIN awards
ON awards.id = award_videogame.award_id

















 



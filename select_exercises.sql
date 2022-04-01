use albums_db;

SELECT * FROM albums;

-- there are 6 columns

SELECT DISTINCT artist from albums;

-- there are 23 unique artists names

DESCRIBE albums;

-- the primary key is id 

SELECT id, artist, release_date
FROM albums 
ORDER BY release_date;

-- the oldest release date is 1967 and the most recent is 2011

SELECT name 
FROM albums 
WHERE artist = 'Pink Floyd';

SELECT release_date 
FROM albums 
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

SELECT genre
FROM albums
WHERE name = 'Nevermind';

SELECT name
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;

SELECT name 
FROM albums
WHERE sales < 20; 

SELECT genre
FROM albums;

SELECT *
FROM albums
WHERE genre = 'Rock';

-- the search only asked for Rock not inclusive of types of rock 

SELECT title FROM movies WHERE year = 2008

Select birth FROM people WHERE name = "Emma Stone"

SELECT DISTINCT title FROM movies WHERE year >= 2018 ORDER BY title ASC

SELECT COUNT(*) FROM ratings WHERE rating = 10.0

SELECT year, title FROM movies WHERE title like "Harry Potter%" ORDER BY year ASC

SELECT AVG(rating) FROM ratings JOIN movies ON movies.id = ratings.movie_id WHERE year = 2012

SELECT title,rating FROM movies
JOIN ratings ON ratings.movie_id = movies.id
WHERE year = 2010 AND rating IS NOT NULL ORDER BY rating DESC, title ASC

SELECT name
FROM people
WHERE id IN
(
    
    SELECT person_id
    FROM stars
    WHERE movie_id = (


        SELECT id
        FROM movies
        WHERE title = 'Toy Story'
    )
);

--SELECT name FROM people
--JOIN ratings ON ratings.movie_id = movies.id
--WHERE year = 2004


SELECT name
FROM people
WHERE id IN
(

    SELECT person_id
    FROM stars
    WHERE movie_id IN (
        SELECT id
        FROM movies
        WHERE year = 2004
    )
) ORDER BY birth ASC;

SELECT DISTINCT name
FROM people
WHERE id IN
(

    SELECT person_id
    FROM stars
    WHERE movie_id IN (
        SELECT movie_id
        FROM ratings
        WHERE rating  >= 8.0
    )
);


-- Missing 11,12,13

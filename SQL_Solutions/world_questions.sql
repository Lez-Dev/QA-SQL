# World_questions
USE world;
SET SQL_SAFE_UPDATES = 0;
#SELECT * FROM country WHERE Code = 'ESP';

# 1 - Using COUNT, get the number of cities in the USA.
SELECT COUNT(c.Name) AS cities_in_USA FROM city c
JOIN country co ON c.CountryCode = co.Code
WHERE co.Name = 'United States';

# 2 - Find out the population and life expectancy for people in Argentina.
SELECT Population, LifeExpectancy FROM country
WHERE Name = 'Argentina';

# 3 - Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT Name, LifeExpectancy FROM country
WHERE LifeExpectancy IS NOT NULL
ORDER BY LifeExpectancy DESC
LIMIT 1;

# 4 - Using JOIN ... ON, find the capital city of Spain.
SELECT ci.Name FROM city ci
JOIN country co ON ci.CountryCode = co.Code
WHERE co.Name = 'Spain' AND ci.ID = co.Capital;

# 5 - Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
SELECT DISTINCT Language FROM countrylanguage
JOIN country ON countrylanguage.CountryCode = country.Code
WHERE country.region = 'Southeast Asia';

# 6 - Using a single query, list 25 cities around the world that start with the letter F.
SELECT city.Name FROM city
WHERE city.Name LIKE 'F%'
LIMIT 25;

# 7 - Using COUNT and JOIN ... ON, get the number of cities in China.
SELECT COUNT(city.Name) FROM city
JOIN country ON country.Code = city.CountryCode
WHERE country.Name = 'CHN';

# 8 - Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT Name, Population FROM country
WHERE Population != 0
ORDER BY Population ASC
LIMIT 1;

# 9 - Using aggregate functions, return the number of countries the database contains.
SELECT COUNT(country.Name) FROM country;

# 10 - What are the top ten largest countries by area?
SELECT Name, SurfaceArea FROM country
ORDER BY SurfaceArea DESC
LIMIT 10;

# 11 - List the five largest cities by population in Japan.
SELECT city.Name FROM city
JOIN country ON city.CountryCode = country.Code
WHERE country.name = 'Japan'
ORDER BY city.Population DESC
LIMIT 5;

# 12 - List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
#UPDATE country SET HeadOfState = 'Charles III'
#WHERE country.HeadOfState = 'Elisabeth II';
SELECT Code, Name FROM country
WHERE country.HeadOfState = 'Charles III';





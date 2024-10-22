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

# 13 - List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
SELECT country.Name, (country.Population / country.SurfaceArea) AS populationToAreaRatio FROM country
WHERE country.SurfaceArea > 0 AND country.population != 0
ORDER BY (country.Population / country.SurfaceArea) ASC
LIMIT 10;

# 14 - List every unique world language.
SELECT DISTINCT Language FROM countrylanguage;

# 15 - List the names and GNP of the world's top 10 richest countries.
SELECT country.Name, country.GNP FROM country
ORDER BY country.GNP DESC
LIMIT 10;

# 16 - List the names of, and number of languages spoken by, the top ten most multilingual countries.
SELECT country.Name, COUNT(cl.Language) AS languagesSpoken FROM country
JOIN countrylanguage cl ON country.Code = cl.CountryCode
GROUP BY country.Name
ORDER BY languagesSpoken DESC
LIMIT 10;

# 17 - List every country where over 50% of its population can speak German.
SELECT Name FROM country
JOIN countrylanguage cl ON country.Code = cl.CountryCode
WHERE cl.Language = 'German' AND cl.Percentage > 50;

# 18 - Which country has the worst life expectancy? Discard zero or null values.
SELECT Name, LifeExpectancy from country
WHERE LifeExpectancy IS NOT NULL AND LifeExpectancy != 0
ORDER BY LifeExpectancy ASC
LIMIT 1;

# 19 - List the top three most common government forms.
SELECT GovernmentForm, COUNT(country.GovernmentForm) AS GovernmentFormCount FROM country
Group By country.GovernmentForm
Order by COUNT(country.GovernmentForm) DESC
LIMIT 3;

# 20 - How many countries have gained independence since records began?
SELECT COUNT(country.IndepYear) AS IndCountriesSince FROM country
WHERE IndepYear IS NOT NULL;







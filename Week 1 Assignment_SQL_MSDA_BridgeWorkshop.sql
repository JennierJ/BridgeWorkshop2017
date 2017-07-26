-- 1. MSDA SQL Week 1 Assignment

-- 1. Which destination in the flights database is the furthest distance away, based on information in the flights table.
-- Show the SQL query(s) that support your conclusion.

SELECT
origin,dest AS 'destination'
FROM flights
ORDER BY 'distance' DESC;

-- 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
-- the most number of seats? Show the SQL statement(s) that support your result.

SELECT
engines,seats AS 'Number of engines'
FROM planes
ORDER BY 'seats' DESC;


-- 3. Show the total number of flights

SELECT
COUNT(*) AS 'Number of Flights'
FROM flights

-- 4. Show the total number of flights by airline (carrier).

SELECT 
carrier AS 'Airline', COUNT(*) AS 'Number of Flights'
FROM flights
GROUP BY carrier
ORDER BY carrier;

-- 5. Show all of the airlines, ordered by number of flights in descending order.

SELECT
carrier AS 'Airline', COUNT(*) AS 'Number of Flights'
FROM flights
GROUP BY carrier
ORDER BY 'Number of Flights' DESC;

-- 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.

SELECT
carrier AS 'Airline', COUNT(*) AS 'Number of Flights'
FROM flights
GROUP BY carrier
ORDER BY 'Number of Flights' DESC
LIMIT 5;

-- 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
-- flights in descending order.

SELECT
carrier AS 'Airline', COUNT(*) AS 'Number of Flights'
FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY 'Number of Flights' DESC
LIMIT 5;

-- 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and
-- write down both the question, and the query that answers the question.
-- Questions: What is the average altitude of the three major New York airports?
SELECT AVG(alt) FROM airports WHERE faa = 'EWR' OR faa = 'LGA' OR faa = 'JFK';
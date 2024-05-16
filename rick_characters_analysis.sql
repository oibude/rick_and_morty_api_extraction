SELECT * FROM rick_character;

/*What character has been the most number of episodes
*/

SELECT name, number_of_episodes
FROM rick_character
GROUP BY name, number_of_episodes
ORDER by number_of_episodes DESC

--What characters are currently dead
SELECT name,COUNT(*)  --checking duplicates
FROM rick_character
GROUP BY name
HAVING COUNT(*) > 1

SELECT DISTINCT(name), status
FROM rick_character
WHERE status in ('Dead')

--What are the 3 most prevalent species in the show
SELECT species, COUNT(species)as number
FROM rick_character
GROUP BY species
ORDER BY number DESC
LIMIT 3;

--How many characters are not at their original location
SELECT COUNT(*)
FROM rick_character
WHERE location != origin AND location IS NOT NULL AND origin IS NOT NULL AND origin != 'unknown'
AND location <> 'unknown'

SELECT name,status, COUNT(*)
FROM rick_character
GROUP BY name, status
HAVING COUNT(*) > 1
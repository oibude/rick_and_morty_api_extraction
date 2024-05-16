
/*What year had the most number of aired episodes
*/

SELECT COUNT(air_date) as episode_count, EXTRACT(year FROM air_date) as year
FROM rick_episodes
GROUP BY year
ORDER BY  episode_count DESC


/*Do season finales (last episode of the season) tend to have the most characters
present
*/
SELECT id, character_no, episode_code,
MAX(episode_code) OVER (PARTITION BY SUBSTRING(episode_code, 2, 2)) AS last_episode_code
FROM rick_episodes
GROUP BY id, character_no, episode_code
ORDER BY character_no DESC


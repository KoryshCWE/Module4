SELECT c.NAME AS CLIENT_NAME, COUNT(p.ID) AS PROJECT_COUNT
FROM client c
         JOIN project p ON c.ID = p.CLIENT_ID
GROUP BY c.ID, c.NAME
HAVING COUNT(p.ID) = (
    SELECT MAX(project_count)
    FROM (
             SELECT COUNT(ID) AS project_count
             FROM project
             GROUP BY CLIENT_ID
         ) AS project_counts
);


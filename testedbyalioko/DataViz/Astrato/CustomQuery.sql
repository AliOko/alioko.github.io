-- Universe

SELECT Title, Series, Bookinseries,
   CASE 
       WHEN Series in ('Stormlight Archive','Mistborn') THEN 'Cosmere'
       WHEN Series in ('The Skyward Series', 'Skyward Flight') THEN 'Cytoverse'
       ELSE 'Other'
    END universe
FROM SIMPLE_DATASETS.SANDERSONBOOKS
ORDER BY Series DESC, Bookinseries ASC;

-- Timestamp https://docs.snowflake.com/en/sql-reference/functions/cast.html

SELECT Releasedate::Timestamp
FROM SIMPLE_DATASETS.SANDERSONBOOKS

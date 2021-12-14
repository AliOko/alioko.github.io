SELECT * FROM (SELECT TITLE, SERIES, BOOKINSERIES,
   CASE 
       WHEN SERIES in ('Stormlight Archive','Mistborn') THEN 'Cosmere'
       WHEN SERIES in ('The Skyward Series', 'Skyward Flight') THEN 'Cytoverse'
       ELSE 'Other'
    END universe
FROM SIMPLE_DATASETS.SANDERSONBOOKS
ORDER BY SERIES DESC, BOOKINSERIES ASC)

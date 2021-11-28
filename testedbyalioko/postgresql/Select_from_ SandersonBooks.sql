-- Universe
SELECT title, series, bookInSerie,
   CASE 
       WHEN series in ('Stormlight Archive','Mistborn') THEN 'Cosmere'
       WHEN series in ('The Skyward Series', 'Skyward Flight') THEN 'Cytoverse'
       ELSE 'Other'
    END universe
FROM SandersonBooks
ORDER BY series DESC, bookInSerie ASC;

-- 

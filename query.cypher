MATCH (r:Recipe)
WHERE r.name = 'Peanut Sauce' OR r.name = 'Vietnamese Spring Rolls (Gỏi Cuốn)'
WITH r
MATCH (r)-[:CONTAINS]->(p:Product)
OPTIONAL MATCH (p)-[:PURCHASE_AT]->(s:Store)
WITH p, COLLECT(DISTINCT s) AS stores
RETURN COLLECT(DISTINCT p.name) AS Ingredients,
       [store IN stores | CASE WHEN store IS NOT NULL THEN store.name ELSE 'Unknown' END] AS Stores
ORDER BY Stores;


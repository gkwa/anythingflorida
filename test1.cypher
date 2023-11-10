MATCH (n) DETACH DELETE n;

CREATE (yellowCurry)-[:CONTAINS { quantity: "1 tsp" }]->(cumin)
;

MATCH (n) RETURN n

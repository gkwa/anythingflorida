MATCH (n) DETACH DELETE n
;

CREATE (yellowCurry:Recipe {name: "Yellow Curry with Chicken"})-[:CONTAINS { quantity: "1 tsp" }]->(cumin:Product)
;

MATCH (n) RETURN n
;

MATCH (recipe:Recipe)-[contains:CONTAINS]->(product:Product)
WHERE product.name IS NULL
RETURN recipe.name
;

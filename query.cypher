// if i would like to make Cold Soba With Periall Oil dresssing, then what stores do I need to visit?
MATCH (r:Recipe {name: 'Cold Soba With Periall Oil dresssing'})-[:CONTAINS]->(p:Product)
MATCH (p)-[:PURCHASE_AT]->(s:Store)
RETURN s.name AS StoreName, COLLECT(DISTINCT p.name) AS Ingredients;

MATCH (r:Recipe {name: 'The Best Green Curry'})-[:CONTAINS]->(p:Product)
MATCH (p)-[:PURCHASE_AT]->(s:Store)
RETURN s.name AS StoreName, COLLECT(DISTINCT p.name) AS Ingredients;

MATCH (r:Recipe {name: 'Korean Sesame Noodles'})-[:CONTAINS]->(p:Product)
MATCH (p)-[:PURCHASE_AT]->(s:Store)
RETURN s.name AS StoreName, COLLECT(DISTINCT p.name) AS Ingredients;

// ingredients for Chicken Thai Red Curry
MATCH (r:Recipe {name: 'Chicken Thai Red Curry'})-[:CONTAINS]->(p:Product)
RETURN p.name;

// products that dont have a store associated
MATCH (p:Product)
WHERE NOT (p)-[:PURCHASE_AT]->(:Store)
RETURN p.name AS ProductName;

// products that have a store associated
MATCH (p:Product)-[:PURCHASE_AT]->(s:Store)
RETURN p.name AS ProductName, s.name AS StoreName;

// products whose names contain non-alphanum
MATCH (p:Product)
WHERE p.name =~ ".*[^a-zA-Z0-9 ].*"
RETURN p.name AS ProductName;

//
MATCH (r:Recipe)-[c:CONTAINS]->(p:Product)
WHERE id(p) IS NULL
RETURN r.name AS RecipeName, c.quantity AS Quantity, c.urls AS RecipeUrls;

MATCH (r:Recipe {name: 'Vegan Thai Red Curry'})-[:CONTAINS]->(p:Product)
MATCH (p)-[:PURCHASE_AT]->(s:Store)
RETURN s.name AS StoreName, COLLECT(DISTINCT p.name) AS Ingredients;

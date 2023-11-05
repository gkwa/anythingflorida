// if i would like to make Cold Soba With Periall Oil dresssing, then what stores do I need to visit?
MATCH (r:Recipe {name: 'Cold Soba With Periall Oil dresssing'})-[:CONTAINS]->(p:Product)
MATCH (p)-[:PURCHASE_AT]->(s:Store)
RETURN s.name AS StoreName, COLLECT(DISTINCT p.name) AS Ingredients;

MATCH (r:Recipe {name: 'The Best Green Curry'})-[:CONTAINS]->(p:Product)
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
RETURN p.name AS ProductName, s.name AS StoreName, p.type as Type;

MATCH (r:Recipe)-[c:CONTAINS]->(p:Product)
WHERE id(p) IS NULL
RETURN r.name AS RecipeName, c.quantity AS Quantity, c.urls AS RecipeUrls;

MATCH (r:Recipe {name: 'Vegan Thai Red Curry'})-[:CONTAINS]->(p:Product)
MATCH (p)-[:PURCHASE_AT]->(s:Store)
RETURN s.name AS StoreName, COLLECT(DISTINCT p.name) AS Ingredients;

// order products by type
MATCH (p:Product)-[:PURCHASE_AT]->(s:Store)
RETURN p.name AS ProductName, s.name AS StoreName, p.type as Type
ORDER BY toLower(p.type);

// get products that i've not yet assiged a type to
MATCH (p:Product)
WHERE p.type IS NULL
RETURN p.name;

// find products whose type contains chili
MATCH (p:Product)
WHERE toLower(p.type) CONTAINS 'chili'
RETURN p.name AS ProductName, p.type AS Type;

// find products whose type contains vegetable
MATCH (p:Product)
WHERE toLower(p.type) CONTAINS 'vegetable'
RETURN p.name AS ProductName, p.type AS Type;

// products whose names contain non-alphanum
MATCH (p:Product)
WHERE p.name =~ ".*[^a-zA-Z0-9 ].*"
RETURN p.name AS ProductName;

// products whose names contain non-alphanum sorted randomly to prevent boredom
MATCH (p:Product)
WHERE p.name =~ ".*[^a-zA-Z0-9 ].*"
RETURN p.name AS ProductName
ORDER BY RAND();

// list the brand of the product too
MATCH (p:Product)
OPTIONAL MATCH (p)-[:PURCHASE_AT]->(s:Store)
RETURN p.name AS ProductName, p.type AS Type, COALESCE(p.brand, '') AS Brand, COLLECT(DISTINCT s.name) AS AvailableAtStores;

// if I were to make recipe Chicken Teriyaki Recipe, then what stores need I visit to get products i'd need for recipe
MATCH (r:Recipe {name: 'Tomatillo Salsa Verde'})-[:CONTAINS]->(p:Product)
MATCH (p)-[:PURCHASE_AT]->(s:Store)
RETURN s.name AS StoreName, COLLECT(DISTINCT p.name) AS Ingredients;

// list the produce even if it doesn't have an assoctiated purchase location
MATCH (r:Recipe {name: 'Tomatillo Salsa Verde'})-[:CONTAINS]->(p:Product)
OPTIONAL MATCH (p)-[:PURCHASE_AT]->(s:Store)
RETURN p.name AS ProductName, COLLECT(DISTINCT s.name) AS Stores;

// find products whose type contains peas
MATCH (p:Product)
WHERE toLower(p.type) CONTAINS 'pea'
RETURN p.name AS ProductName, p.type AS Type;

// list the products that aren't marked with a purchase location
MATCH (product:Product)
WHERE NOT (product)-[:PURCHASE_AT]->(:Store)
RETURN product.name AS ProductName
ORDER BY toLower(ProductName);

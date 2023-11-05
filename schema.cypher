MATCH (n)
DETACH DELETE n;

// chefs
CREATE (proHomeCooks:Person { name: "Alex Chung", urls: ["https://www.youtube.com/@ProHomeCooks"] })
CREATE (seonkyoungLongest:Person { name: "Seonkyoung Longest", urls: ["https://www.recipetineats.com", ""] })
CREATE (recipetineats:Person { name: "Recipetineats", urls: ["https://www.recipetineats.com", ""] })

// recipes
CREATE (teriyakiRecipe:Recipe { name: "Chicken Teriyaki Recipe", urls: ["https://www.youtube.com/watch?v=t-Hj2pILMz4","https://prohomecooks.com/blogs/all/why-every-cook-should-master-chicken-teriyaki?_pos=1&_sid=7db443900&_ss=r"] })
CREATE (drunkenNoodles:Recipe { name: "The Best Drunken Noodles", urls: ["https://seonkyounglongest.com/drunken-noodles/"] })

// stores
CREATE (amazon:Store { name: "Amazon" })
CREATE (bartell:Store { name: "Bartell" })

CREATE (yeastActivedry:Product { name: "Yeast (Active Dry)", type: "Yeast" })
CREATE (yellowCurryPowder:Product { name: 'Yellow Curry Powder', type: "Spice", urls: ["https://www.google.com/search?q=Yellow+Curry+Powder+near+me&tbm=isch&ved=2ahUKEwiVxLm7h6mCAxWIFjQIHTNwBKoQ2-cCegQIABAA&oq=Yellow+Curry+Powder+near+me&gs_lcp=CgNpbWcQAzIHCAAQGBCABDoECCMQJzoGCAAQBxAeOgYIABAIEB46BAgAEB46BggAEAUQHlDIBViIEGD3EWgAcAB4AIABS4gBkQSSAQE5mAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=QoxFZZWbEYit0PEPs-CR0Ao&bih=758&biw=1440&client=emacs"] })

CREATE (teriyakiRecipe)-[:CONTAINS { quantity: '1 knob' }]->(ginger)
CREATE (teriyakiRecipe)-[:CONTAINS { quantity: '1 cup' }]->(water)

CREATE (salsaVerde)-[:CONTAINS {quantity: '1 1/2 pounds'}]->(tomatillos)
CREATE (salsaVerde)-[:CONTAINS {quantity: 'Salt to taste'}]->(salt)

CREATE (yellowCurry)-[:CONTAINS { quantity: '3 tbsp' }]->(yellowCurryPaste)
CREATE (sobaNoodlesRecipe)-[:CONTAINS { quantity: '1 tablespoon' }]->(miso)
CREATE (sobaNoodlesRecipe)-[:CONTAINS { quantity: '1 teaspoon' }]->(chiliGarlicSauce)

// Create Product nodes for ingredients without quantities
CREATE (sobaNoodlesRecipe)-[:CONTAINS]->(miso)
CREATE (padThai)-[:CONTAINS { quantity: '' }]->(garlicChives)
CREATE (padThai)-[:CONTAINS { quantity: '' }]->(lime)

CREATE (coldSobaWithPerillaOilDressing)-[:CONTAINS]->(buckwheatSoba)
CREATE (coldSobaWithPerillaOilDressing)-[:CONTAINS]->(japaneseNori)
CREATE (coldSobaWithPerillaOilDressing)-[:CONTAINS]->(perillaOil)

CREATE (koreanSesameNoodles)-[:CONTAINS {quantity: '1 portion'}]->(sobaNoodles)
CREATE (koreanSesameNoodles)-[:CONTAINS {quantity: 'a few slices (optional)'}]->(redChili)

CREATE (chickenThaiRedCurry)-[:CONTAINS { quantity: '500 grams' }]->(bonelessChickenThighs)
CREATE (thaiCurry1)-[:CONTAINS]->(whitePeppercorns)

CREATE (thaiEggplantRecipe)-[:CONTAINS]->(coconutMilk)
CREATE (thaiEggplantRecipe)-[:CONTAINS]->(turmeric)

CREATE (phadThai)-[:CONTAINS]->(roastedUnsaltedPeanuts)

CREATE (seonkyoungLongest)-[:CREATED]->(drunkenNoodles)
CREATE (drunkenNoodles)-[:CONTAINS { quantity: 'Handful' }]->(basil)
CREATE (drunkenNoodles)-[:CONTAINS { quantity: '1 wedge' }]->(lime)

CREATE (yellowThaiCurry)-[:CONTAINS]->(kaffirLime)

CREATE (palmSugar)-[:PURCHASE_AT]->(uwajimaya)
CREATE (whiteOnion)-[:PURCHASE_AT]->(safeway)

CREATE (tsuyu)-[:IS_THE_SAME_AS]->(kikkomanJapaneseNoodleSoupBaseHonTsuyu)

CREATE (pailinChongchitnant)-[:RECOMMENDS {urls:["https://youtu.be/5odVRW9ldzU?t=451","https://www.youtube.com/watch?v=d6YbVqqcR4w"]}]->(maePloyRedCurryPaste)
CREATE (pailinChongchitnant)-[:RECOMMENDS {urls:["https://youtu.be/5odVRW9ldzU?t=447","https://www.youtube.com/watch?v=d6YbVqqcR4w"]}]->(aroyDRedCurryPaste)
CREATE (pailinChongchitnant)-[:RECOMMENDS {urls:["https://youtu.be/5odVRW9ldzU?t=220"]}]->(fishSauceSquid)

CREATE (proHomeCooks)-[:CREATED]->(teriyakiRecipe)
CREATE (eliseBauer)-[:CREATED]->(salsaVerde)
CREATE (recipetineats)-[:CREATED]->(yellowThaiCurry);

MATCH (n) RETURN n

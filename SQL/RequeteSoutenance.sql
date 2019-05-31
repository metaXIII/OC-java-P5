-- Selection de tous les ingredients par pizza
select pizza.nom, ingredient.nom
from composition
left join pizza on pizza.id = composition.id_pizza
left join ingredient on ingredient.id = composition.id_ingredient
order by pizza.nom

-- Selection de tous les ingredients d'une pizza donnée 
select pizza.nom, ingredient.nom
from composition
left join pizza on pizza.id = composition.id_pizza
left join ingredient on ingredient.id = composition.id_ingredient
WHERE pizza.id = 2
order by pizza.nom

-- Afficher adresse du restaurant 
SELECT nom, adresse.*
from restaurant
INNER JOIN adresse on restaurant.id_adresse = adresse.id
WHERE nom = 'OC Pizza'


-- Ajouter stock
UPDATE stock
LEFT JOIN ingredient ON stock.id_ingredient = ingredient.id 
SET quantite = quantite + 5
where ingredient.nom = "champignons"
-- This code which is the most complex, creates a table with every item with it`s:
-- selling price, ingredients used, the quantity and the cost of those ingredients, 
-- the number of orders, the cost of making all the sold dishes and finally the total revenue.

with ing_table as (select 
  i.item_name,
  i.item_price,
  i.item_cat,
  i.sku,
  o.item_id,
  recipe.ing_id,
  ing.ing_name,
  sum(o.quantity) as dishes_sold,
  recipe.quantity as recipe_quantity,
  sum(o.quantity) * recipe.quantity as ing_weight_used,
  ing.ing_price,
  ing.ing_weight,
  ing.ing_price/ing.ing_weight as ing_unit_cost
 from orders o 
LEFT  JOIN item i
    on i.item_id = o.item_id
LEFT JOIN recipe
  on recipe.recipe_id = i.sku
LEFT JOIN ingredient ing 
  on ing.ing_id = recipe.ing_id
GROUP BY i.item_name,
  o.item_id, i.sku,
  i.item_cat,
  recipe.ing_id,
  ing.ing_name,
  recipe.quantity,
  ing.ing_weight,
  ing.ing_price,
  i.item_price)
  
select
  item_name,
  item_cat,
  sku,
  item_id,
  item_price,
  ing_id,
  ing_name,
  dishes_sold,
  recipe_quantity,
  ing_price,
  ing_weight,
  ing_unit_cost,
  ing_weight_used,
  ing_unit_cost *ing_weight_used as ingredient_cost_per_dish,
  round(sum(ing_unit_cost *ing_weight_used) OVER(),2) as total_cost,
  (
    SELECT SUM(DISTINCT item_price * dishes_sold)
    FROM ing_table
  ) AS total_revenue
from ing_table;

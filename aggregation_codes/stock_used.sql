-- This code unlike orders_tables focuses particularly on the ingredients used, their cost, quantity used for every item sold

WITH ing_table AS (
    SELECT 
        i.item_name AS item_name,
        i.item_price AS item_price,
        i.item_cat AS item_cat,
        i.sku AS sku,
        o.item_id AS item_id,
        recipe.ing_id AS ing_id,
        ing.ing_name AS ing_name,
        SUM(o.quantity) AS dishes_sold,
        recipe.quantity AS recipe_quantity,
        (SUM(o.quantity) * recipe.quantity) AS ing_weight_used,
        ing.ing_price AS ing_price,
        ing.ing_weight AS ing_weight,
        (ing.ing_price / ing.ing_weight) AS ing_unit_cost
    FROM orders o
    LEFT JOIN item i ON i.item_id = o.item_id
    LEFT JOIN recipe ON recipe.recipe_id = i.sku
    LEFT JOIN ingredient ing ON ing.ing_id = recipe.ing_id
    GROUP BY 
        i.item_name,
        o.item_id,
        i.sku,
        i.item_cat,
        recipe.ing_id,
        ing.ing_name,
        recipe.quantity,
        ing.ing_weight,
        ing.ing_price,
        i.item_price
)

SELECT 
    ing_table.item_name AS item_name,
    ing_table.item_cat AS item_cat,
    ing_table.sku AS sku,
    ing_table.item_id AS item_id,
    ing_table.item_price AS item_price,
    ing_table.ing_id AS ing_id,
    ing_table.ing_name AS ing_name,
    ing_table.dishes_sold AS dishes_sold,
    ing_table.recipe_quantity AS recipe_quantity,
    ing_table.ing_price AS ing_price,
    ing_table.ing_weight AS ing_weight,
    ing_table.ing_unit_cost AS ing_unit_cost,
    ing_table.ing_weight_used AS ing_weight_used,
    (ing_table.ing_unit_cost * ing_table.ing_weight_used) AS ingredient_cost_per_dish,
    ROUND(SUM(ing_table.ing_unit_cost * ing_table.ing_weight_used) OVER (), 2) AS total_cost,
    (
        SELECT 
            SUM(DISTINCT (ing_table.item_price * ing_table.dishes_sold))
        FROM ing_table
    ) AS total_revenue
FROM ing_table;

-- this code calculates the difference between the total inventory and the quantity used
-- Useful to reveal how much stock has been used throughout the day and which ingredients need to be restocked

SELECT 
    stock_used.ing_id AS ing_id,
    stock_used.ing_name AS ing_name,
    (stock_used.ing_weight * inv.quantity) AS total_inventory_weight,
    SUM(stock_used.ing_weight_used) AS used_weight,
    ((stock_used.ing_weight * inv.quantity) - SUM(stock_used.ing_weight_used)) AS remaining_stock
FROM stock_used
LEFT JOIN inventory inv ON stock_used.ing_id = inv.item_id
GROUP BY 
    stock_used.ing_name,
    stock_used.ing_id,
    inv.quantity,
    stock_used.ing_weight;

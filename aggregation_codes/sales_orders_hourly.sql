-- This code is quite straight forward, it calculates the sales by every hour of the day

SELECT 
    EXTRACT(HOUR FROM orders_table.created_at) AS hour,
    COUNT(DISTINCT orders_table.order_id) AS nr_of_orders,
    SUM(orders_table.item_price * orders_table.quantity) AS total_sales
FROM orders_table
GROUP BY EXTRACT(HOUR FROM orders_table.created_at)
ORDER BY hour;

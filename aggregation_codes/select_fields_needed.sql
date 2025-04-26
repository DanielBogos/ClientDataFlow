-- -- Selecting all the fields required for the aggregations needed  for the orders dashboard
SELECT 
  o.order_id,
  o.quantity,
  i.item_price,
  i.item_name,
  i.item_cat,
  o.created_at,
  a.delivery_address1,
  a.delivery_address2,
  a.delivery_city,
  a.delivery_zipcode,
  o.delivery
FROM orders o 
LEFT JOIN item i 
  on o.item_id = i.item_id
LEFT JOIN address a 
  on o.add_id = a.add_id;

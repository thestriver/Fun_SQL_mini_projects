SELECT COUNT(*)
FROM newspaper
WHERE start_month <= 3 
  AND end_month >= 3;
  
  
  
SELECT *
FROM newspaper
CROSS JOIN months

;

SELECT *
FROM newspaper
CROSS JOIN months
WHERE start_month <= month
  AND end_month >= month
;

SELECT month,
   COUNT(*) AS 'subscribers'
FROM newspaper
CROSS JOIN months
WHERE start_month <= month 
   AND end_month >= month
GROUP BY month;

SELECT *
FROM newspaper
UNION
SELECT *
FROM online;


WITH previous_query AS (
SELECT customer_id,
   COUNT(subscription_id) AS 'subscriptions'
FROM orders
GROUP BY customer_id
)

SELECT customers.customer_name, 
   previous_query.subscriptions
FROM previous_query
JOIN customers
  ON previous_query.customer_id = customers.customer_id;
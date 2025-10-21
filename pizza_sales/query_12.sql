-- Analyze the cumulative revenue generated over time. --
SELECT order_date,
SUM(revenue) over(order by order_date) as cum_revenue
from
(SELECT 
    orders.order_date,
    ROUND(SUM(order_details.quantity * pizzas.price),
            0) AS revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
        JOIN
    orders ON orders.order_id = order_details.order_id
GROUP BY order_date) as sales;
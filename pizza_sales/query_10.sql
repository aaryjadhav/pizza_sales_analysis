-- Determine the top 3 most ordered pizza types based on revenue. --

SELECT 
    pizza_types.name AS pizza_names,
    ROUND(SUM(order_details.quantity * pizzas.price),
            0) AS revenue
FROM
    pizzas
        JOIN
    pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_names
ORDER BY revenue DESC
LIMIT 3; 
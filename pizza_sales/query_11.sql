SELECT 
    pizza_types.category AS category,
    ROUND(SUM(order_details.quantity * pizzas.price) * 100.0 / (SELECT 
                    SUM(order_details.quantity * pizzas.price)
                FROM
                    pizzas
                        JOIN
                    pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
                        JOIN
                    order_details ON order_details.pizza_id = pizzas.pizza_id),
            0) AS revenue_percentage
FROM
    pizzas
        JOIN
    pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue_percentage DESC;

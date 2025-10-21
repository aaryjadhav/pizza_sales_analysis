-- Group the orders by date and calculate the average number of pizzas ordered per day. --
SELECT AVG(total_pizza_ordered) AS avg_pizza_per_day
FROM (
    SELECT 
        orders.order_date,
        SUM(order_details.quantity) AS total_pizza_ordered
    FROM orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date
) AS daily_totals;

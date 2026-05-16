use practice;


##Show all users and their orders (include users even if no orders)
SELECT users.id as ID, users.name as Name, orders.id as order_id, orders.total_amount as order_total_amount
from users
LEFT JOIN orders ON users.id=orders.user_id;

##List all orders with user name and city
SELECT orders.id as order_id, users.name, users.city,  orders.total_amount as total_amount
from users
RIGHT JOIN orders ON users.id=orders.user_id;

##Show total number of orders per city
SELECT users.city as City, COUNT(orders.id) as total
from users
JOIN orders ON users.id = orders.user_id
GROUP BY City;

##Display total revenue per user
SELECT users.name, SUM(orders.total_amount) as revenue
from users
JOIN orders ON users.id = orders.user_id
GROUP BY Name;


##Show all products with total quantity sold
SELECT products.name, SUM(order_items.quantity)
from products
JOIN order_items On products.id = order_items.product_id
GROUP BY products.name;

##List all orders where status is 'completed' with user details
SELECT orders.id as order_id , users.name as name, users.city as city, orders.total_amount as total_amount, orders.status
from users
INNER JOIN orders ON users.id = orders.user_id
WHERE orders.status= "completed";

##Show all order items with product name and order id
SELECT order_items.order_id as order_id,products.name, order_items.quantity,order_items.price
from order_items
LEFT JOIN products ON order_items.product_id = products.id;

##Find all users who placed orders above 500
SELECT users.name, orders.total_amount
from users
RIGHT JOIN orders ON users.id=orders.user_id WHERE total_amount>500 ;

##Show revenue grouped by product category
SELECT products.category, SUM(order_items.price * order_items.price)
from products
RIGHT JOIN order_items ON products.id = order_items.product_id
GROUP BY category;

##Show all orders sorted by highest total amount
SELECT 
    id,
    user_id,
    order_date,
    status,
    total_amount
FROM orders
ORDER BY total_amount DESC;






























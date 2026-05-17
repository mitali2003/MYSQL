use practice;

SELECT * FROM users;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM order_items;

##Find users who placed at least one order
SELECT name from users where id in (select user_id from orders );

##Find users whose city is same as Amit Sharma's city
SELECT name from users where city = (SELECT city from users where name="Amit Sharma");

##Find orders having amount greater than average order amount
SELECT * from orders where orders.total_amount > (SELECT avg(total_amount) from orders);

##find the most expensive product
SELECT * FROM products  where price =  (SELECT MAX(price) from products);

##Find users who placed completed orders
SELECT name from users where id in (SELECT user_id from orders where status="completed");

##Find users who ordered Laptop
SELECT name from users where id in (SELECT user_id from orders where id in (SELECT order_id from order_items where product_id = (SELECT id from products where name="Laptop" )));


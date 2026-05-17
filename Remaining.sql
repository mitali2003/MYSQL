
USE practice;

SELECT * FROM users;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM order_items;


## 1. Find users who placed more than 2 orders.
-- | name         | total_orders |
-- | ------------ | ------------ |
-- | Amit Sharma  | 3            |

SELECT users.name,
       COUNT(orders.id) AS total_orders
FROM users
JOIN orders
ON users.id = orders.user_id
GROUP BY users.id, users.name
HAVING COUNT(orders.id) > 2;





## 2. Show average order amount per user.
-- | name         | avg_order |
-- | ------------ | --------- |
-- | Amit Sharma  | 766.67    |
-- | Priya Patel  | 1750      |
-- | Rahul Mehta  | 700       |
-- | Sneha Verma  | 700       |

SELECT users.name,
       AVG(orders.total_amount) AS avg_order
FROM users
JOIN orders
ON users.id = orders.user_id
GROUP BY users.id, users.name;





## 3. Show total products sold per category.
-- | category     | total_products_sold |
-- | ------------ | ------------------- |
-- | Electronics  | 5                   |
-- | Fashion      | 11                  |

SELECT products.category,
       SUM(order_items.quantity) AS total_products_sold
FROM products
JOIN order_items
ON products.id = order_items.product_id
GROUP BY products.category;





## 4. Find users from Ahmedabad with completed orders
-- | name         | order_id | status     |
-- | ------------ | -------- | ---------- |
-- | Amit Sharma  | 1        | completed  |
-- | Amit Sharma  | 7        | completed  |
-- | Sneha Verma  | 6        | completed  |

SELECT users.name,
       orders.id AS order_id,
       orders.status
FROM users
JOIN orders
ON users.id = orders.user_id
WHERE users.city = 'Ahmedabad'
AND orders.status = 'completed';





## 5. Show highest order amount for each user
-- | name         | highest_order |
-- | ------------ | ------------- |
-- | Amit Sharma  | 1200          |
-- | Priya Patel  | 2000          |
-- | Rahul Mehta  | 900           |
-- | Sneha Verma  | 700           |

SELECT users.name,
       MAX(orders.total_amount) AS highest_order
FROM users
JOIN orders
ON users.id = orders.user_id
GROUP BY users.id, users.name;





## 6. Show all products ordered by Priya Patel
-- | name    | quantity |
-- | ------- | -------- |
-- | Shoes   | 5        |
-- | Watch   | 1        |
-- | Laptop  | 1        |

SELECT products.name,
       SUM(order_items.quantity) AS quantity
FROM users
JOIN orders
ON users.id = orders.user_id
JOIN order_items
ON orders.id = order_items.order_id
JOIN products
ON products.id = order_items.product_id
WHERE users.name = 'Priya Patel'
GROUP BY products.id, products.name;





## 7. Count total completed orders
-- | total_completed_orders |
-- | ---------------------- |
-- | 6                      |

SELECT COUNT(orders.id) AS total_completed_orders
FROM orders
WHERE orders.status = 'completed';





## 8. Find cities where total revenue is above 2000
-- | city       | revenue |
-- | ---------- | ------- |
-- | Ahmedabad  | 3000    |
-- | Mumbai     | 3500    |

SELECT users.city,
       SUM(orders.total_amount) AS revenue
FROM users
JOIN orders
ON users.id = orders.user_id
GROUP BY users.city
HAVING SUM(orders.total_amount) > 2000;





## 9. Show all cancelled orders with user name
-- | order_id | name         | total_amount |
-- | -------- | ------------ | ------------ |
-- | 4        | Rahul Mehta  | 500          |

SELECT orders.id AS order_id,
       users.name,
       orders.total_amount
FROM users
JOIN orders
ON users.id = orders.user_id
WHERE orders.status = 'cancelled';





## 10. Show total quantity and revenue per product
-- | name    | total_quantity | revenue |
-- | ------- | -------------- | ------- |
-- | Laptop  | 2              | 100000  |
-- | Phone   | 2              | 40000   |
-- | Shoes   | 6              | 18000   |
-- | Watch   | 5              | 7500    |
-- | Tablet  | 1              | 25000   |

SELECT products.name,
       SUM(order_items.quantity) AS total_quantity,
       SUM(order_items.quantity * order_items.price) AS revenue
FROM products
JOIN order_items
ON products.id = order_items.product_id
GROUP BY products.id, products.name;





## 11. Find users who never placed completed orders
-- | name         |
-- | ------------ |
-- | Karan Singh  |

SELECT users.name
FROM users
WHERE users.id NOT IN (
    SELECT orders.user_id
    FROM orders
    WHERE orders.status = 'completed'
);





## 12. Find total revenue generated from Electronics products
-- | category     | revenue |
-- | ------------ | ------- |
-- | Electronics  | 165000  |

SELECT products.category,
       SUM(order_items.quantity * order_items.price) AS revenue
FROM products
JOIN order_items
ON products.id = order_items.product_id
WHERE products.category = 'Electronics'
GROUP BY products.category;
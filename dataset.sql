CREATE DATABASE practice;
use practice;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    created_at DATE
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date DATE,
    status VARCHAR(20),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


INSERT INTO users (id, name, email, city, created_at) VALUES
(1, 'Amit Sharma', 'amit@gmail.com', 'Ahmedabad', '2024-01-10'),
(2, 'Priya Patel', 'priya@gmail.com', 'Mumbai', '2024-02-12'),
(3, 'Rahul Mehta', 'rahul@gmail.com', 'Delhi', '2024-03-15'),
(4, 'Sneha Verma', 'sneha@gmail.com', 'Ahmedabad', '2024-04-18'),
(5, 'Karan Singh', 'karan@gmail.com', 'Pune', '2024-05-20');


INSERT INTO orders (id, user_id, order_date, status, total_amount) VALUES
(1, 1, '2024-06-01', 'completed', 1200),
(2, 1, '2024-06-10', 'pending', 800),
(3, 2, '2024-06-11', 'completed', 1500),
(4, 3, '2024-06-15', 'cancelled', 500),
(5, 2, '2024-07-01', 'completed', 2000),
(6, 4, '2024-07-05', 'completed', 700),
(7, 1, '2024-07-10', 'completed', 300),
(8, 3, '2024-07-12', 'completed', 900);

INSERT INTO products (id, name, category, price) VALUES
(1, 'Laptop', 'Electronics', 50000),
(2, 'Phone', 'Electronics', 20000),
(3, 'Shoes', 'Fashion', 3000),
(4, 'Watch', 'Fashion', 1500),
(5, 'Tablet', 'Electronics', 25000);

INSERT INTO order_items (id, order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1, 50000),
(2, 1, 4, 2, 1500),
(3, 2, 2, 1, 20000),
(4, 3, 3, 2, 3000),
(5, 3, 4, 1, 1500),
(6, 4, 5, 1, 25000),
(7, 5, 1, 1, 50000),
(8, 5, 3, 3, 3000),
(9, 6, 4, 2, 1500),
(10, 7, 2, 1, 20000),
(11, 8, 3, 1, 3000);

SELECT * FROM users;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM order_items;




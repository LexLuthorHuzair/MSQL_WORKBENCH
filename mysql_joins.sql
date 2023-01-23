-- TOPIC 1

-- inner join
-- JOINING WITHIN THE DATABASE 
-- use sql_store;
-- SELECT order_id, orders.customer_id,first_name,last_name
-- FROM orders
-- JOIN customers 
-- 	ON orders.customer_id =customers.customer_id;
    
-- TOPIC 2

-- joining across database
-- JOINING TABLES FROM 2 DIFFERENT DATA BASE

-- -- select *
-- -- FROM order_items 
-- -- join sql_inventory.products
-- -- 	on  order_items.product_id= products.product_id;

TOPIC 3

-- self join
-- JOINING WITHIN THE TABLE OF DATABASE

-- USE sql_hr;
-- SELECT 
-- 	e.employee_id,
-- 	e.first_name,
-- 	m.first_name AS manager
-- FROM employees e
-- JOIN employees m
-- 	ON e.reports_to = m.employee_id;
    

-- TOPIC 4

-- joining multiple tables

-- USE sql_store;

-- SELECT 
-- 	orders.order_id, 
-- 	orders.order_date, 
-- 	customers.first_name, 
-- 	customers.last_name, 
-- 	order_statuses.name AS status
-- FROM orders
-- JOIN customers
-- 	ON orders.customer_id = customers.customer_id
-- JOIN order_statuses
-- 	ON orders.status = order_statuses.order_status_id;
    
-- TOPIC 5

-- compound joining  
-- is like matching 2 primary key column and identifying it uniquely

-- SELECT *
-- FROM order_items
-- JOIN order_item_notes
-- 	ON order_items.order_id =order_item_notes.order_id
-- 	AND order_items.product_id = order_item_notes.product_id;
    
    
-- TOPIC 6
 
-- implicit joining

--- - SELECT*
-- -- FROM orders
-- -- JOIN customers 
-- -- 	ON orders.customer_id = c.customer_id;
-- --     
-- -- SELECT*
-- -- FROM orders, customers
-- -- WHERE orders.customer_id = customers.customer_id;  -- cross join error


-- TOPIC 7

-- outer joins 

-- left join , right join

-- SELECT
-- 	customers.customer_id,
--     customers.first_name,
--     orders.order_id
-- FROM customers
-- LEFT JOIN orders 
-- 		ON customers.customer_id = orders.customer_id
-- ORDER BY customers.customer_id;


-- OUTER JOINS BETWEEN TABLES 


-- SELECT
-- 	customers.customer_id,
--     customers.first_name,
--     orders.order_id,
--     shippers.name as SHIPPER
-- FROM customers
-- LEFT JOIN orders 
-- 		ON customers.customer_id = orders.customer_id
-- LEFT JOIN shippers 
-- 	ON orders.shipper_id= shippers.shipper_id
-- ORDER BY customers.customer_id

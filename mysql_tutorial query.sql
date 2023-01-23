-- //SELECT STATEMENT
-- selects the table

USE sql_inventory;
SELECT *;

-- //SELECT  CLAUSE

SELECT *
FROM customers;

-- //WHERE CLAUSE

SELECT *
FROM customers
WHERE points = 1000;

-- //AND OR NOT

SELECT *
FROM customers
WHERE state = 'ka' and state =' va';

SELECT *
FROM customers
WHERE state = 'ka' or state =' va';

-- //IN OPERATOR

SELECT *
FROM customers
WHERE states IN (' va','Ka');   -- or 

-- //BETWEEEN OPERATOR

SELECT *
FROM customers
WHERE points BETWEEN 700 AND 1000; 

-- //LIKE OPERATOR

SELECT *
FROM customers
WHERE address LIKE '%D';  -- D IN THE LAST
-- WHERE address LIKE '%D%';  --  D IN THE MIDDLE
-- WHERE address LIKE 'D%'; -- STARTS WITH D 
-- WHERE address LIKE '_H'; -- ONE SPACE AND H IN THE END
-- WHERE address LIKE 'A______U'; -- STARTS WITH D 
-- WHERE address LIKE 'D%'; -- STARTS WITH D 

-- //REGEXP STRING MANIPLATION

SELECT *
FROM customers
WHERE address REGEXP '^HUZAIR';  -- STARTS WITH
WHERE address REGEXP 'HUZAIR$';	-- ENDS WITH
WHERE address REGEXP '[ABC]H';	-- AH | BH | CH
WHERE address REGEXP '[A-G]H';	-- RANGE
WHERE address REGEXP 'HUZAIR |HUZ'; -- OR
WHERE address REGEXP '^HUZAIR | GTE';  -- STARTS WITH AND OR

-- // IS NULL OPERATOR

SELECT *
FROM customers
WHERE address IS NULL;
-- WHERE address IS NOT NULL;

-- //ORDER BY

SELECT *
FROM customers
ORDER BY customer_id;  -- ascending order
-- ORDER BY customer_id DESC, first_name DESC;  -- DESCENDING order

-- //LIMIT

-- SELECT      -- ORDER OF A QUERY
-- FROM
-- WHERE
-- ORDER BY
-- LIMIT;

SELECT *
FROM customers
LIMIT 40;  -- 40 ENTERIES ARE SHOWN
LIMIT 6,8;  -- LEV 6 ENTER 8


-- //INNER JOIN

SELECT first_name, last_name, customer_id.orders
FROM CUSTOMERS
 JOIN ORDERS 
	ON customers.customer_id= orders.customer_id;


-- //JOINING ACROSS DATABASE

SELECT *
FROM  order_items o
JOIN sql_inventory.products p
	ON o.product_id = p.product_id;
    
-- //SELF JOINING

USE sql_hr;
SELECT g.employee_id, g.first_name, h.first_name AS manager
FROM employee g
JOIN  employee h
	ON g.reports_to = h.employee_id;
    
-- //JOINING TWO TABLES

 USE sql_hr;
SELECT g.employee_id, g.first_name, h.first_name AS manager
FROM orders o
JOIN  customers c
	ON o.customer_id = c.customer_id
JOIN  order_statuses os
	ON o.status = os.order_status_id;
    
-- //COMPOUND JOINING
-- USING TWO PRIMARY KEY COMBINATION TO UNIQUELY IDENTIFY

SELECT *
FROM order_items o
JOIN order_item_notes n
	ON o.order_id = n.order_id
    AND o.product_id = n.product_id;
    
-- //IMPLICIT JOINING

SELECT *
FROM order_items o, order_item_notes n
WHERE o.customer_id = n.customer_id;

-- //OUTER JOIN

SELECT*
FROM CUSTOMERS C
JOIN ORDERS O  -- LEFT OR RIGHT
	ON C.CUSTOMER_ID = O.CUSTOMER_ID;
    
-- //OUTER JOIN BETWEEN DATABASE


-- //SELF OUTERJOIN

-- USE sql_hr;

SELECT e.employee_id, e.first_name, m.last_name AS manager
FROM employees e
LEFT JOIN employees m
	ON e.reports_to = m.employee_id;
    
-- //USING CLAUSE

-- USE sql_store;

-- SELECT *
-- FROM orders o
-- JOIN customers c
-- 	using(customer_id)   -- only both table has same name
-- LEFT JOIN shippers s
-- 	using(shipper_id);

    
--     SELECT *
-- FROM order_items oi
-- JOIN order_item_notes n
-- 	using(order_id, product_id) 

-- //NATURAL JOIN
-- JOINING BASED ON SIMILAR COLUMNS

USE sql_store;
SELECT orders.order_id, customers.first_name
FROM orders
NATURAL JOIN customers;

-- //CROSS JOIN
-- combines both table same column
 
 SELECT c.first_name AS customer,
	p.name AS PRODUCT
FROM customers c
CROSS JOIN products p
ORDER BY customer;
 
--   implicit
  SELECT c.first_name AS customer,
	p.name AS PRODUCT
FROM customers c , products p;

-- //UNION
-- combines both
SELECT order_id,
	order_date,
    'Active' AS status
FROM orders
WHERE order_date >= '2019-01-01'
 UNION
 SELECT order_id,
	order_date,
    'ARCHIVED' AS status
 FROM orders
 WHERE order_date<= '2019-01-01';

  
  -- //EX
   SELECT customer_id,
	first_name,
    points,
    'bronze' AS type
 FROM customers
 WHERE points< '2000' 
 UNION
 SELECT customer_id,
	first_name,
    points,
    'silver' AS type
 FROM customers
 WHERE points BETWEEN '2000' AND '3000'  
 UNION
 SELECT customer_id,
	first_name,
    points,
    'gold' AS type
 FROM customers
 WHERE points> '3000'
 ORDER BY first_name;
 
 
 -- //DELETE INSERT UPDATE COLUMN

INSERT INTO customers
VALUES (default, 'JOHN', 'SMITH', NULL,NULL,'ADDRESS','CITY','CA', default);

INSERT INTO customers(first_name, 
						last_name, 
                        address, 
                        city,
                        state)
VALUES ( 'JOHN', 'SMITH','ADDRESS','CITY','CA');

-- // MULTIPLE ROWS

INSERT INTO shippers(name)
VALUE('SHIPPER1'),
	('SHIPPER2'),
    ('SHIPPER3');
    
SELECT* FROM sql_store.shippers;

-- //ex
INSERT INTO products( name, quantity_in_stock, unit_price)
VALUE ('HUZAIR', 10, 55.1),
	('lrc',188, 5.55), 
	('jacob',18, 50.55);
    
-- // INSETING HIERARCHICAL ROWS
USE sql_store;
INSERT INTO orders(customer_id, order_date, status)
VALUES (1, '2019-01-02', 1);
INSERT INTO order_items
VALUES(LAST_INSERT_ID(),1,1,2.45),
		(LAST_INSERT_ID(),1,3,1.45);
-- SELECT LAST_INSERT_ID();

-- COPY TABLE

CREATE TABLE order_archived AS 
SELECT * FROM orders ;   -- sub query

INSERT INTO order_archived
SELECT * 
FROM orders
WHERE order_date <'2019-01-01';

-- ex

USE sql_invoicing;
CREATE TABLE invoicing AS
SELECT 
    i.invoice_id,
    i.number,
    c.name AS client,
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.payment_date,
    i.due_date
FROM  invoices i
	JOIN clients c
    USING (client_id)
where payment_date is not null;

-- //UPDATE DATA

UPDATE invoices
SET payment_total =10, payment_date = '2019-01-01'  -- 0 / null
WHERE invoice_id = 1

-- //self query
 

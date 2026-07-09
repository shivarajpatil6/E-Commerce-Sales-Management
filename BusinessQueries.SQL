
-- E-Commerce Sales Management SQL Queries
-- Covers:
-- Basic Queries
-- Aggregate Functions
-- JOINs
-- Subqueries
-- Business Analysis Queries


select * from customers where registration_date > '2026-01-01';

 select product_name , price  from products where
 price>(select avg(price) from products);
 
select product_name , max(price)  from products 
group by product_name
order by max(price) desc
limit 5 ;
select * from customers
where city like 'b%';

select c.category_id ,count(product_id) from products p
inner join categories c
on p.category_id = c.category_id
group by c.category_id
order by count(product_id) desc
limit 1;

select c.customer_id, concat(c.first_name,'',c.last_name) as cosname,sum(o.total_amount)  from customers c
inner join orders o
on c.customer_id =o.customer_id
group by c.customer_id,cosname
order by sum(o.total_amount) desc;

select c.customer_id , concat(c.first_name,'',c.last_name) as conname , avg(o.total_amount) from orders o
left join customers c
on o.customer_id = c.customer_id
group by c.customer_id
order by avg(o.total_amount) desc; 

select c.customer_id,concat(c.first_name,'-',c.last_name) as non ,o.order_id ,
o.order_date, o.total_amount from customers c
left join orders o
on c.customer_id = o.customer_id;
 
 
select p.product_name,c.catrgory_name,s.supplier_name,p.price
from products p
join categories c
on p.category_id = c.category_id
join suppliers s
on s.supplier_id = p.supplier_id
order by product_name;

select concat(c.first_name,'-',c.last_name) as 	omm, o.payment_id, o.order_id ,o.payment_date, o.payment_method,o.payment_status, o.amount as omm from customers c
right join orders p
on p.customer_id = c.customer_id
join payments o
on o.order_id = p.order_id
order by omm;

 select c.customer_id,concat(c.first_name,'-',c.last_name),o.order_id,o.status from customers c
 left join orders o
 on c.customer_id = o.customer_id
 where o.order_id is null; 
 
 select c.customer_id, concat(c.first_name,'-',c.last_name),
	sum(o.total_amount) from customers c
left join orders o
on c.customer_id = o.customer_id 
group by customer_id
having sum(o.total_amount)>
(select avg(o.total_amount) from    orders o)
order by   concat(c.first_name,'-',c.last_name);

select * from products
order by price desc
limit 1,1;

select c.customer_id,concat(c.first_name,'-',c.last_name),max(o.order_id)
	from customers c
join orders o
on c.customer_id = o. customer_id
group by c.customer_id
order by max(o.order_id) desc
limit 1;

SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_itmes oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_sales
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;
select database ();

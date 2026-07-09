create database e_commerce;
use e_commerce;
create table customers(
 customer_id int primary key,
 first_name varchar(20) not null,
 last_name varchar(20) not null,
 email varchar(40),
 phone_no bigint,
 city varchar(10),
 state varchar(20),
 registration_date date
 );
 
 create table categories(
 category_id int primary key,
 catrgory_name varchar(40)
 );
 
 create table suppliers(
 supplier_id int primary key,
 supplier_name varchar(40),
 city varchar(30),
 phone bigint
 );
 
 create table products(
 product_id int primary key,
 product_name varchar(40),
 category_id int,
 foreign key (category_id) references categories (category_id),
 supplier_id int,
 foreign key (supplier_id) references suppliers (supplier_id),
 price int,
 stock int
 );
 
 create table orders(
	order_id int primary key,
    customer_id int,
     foreign key (customer_id) references customers (customer_id),
	order_date date,
    total_amount int,
    status varchar(20)
    );
    
create table order_items(
order_item_id int primary key,
order_id int,
foreign key (order_id) references orders(order_id),
product_id int,
foreign key (product_id) references products (product_id),
quantity int,
price int
);

create table payments(
payment_id int primary key,
order_id int,
 foreign key (order_id) references orders (order_id),
 payment_date date,
 payment_method varchar(20),
 payment_status varchar (20),
 amount int);
 

 








 
 
 
 
 
 
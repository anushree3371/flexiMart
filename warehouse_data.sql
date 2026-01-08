INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,false),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,false),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,false),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,false),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,false),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,true),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,true),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,false),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,false),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,false),
(20240111,'2024-01-11','Thursday',11,1,'January','Q1',2024,false),
(20240112,'2024-01-12','Friday',12,1,'January','Q1',2024,false),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,true),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,true),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,false),
(20240116,'2024-01-16','Tuesday',16,1,'January','Q1',2024,false),
(20240117,'2024-01-17','Wednesday',17,1,'January','Q1',2024,false),
(20240118,'2024-01-18','Thursday',18,1,'January','Q1',2024,false),
(20240119,'2024-01-19','Friday',19,1,'January','Q1',2024,false),
(20240120,'2024-01-20','Saturday',20,1,'January','Q1',2024,true),
(20240121,'2024-01-21','Sunday',21,1,'January','Q1',2024,true),
(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,false),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,false),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,true),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,true),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,false),
(20240206,'2024-02-06','Tuesday',6,2,'February','Q1',2024,false),
(20240207,'2024-02-07','Wednesday',7,2,'February','Q1',2024,false),
(20240208,'2024-02-08','Thursday',8,2,'February','Q1',2024,false),
(20240209,'2024-02-09','Friday',9,2,'February','Q1',2024,false);


------------------------------------------------------------------------

INSERT INTO dim_product
(product_id, product_name, category, subcategory, unit_price) VALUES
('ELEC001','Laptop','Electronics','Computers',75000),
('ELEC002','Smartphone','Electronics','Mobile',45000),
('ELEC003','Smart TV','Electronics','Television',60000),
('ELEC004','Headphones','Electronics','Audio',3000),
('ELEC005','Smart Watch','Electronics','Wearable',15000),

('FASH001','Running Shoes','Fashion','Footwear',3500),
('FASH002','T-Shirt','Fashion','Clothing',1200),
('FASH003','Jeans','Fashion','Clothing',2800),
('FASH004','Jacket','Fashion','Outerwear',5500),
('FASH005','Sunglasses','Fashion','Accessories',2200),

('GROC001','Basmati Rice','Groceries','Grains',650),
('GROC002','Cooking Oil','Groceries','Oil',1200),
('GROC003','Sugar','Groceries','Staples',100),
('GROC004','Tea','Groceries','Beverages',450),
('GROC005','Coffee','Groceries','Beverages',800);


--------------------------------------------------------

INSERT INTO dim_customer
(customer_id, customer_name, city, state, customer_segment) VALUES
('C001','Rahul Sharma','Mumbai','Maharashtra','Premium'),
('C002','Priya Patel','Ahmedabad','Gujarat','Regular'),
('C003','Amit Kumar','Delhi','Delhi','New'),
('C004','Sneha Reddy','Hyderabad','Telangana','Regular'),
('C005','Vikram Singh','Mumbai','Maharashtra','Premium'),
('C006','Anjali Mehta','Ahmedabad','Gujarat','Regular'),
('C007','Ravi Verma','Delhi','Delhi','New'),
('C008','Pooja Iyer','Hyderabad','Telangana','Premium'),
('C009','Karthik Nair','Mumbai','Maharashtra','Regular'),
('C010','Deepa Gupta','Delhi','Delhi','Premium'),
('C011','Arjun Rao','Hyderabad','Telangana','New'),
('C012','Neha Shah','Ahmedabad','Gujarat','Regular');

-----------------------------------

INSERT INTO fact_sales
(date_key, product_key, customer_key, quantity_sold, unit_price, discount_amount, total_amount) VALUES
(20240106,1,1,2,75000,5000,145000),
(20240107,2,2,1,45000,2000,43000),
(20240113,3,3,1,60000,3000,57000),
(20240114,4,4,3,3000,0,9000),
(20240120,5,5,2,15000,1000,29000),

(20240121,6,6,2,3500,0,7000),
(20240203,7,7,4,1200,0,4800),
(20240204,8,8,1,2800,0,2800),
(20240210,9,9,1,5500,500,5000),
(20240211,10,10,2,2200,0,4400),

(20240106,11,11,5,650,0,3250),
(20240107,12,12,3,1200,0,3600),
(20240113,13,1,10,100,0,1000),
(20240114,14,2,2,450,0,900),
(20240120,15,3,1,800,0,800),

(20240121,1,4,1,75000,5000,70000),
(20240203,2,5,2,45000,3000,87000),
(20240204,3,6,1,60000,0,60000),
(20240210,4,7,4,3000,0,12000),
(20240211,5,8,1,15000,0,15000),

(20240106,6,9,3,3500,0,10500),
(20240107,7,10,2,1200,0,2400),
(20240113,8,11,1,2800,0,2800),
(20240114,9,12,1,5500,0,5500),
(20240120,10,1,2,2200,0,4400),

(20240121,11,2,6,650,0,3900),
(20240203,12,3,3,1200,0,3600),
(20240204,13,4,12,100,0,1200),
(20240210,14,5,3,450,0,1350),
(20240211,15,6,2,800,0,1600),

(20240106,2,7,1,45000,2000,43000),
(20240107,3,8,1,60000,0,60000),
(20240113,4,9,2,3000,0,6000),
(20240114,5,10,1,15000,0,15000),
(20240120,1,11,1,75000,5000,70000);

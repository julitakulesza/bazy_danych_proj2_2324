--inserting records into database

INSERT INTO discount (name, description, discount_percentage, active)
VALUES 
('10% Off', 'Get 10% off on your purchase', 10, 0),
('Holiday Sale','Special discounts for the holiday season', 15, 0),
('Clearance','Clearance sale on selected items',20,1),
('First Purchase','Exclusive discount for first-time customers',5,0),
('Bundle Discount','Save more with our bundle discounts',8,1)

INSERT INTO order_details (user_id, total, date)
VALUES 
(1,1500000,'2023-01-10 08:45:00.0000000 +00:00'),
(2,2500000,'2023-02-25 10:30:00.0000000 +00:00'),
(3,1200000,	'2023-03-30 12:00:00.0000000 +00:00'),
(4,800000,'2023-04-20 09:15:00.0000000 +00:00'),
(5,2000000,'2023-05-15 14:30:00.0000000 +00:00')

INSERT INTO order_items (order_id, product_id, quantity)
VALUES 
(7,1,2),
(8,1,5),
(9,2,19),
(10,2,7),
(11,3,16)

INSERT INTO product (name, description, category_id, introduced_at, discontinued_at, discount_id, [price per unit], inventory_id)
VALUES
('Laptop', '{"word_description": "High-performance", "purpose": "High-performance laptop with SSD storage", "target_group": "General users"}', 101,	'2023-01-01 08:00:00.0000000 +00:00','2023-12-31 18:00:00.0000000 +00:00', 1, 20000000, 1),
('Smartphone', '{"word_description": "6.5-inch display, dual camera", "purpose": "Communication and photography", "target_group": "Tech enthusiasts"}',102,	'2023-02-15 10:30:00.0000000 +00:00',	NULL,3,	30000000,2),
('Headphones', '{"word_description": "Noise-canceling wireless", "purpose": "Headphones", "target_group": "Music lovers"}', 103,	'2023-03-20 12:45:00.0000000 +00:00','2023-11-30 20:00:00.0000000 +00:00',2,1650000,3),
('Smart Watch', '{"word_description": "Fitness tracking and heart rate monitor", "purpose": "Smart Wearable", "target_group": "Fitness enthusiasts"}', 104,'2023-04-10 09:15:00.0000000 +00:00',NULL,7,10000000,4),
('4K Smart TV', '{"word_description": "55-inch LED display with smart features", "purpose": "Home entertainment", "target_group": "Home users"}',105,'2023-05-05 15:00:00.0000000 +00:00','2024-05-05 20:00:00.0000000 +00:00',4,15000000,5)

INSERT INTO product_category (name, description)
VALUES
('Laptops','High-performance laptops with SSD storage'),
('Smart Devices',	'Smartphones, smartwatches, and more'),
('Audio',	'Headphones, speakers, and sound accessories'),
('Home Appliances', 'Kitchen and home appliances'),
('TV and Entertainment','4K Smart TVs and entertainment systems')

INSERT INTO product_inventory (quantity)
VALUES
(100),
(31),
(45),
(216),
(67)

INSERT INTO [user] (username, password, first_name, last_name, created_at, updated_at)
VALUES
('johndoe','hashedpassword','John','Doe','2023-01-01 08:00:00.0000000 +00:00',NULL),
('janedoe','hashedpassword','Jane',	'Doe','2023-02-15 10:30:00.0000000 +00:00',NULL),
('alice99',	'hashedpassword','Alice','Smith','2023-03-20 12:45:00.0000000 +00:00',NULL),
('bobj','hashedpassword','Bob','Johnson','2023-04-10 09:15:00.0000000 +00:00',NULL),
('EvaB','hashedpassword','Eva','Brown',	'2023-05-05 15:00:00.0000000 +00:00','2023-10-15 11:30:00.0000000 +00:00')

INSERT INTO user_address ([user_id], address_street,address_building,city,postal_code,country,telephone)
VALUES
(1,'Main Street',	'Apt 101',	'Cityville',	'12345',	'USA',	'123-456-7890'),
(2,'Oak Avenue', 'Unit 202','Townsville','56789','USA','987-654-3210'),
(3,'Maple Lane','Building 303','Villageton',	'10101','USA','555-123-4567'),
(4,'Pine Street','Suite 404','Hamlet City','20202','USA','111-222-3333'),
(5,	'Road',	'Floor 5',	'Burgville',	'30303','UK','999-888-7777')
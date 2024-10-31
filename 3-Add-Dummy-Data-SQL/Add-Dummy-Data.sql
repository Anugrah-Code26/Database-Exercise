-- Inserting Dummy Data into Users Table
INSERT INTO Users (username, email, password, phone_number, store_owner) values
    ('Mario', 'mario@example.com', 'hashed_password1', '123-456-7890', FALSE),
    ('Luigi', 'luigi@example.com', 'hashed_password2', '098-765-4321', FALSE),
    ('Peach', 'peach@example.com', 'hashed_password3', '567-890-1234', FALSE),
    ('Toad', 'toad@example.com', 'hashed_password4', '112-765-4321', TRUE),
    ('Koopa', 'koopa@example.com', 'hashed_password5', '223-890-1234', TRUE),
    ('Anugrah COC', 'anugrah.coc@example.com', 'hashed_password', '111-222-3333', TRUE),
    ('Sum Ting Wong', 'sum.ting.wong@example.com', 'hashed_password0', '222-333-4444', FALSE);
   
-- Inserting Dummy Data into Country Table
INSERT INTO Country (name) VALUES ('Indonesia');

-- Inserting Dummy Data into Province Table
INSERT INTO Province (name, country_id) values
    ('Jawa Barat', 1),
    ('DKI Jakarta', 1),
   	('Kepulauan Riau', 1);

-- Inserting Dummy Data into City_Regency Table
INSERT INTO City_Regency (name, province_id, type) VALUES 
	('Bandung', 1, 'City'),
    ('Bekasi', 1, 'Regency'),
    ('Jakarta Selatan', 2, 'City'),
	('Kota Batam', 3, 'City');

-- Inserting Dummy Data into District Table
INSERT INTO District (name, city_regency_id) values
    ('Bandung Wetan', 1),
    ('Bekasi Utara', 2),
    ('Setiabudi', 3),
   	('Kecamatan Nongsa', 4);

-- Inserting Dummy Data into Sub_district Table
INSERT INTO Sub_district (name, postal_code, district_id) VALUES 
    ('Cihapit', '40114', 1),
    ('Harapan Baru', '17122', 2),
    ('Kuningan', '12940', 3),
   	('Sambau', '29466', 4);
   
-- Inserting Dummy Data into Address Table
INSERT INTO Addresses (user_id, sub_district_id, name, note, label, is_main) values
    (1, 1, '123 Mushroom Kingdom Ave', 'Near Mushroom Castle', 'Home', TRUE),
    (1, 3, '777 Star Road', 'Near Pizza Star Store', 'Office', FALSE),
    (2, 1, '456 Mushroom Kingdom Ave', 'Near Mushroom Fountain', 'Home', TRUE),
    (3, 2, '789 Princess Castle Blvd', 'Near Princess Peach Mansion', 'Home', TRUE),
    (4, 1, '112 Mushroom Kingdom Ave', 'Near Mushroom Super Mall', 'Office', TRUE),
    (5, 3, '223 Bowser Castle Blvd', 'Near Bowser Castle', 'Office', TRUE),
   	(6, 1, 'Jalan Bandung Wetan Cihapit', 'Dekat Pom Bensin Cihapit', 'Office', TRUE),
	(7, 4, 'Digital Park', 'Dekat Digital Park', 'Home', TRUE);

-- Inserting Dummy Data into Stores Table
INSERT INTO Stores (name, email, phone_number, address_id, user_id) VALUES 
	('Toad Motorbike', 'toad.motorbike@example.com', '122-456-7890', 5, 4),
    ('Koopa Racekart', 'koopa.racekart@example.com', '233-765-4321', 6, 5),
    ('COC Komputer', 'coc.komputer@example.com', '333-444-5555', 7, 6);
   
-- Inserting Dummy Data into Products Table
INSERT INTO Products (name, description, price, stock_quantity, weight_grams, category_id, store_id, image_url) values
    ('Mushroom Kart', 'A high-speed kart powered by mushrooms', 3000000.00, 10, 30000.00, 1, 1, 'https://example.com/mushroom_kart.jpg'),
    ('Fire Flower Helmet', 'A helmet inspired by the fire flower', 225000.00, 50, 1250.00,  2, 2,  'https://example.com/fire_flower_helmet.jpg'),
    ('Starman Suit', 'A suit that gives temporary invincibility', 600000.00, 20, 2500.00,  3, 1, 'https://example.com/starman_suit.jpg'),
    ('Power Gloves', 'Gloves that enhance grip and control', 112500.00, 100, 500, 3, 2, 'https://example.com/power_gloves.jpg'),
	('SAPPIHERE NITRO+ Radeon RX 7900 XTX 24GB', 'High-performance GPU with 24GB memory, ideal for 4K gaming, VR, and ray tracing', 20500000.00, 30, 5000, 4, 3, 'https://example.com/radeon-rtx-7900-xtx-24gb.jpg'),
	('Speed Boots', 'Boots designed for maximum speed enhancement', 180000.00, 40, 500.00, 2, 1, 'https://example.com/speed_boots.jpg');

-- Inserting Dummy Data into Categories Table
INSERT INTO Categories (name, image_url) values
	('Vehicles', 'https://example.com/vehicles.jpg'),
	('Accessories', 'https://example.com/accessories.jpg'),
	('Apparel', 'https://example.com/apparel.jpg'),
	('GPU', 'https://example.com/gpu.jpg');

INSERT INTO Payment_Status (name) values
	('Waiting For Payment'),
	('Payment Received'),
	('Payment Expired'),
	('Payment Failed');

INSERT INTO Order_Status (name) values
	('Waiting For Payment'),
	('Waiting For Confirmation'),
	('In Process'),
	('On Delivery'),
	('Arrive At Destination'),
	('Completed'),
	('Failed');
	('Complained');

-- Inserting Dummy Data into Orders Table
INSERT INTO Orders (user_id, order_date, total_weight_grams, total_amount, order_status_id) VALUES 
    (1, '2024-10-28 12:34:56', 30000.00, 3000000.00, 6),
    (1, '2024-10-28 12:34:56', 3000.00, 450000.00, 4),
    (2, '2024-10-29 13:22:18', 2000.00, 225000.00, 3),
    (3, '2024-10-30 14:45:32', 3000.00, 780000.00, 5),
    (7, '2024-10-31 15:04:26', 5000.00, 20500000.00, 3);

-- Inserting Dummy Data into Order_Items Table
INSERT INTO Order_Items (order_id, product_id, quantity, price_per_unit) VALUES 
    (1, 1, 1, 3000000.00),  -- Mushroom Kart in Order 1
    (2, 2, 1, 225000.00),   -- Fire Flower Helmet in Order 2
    (2, 4, 2, 112500.00),   -- Power Gloves in Order 2
    (3, 2, 1, 225000.00),   -- Fire Flower Helmet in Order 3
    (4, 6, 1, 180000.00),  	-- Speed Boots in Order 4
    (4, 3, 1, 600000.00),   -- Starman Suit in Order 4
	(5, 5, 1, 20500000.00);	-- GPU in order 5	
    
-- Inserting Dummy Data into Couriers table
INSERT INTO Couriers (name, code) VALUES 
    ('JNE', 'jne'),
    ('POS Indonesia', 'pos'),
    ('TIKI', 'tiki'),
   	('J&T', 'j&t');

-- Inserting Dummy Data into Shipping_Services table
INSERT INTO Shipping_Services (courier_id, service_name, description) VALUES 
    (1, 'REG', 'Regular Service'),
    (1, 'YES', 'Yakin Esok Sampai (Express Service)'),
    (2, 'Paket Kilat Khusus', 'Express Service'),
    (2, 'Paket Pos Biasa', 'Regular Service'),
    (3, 'ECO', 'Economy Service'),
    (3, 'ONS', 'Over Night Service'),
    (4, 'REG', 'Regular');
    
-- Inserting Dummy Data into Shipping_Cost Table
-- Dummy data for Shipping_Costs table with weights 1 kg, 2 kg, and 30 kg

-- JNE Regular service
INSERT INTO Shipping_Costs (service_id, origin_city_id, destination_city_id, weight_grams, cost, shipping_insurance_cost, estimated_delivery_time) VALUES
	(1, 1, 3, 1000, 9000, 900, '1-2 days'),   		-- JNE Regular from Bandung to Jakarta, 1 kg
    (1, 1, 2, 1000, 8000, 800, '1-2 days'),   		-- JNE Regular from Bandung to Bekasi, 1 kg
	(1, 1, 3, 2000, 18000, 1800, '1-2 days'),   	-- JNE Regular from Bandung to Jakarta, 2 kg
    (1, 1, 3, 3000, 27000, 2700, '1-2 days'),   	-- JNE Regular from Bandung to Jakarta, 3 kg
    (1, 1, 3, 30000, 270000, 27000, '5-7 days'); 	-- JNE Regular from Bandung to Jakarta, 30 kg

-- POS Indonesia Express service
INSERT INTO Shipping_Costs (service_id, origin_city_id, destination_city_id, weight_grams, cost, shipping_insurance_cost, estimated_delivery_time) VALUES
    (3, 3, 1, 1000, 10000, 1000, '2-3 days'),  		-- POS Kilat Khusus from Jakarta to Bandung, 1 kg
	(3, 3, 1, 2000, 15000, 1500, '2-3 days'),   	-- POS Kilat Khusus from Jakarta to Bandung, 2 kg
    (3, 3, 1, 3000, 22000, 2200, '2-3 days'),   	-- POS Kilat Khusus from Jakarta to Bandung, 3 kg
    (3, 3, 1, 30000, 200000, 20000, '5-10 days'); 	-- POS Kilat Khusus from Jakarta to Bandung, 30 kg

-- TIKI Economy service
INSERT INTO Shipping_Costs (service_id, origin_city_id, destination_city_id, weight_grams, cost, shipping_insurance_cost, estimated_delivery_time) VALUES
	(5, 1, 3, 1000, 7500, 750, '3-5 days'),   		-- TIKI ECO from Bandung to Jakarta, 1 kg
	(5, 1, 3, 2000, 15000, 1500, '3-5 days'),   	-- TIKI ECO from Bandung to Jakarta, 2 kg
    (5, 1, 3, 3000, 22500, 2250, '3-5 days'),   	-- TIKI ECO from Bandung to Jakarta, 3 kg
    (5, 1, 2, 3000, 18000, 1800, '3-5 days'),       -- TIKI ECO from Bandung to Bekasi, 3 kg
    (5, 1, 3, 30000, 225000, 22500, '7-14 days'); 	-- TIKI ECO from Bandung to Jakarta, 30 kg
    
-- Dummy data for Shipping_Costs table J%T - Regular with weights 5 kg
INSERT INTO Shipping_Costs (service_id, origin_city_id, destination_city_id, weight_grams, cost, shipping_insurance_cost, estimated_delivery_time) VALUES
    (7, 1, 4, 5000, 126000, 57700, '7-10 days');

-- Inserting Dummy Data into Payment_Categories Table
INSERT INTO Payment_Categories (name) VALUES 
    ('E-Money'),
    ('Virtual Account');
   
-- Inserting Dummy Data into Payment_Methods Table
INSERT INTO Payment_Methods (payment_category_id , name) VALUES 
    (1, 'GoPay'),
    (1, 'OVO'),
    (1, 'DANA'),
    (2, 'BNI Virtual Account'),
    (2, 'BCA Virtual Account');

-- Inserting Dummy Data into Payments Table
INSERT INTO Payments (
    order_id, 
    invoice_code, 
    payment_date, 
    total_amount, 
    shipping_cost_id, 
    total_shipping_cost, 
    shipping_insurance_cost, 
    total_expenditure,
    service_cost,
    app_service_cost,
    total_bill,
    payment_method_id,
    payment_status_id
) VALUES 
    (1, 'INV/20330107/MPL/5254854354', '2024-10-28 12:45:00', 30000000.00, 5, 270000.00, 27000.00, 3297000.00, 1000, 1000, 3299000.00, 1, 2),
    (2, 'INV/20330108/MPL/4502556871', '2024-10-28 12:47:00', 450000.00, 8, 22000.00, 2200.00, 474200.00, 1000, 1000, 476200.00, 2, 2),
    (3, 'INV/20330109/MPL/1248635492', '2024-10-29 13:30:00', 225000.00, 7, 15000.00, 1500.00, 241500.00, 1000, 1000, 243500.00, 3, 2),
    (4, 'INV/20330110/MPL/5655741260', '2024-10-30 15:01:11', 780000.00, 13, 18000.00, 1800.00, 799800.00, 1000, 1000, 801800.00, 4, 2),
    (5, 'INV/20330111/MPL/3694776524', '2024-10-31 15:08:23', 20500000.00, 15, 126000.00, 57700.00, 20683000.00, 1000, 1000, 20685000.00, 5, 2);

   
-- Inserting Dummy Data into Shipping Table
INSERT INTO Shipping (order_id, shipping_date, shipping_address, status, tracking_number) VALUES 
    (1, '2024-10-29 10:00:00', '123 Mushroom Kingdom Ave', 'Delivered', 'TRACKMARIO123'),
    (2, NULL, '456 Mushroom Kingdom Ave', 'Pending', NULL),
    (3, '2024-10-31 08:30:00', '789 Princess Castle Blvd', 'In Transit', 'TRACKPEACH456');


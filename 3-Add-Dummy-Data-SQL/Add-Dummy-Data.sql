-- Inserting Dummy Data into Users Table
INSERT INTO Users (username, email, password, address, phone_number) VALUES 
    ('mario', 'mario@example.com', 'hashed_password1', '123 Mushroom Kingdom Ave', '123-456-7890'),
    ('luigi', 'luigi@example.com', 'hashed_password2', '456 Mushroom Kingdom Ave', '098-765-4321'),
    ('peach', 'peach@example.com', 'hashed_password3', '789 Princess Castle Blvd', '567-890-1234');
   
-- Inserting Dummy Data into Categories Table
INSERT INTO Categories (name, image_url) values
	('Vehicles', 'https://example.com/vehicles.jpg'),
	('Accessories', 'https://example.com/accessories.jpg'),
	('Apparel', 'https://example.com/apparel.jpg');

-- Inserting Dummy Data into Products Table
INSERT INTO Products (name, description, price, stock_quantity, category_id, image_url) VALUES 
    ('Mushroom Kart', 'A high-speed kart powered by mushrooms', 2000.00, 10, 1, 'https://example.com/mushroom_kart.jpg'),
    ('Fire Flower Helmet', 'A helmet inspired by the fire flower', 150.00, 50, 2, 'https://example.com/fire_flower_helmet.jpg'),
    ('Starman Suit', 'A suit that gives temporary invincibility', 400.00, 20, 3, 'https://example.com/starman_suit.jpg'),
    ('Power Gloves', 'Gloves that enhance grip and control', 75.00, 100, 3, 'https://example.com/power_gloves.jpg');

-- Inserting Dummy Data into Orders Table
INSERT INTO Orders (user_id, order_date, total_amount, status) VALUES 
    (1, '2024-10-28 12:34:56', 2150.00, 'Completed'),
    (2, '2024-10-29 13:22:18', 150.00, 'Pending'),
    (3, '2024-10-30 14:45:32', 2400.00, 'Shipped');

-- Inserting Dummy Data into Order_Items Table
INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES 
    (1, 1, 1, 2000.00),  -- Mushroom Kart in Order 1
    (1, 2, 1, 150.00),   -- Fire Flower Helmet in Order 1
    (1, 4, 2, 75.00),    -- Power Gloves in Order 1
    (2, 2, 1, 150.00),   -- Fire Flower Helmet in Order 2
    (3, 1, 1, 2000.00),  -- Mushroom Kart in Order 3
    (3, 3, 1, 400.00);   -- Starman Suit in Order 3

-- Inserting Dummy Data into Payments Table
INSERT INTO Payments (order_id, payment_date, amount, payment_method, status) VALUES 
    (1, '2024-10-28 12:45:00', 2150.00, 'Credit Card', 'Completed'),
    (2, '2024-10-29 13:30:00', 150.00, 'PayPal', 'Pending'),
    (3, '2024-10-30 15:00:00', 2400.00, 'Credit Card', 'Completed');

-- Inserting Dummy Data into Shipping Table
INSERT INTO Shipping (order_id, shipping_date, shipping_address, status, tracking_number) VALUES 
    (1, '2024-10-29 10:00:00', '123 Mushroom Kingdom Ave', 'Delivered', 'TRACKMARIO123'),
    (2, NULL, '456 Mushroom Kingdom Ave', 'Pending', NULL),
    (3, '2024-10-31 08:30:00', '789 Princess Castle Blvd', 'In Transit', 'TRACKPEACH456');


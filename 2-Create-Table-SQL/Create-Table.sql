-- Creating Users Table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    phone_number VARCHAR(15),
    store_owner BOOLEAN DEFAULT FALSE
);

-- Creating Country Table (Negara)
CREATE TABLE Country (
    country_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Creating Province Table (Provinsi)
CREATE TABLE Province (
    province_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country_id INT REFERENCES Country(country_id)
);

-- Creating City/Regency Table (Kota/Kabupaten)
CREATE TABLE City_Regency (
    city_regency_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    province_id INT REFERENCES Province(province_id),
    type VARCHAR(10) CHECK (type IN ('City', 'Regency'))
);

-- Creating District Table (Kecamatan)
CREATE TABLE District (
    district_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city_regency_id INT REFERENCES City_Regency(city_regency_id)
);

-- Creating Sub District Table (Kelurahan/Desa)
CREATE TABLE Sub_District (
    sub_district_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    district_id INT REFERENCES District(district_id)
);

-- Creating Address Table (Alamat)
CREATE TABLE Addresses (
    address_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    note VARCHAR(100),
    label VARCHAR(20) NOT NULL,
    is_main BOOLEAN DEFAULT FALSE,
    user_id INT REFERENCES Users(user_id),
    sub_district_id INT REFERENCES Sub_District(sub_district_id)
);

-- Creating Stores Table
CREATE TABLE Stores (
    store_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(255) UNIQUE,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    address_id INT REFERENCES Addresses(address_id)
);

-- Creating Products Table
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    image_url VARCHAR(255),
    category_id INT REFERENCES Categories(category_id),
    weight_grams NUMERIC(10, 2) NOT NULL,
    store_id INT REFERENCES Stores(store_id),
);

-- Creating Categories Table
CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    image_url VARCHAR(255)
);

-- Creating Order_Status Table
CREATE TABLE Order_Status (
    order_status_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Creating Payment_Status Table
CREATE TABLE Payment_Status (
    payment_status_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Creating Orders Table
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    order_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    total_unit INT,
    total_weight_grams NUMERIC(10, 2),
    total_amount NUMERIC(10, 2),
    order_status_id INT REFERENCES Order_Status(order_status_id),
);

-- Creating Order_Items Table
CREATE TABLE Order_Items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES Orders(order_id),
    product_id INT REFERENCES Products(product_id),
    quantity INT NOT NULL,
    price_per_unit NUMERIC(10, 2) NOT NULL
);

-- Creating Couriers Table
CREATE TABLE Couriers (
    courier_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT null,
    code VARCHAR(50) NOT NULL UNIQUE
);

-- Creating Shipping_Services Table
CREATE TABLE Shipping_Services (
    service_id SERIAL PRIMARY KEY,
    courier_id INT REFERENCES Couriers(courier_id),
    service_name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

-- Creating Shipping_Costs Table
CREATE TABLE Shipping_Costs (
    shipping_cost_id SERIAL PRIMARY KEY,
    service_id INT REFERENCES Shipping_Services(service_id),
    origin_city_id INT REFERENCES City_Regency(city_regency_id),
    destination_city_id INT REFERENCES City_Regency(city_regency_id),
    weight_grams INT NOT NULL,
    cost NUMERIC(10, 2) NOT NULL,
    shipping_insurance_cost NUMERIC(10, 2) NOT NULL,
    estimated_delivery_time VARCHAR(50)
);

-- Creating Payment_Categories Table
CREATE TABLE Payment_Categories (
    payment_category_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Creating Payment_Methods Table
CREATE TABLE Payment_Methods (
    payment_method_id SERIAL PRIMARY KEY,
    payment_category_id INT REFERENCES Payment_Categories(payment_category_id),
    name VARCHAR(50) NOT NULL
);

-- Creating Payments Table
CREATE TABLE Payments (
    payment_id SERIAL PRIMARY KEY,
    invoice_code VARCHAR(50) NOT NULL,
    order_id INT REFERENCES Orders(order_id),
    payment_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    total_amount NUMERIC(10, 2) NOT NULL,
    shipping_cost_id INT REFERENCES Shipping_Costs(shipping_cost_id),
    total_shipping_cost NUMERIC(10,2) NOT NULL,
    shipping_insurance_cost NUMERIC(10,2) NOT NULL,
    total_expenditure NUMERIC(10, 2) NOT NULL,
    service_cost NUMERIC(6, 2) DEFAULT 1000 NOT NULL,
    app_service_cost NUMERIC(6, 2) DEFAULT 1000 NOT NULL,
    total_bill NUMERIC(10,2) NOT NULL,
    payment_method_id INT REFERENCES Payment_Methods(payment_method_id),
    payment_status_id INT REFERENCES Payment_Status(payment_status_id)
);

-- Creating Shipping Table
CREATE TABLE Shipping (
    shipping_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES Orders(order_id),
    shipping_date TIMESTAMPTZ,
    shipping_address VARCHAR(255),
    status VARCHAR(50) DEFAULT 'Pending',
    tracking_number VARCHAR(255)
);


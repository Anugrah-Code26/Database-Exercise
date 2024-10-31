-- public.categories definition

-- Drop table

-- DROP TABLE public.categories;

CREATE TABLE public.categories (
	category_id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	image_url varchar(255) NULL,
	CONSTRAINT categories_pkey PRIMARY KEY (category_id)
);


-- public.country definition

-- Drop table

-- DROP TABLE public.country;

CREATE TABLE public.country (
	country_id int4 DEFAULT nextval('country_id_seq'::regclass) NOT NULL,
	"name" varchar(100) NOT NULL,
	CONSTRAINT country_pkey PRIMARY KEY (country_id)
);


-- public.couriers definition

-- Drop table

-- DROP TABLE public.couriers;

CREATE TABLE public.couriers (
	courier_id serial4 NOT NULL,
	"name" varchar(100) NOT NULL,
	code varchar(50) NOT NULL,
	CONSTRAINT couriers_code_key UNIQUE (code),
	CONSTRAINT couriers_pkey PRIMARY KEY (courier_id)
);


-- public.order_status definition

-- Drop table

-- DROP TABLE public.order_status;

CREATE TABLE public.order_status (
	order_status_id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT order_status_pkey PRIMARY KEY (order_status_id)
);


-- public.payment_categories definition

-- Drop table

-- DROP TABLE public.payment_categories;

CREATE TABLE public.payment_categories (
	payment_category_id serial4 NOT NULL,
	"name" varchar(50) NOT NULL,
	CONSTRAINT payment_categories_pkey PRIMARY KEY (payment_category_id)
);


-- public.payment_status definition

-- Drop table

-- DROP TABLE public.payment_status;

CREATE TABLE public.payment_status (
	payment_status_id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT payment_status_pkey PRIMARY KEY (payment_status_id)
);


-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
	user_id serial4 NOT NULL,
	username varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	"password" varchar(255) NOT NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	phone_number varchar(15) NULL,
	store_owner bool DEFAULT false NULL,
	CONSTRAINT users_email_key UNIQUE (email),
	CONSTRAINT users_pkey PRIMARY KEY (user_id)
);


-- public.orders definition

-- Drop table

-- DROP TABLE public.orders;

CREATE TABLE public.orders (
	order_id serial4 NOT NULL,
	user_id int4 NULL,
	order_date timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	total_amount numeric(10, 2) NULL,
	order_status_id int4 NULL,
	total_weight_grams numeric(10, 2) NULL,
	CONSTRAINT orders_pkey PRIMARY KEY (order_id),
	CONSTRAINT orders_order_status_id_fkey FOREIGN KEY (order_status_id) REFERENCES public.order_status(order_status_id),
	CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id)
);


-- public.payment_methods definition

-- Drop table

-- DROP TABLE public.payment_methods;

CREATE TABLE public.payment_methods (
	payment_method_id serial4 NOT NULL,
	payment_category_id int4 NULL,
	"name" varchar(50) NOT NULL,
	CONSTRAINT payment_methods_pkey PRIMARY KEY (payment_method_id),
	CONSTRAINT payment_methods_payment_category_id_fkey FOREIGN KEY (payment_category_id) REFERENCES public.payment_categories(payment_category_id)
);


-- public.province definition

-- Drop table

-- DROP TABLE public.province;

CREATE TABLE public.province (
	province_id int4 DEFAULT nextval('province_id_seq'::regclass) NOT NULL,
	"name" varchar(100) NOT NULL,
	country_id int4 NULL,
	CONSTRAINT province_pkey PRIMARY KEY (province_id),
	CONSTRAINT province_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(country_id)
);


-- public.shipping definition

-- Drop table

-- DROP TABLE public.shipping;

CREATE TABLE public.shipping (
	shipping_id serial4 NOT NULL,
	order_id int4 NULL,
	shipping_date timestamptz NULL,
	shipping_address varchar(255) NULL,
	status varchar(50) DEFAULT 'Pending'::character varying NULL,
	tracking_number varchar(255) NULL,
	CONSTRAINT shipping_pkey PRIMARY KEY (shipping_id),
	CONSTRAINT shipping_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id)
);


-- public.shipping_services definition

-- Drop table

-- DROP TABLE public.shipping_services;

CREATE TABLE public.shipping_services (
	service_id serial4 NOT NULL,
	courier_id int4 NULL,
	service_name varchar(50) NOT NULL,
	description varchar(255) NULL,
	CONSTRAINT shipping_services_pkey PRIMARY KEY (service_id),
	CONSTRAINT shipping_services_courier_id_fkey FOREIGN KEY (courier_id) REFERENCES public.couriers(courier_id)
);


-- public.city_regency definition

-- Drop table

-- DROP TABLE public.city_regency;

CREATE TABLE public.city_regency (
	city_regency_id int4 DEFAULT nextval('city_regency_id_seq'::regclass) NOT NULL,
	"name" varchar(100) NOT NULL,
	province_id int4 NULL,
	"type" varchar(10) NULL,
	CONSTRAINT city_regency_pkey PRIMARY KEY (city_regency_id),
	CONSTRAINT city_regency_type_check CHECK (((type)::text = ANY ((ARRAY['City'::character varying, 'Regency'::character varying])::text[]))),
	CONSTRAINT city_regency_province_id_fkey FOREIGN KEY (province_id) REFERENCES public.province(province_id)
);


-- public.district definition

-- Drop table

-- DROP TABLE public.district;

CREATE TABLE public.district (
	district_id int4 DEFAULT nextval('district_id_seq'::regclass) NOT NULL,
	"name" varchar(100) NOT NULL,
	city_regency_id int4 NULL,
	CONSTRAINT district_pkey PRIMARY KEY (district_id),
	CONSTRAINT district_city_regency_id_fkey FOREIGN KEY (city_regency_id) REFERENCES public.city_regency(city_regency_id)
);


-- public.shipping_costs definition

-- Drop table

-- DROP TABLE public.shipping_costs;

CREATE TABLE public.shipping_costs (
	shipping_cost_id serial4 NOT NULL,
	service_id int4 NULL,
	origin_city_id int4 NULL,
	destination_city_id int4 NULL,
	weight_grams int4 NOT NULL,
	"cost" numeric(10, 2) NOT NULL,
	estimated_delivery_time varchar(50) NULL,
	shipping_insurance_cost numeric(10, 2) NULL,
	CONSTRAINT shipping_costs_pkey PRIMARY KEY (shipping_cost_id),
	CONSTRAINT shipping_costs_destination_city_id_fkey FOREIGN KEY (destination_city_id) REFERENCES public.city_regency(city_regency_id),
	CONSTRAINT shipping_costs_origin_city_id_fkey FOREIGN KEY (origin_city_id) REFERENCES public.city_regency(city_regency_id),
	CONSTRAINT shipping_costs_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.shipping_services(service_id)
);


-- public.sub_district definition

-- Drop table

-- DROP TABLE public.sub_district;

CREATE TABLE public.sub_district (
	sub_district_id int4 DEFAULT nextval('sub_district_id_seq'::regclass) NOT NULL,
	"name" varchar(100) NOT NULL,
	postal_code varchar(10) NOT NULL,
	district_id int4 NULL,
	CONSTRAINT sub_district_pkey PRIMARY KEY (sub_district_id),
	CONSTRAINT sub_district_district_id_fkey FOREIGN KEY (district_id) REFERENCES public.district(district_id)
);


-- public.addresses definition

-- Drop table

-- DROP TABLE public.addresses;

CREATE TABLE public.addresses (
	address_id serial4 NOT NULL,
	"name" varchar(100) NOT NULL,
	is_main bool DEFAULT false NULL,
	user_id int4 NULL,
	sub_district_id int4 NULL,
	note varchar(100) NULL,
	"label" varchar(20) NOT NULL,
	CONSTRAINT addresses_pkey PRIMARY KEY (address_id),
	CONSTRAINT addresses_sub_district_id_fkey FOREIGN KEY (sub_district_id) REFERENCES public.sub_district(sub_district_id),
	CONSTRAINT addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id)
);


-- public.payments definition

-- Drop table

-- DROP TABLE public.payments;

CREATE TABLE public.payments (
	payment_id serial4 NOT NULL,
	invoice_code varchar(50) NOT NULL,
	order_id int4 NULL,
	payment_date timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	total_amount numeric(10, 2) NOT NULL,
	shipping_cost_id int4 NULL,
	total_shipping_cost numeric(10, 2) NOT NULL,
	shipping_insurance_cost numeric(10, 2) NOT NULL,
	total_expenditure numeric(10, 2) NOT NULL,
	service_cost numeric(6, 2) DEFAULT 1000 NOT NULL,
	app_service_cost numeric(6, 2) DEFAULT 1000 NOT NULL,
	total_bill numeric(10, 2) NOT NULL,
	payment_method_id int4 NULL,
	payment_status_id int4 NULL,
	CONSTRAINT payments_pkey PRIMARY KEY (payment_id),
	CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id),
	CONSTRAINT payments_payment_method_id_fkey FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(payment_method_id),
	CONSTRAINT payments_payment_status_id_fkey FOREIGN KEY (payment_status_id) REFERENCES public.payment_status(payment_status_id),
	CONSTRAINT payments_shipping_cost_id_fkey FOREIGN KEY (shipping_cost_id) REFERENCES public.shipping_costs(shipping_cost_id)
);


-- public.stores definition

-- Drop table

-- DROP TABLE public.stores;

CREATE TABLE public.stores (
	store_id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	phone_number varchar(15) NULL,
	email varchar(255) NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	user_id int4 NULL,
	address_id int4 NULL,
	CONSTRAINT stores_email_key UNIQUE (email),
	CONSTRAINT stores_pkey PRIMARY KEY (store_id),
	CONSTRAINT stores_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.addresses(address_id),
	CONSTRAINT stores_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id)
);


-- public.products definition

-- Drop table

-- DROP TABLE public.products;

CREATE TABLE public.products (
	product_id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	description text NULL,
	price numeric(10, 2) NOT NULL,
	stock_quantity int4 NOT NULL,
	image_url varchar(255) NULL,
	category_id int4 NULL,
	store_id int4 NULL,
	weight_grams numeric(10, 2) NULL,
	CONSTRAINT products_pkey PRIMARY KEY (product_id),
	CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES public.categories(category_id),
	CONSTRAINT products_store_id_fkey FOREIGN KEY (store_id) REFERENCES public.stores(store_id)
);


-- public.order_items definition

-- Drop table

-- DROP TABLE public.order_items;

CREATE TABLE public.order_items (
	order_item_id serial4 NOT NULL,
	order_id int4 NULL,
	product_id int4 NULL,
	quantity int4 NOT NULL,
	price_per_unit numeric(10, 2) NOT NULL,
	CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id),
	CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id),
	CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id)
);

-- public.categories definition

-- Drop table

-- DROP TABLE public.categories;

CREATE TABLE public.categories (
	category_id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	image_url varchar(255) NULL,
	CONSTRAINT categories_pkey PRIMARY KEY (category_id)
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
	address varchar(255) NULL,
	phone_number varchar(15) NULL,
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
	status varchar(50) DEFAULT 'Pending'::character varying NULL,
	CONSTRAINT orders_pkey PRIMARY KEY (order_id),
	CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id)
);


-- public.payments definition

-- Drop table

-- DROP TABLE public.payments;

CREATE TABLE public.payments (
	payment_id serial4 NOT NULL,
	order_id int4 NULL,
	payment_date timestamptz DEFAULT CURRENT_TIMESTAMP NULL,
	amount numeric(10, 2) NOT NULL,
	payment_method varchar(50) NULL,
	status varchar(50) DEFAULT 'Pending'::character varying NULL,
	CONSTRAINT payments_pkey PRIMARY KEY (payment_id),
	CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id)
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
	CONSTRAINT products_pkey PRIMARY KEY (product_id),
	CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES public.categories(category_id)
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


-- public.order_items definition

-- Drop table

-- DROP TABLE public.order_items;

CREATE TABLE public.order_items (
	order_item_id serial4 NOT NULL,
	order_id int4 NULL,
	product_id int4 NULL,
	quantity int4 NOT NULL,
	price numeric(10, 2) NOT NULL,
	CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id),
	CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id),
	CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id)
);

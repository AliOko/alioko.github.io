-- Based on https://learnbi.online/pizzaproject

CREATE TABLE learn_bi_pizza.address (
	add_id int4 NOT NULL,
	delivery_address1 varchar(200) NOT NULL,
	delivery_address2 varchar(200) NULL,
	delivery_city varchar(50) NOT NULL,
	delivery_zipcode varchar(20) NOT NULL,
	CONSTRAINT pk_address PRIMARY KEY (add_id)
);

CREATE TABLE learn_bi_pizza.customers (
	cust_id int4 NOT NULL,
	cust_firstname varchar(50) NOT NULL,
	cust_lastname varchar(50) NOT NULL,
	CONSTRAINT pk_customers PRIMARY KEY (cust_id)
);

CREATE TABLE learn_bi_pizza.ingredient (
	ing_id varchar(10) NOT NULL,
	ing_name varchar(200) NOT NULL,
	ing_weight int4 NOT NULL,
	ing_meas varchar(20) NOT NULL,
	ing_price numeric(5, 2) NOT NULL,
	CONSTRAINT pk_ingredient PRIMARY KEY (ing_id)
);

CREATE TABLE learn_bi_pizza.inventory (
	inv_id int4 NOT NULL,
	item_id varchar(10) NOT NULL,
	quantity int4 NOT NULL,
	CONSTRAINT pk_inventory PRIMARY KEY (inv_id)
);


-- learn_bi_pizza.inventory foreign keys

ALTER TABLE learn_bi_pizza.inventory ADD CONSTRAINT inventory_fk FOREIGN KEY (item_id) REFERENCES learn_bi_pizza.ingredient(ing_id);

CREATE TABLE learn_bi_pizza.item (
	item_id varchar(10) NOT NULL,
	sku varchar(20) NOT NULL,
	item_name varchar(50) NOT NULL,
	item_cat varchar(50) NOT NULL,
	item_size varchar(20) NOT NULL,
	item_price numeric(5, 2) NOT NULL,
	CONSTRAINT item_un UNIQUE (sku),
	CONSTRAINT pk_item PRIMARY KEY (item_id)
);

CREATE TABLE learn_bi_pizza.item (
	item_id varchar(10) NOT NULL,
	sku varchar(20) NOT NULL,
	item_name varchar(50) NOT NULL,
	item_cat varchar(50) NOT NULL,
	item_size varchar(20) NOT NULL,
	item_price numeric(5, 2) NOT NULL,
	CONSTRAINT item_un UNIQUE (sku),
	CONSTRAINT pk_item PRIMARY KEY (item_id)
);

CREATE TABLE learn_bi_pizza.recipe (
	row_id int4 NOT NULL,
	recipe_id varchar(20) NOT NULL,
	ing_id varchar(10) NOT NULL,
	quantity int4 NOT NULL,
	CONSTRAINT pk_recipe PRIMARY KEY (row_id)
);


-- learn_bi_pizza.recipe foreign keys

ALTER TABLE learn_bi_pizza.recipe ADD CONSTRAINT recipe_fk FOREIGN KEY (ing_id) REFERENCES learn_bi_pizza.ingredient(ing_id);

CREATE TABLE learn_bi_pizza.rota (
	row_id int4 NOT NULL,
	rota_id varchar(20) NOT NULL,
	"date" timestamp NOT NULL,
	shift_id varchar(20) NOT NULL,
	staff_id varchar(20) NOT NULL,
	CONSTRAINT pk_rota PRIMARY KEY (row_id)
);


CREATE TABLE learn_bi_pizza.shift (
	shift_id varchar(20) NOT NULL,
	day_of_week varchar(10) NOT NULL,
	start_time time NOT NULL,
	end_time time NOT NULL
);

CREATE TABLE learn_bi_pizza.staff (
	staff_id varchar(20) NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	"position" varchar(100) NOT NULL,
	hourly_rate float4 NULL,
	CONSTRAINT pk_staff PRIMARY KEY (staff_id)
);

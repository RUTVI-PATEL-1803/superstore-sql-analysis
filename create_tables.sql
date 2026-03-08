-- create_tables.sql
CREATE TABLE customers (
    customer_name VARCHAR2(100) PRIMARY KEY,
    segment VARCHAR2(50),
    country VARCHAR2(50),
    market VARCHAR2(50),
    region VARCHAR2(50)
);

CREATE TABLE products (
    product_id VARCHAR2(50) PRIMARY KEY,
    product_name VARCHAR2(200),
    category VARCHAR2(50),
    sub_category VARCHAR2(50)
);

CREATE TABLE orders (
    order_id VARCHAR2(50) PRIMARY KEY,
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR2(50),
    customer_name VARCHAR2(100),
    order_priority VARCHAR2(50),
    year NUMBER,
    CONSTRAINT fk_customer
    FOREIGN KEY (customer_name)
    REFERENCES customers(customer_name)
);

CREATE TABLE order_items (
    order_item_id NUMBER PRIMARY KEY,
    order_id VARCHAR2(50),
    product_id VARCHAR2(50),
    sales NUMBER,
    quantity NUMBER,
    discount NUMBER,
    profit NUMBER,
    shipping_cost NUMBER,
    CONSTRAINT fk_order
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),
    CONSTRAINT fk_product
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);
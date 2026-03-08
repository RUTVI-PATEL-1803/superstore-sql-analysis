-- data_loading.sql

-- Insert customers
INSERT INTO customers
SELECT DISTINCT
    CUSTOMER_NAME,
    SEGMENT,
    COUNTRY,
    MARKET,
    REGION
FROM superstore_raw;

-- Insert products
INSERT INTO products
SELECT DISTINCT
    PRODUCT_ID,
    PRODUCT_NAME,
    CATEGORY,
    SUB_CATEGORY
FROM superstore_raw;

-- Insert orders
INSERT INTO orders
SELECT DISTINCT
    ORDER_ID,
    ORDER_DATE,
    SHIP_DATE,
    SHIP_MODE,
    CUSTOMER_NAME,
    ORDER_PRIORITY,
    YEAR
FROM superstore_raw;

-- Insert order_items
INSERT INTO order_items
SELECT
    ROW_NUMBER() OVER (ORDER BY ORDER_ID),
    ORDER_ID,
    PRODUCT_ID,
    SALES,
    QUANTITY,
    DISCOUNT,
    PROFIT,
    SHIPPING_COST
FROM superstore_raw;

COMMIT;
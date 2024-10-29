SELECT 
    o.order_id,
    u.username,
    u.email,
    o.order_date,
    p.payment_date,
    p.amount AS payment_amount,
    p.status AS payment_status,
    s.shipping_date,
    s.tracking_number,
    s.status AS shipping_status,
    oi.product_id,
    pr.name AS product_name,
    oi.quantity,
    oi.price AS unit_price,
    (oi.quantity * oi.price) AS total_price
FROM 
    Orders o
JOIN 
    Users u ON o.user_id = u.user_id
JOIN 
    Payments p ON o.order_id = p.order_id
JOIN 
    Shipping s ON o.order_id = s.order_id
JOIN 
    Order_Items oi ON o.order_id = oi.order_id
JOIN 
    Products pr ON oi.product_id = pr.product_id
WHERE 
    o.order_id = 2; --Replace order_id value with the order_id you want to retrieve.


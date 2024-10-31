SELECT 
    o.order_id,
    st.name AS store_name, 
    o.order_date,
    u.username,
    a.name AS address,
    sd.name AS sub_district,
    d.name AS district,
    cr.name AS city_regional,
    prv.name AS province,
    sd.postal_code,
    pr.name AS product_name,
    oi.quantity,
    oi.price_per_unit AS unit_price,
    (oi.quantity * oi.price_per_unit) AS total_price,
    SUM(oi.quantity) AS total_unit,
    p.payment_date,
    p.total_amount AS payment_amount,
    s.shipping_date,
    s.tracking_number,
    s.status AS shipping_status,
    oi.product_id
FROM 
    Orders o
JOIN 
    Users u ON o.user_id = u.user_id
JOIN 
    Addresses a ON u.user_id = a.user_id
JOIN 
    Sub_District sd ON a.sub_district_id = sd.sub_district_id 
JOIN 
    District d ON sd.district_id = d.district_id 
JOIN 
    City_Regency cr ON d.city_regency_id = cr.city_regency_id
JOIN 
    Province prv ON cr.province_id = prv.province_id
JOIN 
    Payments p ON o.order_id = p.order_id
JOIN 
    Shipping s ON o.order_id = s.order_id
JOIN 
    Order_Items oi ON o.order_id = oi.order_id
JOIN 
    Products pr ON oi.product_id = pr.product_id
JOIN 
    Stores st ON pr.store_id = st.store_id 
WHERE 
    o.order_id = 5
group by
	o.order_id, st.name, u.username, a.name, sd.name, d.name, cr.name, prv.name, 
    sd.postal_code, pr.name, p.payment_date, s.shipping_date, s.tracking_number, 
    s.status, oi.product_id, oi.quantity, oi.price_per_unit, p.total_amount;


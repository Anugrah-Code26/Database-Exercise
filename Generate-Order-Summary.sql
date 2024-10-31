SELECT 
    p.invoice_code,
    st.name AS store_name,
    u.username AS buyer_name,
    o.order_date,
    u.phone_number AS buyer_number,
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
    o.total_unit,
    p.total_amount AS payment_amount,
    p.total_shipping_cost,
    p.shipping_insurance_cost,
    p.total_expenditure,
    p.service_cost,
    p.app_service_cost,
    p.total_bill,
    c.name AS courier_name,
    ss.service_name,
    pm.name AS payment_method,
    p.payment_date
FROM 
    Payments p
JOIN
	Orders o ON p.order_id = o.order_id  
JOIN 
    Order_Items oi ON o.order_id = oi.order_id
JOIN 
    Products pr ON oi.product_id = pr.product_id
JOIN 
    Stores st ON pr.store_id = st.store_id
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
    Shipping_Costs sc ON p.shipping_cost_id = sc.shipping_cost_id
JOIN 
    Shipping_Services ss ON sc.service_id = ss.service_id
JOIN 
    Couriers c ON ss.courier_id = c.courier_id
JOIN 
    Payment_Methods pm ON p.payment_method_id = pm.payment_method_id
WHERE 
    o.order_id = 5;


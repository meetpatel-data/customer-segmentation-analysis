SELECT
MAX(order_date_iso) AS max_order_date, 
date(MAX(order_date_iso), '+1 day') 
AS snapshot_date 
FROM orders;
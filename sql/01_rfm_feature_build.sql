DROP TABLE IF EXISTS rfm_features;

CREATE TABLE rfm_features AS
WITH snap AS (
  SELECT date(MAX(order_date_iso), '+1 day') AS snapshot_date
  FROM orders
)
SELECT
  o."Customer ID"   AS customer_id,
  o."Customer Name" AS customer_name,

  -- Last purchase date
  MAX(o.order_date_iso) AS last_order_date,

  -- Recency: days since last order (using snapshot date)
  CAST(
    julianday((SELECT snapshot_date FROM snap)) - julianday(MAX(o.order_date_iso))
    AS INTEGER
  ) AS recency_days,

  -- Frequency: distinct orders
  COUNT(DISTINCT o."Order ID") AS frequency_orders,

  -- Monetary: total sales
  ROUND(SUM(o.Sales), 2) AS monetary_sales,

  -- Optional: total profit
  ROUND(SUM(o.Profit), 2) AS monetary_profit

FROM orders o
GROUP BY
  o."Customer ID",
  o."Customer Name";

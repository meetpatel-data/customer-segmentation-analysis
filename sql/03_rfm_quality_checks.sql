SELECT
  MIN(recency_days) AS min_recency,
  MAX(recency_days) AS max_recency,
  MIN(frequency_orders) AS min_freq,
  MAX(frequency_orders) AS max_freq,
  MIN(monetary_sales) AS min_sales,
  MAX(monetary_sales) AS max_sales
FROM rfm_features;

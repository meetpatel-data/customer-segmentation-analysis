DROP TABLE IF EXISTS rfm_scores;

CREATE TABLE rfm_scores AS
SELECT
  customer_id,
  customer_name,
  recency_days,
  frequency_orders,
  monetary_sales,
  monetary_profit,

  -- Recency score (lower is better → reverse order)
  6 - NTILE(5) OVER (ORDER BY recency_days) AS r_score,

  -- Frequency score
  NTILE(5) OVER (ORDER BY frequency_orders) AS f_score,

  -- Monetary score
  NTILE(5) OVER (ORDER BY monetary_sales) AS m_score

FROM rfm_features;

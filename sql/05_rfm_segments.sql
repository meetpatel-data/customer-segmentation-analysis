DROP TABLE IF EXISTS rfm_segments;

CREATE TABLE rfm_segments AS
SELECT *,
CASE

  WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4
    THEN 'Champions'

  WHEN r_score >= 3 AND f_score >= 3 AND m_score >= 3
    THEN 'Loyal Customers'

  WHEN r_score >= 4 AND f_score <= 2
    THEN 'New Customers'

  WHEN r_score <= 2 AND f_score >= 3
    THEN 'At Risk'

  WHEN r_score <= 2 AND f_score <= 2
    THEN 'Lost Customers'

  ELSE 'Potential Loyalists'

END AS customer_segment

FROM rfm_scores;

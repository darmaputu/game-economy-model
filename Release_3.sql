# Release 3: Business Metrics SQL Examples

-- Conversion Rate
SELECT COUNT(DISTINCT IF(type = 'real_money_purchase', user_id, NULL)) / COUNT(DISTINCT user_id) AS conversion_rate
FROM `polished-cocoa-372717.cofounderie_test.transactions`;

-- ARPPU
SELECT SUM(amount) / COUNT(DISTINCT user_id) AS arppu
FROM `polished-cocoa-372717.cofounderie_test.transactions`
WHERE type = 'real_money_purchase' AND status = 'confirmed';

-- Boost Usage Rate
SELECT COUNTIF(type = 'boost_buy') / COUNT(DISTINCT user_id) AS boost_usage_rate
FROM `polished-cocoa-372717.cofounderie_test.transactions`;

-- CPD vs Level (Assume user_levels table exists)
SELECT u.level, AVG(CAST(JSON_VALUE(t.details, '$.coins') AS INT64) / t.amount) AS cpd
FROM `polished-cocoa-372717.cofounderie_test.transactions` t
JOIN `polished-cocoa-372717.cofounderie_test.user_levels` u
  ON u.user_id = t.user_id
WHERE t.type = 'real_money_purchase'
GROUP BY u.level;
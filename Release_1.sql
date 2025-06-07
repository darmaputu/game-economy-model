# 1 Release 1: Schema & Sample Transactions (BigQuery Style)

### BigQuery-Compatible Transaction Table ===
CREATE TABLE `polished-cocoa-372717.cofounderie_test.transactions` (
    id STRING,
    user_id STRING NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    type STRING,
    source STRING,
    details STRING,
    amount INT64,
    currency STRING,
    status STRING
);

-- Sample Insert: Mana Use
INSERT INTO `polished-cocoa-372717.cofounderie_test.transactions` (user_id, type, source, amount, currency, details, timestamp)
VALUES ('user-123', 'mana_use', 'client', -12, 'mana', '{"action": "move"}', CURRENT_TIMESTAMP());

-- Sample Insert: Real Money Purchase (Callback)
INSERT INTO `polished-cocoa-372717.cofounderie_test.transactions` (user_id, type, source, amount, currency, status, details, timestamp)
VALUES ('user-123', 'real_money_purchase', 'PG_callback', 5, 'USD', 'confirmed', '{"item": "Bag", "coins": 300}', CURRENT_TIMESTAMP());
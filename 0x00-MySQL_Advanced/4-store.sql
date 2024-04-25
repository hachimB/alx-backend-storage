-- SQL script that creates a trigger that decreases the quantity of an item after adding a new order.
-- TRIGGER
CREATE TRIGGER after_add_new_order
AFTER INSERT ON orders
FOR EACH ROW
UPDATE items
SET quantity = quantity + 1;

-- script that create a trigger that decreases the quantity of an item
-- after  a new order

CREATE TRIGGER updated-quantity
AFTER INSERT ON orders
FOR EACH ROW
	UPDATE items SET quantity = quantity - NEW.number;

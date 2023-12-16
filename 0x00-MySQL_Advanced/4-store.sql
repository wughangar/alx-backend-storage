-- script that create a trigger that decreases the quantity of an item
-- after  a new order

CREATE TRIGGER updated-quantity
AFTER INSERT ON orders
FOR EACH ROW
	UPDATE items
	JOIN orders ON items.NAME = orders.item_name
	SET items.quantity = items.quantity - orders.number
	WHERE orders.order_id = NEW.order_id;

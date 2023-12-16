-- script that create a trigger that decreases the quantity of an item
-- after  a new order

CREATE TRIGGER updated-quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
	DECLARE item_count INT;
	SELECT COUNT(*) INTO item_count
	FROM ordered_items
	WHERE order_id = NEW.order_id;
	UPDATE items
	SET quantity = quantity - item_count
	WHERE item_id = NEW.item_id;
END;

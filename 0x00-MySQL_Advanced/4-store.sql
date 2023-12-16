-- script that create a trigger that decreases the quantity of an item
-- after  a new order
DROP TRIGGER IF EXISTS updated_quantity
CREATE TRIGGER updated_quantity
AFTER INSERT ON orders
FOR EACH ROW
	UPDATE items SET quantity = quantity - NEW.number WHERE NAME = NEW.item_name;

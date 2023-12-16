-- script that creates a triggern whne an old email is chnaged and not valid
DROP TRIGGER IF EXISTS reset_email;
DELIMITER $$

CREATE TRIGGER reset_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
	IF OLD.email <> NEW.email THEN
		SET NEW.valid_email = 0;
	END IF;
END$$
DELIMITER ;

-- script that creates a triggern whne an old email is chnaged and not valid

CREATE TRIGGER reset_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
	IF OLD.email <> NEW.email THEN
		SET new.VALID_EMAIL = 0;
	ELSE
		SET NEW.valid_email = NEW.valid_email;
	END IF;
END

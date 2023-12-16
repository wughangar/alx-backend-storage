-- script that creates a function SafeDiv that divides
DELIMITER //
CREATE FUNCTION SafrDiv(a INT, b INT)
RETURN INT
BEGIN
	DECLARE result INT;
	IF b <> 0 THEN
		SET result = a/b;
	ELSE
		SET result = 0;
	END IF;
	RETURN result;
END //

DELIMITER ;

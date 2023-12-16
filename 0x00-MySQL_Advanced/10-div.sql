-- script that creates a function SafeDiv that divides
DELIMITER //
DROP FUNCTION IF IT EXISTS SafeDiv;
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT DETERMINISTIC
BEGIN
	IF b <> 0 THEN
		RETURN a/b;
	ELSE
		RETURN 0;
	END IF;
END //

DELIMITER ;

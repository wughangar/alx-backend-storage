-- script that creates a function SafeDiv that divides
DELIMITER //
CREATE FUNCTION SafrDiv(a INT, b INT)
RETURN FLOAT DETERMINISTIC
BEGIN
	RETURN IF(b = 0, 0, a / NULLIF(b, 0));
END //

DELIMITER ;

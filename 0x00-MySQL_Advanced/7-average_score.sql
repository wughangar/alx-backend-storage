-- script that creates a procedure CompueAverageScoreForUser

DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(
	IN p_user_id INT
)
BEGIN
	DECLARE avg_score DECIMAL(10, 2);
	SELECT AVG(score) INTO avg_score
	FROM corrections
	WHERE user_id = p_user_id;

	IF avg_score IS NOT NULL THEN
		UPDATE user_scores
		SET average_score = avg_score
		WHERE user_id = p_user_id;
	ELSE
		INSERT INTO user_scores (user_id, average_score)
		VALUES (p_user_id, 0);
	END IF;
END$$

DELIMITER ;

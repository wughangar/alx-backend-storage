-- script that creates a procedure CompueAverageScoreForUser

DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser(
	IN p_user_id INT
)
BEGIN
	DECLARE avg_score DECIMAL(10, 2);
	SELECT AVG(score) INTO avg_score
	FROM user_scores
	WHERE user_id = p_user_id;

	IF avg_score IS NOT NULL THEN
		UPDATE user_performance
		SET average_score_column = avg_score
		WHERE user_id = p_user_id;
	ELSE
		SELECT 'No scores found for the user' AS Result;
	END IF;
END$$

DELIMITER ;

-- script that calculates average weight

DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
	IN p_user_id INT
)

BEGIN
	DECLARE total_weighted_score DECIMAL(10, 2);
	DECLARE total_weight DECIMAL(10, 2);
	DECLARE average_weighted_score DECIMAL(10, 2);

	SELECT SUM(score * weight), SUM(weight) INTO total_weighted_score, total_weight
	FROM user_scores
	WHERE user_id = p_user_id;

	IF total_weight > 0 THEN
		SET average_weighted_score = total_weighted_score / total_weight;
		UPDATE user_performance
		SET weighted_score_column = average_weighted_score
		WHERE user_id = p_user_id;
	ELSE
		SELECT 'Total weight is zero for the user' AS Result;
	END IF;
END $$

DELIMITER ;

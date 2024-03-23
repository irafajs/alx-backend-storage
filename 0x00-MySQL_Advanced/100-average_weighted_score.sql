-- STORED PROCEDURE NAMED ComputeAverageWeightedScoreForUser
-- COMPUTES AND STORE THE AVERAGE SCORE OF A USER
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
	DECLARE avr_score DECIMAL(10, 2);
	DECLARE sum_score INT;
	DECLARE sum_weight INT;
	SELECT sum(score) INTO sum_score FROM corrections AS C WHERE C.user_id in (user_id);
	SELECT sum(weight) INTO sum_weight FROM projects WHERE id IN (
		SELECT project_id FROM corrections WHERE user_id in (user_id));
	SET avr_score = sum_score / sum_weight;
	UPDATE users SET average_score = avr_score WHERE id = user_id;
END $$
DELIMITER ;

-- CREATE A PROCEDURE NAME ComputeAverageScoreForUser
-- COMPUTE AND STORE THE AVERAGE OF STUDENT
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser (IN user_id INT)
BEGIN
	DECLARE aver_score INT;
	SELECT AVG(score) INTO aver_score FROM corrections WHERE user_id = user_id;
	UPDATE users SET average_score = aver_score WHERE id = user_id;
END $$
DELIMITER ;

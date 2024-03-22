-- CREATE A PROCEDURE NAME ComputeAverageScoreForUser
-- COMPUTE AND STORE THE AVERAGE OF STUDENT
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser (IN user_id INT)
BEGIN
	DECLARE aver_score DECIMAL(10, 2);
	SELECT AVG(score) INTO aver_score FROM corrections AS C WHERE C.user_id IN (user_id);
	UPDATE users SET average_score = aver_score WHERE id = user_id;
END $$
DELIMITER ;

-- STORED PROCEDURE NAMED ComputeAverageWeightedScoreForUser
-- COMPUTES AND STORE THE AVERAGE SCORE OF A USER
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
	CREATE VIEW new_av_sum_score AS
	SELECT C.user_id, SUM((C.score * P.weight)) / SUM(P.weight) AS w_score_sum
	FROM corrections AS C JOIN projects AS P ON C.project_id = P.id GROUP BY C.user_id;
	UPDATE users AS U JOIN new_av_sum_score AS S ON U.id = S.user_id
	SET U.average_score = S.w_score_sum;
END $$
DELIMITER ;

-- CREATE VIEW AS TESTING
CREATE VIEW each_score_weighted_av AS
        SELECT C.user_id, SUM((C.score * P.weight)) / SUM(P.weight) AS w_score_sum
        FROM corrections AS C JOIN projects AS P ON
        C.project_id = P.id GROUP BY C.user_id;

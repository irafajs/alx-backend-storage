-- STORED PROCEDURE NAMED ADDBONUS
-- IT ADD A NEW CORRECTION FO R A STRUDENT
DELIMITER $$
CREATE PROCEDURE AddBonus (IN user_id INT, IN project_name VARCHAR(255), IN score INT)
BEGIN
	DECLARE project_id INT;
	DECLARE new_project_id INT;
	SELECT id INTO project_id FROM projects WHERE name = project_name;
	IF project_id IS NULL THEN
		INSERT INTO projects (name) VALUES (project_name);
		SET project_id = LAST_INSERT_ID();
	END IF;
	SELECT id INTO new_project_id FROM projects WHERE name = project_name;
	INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, new_project_id, score);
END $$
DELIMITER ;

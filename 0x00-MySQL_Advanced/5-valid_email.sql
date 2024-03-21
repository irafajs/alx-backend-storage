-- TRIGGER TO RESET COLUMN valid_email
-- ONLY RESET WHEN email column is changed
DELIMITER $$
CREATE TRIGGER reset_valid_mail BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
	IF OLD.email <> NEW.email THEN
		CASE
			WHEN OLD.valid_email = 1 THEN
				SET NEW.valid_email = 0;
			ELSE
				SET NEW.valid_email = 1;
			END CASE;
		END IF;
	END$$
DELIMITER ;

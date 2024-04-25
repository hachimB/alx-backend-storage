-- A SQL script that creates a trigger that resets the attribute valid_email only when the email has been changed.
-- 5-valid_email
DELIMITER $$
CREATE TRIGGER valid_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
IF NEW.email <> OLD.email THEN
    SET NEW.valid_email = 0;
END IF;
END $$
DELIMITER ;

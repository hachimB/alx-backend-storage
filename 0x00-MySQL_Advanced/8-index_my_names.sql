-- A SQL script that creates an index idx_name_first on the table names and the first letter of name.
-- Optimize simple search

-- ALTER TABLE names
-- ADD COLUMN first_letter CHAR(1) GENERATED ALWAYS AS (LEFT(name, 1)) STORED;

-- CREATE INDEX idx_name_first ON names (first_letter);
DELIMITER //
CREATE PROCEDURE add_column_if_not_exists()
BEGIN
    DECLARE _count INT;
    SELECT COUNT(*) INTO _count
    FROM information_schema.columns 
    WHERE table_name = 'names' AND column_name = 'first_letter';
    IF _count = 0 THEN
        ALTER TABLE names
        ADD COLUMN first_letter CHAR(1) GENERATED ALWAYS AS (LEFT(name, 1)) STORED;
    END IF;
END//
DELIMITER ;

CALL add_column_if_not_exists();

DROP PROCEDURE add_column_if_not_exists;

CREATE INDEX idx_name_first ON names (first_letter);
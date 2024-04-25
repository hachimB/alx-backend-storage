-- A SQL script that creates an index idx_name_first on the table names and the first letter of name.
-- Optimize simple search

ALTER TABLE names
ADD COLUMN IF NOT EXISTS first_letter CHAR(1) GENERATED ALWAYS AS (LEFT(name, 1)) STORED;

CREATE INDEX idx_name_first ON names (first_letter);

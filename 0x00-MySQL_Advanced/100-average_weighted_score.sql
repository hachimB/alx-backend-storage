-- A SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser that computes and store the average weighted score for a student.
-- Average weighted score
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN input_user_id INT)
BEGIN
    DECLARE total_weight FLOAT;
    DECLARE weighted_sum FLOAT;

    -- Calculate the total weight
    SELECT SUM(weight) INTO total_weight
    FROM projects
    INNER JOIN corrections ON projects.id = corrections.project_id
    WHERE corrections.user_id = input_user_id;

    -- Calculate the weighted sum
    SELECT SUM(score * weight) INTO weighted_sum
    FROM corrections
    INNER JOIN projects ON corrections.project_id = projects.id
    WHERE corrections.user_id = input_user_id;

    -- Calculate the average weighted score
    SET @average_weighted_score = weighted_sum / total_weight;

    -- Update the average score in the users table
    UPDATE users
    SET average_score = @average_weighted_score
    WHERE id = input_user_id;
END $$
DELIMITER ;

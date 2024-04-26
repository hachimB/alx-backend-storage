-- A SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser that computes and store the average weighted score for a student.
-- Average weighted score
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN input_user_id INT)
BEGIN
    DECLARE total_weight INT DEFAULT 3; -- Sum of weights (1 + 2)
    DECLARE weighted_sum INT DEFAULT 0;

    -- Calculate the weighted sum
    SELECT SUM(score * IF(project_id = 1, 1, 2)) INTO weighted_sum
    FROM corrections
    WHERE user_id = input_user_id;

    -- Calculate the average weighted score
    SET @average_weighted_score = weighted_sum / total_weight;

    -- Store or output the result as needed
    SELECT @average_weighted_score AS average_weighted_score;
END;

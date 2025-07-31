
-- Standardizing Gender
UPDATE mental_health_survey
SET gender = 'Male'
WHERE LOWER(gender) IN ('m', 'male', 'mal', 'mail', 'maile', 'cis male', 'man', 'make', 'male-ish', 'malr', 'msle');

UPDATE mental_health_survey
SET gender = 'Female'
WHERE LOWER(gender) IN ('f', 'female', 'femake', 'femail', 'cis female', 'woman');

UPDATE mental_health_survey
SET gender = 'Other'
WHERE gender NOT IN ('Male', 'Female');

-- Cleaning work_interfere
UPDATE mental_health_survey
SET work_interfere = NULL
WHERE work_interfere IN ('NA', 'Not applicable', '');

-- Cleaning leave_status
UPDATE mental_health_survey
SET leave_status = 'Not Sure'
WHERE leave_status = "Don't know";

UPDATE mental_health_survey
SET leave_status = 'Difficult'
WHERE leave_status = 'Very difficult';

-- Cleaning mental_vs_physical
UPDATE mental_health_survey
SET mental_vs_physical = "Don't know"
WHERE mental_vs_physical = 'Not Sure';

-- Optional: Remove unrealistic ages
DELETE FROM mental_health_survey
WHERE age < 18 OR age > 100;

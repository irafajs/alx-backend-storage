-- CREATE INDEX NAME idx_name_first_score
-- TABLE IS names ON FIRST LETTER
CREATE INDEX idx_name_first_score ON names (name(1), score);

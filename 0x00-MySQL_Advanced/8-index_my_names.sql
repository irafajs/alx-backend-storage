-- CREATE INDEX NAMED idx_name_first
-- IT SHOULD BE ATTACHED ON THE names table
CREATE INDEX idx_name_first ON names (name(1));

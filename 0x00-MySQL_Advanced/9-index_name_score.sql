-- script that creates an index on first letter and score

CREATE INDEX idx_name_first ON names (name(1), score);

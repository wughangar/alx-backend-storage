-- script that creates an index

CREATE INDEX idx_name_first ON names (LEFT(name, 1));

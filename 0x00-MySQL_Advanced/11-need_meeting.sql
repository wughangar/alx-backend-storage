-- script that creates a view

CREATE VIEW AS need_meeting AS
SELECT name
FFROM students
WHERE score < 80
AND (last_meeting IS NULL OR last_meeting < NOW() - INTERVAL 1 MONTH);

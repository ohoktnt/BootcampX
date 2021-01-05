SELECT teachers.name as teacher, cohorts.name as cohort, COUNT(assistance_requests) as total_assistances
FROM assistance_requests
  JOIN teachers ON teacher_id = teachers.id
  JOIN students ON student_id = students.id
  JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY total_assistances DESC;

-- root cause for GROUP BY, has to include both the columns and not just one. 
-- SELECT DISTINCT teachers.name, cohorts.name, COUNT(assistance_requests) as total_assistances
-- FROM teachers
--   JOIN assistance_requests ON teachers.id = teacher_id
--   JOIN students ON students.id = assistance_requests.student_id
--   JOIN cohorts ON cohorts.id = students.cohort_id
-- WHERE cohorts.name = 'JUL02'
-- GROUP BY teachers.name, cohorts.name
-- ORDER BY total_assistances DESC;

SELECT day, COUNT(assignments), SUM(duration)
FROM assignments
GROUP BY day
ORDER BY day;
const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const argCohort = process.argv[2];

pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
  JOIN assistance_requests ON teachers.id = teacher_id
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name = $1::text
ORDER BY teachers.name;
`,[argCohort])
.then(res => {
  console.log('connected')
  res.rows.forEach( row => {
    console.log(`${row.cohort}: ${row.teacher}`)
  })
})
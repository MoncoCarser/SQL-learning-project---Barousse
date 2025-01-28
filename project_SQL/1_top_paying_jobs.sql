/* What are the highest paying Data Analyst roles?
    Identify top 10 roles available remotely, or Nordic location
    Only job postings with salaries, exclude NULLs
    Include company names
Why? To find insights to this topic.
    */

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE  
        job_title_short = 'Data Analyst' 
        AND
        salary_year_avg IS NOT NULL
        AND
        (
        job_location ='Anywhere' 
        OR job_location = 'Finland' 
        OR job_location = 'Sweden' 
        OR job_location = 'Norway' 
        OR job_location = 'Denmark' 
        OR job_location = 'Iceland' 
        OR job_location = 'Estonia' 
        )
ORDER BY
    salary_year_avg DESC
LIMIT 10;
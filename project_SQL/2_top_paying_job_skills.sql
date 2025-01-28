/* What skills are required for the highest paying data analyst roles?
Using details from first queary
    Identify top 10 roles available remotely, or Nordic location
    Only job postings with salaries, exclude NULLs
    Include company names
Why? To find insights to this topic.
    */

WITH top_paying_skills AS (

    SELECT 
        job_id,
        job_title,
        salary_year_avg,
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
)

SELECT
    top_paying_skills.*,
    skills
FROM
    top_paying_skills
INNER JOIN skills_job_dim ON top_paying_skills.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

    /*
Key Takeaways:
	•	SQL, Excel, and Python dominate in terms of demand, highlighting their essential role in data analysis.
	•	Advanced and specialized tools like PySpark, Bitbucket, and Watson command higher salaries, suggesting they are niche skills highly valued in specific industries.

Most In-Demand Skills (Top 10 by frequency):

These are the most commonly listed skills in job postings:
	•	SQL: 400 mentions
	•	Excel: 257 mentions
	•	Python: 237 mentions
	•	Tableau: 231 mentions
	•	R: 149 mentions
	•	SAS: 126 mentions
	•	Power BI: 111 mentions
	•	PowerPoint: 59 mentions
	•	Looker: 50 mentions
	•	Word: 49 mentions

2. Top-Paying Skills (Average Salary):

These skills are associated with the highest average yearly salaries:
	•	PySpark: $208,172
	•	Bitbucket: $189,154
	•	Watson: $160,515
	•	Couchbase: $160,515
	•	DataRobot: $155,486
	•	GitLab: $154,500
	•	Swift: $153,750
	•	Jupyter: $152,777
	•	Pandas: $151,821
	•	Elasticsearch: $145,000
    */
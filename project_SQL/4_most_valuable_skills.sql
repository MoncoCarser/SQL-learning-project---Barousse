
/* What are the top skills based on salary?
    Looking at avg salary associated with each skill for Data Analyst positions
    Focuses on roles with specificied salaries, regardless of location
    Why? To identify most valuable in demand skills to learn for Data Analysts
    and how different skills might impact salary levels */

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND
    salary_year_avg IS NOT NULL
    -- AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25


/*
	1.	Highest-Paid Skills:
	•	The top skill, SVN (Subversion), has the highest reported average salary of $400,000.
	•	Other high-paying skills include Solidity ($179,000), Couchbase ($160,515), DataRobot ($155,486), and Golang ($155,000).
	2.	Trends & Demand:
	•	SVN (version control system) being at the top is surprising, as Git is more widely used today.
	•	Solidity is associated with blockchain and smart contracts, indicating a strong demand for crypto-related expertise.
	•	Couchbase (NoSQL database) and DataRobot (AI/ML automation platform) suggest a high demand for skills in data storage and AI-driven automation.
	•	Golang is a popular backend and cloud computing language, reinforcing the value of cloud-related expertise.
	3.	Implications for Data Analysts:
	•	Traditional data analysis tools (e.g., SQL, Python, R) are not the highest-paid skills in this dataset. Instead, niche skills in blockchain, AI, NoSQL, and automation appear to be valued more.
	•	Learning Solidity, Couchbase, or DataRobot could significantly boost earning potential.
	•	The presence of version control (SVN) suggests that some legacy systems still command high salaries.

*/
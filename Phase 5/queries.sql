/* Find all nurses(their names) 
with a salary greater than $85,000. */

SELECT N_Name 
FROM NURSE
WHERE N_Salary > 85000;

/* Find all the "Surgery" (for the specialty) physicians and 
sort the query output by names (any direction) */

SELECT *
FROM PHYSICIAN
WHERE PhysicianSpecialty = 'Surgery'
ORDER BY PhysicianName;

/* Find all physicians with "Medicine" in their specialty name 
(hint: remember the LIKE operator) */

SELECT *
FROM PHYSICIAN
WHERE PhysicianSpecialty LIKE '%Medicine%';

/* Find all nurses who do not have a supervisor. */

SELECT *
FROM NURSE
WHERE N_SupervisorID IS NULL;

/* Find the names of all nurses with a salary 
between $70,000 and $80,000 (inclusive) */

SELECT N_Name
FROM NURSE
WHERE N_Salary BETWEEN 70000 AND 80000;

/* Find the names of the physicians who have a specialty containing "ology". */

SELECT PhysicianName
FROM Physician
WHERE PhysicianSpecialty LIKE '%ology';

/* Find the minimum and maximum salaries amongst all nurses. 
Use only one query */

SELECT  MIN(N_Salary) AS Min_Salary,
        MAX(N_Salary) AS Max_Salary
FROM NURSE;

/* Find the average salary for all nurses */

SELECT AVG(N_Salary)
FROM NURSE;

/* Find the name of the nurse that has the highest salary.
Do not hardcode any salaries or other values - you must use SQL without assuming
you know the current database snapshot. */

SELECT N_NAME
FROM NURSE
WHERE N_Salary = ( SELECT MAX(N_Salary) 
                    FROM NURSE);

/* Find the nurses with a salary less than the average overall salary for all nurses +
20% (i.e., less than 1.2 * average salary). Do not hardcode any salaries or other values
- you must use SQL without assuming you know the current database snapshot. */

SELECT *
FROM NURSE 
WHERE N_Salary < (1.2 *    (SELECT AVG(N_Salary) 
                            FROM NURSE));
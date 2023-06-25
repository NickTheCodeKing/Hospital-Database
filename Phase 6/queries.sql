/*Retrieve the names of physicians specializing in dermatology who have worked more than 22 hours in a timecard*/

SELECT P_PhysicianName
FROM Physician P
JOIN Timecard T ON P_PhysicianID = T_PhysicianID
WHERE P_PhysicianSpeciality = 'dermatology' AND T_Hours > 22;

/* For each physician specialty, list the specialty, the number of physicians that have that specialty, and the total number of hours worked by those physicians */


SELECT P_PhysicianSpeciality, COUNT(P_PhysicianID) AS NumPhysicians, SUM(T_Hours) AS TotalHours
FROM Physician P
JOIN Timecard T ON P_PhysicianID = T_PhysicianID
GROUP BY P_PhysicianSpeciality;

/*Retrieve the names of all nurses whose supervisor's supervisor has N01 for their ID */

SELECT Nurse2_N_Name
FROM Nurse Nurse1
JOIN Nurse Nurse2 ON Nurse1_N_ID = Nurse2_N_SupervisorID
WHERE Nurse1_N_SupervisorID = 'N01';

/*For each physician specialty, list the specialty and the total number of patients whose physician has that specialty */

SELECT P_PhysicianSpeciality, COUNT(PatientTable_P_Number) AS NumPatients
FROM Physician P
JOIN Patient PatientTable ON P_PhysicianID = PatientTable_P_PhysicianID
GROUP BY P_PhysicianSpeciality;

/* Find the patient who is assigned to a bed that is monitored by the nurse with the lowest salary */

SELECT PatientTable_P_Name
FROM Patient PatientTable
JOIN Bed B ON PatientTable_P_Number = B_B_PatientNumber
JOIN Nurse N ON B_B_NurseID = N_N_ID
WHERE N_N_Salary = (SELECT MIN(N_Salary) FROM Nurse);

/* Retrieve the average age of patients assigned to a bed */

SELECT AVG(PatientTable_P_Age) AS AverageAge
FROM Patient PatientTable
JOIN Bed B ON PatientTable_P_Number = B_B_PatientNumber;

/* Find all bed numbers that end in an odd number */

SELECT B_Number
FROM Bed
WHERE REGEXP_LIKE(B_Number, '[13579]$');

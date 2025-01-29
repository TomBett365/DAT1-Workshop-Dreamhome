.open dreamhome.sqlite
.mode column

/*

SELECT * 
FROM Branch
WHERE city = 'London' OR city = 'Glasgow';

SELECT *
FROM Staff
WHERE fname = 'Ann' OR fname = 'Karen';

SELECT DISTINCT propertyNo
FROM Viewing;

SELECT staffNo, fName, lName, salary/12 AS monthlySalary
FROM Staff;

SELECT staffNo, fName, lName, salary
FROM Staff
WHERE salary BETWEEN 20000 AND 30000;

SELECT staffNo, fName, lName, salary
FROM Staff
WHERE position IN ('Manager', 'Supervisor');

SELECT staffNo, fName, lName, salary
FROM Staff
WHERE fName LIKE 'H%' AND lName LIKE 'H%';

SELECT clientNo, viewDate
FROM Viewing
WHERE propertyNo LIKE 'PR4%' AND comment IS NULL;

SELECT staffNo, fName, lName, salary
FROM Staff
ORDER BY Salary DESC;

SELECT propertyNo, type, rooms, rent
FROM PropertyForRent
ORDER BY type, rent DESC;

SELECT COUNT(*) AS myCount
FROM propertyforrent
WHERE rent > 350;

SELECT COUNT(DISTINCT propertyNo) as myCount
FROM Viewing
WHERE viewDate BETWEEN '1-May-13' AND '31-May-13';

SELECT COUNT(staffNo) AS myCount, SUM(salary) AS mySalary
FROM Staff
WHERE position = 'Manager';

SELECT MIN(salary) AS minSalary, MAX(salary) AS maxSalary, AVG(salary) AS avgSalary
FROM Staff;

SELECT branchno, COUNT(staffno) AS numStaff, SUM(salary) AS totalSalary
FROM Staff
GROUP BY branchno
ORDER  BY branchno;

SELECT branchno, COUNT(staffno) AS numStaff, SUM(salary) AS totalSalary
FROM Staff
GROUP BY branchno
HAVING COUNT(staffno) > 4
ORDER BY branchno;

SELECT staffNo, fName, lName, position
FROM Staff
WHERE branchNo = (SELECT branchNo
                  FROM Branch
                  WHERE street = '163 Main St');

*/

SELECT staffNo, fName, lName, position, salary - (SELECT AVG(Salary) 
                                                  FROM Staff) AS salDiff
FROM Staff
WHERE salary > (SELECT AVG(Salary) 
                FROM Staff);

SELECT AVG(salary) FROM Staff AS avgSal;


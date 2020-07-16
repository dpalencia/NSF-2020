use hw2;
#Part A
#Who are the employees assigned to each project?  
#Show ProjectID, EmployeeNumber, LastName, FirstName, and OfficePhone.
SELECT ProjectID, assignment.EmployeeNumber, LastName, 
	FirstName, OfficePhone
FROM assignment
INNER JOIN employee 
ON assignment.EmployeeNumber = employee.EmployeeNumber;

#Part B
#Who are the employees assigned to each project? 
#Show ProjectID, ProjectName, and Department. 
#Show EmployeeNumber, LastName, FirstName, and OfficePhone.
SELECT p.ProjectID, ProjectName, p.Department,
	e.EmployeeNumber, LastName, FirstName, OfficePhone
FROM assignment AS a
JOIN employee AS e
ON e.EmployeeNumber = a.EmployeeNumber
JOIN project AS p
ON p.ProjectID = a.ProjectID;

# Part C 
# Who are the employees assigned to each project? 
# Show ProjectID, ProjectName, Department, and DepartmentPhone.  
# Show EmployeeNumber, LastName, FirstName, and OfficePhone. Sort by ProjectID in ascending order.
SELECT p.ProjectID, ProjectName, p.Department, d.DepartmentPhone,
	e.EmployeeNumber, LastName, FirstName, OfficePhone
FROM assignment AS a
JOIN employee AS e
ON e.EmployeeNumber = a.EmployeeNumber
JOIN project AS p
ON p.ProjectID = a.ProjectID
JOIN department AS d
ON d.DepartmentName = p.Department;

# Part D
#Who are the employees assigned to projects run by the Sales and Marketing Department? 
#Show ProjectID, ProjectName, Department, 
#and DepartmentPhone. Show EmployeeNumber, LastName, FirstName, 
#and OfficePhone.  Sort by ProjectID in ascending order.
SELECT p.ProjectID, ProjectName, p.Department, d.DepartmentPhone,
	e.EmployeeNumber, LastName, FirstName, OfficePhone
FROM assignment AS a
JOIN employee AS e
ON e.EmployeeNumber = a.EmployeeNumber
JOIN project AS p
ON p.ProjectID = a.ProjectID
JOIN department AS d
ON d.DepartmentName = p.Department
WHERE p.Department = "Sales and Marketing";

#Part E
#How many projects are being run by the Sales and Marketing Department? 
#Be sure to assign an appropriate column name to the computed results.
SELECT COUNT(*) AS NumberOfMarketingDeptProjects
FROM project
WHERE Department = "Sales and Marketing";

#Part F 
#What is the total MaxHours of projects being run by the Sales and Marketing Department?
#Be sure to assign an appropriate column name to the computed results.
SELECT SUM(MaxHours) As TotalMaxHrsForMKTGDeptProjects
FROM project
WHERE Department =  "Sales and Marketing";

#Part G
#What is the average MaxHours of projects being run by the Sales and Marketing Department?
#Be sure to assign an appropriate column name to the computer results.
SELECT AVG(MaxHours) AS NumberOfMarketingDeptProjects
FROM project
WHERE Department = "Sales and Marketing";

#Part H
#How many projects are being run by each department? Be sure to display each Department 
#and to assign an appropriate column name to the computed results.
SELECT Department, COUNT(*)AS NumberOfDeptProjects
FROM project
GROUP BY Department;
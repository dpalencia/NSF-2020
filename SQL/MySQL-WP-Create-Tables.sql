USE hw2;


CREATE  TABLE DEPARTMENT(
	DepartmentName		Char(35)		NOT NULL,
	BudgetCode			Char(30)		NOT NULL,
	OfficeNumber		Char(15)		NOT NULL,
	DepartmentPhone		Char(12)		NOT NULL,
	CONSTRAINT 			DEPARTMENT_PK 	PRIMARY KEY(DepartmentName)
	);

CREATE  TABLE EMPLOYEE(
	EmployeeNumber		Int 			NOT NULL auto_increment,
	FirstName			Char(25) 		NOT NULL,
	LastName			Char(25) 		NOT NULL,
	Department			Char(35)		NOT NULL DEFAULT 'Human Resources',
	Position			Char(35)		NULL,
	Supervisor			Int				NULL,
	OfficePhone			Char(12)		NULL,
	EmailAddress		VarChar(100)	NOT NULL UNIQUE,
	CONSTRAINT 			EMPLOYEE_PK 	PRIMARY KEY(EmployeeNumber),
	CONSTRAINT 			EMP_DEPART_FK	FOREIGN KEY(Department)
							REFERENCES DEPARTMENT(DepartmentName)
							ON UPDATE CASCADE,
	CONSTRAINT			EMP_SUPER_FK	FOREIGN KEY (Supervisor)
							REFERENCES EMPLOYEE (EmployeeNumber)						
	);

/* mysql does not support incrementing by other than 1, but does allow 
user to specify a starting point by using an alter table statement as shown below 
thus we cannot support identity(1000,100) like mssql
we will have to insert values 1000, 1100, 1200 etc manually  */
CREATE  TABLE PROJECT (
	ProjectID			Int				NOT NULL auto_increment,
	ProjectName			Char(50) 		NOT NULL,
	Department			Char(35)		NOT NULL,
	MaxHours			Numeric(8,2)	NOT NULL DEFAULT 100,
    StartDate			Date			NULL,
    EndDate				Date			NULL,
    CONSTRAINT 			PROJECT_PK 		PRIMARY KEY (ProjectID),
	CONSTRAINT 			PROJ_DEPART_FK	FOREIGN KEY(Department)
							REFERENCES DEPARTMENT(DepartmentName)
								ON UPDATE CASCADE
    	);
ALTER table PROJECT auto_increment = 1000;

CREATE  TABLE ASSIGNMENT (
   	ProjectID			Int	 			NOT NULL,
	EmployeeNumber		Int	 			NOT NULL,
    HoursWorked			Numeric(6,2)	NULL,
   	CONSTRAINT 			ASSIGNMENT_PK 	PRIMARY KEY (ProjectID, EmployeeNumber),
   	CONSTRAINT 			ASSIGN_PROJ_FK  FOREIGN KEY (ProjectID)
							REFERENCES PROJECT (ProjectID)
								ON UPDATE NO ACTION
								ON DELETE CASCADE,
    CONSTRAINT 			ASSIGN_EMP_FK   FOREIGN KEY (EmployeeNumber)
							REFERENCES EMPLOYEE (EmployeeNumber)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION
 	);

/********************************************************************************/
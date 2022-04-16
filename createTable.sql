use proj_3
go;

CREATE TABLE DEPARTMENTS (
    DepartmentName VARCHAR(50) NOT NULL,
    DepartmentID Int NOT NULL IDENTITY(1, 1),
    ManagerSSN int NOT NULL,
    ManagerStartDate DATE NOT NULL

    CONSTRAINT DepartmentPK PRIMARY KEY(DepartmentID)
);

CREATE TABLE DEPARTMENT_LOCATION(
    DepartmentID int NOT NULL,
    DepartmentLocation varchar(35) NOT NULL,

    CONSTRAINT DEPARTMENT_LOCATIONPK  PRIMARY KEY(DepartmentLocation, DepartmentID),
    CONSTRAINT DEPARTMENT_LOCATIONFK FOREIGN KEY(DepartmentID) REFERENCES DEPARTMENTS(DepartmentID),
);
CREATE TABLE PROJECT(
    DepartmentID int NOT NULL,
    ProjectID int NOT NULL,
    Hours_workedWeekly decimal NULL,
    ProjectLocation varchar(35)

    CONSTRAINT ProjDeptFK FOREIGN KEY(DepartmentID) REFERENCES DEPARTMENTS(DepartmentID),
    CONSTRAINT ProjectLocationFK FOREIGN KEY (ProjectLocation) REFERENCES DEPARTMENT_LOCATION(DepartmentLocation),
    CONSTRAINT ProjPK PRIMARY KEY (ProjectID)
);

CREATE TABLE PAYROLL(
    ProjectID int NOT NULL,
    EmployeeID int NOT NULL,
    PayDate DATE NULL,
    ProjectHrsPerWeek int NULL

    CONSTRAINT PayrollProjIDFK FOREIGN KEY(ProjectID) REFERENCES Project(ProjectID),
    CONSTRAINT PayrollEmplIDFK FOREIGN KEY(EmployeeID) REFERENCES EMPLOYEE(EmployeeID),
    CONSTRAINT PayrollPK PRIMARY KEY (ProjectID)
)

CREATE TABLE EMPLOYEE
(
    EmployeeID           INT IDENTITY (1, 1) NOT NULL,
    FirstName            varchar(20)         NOT NULL,
    LastName             varchar(20)         NOT NULL,
    EmployeeSSN          varchar(9)          NOT NULL,
    Salary               NUMERIC(3, 2)       NOT NULL,
    Sex                  char(1)             NOT NULL,
    DOB                  DATE                NOT NULL,
    DepartmentID         INT                 NOT NULL IDENTITY (1, 1),
    SupervisorEmployeeID INT                 NULL,

    CONSTRAINT EmployeeDeptIDFK FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENTS (DepartmentID),
    CONSTRAINT EmployeeIDPK PRIMARY KEY (EmployeeID),
    CONSTRAINT EmployeeSupervisorRelation CHECK  (SupervisorEmployeeID IN (EmployeeID)),
    CONSTRAINT EmployeeSSNCHECK CHECK ( EmployeeID LIKE ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
);

CREATE TABLE DEPENDENT(
    EmployeeID int NOT NULL,
    FirstName varchar(35) NOT NULL,
    LastName varchar(35) NOT NULL,
    Sex char(1) NOT NULL,
    BirthDate DATE NOT NULL,
    Relationship varchar(10) NOT NULL,

    CONSTRAINT DependentNamePK PRIMARY KEY(FirstName, EmployeeID),
    CONSTRAINT EmployeeSSNFK FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID)
)


/* Add contraints via alter table


GO;
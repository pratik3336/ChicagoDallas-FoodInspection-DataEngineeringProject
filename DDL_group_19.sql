--Facility dimension table
CREATE TABLE Facility_dim (
    FacilityID INT PRIMARY KEY,
    Zipcode VARCHAR(25),
    StartDate DATE,
    EndDate DATE,
    CurrentFlag BIT,
    DurableFacilityID INT,
    DBA_Name VARCHAR(250),
    AKA_Name VARCHAR(250),
    LicenseNo VARCHAR(75),
    Address VARCHAR(300),
    Latitude FLOAT,
    Longitude FLOAT,
    Location VARCHAR(1000)
);

--Date dimension table
CREATE TABLE Date_dim (
    DateID INT PRIMARY KEY,
    Date DATE,
    Day INT,
    Month INT,
    Year INT
);

--Inspection dimension table
CREATE TABLE Inspection_dim (
    InspectionID INT PRIMARY KEY,
    InspectionType VARCHAR(75),
    InspectionDate DATE
);

--Result dimension table
CREATE TABLE Result_dim (
    ResultID INT PRIMARY KEY,
    InspectionResult VARCHAR(75)
);

--Risk dimension table
CREATE TABLE Risk_dim (
    RiskID INT PRIMARY KEY,
    RiskCategory VARCHAR(75)
);

--Violation dimension table
CREATE TABLE Violation_dim (
    ViolationID INT PRIMARY KEY,
    ViolationDescription VARCHAR(7500),
    ViolationPoints INT,
    ViolationDetails VARCHAR(7500),
    ViolationMemos VARCHAR(7500)
);

--Inspection fact table
CREATE TABLE Inspection_fct (
    FactInspectionID INT PRIMARY KEY,
    TotalViolationScore INT,
	InspectionScore INT,
    NumberOfViolations INT,
    FacilityID INT FOREIGN KEY REFERENCES Facility_dim(FacilityID),
    InspectionID INT FOREIGN KEY REFERENCES Inspection_dim(InspectionID),
    ResultID INT FOREIGN KEY REFERENCES Result_dim(ResultID),
    DateID INT FOREIGN KEY REFERENCES Date_dim(DateID),
    RiskID INT FOREIGN KEY REFERENCES Risk_dim(RiskID)
);

--Violation fact table
CREATE TABLE Violation_fct (
    FctViolationID INT PRIMARY KEY,
    Status VARCHAR(30),
    CurrentFlag BIT,
    DurableViolationFctID INT,
    Comments VARCHAR(1000),
    ViolationID INT FOREIGN KEY REFERENCES Violation_dim(ViolationID),
    InspectionID INT FOREIGN KEY REFERENCES Inspection_dim(InspectionID),
    DateID INT FOREIGN KEY REFERENCES Date_dim(DateID),
    FacilityID INT FOREIGN KEY REFERENCES Facility_dim(FacilityID)
);

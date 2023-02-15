--  Units table
CREATE TABLE Units (
  UnitNumber NUMBER(35) PRIMARY KEY NOT NULL,
  FloorLevel NUMBER(35) NOT NULL,
  "Size" NUMBER(35) NOT NULL,
  "Type" CHAR(25) NOT NULL
);

--Owner table
CREATE TABLE Owners (
  OwnerID NUMBER(35) PRIMARY KEY NOT NULL ,
  FirstName VARCHAR(20) NOT NULL,
  LastName VARCHAR(20) NOT NULL,
  PhoneNumber NUMBER(10) NOT NULL,
  UnitNumber NUMBER(4) NOT NULL,
  OwnershipStatus CHAR(15) NOT NULL,
  RentAmount DECIMAL(10,2) DEFAULT 0,
  FOREIGN KEY (UnitNumber) REFERENCES Units(UnitNumber)
);

--Condo's Employees table
CREATE TABLE Employees (
  EmployeeID NUMBER(20) PRIMARY KEY NOT NULL,
  FirstName VARCHAR(20) NOT NULL,
  LastName VARCHAR(20) NOT NULL,
  PhoneNumber NUMBER(10) NOT NULL,
  "Position" VARCHAR(25) NOT NULL
);

-- MaintenanceRequests table
CREATE TABLE MaintenanceRequests (
  RequestID NUMBER(20) PRIMARY KEY NOT NULL ,
  OwnerID NUMBER(20) NOT NULL,
  "Description" VARCHAR(200) NOT NULL,
  RequestDate DATE NOT NULL,
  AssignedTo NUMBER(20) NOT NULL,
  Status CHAR(20) NOT NULL,
  CompletionDate DATE,
  FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID),
  FOREIGN KEY (AssignedTo) REFERENCES Employees(EmployeeID)
);

-- ElectricityUsage table
CREATE TABLE ElectricityUsage (
  UsageID NUMBER(20) PRIMARY KEY NOT NULL,
  UnitNumber NUMBER(4) NOT NULL,
  MonthYear DATE NOT NULL,
  "Usage" NUMBER(10) NOT NULL,
  FOREIGN KEY (UnitNumber) REFERENCES Units(UnitNumber)
);

-- ParkingSlots table
CREATE TABLE ParkingSlots (
  ParkingID NUMBER(10) PRIMARY KEY NOT NULL ,
  UnitNumber NUMBER(4) NOT NULL,
  SlotNumber NUMBER(10) NOT NULL,
  Availability CHAR(25) NOT NULL,
  FOREIGN KEY (UnitNumber) REFERENCES Units(UnitNumber)
);


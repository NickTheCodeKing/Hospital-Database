DROP TABLE Timecard;
DROP TABLE Bed;
DROP TABLE Patient;
DROP TABLE Nurse;
DROP TABLE Physician;

CREATE TABLE Physician(
    PhysicianID            CHAR(3),
    PhysicianName          VARCHAR(80),
    PhysicianSpecialty     VARCHAR(80),
    
    CONSTRAINT PhysicianPK 
        PRIMARY KEY (PhysicianID)
);

CREATE TABLE Nurse(
    N_ID               CHAR(3),
    N_Name             VARCHAR(80),
    N_Salary           NUMBER,
    N_SupervisorID     CHAR(3),
    
    CONSTRAINT NursePK
        PRIMARY KEY (N_ID),
    CONSTRAINT NurseFK
        FOREIGN KEY (N_SupervisorID)
        REFERENCES Nurse(N_ID)
);

CREATE TABLE Patient(
    P_Number       CHAR(3),
    P_Name         VARCHAR(80),
    P_Age          NUMBER(2),
    P_PhysicianID  CHAR(3),
    
    CONSTRAINT PatientPK
        PRIMARY KEY (P_Number),
    CONSTRAINT PatientFK
        FOREIGN KEY (P_PhysicianID)
        REFERENCES Physician(PhysicianID)
);

CREATE TABLE Bed(
    B_Number           CHAR(3),
    B_RoomNumber       NUMBER,
    B_Unit             VARCHAR(80),
    B_PatientNumber    CHAR(3),
    B_NurseID          CHAR(3),
    
    CONSTRAINT BedPK
        PRIMARY KEY (B_Number),
    CONSTRAINT BedFK
        FOREIGN KEY (B_PatientNumber)
        REFERENCES Patient(P_Number),
        
        FOREIGN KEY (B_NurseID)
        REFERENCES Nurse(N_ID)
);

CREATE TABLE Timecard(
    T_PhysicianID CHAR(3),
    T_CardDate DATE,
    T_Hours NUMBER,
    
    CONSTRAINT TimecardPK
        PRIMARY KEY (T_PhysicianID, T_CardDate),
    CONSTRAINT TimecardFK
        FOREIGN KEY (T_PhysicianID)
        REFERENCES Physician(PhysicianID)
);
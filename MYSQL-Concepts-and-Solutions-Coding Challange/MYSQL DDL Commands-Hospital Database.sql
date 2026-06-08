-- To Create Hospital Database
Create Database Hospital;
Use Hospital;
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    AdmissionDate DATE
);

ALTER TABLE Patients
ADD DoctorAssigned VARCHAR(50);

ALTER TABLE Patients
MODIFY PatientName VARCHAR(100);

RENAME TABLE Patients TO Patient_Info;

TRUNCATE TABLE Patient_Info;

DROP TABLE Patient_Info;
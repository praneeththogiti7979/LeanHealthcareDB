CREATE DATABASE LeanHealthcareDB;
GO
USE LeanHealthcareDB;
GO

CREATE TABLE Patients (
    PatientID INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DOB DATE,
    Gender NVARCHAR(10),
    Phone NVARCHAR(15)
);

CREATE TABLE Doctors (
    DoctorID INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Specialty NVARCHAR(50)
);

CREATE TABLE Appointments (
    AppointmentID INT IDENTITY PRIMARY KEY,
    PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
    DoctorID INT FOREIGN KEY REFERENCES Doctors(DoctorID),
    AppointmentDate DATETIME,
    Reason NVARCHAR(100),
    Status NVARCHAR(20)
);

CREATE TABLE Billing (
    BillID INT IDENTITY PRIMARY KEY,
    AppointmentID INT FOREIGN KEY REFERENCES Appointments(AppointmentID),
    Amount DECIMAL(10,2),
    PaymentStatus NVARCHAR(20),
    PaymentDate DATE NULL
);

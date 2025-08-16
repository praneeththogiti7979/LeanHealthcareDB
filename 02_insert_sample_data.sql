USE LeanHealthcareDB;
GO

INSERT INTO Patients (FirstName, LastName, DOB, Gender, Phone)
VALUES ('John', 'Doe', '1990-05-15', 'Male', '9876543210'),
       ('Jane', 'Smith', '1985-11-23', 'Female', '8765432109');

INSERT INTO Doctors (FirstName, LastName, Specialty)
VALUES ('Alice', 'Brown', 'Cardiology'),
       ('Bob', 'White', 'Dermatology');

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Reason, Status)
VALUES (1, 1, '2025-08-20 10:00:00', 'Checkup', 'Scheduled'),
       (2, 2, '2025-08-22 11:30:00', 'Skin rash', 'Scheduled');

INSERT INTO Billing (AppointmentID, Amount, PaymentStatus)
VALUES (1, 500.00, 'Pending'),
       (2, 800.00, 'Pending');

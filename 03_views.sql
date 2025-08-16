USE LeanHealthcareDB;
GO

CREATE VIEW vw_PatientAppointments AS
SELECT 
    A.AppointmentID,
    P.FirstName + ' ' + P.LastName AS PatientName,
    D.FirstName + ' ' + D.LastName AS DoctorName,
    D.Specialty,
    A.AppointmentDate,
    A.Reason,
    A.Status
FROM Appointments A
JOIN Patients P ON A.PatientID = P.PatientID
JOIN Doctors D ON A.DoctorID = D.DoctorID;
GO

CREATE VIEW vw_BillingSummary AS
SELECT 
    B.BillID,
    P.FirstName + ' ' + P.LastName AS PatientName,
    D.FirstName + ' ' + D.LastName AS DoctorName,
    A.AppointmentDate,
    B.Amount,
    B.PaymentStatus,
    B.PaymentDate
FROM Billing B
JOIN Appointments A ON B.AppointmentID = A.AppointmentID
JOIN Patients P ON A.PatientID = P.PatientID
JOIN Doctors D ON A.DoctorID = D.DoctorID;
GO

CREATE VIEW vw_UpcomingAppointments AS
SELECT 
    A.AppointmentID,
    P.FirstName + ' ' + P.LastName AS PatientName,
    D.FirstName + ' ' + D.LastName AS DoctorName,
    A.AppointmentDate,
    A.Status
FROM Appointments A
JOIN Patients P ON A.PatientID = P.PatientID
JOIN Doctors D ON A.DoctorID = D.DoctorID
WHERE A.AppointmentDate > GETDATE();
GO

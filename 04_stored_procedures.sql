USE LeanHealthcareDB;
GO

CREATE PROCEDURE sp_ScheduleAppointment
    @PatientID INT,
    @DoctorID INT,
    @AppointmentDate DATETIME,
    @Reason NVARCHAR(100)
AS
BEGIN
    INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Reason, Status)
    VALUES (@PatientID, @DoctorID, @AppointmentDate, @Reason, 'Scheduled');
END;
GO

CREATE PROCEDURE sp_CompleteAppointment
    @AppointmentID INT
AS
BEGIN
    UPDATE Appointments
    SET Status = 'Completed'
    WHERE AppointmentID = @AppointmentID;

    INSERT INTO Billing (AppointmentID, Amount, PaymentStatus)
    VALUES (@AppointmentID, 500.00, 'Pending');
END;
GO

CREATE PROCEDURE sp_GetPatientHistory
    @PatientID INT
AS
BEGIN
    SELECT A.AppointmentDate, A.Reason, A.Status, D.FirstName + ' ' + D.LastName AS DoctorName
    FROM Appointments A
    JOIN Doctors D ON A.DoctorID = D.DoctorID
    WHERE A.PatientID = @PatientID
    ORDER BY A.AppointmentDate DESC;
END;
GO

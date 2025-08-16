USE LeanHealthcareDB;
GO

CREATE FUNCTION fn_GetTotalUnpaidBills(@PatientID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2);
    SELECT @Total = SUM(B.Amount)
    FROM Billing B
    JOIN Appointments A ON B.AppointmentID = A.AppointmentID
    WHERE A.PatientID = @PatientID AND B.PaymentStatus = 'Pending';
    RETURN ISNULL(@Total, 0);
END;
GO

CREATE FUNCTION fn_GetDoctorUpcomingAppointments(@DoctorID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    SELECT @Count = COUNT(*)
    FROM Appointments
    WHERE DoctorID = @DoctorID AND AppointmentDate > GETDATE();
    RETURN @Count;
END;
GO

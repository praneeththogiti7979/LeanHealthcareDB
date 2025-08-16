USE LeanHealthcareDB;
GO

CREATE TRIGGER trg_AutoGenerateBill
ON Appointments
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Status)
    BEGIN
        INSERT INTO Billing (AppointmentID, Amount, PaymentStatus)
        SELECT AppointmentID, 500.00, 'Pending'
        FROM Inserted
        WHERE Status = 'Completed';
    END
END;
GO

CREATE TRIGGER trg_PreventPatientDelete
ON Patients
INSTEAD OF DELETE
AS
BEGIN
    RAISERROR('Patients with appointments cannot be deleted.', 16, 1);
END;
GO

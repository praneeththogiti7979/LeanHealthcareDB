USE LeanHealthcareDB;
GO

CREATE INDEX idx_Appointments_PatientID ON Appointments(PatientID);
CREATE INDEX idx_Appointments_DoctorID ON Appointments(DoctorID);
CREATE INDEX idx_Billing_AppointmentID ON Billing(AppointmentID);
GO

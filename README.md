# LeanHealthcareDB – SQL Healthcare Management System

## Overview
LeanHealthcareDB is a SQL Server database designed to manage patients, doctors, appointments, and billing.
It demonstrates database design, stored procedures, views, triggers, functions, and indexing for performance optimization.

## Features
- Database Design with 4 core tables.
- Views for reporting (Appointments, Billing Summary, Upcoming Appointments).
- Stored Procedures to schedule and complete appointments, retrieve history.
- Triggers to automate billing and enforce integrity.
- Functions for analytics (unpaid bills, upcoming appointments).
- Indexes for faster queries.

## How to Run
1. Open SQL Server Management Studio (SSMS).
2. Execute scripts in order:
   - 01_create_database.sql
   - 02_insert_sample_data.sql
   - 03_views.sql
   - 04_stored_procedures.sql
   - 05_triggers.sql
   - 06_functions.sql
   - 07_indexes.sql

## Sample Queries
```sql
-- View billing summary
SELECT * FROM vw_BillingSummary;

-- Schedule appointment
EXEC sp_ScheduleAppointment 1, 2, '2025-08-20 10:00:00', 'Follow-up Check';

-- Complete appointment
EXEC sp_CompleteAppointment 1;

-- Get total unpaid bills
SELECT dbo.fn_GetTotalUnpaidBills(1) AS TotalUnpaid;
```

## Resume Highlights
- Designed & implemented relational DB for healthcare management.
- Built views, procedures, triggers, functions, and indexes.
- Demonstrated automation and performance tuning in SQL Server.

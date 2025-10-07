-- =====================================================
-- Database Cleanup Script for College ERP System
-- Use this script to clear all data from the database
-- Run this BEFORE running the sample_data_queries.sql
-- =====================================================

-- Disable foreign key constraints temporarily (optional approach)
-- EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'

-- Delete all data in correct order (respecting foreign key constraints)
PRINT 'Starting database cleanup...'

-- Clear fee payments first (most dependent table)
DELETE FROM fee_payments;
DBCC CHECKIDENT ('fee_payments', RESEED, 0);
PRINT 'Cleared fee_payments table'

-- Clear student fees
DELETE FROM student_fees;
DBCC CHECKIDENT ('student_fees', RESEED, 0);
PRINT 'Cleared student_fees table'

-- Clear fee structures
DELETE FROM fee_structures;
DBCC CHECKIDENT ('fee_structures', RESEED, 0);
PRINT 'Cleared fee_structures table'

-- Clear student enrollments (if any)
IF OBJECT_ID('student_enrollments', 'U') IS NOT NULL
BEGIN
    DELETE FROM student_enrollments;
    DBCC CHECKIDENT ('student_enrollments', RESEED, 0);
    PRINT 'Cleared student_enrollments table'
END

-- Clear students
DELETE FROM students;
DBCC CHECKIDENT ('students', RESEED, 0);
PRINT 'Cleared students table'

-- Clear admins (if any)
IF OBJECT_ID('admins', 'U') IS NOT NULL
BEGIN
    DELETE FROM admins;
    DBCC CHECKIDENT ('admins', RESEED, 0);
    PRINT 'Cleared admins table'
END

-- Clear faculty (if any)
IF OBJECT_ID('faculty', 'U') IS NOT NULL
BEGIN
    DELETE FROM faculty;
    DBCC CHECKIDENT ('faculty', RESEED, 0);
    PRINT 'Cleared faculty table'
END

-- Clear users
DELETE FROM users;
DBCC CHECKIDENT ('users', RESEED, 0);
PRINT 'Cleared users table'

-- Clear courses (if any)
IF OBJECT_ID('courses', 'U') IS NOT NULL
BEGIN
    DELETE FROM courses;
    DBCC CHECKIDENT ('courses', RESEED, 0);
    PRINT 'Cleared courses table'
END

-- Clear fee types
DELETE FROM fee_types;
DBCC CHECKIDENT ('fee_types', RESEED, 0);
PRINT 'Cleared fee_types table'

-- Clear departments (least dependent table)
DELETE FROM departments;
DBCC CHECKIDENT ('departments', RESEED, 0);
PRINT 'Cleared departments table'

-- Re-enable foreign key constraints (if disabled)
-- EXEC sp_MSforeachtable 'ALTER TABLE ? CHECK CONSTRAINT ALL'

PRINT 'Database cleanup completed successfully!'
PRINT 'You can now run the sample_data_queries.sql script to insert fresh data.'
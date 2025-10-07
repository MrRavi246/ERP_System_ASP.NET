-- =====================================================
-- Fresh Sample Data for College ERP System
-- Run this AFTER running cleanup_database.sql
-- This ensures proper ID sequencing and no conflicts
-- =====================================================

-- 1. Insert Sample Departments
INSERT INTO departments (name, code, description, is_active) VALUES
('Computer Science', 'CS', 'Computer Science and Engineering Department', 1),
('Electrical Engineering', 'EE', 'Electrical and Electronics Engineering', 1),
('Mechanical Engineering', 'ME', 'Mechanical Engineering Department', 1),
('Civil Engineering', 'CE', 'Civil Engineering Department', 1);

PRINT 'Inserted departments'

-- 2. Insert Sample Fee Types
INSERT INTO fee_types (name, description, is_active) VALUES
('Tuition Fee', 'Academic tuition fee for courses', 1),
('Library Fee', 'Library access and maintenance fee', 1),
('Hostel Fee', 'Accommodation fee for hostel students', 1),
('Examination Fee', 'Fee for examination and evaluation', 1),
('Transport Fee', 'Transportation service fee', 1),
('Laboratory Fee', 'Laboratory equipment and maintenance fee', 1);

PRINT 'Inserted fee types'

-- 3. Insert Sample Users
INSERT INTO users (email, password_hash, role, is_active) VALUES
('admin@college.edu', 'hashed_password_123', 'admin', 1),
('john.doe@college.edu', 'hashed_password_456', 'student', 1),
('sarah.wilson@college.edu', 'hashed_password_789', 'student', 1),
('mike.johnson@college.edu', 'hashed_password_101', 'student', 1),
('emily.davis@college.edu', 'hashed_password_102', 'student', 1),
('faculty1@college.edu', 'hashed_password_201', 'faculty', 1);

PRINT 'Inserted users'

-- 4. Insert Sample Students (using auto-generated user IDs)
INSERT INTO students (user_id, student_id, roll_number, first_name, last_name, date_of_birth, gender, phone, address, department_id, year_level, admission_date, status) VALUES
(2, 'STU001', 'CS001', 'John', 'Doe', '2002-05-15', 'Male', '+1234567890', '123 Main St, City', 1, '2', '2023-08-15', 'Active'),
(3, 'STU002', 'ME001', 'Sarah', 'Wilson', '2003-03-20', 'Female', '+1234567891', '456 Oak Ave, City', 3, '1', '2024-08-15', 'Active'),
(4, 'STU003', 'EE001', 'Mike', 'Johnson', '2001-12-10', 'Male', '+1234567892', '789 Pine St, City', 2, '3', '2022-08-15', 'Active'),
(5, 'STU004', 'CE001', 'Emily', 'Davis', '2002-08-25', 'Female', '+1234567893', '321 Elm St, City', 4, '2', '2023-08-15', 'Active');

PRINT 'Inserted students'

-- 5. Insert Sample Fee Structures
INSERT INTO fee_structures (department_id, year_level, fee_type_id, amount, academic_year, semester, due_date, is_active) VALUES
-- Computer Science Department
(1, '1', 1, 25000.00, '2024-2025', 'Fall', '2024-09-15', 1),
(1, '1', 2, 5000.00, '2024-2025', 'Fall', '2024-09-15', 1),
(1, '2', 1, 27000.00, '2024-2025', 'Fall', '2024-09-15', 1),
(1, '2', 2, 5000.00, '2024-2025', 'Fall', '2024-09-15', 1),

-- Mechanical Engineering Department
(3, '1', 1, 24000.00, '2024-2025', 'Fall', '2024-09-15', 1),
(3, '1', 2, 5000.00, '2024-2025', 'Fall', '2024-09-15', 1),

-- Electrical Engineering Department
(2, '3', 1, 30000.00, '2024-2025', 'Fall', '2024-09-15', 1),
(2, '3', 2, 5000.00, '2024-2025', 'Fall', '2024-09-15', 1),

-- Civil Engineering Department
(4, '2', 1, 26000.00, '2024-2025', 'Fall', '2024-09-15', 1),
(4, '2', 2, 5000.00, '2024-2025', 'Fall', '2024-09-15', 1);

PRINT 'Inserted fee structures'

-- 6. Insert Sample Student Fees (using correct student IDs: 1,2,3,4)
INSERT INTO student_fees (student_id, fee_structure_id, amount_due, amount_paid, payment_status, due_date, payment_date, remarks) VALUES
-- John Doe (CS001) - Student ID: 1, Year 2
(1, 3, 27000.00, 27000.00, 'Paid', '2024-09-15', '2024-01-10', 'Tuition fee paid in full'),
(1, 4, 5000.00, 5000.00, 'Paid', '2024-09-15', '2024-01-20', 'Library fee paid'),

-- Sarah Wilson (ME001) - Student ID: 2, Year 1
(2, 5, 24000.00, 12000.00, 'Partial', '2024-09-15', '2024-01-15', 'Partial payment made'),
(2, 6, 5000.00, 0.00, 'Pending', '2024-09-15', NULL, 'Payment pending'),

-- Mike Johnson (EE001) - Student ID: 3, Year 3
(3, 7, 30000.00, 30000.00, 'Paid', '2024-09-15', '2024-01-12', 'Full payment received'),
(3, 8, 5000.00, 5000.00, 'Paid', '2024-09-15', '2024-01-22', 'Library fee paid'),

-- Emily Davis (CE001) - Student ID: 4, Year 2
(4, 9, 26000.00, 0.00, 'Pending', '2024-09-15', NULL, 'Payment not yet received'),
(4, 10, 5000.00, 5000.00, 'Paid', '2024-09-15', '2024-01-25', 'Library fee paid');

PRINT 'Inserted student fees'

-- 7. Insert Sample Fee Payments (using correct student_fee IDs: 1,2,3,5,6,8)
INSERT INTO fee_payments (student_fee_id, payment_amount, payment_method, transaction_id, payment_date, received_by, receipt_number, remarks) VALUES
(1, 27000.00, 'Online', 'TXN001234567', '2024-01-10', 1, 'RCP001', 'Tuition fee payment'),
(2, 5000.00, 'Card', 'TXN001234568', '2024-01-20', 1, 'RCP002', 'Library fee payment'),
(3, 12000.00, 'Online', 'TXN001234569', '2024-01-15', 1, 'RCP003', 'Partial tuition payment'),
(5, 30000.00, 'Card', 'TXN001234570', '2024-01-12', 1, 'RCP004', 'Full tuition payment'),
(6, 5000.00, 'Cash', 'CASH001', '2024-01-22', 1, 'RCP005', 'Library fee cash payment'),
(8, 5000.00, 'Online', 'TXN001234571', '2024-01-25', 1, 'RCP006', 'Library fee payment');

PRINT 'Inserted fee payments'

PRINT '========================================='
PRINT 'Sample data insertion completed successfully!'
PRINT 'Database is now ready for testing.'
PRINT '========================================='

-- Quick verification queries
PRINT 'Quick verification:'
SELECT 'Departments' as TableName, COUNT(*) as RecordCount FROM departments
UNION ALL
SELECT 'Users' as TableName, COUNT(*) as RecordCount FROM users
UNION ALL
SELECT 'Students' as TableName, COUNT(*) as RecordCount FROM students
UNION ALL
SELECT 'Fee Types' as TableName, COUNT(*) as RecordCount FROM fee_types
UNION ALL
SELECT 'Fee Structures' as TableName, COUNT(*) as RecordCount FROM fee_structures
UNION ALL
SELECT 'Student Fees' as TableName, COUNT(*) as RecordCount FROM student_fees
UNION ALL
SELECT 'Fee Payments' as TableName, COUNT(*) as RecordCount FROM fee_payments;
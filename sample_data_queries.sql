-- =====================================================
-- Sample Data Insertion Queries for College ERP System
-- This script first clears all existing data, then inserts new test data
-- =====================================================

-- STEP 1: Clear all existing data in correct order (respecting foreign key constraints)
-- Delete in reverse order of dependencies

-- Clear fee payments first
DELETE FROM fee_payments;
DBCC CHECKIDENT ('fee_payments', RESEED, 0);

-- Clear student fees
DELETE FROM student_fees;
DBCC CHECKIDENT ('student_fees', RESEED, 0);

-- Clear fee structures
DELETE FROM fee_structures;
DBCC CHECKIDENT ('fee_structures', RESEED, 0);

-- Clear students
DELETE FROM students;
DBCC CHECKIDENT ('students', RESEED, 0);

-- Clear users
DELETE FROM users;
DBCC CHECKIDENT ('users', RESEED, 0);

-- Clear fee types
DELETE FROM fee_types;
DBCC CHECKIDENT ('fee_types', RESEED, 0);

-- Clear departments
DELETE FROM departments;
DBCC CHECKIDENT ('departments', RESEED, 0);

-- STEP 2: Insert fresh sample data

-- 1. Insert Sample Departments
INSERT INTO departments (name, code, description, is_active) VALUES
('Computer Science', 'CS', 'Computer Science and Engineering Department', 1),
('Electrical Engineering', 'EE', 'Electrical and Electronics Engineering', 1),
('Mechanical Engineering', 'ME', 'Mechanical Engineering Department', 1),
('Civil Engineering', 'CE', 'Civil Engineering Department', 1);

-- 2. Insert Sample Fee Types
INSERT INTO fee_types (name, description, is_active) VALUES
('Tuition Fee', 'Academic tuition fee for courses', 1),
('Library Fee', 'Library access and maintenance fee', 1),
('Hostel Fee', 'Accommodation fee for hostel students', 1),
('Examination Fee', 'Fee for examination and evaluation', 1),
('Transport Fee', 'Transportation service fee', 1),
('Laboratory Fee', 'Laboratory equipment and maintenance fee', 1);

-- 3. Insert Sample Users
INSERT INTO users (email, password_hash, role, is_active) VALUES
('admin@college.edu', 'hashed_password_123', 'admin', 1),
('john.doe@college.edu', 'hashed_password_456', 'student', 1),
('sarah.wilson@college.edu', 'hashed_password_789', 'student', 1),
('mike.johnson@college.edu', 'hashed_password_101', 'student', 1),
('emily.davis@college.edu', 'hashed_password_102', 'student', 1),
('faculty1@college.edu', 'hashed_password_201', 'faculty', 1);

-- 4. Insert Sample Students
INSERT INTO students (user_id, student_id, roll_number, first_name, last_name, date_of_birth, gender, phone, address, department_id, year_level, admission_date, status) VALUES
(2, 'STU001', 'CS001', 'John', 'Doe', '2002-05-15', 'Male', '+1234567890', '123 Main St, City', 1, '2', '2023-08-15', 'Active'),
(3, 'STU002', 'ME001', 'Sarah', 'Wilson', '2003-03-20', 'Female', '+1234567891', '456 Oak Ave, City', 3, '1', '2024-08-15', 'Active'),
(4, 'STU003', 'EE001', 'Mike', 'Johnson', '2001-12-10', 'Male', '+1234567892', '789 Pine St, City', 2, '3', '2022-08-15', 'Active'),
(5, 'STU004', 'CE001', 'Emily', 'Davis', '2002-08-25', 'Female', '+1234567893', '321 Elm St, City', 4, '2', '2023-08-15', 'Active');

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

-- 6. Insert Sample Student Fees
INSERT INTO student_fees (student_id, fee_structure_id, amount_due, amount_paid, payment_status, due_date, payment_date, remarks) VALUES
-- John Doe (CS001) - Year 2
(1, 3, 27000.00, 27000.00, 'Paid', '2024-09-15', '2024-01-10', 'Tuition fee paid in full'),
(1, 4, 5000.00, 5000.00, 'Paid', '2024-09-15', '2024-01-20', 'Library fee paid'),

-- Sarah Wilson (ME001) - Year 1
(2, 5, 24000.00, 12000.00, 'Partial', '2024-09-15', '2024-01-15', 'Partial payment made'),
(2, 6, 5000.00, 0.00, 'Pending', '2024-09-15', NULL, 'Payment pending'),

-- Mike Johnson (EE001) - Year 3 (assuming student_id = 3)
(3, 7, 30000.00, 30000.00, 'Paid', '2024-09-15', '2024-01-12', 'Full payment received'),
(3, 8, 5000.00, 5000.00, 'Paid', '2024-09-15', '2024-01-22', 'Library fee paid'),

-- Emily Davis (CE001) - Year 2 (assuming student_id = 4)
(4, 9, 26000.00, 0.00, 'Pending', '2024-09-15', NULL, 'Payment not yet received'),
(4, 10, 5000.00, 5000.00, 'Paid', '2024-09-15', '2024-01-25', 'Library fee paid');

-- 7. Insert Sample Fee Payments
INSERT INTO fee_payments (student_fee_id, payment_amount, payment_method, transaction_id, payment_date, received_by, receipt_number, remarks) VALUES
(1, 27000.00, 'Online', 'TXN001234567', '2024-01-10', 1, 'RCP001', 'Tuition fee payment'),
(2, 5000.00, 'Card', 'TXN001234568', '2024-01-20', 1, 'RCP002', 'Library fee payment'),
(3, 12000.00, 'Online', 'TXN001234569', '2024-01-15', 1, 'RCP003', 'Partial tuition payment'),
(5, 30000.00, 'Card', 'TXN001234570', '2024-01-12', 1, 'RCP004', 'Full tuition payment'),
(6, 5000.00, 'Cash', 'CASH001', '2024-01-22', 1, 'RCP005', 'Library fee cash payment'),
(8, 5000.00, 'Online', 'TXN001234571', '2024-01-25', 1, 'RCP006', 'Library fee payment');

-- STEP 3: Reset identity seeds to allow new entries
-- This ensures new records won't conflict with sample data

-- Reset users identity to start new entries from ID 100
DBCC CHECKIDENT ('users', RESEED, 99);

-- Reset students identity to start new entries from ID 100  
DBCC CHECKIDENT ('students', RESEED, 99);

-- Reset departments identity to start new entries from ID 50
DBCC CHECKIDENT ('departments', RESEED, 49);

-- Reset fee_types identity to start new entries from ID 50
DBCC CHECKIDENT ('fee_types', RESEED, 49);

-- Reset fee_structures identity to start new entries from ID 100
DBCC CHECKIDENT ('fee_structures', RESEED, 99);

-- Reset student_fees identity to start new entries from ID 100
DBCC CHECKIDENT ('student_fees', RESEED, 99);

-- Reset fee_payments identity to start new entries from ID 100
DBCC CHECKIDENT ('fee_payments', RESEED, 99);

PRINT '========================================='
PRINT 'Sample data insertion completed successfully!'
PRINT 'Identity seeds reset to allow new entries.'
PRINT 'New users will start from ID 100+'
PRINT 'New students will start from ID 100+'
PRINT 'Database is ready for admin interface usage.'
PRINT '========================================='
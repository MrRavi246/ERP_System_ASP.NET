-- =====================================================
-- Data Verification Queries for College ERP System
-- Use these queries to check and verify your database data
-- =====================================================

-- 1. Check All Students with Department Information
SELECT 
    s.id,
    s.roll_number,
    s.first_name + ' ' + s.last_name AS student_name,
    d.name AS department,
    s.year_level,
    s.status,
    u.email,
    s.admission_date
FROM students s
LEFT JOIN departments d ON s.department_id = d.id
LEFT JOIN users u ON s.user_id = u.id
ORDER BY s.roll_number;

-- 2. Check All Fee Types
SELECT 
    id,
    name,
    description,
    is_active
FROM fee_types
ORDER BY name;

-- 3. Check Fee Structures with Department and Fee Type Details
SELECT 
    fs.id,
    d.name AS department,
    fs.year_level,
    ft.name AS fee_type,
    fs.amount,
    fs.academic_year,
    fs.semester,
    fs.due_date,
    fs.is_active
FROM fee_structures fs
LEFT JOIN departments d ON fs.department_id = d.id
LEFT JOIN fee_types ft ON fs.fee_type_id = ft.id
ORDER BY d.name, fs.year_level, ft.name;

-- 4. Check Student Fees with Complete Details
SELECT 
    sf.id,
    s.roll_number,
    s.first_name + ' ' + s.last_name AS student_name,
    d.name AS department,
    ft.name AS fee_type,
    sf.amount_due,
    sf.amount_paid,
    (sf.amount_due - sf.amount_paid) AS pending_amount,
    sf.payment_status,
    sf.due_date,
    sf.payment_date,
    sf.remarks
FROM student_fees sf
INNER JOIN students s ON sf.student_id = s.id
LEFT JOIN fee_structures fs ON sf.fee_structure_id = fs.id
LEFT JOIN departments d ON s.department_id = d.id
LEFT JOIN fee_types ft ON fs.fee_type_id = ft.id
ORDER BY s.roll_number, ft.name;

-- 5. Check Recent Payments (Same query used in your application)
SELECT TOP 10
    s.roll_number,
    s.first_name + ' ' + s.last_name as student_name,
    ft.name as fee_type,
    sf.amount_paid,
    sf.amount_due,
    sf.payment_date,
    sf.payment_status
FROM student_fees sf 
INNER JOIN students s ON sf.student_id = s.id 
LEFT JOIN fee_structures fs ON sf.fee_structure_id = fs.id
LEFT JOIN fee_types ft ON fs.fee_type_id = ft.id
WHERE sf.payment_status = 'Paid' AND sf.payment_date IS NOT NULL
ORDER BY sf.payment_date DESC;

-- 6. Check Payment Statistics (Used in your dashboard)
-- Total Fees
SELECT 'Total Fees' AS metric, ISNULL(SUM(amount_due), 0) AS amount FROM student_fees
UNION ALL
-- Paid Amount
SELECT 'Paid Amount' AS metric, ISNULL(SUM(amount_paid), 0) AS amount FROM student_fees
UNION ALL
-- Pending Amount
SELECT 'Pending Amount' AS metric, ISNULL(SUM(amount_due - amount_paid), 0) AS amount FROM student_fees WHERE payment_status != 'Paid';

-- 7. Check Payment Rate Calculation
SELECT 
    ISNULL(SUM(amount_due), 1) AS total_due,
    ISNULL(SUM(amount_paid), 0) AS total_paid,
    CAST((ISNULL(SUM(amount_paid), 0) * 100.0 / ISNULL(SUM(amount_due), 1)) AS DECIMAL(5,2)) AS payment_rate_percentage
FROM student_fees;

-- 8. Check Students by Payment Status
SELECT 
    payment_status,
    COUNT(*) AS number_of_records,
    SUM(amount_due) AS total_due,
    SUM(amount_paid) AS total_paid
FROM student_fees
GROUP BY payment_status
ORDER BY payment_status;

-- 9. Check Department-wise Fee Summary
SELECT 
    d.name AS department,
    COUNT(sf.id) AS total_fee_records,
    SUM(sf.amount_due) AS total_amount_due,
    SUM(sf.amount_paid) AS total_amount_paid,
    SUM(sf.amount_due - sf.amount_paid) AS total_pending
FROM student_fees sf
INNER JOIN students s ON sf.student_id = s.id
LEFT JOIN departments d ON s.department_id = d.id
GROUP BY d.name
ORDER BY d.name;

-- 10. Check Fee Payment History
SELECT 
    fp.id,
    s.roll_number,
    s.first_name + ' ' + s.last_name AS student_name,
    fp.payment_amount,
    fp.payment_method,
    fp.transaction_id,
    fp.payment_date,
    fp.remarks
FROM fee_payments fp
INNER JOIN student_fees sf ON fp.student_fee_id = sf.id
INNER JOIN students s ON sf.student_id = s.id
ORDER BY fp.payment_date DESC;

-- 11. Simple Count Queries for Quick Verification
SELECT 'Total Departments' AS table_name, COUNT(*) AS record_count FROM departments
UNION ALL
SELECT 'Total Students' AS table_name, COUNT(*) AS record_count FROM students
UNION ALL
SELECT 'Total Fee Types' AS table_name, COUNT(*) AS record_count FROM fee_types
UNION ALL
SELECT 'Total Fee Structures' AS table_name, COUNT(*) AS record_count FROM fee_structures
UNION ALL
SELECT 'Total Student Fees' AS table_name, COUNT(*) AS record_count FROM student_fees
UNION ALL
SELECT 'Total Fee Payments' AS table_name, COUNT(*) AS record_count FROM fee_payments;

-- 12. Check for Data Integrity Issues
-- Students without fee records
SELECT 
    s.roll_number,
    s.first_name + ' ' + s.last_name AS student_name,
    d.name AS department
FROM students s
LEFT JOIN departments d ON s.department_id = d.id
LEFT JOIN student_fees sf ON s.id = sf.student_id
WHERE sf.id IS NULL;

-- Fee records without proper structure reference
SELECT 
    sf.id,
    sf.student_id,
    sf.fee_structure_id
FROM student_fees sf
LEFT JOIN fee_structures fs ON sf.fee_structure_id = fs.id
WHERE fs.id IS NULL;
-- =====================================================
-- College ERP System Database Schema - SQL Server Version
-- Created: August 12, 2025
-- Description: Complete database structure for College ERP System (T-SQL)
-- Target: Microsoft SQL Server 2019+
-- =====================================================

-- Note: Database creation is handled by the SQL Server Database Project
-- The database will be created automatically during deployment

-- =====================================================
-- USER MANAGEMENT TABLES
-- =====================================================

-- Users table (for authentication)
CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    email NVARCHAR(100) UNIQUE NOT NULL,
    password_hash NVARCHAR(255) NOT NULL,
    role NVARCHAR(20) NOT NULL CHECK (role IN ('admin', 'faculty', 'student')),
    is_active BIT DEFAULT 1,
    last_login DATETIME2 NULL,
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE()
);
GO

-- Trigger to update updated_at column
CREATE TRIGGER tr_users_updated_at
ON users
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE users 
    SET updated_at = GETDATE()
    FROM users u
    INNER JOIN inserted i ON u.id = i.id;
END
GO

-- =====================================================
-- ADMIN TABLES
-- =====================================================

-- Admin profiles
CREATE TABLE admins (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT UNIQUE NOT NULL,
    employee_id NVARCHAR(20) UNIQUE NOT NULL,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    phone NVARCHAR(15),
    address NVARCHAR(MAX),
    position NVARCHAR(50) DEFAULT 'Administrator',
    hire_date DATE,
    profile_image NVARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
GO

-- =====================================================
-- DEPARTMENT AND COURSE TABLES
-- =====================================================

-- Departments
CREATE TABLE departments (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    code NVARCHAR(10) UNIQUE NOT NULL,
    description NVARCHAR(MAX),
    head_faculty_id INT NULL,
    is_active BIT DEFAULT 1,
    created_at DATETIME2 DEFAULT GETDATE()
);
GO

-- Courses
CREATE TABLE courses (
    id INT IDENTITY(1,1) PRIMARY KEY,
    course_code NVARCHAR(20) UNIQUE NOT NULL,
    course_name NVARCHAR(100) NOT NULL,
    description NVARCHAR(MAX),
    credits INT DEFAULT 3,
    department_id INT NOT NULL,
    semester INT NOT NULL,
    year_level NVARCHAR(1) NOT NULL CHECK (year_level IN ('1', '2', '3', '4')),
    is_active BIT DEFAULT 1,
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
GO

-- =====================================================
-- FACULTY TABLES
-- =====================================================

-- Faculty profiles
CREATE TABLE faculty (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT UNIQUE NOT NULL,
    employee_id NVARCHAR(20) UNIQUE NOT NULL,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    phone NVARCHAR(15),
    address NVARCHAR(MAX),
    department_id INT NOT NULL,
    designation NVARCHAR(30) NOT NULL CHECK (designation IN ('Professor', 'Associate Professor', 'Assistant Professor', 'Lecturer')),
    qualification NVARCHAR(100),
    experience_years INT DEFAULT 0,
    hire_date DATE,
    salary DECIMAL(10,2),
    profile_image NVARCHAR(255),
    is_active BIT DEFAULT 1,
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
GO

-- Faculty course assignments
CREATE TABLE faculty_courses (
    id INT IDENTITY(1,1) PRIMARY KEY,
    faculty_id INT NOT NULL,
    course_id INT NOT NULL,
    academic_year NVARCHAR(9) NOT NULL, -- e.g., '2024-2025'
    semester NVARCHAR(10) NOT NULL CHECK (semester IN ('Fall', 'Spring', 'Summer')),
    is_active BIT DEFAULT 1,
    assigned_date DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (faculty_id) REFERENCES faculty(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    CONSTRAINT unique_assignment UNIQUE (faculty_id, course_id, academic_year, semester)
);
GO

-- =====================================================
-- STUDENT TABLES
-- =====================================================

-- Student profiles
CREATE TABLE students (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT UNIQUE NOT NULL,
    student_id NVARCHAR(20) UNIQUE NOT NULL,
    roll_number NVARCHAR(20) UNIQUE NOT NULL,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender NVARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    phone NVARCHAR(15),
    address NVARCHAR(MAX),
    department_id INT NOT NULL,
    year_level NVARCHAR(1) NOT NULL CHECK (year_level IN ('1', '2', '3', '4')),
    admission_date DATE,
    graduation_date DATE NULL,
    parent_name NVARCHAR(100),
    parent_phone NVARCHAR(15),
    parent_email NVARCHAR(100),
    profile_image NVARCHAR(255),
    status NVARCHAR(15) DEFAULT 'Active' CHECK (status IN ('Active', 'Suspended', 'Graduated', 'Dropped')),
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
GO

-- Student course enrollments
CREATE TABLE student_enrollments (
    id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    academic_year NVARCHAR(9) NOT NULL,
    semester NVARCHAR(10) NOT NULL CHECK (semester IN ('Fall', 'Spring', 'Summer')),
    enrollment_date DATETIME2 DEFAULT GETDATE(),
    status NVARCHAR(15) DEFAULT 'Enrolled' CHECK (status IN ('Enrolled', 'Completed', 'Dropped', 'Failed')),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    CONSTRAINT unique_enrollment UNIQUE (student_id, course_id, academic_year, semester)
);
GO

-- =====================================================
-- ATTENDANCE TABLES
-- =====================================================

-- Class schedules/periods
CREATE TABLE class_periods (
    id INT IDENTITY(1,1) PRIMARY KEY,
    course_id INT NOT NULL,
    faculty_id INT NOT NULL,
    day_of_week NVARCHAR(10) NOT NULL CHECK (day_of_week IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday')),
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    room_number NVARCHAR(20),
    academic_year NVARCHAR(9) NOT NULL,
    semester NVARCHAR(10) NOT NULL CHECK (semester IN ('Fall', 'Spring', 'Summer')),
    is_active BIT DEFAULT 1,
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (faculty_id) REFERENCES faculty(id)
);
GO

-- Attendance records
CREATE TABLE attendance (
    id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    faculty_id INT NOT NULL,
    class_date DATE NOT NULL,
    period_id INT NOT NULL,
    status NVARCHAR(10) NOT NULL CHECK (status IN ('Present', 'Absent', 'Late')),
    remarks NVARCHAR(MAX),
    marked_by INT NOT NULL, -- faculty user_id
    marked_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (faculty_id) REFERENCES faculty(id),
    FOREIGN KEY (period_id) REFERENCES class_periods(id),
    FOREIGN KEY (marked_by) REFERENCES users(id),
    CONSTRAINT unique_attendance UNIQUE (student_id, course_id, class_date, period_id)
);
GO

-- =====================================================
-- EXAMINATION TABLES
-- =====================================================

-- Exam types
CREATE TABLE exam_types (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL, -- 'Midterm', 'Final', 'Quiz', 'Assignment'
    description NVARCHAR(MAX),
    is_active BIT DEFAULT 1
);
GO

-- Exams
CREATE TABLE exams (
    id INT IDENTITY(1,1) PRIMARY KEY,
    course_id INT NOT NULL,
    exam_type_id INT NOT NULL,
    exam_name NVARCHAR(100) NOT NULL,
    exam_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    total_marks INT NOT NULL,
    passing_marks INT NOT NULL,
    room_number NVARCHAR(20),
    academic_year NVARCHAR(9) NOT NULL,
    semester NVARCHAR(10) NOT NULL CHECK (semester IN ('Fall', 'Spring', 'Summer')),
    instructions NVARCHAR(MAX),
    created_by INT NOT NULL, -- faculty user_id
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (exam_type_id) REFERENCES exam_types(id),
    FOREIGN KEY (created_by) REFERENCES users(id)
);
GO

-- Exam results
CREATE TABLE exam_results (
    id INT IDENTITY(1,1) PRIMARY KEY,
    exam_id INT NOT NULL,
    student_id INT NOT NULL,
    marks_obtained DECIMAL(5,2) NOT NULL,
    grade NVARCHAR(2),
    status NVARCHAR(10) NOT NULL CHECK (status IN ('Pass', 'Fail', 'Absent')),
    remarks NVARCHAR(MAX),
    evaluated_by INT NOT NULL, -- faculty user_id
    evaluated_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (exam_id) REFERENCES exams(id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (evaluated_by) REFERENCES users(id),
    CONSTRAINT unique_result UNIQUE (exam_id, student_id)
);
GO

-- =====================================================
-- TIMETABLE TABLES
-- =====================================================

-- Timetable entries
CREATE TABLE timetables (
    id INT IDENTITY(1,1) PRIMARY KEY,
    course_id INT NOT NULL,
    faculty_id INT NOT NULL,
    day_of_week NVARCHAR(10) NOT NULL CHECK (day_of_week IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday')),
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    room_number NVARCHAR(20),
    academic_year NVARCHAR(9) NOT NULL,
    semester NVARCHAR(10) NOT NULL CHECK (semester IN ('Fall', 'Spring', 'Summer')),
    is_active BIT DEFAULT 1,
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (faculty_id) REFERENCES faculty(id)
);
GO

-- =====================================================
-- FEES TABLES
-- =====================================================

-- Fee types
CREATE TABLE fee_types (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL, -- 'Tuition', 'Library', 'Lab', 'Sports', 'Exam'
    description NVARCHAR(MAX),
    is_active BIT DEFAULT 1
);
GO

-- Fee structures
CREATE TABLE fee_structures (
    id INT IDENTITY(1,1) PRIMARY KEY,
    department_id INT NOT NULL,
    year_level NVARCHAR(1) NOT NULL CHECK (year_level IN ('1', '2', '3', '4')),
    fee_type_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    academic_year NVARCHAR(9) NOT NULL,
    semester NVARCHAR(10) NOT NULL CHECK (semester IN ('Fall', 'Spring', 'Summer', 'Annual')),
    due_date DATE,
    is_active BIT DEFAULT 1,
    FOREIGN KEY (department_id) REFERENCES departments(id),
    FOREIGN KEY (fee_type_id) REFERENCES fee_types(id)
);
GO

-- Student fees
CREATE TABLE student_fees (
    id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT NOT NULL,
    fee_structure_id INT NOT NULL,
    amount_due DECIMAL(10,2) NOT NULL,
    amount_paid DECIMAL(10,2) DEFAULT 0,
    payment_status NVARCHAR(10) DEFAULT 'Pending' CHECK (payment_status IN ('Pending', 'Partial', 'Paid', 'Overdue')),
    due_date DATE NOT NULL,
    payment_date DATE NULL,
    late_fee DECIMAL(10,2) DEFAULT 0,
    discount DECIMAL(10,2) DEFAULT 0,
    remarks NVARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (fee_structure_id) REFERENCES fee_structures(id)
);
GO

-- Fee payments
CREATE TABLE fee_payments (
    id INT IDENTITY(1,1) PRIMARY KEY,
    student_fee_id INT NOT NULL,
    payment_amount DECIMAL(10,2) NOT NULL,
    payment_method NVARCHAR(20) NOT NULL CHECK (payment_method IN ('Cash', 'Card', 'Bank Transfer', 'Online', 'Cheque')),
    transaction_id NVARCHAR(100),
    payment_date DATE NOT NULL,
    received_by INT NOT NULL, -- admin user_id
    receipt_number NVARCHAR(50) UNIQUE NOT NULL,
    remarks NVARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (student_fee_id) REFERENCES student_fees(id),
    FOREIGN KEY (received_by) REFERENCES users(id)
);
GO

-- =====================================================
-- NOTICE BOARD TABLES
-- =====================================================

-- Notices
CREATE TABLE notices (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(200) NOT NULL,
    content NVARCHAR(MAX) NOT NULL,
    target_audience NVARCHAR(15) DEFAULT 'All' CHECK (target_audience IN ('All', 'Students', 'Faculty', 'Admins')),
    priority NVARCHAR(10) DEFAULT 'Medium' CHECK (priority IN ('Low', 'Medium', 'High', 'Urgent')),
    is_active BIT DEFAULT 1,
    start_date DATE NOT NULL,
    end_date DATE,
    attachment_url NVARCHAR(255),
    created_by INT NOT NULL, -- user_id
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (created_by) REFERENCES users(id)
);
GO

-- Trigger to update updated_at column for notices
CREATE TRIGGER tr_notices_updated_at
ON notices
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE notices 
    SET updated_at = GETDATE()
    FROM notices n
    INNER JOIN inserted i ON n.id = i.id;
END
GO

-- =====================================================
-- SYSTEM SETTINGS AND LOGS
-- =====================================================

-- System settings
CREATE TABLE system_settings (
    id INT IDENTITY(1,1) PRIMARY KEY,
    setting_key NVARCHAR(100) UNIQUE NOT NULL,
    setting_value NVARCHAR(MAX),
    description NVARCHAR(MAX),
    updated_by INT NOT NULL,
    updated_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);
GO

-- Trigger to update updated_at column for system_settings
CREATE TRIGGER tr_system_settings_updated_at
ON system_settings
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE system_settings 
    SET updated_at = GETDATE()
    FROM system_settings s
    INNER JOIN inserted i ON s.id = i.id;
END
GO

-- Activity logs
CREATE TABLE activity_logs (
    id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    action NVARCHAR(100) NOT NULL,
    table_name NVARCHAR(50),
    record_id INT,
    old_values NVARCHAR(MAX), -- JSON as NVARCHAR(MAX)
    new_values NVARCHAR(MAX), -- JSON as NVARCHAR(MAX)
    ip_address NVARCHAR(45),
    user_agent NVARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
GO

-- =====================================================
-- INDEXES FOR PERFORMANCE
-- =====================================================

-- User indexes
CREATE INDEX idx_users_email ON users(email);
GO
CREATE INDEX idx_users_role ON users(role);
GO

-- Student indexes
CREATE INDEX idx_students_student_id ON students(student_id);
GO
CREATE INDEX idx_students_department ON students(department_id);
GO
CREATE INDEX idx_students_year ON students(year_level);
GO
CREATE INDEX idx_students_status ON students(status);
GO

-- Faculty indexes
CREATE INDEX idx_faculty_employee_id ON faculty(employee_id);
GO
CREATE INDEX idx_faculty_department ON faculty(department_id);
GO

-- Course indexes
CREATE INDEX idx_courses_code ON courses(course_code);
GO
CREATE INDEX idx_courses_department ON courses(department_id);
GO

-- Attendance indexes
CREATE INDEX idx_attendance_student ON attendance(student_id);
GO
CREATE INDEX idx_attendance_course ON attendance(course_id);
GO
CREATE INDEX idx_attendance_date ON attendance(class_date);
GO

-- Exam indexes
CREATE INDEX idx_exams_course ON exams(course_id);
GO
CREATE INDEX idx_exams_date ON exams(exam_date);
GO

-- Fee indexes
CREATE INDEX idx_student_fees_student ON student_fees(student_id);
GO
CREATE INDEX idx_student_fees_status ON student_fees(payment_status);
GO

-- =====================================================
-- INITIAL DATA INSERTS
-- =====================================================

-- Insert default admin user
INSERT INTO users (email, password_hash, role) VALUES 
('admin@college.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin');
GO

-- Insert admin profile
INSERT INTO admins (user_id, employee_id, first_name, last_name, position, hire_date) VALUES 
(1, 'ADM001', 'System', 'Administrator', 'System Administrator', '2024-01-01');
GO

-- Insert departments
INSERT INTO departments (name, code, description) VALUES 
('Computer Science', 'CS', 'Department of Computer Science and Engineering'),
('Mathematics', 'MATH', 'Department of Mathematics'),
('Physics', 'PHY', 'Department of Physics'),
('Chemistry', 'CHEM', 'Department of Chemistry'),
('Business Administration', 'BBA', 'Department of Business Administration'),
('English Literature', 'ENG', 'Department of English Literature');
GO

-- Insert exam types
INSERT INTO exam_types (name, description) VALUES 
('Midterm', 'Mid-semester examination'),
('Final', 'Final semester examination'),
('Quiz', 'Short quiz assessment'),
('Assignment', 'Assignment submission'),
('Practical', 'Practical examination');
GO

-- Insert fee types
INSERT INTO fee_types (name, description) VALUES 
('Tuition', 'Tuition fees'),
('Library', 'Library fees'),
('Laboratory', 'Laboratory fees'),
('Sports', 'Sports and recreation fees'),
('Examination', 'Examination fees'),
('Development', 'Development fees');
GO

-- Insert system settings
INSERT INTO system_settings (setting_key, setting_value, description, updated_by) VALUES 
('college_name', 'ABC College of Technology', 'College Name', 1),
('academic_year', '2024-2025', 'Current Academic Year', 1),
('current_semester', 'Fall', 'Current Semester', 1),
('timezone', 'UTC', 'System Timezone', 1),
('late_fee_percentage', '5', 'Late fee percentage per month', 1);
GO

-- =====================================================
-- SAMPLE DATA FOR TESTING
-- =====================================================

-- Sample faculty users
INSERT INTO users (email, password_hash, role) VALUES 
('sarah.wilson@college.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'faculty'),
('michael.brown@college.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'faculty'),
('emily.davis@college.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'faculty');
GO

-- Sample faculty profiles
INSERT INTO faculty (user_id, employee_id, first_name, last_name, department_id, designation, qualification, experience_years, hire_date, salary) VALUES 
(2, 'FAC001', 'Sarah', 'Wilson', 1, 'Professor', 'Ph.D Computer Science', 15, '2010-08-15', 75000.00),
(3, 'FAC002', 'Michael', 'Brown', 2, 'Associate Professor', 'M.Sc Mathematics', 12, '2012-01-20', 65000.00),
(4, 'FAC003', 'Emily', 'Davis', 3, 'Assistant Professor', 'Ph.D Physics', 8, '2016-07-10', 55000.00);
GO

-- Sample student users
INSERT INTO users (email, password_hash, role) VALUES 
('john.doe@student.college.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student'),
('jane.smith@student.college.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student'),
('mike.johnson@student.college.edu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student');
GO

-- Sample student profiles
INSERT INTO students (user_id, student_id, roll_number, first_name, last_name, date_of_birth, gender, department_id, year_level, admission_date, parent_name, parent_phone) VALUES 
(5, 'STU001', '2021CS001', 'John', 'Doe', '2002-05-15', 'Male', 1, '3', '2021-08-15', 'Robert Doe', '+1234567890'),
(6, 'STU002', '2021MT002', 'Jane', 'Smith', '2002-03-20', 'Female', 2, '3', '2021-08-15', 'Mary Smith', '+1234567891'),
(7, 'STU003', '2022CS003', 'Mike', 'Johnson', '2003-01-10', 'Male', 1, '2', '2022-08-15', 'James Johnson', '+1234567892');
GO

-- Sample courses
INSERT INTO courses (course_code, course_name, description, credits, department_id, semester, year_level) VALUES 
('CS101', 'Introduction to Programming', 'Basic programming concepts and principles', 4, 1, 1, '1'),
('CS201', 'Data Structures', 'Fundamental data structures and algorithms', 4, 1, 1, '2'),
('CS301', 'Database Systems', 'Database design and management', 3, 1, 1, '3'),
('MATH101', 'Calculus I', 'Differential and integral calculus', 4, 2, 1, '1'),
('MATH201', 'Linear Algebra', 'Vector spaces and linear transformations', 3, 2, 1, '2'),
('PHY101', 'Physics I', 'Mechanics and thermodynamics', 4, 3, 1, '1');
GO

-- Sample notices
INSERT INTO notices (title, content, target_audience, priority, start_date, end_date, created_by) VALUES 
('Welcome to New Academic Year', 'Welcome to the academic year 2024-2025. Classes will begin on September 1st, 2024.', 'All', 'High', '2024-08-15', '2024-09-15', 1),
('Faculty Meeting Scheduled', 'All faculty members are requested to attend the faculty meeting on August 20th, 2024 at 10:00 AM in the conference hall.', 'Faculty', 'Medium', '2024-08-15', '2024-08-20', 1),
('Library Timing Update', 'Library will be open from 8:00 AM to 8:00 PM starting from September 1st, 2024.', 'Students', 'Low', '2024-08-25', '2024-12-31', 1);
GO

-- =====================================================
-- VIEWS FOR COMMON QUERIES
-- =====================================================

-- Student details view
CREATE VIEW dbo.student_details AS
SELECT 
    s.id,
    s.student_id,
    s.roll_number,
    CONCAT(s.first_name, ' ', s.last_name) AS full_name,
    s.phone,
    s.year_level,
    d.name AS department_name,
    s.status,
    u.email
FROM students s
JOIN departments d ON s.department_id = d.id
JOIN users u ON s.user_id = u.id;
GO

-- Faculty details view
CREATE VIEW dbo.faculty_details AS
SELECT 
    f.id,
    f.employee_id,
    CONCAT(f.first_name, ' ', f.last_name) AS full_name,
    f.phone,
    f.designation,
    d.name AS department_name,
    f.experience_years,
    u.email
FROM faculty f
JOIN departments d ON f.department_id = d.id
JOIN users u ON f.user_id = u.id;
GO

-- Course enrollment view
CREATE VIEW dbo.course_enrollments AS
SELECT 
    c.course_code,
    c.course_name,
    d.name AS department_name,
    COUNT(se.student_id) AS enrolled_students,
    c.credits,
    c.year_level
FROM courses c
LEFT JOIN student_enrollments se ON c.id = se.course_id AND se.status = 'Enrolled'
JOIN departments d ON c.department_id = d.id
GROUP BY c.id, c.course_code, c.course_name, d.name, c.credits, c.year_level;
GO

-- =====================================================
-- STORED PROCEDURES
-- =====================================================

-- Procedure to calculate attendance percentage
CREATE PROCEDURE dbo.GetAttendancePercentage
    @p_student_id INT,
    @p_course_id INT,
    @p_start_date DATE,
    @p_end_date DATE,
    @p_percentage DECIMAL(5,2) OUTPUT
AS
BEGIN
    DECLARE @total_classes INT = 0;
    DECLARE @attended_classes INT = 0;
    
    SELECT @total_classes = COUNT(*)
    FROM attendance 
    WHERE student_id = @p_student_id 
    AND course_id = @p_course_id
    AND class_date BETWEEN @p_start_date AND @p_end_date;
    
    SELECT @attended_classes = COUNT(*)
    FROM attendance 
    WHERE student_id = @p_student_id 
    AND course_id = @p_course_id
    AND status IN ('Present', 'Late')
    AND class_date BETWEEN @p_start_date AND @p_end_date;
    
    IF @total_classes > 0
        SET @p_percentage = (@attended_classes * 100.0) / @total_classes;
    ELSE
        SET @p_percentage = 0;
END
GO

-- Procedure to calculate student GPA
CREATE PROCEDURE dbo.GetStudentGPA
    @p_student_id INT,
    @p_academic_year NVARCHAR(9),
    @p_semester NVARCHAR(10),
    @p_gpa DECIMAL(3,2) OUTPUT
AS
BEGIN
    DECLARE @total_points DECIMAL(10,2) = 0;
    DECLARE @total_credits INT = 0;
    
    SELECT 
        @total_points = SUM(CASE 
            WHEN er.grade = 'A+' THEN c.credits * 4.0
            WHEN er.grade = 'A' THEN c.credits * 4.0
            WHEN er.grade = 'A-' THEN c.credits * 3.7
            WHEN er.grade = 'B+' THEN c.credits * 3.3
            WHEN er.grade = 'B' THEN c.credits * 3.0
            WHEN er.grade = 'B-' THEN c.credits * 2.7
            WHEN er.grade = 'C+' THEN c.credits * 2.3
            WHEN er.grade = 'C' THEN c.credits * 2.0
            WHEN er.grade = 'D' THEN c.credits * 1.0
            ELSE 0
        END),
        @total_credits = SUM(c.credits)
    FROM exam_results er
    JOIN exams e ON er.exam_id = e.id
    JOIN courses c ON e.course_id = c.id
    WHERE er.student_id = @p_student_id
    AND e.academic_year = @p_academic_year
    AND e.semester = @p_semester
    AND er.status = 'Pass';
    
    IF @total_credits > 0
        SET @p_gpa = @total_points / @total_credits;
    ELSE
        SET @p_gpa = 0;
END
GO

-- =====================================================
-- TRIGGERS
-- =====================================================

-- Trigger to update fee payment status
CREATE TRIGGER tr_update_fee_status 
ON fee_payments
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @student_fee_id INT, @total_paid DECIMAL(10,2), @amount_due DECIMAL(10,2);
    
    SELECT @student_fee_id = student_fee_id FROM inserted;
    
    SELECT @amount_due = amount_due FROM student_fees WHERE id = @student_fee_id;
    
    SELECT @total_paid = ISNULL(SUM(payment_amount), 0) 
    FROM fee_payments 
    WHERE student_fee_id = @student_fee_id;
    
    UPDATE student_fees 
    SET 
        amount_paid = @total_paid,
        payment_status = CASE 
            WHEN @total_paid >= @amount_due THEN 'Paid'
            WHEN @total_paid > 0 THEN 'Partial'
            ELSE 'Pending'
        END,
        payment_date = CASE 
            WHEN @total_paid >= @amount_due THEN CAST(GETDATE() AS DATE)
            ELSE payment_date
        END
    WHERE id = @student_fee_id;
END
GO

-- Trigger to log user activities
CREATE TRIGGER tr_log_user_login 
ON users
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    IF UPDATE(last_login)
    BEGIN
        INSERT INTO activity_logs (user_id, action, table_name, record_id)
        SELECT i.id, 'LOGIN', 'users', i.id
        FROM inserted i
        INNER JOIN deleted d ON i.id = d.id
        WHERE i.last_login != d.last_login OR (i.last_login IS NOT NULL AND d.last_login IS NULL);
    END
END
GO

-- =====================================================
-- FUNCTIONS
-- =====================================================

-- Function to get full name
CREATE FUNCTION dbo.GetFullName(@first_name NVARCHAR(50), @last_name NVARCHAR(50))
RETURNS NVARCHAR(101)
AS
BEGIN
    RETURN CONCAT(@first_name, ' ', @last_name);
END
GO

-- Function to calculate age
CREATE FUNCTION dbo.CalculateAge(@birth_date DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @birth_date, GETDATE()) - 
           CASE 
               WHEN MONTH(@birth_date) > MONTH(GETDATE()) OR 
                    (MONTH(@birth_date) = MONTH(GETDATE()) AND DAY(@birth_date) > DAY(GETDATE()))
               THEN 1 
               ELSE 0 
           END;
END
GO

-- =====================================================
-- SECURITY AND PERMISSIONS
-- =====================================================

-- Note: Security and permissions are typically managed through the database project properties
-- and deployment scripts rather than in the main schema file.

-- For application access, create these after deployment:
-- 1. SQL Server login for the application
-- 2. Database user mapped to the login  
-- 3. Appropriate role assignments

-- =====================================================
-- BACKUP AND MAINTENANCE COMMANDS
-- =====================================================

-- Note: Backup and maintenance commands are typically handled by:
-- 1. SQL Server Agent jobs
-- 2. Azure SQL Database automated backups
-- 3. Separate maintenance scripts
-- 4. Database administration tools

-- =====================================================
-- END OF DATABASE SCHEMA
-- =====================================================

PRINT 'College ERP Database Schema created successfully!';

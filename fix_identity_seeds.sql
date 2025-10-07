-- =====================================================
-- Quick Fix for Identity Seed Issues
-- Run this script to fix the current identity conflicts
-- =====================================================

-- Check current identity values
SELECT 'Current Users Max ID' as Info, MAX(id) as Value FROM users
UNION ALL
SELECT 'Current Students Max ID' as Info, MAX(id) as Value FROM students;

-- Reset identity seeds to safe values
DECLARE @MaxUserId INT = (SELECT ISNULL(MAX(id), 0) FROM users);
DECLARE @MaxStudentId INT = (SELECT ISNULL(MAX(id), 0) FROM students);

-- Reset users identity to start after current max
DBCC CHECKIDENT ('users', RESEED, @MaxUserId);
PRINT 'Users identity reset to: ' + CAST(@MaxUserId AS VARCHAR);

-- Reset students identity to start after current max  
DBCC CHECKIDENT ('students', RESEED, @MaxStudentId);
PRINT 'Students identity reset to: ' + CAST(@MaxStudentId AS VARCHAR);

-- Verify the fix
SELECT 'After Fix - Users Max ID' as Info, MAX(id) as Value FROM users
UNION ALL
SELECT 'After Fix - Students Max ID' as Info, MAX(id) as Value FROM students;

PRINT 'Identity seed fix completed. You can now add new students through the admin interface.';
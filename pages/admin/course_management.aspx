<%@ Page Title="" Language="C#" MasterPageFile="~/pages/admin/course_managements.Master" AutoEventWireup="true" CodeBehind="course_management.aspx.cs" Inherits="EduErp.pages.admin.course_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 px-0">
                <div class="sidebar bg-white border-end p-3">
                    <div class="text-center mb-4">
                        <h4 class="text-primary fw-bold">College ERP</h4>
                        <p class="text-muted small">
                            Admin Dashboard
                        </p>
                    </div>
                    <nav class="nav flex-column">
                        <a class="nav-link text-dark" href="dashboard.html"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="students.html"><i class="fas fa-user-graduate me-2 text-primary"></i>Students </a><a class="nav-link text-dark" href="faculty.html"><i class="fas fa-chalkboard-teacher me-2 text-primary"></i>Faculty </a><a class="nav-link active" href="admin_course_management.html"><i class="fas fa-book me-2 text-primary"></i>Course Management </a><a class="nav-link text-dark" href="attendance.html"><i class="fas fa-calendar-check me-2 text-primary"></i>Attendance </a><a class="nav-link text-dark" href="timetable.html"><i class="fas fa-clock me-2 text-primary"></i>Timetable </a><a class="nav-link text-dark" href="exams.html"><i class="fas fa-file-alt me-2 text-primary"></i>Exams & Results </a><a class="nav-link text-dark" href="fees.html"><i class="fas fa-credit-card me-2 text-primary"></i>Fees </a>
                        <a class="nav-link text-dark" href="notices.html"><i class="fas fa-bullhorn me-2 text-primary"></i>Notice Board </a><a class="nav-link text-dark" href="reports.html"><i class="fas fa-chart-bar me-2 text-primary"></i>Reports </a><a class="nav-link text-dark" href="profile.html"><i class="fas fa-user-cog me-2 text-primary"></i>Edit Profile </a>
                    </nav>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 px-4 py-3">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h2 class="mb-1">Course Management</h2>
                        <p class="text-muted">
                            Manage courses, assign faculty and students
                        </p>
                    </div>
                    <div>
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCourseModal">
                            <i class="fas fa-plus me-1"></i>Add New Course
                        </button>
                    </div>
                </div>

                <!-- Course Management Tabs -->
                <ul class="nav nav-tabs mb-4" id="courseTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="courses-tab" data-bs-toggle="tab" data-bs-target="#courses" type="button" role="tab">
                            <i class="fas fa-book me-1"></i>All Courses
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link text-dark" id="assign-faculty-tab" data-bs-toggle="tab" data-bs-target="#assign-faculty" type="button" role="tab">
                            <i class="fas fa-chalkboard-teacher me-1"></i>Assign Faculty
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link text-dark" id="assign-students-tab" data-bs-toggle="tab" data-bs-target="#assign-students" type="button" role="tab">
                            <i class="fas fa-user-graduate me-1"></i>Assign Students
                        </button>
                    </li>
                </ul>

                <!-- Tab Content -->
                <div class="tab-content" id="courseTabContent">
                    <!-- All Courses Tab -->
                    <div class="tab-pane fade show active" id="courses" role="tabpanel">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title mb-0"><i class="fas fa-book me-2 text-primary"></i>All Courses </h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Course Code</th>
                                                <th>Course Name</th>
                                                <th>Department</th>
                                                <th>Credits</th>
                                                <th>Faculty</th>
                                                <th>Students</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody id="coursesTable">
                                            <!-- Courses will be populated by JavaScript -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Assign Faculty Tab -->
                    <div class="tab-pane fade" id="assign-faculty" role="tabpanel">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title mb-0"><i class="fas fa-chalkboard-teacher me-2 text-primary"></i>Assign Faculty to Courses </h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Course</th>
                                                <th>Current Faculty</th>
                                                <th>Department</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody id="facultyAssignmentTable">
                                            <!-- Faculty assignment data will be populated by JavaScript -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Assign Students Tab -->
                    <div class="tab-pane fade" id="assign-students" role="tabpanel">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title mb-0"><i class="fas fa-user-graduate me-2 text-primary"></i>Assign Students to Courses </h5>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-md-4">
                                        <label for="courseSelect" class="form-label">
                                            Select Course</label>
                                        <select class="form-select" id="courseSelect">
                                            <option value="">Choose a course...</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="semesterSelect" class="form-label">
                                            Semester</label>
                                        <select class="form-select" id="semesterSelect">
                                            <option value="1">1st Semester</option>
                                            <option value="2">2nd Semester</option>
                                            <option value="3">3rd Semester</option>
                                            <option value="4">4th Semester</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label">
                                            &nbsp;</label>
                                        <div>
                                            <button class="btn btn-primary" onclick="loadStudentsForAssignment()">
                                                <i class="fas fa-search me-1"></i>Load Students
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <input type="checkbox" id="selectAllStudents" onchange="toggleAllStudents()">
                                                </th>
                                                <th>Roll No</th>
                                                <th>Student Name</th>
                                                <th>Department</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody id="studentAssignmentTable">
                                            <!-- Student assignment data will be populated by JavaScript -->
                                        </tbody>
                                    </table>
                                </div>
                                <div class="mt-3">
                                    <button class="btn btn-success" onclick="assignSelectedStudents()">
                                        <i class="fas fa-check me-1"></i>Assign Selected Students
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Course Modal -->
    <div class="modal fade" id="addCourseModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Course</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal">
                    </button>
                </div>
                <div class="modal-body">
                    <form id="addCourseForm">
                        <div class="mb-3">
                            <label for="courseCode" class="form-label">
                                Course Code</label>
                            <input type="text" class="form-control" id="courseCode" required>
                        </div>
                        <div class="mb-3">
                            <label for="courseName" class="form-label">
                                Course Name</label>
                            <input type="text" class="form-control" id="courseName" required>
                        </div>
                        <div class="mb-3">
                            <label for="department" class="form-label">
                                Department</label>
                            <select class="form-select" id="department" required>
                                <option value="">Select Department</option>
                                <option value="computer_science">Computer Science</option>
                                <option value="engineering">Engineering</option>
                                <option value="mathematics">Mathematics</option>
                                <option value="physics">Physics</option>
                                <option value="chemistry">Chemistry</option>
                                <option value="english">English</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="credits" class="form-label">
                                Credits</label>
                            <input type="number" class="form-control" id="credits" min="1" max="6" required>
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">
                                Description</label>
                            <textarea class="form-control" id="description" rows="3" required></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        Cancel
                    </button>
                    <button type="button" class="btn btn-primary" onclick="addCourse()">
                        Add Course
                    </button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



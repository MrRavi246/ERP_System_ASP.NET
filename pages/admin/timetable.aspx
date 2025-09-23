<%@ Page Title="" Language="C#" MasterPageFile="~/pages/admin/timetable.Master" AutoEventWireup="true" CodeBehind="timetable.aspx.cs" Inherits="EduErp.pages.admin.timetable1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <form runat="server">
        <div class="container-fluid">
            <div class="row">
                <!-- Mobile Navigation Toggle -->
                <button class="mobile-nav-toggle d-md-none" type="button">
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Sidebar Overlay -->
                <div class="sidebar-overlay">
                </div>
                <!-- Sidebar -->
                <div class="col-md-3 col-lg-2 px-0">
                    <div class="sidebar bg-white border-end p-3">
                        <div class="text-center mb-4">
                            <h4 class="text-primary fw-bold">College ERP</h4>
                            <p class="text-muted small">
                                Timetable Management
                            </p>
                        </div>
                        <nav class="nav flex-column">
                            <a class="nav-link text-dark" href="dashboard.aspx"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="students.aspx"><i class="fas fa-user-graduate me-2 text-primary"></i>Students </a><a class="nav-link text-dark" href="faculty.aspx"><i class="fas fa-chalkboard-teacher me-2 text-primary"></i>Faculty </a><a class="nav-link text-dark" href="courses.aspx"><i class="fas fa-book me-2 text-primary"></i>Courses </a><a class="nav-link text-dark" href="attendance.aspx"><i class="fas fa-calendar-check me-2 text-primary"></i>Attendance </a><a class="nav-link active" href="timetable.aspx"><i class="fas fa-clock me-2 text-primary"></i>Timetable </a><a class="nav-link text-dark" href="exams.aspx"><i class="fas fa-file-alt me-2 text-primary"></i>Exams & Results </a><a class="nav-link text-dark" href="fees.aspx"><i class="fas fa-credit-card me-2 text-primary"></i>Fees </a><a class="nav-link text-dark" href="notices.aspx">
                                <i class="fas fa-bullhorn me-2 text-primary"></i>Notice Board </a><a class="nav-link text-dark" href="reports.aspx"><i class="fas fa-chart-bar me-2 text-primary"></i>Reports </a>
                        </nav>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="col-md-9 col-lg-10 main-content">
                    <!-- Top Navigation -->
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <div>
                            <h1 class="h2">Timetable Management</h1>
                            <p class="text-muted">
                                View and manage class schedules
                            </p>
                        </div>
                        <div class="btn-toolbar mb-2 mb-md-0">
                            <button class="btn btn-primary me-2" data-bs-toggle="modal" data-bs-target="#addScheduleModal">
                                <i class="fas fa-plus me-2 text-primary"></i>Add Schedule
                            </button>
                            <button class="btn btn-outline-secondary" onclick="printTimetable()">
                                <i class="fas fa-print me-2 text-primary"></i>Print
                            </button>
                        </div>
                    </div>

                    <!-- Filters -->
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <label for="departmentFilter" class="form-label">
                                Department</label>
                            <select class="form-select" id="departmentFilter">
                                <option value="">All Departments</option>
                                <option value="Computer Science">Computer Science</option>
                                <option value="Engineering">Engineering</option>
                                <option value="Business">Business</option>
                                <option value="Arts">Arts</option>
                                <option value="Science">Science</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="yearFilter" class="form-label">
                                Year</label>
                            <select class="form-select" id="yearFilter">
                                <option value="">All Years</option>
                                <option value="1">1st Year</option>
                                <option value="2">2nd Year</option>
                                <option value="3">3rd Year</option>
                                <option value="4">4th Year</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="semesterFilter" class="form-label">
                                Semester</label>
                            <select class="form-select" id="semesterFilter">
                                <option value="">All Semesters</option>
                                <option value="1">Semester 1</option>
                                <option value="2">Semester 2</option>
                                <option value="3">Semester 3</option>
                                <option value="4">Semester 4</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="viewType" class="form-label">
                                View Type</label>
                            <select class="form-select" id="viewType">
                                <option value="weekly">Weekly View</option>
                                <option value="daily">Daily View</option>
                            </select>
                        </div>
                    </div>

                    <!-- Timetable -->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title mb-0"><i class="fas fa-calendar me-2 text-primary"></i>Weekly Timetable </h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="timetableTable">
                                    <thead>
                                        <tr>
                                            <th class="timetable-header">Time</th>
                                            <th class="timetable-header">Monday</th>
                                            <th class="timetable-header">Tuesday</th>
                                            <th class="timetable-header">Wednesday</th>
                                            <th class="timetable-header">Thursday</th>
                                            <th class="timetable-header">Friday</th>
                                            <th class="timetable-header">Saturday</th>
                                        </tr>
                                    </thead>
                                    <tbody id="timetableBody">
                                        <!-- Timetable rows will be populated by JavaScript -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Legend -->
                    <div class="card mt-4">
                        <div class="card-header">
                            <h5 class="card-title mb-0"><i class="fas fa-info-circle me-2 text-primary"></i>Legend </h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="course-slot cs">
                                        CS - Computer Science
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="course-slot en">
                                        EN - Engineering
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="course-slot bu">
                                        BU - Business
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="course-slot ar">
                                        AR - Arts
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="course-slot sc">
                                        SC - Science
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="break-slot">
                                        Break
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Schedule Modal -->
        <div class="modal fade" id="addScheduleModal" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><i class="fas fa-plus me-2 text-primary"></i>Add New Schedule </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal">
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="scheduleCourse" class="form-label">
                                    Course *</label>
                                <select class="form-select" id="scheduleCourse" required>
                                    <option value="">Select Course</option>
                                    <option value="CS101">CS101 - Introduction to Computer Science</option>
                                    <option value="CS201">CS201 - Data Structures and Algorithms</option>
                                    <option value="EN101">EN101 - Engineering Mechanics</option>
                                    <option value="BU201">BU201 - Business Management</option>
                                    <option value="AR101">AR101 - Introduction to Fine Arts</option>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="scheduleDay" class="form-label">
                                    Day *</label>
                                <select class="form-select" id="scheduleDay" required>
                                    <option value="">Select Day</option>
                                    <option value="Monday">Monday</option>
                                    <option value="Tuesday">Tuesday</option>
                                    <option value="Wednesday">Wednesday</option>
                                    <option value="Thursday">Thursday</option>
                                    <option value="Friday">Friday</option>
                                    <option value="Saturday">Saturday</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="startTime" class="form-label">
                                    Start Time *</label>
                                <input type="time" class="form-control" id="startTime" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="endTime" class="form-label">
                                    End Time *</label>
                                <input type="time" class="form-control" id="endTime" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="scheduleInstructor" class="form-label">
                                    Instructor</label>
                                <select class="form-select" id="scheduleInstructor">
                                    <option value="">Select Instructor</option>
                                    <option value="Dr. Robert Wilson">Dr. Robert Wilson</option>
                                    <option value="Prof. Sarah Johnson">Prof. Sarah Johnson</option>
                                    <option value="Dr. Michael Brown">Dr. Michael Brown</option>
                                    <option value="Prof. Emily Davis">Prof. Emily Davis</option>
                                    <option value="Dr. James Miller">Dr. James Miller</option>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="scheduleRoom" class="form-label">
                                    Room</label>
                                <input type="text" class="form-control" id="scheduleRoom" placeholder="e.g., Room 101">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="scheduleType" class="form-label">
                                    Class Type</label>
                                <select class="form-select" id="scheduleType">
                                    <option value="Lecture">Lecture</option>
                                    <option value="Lab">Lab</option>
                                    <option value="Tutorial">Tutorial</option>
                                    <option value="Seminar">Seminar</option>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="scheduleFrequency" class="form-label">
                                    Frequency</label>
                                <select class="form-select" id="scheduleFrequency">
                                    <option value="Weekly">Weekly</option>
                                    <option value="Bi-weekly">Bi-weekly</option>
                                    <option value="Monthly">Monthly</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Cancel
                        </button>
                        <%--<button type="button" class="btn btn-primary" onclick="addSchedule()">
                            <i class="fas fa-save me-2 text-primary"></i>Add Schedule
                        </button>--%>
                        <asp:LinkButton ID="add_schedule" class="btn btn-primary" runat="server">
                            <i class="fas fa-save me-2 text-primary"></i>Add Schedule
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>



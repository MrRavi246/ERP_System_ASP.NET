<%@ Page Title="" Language="C#" MasterPageFile="~/pages/faculty/attendance.Master" AutoEventWireup="true" CodeBehind="attendance.aspx.cs" Inherits="EduErp.pages.faculty.attendance1" %>

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
                                Faculty Dashboard
                            </p>
                        </div>
                        <nav class="nav flex-column">
                            <a class="nav-link text-dark" href="dashboard.aspx"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="courses.aspx"><i class="fas fa-book me-2 text-primary"></i>My Courses </a><a class="nav-link active" href="attendance.aspx"><i class="fas fa-calendar-check me-2 text-primary"></i>Attendance </a><a class="nav-link text-dark" href="timetable.aspx"><i class="fas fa-clock me-2 text-primary"></i>My Timetable </a><a class="nav-link text-dark" href="exams.aspx"><i class="fas fa-file-alt me-2 text-primary"></i>Exams </a><a class="nav-link text-dark" href="students.aspx"><i class="fas fa-users me-2 text-primary"></i>My Students </a><a class="nav-link text-dark" href="notices.aspx"><i class="fas fa-bullhorn me-2 text-primary"></i>Notices </a><a class="nav-link text-dark" href="profile.aspx"><i class="fas fa-user-cog me-2 text-primary"></i>Edit Profile </a>
                        </nav>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="col-md-9 col-lg-10 px-4 py-3">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h2 class="mb-1">Attendance Management</h2>
                            <p class="text-muted">
                                Mark and manage student attendance
                            </p>
                        </div>
                        <div>
                            <button class="btn btn-outline-secondary" onclick="history.back()">
                                <i class="fas fa-arrow-left me-1"></i>Back
                            </button>
                        </div>
                    </div>

                    <!-- Course Selection -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <h5 class="card-title mb-0"><i class="fas fa-book me-2 text-primary"></i>Select Course </h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="courseSelect" class="form-label">
                                        Course</label>
                                    <%--<select class="form-select" id="courseSelect" onchange="loadStudents()">
                                    <option value="">Select a course...</option>
                                    <option value="math101">Mathematics 101</option>
                                    <option value="cs101">Computer Science Fundamentals</option>
                                    <option value="phy101">Physics I</option>
                                    <option value="eng101">English Composition</option>
                                </select>--%>
                                    <asp:DropDownList ID="atten_department" class="form-select" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <label for="dateSelect" class="form-label">
                                        Date</label>
                                    <input type="date" class="form-control" id="dateSelect" value="2024-01-15">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">
                                        &nbsp;</label>
                                    <div>
                                        <button class="btn btn-primary" onclick="loadStudents()">
                                            <i class="fas fa-search me-1"></i>Load Students
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Attendance Table -->
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="card-title mb-0"><i class="fas fa-users me-2 text-primary"></i>Student Attendance </h5>
                            <div>
                                <button class="btn btn-success me-2" onclick="markAllPresent()">
                                    <i class="fas fa-check me-1"></i>Mark All Present
                                </button>
                                <button class="btn btn-primary" onclick="saveAttendance()">
                                    <i class="fas fa-save me-1"></i>Save Attendance
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                   <%-- <thead>
                                        <tr>
                                            <th>Roll No</th>
                                            <th>Student Name</th>
                                            <th>Status</th>
                                            <th>Remarks</th>
                                            <th>Actions</th>
                                        </tr>                                        
                                    </thead>--%>
                                    <tbody id="attendanceTable">
                                        <!-- Student attendance data will be populated by JavaScript -->
                                        <asp:GridView class="table table-hover" ID="student_attendance" runat="server"></asp:GridView>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Attendance Summary -->
                    <div class="card mt-4">
                        <div class="card-header">
                            <h5 class="card-title mb-0"><i class="fas fa-chart-bar me-2 text-primary"></i>Attendance Summary </h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="text-center">
                                        <h4 class="text-success" id="presentCount">0</h4>
                                        <p class="text-muted">
                                            Present
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="text-center">
                                        <h4 class="text-danger" id="absentCount">0</h4>
                                        <p class="text-muted">
                                            Absent
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="text-center">
                                        <h4 class="text-warning" id="lateCount">0</h4>
                                        <p class="text-muted">
                                            Late
                                        </p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="text-center">
                                        <h4 class="text-info" id="totalCount">0</h4>
                                        <p class="text-muted">
                                            Total
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>



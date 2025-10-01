<%@ Page Title="" Language="C#" MasterPageFile="~/pages/faculty/courses.Master" AutoEventWireup="true" CodeBehind="courses.aspx.cs" Inherits="EduErp.pages.faculty.courses1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
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
                        <a class="nav-link text-dark" href="dashboard.aspx"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Dashboard </a><a class="nav-link active" href="courses.aspx"><i class="fas fa-book me-2 text-primary"></i>My Courses </a><a class="nav-link text-dark" href="attendance.aspx"><i class="fas fa-calendar-check me-2 text-primary"></i>Attendance </a><a class="nav-link text-dark" href="timetable.aspx"><i class="fas fa-clock me-2 text-primary"></i>My Timetable </a><a class="nav-link text-dark" href="exams.aspx"><i class="fas fa-file-alt me-2 text-primary"></i>Exams </a><a class="nav-link text-dark" href="students.aspx"><i class="fas fa-users me-2 text-primary"></i>My Students </a><a class="nav-link text-dark" href="notices.aspx"><i class="fas fa-bullhorn me-2 text-primary"></i>Notices </a><a class="nav-link text-dark" href="profile.aspx"><i class="fas fa-user-cog me-2 text-primary"></i>Edit Profile </a>
                    </nav>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 main-content">
                <!-- Top Navigation -->
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <div>
                        <h1 class="h2">My Courses</h1>
                        <p class="text-muted">
                            Manage your teaching assignments and course materials
                        </p>
                    </div>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group me-2">
                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                <i class="fas fa-download me-1"></i>Export
                            </button>
                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                <i class="fas fa-print me-1"></i>Print
                            </button>
                        </div>
                        <div class="dropdown">
                            <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                <i class="fas fa-user me-1"></i>Faculty
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="profile.aspx"><i class="fas fa-user-cog me-2 text-primary"></i>Profile</a></li>
                                <li><a class="dropdown-item" href="settings.aspx"><i class="fas fa-cog me-2 text-primary"></i>Settings</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="../../index.aspx"><i class="fas fa-sign-out-alt me-2 text-primary"></i>Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Course Statistics -->
                <div class="row mb-4">
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Total Courses
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            5
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-book fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            Total Students
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            285
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-user-graduate fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                            Weekly Hours
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            18
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-clock fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                            Pending Assignments
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            12
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-tasks fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Courses Grid -->
                <div class="row">
                    <!-- Course 1 -->
                    <div class="col-lg-6 mb-4">
                        <div class="card course-card shadow">
                            <div class="card-header bg-primary text-white">
                                <h5 class="card-title mb-0"><i class="fas fa-calculator me-2 text-primary"></i>Advanced Mathematics </h5>
                                <small>MATH-301 | Semester 5</small>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-6">
                                        <strong>Students:</strong> 65
                                    </div>
                                    <div class="col-6">
                                        <strong>Credits:</strong> 4
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-6">
                                        <strong>Schedule:</strong> Mon, Wed, Fri
                                    </div>
                                    <div class="col-6">
                                        <strong>Time:</strong> 10:00 AM - 11:00 AM
                                    </div>
                                </div>
                                <div class="progress mb-3">
                                    <div class="progress-bar" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
                                        75% Complete
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <button class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-eye me-1"></i>View Details
                                    </button>
                                    <button class="btn btn-sm btn-success">
                                        <i class="fas fa-plus me-1"></i>Add Material
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Course 2 -->
                    <div class="col-lg-6 mb-4">
                        <div class="card course-card shadow">
                            <div class="card-header bg-success text-white">
                                <h5 class="card-title mb-0"><i class="fas fa-atom me-2 text-primary"></i>Quantum Physics </h5>
                                <small>PHYS-401 | Semester 7</small>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-6">
                                        <strong>Students:</strong> 42
                                    </div>
                                    <div class="col-6">
                                        <strong>Credits:</strong> 5
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-6">
                                        <strong>Schedule:</strong> Tue, Thu
                                    </div>
                                    <div class="col-6">
                                        <strong>Time:</strong> 2:00 PM - 4:00 PM
                                    </div>
                                </div>
                                <div class="progress mb-3">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
                                        60% Complete
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <button class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-eye me-1"></i>View Details
                                    </button>
                                    <button class="btn btn-sm btn-success">
                                        <i class="fas fa-plus me-1"></i>Add Material
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Course 3 -->
                    <div class="col-lg-6 mb-4">
                        <div class="card course-card shadow">
                            <div class="card-header bg-info text-white">
                                <h5 class="card-title mb-0"><i class="fas fa-laptop-code me-2 text-primary"></i>Data Structures & Algorithms </h5>
                                <small>CS-201 | Semester 3</small>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-6">
                                        <strong>Students:</strong> 78
                                    </div>
                                    <div class="col-6">
                                        <strong>Credits:</strong> 4
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-6">
                                        <strong>Schedule:</strong> Mon, Wed, Fri
                                    </div>
                                    <div class="col-6">
                                        <strong>Time:</strong> 11:00 AM - 12:00 PM
                                    </div>
                                </div>
                                <div class="progress mb-3">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 85%" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
                                        85% Complete
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <button class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-eye me-1"></i>View Details
                                    </button>
                                    <button class="btn btn-sm btn-success">
                                        <i class="fas fa-plus me-1"></i>Add Material
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Course 4 -->
                    <div class="col-lg-6 mb-4">
                        <div class="card course-card shadow">
                            <div class="card-header bg-warning text-dark">
                                <h5 class="card-title mb-0"><i class="fas fa-brain me-2 text-primary"></i>Machine Learning </h5>
                                <small>CS-501 | Semester 9</small>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-6">
                                        <strong>Students:</strong> 35
                                    </div>
                                    <div class="col-6">
                                        <strong>Credits:</strong> 3
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-6">
                                        <strong>Schedule:</strong> Tue, Thu
                                    </div>
                                    <div class="col-6">
                                        <strong>Time:</strong> 9:00 AM - 11:00 AM
                                    </div>
                                </div>
                                <div class="progress mb-3">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 45%" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100">
                                        45% Complete
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <button class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-eye me-1"></i>View Details
                                    </button>
                                    <button class="btn btn-sm btn-success">
                                        <i class="fas fa-plus me-1"></i>Add Material
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Course 5 -->
                    <div class="col-lg-6 mb-4">
                        <div class="card course-card shadow">
                            <div class="card-header bg-secondary text-white">
                                <h5 class="card-title mb-0"><i class="fas fa-database me-2 text-primary"></i>Database Management Systems </h5>
                                <small>CS-301 | Semester 5</small>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3">
                                    <div class="col-6">
                                        <strong>Students:</strong> 65
                                    </div>
                                    <div class="col-6">
                                        <strong>Credits:</strong> 4
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-6">
                                        <strong>Schedule:</strong> Mon, Wed, Fri
                                    </div>
                                    <div class="col-6">
                                        <strong>Time:</strong> 3:00 PM - 4:00 PM
                                    </div>
                                </div>
                                <div class="progress mb-3">
                                    <div class="progress-bar bg-secondary" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
                                        70% Complete
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <button class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-eye me-1"></i>View Details
                                    </button>
                                    <button class="btn btn-sm btn-success">
                                        <i class="fas fa-plus me-1"></i>Add Material
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Activities -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-clock me-2 text-primary"></i>Recent Activities </h6>
                    </div>
                    <div class="card-body">
                        <div class="list-group list-group-flush">
                            <div class="list-group-item d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="my-0">Assignment submitted - Advanced Mathematics</h6>
                                    <small class="text-muted">Student: John Doe submitted Assignment 3</small>
                                </div>
                                <span class="text-muted">2 hours ago</span>
                            </div>
                            <div class="list-group-item d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="my-0">Course material uploaded - Quantum Physics</h6>
                                    <small class="text-muted">Added lecture notes for Chapter 5</small>
                                </div>
                                <span class="text-muted">1 day ago</span>
                            </div>
                            <div class="list-group-item d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="my-0">Exam scheduled - Data Structures</h6>
                                    <small class="text-muted">Mid-term exam scheduled for next week</small>
                                </div>
                                <span class="text-muted">2 days ago</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



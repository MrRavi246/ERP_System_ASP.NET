<%@ Page Title="" Language="C#" MasterPageFile="~/pages/faculty/dashboard.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="EduErp.pages.faculty.dashboard1" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

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
                            <a class="nav-link active" href="dashboard.aspx"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="courses.aspx"><i class="fas fa-book me-2 text-primary"></i>My Courses </a><a class="nav-link text-dark" href="attendance.aspx"><i class="fas fa-calendar-check me-2 text-primary"></i>Attendance </a><a class="nav-link text-dark" href="timetable.aspx"><i class="fas fa-clock me-2 text-primary"></i>My Timetable </a><a class="nav-link text-dark" href="exams.aspx"><i class="fas fa-file-alt me-2 text-primary"></i>Exams </a><a class="nav-link text-dark" href="students.aspx"><i class="fas fa-users me-2 text-primary"></i>My Students </a><a class="nav-link text-dark" href="notices.aspx"><i class="fas fa-bullhorn me-2 text-primary"></i>Notices </a><a class="nav-link text-dark" href="profile.aspx"><i class="fas fa-user-cog me-2 text-primary"></i>Edit Profile </a>
                        </nav>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="col-md-9 col-lg-10 main-content">
                    <!-- Top Navigation -->
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <div>
                            <h1 class="h2">Faculty Dashboard</h1>
                            <p class="text-muted">
                                Manage your classes and students
                            </p>
                        </div>
                        <div class="btn-toolbar mb-2 mb-md-0">
                            <div class="btn-group me-2">
                                <%-- <button type="button" class="btn btn-sm btn-outline-secondary">
                                <i class="fas fa-download me-1"></i>Export
                            </button>--%>

                                <asp:Button ID="Button1" runat="server" Text="Export" class="btn btn-sm btn-outline-secondary" OnClick="Button1_Click" />
                                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
                                <button type="button" class="btn btn-sm btn-outline-secondary">
                                    <i class="fas fa-print me-1"></i>Print</button>
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

                    <!-- Stats Cards -->
                    <div class="row mb-4">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2 card-stats">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Classes Today
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                4
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-chalkboard fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2 card-stats">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Total Students
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                120
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-users fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2 card-stats">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Assignments Pending
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                8
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-file-alt fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2 card-stats">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                Office Hours
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                2:00 PM
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clock fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Charts Row -->
                    <div class="row mb-4">
                        <div class="col-lg-8">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0"><i class="fas fa-chart-line me-2 text-primary"></i>Student Performance </h5>
                                </div>
                                <div class="card-body">
                                    <div class="chart-container">
                                        <canvas id="performanceChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0"><i class="fas fa-chart-pie me-2 text-primary"></i>Course Distribution </h5>
                                </div>
                                <div class="card-body">
                                    <div class="chart-container">
                                        <canvas id="courseChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Recent Activities -->
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0"><i class="fas fa-bell me-2 text-primary"></i>Recent Activities </h5>
                                </div>
                                <div class="card-body">
                                    <div class="list-group list-group-flush">
                                        <div class="list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">
                                                    Attendance marked for Mathematics 101
                                                </div>
                                                <small class="text-muted">30 minutes ago</small>
                                            </div>
                                            <span class="badge bg-success rounded-pill">New</span>
                                        </div>
                                        <div class="list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">
                                                    Assignment graded: Calculus
                                                </div>
                                                <small class="text-muted">2 hours ago</small>
                                            </div>
                                            <span class="badge bg-primary rounded-pill">New</span>
                                        </div>
                                        <div class="list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">
                                                    New student enrolled in your course
                                                </div>
                                                <small class="text-muted">1 day ago</small>
                                            </div>
                                            <span class="badge bg-info rounded-pill">New</span>
                                        </div>
                                        <div class="list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">
                                                    Department meeting reminder
                                                </div>
                                                <small class="text-muted">2 days ago</small>
                                            </div>
                                            <span class="badge bg-warning rounded-pill">New</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0"><i class="fas fa-calendar me-2 text-primary"></i>Upcoming Events </h5>
                                </div>
                                <div class="card-body">
                                    <div class="list-group list-group-flush">
                                        <div class="list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">
                                                    Department Meeting
                                                </div>
                                                <small class="text-muted">Today, 3:00 PM</small>
                                            </div>
                                            <span class="badge bg-primary rounded-pill">Event</span>
                                        </div>
                                        <div class="list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">
                                                    Exam Grading Deadline
                                                </div>
                                                <small class="text-muted">Tomorrow</small>
                                            </div>
                                            <span class="badge bg-warning rounded-pill">Event</span>
                                        </div>
                                        <div class="list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">
                                                    Faculty Development
                                                </div>
                                                <small class="text-muted">Next Week</small>
                                            </div>
                                            <span class="badge bg-info rounded-pill">Event</span>
                                        </div>
                                        <div class="list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">
                                                    Semester End
                                                </div>
                                                <small class="text-muted">1 month</small>
                                            </div>
                                            <span class="badge bg-success rounded-pill">Event</span>
                                        </div>
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



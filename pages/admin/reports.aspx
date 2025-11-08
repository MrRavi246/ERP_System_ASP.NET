<%@ Page Title="" Language="C#" MasterPageFile="~/pages/admin/reports.Master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="EduErp.pages.admin.reports1" %>

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
                                Reports & Analytics
                            </p>
                        </div>
                        <nav class="nav flex-column">
                            <a class="nav-link text-dark" href="dashboard.aspx"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="students.aspx"><i class="fas fa-user-graduate me-2 text-primary"></i>Students </a><a class="nav-link text-dark" href="faculty.aspx"><i class="fas fa-chalkboard-teacher me-2 text-primary"></i>Faculty </a><a class="nav-link text-dark" href="courses.aspx"><i class="fas fa-book me-2 text-primary"></i>Courses </a><a class="nav-link text-dark" href="attendance.aspx"><i class="fas fa-calendar-check me-2 text-primary"></i>Attendance </a><a class="nav-link text-dark" href="timetable.aspx"><i class="fas fa-clock me-2 text-primary"></i>Timetable </a><a class="nav-link text-dark" href="exams.aspx"><i class="fas fa-file-alt me-2 text-primary"></i>Exams & Results </a><a class="nav-link text-dark" href="fees.aspx"><i class="fas fa-money-bill-wave me-2 text-primary"></i>Fees </a><a class="nav-link text-dark" href="notices.aspx">
                                <i class="fas fa-bullhorn me-2 text-primary"></i>Notice Board </a><a class="nav-link active bg-primary text-white rounded" href="reports.aspx"><i class="fas fa-chart-bar me-2"></i>Reports </a>
                        </nav>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="col-md-9 col-lg-10 px-4 py-3">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h2 class="mb-1">Reports & Analytics</h2>
                            <p class="text-muted">
                                Generate comprehensive reports and view analytics
                            </p>
                        </div>
                        <div>
                            <button class="btn btn-primary me-2" onclick="generateReport()">
                                <i class="fas fa-file-alt me-1"></i>Generate Report
                            </button>
                            <%--<button class="btn btn-success me-2" onclick="exportData()">
                                <i class="fas fa-download me-1"></i>Export Data
                            </button>--%>
                            <asp:Button ID="Button1" class="btn btn-success me-2" runat="server" Text="Export Data" OnClick="Button1_Click" />
                            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
                            <button class="btn btn-outline-secondary" onclick="printReport()">
                                <i class="fas fa-print me-1"></i>Print</button>
                        </div>
                    </div>

                    <!-- Report Type Selection -->
                    <div class="row mb-4">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title mb-3">Select Report Type</h5>
                                    <div class="row">
                                        <div class="col-md-3 mb-3">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="reportType" id="attendanceReport" value="attendance" >
                                                <label class="form-check-label" for="attendanceReport">
                                                    <i class="fas fa-calendar-check me-2 text-primary"></i>Attendance Report
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-3 mb-3">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="reportType" id="feesReport" value="fees">
                                                <label class="form-check-label" for="feesReport">
                                                    <i class="fas fa-money-bill-wave me-2 text-primary"></i>Fees Report
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-3 mb-3">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="reportType" id="resultsReport" value="results" checked>
                                                <label class="form-check-label" for="resultsReport">
                                                    <i class="fas fa-chart-line me-2 text-primary"></i>Results Report
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-3 mb-3">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="reportType" id="libraryReport" value="library">
                                                <label class="form-check-label" for="libraryReport">
                                                    <i class="fas fa-book-open me-2 text-primary"></i>Library Report
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Filters -->
                    <div class="row mb-4">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title mb-3">Report Filters</h5>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label class="form-label">
                                                Department</label>
                                           <%-- <select class="form-select" id="departmentFilter">
                                                <option value="">All Departments</option>
                                                <option value="Computer Science">Computer Science</option>
                                                <option value="Electrical">Electrical</option>
                                                <option value="Mechanical">Mechanical</option>
                                                <option value="Civil">Civil</option>
                                            </select>--%>
                                            <asp:DropDownList ID="reports_department" class="form-select" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">
                                                Date Range</label>
                                            <select class="form-select" id="dateRangeFilter">
                                                <option value="last7days">Last 7 Days</option>
                                                <option value="last30days">Last 30 Days</option>
                                                <option value="last3months">Last 3 Months</option>
                                                <option value="last6months">Last 6 Months</option>
                                                <option value="thisYear">This Year</option>
                                                <option value="custom">Custom Range</option>
                                            </select>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">
                                                Start Date</label>
                                            <input type="date" class="form-control" id="startDate">
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">
                                                End Date</label>
                                            <input type="date" class="form-control" id="endDate">
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-3">
                                            <label class="form-label">
                                                Year</label>
                                            <select class="form-select" id="yearFilter">
                                                <option value="2024">2024</option>
                                                <option value="2023">2023</option>
                                                <option value="2022">2022</option>
                                            </select>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">
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
                                            <label class="form-label">
                                                Status</label>
                                            <select class="form-select" id="statusFilter">
                                                <option value="">All Status</option>
                                                <option value="Active">Active</option>
                                                <option value="Inactive">Inactive</option>
                                                <option value="Completed">Completed</option>
                                            </select>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">
                                                Search</label>
                                            <input type="text" class="form-control" id="searchInput" placeholder="Search...">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Charts Section -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0">Attendance Trends</h5>
                                </div>
                                <div class="card-body">
                                    <canvas id="attendanceChart" width="400" height="200"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0">Department Distribution</h5>
                                </div>
                                <div class="card-body">
                                    <canvas id="departmentChart" width="400" height="200"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Report Summary Cards -->
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="card bg-primary text-white">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-0" id="totalRecords">1,250</h4>
                                            <p class="mb-0">
                                                Total Records
                                            </p>
                                        </div>
                                        <i class="fas fa-database fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card bg-success text-white">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-0" id="avgScore">78.5%</h4>
                                            <p class="mb-0">
                                                Average Score
                                            </p>
                                        </div>
                                        <i class="fas fa-chart-line fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card bg-warning text-white">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-0" id="attendanceRate">85.2%</h4>
                                            <p class="mb-0">
                                                Attendance Rate
                                            </p>
                                        </div>
                                        <i class="fas fa-calendar-check fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card bg-info text-white">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-0" id="paymentRate">92.1%</h4>
                                            <p class="mb-0">
                                                Payment Rate
                                            </p>
                                        </div>
                                        <i class="fas fa-money-bill-wave fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Report Table -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0">Report Data</h5>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Department</th>
                                                    <th>Category</th>
                                                    <th>Value</th>
                                                    <th>Date</th>
                                                    <th>Status</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody id="reportTable">
                                                <!-- Report table will be populated here -->
                                            </tbody>
                                        </table>
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



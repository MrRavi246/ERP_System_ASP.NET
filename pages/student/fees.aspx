<%@ Page Title="" Language="C#" MasterPageFile="~/pages/student/fee.Master" AutoEventWireup="true" CodeBehind="fees.aspx.cs" Inherits="EduErp.pages.student.fee1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- Mobile Navigation Toggle -->
    <button class="mobile-nav-toggle d-md-none" type="button">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Sidebar Overlay -->
    <div class="sidebar-overlay">
    </div>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 px-0">
                <div class="sidebar bg-white border-end p-3">
                    <div class="text-center mb-4">
                        <h4 class="text-primary fw-bold">College ERP</h4>
                        <p class="text-muted small">
                            Student Dashboard
                        </p>
                    </div>
                    <nav class="nav flex-column">
                        <a class="nav-link text-dark" href="dashboard.aspx"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="courses.aspx"><i class="fas fa-book me-2 text-primary"></i>My Courses </a><a class="nav-link text-dark" href="attendance.aspx"><i class="fas fa-calendar-check me-2 text-primary"></i>My Attendance </a><a class="nav-link text-dark" href="timetable.aspx"><i class="fas fa-clock me-2 text-primary"></i>My Timetable </a><a class="nav-link text-dark" href="exams.aspx"><i class="fas fa-file-alt me-2 text-primary"></i>My Exams </a><a class="nav-link active" href="fees.aspx"><i class="fas fa-credit-card me-2 text-primary"></i>My Fees </a><a class="nav-link text-dark" href="notices.aspx"><i class="fas fa-bullhorn me-2 text-primary"></i>Notices </a><a class="nav-link text-dark" href="profile.aspx"><i class="fas fa-user-cog me-2 text-primary"></i>Edit Profile </a>
                    </nav>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 main-content">
                <div class="page-header d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-4">
                    <div>
                        <div class="mb-3 mb-md-0">

                            <h2 class="mb-1">My Fees</h2>

                            <p class="text-muted mb-0">
                                Manage your fee payments and view payment history
                            </p>

                        </div>
                    </div>
                    <div class="d-flex flex-column flex-sm-row gap-2">
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
                                <i class="fas fa-user me-1"></i>Student
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

                <!-- Fee Summary Cards -->
                <div class="row mb-4">
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-primary shadow h-100 py-2 fee-card">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Total Fees
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            ?85,000
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-money-bill-wave fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-success shadow h-100 py-2 fee-card">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            Paid Amount
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            ?65,000
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-check-circle fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-warning shadow h-100 py-2 fee-card">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                            Pending Amount
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            ?20,000
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
                        <div class="card border-left-info shadow h-100 py-2 fee-card">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                            Next Due Date
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            Dec 15
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-calendar-alt fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Fee Details -->
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-list me-2 text-primary"></i>Fee Breakdown </h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Fee Type</th>
                                                <th>Amount</th>
                                                <th>Due Date</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Tuition Fee - Semester 1</td>
                                                <td>��25,000</td>
                                                <td>Aug 15, 2024</td>
                                                <td><span class="badge badge-paid">Paid</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-outline-primary">
                                                        <i class="fas fa-receipt"></i>Receipt
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tuition Fee - Semester 2</td>
                                                <td>��25,000</td>
                                                <td>Dec 15, 2024</td>
                                                <td><span class="badge badge-pending">Pending</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-success">
                                                        <i class="fas fa-credit-card"></i>Pay Now
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Library Fee</td>
                                                <td>��2,000</td>
                                                <td>Jul 10, 2024</td>
                                                <td><span class="badge badge-paid">Paid</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-outline-primary">
                                                        <i class="fas fa-receipt"></i>Receipt
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Lab Fee</td>
                                                <td>��8,000</td>
                                                <td>Sep 30, 2024</td>
                                                <td><span class="badge badge-paid">Paid</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-outline-primary">
                                                        <i class="fas fa-receipt"></i>Receipt
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Sports Fee</td>
                                                <td>��3,000</td>
                                                <td>Oct 15, 2024</td>
                                                <td><span class="badge badge-paid">Paid</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-outline-primary">
                                                        <i class="fas fa-receipt"></i>Receipt
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Development Fee</td>
                                                <td>��5,000</td>
                                                <td>Nov 30, 2024</td>
                                                <td><span class="badge badge-paid">Paid</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-outline-primary">
                                                        <i class="fas fa-receipt"></i>Receipt
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Exam Fee</td>
                                                <td>��2,000</td>
                                                <td>Dec 1, 2024</td>
                                                <td><span class="badge badge-paid">Paid</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-outline-primary">
                                                        <i class="fas fa-receipt"></i>Receipt
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Miscellaneous Fee</td>
                                                <td>��15,000</td>
                                                <td>Jan 15, 2025</td>
                                                <td><span class="badge badge-pending">Pending</span></td>
                                                <td>
                                                    <button class="btn btn-sm btn-success">
                                                        <i class="fas fa-credit-card"></i>Pay Now
                                                    </button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <!-- Payment Methods -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-credit-card me-2 text-primary"></i>Payment Methods </h6>
                            </div>
                            <div class="card-body">
                                <div class="d-grid gap-2">
                                    <button class="btn btn-outline-primary">
                                        <i class="fas fa-university me-2 text-primary"></i>Net Banking
                                    </button>
                                    <button class="btn btn-outline-success">
                                        <i class="fas fa-mobile-alt me-2 text-primary"></i>UPI Payment
                                    </button>
                                    <button class="btn btn-outline-info">
                                        <i class="fas fa-credit-card me-2 text-primary"></i>Credit/Debit Card
                                    </button>
                                    <button class="btn btn-outline-warning">
                                        <i class="fas fa-wallet me-2 text-primary"></i>Digital Wallet
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Recent Transactions -->
                        <div class="card shadow">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-history me-2 text-primary"></i>Recent Transactions </h6>
                            </div>
                            <div class="card-body">
                                <div class="list-group list-group-flush">
                                    <div class="list-group-item d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="my-0">Exam Fee</h6>
                                            <small class="text-muted">Dec 1, 2024</small>
                                        </div>
                                        <span class="text-success">��2,000</span>
                                    </div>
                                    <div class="list-group-item d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="my-0">Development Fee</h6>
                                            <small class="text-muted">Nov 30, 2024</small>
                                        </div>
                                        <span class="text-success">��5,000</span>
                                    </div>
                                    <div class="list-group-item d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="my-0">Sports Fee</h6>
                                            <small class="text-muted">Oct 15, 2024</small>
                                        </div>
                                        <span class="text-success">��3,000</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



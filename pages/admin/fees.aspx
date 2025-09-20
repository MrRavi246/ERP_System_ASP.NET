<%@ Page Title="" Language="C#" MasterPageFile="~/pages/admin/fees.Master" AutoEventWireup="true" CodeBehind="fees.aspx.cs" Inherits="EduErp.pages.admin.fees1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <form runat="server">
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
                                Fees Management
                            </p>
                        </div>
                        <nav class="nav flex-column">
                            <a class="nav-link text-dark" href="dashboard.aspx"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="students.aspx"><i class="fas fa-user-graduate me-2 text-primary"></i>Students </a><a class="nav-link text-dark" href="faculty.aspx"><i class="fas fa-chalkboard-teacher me-2 text-primary"></i>Faculty </a><a class="nav-link text-dark" href="courses.aspx"><i class="fas fa-book me-2 text-primary"></i>Courses </a><a class="nav-link text-dark" href="attendance.aspx"><i class="fas fa-calendar-check me-2 text-primary"></i>Attendance </a><a class="nav-link text-dark" href="timetable.aspx"><i class="fas fa-clock me-2 text-primary"></i>Timetable </a><a class="nav-link text-dark" href="exams.aspx"><i class="fas fa-file-alt me-2 text-primary"></i>Exams & Results </a><a class="nav-link active bg-primary text-white rounded" href="fees.aspx"><i class="fas fa-money-bill-wave me-2"></i>Fees </a><a class="nav-link text-dark" href="notices.aspx">
                                <i class="fas fa-bullhorn me-2 text-primary"></i>Notice Board </a><a class="nav-link text-dark" href="reports.aspx"><i class="fas fa-chart-bar me-2 text-primary"></i>Reports </a>
                        </nav>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="col-md-9 col-lg-10 main-content">
                    <div class="page-header d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-4">
                        <div class="mb-3 mb-md-0">
                            <h2 class="mb-1">Fees Management</h2>
                            <p class="text-muted mb-0">
                                Manage student fee payments and track payment history
                            </p>
                        </div>
                        <div class="d-flex flex-column flex-sm-row gap-2">
                            <button class="btn btn-primary btn-mobile" data-bs-toggle="modal" data-bs-target="#addFeeModal">
                                <i class="fas fa-plus me-1"></i>Add Fee Record
                            </button>
                            <button class="btn btn-success btn-mobile" data-bs-toggle="modal" data-bs-target="#paymentModal">
                                <i class="fas fa-credit-card me-1"></i>Make Payment
                            </button>
                            <button class="btn btn-outline-secondary btn-mobile">
                                <i class="fas fa-download me-1"></i>Export
                            </button>
                        </div>
                    </div>

                    <!-- Stats Cards -->
                    <div class="row section-spacing">
                        <div class="col-lg-3 col-md-6 col-sm-6 mb-3">
                            <div class="card bg-primary text-white stats-card-mobile">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h4 class="mb-0" id="totalFees">₹2,45,000</h4>
                                            <p class="mb-0">
                                                Total Fees
                                            </p>
                                        </div>
                                        <i class="fas fa-money-bill-wave fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6 mb-3">
                            <div class="card bg-success text-white stats-card-mobile">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h4 class="mb-0" id="paidAmount">₹1,85,000</h4>
                                            <p class="mb-0">
                                                Paid Amount
                                            </p>
                                        </div>
                                        <i class="fas fa-check-circle fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6 mb-3">
                            <div class="card bg-warning text-white stats-card-mobile">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h4 class="mb-0" id="pendingAmount">₹60,000</h4>
                                            <p class="mb-0">
                                                Pending Amount
                                            </p>
                                        </div>
                                        <i class="fas fa-clock fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6 mb-3">
                            <div class="card bg-info text-white stats-card-mobile">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h4 class="mb-0" id="paymentRate">75.5%</h4>
                                            <p class="mb-0">
                                                Payment Rate
                                            </p>
                                        </div>
                                        <i class="fas fa-percentage fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Filters -->
                    <div class="section-spacing">
                        <div class="card">
                            <div class="card-body">
                                <!-- Desktop Filters -->
                                <div class="desktop-filters">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-6 mb-3">
                                            <label class="form-label">
                                                Payment Status</label>
                                            <select class="form-select" id="statusFilter">
                                                <option value="">All Status</option>
                                                <option value="Paid">Paid</option>
                                                <option value="Pending">Pending</option>
                                                <option value="Overdue">Overdue</option>
                                                <option value="Partial">Partial</option>
                                            </select>
                                            <%--<asp:DropDownList ID="list_payment_status" class="form-select" runat="server"></asp:DropDownList>--%>
                                        </div>
                                        <div class="col-lg-3 col-md-6 mb-3">
                                            <label class="form-label">
                                                Department</label>
                                           <%-- <select class="form-select" id="departmentFilter">
                                                <option value="">All Departments</option>
                                                <option value="Computer Science">Computer Science</option>
                                                <option value="Electrical">Electrical</option>
                                                <option value="Mechanical">Mechanical</option>
                                                <option value="Civil">Civil</option>
                                            </select>--%>

                                            <asp:DropDownList ID="list_department" class="form-select" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="col-lg-3 col-md-6 mb-3">
                                            <label class="form-label">
                                                Fee Type</label>
                                            <%--<select class="form-select" id="feeTypeFilter">
                                                <option value="">All Types</option>
                                                <option value="Tuition Fee">Tuition Fee</option>
                                                <option value="Hostel Fee">Hostel Fee</option>
                                                <option value="Library Fee">Library Fee</option>
                                                <option value="Examination Fee">Examination Fee</option>
                                            </select>--%>

                                            <asp:DropDownList ID="list_fee_type" class="form-select" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="col-lg-3 col-md-6 mb-3">
                                            <label class="form-label">
                                                Search</label>
                                            <input type="text" class="form-control" id="searchInput" placeholder="Search students...">
                                        </div>
                                    </div>
                                </div>

                                <!-- Mobile Filters -->
                                <div class="mobile-filters">
                                    <div class="filter-dropdown">
                                        <label class="form-label">
                                            Payment Status</label>
                                        <select class="form-select" id="statusFilterMobile">
                                            <option value="">All Status</option>
                                            <option value="Paid">Paid</option>
                                            <option value="Pending">Pending</option>
                                            <option value="Overdue">Overdue</option>
                                            <option value="Partial">Partial</option>
                                        </select>
                                    </div>
                                    <div class="filter-dropdown">
                                        <label class="form-label">
                                            Department</label>
                                        <select class="form-select" id="departmentFilterMobile">
                                            <option value="">All Departments</option>
                                            <option value="Computer Science">Computer Science</option>
                                            <option value="Electrical">Electrical</option>
                                            <option value="Mechanical">Mechanical</option>
                                            <option value="Civil">Civil</option>
                                        </select>
                                    </div>
                                    <div class="filter-dropdown">
                                        <label class="form-label">
                                            Fee Type</label>
                                        <select class="form-select" id="feeTypeFilterMobile">
                                            <option value="">All Types</option>
                                            <option value="Tuition Fee">Tuition Fee</option>
                                            <option value="Hostel Fee">Hostel Fee</option>
                                            <option value="Library Fee">Library Fee</option>
                                            <option value="Examination Fee">Examination Fee</option>
                                        </select>
                                    </div>
                                    <div class="filter-dropdown">
                                        <label class="form-label">
                                            Search</label>
                                        <input type="text" class="form-control" id="searchInputMobile" placeholder="Search students...">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Recent Payments -->
                    <div class="section-spacing">
                        <h5 class="mb-3">Recent Payments</h5>
                        <div class="row" id="recentPayments">
                            <!-- Recent payment cards will be populated here -->
                        </div>
                    </div>

                    <!-- Fee History Table -->
                    <div class="section-spacing">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h5 class="mb-0">Fee History</h5>
                                <span class="badge bg-primary" id="recordCount">0 Records</span>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive-mobile">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Roll No</th>
                                                <th>Student Name</th>
                                                <th>Fee Type</th>
                                                <th>Amount</th>
                                                <th>Due Date</th>
                                                <th>Status</th>
                                                <th>Payment Date</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody id="feeHistoryTable">
                                            <!-- Fee history table will be populated here -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Fee Record Modal -->
        <div class="modal fade" id="addFeeModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Fee Record</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal">
                        </button>
                    </div>
                    <div class="modal-body">
                         
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Student Roll No</label>
                                    <%--<input type="text" class="form-control" id="studentRollNo" required>--%>
                                    <asp:TextBox ID="std_rollno" class="form-control" TextMode="Number" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Student Name</label>
                                    <%--<input type="text" class="form-control" id="studentName" required>--%>
                                    <asp:TextBox ID="std_name" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Fee Type</label>
                                    <%--<select class="form-select" id="feeType" required>
                                        <option value="">Select Fee Type</option>
                                        <option value="Tuition Fee">Tuition Fee</option>
                                        <option value="Hostel Fee">Hostel Fee</option>
                                        <option value="Library Fee">Library Fee</option>
                                        <option value="Examination Fee">Examination Fee</option>
                                        <option value="Transport Fee">Transport Fee</option>
                                    </select>--%>
                                    <asp:DropDownList ID="list_fee_type_2" class="form-select" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Department</label>
                                    <%--<select class="form-select" id="feeDepartment" required>
                                        <option value="">Select Department</option>
                                        <option value="Computer Science">Computer Science</option>
                                        <option value="Electrical">Electrical</option>
                                        <option value="Mechanical">Mechanical</option>
                                        <option value="Civil">Civil</option>
                                    </select>--%>
                                    <asp:DropDownList ID="list_department_2" class="form-select" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Amount (₹)</label>
                                    <%--<input type="number" class="form-control" id="feeAmount" min="0" step="1" required>--%>
                                    <asp:TextBox ID="fee_amount" class="form-control" TextMode="Number" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">  
                                        Due Date</label>
                                    <%--<input type="date" class="form-control" id="dueDate" required>--%>

                                    <asp:TextBox ID="fee_Duedata" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">
                                    Description</label>
                                <%--<textarea class="form-control" id="feeDescription" rows="3" placeholder="Additional details about the fee"></textarea>--%>
                                <asp:TextBox ID="fee_descripition" class="form-control" runat="server" Rows="3"></asp:TextBox>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Cancel
                        </button>
                        <button type="button" class="btn btn-primary" onclick="addFeeRecord()">
                            Add Fee Record
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Payment Modal -->
        <div class="modal fade" id="paymentModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Make Payment</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal">
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="paymentForm" class="mobile-form">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Student Roll No</label>
                                    <input type="text" class="form-control" id="paymentRollNo" readonly>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Student Name</label>
                                    <input type="text" class="form-control" id="paymentStudentName" readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Fee Record</label>
                                    <select class="form-select" id="paymentFeeRecord" required>
                                        <option value="">Select Fee Record</option>
                                        <option value="Tuition Fee - ₹25,000">Tuition Fee - ₹25,000</option>
                                        <option value="Hostel Fee - ₹15,000">Hostel Fee - ₹15,000</option>
                                        <option value="Library Fee - ₹5,000">Library Fee - ₹5,000</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Payment Amount (₹)</label>
                                    <input type="number" class="form-control" id="paymentAmount" min="0" step="1" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Payment Method</label>
                                    <select class="form-select" id="paymentMethod" required>
                                        <option value="">Select Method</option>
                                        <option value="Online Banking">Online Banking</option>
                                        <option value="Credit Card">Credit Card</option>
                                        <option value="Debit Card">Debit Card</option>
                                        <option value="UPI">UPI</option>
                                        <option value="Cash">Cash</option>
                                        <option value="Cheque">Cheque</option>
                                        <option value="Demand Draft">Demand Draft</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Payment Date</label>
                                    <input type="date" class="form-control" id="paymentDate" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">
                                    Transaction ID</label>
                                <input type="text" class="form-control" id="transactionId" placeholder="Enter transaction reference (optional)">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">
                                    Remarks</label>
                                <textarea class="form-control" id="paymentRemarks" rows="2" placeholder="Any additional notes"></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Cancel
                        </button>
                        <button type="button" class="btn btn-success" onclick="makePayment()">
                            Process Payment
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>



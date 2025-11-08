<%@ Page Title="" Language="C#" MasterPageFile="~/pages/admin/fees.Master" AutoEventWireup="true" CodeBehind="fees.aspx.cs" Inherits="EduErp.pages.admin.fees1" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <form id="form1" runat="server">
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
                            <button type="button" class="btn btn-primary btn-mobile" data-bs-toggle="modal" data-bs-target="#addFeeModal">
                                <i class="fas fa-plus me-1"></i>Add Fee Record
                            </button>
                            <button type="button" class="btn btn-success btn-mobile" data-bs-toggle="modal" data-bs-target="#paymentModal">
                                <i class="fas fa-credit-card me-1"></i>Make Payment
                            </button>
                            <%--<button class="btn btn-outline-secondary btn-mobile">
                                <i class="fas fa-download me-1"></i>Export
                            </button>--%>

                            <asp:Button ID="Button1" runat="server" Text="Export" class="btn btn-outline-secondary btn-mobile" OnClick="Button1_Click"/>
                            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />                            
                        </div>
                    </div>

                    <!-- Stats Cards -->
                    <div class="row section-spacing">
                        <div class="col-lg-3 col-md-6 col-sm-6 mb-3">
                            <div class="card bg-primary text-white stats-card-mobile">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h4 class="mb-0" id="totalFees"><%= TotalFees %></h4>
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
                                            <h4 class="mb-0" id="paidAmount"><%= PaidAmount %></h4>
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
                                            <h4 class="mb-0" id="pendingAmount"><%= PendingAmount %></h4>
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
                                            <h4 class="mb-0" id="paymentRate"><%= PaymentRate %></h4>
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
                            <%
                                if (RecentPayments != null && RecentPayments.Tables[0].Rows.Count > 0)
                                {
                                    for (int i = 0; i < RecentPayments.Tables[0].Rows.Count; i++)
                                    {
                                        var row = RecentPayments.Tables[0].Rows[i];
                                        string studentName = row["student_name"].ToString();
                                        string rollNumber = row["roll_number"].ToString();
                                        string feeType = row["fee_type"].ToString();
                                        string amountPaid = row["amount_paid"].ToString();
                                        string amountDue = row["amount_due"].ToString();
                                        string paymentDate = Convert.ToDateTime(row["payment_date"]).ToString("MMMM dd, yyyy");
                            %>
                            <div class="col-lg-4 col-md-6 mb-3">
                                <div class="card border-0 shadow-sm">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-start mb-2">
                                            <h6 class="card-title mb-0 fw-bold"><%= studentName %></h6>
                                            <span class="badge bg-success">Paid</span>
                                        </div>
                                        <p class="text-muted mb-2"><%= feeType != "" ? feeType : "Tuition Fee" %></p>
                                        <div class="d-flex justify-content-between mb-2">
                                            <span class="text-success fw-bold">₹<%= Convert.ToDecimal(amountPaid).ToString("N0") %></span>
                                            <span class="text-primary">₹<%= Convert.ToDecimal(amountDue).ToString("N0") %></span>
                                        </div>
                                        <div class="d-flex justify-content-between text-muted small">
                                            <span>Paid</span>
                                            <span>Total</span>
                                        </div>
                                        <hr class="my-2">
                                        <div class="d-flex justify-content-between text-muted small">
                                            <span>Roll No: <%= rollNumber %></span>
                                            <span>Date: <%= paymentDate %></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                    }
                                }
                                else
                                {
                            %>
                            <div class="col-12">
                                <div class="text-center py-4">
                                    <i class="fas fa-credit-card fa-3x text-muted mb-3"></i>
                                    <h5 class="text-muted">No Recent Payments</h5>
                                    <p class="text-muted">Recent payment transactions will appear here</p>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>

                    <!-- Fee History Table -->
                    <div class="section-spacing">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h5 class="mb-0">Fee History</h5>
                                <span class="badge bg-primary" id="recordCount">Fee Records</span>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridViewFees" runat="server" AutoGenerateColumns="False" 
                                        CssClass="table table-hover table-striped">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Student Roll No">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("roll_number") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="table-primary" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Student Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("student_name") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="table-primary" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Amount Due">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# "₹" + Eval("amount_due") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="table-primary" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Amount Paid">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# "₹" + Eval("amount_paid") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="table-primary" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Payment Status">
                                                <ItemTemplate>
                                                    <span class="badge <%# GetStatusBadgeClass(Eval("payment_status").ToString()) %>">
                                                        <%# Eval("payment_status") %>
                                                    </span>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="table-primary" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Due Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("due_date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="table-primary" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Payment Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("payment_date") != DBNull.Value ? Eval("payment_date", "{0:dd/MM/yyyy}") : "Not Paid" %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="table-primary" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Remarks">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("remarks") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="table-primary" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <HeaderStyle CssClass="table-primary text-white" />
                                        <RowStyle CssClass="table-row-hover" />
                                        <AlternatingRowStyle CssClass="table-light" />
                                    </asp:GridView>
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
                                <div class="input-group">
                                    <asp:TextBox ID="std_rollno" class="form-control" runat="server" placeholder="Enter roll number" onchange="clearStudentFields()"></asp:TextBox>
                                    <asp:Button ID="btnGetStudent" runat="server" Text="Get Student" CssClass="btn btn-outline-primary" OnClick="GetStudentData_Click" UseSubmitBehavior="false" />
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Student Name</label>
                                <asp:TextBox ID="std_name" class="form-control" runat="server" ReadOnly="true" placeholder="Auto-filled after getting student data"></asp:TextBox>
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
                        <asp:Button ID="btnAddFee" runat="server" Text="Add Fee Record" CssClass="btn btn-primary" OnClick="btnAddFee_Click" UseSubmitBehavior="false" OnClientClick="return validateBeforeSubmit();" />
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
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Student Roll No</label>
                                    <%--<input type="text" class="form-control" id="paymentRollNo" readonly>--%>
                                    <asp:TextBox ID="std_rollno_paymethod" TextMode="Number" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Student Name</label>
                                    <%--<input type="text" class="form-control" id="paymentStudentName" readonly>--%>
                                    <asp:TextBox ID="std_name_paymethod" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Fee Record</label>
                                    <%--<select class="form-select" id="paymentFeeRecord" required>
                                        <option value="">Select Fee Record</option>
                                        <option value="Tuition Fee - ₹25,000">Tuition Fee - ₹25,000</option>
                                        <option value="Hostel Fee - ₹15,000">Hostel Fee - ₹15,000</option>
                                        <option value="Library Fee - ₹5,000">Library Fee - ₹5,000</option>
                                    </select>--%>

                                    <asp:DropDownList ID="list_fee_record" class="form-select"  runat="server"></asp:DropDownList>
    
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Payment Amount (₹)</label>
                                    <%--<input type="number" class="form-control" id="paymentAmount" min="0" step="1" required>--%>
                                    <asp:TextBox ID="payment_amount" TextMode="Number"  class="form-control" min="0" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Payment Method</label>
                                    <%--<select class="form-select" id="paymentMethod" required>
                                        <option value="">Select Method</option>
                                        <option value="Online Banking">Online Banking</option>
                                        <option value="Credit Card">Credit Card</option>
                                        <option value="Debit Card">Debit Card</option>
                                        <option value="UPI">UPI</option>
                                        <option value="Cash">Cash</option>
                                        <option value="Cheque">Cheque</option>
                                        <option value="Demand Draft">Demand Draft</option>
                                    </select>--%>
                                    <asp:DropDownList ID="list_fee_type_3" class="form-select" runat="server"></asp:DropDownList>

                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">
                                        Payment Date</label>
                                    <%--<input type="date" class="form-control" id="paymentDate" required>--%>
                                    <asp:TextBox ID="payment_date" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">
                                    Transaction ID</label>
                                <%--<input type="text" class="form-control" id="transactionId" placeholder="Enter transaction reference (optional)">--%>

                                <asp:TextBox ID="transaction_id" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">
                                    Remarks</label>
                                <%--<textarea class="form-control" id="paymentRemarks" rows="2" placeholder="Any additional notes"></textarea>--%>
                                <asp:TextBox ID="payment_remarks" class="form-control" runat="server" Rows="2"></asp:TextBox>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Cancel
                        </button>
                        <button type="button" class="btn btn-success" onclick="makePayment()">
                            Process Payment
                        </button>--%>
                        <asp:Button ID="btn_payment" class="btn btn-success"  Text="Process Payment" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>


<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link href="../../assets/css/common.css" rel="stylesheet">
        
        <script>
            function clearStudentFields() {
                // Clear student name and department when roll number changes
                document.getElementById('<%= std_name.ClientID %>').value = '';
                var deptDropdown = document.getElementById('<%= list_department_2.ClientID %>');
                if (deptDropdown) {
                    deptDropdown.selectedIndex = 0;
                }
            }
            
            function validateBeforeSubmit() {
                var rollNo = document.getElementById('<%= std_rollno.ClientID %>').value.trim();
                var studentName = document.getElementById('<%= std_name.ClientID %>').value.trim();
                
                if (rollNo && !studentName) {
                    alert('Please click "Get Student" button first to fetch student details!');
                    return false;
                }
                return true;
            }
        </script>
    </head>
</asp:Content>




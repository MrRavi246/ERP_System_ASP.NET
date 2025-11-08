<%@ Page Title="" Language="C#" MasterPageFile="~/pages/admin/notices.Master" AutoEventWireup="true" CodeBehind="notices.aspx.cs" Inherits="EduErp.pages.admin.notices1" %>

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
                                Notice Board
                            </p>
                        </div>
                        <nav class="nav flex-column">
                            <a class="nav-link text-dark" href="dashboard.aspx"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="students.aspx"><i class="fas fa-user-graduate me-2 text-primary"></i>Students </a><a class="nav-link text-dark" href="faculty.aspx"><i class="fas fa-chalkboard-teacher me-2 text-primary"></i>Faculty </a><a class="nav-link text-dark" href="courses.aspx"><i class="fas fa-book me-2 text-primary"></i>Courses </a><a class="nav-link text-dark" href="attendance.aspx"><i class="fas fa-calendar-check me-2 text-primary"></i>Attendance </a><a class="nav-link text-dark" href="timetable.aspx"><i class="fas fa-clock me-2 text-primary"></i>Timetable </a><a class="nav-link text-dark" href="exams.aspx"><i class="fas fa-file-alt me-2 text-primary"></i>Exams & Results </a><a class="nav-link text-dark" href="fees.aspx"><i class="fas fa-credit-card me-2 text-primary"></i>Fees </a><a class="nav-link active" href="notices.aspx">
                                <i class="fas fa-bullhorn me-2 text-primary"></i>Notice Board </a><a class="nav-link text-dark" href="reports.aspx"><i class="fas fa-chart-bar me-2 text-primary"></i>Reports </a>
                        </nav>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="col-md-9 col-lg-10 px-4 py-3">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h2 class="mb-1">Notice Board</h2>
                            <p class="text-muted">
                                Manage and view college announcements and notices
                            </p>
                        </div>
                        <div>
                            <button type="button" class="btn btn-primary me-2" data-bs-toggle="modal" data-bs-target="#addNoticeModal">
                                <i class="fas fa-plus me-1"></i>Add Notice
                            </button>
                            <%--<button class="btn btn-outline-secondary">
                                <i class="fas fa-download me-1"></i>Export
                            </button>--%>

                            <asp:Button ID="Button1" runat="server" Text="Export" class="btn btn-outline-secondary" OnClick="Button1_Click"/>
                            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
                        </div>
                    </div>

                    <!-- Stats Cards -->
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="card bg-primary text-white">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-0" id="totalNotices">24</h4>
                                            <p class="mb-0">
                                                Total Notices
                                            </p>
                                        </div>
                                        <i class="fas fa-bullhorn fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card bg-danger text-white">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-0" id="highPriority">5</h4>
                                            <p class="mb-0">
                                                High Priority
                                            </p>
                                        </div>
                                        <i class="fas fa-exclamation-triangle fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card bg-warning text-white">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-0" id="activeNotices">18</h4>
                                            <p class="mb-0">
                                                Active Notices
                                            </p>
                                        </div>
                                        <i class="fas fa-eye fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card bg-success text-white">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-0" id="todayNotices">3</h4>
                                            <p class="mb-0">
                                                Today's Notices
                                            </p>
                                        </div>
                                        <i class="fas fa-calendar-day fa-2x opacity-50"></i>
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
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label class="form-label">
                                                Priority</label>
                                            <%--<select class="form-select" id="priorityFilter">
                                                <option value="">All Priorities</option>
                                                <option value="High">High</option>
                                                <option value="Medium">Medium</option>
                                                <option value="Low">Low</option>
                                            </select>--%>
                                            <asp:DropDownList ID="notice_priority_2" class="form-select" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">
                                                Category</label>
                                            <%--<select class="form-select" id="categoryFilter">
                                                <option value="">All Categories</option>
                                                <option value="Academic">Academic</option>
                                                <option value="Administrative">Administrative</option>
                                                <option value="Event">Event</option>
                                                <option value="Emergency">Emergency</option>
                                            </select>--%>
                                            <asp:DropDownList ID="notice_category_2" class="form-select" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">
                                                Status</label>
                                            <%--<select class="form-select" id="statusFilter">
                                                <option value="">All Status</option>
                                                <option value="Active">Active</option>
                                                <option value="Inactive">Inactive</option>
                                                <option value="Expired">Expired</option>
                                            </select>--%>
                                            <asp:DropDownList ID="notice_status" class="form-select" runat="server">
                                                <asp:ListItem Value="All_Status" Text="All Status"></asp:ListItem>
                                                <asp:ListItem Value="Active" Text="Active"></asp:ListItem>
                                                <asp:ListItem Value="Inactive" Text="Inactive"></asp:ListItem>
                                                <asp:ListItem Value="Expired" Text="Expired"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">
                                                Search</label>
                                            <%--<input type="text" class="form-control" id="searchInput" placeholder="Search notices...">--%>
                                            <asp:TextBox ID="notice_search" class="form-control" TextMode="Search"  runat="server" placeholder="Search notices"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Notices Grid -->
                    <div class="row mb-4">
                        <div class="col-md-12">
                            <h5 class="mb-3">Recent Notices</h5>
                            <div class="row" id="noticesGrid">
                                <!-- Notices grid will be populated here -->
                            </div>
                        </div>
                    </div>

                    <!-- Notices Table -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0">All Notices</h5>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Notice ID</th>
                                                    <th>Title</th>
                                                    <th>Category</th>
                                                    <th>Priority</th>
                                                    <th>Posted Date</th>
                                                    <th>Expiry Date</th>
                                                    <th>Status</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody id="noticesTable">
                                                <!-- Notices table will be populated here -->
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

        <!-- Add Notice Modal -->
        <div class="modal fade" id="addNoticeModal" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New Notice</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal">
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-8 mb-3">
                                <label class="form-label">
                                    Notice Title</label>
                                <%--<input type="text" class="form-control" id="noticeTitle" required>--%>
                                <asp:TextBox ID="motice_title" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label">
                                    Priority</label>
                               <%-- <select class="form-select" id="noticePriority" required>
                                    <option value="">Select Priority</option>
                                    <option value="High">High</option>
                                    <option value="Medium">Medium</option>
                                    <option value="Low">Low</option>
                                </select>--%>
                                <asp:DropDownList ID="notice_priority" class="form-select" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Category</label>
                                <%--<select class="form-select" id="noticeCategory" required>
                                    <option value="">Select Category</option>
                                    <option value="Academic">Academic</option>
                                    <option value="Administrative">Administrative</option>
                                    <option value="Event">Event</option>
                                    <option value="Emergency">Emergency</option>
                                </select>--%>
                                <asp:DropDownList ID="notice_category" class="form-select" runat="server"></asp:DropDownList>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Posted By</label>
                                <%--<input type="text" class="form-control" id="postedBy" required>--%>
                                <asp:TextBox ID="notice_postedby" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Posted Date</label>
                                <%--<input type="date" class="form-control" id="postedDate" required>--%>
                                <asp:TextBox ID="notice_postedDate" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Expiry Date</label>
                                <%--<input type="date" class="form-control" id="expiryDate" required>--%>
                                <asp:TextBox ID="notice_expiryDate" TextMode="Date" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">
                                Notice Content</label>
                            <%--<textarea class="form-control" id="noticeContent" rows="6" required></textarea>--%>
                            <textarea id="notice_content" class="form-control" rows="6"></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">
                                Target Audience</label>
                            <div class="form-check">
                                <%--<input class="form-check-input" type="checkbox" id="targetStudents" checked>--%>
                                <asp:CheckBox ID="notice_std" class="form-check-input" runat="server" />
                                <label class="form-check-label" for="targetStudents">
                                    Students</label>
                            </div>
                            <div class="form-check">
                                <%--<input class="form-check-input" type="checkbox" id="targetFaculty" checked>--%>
                                <asp:CheckBox ID="notice_faculty" class="form-check-input" runat="server" />
                                <label class="form-check-label" for="targetFaculty">
                                    Faculty</label>
                            </div>
                            <div class="form-check">
                                <%--<input class="form-check-input" type="checkbox" id="targetStaff">--%>
                                <asp:CheckBox ID="notice_staff" class="form-check-input" runat="server" />
                                <label class="form-check-label" for="targetStaff">
                                    Staff</label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Cancel
                        </button>
                        <%--<button type="button" class="btn btn-primary" onclick="addNotice()">
                            Add Notice
                        </button>--%>
                        <asp:Button ID="add_notice" class="btn btn-primary" runat="server" Text="Add Notice" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>



<%@ Page Title="" Language="C#" MasterPageFile="~/pages/admin/attendance.Master" AutoEventWireup="true" CodeBehind="attendance.aspx.cs" Inherits="EduErp.pages.admin.attendance1" %>

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
                            Attendance Management
                        </p>
                    </div>
                    <nav class="nav flex-column">
                        <a class="nav-link text-dark" href="dashboard.aspx"><i class="fas fa-home me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="students.aspx"><i class="fas fa-users me-2 text-primary"></i>Students </a><a class="nav-link text-dark" href="faculty.aspx"><i class="fas fa-chalkboard-teacher me-2 text-primary"></i>Faculty </a><a class="nav-link text-dark" href="courses.aspx"><i class="fas fa-book me-2 text-primary"></i>Courses </a><a class="nav-link text-dark" href="timetable.aspx"><i class="fas fa-calendar me-2 text-primary"></i>Timetable </a><a class="nav-link active bg-primary text-white rounded" href="attendance.aspx"><i class="fas fa-calendar-check me-2"></i>Attendance </a><a class="nav-link text-dark" href="exams.aspx"><i class="fas fa-file-alt me-2 text-primary"></i>Exams & Results </a><a class="nav-link text-dark" href="fees.aspx"><i class="fas fa-money-bill-wave me-2 text-primary"></i>Fees </a><a class="nav-link text-dark" href="notices.aspx">
                            <i class="fas fa-bullhorn me-2 text-primary"></i>Notice Board </a><a class="nav-link text-dark" href="reports.aspx"><i class="fas fa-chart-bar me-2 text-primary"></i>Reports </a><a class="nav-link text-dark" href="settings.aspx"><i class="fas fa-cog me-2 text-primary"></i>Settings </a><a class="nav-link text-dark" href="profile.aspx"><i class="fas fa-user me-2 text-primary"></i>Profile </a>
                    </nav>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10">
                <div class="main-content p-4">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="text-primary fw-bold">Attendance Management</h2>
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#markAttendanceModal">
                            <i class="fas fa-check me-2"></i>Mark Attendance
                        </button>
                    </div>

                    <!-- Attendance Filters -->
                    <div class="card shadow-sm mb-4">
                        <div class="card-body">
                            <div class="row g-3">
                                <div class="col-md-3">
                                    <label class="form-label">
                                        Select Course</label>
                

                                    <asp:DropDownList ID="course_attendance"  class="form-select" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">Select Date</label>
                                    <asp:TextBox ID="class_date" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">Class Period</label>
                                    <asp:DropDownList ID="period_select" runat="server" CssClass="form-select"></asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label">&nbsp;</label>
                                    <asp:Button ID="btnLoadStudents" runat="server" CssClass="btn btn-outline-primary w-100" Text="Load Students" OnClick="btnLoadStudents_Click" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Attendance Table -->
                    <div class="card shadow-sm">
                        <div class="card-header bg-light">
                            <h5 class="mb-0">CS101 - Introduction to Programming | January 15, 2024 | Period 1</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <asp:GridView ID="studentAttendanceGrid" runat="server" CssClass="table table-hover" AutoGenerateColumns="false" DataKeyNames="student_id">
                                    <Columns>
                                        <asp:BoundField DataField="roll_no" HeaderText="Roll No" />
                                        <asp:BoundField DataField="student_name" HeaderText="Student Name" />
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <span class="badge <%= ((string)Eval("current_status") == "Present") ? "bg-success" : (((string)Eval("current_status") == "Absent") ? "bg-danger" : (((string)Eval("current_status") == "Late") ? "bg-warning" : "bg-secondary")) %>" id="status_<%# Eval("student_id") %>"><%# Eval("current_status") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Present" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <input type="radio" name='<%# "att_" + Eval("student_id") %>' value="Present" class="form-check-input" <%# Eval("current_status").ToString() == "Present" ? "checked='checked'" : "" %> />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Absent" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <input type="radio" name='<%# "att_" + Eval("student_id") %>' value="Absent" class="form-check-input" <%# Eval("current_status").ToString() == "Absent" ? "checked='checked'" : "" %> />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Late" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <input type="radio" name='<%# "att_" + Eval("student_id") %>' value="Late" class="form-check-input" <%# Eval("current_status").ToString() == "Late" ? "checked='checked'" : "" %> />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>

                            <!-- Attendance Summary -->
                            <div class="row mt-4">
                                <div class="col-md-3">
                                    <div class="card bg-success text-white">
                                        <div class="card-body text-center">
                                            <h4>1</h4>
                                            <p class="mb-0">
                                                Present
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card bg-danger text-white">
                                        <div class="card-body text-center">
                                            <h4>1</h4>
                                            <p class="mb-0">
                                                Absent
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card bg-warning text-white">
                                        <div class="card-body text-center">
                                            <h4>1</h4>
                                            <p class="mb-0">
                                                Late
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="card bg-info text-white">
                                        <div class="card-body text-center">
                                            <h4>3</h4>
                                            <p class="mb-0">
                                                Total
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-end mt-4">
                                <asp:Button ID="btnSaveAttendance" runat="server" CssClass="btn btn-success" Text="Save Attendance" OnClick="btnSaveAttendance_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Mark Attendance Modal -->
    <div class="modal fade" id="markAttendanceModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Quick Mark Attendance</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal">
                    </button>
                </div>
                <div class="modal-body">
                    
                        <div class="mb-3">
                            <label class="form-label">
                                Course</label>
                            <select class="form-select" required>
                                <option value="">Select Course...</option>
                                <option>Computer Science - CS101</option>
                                <option>Mathematics - MT201</option>
                                <option>Physics - PH101</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">
                                Date</label>
                            <input type="date" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">
                                Period</label>
                            <select class="form-select" required>
                                <option value="">Select Period...</option>
                                <option>Period 1 (9:00-10:00)</option>
                                <option>Period 2 (10:00-11:00)</option>
                                <option>Period 3 (11:00-12:00)</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        Cancel
                    </button>
                    <button type="button" class="btn btn-primary">
                        Load Students
                    </button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


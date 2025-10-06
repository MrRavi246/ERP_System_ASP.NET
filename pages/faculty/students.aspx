<%@ Page Title="" Language="C#" MasterPageFile="~/pages/admin/students.Master" AutoEventWireup="true" CodeBehind="students.aspx.cs" Inherits="EduErp.pages.faculty.students1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div class="container-fluid">
        <form runat="server">
            <div class="row">
                <!-- Sidebar -->
                <%--<div class="col-md-3 col-lg-2 px-0">
                    <div class="sidebar bg-white border-end p-3">
                        <div class="text-center mb-4">
                            <h4 class="text-primary fw-bold">College ERP</h4>
                            <p class="text-muted small">
                                Student Management
                            </p>
                        </div>
                        <nav class="nav flex-column">
                            <a class="nav-link text-dark" href="../admin/dashboard.html"><i class="fas fa-home me-2 text-primary"></i>Dashboard </a><a class="nav-link active bg-primary text-white rounded" href="../admin/students.html"><i class="fas fa-users me-2"></i>Students </a><a class="nav-link text-dark" href="../admin/faculty.html"><i class="fas fa-chalkboard-teacher me-2 text-primary"></i>Faculty </a><a class="nav-link text-dark" href="../admin/courses.html"><i class="fas fa-book me-2 text-primary"></i>Courses </a><a class="nav-link text-dark" href="../admin/timetable.html"><i class="fas fa-calendar me-2 text-primary"></i>Timetable </a><a class="nav-link text-dark" href="../admin/attendance.html"><i class="fas fa-calendar-check me-2 text-primary"></i>Attendance </a><a class="nav-link text-dark" href="../admin/exams.html"><i class="fas fa-file-alt me-2 text-primary"></i>Exams & Results </a><a class="nav-link text-dark" href="../admin/fees.html"><i class="fas fa-money-bill-wave me-2 text-primary"></i>Fees
                            </a><a class="nav-link text-dark" href="../admin/notices.html"><i class="fas fa-bullhorn me-2 text-primary"></i>Notice Board </a><a class="nav-link text-dark" href="../admin/reports.html"><i class="fas fa-chart-bar me-2 text-primary"></i>Reports </a><a class="nav-link text-dark" href="../admin/settings.html"><i class="fas fa-cog me-2 text-primary"></i>Settings </a><a class="nav-link text-dark" href="../admin/profile.html"><i class="fas fa-user me-2 text-primary"></i>Profile </a>
                        </nav>
                    </div>
                </div>--%>

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
                <div class="col-md-9 col-lg-10">
                    <div class="main-content p-4">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h2 class="text-primary fw-bold">Student Management</h2>
                        </div>

                        <!-- Student Search and Filter -->
                        <div class="card shadow-sm mb-4">
                            <div class="card-body">
                                <div class="row g-3">
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" placeholder="Search students...">
                                    </div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="department2" runat="server" class="form-select" AutoPostBack="false"></asp:DropDownList>

                                    </div>
                                    <div class="col-md-3">
                                        <select class="form-select">
                                            <option>All Years</option>
                                            <option>1st Year</option>
                                            <option>2nd Year</option>
                                            <option>3rd Year</option>
                                            <option>4th Year</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <button class="btn btn-outline-primary w-100">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Students Table -->
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="student_id">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("student_id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="First_Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("first_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Last_Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("last_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Parent_Email">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("parent_email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Phone">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("phone") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Department">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("department_id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Year">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("year_level") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <!-- Add Student Form -->
                        <div class="card shadow-sm mt-4" id="addStudentForm">
                            <div class="card-header">
                                <h5 class="card-title mb-0"><i class="fas fa-user-plus me-2 text-primary"></i>Add New Student </h5>
                            </div>
                            <div class="card-body">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label">
                                            First Name</label>
                                        <asp:TextBox ID="txtFirstName" runat="server" class="form-control"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">
                                            Last Name</label>
                                        <asp:TextBox ID="txtLastName" runat="server" class="form-control"></asp:TextBox>

                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">
                                            Email</label>
                                        <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">
                                            Phone</label>
                                        <asp:TextBox ID="txtPhone" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">
                                            Department</label>

                                        <asp:DropDownList ID="department" runat="server" class="form-select" AutoPostBack="false"></asp:DropDownList>

                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">
                                            Year</label>
                                        <asp:DropDownList ID="ddYear" runat="server" class="form-select">
                                            <asp:ListItem Value="">Choose...</asp:ListItem>
                                            <asp:ListItem Value="1st Year">1st Year</asp:ListItem>
                                            <asp:ListItem Value="2nd Year">2nd Year</asp:ListItem>
                                            <asp:ListItem Value="3rd Year">3rd Year</asp:ListItem>
                                            <asp:ListItem Value="4th Year">4th Year</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                    <div class="col-12">
                                        <label class="form-label">
                                            Address</label>
                                        <asp:TextBox ID="txtAddress" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-12">
                                        <div class="d-flex gap-2">
                                            <asp:Button ID="btnAddStudent" runat="server" Text="Add Student" class="btn btn-primary" OnClick="btnAddStudent_Click" />
                                            <button type="reset" class="btn btn-secondary">
                                                <i class="fas fa-refresh me-2"></i>Reset</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>


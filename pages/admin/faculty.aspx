<%@ Page Title="" Language="C#" MasterPageFile="~/pages/admin/faculty.Master" AutoEventWireup="true" CodeBehind="faculty.aspx.cs" Inherits="EduErp.pages.admin.faculty1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            display: block;
            font-size: var(--bs-pagination-font-size);
            color: var(--bs-pagination-color);
            text-decoration: none;
            transition: none;
            left: -1px;
            top: 2px;
            background-color: var(--bs-pagination-bg);
        }

        .auto-style2 {
            margin-right: 0px;
        }
    </style>
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
                                Faculty Management
                            </p>
                        </div>
                        <nav class="nav flex-column">
                            <a class="nav-link text-dark" href="dashboard.aspx"><i class="fas fa-home me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="students.aspx"><i class="fas fa-users me-2 text-primary"></i>Students </a><a class="nav-link active bg-primary text-white rounded" href="faculty.aspx"><i class="fas fa-chalkboard-teacher me-2"></i>Faculty </a><a class="nav-link text-dark" href="courses.aspx"><i class="fas fa-book me-2 text-primary"></i>Courses </a><a class="nav-link text-dark" href="timetable.aspx"><i class="fas fa-calendar me-2 text-primary"></i>Timetable </a><a class="nav-link text-dark" href="attendance.aspx"><i class="fas fa-calendar-check me-2 text-primary"></i>Attendance </a><a class="nav-link text-dark" href="exams.aspx"><i class="fas fa-file-alt me-2 text-primary"></i>Exams & Results </a><a class="nav-link text-dark" href="fees.aspx"><i class="fas fa-money-bill-wave me-2 text-primary"></i>Fees </a><a class="nav-link text-dark" href="notices.aspx">
                                <i class="fas fa-bullhorn me-2 text-primary"></i>Notice Board </a><a class="nav-link text-dark" href="reports.aspx"><i class="fas fa-chart-bar me-2 text-primary"></i>Reports </a><a class="nav-link text-dark" href="settings.aspx"><i class="fas fa-cog me-2 text-primary"></i>Settings </a><a class="nav-link text-dark" href="profile.aspx"><i class="fas fa-user me-2 text-primary"></i>Profile </a>
                        </nav>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="col-md-9 col-lg-10">
                    <div class="main-content p-4">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h2 class="text-primary fw-bold">Faculty Management</h2>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addFacultyModal">
                                <i class="fas fa-plus me-2"></i>Add Faculty
                            </button>

                        </div>

                        <!-- Faculty Search and Filter -->
                        <div class="card shadow-sm mb-4">
                            <div class="card-body">
                                <div class="row g-3">
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" placeholder="Search faculty...">
                                    </div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="department2" runat="server" AutoPostBack="false" CssClass="form-select">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">                                        
                                        <asp:DropDownList ID="designation2" runat="server" CssClass="form-select" AutoPostBack="false">
                                        </asp:DropDownList>

                                    </div>
                                    <div class="col-md-2">
                                        <button class="btn btn-outline-primary w-100">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Faculty Table -->
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Faculty ID</th>
                                                <th>Name</th>
                                                <th>Department</th>
                                                <th>Designation</th>
                                                <th>Email</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>F001</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img src="https://via.placeholder.com/40" class="rounded-circle me-2" alt="Faculty">
                                                        <div>
                                                            <div class="fw-bold">
                                                                Dr. Sarah Wilson
                                                            </div>
                                                            <small class="text-muted">Ph.D Computer Science</small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>Computer Science</td>
                                                <td><span class="badge bg-primary">Professor</span></td>
                                                <td>sarah.wilson@college.edu</td>
                                                <td><span class="badge bg-success">Active</span></td>
                                                <td>
                                                    <div class="btn-group btn-group-sm">
                                                        <button class="btn btn-outline-primary" title="View">
                                                            <i class="fas fa-eye"></i>
                                                        </button>
                                                        <button class="btn btn-outline-warning" title="Edit">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <button class="btn btn-outline-danger" title="Delete">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>F002</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img src="https://via.placeholder.com/40" class="rounded-circle me-2" alt="Faculty">
                                                        <div>
                                                            <div class="fw-bold">
                                                                Prof. Michael Brown
                                                            </div>
                                                            <small class="text-muted">M.Sc Mathematics</small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>Mathematics</td>
                                                <td><span class="badge bg-info">Associate Professor</span></td>
                                                <td>michael.brown@college.edu</td>
                                                <td><span class="badge bg-success">Active</span></td>
                                                <td>
                                                    <div class="btn-group btn-group-sm">
                                                        <button class="btn btn-outline-primary" title="View">
                                                            <i class="fas fa-eye"></i>
                                                        </button>
                                                        <button class="btn btn-outline-warning" title="Edit">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <button class="btn btn-outline-danger" title="Delete">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>F003</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img src="https://via.placeholder.com/40" class="rounded-circle me-2" alt="Faculty">
                                                        <div>
                                                            <div class="fw-bold">
                                                                Dr. Emily Davis
                                                            </div>
                                                            <small class="text-muted">Ph.D Physics</small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>Physics</td>
                                                <td><span class="badge bg-warning">Assistant Professor</span></td>
                                                <td>emily.davis@college.edu</td>
                                                <td><span class="badge bg-warning">On Leave</span></td>
                                                <td>
                                                    <div class="btn-group btn-group-sm">
                                                        <button class="btn btn-outline-primary" title="View">
                                                            <i class="fas fa-eye"></i>
                                                        </button>
                                                        <button class="btn btn-outline-warning" title="Edit">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <button class="btn btn-outline-danger" title="Delete">
                                                            <i class="fas fa-trash"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <!-- Pagination -->
                                <nav class="mt-4">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">Previous</a> </li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a> </li>
                                        <li class="page-item"><a class="auto-style1" href="#">2</a> </li>
                                        <li class="page-item"><a class="page-link" href="#">3</a> </li>
                                        <li class="page-item"><a class="page-link" href="#">Next</a> </li>
                                    </ul>
                                </nav>


                                <div class="card shadow-sm mb-4" style="left: 1px; top: 5px">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="auto-style2">
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <asp:GridView ID="GridView1" DataKeyNames="id" runat="server" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="first_name">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" Text='<%# Eval("first_name") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Last_name">

                                            <ItemTemplate>
                                                <asp:Label ID="Label2" Text='<%# Eval("last_name") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Phone">

                                            <ItemTemplate>
                                                <asp:Label ID="Label3" Text='<%# Eval("phone") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="address">

                                            <ItemTemplate>
                                                <asp:Label ID="Label4" Text='<%# Eval("address") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Designation">

                                            <ItemTemplate>
                                                <asp:Label ID="Label5" Text='<%# Eval("designation") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Qualification ">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" Text='<%# Eval("qualification") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="salary">

                                            <ItemTemplate>
                                                <asp:Label ID="Label6" Text='<%# Eval("salary") %>' runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("id") %>'>Delete</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Edite">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("id") %>'>Edite</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Faculty Modal -->
        <div class="modal fade" id="addFacultyModal" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New Faculty</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal">
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">
                                    First Name</label>
                                <asp:TextBox ID="faculty_fname" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">
                                    Last Name</label>
                                <asp:TextBox ID="faculty_lname" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">
                                    Email</label>
                                <asp:TextBox ID="faculty_email" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">
                                    Phone</label>
                                <asp:TextBox ID="faculty_phone" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">
                                    Department</label>

                                <asp:DropDownList ID="department" runat="server" AutoPostBack="false" CssClass="form-select">
                                </asp:DropDownList>

                            </div>
                            <div class="col-md-6">
                                <label class="form-label">
                                    Designation</label>
                                <asp:DropDownList ID="designation" runat="server" CssClass="form-select" AutoPostBack="false">
                                </asp:DropDownList>

                            </div>
                            <div class="col-md-6">
                                <label class="form-label">
                                    Qualification</label>
                                <asp:TextBox ID="Qualification" runat="server" class="form-control" placeholder="e.g., Ph.D Computer Science"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">
                                    Experience (Years)</label>
                                <asp:TextBox ID="faculty_experience" runat="server" TextMode="Number" class="form-control" min="0"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <label class="form-label">
                                    Address</label>
                                <asp:TextBox ID="faculty_address" runat="server" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="Button1" runat="server" class="btn btn-secondary" Text="Cancel" />
                        <asp:Button ID="Button2" runat="server" class="btn btn-primary" Text="Add" OnClick="Button2_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>





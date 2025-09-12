<%@ Page Title="" Language="C#" MasterPageFile="~/pages/admin/students.Master" AutoEventWireup="true" CodeBehind="students.aspx.cs" Inherits="EduErp.pages.faculty.students1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 px-0">
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
                                    <select class="form-select">
                                        <option>All Departments</option>
                                        <option>Computer Science</option>
                                        <option>Mathematics</option>
                                        <option>Physics</option>
                                        <option>Chemistry</option>
                                    </select>
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
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Student ID</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Department</th>
                                            <th>Year</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>S001</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://via.placeholder.com/40" class="rounded-circle me-2" alt="Student">
                                                    <div>
                                                        <div class="fw-bold">
                                                            John Doe
                                                        </div>
                                                        <small class="text-muted">Roll: 2021CS001</small>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>john.doe@college.edu</td>
                                            <td>Computer Science</td>
                                            <td>3rd Year</td>
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
                                            <td>S002</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://via.placeholder.com/40" class="rounded-circle me-2" alt="Student">
                                                    <div>
                                                        <div class="fw-bold">
                                                            Jane Smith
                                                        </div>
                                                        <small class="text-muted">Roll: 2021MT002</small>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>jane.smith@college.edu</td>
                                            <td>Mathematics</td>
                                            <td>3rd Year</td>
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
                                            <td>S003</td>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://via.placeholder.com/40" class="rounded-circle me-2" alt="Student">
                                                    <div>
                                                        <div class="fw-bold">
                                                            Mike Johnson
                                                        </div>
                                                        <small class="text-muted">Roll: 2022CS003</small>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>mike.johnson@college.edu</td>
                                            <td>Computer Science</td>
                                            <td>2nd Year</td>
                                            <td><span class="badge bg-warning">Suspended</span></td>
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
                                    <li class="page-item"><a class="page-link" href="#">2</a> </li>
                                    <li class="page-item"><a class="page-link" href="#">3</a> </li>
                                    <li class="page-item"><a class="page-link" href="#">Next</a> </li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                    <!-- Add Student Form -->
                    <div class="card shadow-sm mt-4" id="addStudentForm">
                        <div class="card-header">
                            <h5 class="card-title mb-0"><i class="fas fa-user-plus me-2 text-primary"></i>Add New Student </h5>
                        </div>
                        <div class="card-body">
                            <form runat="server">
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
                                        <asp:DropDownList ID="ddDepartment" runat="server" class="form-select">
                                            <asp:ListItem>Choose...</asp:ListItem>
                                            <asp:ListItem> Computer Scince</asp:ListItem>
                                            <asp:ListItem>Matematics</asp:ListItem>
                                            <asp:ListItem>Physics</asp:ListItem>
                                            <asp:ListItem>Chemistry</asp:ListItem>
                                        </asp:DropDownList>

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
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


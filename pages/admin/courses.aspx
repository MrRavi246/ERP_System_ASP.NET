<%@ Page Title="" Language="C#" MasterPageFile="~/pages/admin/courses.Master" AutoEventWireup="true" CodeBehind="courses.aspx.cs" Inherits="EduErp.pages.admin.courses1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <form id="courseForm" runat="server">
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
                                Course Management
                            </p>
                        </div>
                        <nav class="nav flex-column">
                            <a class="nav-link text-dark" href="dashboard.aspx"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="students.aspx"><i class="fas fa-user-graduate me-2 text-primary"></i>Students </a><a class="nav-link text-dark" href="faculty.aspx"><i class="fas fa-chalkboard-teacher me-2 text-primary"></i>Faculty </a><a class="nav-link active bg-primary text-white rounded" href="courses.aspx"><i class="fas fa-book me-2"></i>Courses </a><a class="nav-link text-dark" href="attendance.aspx"><i class="fas fa-calendar-check me-2 text-primary"></i>Attendance </a><a class="nav-link text-dark" href="timetable.aspx"><i class="fas fa-clock me-2 text-primary"></i>Timetable </a><a class="nav-link text-dark" href="exams.aspx"><i class="fas fa-file-alt me-2 text-primary"></i>Exams & Results </a><a class="nav-link text-dark" href="fees.aspx"><i class="fas fa-credit-card me-2 text-primary"></i>Fees </a><a class="nav-link text-dark" href="notices.aspx">
                                <i class="fas fa-bullhorn me-2 text-primary"></i>Notice Board </a><a class="nav-link text-dark" href="reports.aspx"><i class="fas fa-chart-bar me-2 text-primary"></i>Reports </a>
                        </nav>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="col-md-9 col-lg-10 main-content">
                    <div class="page-header d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-4">
                        <div class="mb-3 mb-md-0">
                            <h2 class="mb-1">Course Management</h2>
                            <p class="text-muted mb-0">
                                Manage academic courses and curriculum
                            </p>
                        </div>
                        <div class="d-flex flex-column flex-sm-row gap-2">


                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCourseModal">
                                <i class="fas fa-plus me-2"></i>Add  New Course
                            </button>
                        </div>
                    </div>

                    <!-- Stats Cards -->
                    <div class="row mb-4">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Total Courses
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="totalCourses">
                                                0
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-book fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Active Courses
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="activeCourses">
                                                0
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
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                Total Credits
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="totalCredits">
                                                0
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-star fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Departments
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800" id="totalDepartments">
                                                0
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-building fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Search and Filter -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-search"></i></span>
                                <input type="text" class="form-control" id="searchCourse" placeholder="Search courses...">
                            </div>
                        </div>
                        <div class="col-md-3">
                           
                            <asp:DropDownList ID="department2"  class="form-select" runat="server" AutoPostBack="false" CssClass="form-select">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-3">
                            <select class="form-select" id="statusFilter">
                                <option value="">All Status</option>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>

                            <%--<asp:DropDownList ID="course_status" runat="server" class="form-select" ></asp:DropDownList>--%>
                        </div>
                    </div>

                    <!-- Course Cards -->
                    <div class="row" id="courseCards">
                        <!-- Course cards will be populated by JavaScript -->
                    </div>

                    <!-- Course Table -->
                    <div class="card mt-4">
                        <div class="card-header">
                            <h5 class="card-title mb-0"><i class="fas fa-table me-2 text-primary"></i>All Courses </h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <asp:GridView ID="coursesGrid" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="ID" />
                                        <asp:BoundField DataField="course_code" HeaderText="Course Code" />
                                        <asp:BoundField DataField="course_name" HeaderText="Course Name" />
                                        <asp:BoundField DataField="department_name" HeaderText="Department" />
                                        <asp:BoundField DataField="credits" HeaderText="Credits" />
                                        <asp:BoundField DataField="semester" HeaderText="Semester" />
                                        <asp:BoundField DataField="year_level" HeaderText="Year" />
                                        <asp:TemplateField HeaderText="Active">
                                            <ItemTemplate>
                                                <%# Convert.ToBoolean(Eval("is_active")) ? "<span class=\"badge bg-success\">Active</span>" : "<span class=\"badge bg-secondary\">Inactive</span>" %>
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

        <!-- Add Course Modal -->
        <div class="modal fade" id="addCourseModal" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><i class="fas fa-plus me-2"></i>Add New Course </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal">
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="courseId" class="form-label">
                                    Course ID *</label>

                                <asp:TextBox ID="course_id" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="courseName" class="form-label">
                                    Course Name *</label>

                                <asp:TextBox ID="course_name" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="courseDepartment" class="form-label">
                                    Department *</label>

                                <asp:DropDownList ID="department" runat="server" AutoPostBack="false" CssClass="form-select">
                                </asp:DropDownList>

                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="credits" class="form-label">
                                    Credits *</label>
                                <%--<input type="number" class="form-control" id="credits" min="1" max="6" required>--%>

                                <asp:TextBox ID="credits_course" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="instructor" class="form-label">
                                    Instructor</label>
                                <asp:DropDownList ID="instructor_course" class="form-select" runat="server"></asp:DropDownList>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="semester" class="form-label">
                                    Semester</label>
                                <asp:DropDownList ID="semester" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">Select Semester</asp:ListItem>
                                    <asp:ListItem Value="1">Semester 1</asp:ListItem>
                                    <asp:ListItem Value="2">Semester 2</asp:ListItem>
                                    <asp:ListItem Value="3">Semester 3</asp:ListItem>
                                    <asp:ListItem Value="4">Semester 4</asp:ListItem>
                                    <asp:ListItem Value="5">Semester 5</asp:ListItem>
                                    <asp:ListItem Value="6">Semester 6</asp:ListItem>
                                    <asp:ListItem Value="7">Semester 7</asp:ListItem>
                                    <asp:ListItem Value="8">Semester 8</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="courseDescription" class="form-label">
                                Course Description</label>

                            <asp:TextBox ID="course_description" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="3" />
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="maxStudents" class="form-label">
                                    Maximum Students</label>
                                <%--<input type="number" class="form-control" id="maxStudents" min="1" max="100">--%>

                                <asp:TextBox ID="maxstudent_course" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="courseStatus" class="form-label">
                                    Status</label>
                                <asp:DropDownList ID="courseStatus" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="Active">Active</asp:ListItem>
                                    <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Cancel

                        </button>
                        <%--   <button type="button" class="btn btn-primary" onclick="addCourse()">
                            <i class="fas fa-save me-2"></i>Add Course
                        </button>--%>

                        <asp:Button ID="Button1" runat="server" class="btn btn-primary" OnClick="Button1_Click" Text="Add Course" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>



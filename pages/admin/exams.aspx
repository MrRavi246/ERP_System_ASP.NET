<%@ Page Title="" Language="C#" MasterPageFile="~/pages/admin/exams.Master" AutoEventWireup="true" CodeBehind="exams.aspx.cs" Inherits="EduErp.pages.admin.exams1" %>

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
                                Exam Management
                            </p>
                        </div>
                        <nav class="nav flex-column">
                            <a class="nav-link text-dark" href="dashboard.aspx"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="students.aspx"><i class="fas fa-user-graduate me-2 text-primary"></i>Students </a><a class="nav-link text-dark" href="faculty.aspx"><i class="fas fa-chalkboard-teacher me-2 text-primary"></i>Faculty </a><a class="nav-link text-dark" href="courses.aspx"><i class="fas fa-book me-2 text-primary"></i>Courses </a><a class="nav-link text-dark" href="attendance.aspx"><i class="fas fa-calendar-check me-2 text-primary"></i>Attendance </a><a class="nav-link text-dark" href="timetable.aspx"><i class="fas fa-clock me-2 text-primary"></i>Timetable </a><a class="nav-link active bg-primary text-white rounded" href="exams.aspx"><i class="fas fa-file-alt me-2"></i>Exams & Results </a><a class="nav-link text-dark" href="fees.aspx"><i class="fas fa-credit-card me-2 text-primary"></i>Fees </a><a class="nav-link text-dark" href="notices.aspx">
                                <i class="fas fa-bullhorn me-2 text-primary"></i>Notice Board </a><a class="nav-link text-dark" href="reports.aspx"><i class="fas fa-chart-bar me-2 text-primary"></i>Reports </a>
                        </nav>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="col-md-9 col-lg-10 px-4 py-3">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h2 class="mb-1">Exams & Results Management</h2>
                            <p class="text-muted">
                                Manage examinations and view student results
                            </p>
                        </div>
                        <div>
                            <button class="btn btn-primary me-2" data-bs-toggle="modal" data-bs-target="#addExamModal">
                                <i class="fas fa-plus me-1"></i>Add Exam
                            </button>
                            <button class="btn btn-success me-2" data-bs-toggle="modal" data-bs-target="#addResultModal">
                                <i class="fas fa-plus me-1"></i>Add Result
                            </button>
                            <%--<button class="btn btn-outline-secondary">
                                <i class="fas fa-download me-1"></i>Export
                            </button>--%>
                            <asp:Button ID="Button1" runat="server" Text="Export" class="btn btn-outline-secondary" OnClick="Button1_Click1"/>
                        </div>
                    </div>

                    <!-- Stats Cards -->
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="card bg-primary text-white">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-0" id="totalExams">12</h4>
                                            <p class="mb-0">
                                                Total Exams
                                            </p>
                                        </div>
                                        <i class="fas fa-file-alt fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card bg-success text-white">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-0" id="totalResults">156</h4>
                                            <p class="mb-0">
                                                Total Results
                                            </p>
                                        </div>
                                        <i class="fas fa-chart-line fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card bg-info text-white">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-0" id="avgScore">78.5%</h4>
                                            <p class="mb-0">
                                                Average Score
                                            </p>
                                        </div>
                                        <i class="fas fa-percentage fa-2x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card bg-warning text-white">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-0" id="passRate">85%</h4>
                                            <p class="mb-0">
                                                Pass Rate
                                            </p>
                                        </div>
                                        <i class="fas fa-trophy fa-2x opacity-50"></i>
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
                                                Exam Type</label>
                                            <%--<select class="form-select" id="examTypeFilter">
                                                <option value="">All Types</option>
                                                <option value="Midterm">Midterm</option>
                                                <option value="Final">Final</option>
                                                <option value="Quiz">Quiz</option>
                                                <option value="Assignment">Assignment</option>
                                            </select>--%>
                                            <asp:DropDownList ID="txt_ExamType" class="form-select" runat="server"></asp:DropDownList>
                                        </div>
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

                                            <asp:DropDownList ID="txt_department" class="form-select" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">
                                                Grade Range</label>
                                            <%--<select class="form-select" id="gradeFilter">
                                                <option value="">All Grades</option>
                                                <option value="A">A Grade</option>
                                                <option value="B">B Grade</option>
                                                <option value="C">C Grade</option>
                                                <option value="F">F Grade</option>
                                            </select>--%>

                                            <asp:DropDownList ID="txt_grade" class="form-select" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="form-label">
                                                Search</label>
                                            <input type="text" class="form-control" id="searchInput" placeholder="Search students...">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Results Cards -->
                    <div class="row mb-4">
                        <div class="col-md-12">
                            <h5 class="mb-3">Recent Results</h5>
                            <div class="row" id="resultsCards">
                                <!-- Results cards will be populated here -->
                            </div>
                        </div>
                    </div>

                    <!-- Results Table -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="mb-0">All Results</h5>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Roll No</th>
                                                    <th>Student Name</th>
                                                    <th>Exam</th>
                                                    <th>Subject</th>
                                                    <th>Marks</th>
                                                    <th>Grade</th>
                                                    <th>Date</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody id="resultsTable">
                                                <!-- Results table will be populated here -->
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

        <!-- Add Exam Modal -->
        <div class="modal fade" id="addExamModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New Exam</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal">
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Exam Name</label>
                                <%--<input type="text" class="form-control" id="examName" required>--%>
                                <asp:TextBox ID="exam_name" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Exam Type</label>
                                <%-- <select class="form-select" id="examType" required>
                                        <option value="">Select Type</option>
                                        <option value="Midterm">Midterm</option>
                                        <option value="Final">Final</option>
                                        <option value="Quiz">Quiz</option>
                                        <option value="Assignment">Assignment</option>
                                    </select>--%>
                                <asp:DropDownList ID="txt_ExamType_2" class="form-select" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Subject</label>
                                <%--<input type="text" class="form-control" id="examSubject" required>--%>
                                <asp:TextBox ID="subject" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Department</label>
                                <%--<select class="form-select" id="examDepartment" required>
                                        <option value="">Select Department</option>
                                        <option value="Computer Science">Computer Science</option>
                                        <option value="Electrical">Electrical</option>
                                        <option value="Mechanical">Mechanical</option>
                                        <option value="Civil">Civil</option>
                                    </select>--%>
                                <asp:DropDownList ID="txt_department_2" class="form-select" runat="server"></asp:DropDownList>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Total Marks</label>
                                <%--<input type="number" class="form-control" id="totalMarks" required>--%>
                                <asp:TextBox ID="totalmarks" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Exam Date</label>
                                <%--<input type="date" class="form-control" id="examDate" required>--%>
                                <asp:TextBox ID="exam_date" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">
                                Description</label>
                            <%--<textarea class="form-control" id="examDescription" rows="3"></textarea>--%>
                            <asp:TextBox ID="txt_description" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="3"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Cancel
                        </button>
                        <%--<button type="button" class="btn btn-primary" onclick="addExam()">
                            Add Exam
                        </button>--%>

                        <asp:Button ID="add_exam" runat="server" class="btn btn-primary" Text="Add Exam" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Result Modal -->
        <div class="modal fade" id="addResultModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New Result</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal">
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Student Roll No</label>
                                <%--<input type="text" class="form-control" id="studentRollNo" required>--%>
                                <asp:TextBox ID="std_rollno" TextMode="Number" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Student Name</label>
                                <%--<input type="text" class="form-control" id="studentName" required>--%>
                                <asp:TextBox ID="std_name" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Exam</label>
                                <%--<select class="form-select" id="resultExam" required>
                                        <option value="">Select Exam</option>
                                        <option value="Midterm Exam">Midterm Exam</option>
                                        <option value="Final Exam">Final Exam</option>
                                        <option value="Quiz 1">Quiz 1</option>
                                        <option value="Assignment 1">Assignment 1</option>
                                    </select>--%>
                                <asp:DropDownList ID="txt_exam_type_3" class="form-select" runat="server"></asp:DropDownList>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Subject</label>
                                <%--<input type="text" class="form-control" id="resultSubject" required>--%>
                                <asp:TextBox ID="txt_subject" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Marks Obtained</label>
                                <%--<input type="number" class="form-control" id="marksObtained" required>--%>
                                <asp:TextBox ID="txt_marks" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Total Marks</label>
                                <%--<input type="number" class="form-control" id="totalMarksResult" required>--%>
                                <asp:TextBox ID="txt_totalmarks" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Grade</label>
                                <select class="form-select" id="resultGrade" required>
                                    <option value="">Select Grade</option>
                                    <option value="A">A (90-100)</option>
                                    <option value="B">B (80-89)</option>
                                    <option value="C">C (70-79)</option>
                                    <option value="D">D (60-69)</option>
                                    <option value="F">F (Below 60)</option>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Result Date</label>
                                <%--<input type="date" class="form-control" id="resultDate" required>--%>
                                <asp:TextBox ID="txt_date" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">
                                Remarks</label>
                            <%--<textarea class="form-control" id="resultRemarks" rows="2"></textarea>--%>
                            <asp:TextBox ID="txt_remarks" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="2"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Cancel
                        </button>
                        <%--<button type="button" class="btn btn-primary" onclick="addResult()">
                            Add Result
                        </button>--%>
                        <asp:Button ID="add_result" runat="server" class="btn btn-primary" Text="Add Result" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
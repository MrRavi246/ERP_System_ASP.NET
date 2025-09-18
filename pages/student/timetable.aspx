<%@ Page Title="" Language="C#" MasterPageFile="~/pages/student/timetable.Master" AutoEventWireup="true" CodeBehind="timetable.aspx.cs" Inherits="EduErp.pages.student.timetable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 px-0">
                <div class="sidebar bg-white border-end p-3">
                    <div class="text-center mb-4">
                        <h4 class="text-primary fw-bold">College ERP</h4>
                        <p class="text-muted small">
                            Student Dashboard</p>
                    </div>
                    <nav class="nav flex-column">
                        <a class="nav-link text-dark" href="dashboard.aspx"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="courses.aspx"><i class="fas fa-book me-2 text-primary"></i>My Courses </a><a class="nav-link text-dark" href="attendance.aspx"><i class="fas fa-calendar-check me-2 text-primary"></i>My Attendance </a><a class="nav-link active" href="timetable.aspx"><i class="fas fa-clock me-2 text-primary"></i>My Timetable </a><a class="nav-link text-dark" href="exams.aspx"><i class="fas fa-file-alt me-2 text-primary"></i>My Exams </a><a class="nav-link text-dark" href="fees.aspx"><i class="fas fa-credit-card me-2 text-primary"></i>My Fees </a><a class="nav-link text-dark" href="notices.aspx"><i class="fas fa-bullhorn me-2 text-primary"></i>Notices </a><a class="nav-link text-dark" href="profile.aspx"><i class="fas fa-user-cog me-2 text-primary"></i>Edit Profile </a>
                    </nav>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 px-4 py-3">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h2 class="mb-1">My Timetable</h2>
                        <p class="text-muted">
                            View your class schedule</p>
                    </div>
                    <div>
                        <button class="btn btn-outline-secondary" onclick="history.back()">
                            <i class="fas fa-arrow-left me-1"></i>Back
                        </button>
                    </div>
                </div>

                <!-- Timetable -->
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title mb-0"><i class="fas fa-calendar me-2 text-primary"></i>Weekly Schedule </h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead class="table-light">
                                    <tr>
                                        <th>Time</th>
                                        <th>Monday</th>
                                        <th>Tuesday</th>
                                        <th>Wednesday</th>
                                        <th>Thursday</th>
                                        <th>Friday</th>
                                    </tr>
                                </thead>
                                <tbody id="timetableBody">
                                    <!-- Timetable will be populated by JavaScript -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



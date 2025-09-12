<%@ Page Title="" Language="C#" MasterPageFile="~/pages/faculty/settings.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="EduErp.pages.faculty.settings1" %>
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
                                    Faculty Portal</p>
                            </div>
                            <nav class="nav flex-column">
                                <a class="nav-link text-dark" href="dashboard.html"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="courses.html"><i class="fas fa-book me-2 text-primary"></i>My Courses </a><a class="nav-link text-dark" href="students.html"><i class="fas fa-user-graduate me-2 text-primary"></i>Students </a><a class="nav-link text-dark" href="attendance.html"><i class="fas fa-calendar-check me-2 text-primary"></i>Attendance </a><a class="nav-link text-dark" href="timetable.html"><i class="fas fa-calendar me-2 text-primary"></i>Timetable </a><a class="nav-link text-dark" href="exams.html"><i class="fas fa-clipboard-list me-2 text-primary"></i>Exams </a><a class="nav-link text-dark" href="notices.html"><i class="fas fa-bullhorn me-2 text-primary"></i>Notices </a><a class="nav-link text-dark" href="profile.html"><i class="fas fa-user me-2 text-primary"></i>Profile </a><a class="nav-link active" href="settings.html">
                                <i class="fas fa-cog me-2 text-primary"></i>Settings </a>
                            </nav>
                        </div>
            </div>

                    <!-- Main Content -->
                    <div class="col-md-9 col-lg-10">
                        <!-- Header -->
                        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                            <h1 class="h2"><i class="fas fa-cog me-2 text-primary"></i>Faculty Settings</h1>
                            <div class="btn-toolbar mb-2 mb-md-0">
                                <div class="dropdown">
                                    <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                        <i class="fas fa-user me-1"></i>Faculty
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="profile.html"><i class="fas fa-user-cog me-2 text-primary"></i>Profile</a></li>
                                        <li><a class="dropdown-item" href="settings.html"><i class="fas fa-cog me-2 text-primary"></i>Settings</a></li>
                                        <li>
                                            <hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item" href="../../index.html"><i class="fas fa-sign-out-alt me-2 text-primary"></i>Logout</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!-- Settings Content -->
                        <div class="row">
                            <!-- Profile Settings -->
                            <div class="col-lg-6 mb-4">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="mb-0"><i class="fas fa-user me-2 text-primary"></i>Profile Settings</h5>
                                    </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="mb-3">
                                                <label for="displayName" class="form-label">
                                                Display Name</label>
                                                <input type="text" class="form-control" id="displayName" value="Dr. Sarah Wilson">
                                            </div>
                                            <div class="mb-3">
                                                <label for="title" class="form-label">
                                                Academic Title</label>
                                                <select class="form-select" id="title">
                                                    <option>Dr.</option>
                                                    <option>Prof.</option>
                                                    <option>Mr.</option>
                                                    <option>Ms.</option>
                                                    <option>Mrs.</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="email" class="form-label">
                                                Email Address</label>
                                                <input type="email" class="form-control" id="email" value="sarah.wilson@college.edu" readonly> <small class="text-muted">Contact admin to change email</small>
                                            </div>
                                            <div class="mb-3">
                                                <label for="phone" class="form-label">
                                                Office Phone</label>
                                                <input type="tel" class="form-control" id="phone" value="+1 (555) 234-5678">
                                            </div>
                                            <div class="mb-3">
                                                <label for="officeLocation" class="form-label">
                                                Office Location</label>
                                                <input type="text" class="form-control" id="officeLocation" value="Science Building, Room 204">
                                            </div>
                                            <div class="mb-3">
                                                <label for="officeHours" class="form-label">
                                                Office Hours</label>
                                                <textarea class="form-control" id="officeHours" rows="3">Monday-Wednesday: 2:00 PM - 4:00 PM
Friday: 10:00 AM - 12:00 PM
Or by appointment</textarea>
                                            </div>
                                            <button type="submit" class="btn btn-primary">
                                                Save Changes
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- Teaching Preferences -->
                            <div class="col-lg-6 mb-4">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="mb-0"><i class="fas fa-chalkboard-teacher me-2 text-primary"></i>Teaching Preferences</h5>
                                    </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="mb-3">
                                                <label for="gradingMethod" class="form-label">
                                                Default Grading Method</label>
                                                <select class="form-select" id="gradingMethod">
                                                    <option selected>Letter Grades (A-F)</option>
                                                    <option>Percentage (0-100)</option>
                                                    <option>Points-based</option>
                                                    <option>Pass/Fail</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="attendancePolicy" class="form-label">
                                                Attendance Policy</label>
                                                <select class="form-select" id="attendancePolicy">
                                                    <option selected>Required (affects grade)</option>
                                                    <option>Recommended</option>
                                                    <option>Optional</option>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label for="lateSubmissionPolicy" class="form-label">
                                                Late Submission Policy</label>
                                                <select class="form-select" id="lateSubmissionPolicy">
                                                    <option selected>Deduct 10% per day</option>
                                                    <option>Deduct 5% per day</option>
                                                    <option>Fixed penalty</option>
                                                    <option>Case by case</option>
                                                </select>
                                            </div>
                                            <div class="mb-3 form-check">
                                                <input type="checkbox" class="form-check-input" id="autoEmailGrades" checked>
                                                <label class="form-check-label" for="autoEmailGrades">
                                                Automatically email students when grades are posted
                                                </label>
                                            </div>
                                            <div class="mb-3 form-check">
                                                <input type="checkbox" class="form-check-input" id="allowResubmissions">
                                                <label class="form-check-label" for="allowResubmissions">
                                                Allow assignment resubmissions
                                                </label>
                                            </div>
                                            <button type="submit" class="btn btn-primary">
                                                Save Preferences
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- Security Settings -->
                            <div class="col-lg-6 mb-4">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="mb-0"><i class="fas fa-shield-alt me-2 text-primary"></i>Security</h5>
                                    </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="mb-3">
                                                <label for="currentPassword" class="form-label">
                                                Current Password</label>
                                                <div class="input-group">
                                                    <input type="password" class="form-control" id="currentPassword">
                                                    <button class="btn btn-outline-secondary" type="button" onclick="togglePasswordVisibility('currentPassword', 'toggleCurrentPassword')">
                                                        <i class="fas fa-eye" id="toggleCurrentPassword"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="newPassword" class="form-label">
                                                New Password</label>
                                                <div class="input-group">
                                                    <input type="password" class="form-control" id="newPassword">
                                                    <button class="btn btn-outline-secondary" type="button" onclick="togglePasswordVisibility('newPassword', 'toggleNewPassword')">
                                                        <i class="fas fa-eye" id="toggleNewPassword"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="confirmPassword" class="form-label">
                                                Confirm New Password</label>
                                                <input type="password" class="form-control" id="confirmPassword">
                                            </div>
                                            <div class="mb-3 form-check">
                                                <input type="checkbox" class="form-check-input" id="loginNotifications" checked>
                                                <label class="form-check-label" for="loginNotifications">
                                                Email me when someone logs into my account
                                                </label>
                                            </div>
                                            <button type="submit" class="btn btn-primary">
                                                Change Password
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- Notification Settings -->
                            <div class="col-lg-6 mb-4">
                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="mb-0"><i class="fas fa-bell me-2 text-primary"></i>Notification Preferences</h5>
                                    </div>
                                    <div class="card-body">
                                        <form>
                                            <div class="mb-3">
                                                <h6>Email Notifications</h6>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="emailSubmissions" checked>
                                                    <label class="form-check-label" for="emailSubmissions">
                                                    New assignment submissions
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="emailLateSubmissions" checked>
                                                    <label class="form-check-label" for="emailLateSubmissions">
                                                    Late submissions
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="emailMissedClasses">
                                                    <label class="form-check-label" for="emailMissedClasses">
                                                    Student absence notifications
                                                    </label>
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="emailAnnouncements" checked>
                                                    <label class="form-check-label" for="emailAnnouncements">
                                                    Department announcements
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label for="digestFrequency" class="form-label">
                                                Email Digest Frequency</label>
                                                <select class="form-select" id="digestFrequency">
                                                    <option selected>Daily</option>
                                                    <option>Weekly</option>
                                                    <option>Never</option>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-primary">
                                                Save Preferences
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
            </div>
        </div>
    </div>
</asp:Content>



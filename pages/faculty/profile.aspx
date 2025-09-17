<%@ Page Title="" Language="C#" MasterPageFile="~/pages/faculty/profile.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="EduErp.pages.faculty.profile1" %>

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
                                Faculty Profile
                            </p>
                        </div>
                        <nav class="nav flex-column">
                            <a class="nav-link text-dark" href="dashboard.aspx"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="courses.aspx"><i class="fas fa-book me-2 text-primary"></i>My Courses </a><a class="nav-link text-dark" href="attendance.aspx"><i class="fas fa-calendar-check me-2 text-primary"></i>Attendance </a><a class="nav-link text-dark" href="timetable.aspx"><i class="fas fa-clock me-2 text-primary"></i>My Timetable </a><a class="nav-link text-dark" href="exams.aspx"><i class="fas fa-file-alt me-2 text-primary"></i>Exams </a><a class="nav-link text-dark" href="students.aspx"><i class="fas fa-users me-2 text-primary"></i>My Students </a><a class="nav-link text-dark" href="notices.aspx"><i class="fas fa-bullhorn me-2 text-primary"></i>Notices </a><a class="nav-link active" href="profile.aspx"><i class="fas fa-user-cog me-2 text-primary"></i>Edit Profile </a>
                        </nav>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="col-md-9 col-lg-10 px-4 py-3">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h2 class="mb-1">Faculty Profile</h2>
                            <p class="text-muted">
                                Manage your faculty account settings
                            </p>
                        </div>
                        <div>
                            <button class="btn btn-outline-secondary" onclick="history.back()">
                                <i class="fas fa-arrow-left me-1"></i>Back
                            </button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 mb-4">
                            <!-- Profile Picture Card -->
                            <div class="card profile-card">
                                <div class="card-body text-center">
                                    <div class="mb-3">
                                        <img src="https://via.placeholder.com/150" alt="Faculty Profile" class="rounded-circle" width="120" height="120">
                                    </div>
                                    <h5 class="card-title">Professor</h5>
                                    <p class="text-muted">
                                        Computer Science
                                    </p>
                                    <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#changePhotoModal">
                                        <i class="fas fa-camera me-1"></i>Change Photo
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <!-- Profile Form -->
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0"><i class="fas fa-user-edit me-2 text-primary"></i>Edit Profile Information </h5>
                                </div>
                                <div class="card-body">
                                    <form id="facultyProfileForm">
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="firstName" class="form-label">
                                                    First Name</label>
                                                <%--<input type="text" class="form-control" id="firstName" value="Dr. Sarah" required>--%>

                                                <asp:TextBox ID="firstname" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="lastName" class="form-label">
                                                    Last Name</label>
                                                <%--<input type="text" class="form-control" id="lastName" value="Johnson" required>--%>
                                                <asp:TextBox ID="lastname" runat="server" class="form-control"></asp:TextBox>    
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="email" class="form-label">
                                                    Email Address</label>
                                                <%--<input type="email" class="form-control" id="email" value="faculty@college.edu" required>--%>
                                                <asp:TextBox ID="email" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="phone" class="form-label">
                                                    Phone Number</label>
                                                <%--<input type="tel" class="form-control" id="phone" value="+1-555-0321">--%>
                                                <asp:TextBox ID="phone" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="department" class="form-label">
                                                    Department</label>
                                                <%--<select class="form-select" id="department">
                                                <option value="computer_science">Computer Science</option>
                                                <option value="engineering">Engineering</option>
                                                <option value="mathematics">Mathematics</option>
                                                <option value="physics">Physics</option>
                                            </select>--%>
                                                <asp:DropDownList ID="department" class="form-select" runat="server"></asp:DropDownList>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="designation" class="form-label">
                                                    Designation</label>
                                              <%--  <select class="form-select" id="designation">
                                                    <option value="professor">Professor</option>
                                                    <option value="associate_professor">Associate Professor</option>
                                                    <option value="assistant_professor">Assistant Professor</option>
                                                    <option value="lecturer">Lecturer</option>
                                                </select>--%>

                                                <asp:DropDownList ID="designation" class="form-select" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="employeeId" class="form-label">
                                                    Employee ID</label>
                                                <input type="text" class="form-control" id="employeeId" value="FAC001" readonly>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="joinDate" class="form-label">
                                                    Join Date</label>
                                                <input type="date" class="form-control" id="joinDate" value="2018-09-01" readonly>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="qualification" class="form-label">
                                                Qualification</label>
                                            <input type="text" class="form-control" id="qualification" value="Ph.D. in Computer Science">
                                        </div>
                                        <div class="mb-3">
                                            <label for="specialization" class="form-label">
                                                Specialization</label>
                                            <input type="text" class="form-control" id="specialization" value="Artificial Intelligence, Machine Learning">
                                        </div>
                                        <div class="mb-3">
                                            <label for="address" class="form-label">
                                                Address</label>
                                            <textarea class="form-control" id="address" rows="3">789 Faculty Street, City, State 12345</textarea>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="officeHours" class="form-label">
                                                    Office Hours</label>
                                                <input type="text" class="form-control" id="officeHours" value="Mon-Fri 10:00 AM - 2:00 PM">
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="officeLocation" class="form-label">
                                                    Office Location</label>
                                                <input type="text" class="form-control" id="officeLocation" value="Room 205, CS Building">
                                            </div>
                                        </div>
                                        <hr class="my-4">
                                        <h6 class="mb-3">Security Settings</h6>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="currentPassword" class="form-label">
                                                    Current Password</label>
                                                <input type="password" class="form-control" id="currentPassword">
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="newPassword" class="form-label">
                                                    New Password</label>
                                                <input type="password" class="form-control" id="newPassword">
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-end gap-2">
                                            <button type="button" class="btn btn-secondary" onclick="history.back()">
                                                Cancel
                                            </button>
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fas fa-save me-1"></i>Save Changes
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>



<%@ Page Title="" Language="C#" MasterPageFile="~/pages/faculty/notices.Master" AutoEventWireup="true" CodeBehind="notices.aspx.cs" Inherits="EduErp.pages.faculty.notices1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
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
                            Faculty Dashboard
                        </p>
                    </div>
                    <nav class="nav flex-column">
                        <a class="nav-link text-dark" href="dashboard.aspx"><i class="fas fa-tachometer-alt me-2 text-primary"></i>Dashboard </a><a class="nav-link text-dark" href="courses.aspx"><i class="fas fa-book me-2 text-primary"></i>My Courses </a><a class="nav-link text-dark" href="attendance.aspx"><i class="fas fa-calendar-check me-2 text-primary"></i>Attendance </a><a class="nav-link text-dark" href="timetable.aspx"><i class="fas fa-clock me-2 text-primary"></i>My Timetable </a><a class="nav-link text-dark" href="exams.aspx"><i class="fas fa-file-alt me-2 text-primary"></i>Exams </a><a class="nav-link text-dark" href="students.aspx"><i class="fas fa-users me-2 text-primary"></i>My Students </a><a class="nav-link active" href="notices.aspx"><i class="fas fa-bullhorn me-2 text-primary"></i>Notices </a><a class="nav-link text-dark" href="profile.aspx"><i class="fas fa-user-cog me-2 text-primary"></i>Edit Profile </a>
                    </nav>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 main-content">
                <!-- Top Navigation -->
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <div>
                        <h1 class="h2">Notice Board</h1>
                        <p class="text-muted">
                            Stay updated with important announcements and manage notices
                        </p>
                    </div>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group me-2">
                            <button type="button" class="btn btn-sm btn-success" data-bs-toggle="modal" data-bs-target="#createNoticeModal">
                                <i class="fas fa-plus me-1"></i>Create Notice
                            </button>
                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                <i class="fas fa-download me-1"></i>Export
                            </button>
                        </div>
                        <div class="dropdown">
                            <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                <i class="fas fa-user me-1"></i>Faculty
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="profile.aspx"><i class="fas fa-user-cog me-2 text-primary"></i>Profile</a></li>
                                <li><a class="dropdown-item" href="settings.aspx"><i class="fas fa-cog me-2 text-primary"></i>Settings</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="../../index.aspx"><i class="fas fa-sign-out-alt me-2 text-primary"></i>Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Filter Buttons -->
                <div class="mb-4">
                    <div class="btn-group" role="group" aria-label="Notice filters">
                        <input type="radio" class="btn-check" name="noticeFilter" id="all" autocomplete="off" checked>
                        <label class="btn btn-outline-primary" for="all">
                            All Notices</label>
                        <input type="radio" class="btn-check" name="noticeFilter" id="urgent" autocomplete="off">
                        <label class="btn btn-outline-danger" for="urgent">
                            Urgent</label>
                        <input type="radio" class="btn-check" name="noticeFilter" id="important" autocomplete="off">
                        <label class="btn btn-outline-warning" for="important">
                            Important</label>
                        <input type="radio" class="btn-check" name="noticeFilter" id="events" autocomplete="off">
                        <label class="btn btn-outline-info" for="events">
                            Events</label>
                        <input type="radio" class="btn-check" name="noticeFilter" id="general" autocomplete="off">
                        <label class="btn btn-outline-success" for="general">
                            General</label>
                        <input type="radio" class="btn-check" name="noticeFilter" id="mynotices" autocomplete="off">
                        <label class="btn btn-outline-secondary" for="mynotices">
                            My Notices</label>
                    </div>
                </div>

                <!-- Notices List -->
                <div class="row">
                    <!-- My Notice -->
                    <div class="col-12 mb-4" data-category="mynotices important">
                        <div class="card notice-card notice-important shadow-sm">
                            <div class="card-header bg-warning">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5 class="card-title mb-0"><i class="fas fa-calculator me-2 text-primary"></i>Advanced Mathematics - Assignment Due </h5>
                                    <div>
                                        <span class="badge bg-dark me-2">MY NOTICE</span> <span class="badge bg-light text-dark">IMPORTANT</span>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <p class="card-text">
                                    <strong>Reminder:</strong> Assignment 3 on Differential Equations is due on December 20, 2024. Please submit your solutions through the online portal. Late submissions will be penalized.
                                </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <small class="text-muted"><i class="fas fa-calendar me-1"></i>Posted: December 10, 2024 | <i class="fas fa-user me-1"></i>By: You | <i class="fas fa-eye me-1"></i>Views: 65 </small>
                                    <div>
                                        <button class="btn btn-sm btn-outline-primary me-2">
                                            <i class="fas fa-edit me-1"></i>Edit
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger">
                                            <i class="fas fa-trash me-1"></i>Delete
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Urgent Notice -->
                    <div class="col-12 mb-4" data-category="urgent">
                        <div class="card notice-card notice-urgent shadow-sm">
                            <div class="card-header bg-danger text-white">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5 class="card-title mb-0"><i class="fas fa-exclamation-triangle me-2 text-primary"></i>URGENT: Faculty Meeting Rescheduled </h5>
                                    <span class="badge bg-light text-dark">URGENT</span>
                                </div>
                            </div>
                            <div class="card-body">
                                <p class="card-text">
                                    <strong>Important Notice:</strong> The faculty meeting scheduled for December 15, 2024, has been rescheduled to December 16, 2024, at 4:00 PM in the Conference Room. Please mark your calendars accordingly.
                                </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <small class="text-muted"><i class="fas fa-calendar me-1"></i>Posted: December 10, 2024 | <i class="fas fa-user me-1"></i>By: Dean's Office </small>
                                    <button class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-eye me-1"></i>View Details
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Important Notice -->
                    <div class="col-lg-6 mb-4" data-category="important">
                        <div class="card notice-card notice-important shadow-sm">
                            <div class="card-header bg-warning">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="card-title mb-0"><i class="fas fa-graduation-cap me-2 text-primary"></i>Semester End Evaluation </h6>
                                    <span class="badge bg-dark">IMPORTANT</span>
                                </div>
                            </div>
                            <div class="card-body">
                                <p class="card-text">
                                    Please complete the semester end evaluation forms by December 22, 2024. Links have been sent to your email.
                                </p>
                                <small class="text-muted"><i class="fas fa-calendar me-1"></i>Posted: December 8, 2024 </small>
                            </div>
                        </div>
                    </div>

                    <!-- My Notice -->
                    <div class="col-lg-6 mb-4" data-category="mynotices general">
                        <div class="card notice-card notice-general shadow-sm">
                            <div class="card-header bg-success text-white">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="card-title mb-0"><i class="fas fa-laptop-code me-2 text-primary"></i>Data Structures Lab Schedule </h6>
                                    <div>
                                        <span class="badge bg-light text-dark me-2">MY NOTICE</span> <span class="badge bg-dark">GENERAL</span>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <p class="card-text">
                                    Extra lab sessions for Data Structures will be conducted on weekends for students who need additional practice.
                                </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <small class="text-muted"><i class="fas fa-calendar me-1"></i>Posted: December 5, 2024 | Views: 78 </small>
                                    <div>
                                        <button class="btn btn-sm btn-outline-primary me-1">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Event Notice -->
                    <div class="col-lg-6 mb-4" data-category="events">
                        <div class="card notice-card notice-event shadow-sm">
                            <div class="card-header bg-info text-white">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="card-title mb-0"><i class="fas fa-calendar-alt me-2 text-primary"></i>Annual Cultural Fest 2024 </h6>
                                    <span class="badge bg-light text-dark">EVENT</span>
                                </div>
                            </div>
                            <div class="card-body">
                                <p class="card-text">
                                    Faculty participation encouraged for the Annual Cultural Fest. Event coordination meeting on December 12, 2024.
                                </p>
                                <small class="text-muted"><i class="fas fa-calendar me-1"></i>Posted: December 3, 2024 </small>
                            </div>
                        </div>
                    </div>

                    <!-- General Notice -->
                    <div class="col-lg-6 mb-4" data-category="general">
                        <div class="card notice-card notice-general shadow-sm">
                            <div class="card-header bg-success text-white">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="card-title mb-0"><i class="fas fa-wifi me-2 text-primary"></i>WiFi Maintenance </h6>
                                    <span class="badge bg-light text-dark">GENERAL</span>
                                </div>
                            </div>
                            <div class="card-body">
                                <p class="card-text">
                                    WiFi maintenance scheduled for December 14, 2024, from 2:00 AM to 6:00 AM. Internet services may be intermittent.
                                </p>
                                <small class="text-muted"><i class="fas fa-calendar me-1"></i>Posted: November 30, 2024 </small>
                            </div>
                        </div>
                    </div>

                    <!-- Important Notice -->
                    <div class="col-lg-6 mb-4" data-category="important">
                        <div class="card notice-card notice-important shadow-sm">
                            <div class="card-header bg-warning">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="card-title mb-0"><i class="fas fa-file-alt me-2 text-primary"></i>Grade Submission Deadline </h6>
                                    <span class="badge bg-dark">IMPORTANT</span>
                                </div>
                            </div>
                            <div class="card-body">
                                <p class="card-text">
                                    All faculty members must submit final grades by December 25, 2024, through the academic portal.
                                </p>
                                <small class="text-muted"><i class="fas fa-calendar me-1"></i>Posted: November 28, 2024 </small>
                            </div>
                        </div>
                    </div>

                    <!-- Event Notice -->
                    <div class="col-lg-6 mb-4" data-category="events">
                        <div class="card notice-card notice-event shadow-sm">
                            <div class="card-header bg-info text-white">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h6 class="card-title mb-0"><i class="fas fa-users me-2 text-primary"></i>Faculty Development Workshop </h6>
                                    <span class="badge bg-light text-dark">EVENT</span>
                                </div>
                            </div>
                            <div class="card-body">
                                <p class="card-text">
                                    Professional development workshop on "Modern Teaching Methodologies" on December 21, 2024, 10:00 AM - 4:00 PM.
                                </p>
                                <small class="text-muted"><i class="fas fa-calendar me-1"></i>Posted: November 25, 2024 </small>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Load More Button -->
                <div class="text-center mt-4">
                    <button class="btn btn-outline-primary">
                        <i class="fas fa-plus me-2 text-primary"></i>Load More Notices
                    </button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <form runat="server">

        <div class="modal fade" id="createNoticeModal" tabindex="-1" aria-labelledby="createNoticeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="createNoticeModalLabel">Create New Notice</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="createNoticeForm">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="noticeTitle" class="form-label">
                                        Notice Title</label>
                                    <%--<input type="text" class="form-control" id="noticeTitle" placeholder="Enter notice title" required>--%>
                                    <asp:TextBox ID="notice_title" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label for="noticePriority" class="form-label">
                                        Priority</label>
<%--                                    <select class="form-select" id="noticeCategory" required>
                                        <option value="">Select Category</option>
                                        <option value="urgent">Urgent</option>
                                        <option value="important">Important</option>
                                        <option value="general">General</option>
                                        <option value="events">Event</option>
                                    </select>--%>
                                    <asp:DropDownList ID="Priority" class="form-select"  runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="noticeContent" class="form-label">
                                    Notice Content</label>
                                <%--<textarea class="form-control" id="noticeContent" rows="5" placeholder="Enter notice content..." required></textarea>--%>
                                <asp:TextBox ID="noticeContent"  class="form-control" Rows="5" runat="server"></asp:TextBox>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="noticeAudience" class="form-label">
                                        Target Audience</label>
                                    <%--<select class="form-select" id="noticeAudience" required>
                                        <option value="">Select Audience</option>
                                        <option value="students">My Students</option>
                                        <option value="faculty">Faculty</option>
                                        <option value="all">Everyone</option>
                                    </select>--%>
                                    <asp:DropDownList ID="Audience" class="form-select" runat="server"></asp:DropDownList>
                                </div>
                                <div class="col-md-6">
                                    <label for="noticeExpiry" class="form-label">
                                        Expiry Date (Optional)</label>
                                    <%--<input type="date" class="form-control" id="noticeExpiry">--%>
                                    <asp:TextBox ID="expiry_date"  class="form-control" TextMode="Date" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                            Cancel
                        </button>
                        <button type="button" class="btn btn-primary">
                            Create Notice
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Filter functionality
            document.querySelectorAll('input[name="noticeFilter"]').forEach(radio => {
                radio.addEventListener('change', function () {
                    const filter = this.id;
                    const noticeCards = document.querySelectorAll('[data-category]');

                    noticeCards.forEach(card => {
                        const cardParent = card;
                        if (filter === 'all') {
                            cardParent.style.display = 'block';
                        } else {
                            const categories = card.dataset.category.split(' ');
                            const isMatch = categories.includes(filter);
                            cardParent.style.display = isMatch ? 'block' : 'none';
                        }
                    });
                });
            });
        </script>
        <script src="../../assets/js/common.js"></script>
    </form>
</asp:Content>




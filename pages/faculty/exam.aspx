<%@ Page Title="" Language="C#" MasterPageFile="~/pages/faculty/exams.Master" AutoEventWireup="true" CodeBehind="exam.aspx.cs" Inherits="EduErp.pages.faculty.exam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <form runat="server">
        <div class="modal fade" id="createExamModal" tabindex="-1" aria-labelledby="createExamModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="createExamModalLabel">Create New Exam</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="examCourse" class="form-label">
                                    Course</label>
                                <select class="form-select" id="examCourse" required>
                                    <option value="">Select Course</option>
                                    <option value="math">Advanced Mathematics</option>
                                    <option value="physics">Quantum Physics</option>
                                    <option value="cs">Data Structures</option>
                                    <option value="ml">Machine Learning</option>
                                    <option value="db">Database Systems</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="examType" class="form-label">
                                    Exam Type</label>
                                <select class="form-select" id="examType" required>
                                    <option value="">Select Type</option>
                                    <option value="midterm">Midterm</option>
                                    <option value="final">Final</option>
                                    <option value="quiz">Quiz</option>
                                    <option value="assignment">Assignment</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="examDate" class="form-label">
                                    Exam Date</label>
                                <asp:Calendar ID="ExamDate" runat="server"></asp:Calendar>

                            </div>
                            <div class="col-md-6">
                                <label for="examTime" class="form-label">
                                    Exam Time</label>

                                <asp:TextBox ID="ExamTime" runat="server" TextMode="Time" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="examDuration" class="form-label">
                                    Duration (hours)</label>
                                <asp:TextBox ID="examDuration" runat="server" TextMode="Number" CssClass="form-control" min="1" max="5"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label for="examRoom" class="form-label">
                                    Room</label>
                                <asp:TextBox ID="examRoom" runat="server" CssClass="form-control" placeholder="e.g., Hall A-101"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RoomValidator" runat="server"
                                    ControlToValidate="examRoom"
                                    ErrorMessage="Please enter room number" />
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="examInstructions" class="form-label">
                                Instructions</label>
                            <<asp:TextBox ID="examInstructions" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="Enter exam instructions..."></asp:TextBox>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClientClick="return false;" />
                        <asp:Button ID="btnCreateExam" runat="server" Text="Create Exam" CssClass="btn btn-primary" OnClick="btnCreateExam_Click" />
                    </div>
                </div>
            </div>
        </div>  
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../assets/js/common.js"></script>

</asp:Content>


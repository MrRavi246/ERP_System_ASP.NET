using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace EduErp.pages.student
{
    public partial class dashboard : System.Web.UI.MasterPage
    {
        string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] == null)
                {
                    Response.Redirect("~/index.aspx");
                    return;
                }

                LoadStudentWidgets();
            }
        }

        void LoadStudentWidgets()
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            using (SqlConnection conn = new SqlConnection(conString))
            {
                conn.Open();

                // Get student profile
                string sql = "SELECT id, first_name, last_name FROM students WHERE user_id = " + userId;
                using (SqlDataAdapter dda = new SqlDataAdapter(sql, conn))
                {
                    DataSet dss = new DataSet();
                    dda.Fill(dss);
                    if (dss.Tables[0].Rows.Count == 0)
                    {
                        litGPA.Text = "-";
                        litCourses.Text = "0";
                        litAttendance.Text = "-";
                        litFees.Text = "-";
                        litRecentActivities.Text = "<div class='list-group-item'>No recent activity</div>";
                        litUpcomingEvents.Text = "<div class='list-group-item'>No upcoming events</div>";
                        return;
                    }

                    int studentId = Convert.ToInt32(dss.Tables[0].Rows[0]["id"]);
                    string studentName = dss.Tables[0].Rows[0]["first_name"].ToString() + " " + dss.Tables[0].Rows[0]["last_name"].ToString();
                    litStudentName.Text = HttpUtility.HtmlEncode(studentName);

                    // Courses enrolled
                    string qCourses = "SELECT COUNT(*) FROM student_enrollments WHERE student_id = " + studentId + " AND status = 'Enrolled'";
                    using (SqlCommand cCourses = new SqlCommand(qCourses, conn))
                    {
                        object rc = cCourses.ExecuteScalar();
                        int courses = 0; int.TryParse(rc.ToString(), out courses);
                        litCourses.Text = courses.ToString();
                    }

                    // Attendance
                    string qAttend = "SELECT SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END) as present_count, COUNT(*) as total_count FROM attendance WHERE student_id = " + studentId;
                    using (SqlDataAdapter daAttend = new SqlDataAdapter(qAttend, conn))
                    {
                        DataSet dAttend = new DataSet();
                        daAttend.Fill(dAttend);
                        double attendancePct = 0;
                        if (dAttend.Tables[0].Rows.Count > 0)
                        {
                            int present = 0; int total = 0;
                            int.TryParse(dAttend.Tables[0].Rows[0]["present_count"].ToString(), out present);
                            int.TryParse(dAttend.Tables[0].Rows[0]["total_count"].ToString(), out total);
                            if (total > 0) attendancePct = Math.Round(((double)present / total) * 100.0, 0);
                        }
                        litAttendance.Text = (attendancePct > 0) ? attendancePct.ToString("F0") + "%" : "-";
                    }

                    // Fees due
                    string qFees = "SELECT ISNULL(SUM(amount_due - amount_paid),0) FROM student_fees WHERE student_id = " + studentId;
                    using (SqlCommand cFees = new SqlCommand(qFees, conn))
                    {
                        object feesObj = cFees.ExecuteScalar();
                        decimal feesDue = 0; decimal.TryParse(feesObj.ToString(), out feesDue);
                        litFees.Text = (feesDue > 0) ? ("₹" + feesDue.ToString("N2")) : "₹0.00";
                    }

                    // GPA (simple)
                    string qGpa = "SELECT AVG(CAST(marks_obtained AS FLOAT)) FROM exam_results WHERE student_id = " + studentId;
                    using (SqlCommand cGpa = new SqlCommand(qGpa, conn))
                    {
                        object avgObj = cGpa.ExecuteScalar();
                        double avgMarks = 0; if (avgObj != DBNull.Value && avgObj != null) double.TryParse(avgObj.ToString(), out avgMarks);
                        double gpa = 0; if (avgMarks > 0) gpa = Math.Round((avgMarks / 25.0), 2);
                        litGPA.Text = (gpa > 0) ? gpa.ToString("F2") : "-";
                    }

                    // Recent activities - attendance
                    StringBuilder acts = new StringBuilder();
                    string qRecentAttend = "SELECT TOP 4 a.class_date, c.course_name, a.status FROM attendance a JOIN courses c ON a.course_id = c.id WHERE a.student_id = " + studentId + " ORDER BY a.marked_at DESC";
                    using (SqlDataAdapter daRecent = new SqlDataAdapter(qRecentAttend, conn))
                    {
                        DataSet dsRecent = new DataSet();
                        daRecent.Fill(dsRecent);
                        for (int i = 0; i < dsRecent.Tables[0].Rows.Count; i++)
                        {
                            DateTime cls = Convert.ToDateTime(dsRecent.Tables[0].Rows[i]["class_date"]);
                            string course = dsRecent.Tables[0].Rows[i]["course_name"].ToString();
                            string status = dsRecent.Tables[0].Rows[i]["status"].ToString();
                            acts.Append("<div class='list-group-item d-flex justify-content-between align-items-start'>");
                            acts.Append("<div class='ms-2 me-auto'><div class='fw-bold'>" + HttpUtility.HtmlEncode(course) + "</div>");
                            acts.Append("<small class='text-muted'>" + cls.ToString("MMM dd, yyyy") + " - " + HttpUtility.HtmlEncode(status) + "</small></div>");
                            acts.Append("<span class='badge bg-info rounded-pill'>" + HttpUtility.HtmlEncode(status) + "</span>");
                            acts.Append("</div>");
                        }
                    }

                    // If fewer, supplement with fee payments
                    if (acts.Length < 10)
                    {
                        string qPayments = "SELECT TOP 4 fp.payment_date, fs.name, fp.payment_amount FROM fee_payments fp JOIN student_fees sf ON fp.student_fee_id = sf.id JOIN fee_structures fs ON sf.fee_structure_id = fs.id WHERE sf.student_id = " + studentId + " ORDER BY fp.payment_date DESC";
                        using (SqlDataAdapter daPay = new SqlDataAdapter(qPayments, conn))
                        {
                            DataSet dsPay = new DataSet();
                            daPay.Fill(dsPay);
                            for (int i = 0; i < dsPay.Tables[0].Rows.Count; i++)
                            {
                                DateTime pd = Convert.ToDateTime(dsPay.Tables[0].Rows[i]["payment_date"]);
                                string fname = dsPay.Tables[0].Rows[i][1].ToString();
                                string amt = dsPay.Tables[0].Rows[i][2].ToString();
                                acts.Append("<div class='list-group-item d-flex justify-content-between align-items-start'>");
                                acts.Append("<div class='ms-2 me-auto'><div class='fw-bold'>Payment: " + HttpUtility.HtmlEncode(fname) + "</div>");
                                acts.Append("<small class='text-muted'>" + pd.ToString("MMM dd, yyyy") + "</small></div>");
                                acts.Append("<span class='badge bg-success rounded-pill'>₹" + HttpUtility.HtmlEncode(amt) + "</span>");
                                acts.Append("</div>");
                            }
                        }
                    }

                    litRecentActivities.Text = (acts.Length > 0) ? acts.ToString() : "<div class='list-group-item'>No recent activity</div>";

                    // Upcoming events
                    StringBuilder events = new StringBuilder();
                    string qEvents = "SELECT TOP 4 title, start_date FROM notices WHERE is_active = 1 AND (target_audience = 'All' OR target_audience = 'Students') AND start_date >= CONVERT(date, GETDATE()) ORDER BY start_date";
                    using (SqlDataAdapter daEvents = new SqlDataAdapter(qEvents, conn))
                    {
                        DataSet dsEvents = new DataSet();
                        daEvents.Fill(dsEvents);
                        for (int i = 0; i < dsEvents.Tables[0].Rows.Count; i++)
                        {
                            string title = dsEvents.Tables[0].Rows[i]["title"].ToString();
                            DateTime sd = Convert.ToDateTime(dsEvents.Tables[0].Rows[i]["start_date"]);
                            events.Append("<div class='list-group-item d-flex justify-content-between align-items-start'>");
                            events.Append("<div class='ms-2 me-auto'><div class='fw-bold'>" + HttpUtility.HtmlEncode(title) + "</div>");
                            events.Append("<small class='text-muted'>" + sd.ToString("MMM dd, yyyy") + "</small></div>");
                            events.Append("<span class='badge bg-primary rounded-pill'>Event</span>");
                            events.Append("</div>");
                        }
                    }

                    litUpcomingEvents.Text = (events.Length > 0) ? events.ToString() : "<div class='list-group-item'>No upcoming events</div>";

                    // Build chart data: performance by semester
                    StringBuilder perfLabels = new StringBuilder();
                    StringBuilder perfData = new StringBuilder();
                    string qPerf = "SELECT semester, AVG(CAST(marks_obtained AS FLOAT)) as avg_marks FROM exam_results WHERE student_id = " + studentId + " GROUP BY semester ORDER BY semester";
                    using (SqlDataAdapter daPerf = new SqlDataAdapter(qPerf, conn))
                    {
                        DataSet dsPerf = new DataSet();
                        daPerf.Fill(dsPerf);
                        for (int i = 0; i < dsPerf.Tables[0].Rows.Count; i++)
                        {
                            if (i > 0) { perfLabels.Append(","); perfData.Append(","); }
                            perfLabels.Append("'" + dsPerf.Tables[0].Rows[i]["semester"].ToString().Replace("'","\'") + "'");
                            double avg = 0; double.TryParse(dsPerf.Tables[0].Rows[i]["avg_marks"].ToString(), out avg);
                            // convert avg marks to gpa-like value
                            double g = Math.Round((avg / 25.0), 2);
                            perfData.Append(g.ToString(System.Globalization.CultureInfo.InvariantCulture));
                        }
                    }

                    // Course distribution
                    StringBuilder courseLabels = new StringBuilder();
                    StringBuilder courseData = new StringBuilder();
                    string qCourseDist = "SELECT c.course_name, COUNT(*) as cnt FROM student_enrollments se JOIN courses c ON se.course_id = c.id WHERE se.student_id = " + studentId + " GROUP BY c.course_name";
                    using (SqlDataAdapter daCourse = new SqlDataAdapter(qCourseDist, conn))
                    {
                        DataSet dsCourse = new DataSet();
                        daCourse.Fill(dsCourse);
                        for (int i = 0; i < dsCourse.Tables[0].Rows.Count; i++)
                        {
                            if (i > 0) { courseLabels.Append(","); courseData.Append(","); }
                            courseLabels.Append("'" + dsCourse.Tables[0].Rows[i]["course_name"].ToString().Replace("'","\'") + "'");
                            courseData.Append(dsCourse.Tables[0].Rows[i]["cnt"].ToString());
                        }
                    }

                    // Emit JS variables into litPerfScript and litCourseScript
                    StringBuilder sPerf = new StringBuilder();
                    sPerf.Append("<script>");
                    sPerf.Append("var perfLabels = [" + (perfLabels.Length > 0 ? perfLabels.ToString() : "'Sem 1','Sem 2'") + "];\n");
                    sPerf.Append("var perfData = [" + (perfData.Length > 0 ? perfData.ToString() : "3.2,3.5") + "];\n");
                    sPerf.Append("</script>");
                    litPerfScript.Text = sPerf.ToString();

                    StringBuilder sCourse = new StringBuilder();
                    sCourse.Append("<script>");
                    sCourse.Append("var courseLabels = [" + (courseLabels.Length > 0 ? courseLabels.ToString() : "'Math','CS'") + "];\n");
                    sCourse.Append("var courseData = [" + (courseData.Length > 0 ? courseData.ToString() : "25,75") + "];\n");
                    sCourse.Append("</script>");
                    litCourseScript.Text = sCourse.ToString();
                }
            }
        }
    }
}
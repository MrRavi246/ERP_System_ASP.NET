using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduErp.pages.admin
{
    public partial class attendance1 : System.Web.UI.Page
    {
        String s = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillCourses();
                fillPeriods();
                // auto-open from timetable link: attendance.aspx?courseId=123&periodId=456[&date=yyyy-MM-dd]
                string qCourse = Request.QueryString["courseId"];
                string qPeriod = Request.QueryString["periodId"];
                string qDate = Request.QueryString["date"];
                if (!string.IsNullOrEmpty(qCourse))
                {
                    var it = course_attendance.Items.FindByValue(qCourse);
                    if (it != null) course_attendance.SelectedValue = qCourse;
                }
                if (!string.IsNullOrEmpty(qPeriod))
                {
                    var it2 = period_select.Items.FindByValue(qPeriod);
                    if (it2 != null) period_select.SelectedValue = qPeriod;
                }
                if (!string.IsNullOrEmpty(qDate))
                {
                    class_date.Text = qDate;
                }
                else
                {
                    // default to today
                    class_date.Text = DateTime.Now.ToString("yyyy-MM-dd");
                }

                if (!string.IsNullOrEmpty(qCourse) && !string.IsNullOrEmpty(qPeriod))
                {
                    // auto-load students
                    btnLoadStudents_Click(null, null);
                }
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void fillCourses()
        {
            getcon();
            da = new SqlDataAdapter("select id, course_code + ' - ' + course_name as name from courses where is_active = 1", con);
            ds = new DataSet();
            da.Fill(ds);

            course_attendance.Items.Clear();
            course_attendance.Items.Add(new ListItem("Select Course", "0"));
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string id = ds.Tables[0].Rows[i][0].ToString();
                string name = ds.Tables[0].Rows[i][1].ToString();
                course_attendance.Items.Add(new ListItem(name, id));
            }
            con.Close();
        }

        void fillPeriods()
        {
            getcon();
            da = new SqlDataAdapter("select id, day_of_week + ' ' + CONVERT(varchar(5), start_time, 108) + '-' + CONVERT(varchar(5), end_time, 108) as name from class_periods where is_active = 1", con);
            ds = new DataSet();
            da.Fill(ds);

            period_select.Items.Clear();
            period_select.Items.Add(new ListItem("Select Period", "0"));
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                period_select.Items.Add(new ListItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString()));
            }
            con.Close();
        }

        protected void btnLoadStudents_Click(object sender, EventArgs e)
        {
            string courseId = course_attendance.SelectedValue;
            string periodId = period_select.SelectedValue;
            string date = class_date.Text;

            if (courseId == "0" || periodId == "0" || string.IsNullOrEmpty(date))
            {
                // nothing selected - just clear grid
                studentAttendanceGrid.DataSource = null;
                studentAttendanceGrid.DataBind();
                return;
            }

            getcon();
            // get enrolled students and any existing attendance for that date/period
            string sql = "select s.id as student_id, s.roll_number as roll_no, s.first_name + ' ' + s.last_name as student_name, ISNULL(a.status, '') as current_status "
                + "from student_enrollments se "
                + "join students s on se.student_id = s.id "
                + "left join attendance a on a.student_id = s.id and a.course_id = se.course_id and a.class_date = '" + date + "' and a.period_id = " + periodId + " "
                + "where se.course_id = " + courseId + " and se.status = 'Enrolled'";

            da = new SqlDataAdapter(sql, con);
            ds = new DataSet();
            da.Fill(ds);

            studentAttendanceGrid.DataSource = ds;
            studentAttendanceGrid.DataBind();

            // store student list for save
            ViewState["attendanceStudents"] = ds.Tables[0];

            con.Close();
        }

        protected void btnSaveAttendance_Click(object sender, EventArgs e)
        {
            string courseId = course_attendance.SelectedValue;
            string periodId = period_select.SelectedValue;
            string date = class_date.Text;

            if (courseId == "0" || periodId == "0" || string.IsNullOrEmpty(date))
            {
                return;
            }

            DataTable students = ViewState["attendanceStudents"] as DataTable;
            if (students == null)
            {
                return;
            }

            getcon();
            // simple style: delete existing and insert new for each student
            for (int i = 0; i < students.Rows.Count; i++)
            {
                string studentId = students.Rows[i]["student_id"].ToString();
                string formName = "att_" + studentId;
                string status = Request.Form[formName];
                if (string.IsNullOrEmpty(status))
                {
                    status = "Absent"; // default to Absent if not selected
                }

                // remove old record if exists (avoid unique constraint)
                string del = "DELETE FROM attendance WHERE student_id = " + studentId + " AND course_id = " + courseId + " AND class_date = '" + date + "' AND period_id = " + periodId;
                cmd = new SqlCommand(del, con);
                cmd.ExecuteNonQuery();

                // insert new record
                // note: using non-parameterized SQL per project style
                string insert = "INSERT INTO attendance(student_id, course_id, faculty_id, class_date, period_id, status, remarks, marked_by) VALUES(" + studentId + "," + courseId + ",1,'" + date + "'," + periodId + ", '" + status + "', NULL, 1)";
                cmd = new SqlCommand(insert, con);
                cmd.ExecuteNonQuery();
            }

            con.Close();

            // refresh grid to show saved statuses
            btnLoadStudents_Click(null, null);
        }

        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select course_code,course_name,description,credits,semester,year_level from courses", con);
            ds = new DataSet();
            da.Fill(ds);

            //GridView1.DataSource = ds;
            //GridView1.DataBind();
            //con.Close();

        }
    }
}
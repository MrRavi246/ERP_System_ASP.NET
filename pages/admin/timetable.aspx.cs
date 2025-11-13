using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.UI.HtmlControls;

namespace EduErp.pages.admin
{
    public partial class timetable1 : System.Web.UI.Page
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
                fillModalLists();
                renderTimetable();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillModalLists()
        {
            getcon();
            // courses
            da = new SqlDataAdapter("select id, course_code + ' - ' + course_name as name from courses where is_active = 1", con);
            ds = new DataSet();
            da.Fill(ds);
            scheduleCourse.Items.Clear();
            scheduleCourse.Items.Add(new ListItem("Select Course", "0"));
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                scheduleCourse.Items.Add(new ListItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString()));
            }

            // instructors
            da = new SqlDataAdapter("select id, first_name + ' ' + last_name as name from faculty where is_active = 1", con);
            ds = new DataSet();
            da.Fill(ds);
            scheduleInstructor.Items.Clear();
            scheduleInstructor.Items.Add(new ListItem("Select Instructor", "0"));
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                scheduleInstructor.Items.Add(new ListItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString()));
            }

            con.Close();
        }

        protected void add_schedule_Click(object sender, EventArgs e)
        {
            string courseId = scheduleCourse.SelectedValue;
            string day = scheduleDay.SelectedValue;
            string st = startTime.Text;
            string et = endTime.Text;
            string instructorId = scheduleInstructor.SelectedValue;
            string room = scheduleRoom.Text.Replace("'", "''");

            if (courseId == "0" || string.IsNullOrEmpty(day) || string.IsNullOrEmpty(st) || string.IsNullOrEmpty(et))
            {
                return; // minimal validation
            }

            getcon();
            // use a simple academic year and semester default to satisfy NOT NULL columns
            string acad = DateTime.Now.Year + "-" + (DateTime.Now.Year + 1);
            string semester = "Fall";

            string insert = "INSERT INTO class_periods(course_id, faculty_id, day_of_week, start_time, end_time, room_number, academic_year, semester, is_active) VALUES("
                + courseId + "," + (instructorId == "0" ? "NULL" : instructorId) + ", '" + day + "', '" + st + "', '" + et + "', '" + room + "', '" + acad + "', '" + semester + "', 1)";

            // execute insert and return new id
            cmd = new SqlCommand(insert + "; SELECT SCOPE_IDENTITY();", con);
            object o = cmd.ExecuteScalar();
            int newPeriodId = 0;
            if (o != null)
            {
                int.TryParse(o.ToString(), out newPeriodId);
            }
            con.Close();

            // refresh modal lists and timetable
            fillModalLists();
            renderTimetable();

            // mark server-rendered timetable so client won't overwrite
            try { timetableBody.Attributes["data-server"] = "1"; } catch { }

            // register startup script: hide modal, show toast, highlight new slot
            // build script safely by injecting the numeric id into the selector (avoid nested + operators)
            string script = "(function(){ var m = document.getElementById('addScheduleModal'); if (m) { var modal = bootstrap.Modal.getInstance(m) || new bootstrap.Modal(m); modal.hide(); } ";
            script += "if (typeof showToast === 'function') { showToast('Schedule added successfully'); } ";
            script += "var pid = '" + newPeriodId + "'; ";
            script += "if(pid && typeof highlightPeriod === 'function'){ highlightPeriod(pid); } ";
            script += "else if(pid){ var el = document.querySelector('[data-period-id=\'" + newPeriodId + "\']'); if(el){ el.scrollIntoView({behavior:'smooth', block:'center'}); el.classList.add('highlighted-slot'); setTimeout(function(){ el.classList.remove('highlighted-slot'); }, 4000); } }})();";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scheduleAdded", script, true);

        }

        void renderTimetable()
        {
            getcon();
            // get distinct time slots
            da = new SqlDataAdapter("select distinct start_time, end_time from class_periods where is_active = 1 order by start_time", con);
            ds = new DataSet();
            da.Fill(ds);

            StringBuilder sb = new StringBuilder();
            string[] days = new string[] { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" };

            for (int r = 0; r < ds.Tables[0].Rows.Count; r++)
            {
                string st = ds.Tables[0].Rows[r][0].ToString();
                string et = ds.Tables[0].Rows[r][1].ToString();
                sb.AppendLine("<tr>");
                sb.AppendLine("<td class=\"timetable-time\">" + st + " - " + et + "</td>");

                for (int d = 0; d < days.Length; d++)
                {
                    string day = days[d];
                    string sql = "select top 1 cp.id as period_id, c.course_code + ' - ' + c.course_name as course_name, f.first_name + ' ' + f.last_name as instructor, cp.room_number, cp.course_id "
                        + "from class_periods cp join courses c on cp.course_id = c.id left join faculty f on cp.faculty_id = f.id "
                        + "where cp.day_of_week = '" + day + "' and cp.start_time = '" + st + "' and cp.end_time = '" + et + "' and cp.is_active = 1";

                    da = new SqlDataAdapter(sql, con);
                    DataSet ds2 = new DataSet();
                    da.Fill(ds2);

                    if (ds2.Tables[0].Rows.Count > 0)
                    {
                        var row = ds2.Tables[0].Rows[0];
                        string periodId = row[0].ToString();
                        string courseName = row[1].ToString();
                        string instr = row[2].ToString();
                        string room = row[3].ToString();
                        string courseId = row[4].ToString();

                        sb.AppendLine("<td>");
                        sb.AppendLine("<div class=\"course-slot-inner\" data-period-id=\"" + periodId + "\">");
                        sb.AppendLine("<div class=\"fw-bold\">" + courseName + "</div>");
                        sb.AppendLine("<div class=\"small text-muted\">" + instr + " | " + room + "</div>");
                        sb.AppendLine("<div class=\"mt-1\"><a class=\"btn btn-sm btn-outline-primary\" data-period-id=\"" + periodId + "\" href=\"attendance.aspx?courseId=" + courseId + "&periodId=" + periodId + "\">Mark Attendance</a></div>");
                        sb.AppendLine("</div>");
                        sb.AppendLine("</td>");
                    }
                    else
                    {
                        sb.AppendLine("<td></td>");
                    }
                }

                sb.AppendLine("</tr>");
            }

            timetableBody.InnerHtml = sb.ToString();

        }
    }
}
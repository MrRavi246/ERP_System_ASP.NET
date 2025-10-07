using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EduErp.pages.admin
{
    public partial class dashboard1 : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        protected string TotalStudents { get; set; }
        protected string TotalFaculty { get; set; }
        protected string TotalCourses { get; set; }
        protected string TotalRevenue { get; set; }
        protected string RecentStudents { get; set; }
        protected string RecentNotices { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcon();
                LoadDashboardData();
                con.Close();
            }
        }

        void getcon()
        {
            con = new SqlConnection(conString);
            con.Open();
        }

        void LoadDashboardData()
        {
            GetTotalStudents();
            GetTotalFaculty();
            GetTotalCourses();
            GetTotalRevenue();
            GetRecentActivities();
            GetRecentNotices();
        }

        void GetTotalStudents()
        {
            string query = "SELECT COUNT(*) FROM students WHERE status = 'Active'";
            cmd = new SqlCommand(query, con);
            object result = cmd.ExecuteScalar();
            TotalStudents = result.ToString();
        }

        void GetTotalFaculty()
        {
            string query = "SELECT COUNT(*) FROM faculty WHERE is_active = 1";
            cmd = new SqlCommand(query, con);
            object result = cmd.ExecuteScalar();
            TotalFaculty = result.ToString();
        }

        void GetTotalCourses()
        {
            string query = "SELECT COUNT(*) FROM courses WHERE is_active = 1";
            cmd = new SqlCommand(query, con);
            object result = cmd.ExecuteScalar();
            TotalCourses = result.ToString();
        }

        void GetTotalRevenue()
        {
            string query = "SELECT ISNULL(SUM(amount_paid), 0) FROM student_fees";
            cmd = new SqlCommand(query, con);
            object result = cmd.ExecuteScalar();
            decimal revenue = Convert.ToDecimal(result);
            TotalRevenue = "₹" + revenue.ToString("N0");
        }

        void GetRecentActivities()
        {
            string query = "SELECT TOP 4 first_name + ' ' + last_name as student_name, created_at FROM students ORDER BY created_at DESC";
            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);
            
            string activities = "";
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string studentName = ds.Tables[0].Rows[i]["student_name"].ToString();
                DateTime createdDate = Convert.ToDateTime(ds.Tables[0].Rows[i]["created_at"]);
                string timeAgo = GetTimeAgo(createdDate);
                
                activities += "<div class='list-group-item d-flex justify-content-between align-items-start'>";
                activities += "<div class='ms-2 me-auto'>";
                activities += "<div class='fw-bold'>New student registration: " + studentName + "</div>";
                activities += "<small class='text-muted'>" + timeAgo + "</small>";
                activities += "</div>";
                activities += "<span class='badge bg-success rounded-pill'>New</span>";
                activities += "</div>";
            }
            RecentStudents = activities;
        }

        void GetRecentNotices()
        {
            string query = "SELECT TOP 4 title, start_date FROM notices WHERE is_active = 1 ORDER BY created_at DESC";
            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);
            
            string notices = "";
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string title = ds.Tables[0].Rows[i]["title"].ToString();
                DateTime startDate = Convert.ToDateTime(ds.Tables[0].Rows[i]["start_date"]);
                string dateText = startDate.ToString("MMM dd, yyyy");
                
                notices += "<div class='list-group-item d-flex justify-content-between align-items-start'>";
                notices += "<div class='ms-2 me-auto'>";
                notices += "<div class='fw-bold'>" + title + "</div>";
                notices += "<small class='text-muted'>" + dateText + "</small>";
                notices += "</div>";
                notices += "<span class='badge bg-primary rounded-pill'>Event</span>";
                notices += "</div>";
            }
            RecentNotices = notices;
        }

        string GetTimeAgo(DateTime dateTime)
        {
            TimeSpan timeDiff = DateTime.Now - dateTime;
            if (timeDiff.TotalMinutes < 60)
                return (int)timeDiff.TotalMinutes + " minutes ago";
            else if (timeDiff.TotalHours < 24)
                return (int)timeDiff.TotalHours + " hours ago";
            else
                return (int)timeDiff.TotalDays + " days ago";
        }
    }
}
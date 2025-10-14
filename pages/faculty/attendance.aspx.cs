using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduErp.pages.faculty
{
    public partial class attendance1 : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/index.aspx");
            }

            fill_department();
            getcon();
            fill_student_attendance_grid();
            fill_presentCount();
        }
        void getcon()
        {
            con = new SqlConnection(conString);
            con.Open();
        }
        void fill_department()
        {
            getcon();
            da = new SqlDataAdapter("select course_name from courses", con);
            ds = new DataSet();
            da.Fill(ds);

            atten_department.Items.Add("Select Department");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                atten_department.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        void fill_student_attendance_grid()
        {
            getcon();
            string query = @"SELECT 
                        a.id, 
                        s.first_name + ' ' + s.last_name AS student_name, 
                        a.status, 
                        a.remarks 
                     FROM attendance AS a INNER JOIN Students AS s ON a.student_id = s.id";

            //da = new SqlDataAdapter("select id , student_id , status,remarks from attendance", con);
            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            student_attendance.DataSource= ds;
            student_attendance.DataBind();
        }

        void fill_presentCount()
        {
            getcon();
            da = new SqlDataAdapter("SELECT status, COUNT(*) AS total_count FROM attendance WHERE status IN ('Present', 'Absent', 'Late') GROUP BY status", con);
            ds = new DataSet();
            da.Fill(ds);

            int present = 0, absent = 0, late = 0;

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                string status = row["status"].ToString();
                int count = Convert.ToInt32(row["total_count"]);

                if (status == "Present")
                    present = count;
                else if (status == "Absent")
                    absent = count;
                else if (status == "Late")
                    late = count;
            }

            presentCount.Text = present.ToString();
            absentCount.Text = absent.ToString();
            lateCount.Text = late.ToString();
        }
    }
}
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
            fill_department();
            getcon();
            fill_student_attendance_grid();
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
            da = new SqlDataAdapter("select id , student_id , status,remarks from attendance", con);
            ds = new DataSet();
            da.Fill(ds);

            student_attendance.DataSource= ds;
            student_attendance.DataBind();

        }
    }
}
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
            getcon();
            filldepartment_course();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void filldepartment_course()
        {
            getcon();
            da = new SqlDataAdapter("select name from departments", con);
            ds = new DataSet();
            da.Fill(ds);

            course_attendance.Items.Add("Select Department");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                course_attendance.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
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
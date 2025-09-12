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
    public partial class courses1 : System.Web.UI.Page
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
            fillInstructor_course();
            //fillcourse_status();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillInstructor_course()
        {
            getcon();
            da = new SqlDataAdapter("select first_name from faculty", con);
            ds = new DataSet();
            da.Fill(ds);

            instructor_course.Items.Add("Select Instructor");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                instructor_course.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        //void fillcourse_status()
        //{
        //    getcon();
        //    da = new SqlDataAdapter("select is_active from courses", con);
        //    ds = new DataSet();
        //    da.Fill(ds);

        //    course_status.Items.Add("Select Status");

        //    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        //    {
        //        course_status.Items.Add(ds.Tables[0].Rows[i][0].ToString());
        //    }
        //}

        void filldepartment_course()
        {
            getcon();
            da = new SqlDataAdapter("select name from departments", con);
            ds = new DataSet();
            da.Fill(ds);

            department.Items.Add("Select Department");
            department2.Items.Add("Select Department");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                department.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                department2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}
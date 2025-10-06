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
    public partial class exam : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            fill_course();
            fill_exam_type();
        }

        void getcon()
        {
            con=new SqlConnection(conString);
            con.Open();
        }

        void fill_course()
        {
            getcon();
            da = new SqlDataAdapter("select course_name from courses", con);
            ds = new DataSet();
            da.Fill(ds);

            course_exam.Items.Add("Select Course");

            for(int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                course_exam.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        void fill_exam_type()
        {
            getcon();
            da = new SqlDataAdapter("select name from exam_types", con);
            ds = new DataSet();
            da.Fill(ds);

            exam_type.Items.Add("Select Course Types");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                exam_type.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }
        protected void btnCreateExam_Click(object sender, EventArgs e)
        {

        }
    }
}
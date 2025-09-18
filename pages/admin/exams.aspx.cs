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
    public partial class exams1 : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            filldepartment();
            fillExamType();
            fillGrade();
        }
        void getcon()
        {
            con = new SqlConnection(conString);
            con.Open();
        }

        void fillGrade()
        {
            getcon();
            da = new SqlDataAdapter("select grade from exam_results", con);
            ds = new DataSet();
            da.Fill(ds);

            txt_grade.Items.Add("Select Grade");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                txt_grade.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }
        void fillExamType()
        {
            getcon();
            da = new SqlDataAdapter("select name from exam_types", con);
            ds = new DataSet();
            da.Fill(ds);

            txt_ExamType.Items.Add("Select Exam Type");
            txt_ExamType_2.Items.Add("Select Exam Type");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                txt_ExamType.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                txt_ExamType_2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }
        void filldepartment()
        {
            getcon();
            da = new SqlDataAdapter("select name from departments", con);
            ds = new DataSet();
            da.Fill(ds);

            txt_department.Items.Add("Select Department");
            txt_department_2.Items.Add("Select Department");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                txt_department.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                txt_department_2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }
    }
}
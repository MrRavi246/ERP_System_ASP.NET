using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.Shared;
using System.IO;
using CrystalDecisions.CrystalReports.Engine;

namespace EduErp.pages.faculty
{
    public partial class courses1 : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        private CrystalDecisions.CrystalReports.Engine.ReportDocument cr = new ReportDocument();
        static string Crypath = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/index.aspx");
            }

            getcon();
            fill_total_course();
            fill_totale_student();
        }

        void getcon()
        {
            con = new SqlConnection(conString);
            con.Open();
        }

        void fill_total_course()
        {
            getcon();
            da = new SqlDataAdapter("select count(id) from courses", con);
            ds = new DataSet();
            da.Fill(ds);
            total_course.Text = ds.Tables[0].Rows[0][0].ToString();
        }

        void fill_totale_student()
        {
            getcon();
            da = new SqlDataAdapter("select count(id) from students", con);
            ds = new DataSet();
            da.Fill(ds);
            totale_student.Text = ds.Tables[0].Rows[0][0].ToString();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from courses", con);
            ds = new DataSet();
            da.Fill(ds);


            string path = Server.MapPath("~/pages/faculty/course_CrystalReport1.rpt");

            cr.Load(path);

            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "User_Report");


        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;

namespace EduErp.pages.admin
{
    public partial class reports1 : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        private CrystalDecisions.CrystalReports.Engine.ReportDocument cr = new ReportDocument();
        static string path = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            filldepartment();
        }
        void getcon()
        {
            con = new SqlConnection(conString);
            con.Open();
        }

        void filldepartment()
        {
            da = new SqlDataAdapter("select name from departments", con);
            ds = new DataSet();
            da.Fill(ds);

            reports_department.Items.Add("Select Department");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                reports_department.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            //da = new SqlDataAdapter("select * from notices", con);
            da = new SqlDataAdapter("select er.* ,s.first_name,e.exam_name  from exam_results er INNER JOIN  students s ON er.student_id = s.id INNER JOIN exams e ON er.exam_id = e.id", con);
            ds = new DataSet();
            da.Fill(ds);
            string xml = "G:/Collage/Sem-V/ERP_System_ASPNET/pages/admin/AdminReportData.xml";
            ds.WriteXmlSchema(xml);


            path = Server.MapPath("AdminReportData.rpt");
            cr.Load(path);
            cr.SetDataSource(ds);
            cr.Database.Tables[0].SetDataSource(ds);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Reports");
        }
    }
}
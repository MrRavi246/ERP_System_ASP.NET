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

namespace EduErp.pages.faculty
{
    public partial class timetable1 : System.Web.UI.Page
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
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/index.aspx");
            }

        }

        void getcon()
        {
            con = new SqlConnection(conString);
            con.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from timetables", con);
            ds = new DataSet();
            da.Fill(ds);
            string xml = "G:/Collage/Sem-V/ERP_System_ASPNET/pages/faculty/timeTableData.xml";
            ds.WriteXmlSchema(xml);

            path = Server.MapPath("timeTableReport.rpt");
            cr.Load(path);
            cr.SetDataSource(ds);
            cr.Database.Tables[0].SetDataSource(ds);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "TimeTable");
        }
    }
}
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
    public partial class notices1 : System.Web.UI.Page
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
            fill_notice_priority();
            fill_notice_category();
        }

        void getcon()
        {
            con=new SqlConnection(conString);
            con.Open();
        }

        void fill_notice_priority()
        {
            getcon();
            da = new SqlDataAdapter("select priority from notices", con);
            ds = new DataSet();
            da.Fill(ds);

            notice_priority.Items.Add("Select Priority");
            notice_priority_2.Items.Add("Select Priority");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++) 
            {
                notice_priority.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                notice_priority_2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        void fill_notice_category()
        {
            getcon();
            da = new SqlDataAdapter("select target_audience from notices", con);
            ds=new DataSet();
            da.Fill(ds);

            notice_category.Items.Add("Selete Category");
            notice_category_2.Items.Add("Selete Category");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++) 
            {
                notice_category.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                notice_category_2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from notices", con);
            ds = new DataSet();
            da.Fill(ds);
            string xml = "G:/Collage/Sem-V/ERP_System_ASPNET/pages/admin/AdminNoticeData.xml";
            ds.WriteXmlSchema(xml);

            path = Server.MapPath("AdminNoticeData.rpt");
            cr.Load(path);
            cr.SetDataSource(ds);
            cr.Database.Tables[0].SetDataSource(ds);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Notice");
        }
    }
}
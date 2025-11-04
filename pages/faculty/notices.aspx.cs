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
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/index.aspx");
            }
            getcon();
            add_category();
            fill_Target_Audience();
        }

        void getcon()
        {
            con = new SqlConnection(conString);
            con.Open();
        }

        void add_category()
        {
            getcon();
            da = new SqlDataAdapter("select priority from notices", con);
            ds = new DataSet();
            da.Fill(ds);

            Priority.Items.Add("Select Priority");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                Priority.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        void fill_Target_Audience()
        {
            getcon();
            da = new SqlDataAdapter("select target_audience from notices", con);
            ds = new DataSet();
            da.Fill(ds);
            Audience.Items.Add("Select Target Audience");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                Audience.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        void add_notice()
        {
            getcon();
            cmd = new SqlCommand("insert into notices (notice_title,priority,notice_content,target_audience,posted_on) values", con);


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from notices", con);
            ds = new DataSet();
            da.Fill(ds);
            string xml = "G:/Collage/Sem-V/ERP_System_ASPNET/pages/faculty/notices.xml";
            ds.WriteXmlSchema(xml);

            path = Server.MapPath("notice_rpt.rpt");
            cr.Load(path);
            cr.SetDataSource(ds);
            cr.Database.Tables[0].SetDataSource(ds);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Notices");
        }
    }
}
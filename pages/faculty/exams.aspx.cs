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

namespace EduErp.pages.faculty
{
    public partial class exam : System.Web.UI.Page
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
            da = new SqlDataAdapter("select id,course_name from courses", con);
            ds = new DataSet();
            da.Fill(ds);

            course_exam.Items.Add("Select Course");

            for(int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string Name = ds.Tables[0].Rows[i]["course_name"].ToString();
                string courseId = ds.Tables[0].Rows[i]["id"].ToString();
                //course_exam.Items.Add(ds.Tables[0].Rows[i][0].ToString());

                course_exam.Items.Add(new ListItem(Name, courseId));
            }
        }

        void fill_exam_type()
        {
            getcon();
            da = new SqlDataAdapter("select id,name from exam_types", con);
            ds = new DataSet();
            da.Fill(ds);

            exam_type.Items.Add("Select Course Types");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string Name = ds.Tables[0].Rows[i]["name"].ToString();
                string examTypeId = ds.Tables[0].Rows[i]["id"].ToString();
                //exam_type.Items.Add(ds.Tables[0].Rows[i][0].ToString());

                exam_type.Items.Add(new ListItem(Name, examTypeId));
            }
        }
        protected void btnCreateExam_Click(object sender, EventArgs e)
        {
            int course_id = Convert.ToInt32(course_exam.SelectedValue);
            int course_type = Convert.ToInt32(exam_type.SelectedValue);
            //string exam_date = exam_date.;

        }

        //protected void LinkButton1_Click(object sender, EventArgs e)
        //{
        //    getcon();
        //    da = new SqlDataAdapter("select * from exams", con);
        //    ds = new DataSet();
        //    da.Fill(ds);
        //    string xml = "G:/Collage/Sem-V/ERP_System_ASPNET/pages/faculty/data.xml";
        //    ds.WriteXmlSchema(xml);

        //    string path = Server.MapPath("G:/Collage/Sem-V/ERP_System_ASPNET/pages/facultyexamdata.rpt");
        //    cr.Load(Crypath);
        //    cr.SetDataSource(ds);
        //    cr.Database.Tables[0].SetDataSource(ds);
        //    cr.Refresh();
        //    CrystalReportViewer1.ReportSource = cr;
        //}

        protected void crsytl_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from exams", con);
            ds = new DataSet();
            da.Fill(ds);
            string xml = "G:/Collage/Sem-V/ERP_System_ASPNET/pages/faculty/data.xml";
            ds.WriteXmlSchema(xml);

            //path = Server.MapPath("G:/Collage/Sem-V/ERP_System_ASPNET/pages/faculty/examdata.rpt");
            path = Server.MapPath("examdata.rpt");
            //cr.Load(Crypath);
            //cr.SetDataSource(ds.Tables[0]);
            //cr.Refresh();
            //CrystalReportViewer1.ReportSource = cr;

            cr.Load(path);
            cr.SetDataSource(ds);
            cr.Database.Tables[0].SetDataSource(ds);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "examdata");
        }
    }
}
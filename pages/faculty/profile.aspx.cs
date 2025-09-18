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
    public partial class profile1 : System.Web.UI.Page
    {
        String s = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            filldepartment();
            filldesignation();

        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void filldepartment()
        {
            getcon();
            da = new SqlDataAdapter("select name from departments", con);
            ds = new DataSet();
            da.Fill(ds);

            department.Items.Add("Select Department");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                department.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }
        void filldesignation()
        {
            getcon();
            da = new SqlDataAdapter("select name from designation", con);
            ds = new DataSet();
            da.Fill(ds);
            designation.Items.Add("Select Designation");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                designation.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }
    }
}
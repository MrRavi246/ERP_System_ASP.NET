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
    public partial class reports1 : System.Web.UI.Page
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
    }
}
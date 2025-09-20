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
    public partial class fees1 : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            //fill_list_payment_status();
            fill_list_department();
            fill_fee_type();
        }

        void getcon()
        {
            con = new SqlConnection(conString);
            con.Open();
        }

        //void fill_list_payment_status()
        //{
        //    getcon();
        //    da = new SqlDataAdapter("select is_active from fee_types", con);
        //    ds = new DataSet();
        //    da.Fill(ds);

        //    list_payment_status.Items.Add("Select Fee Status");

        //    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        //    {

        //        list_payment_status.Items.Add(ds.Tables[0].Rows[i][0].ToString());

        //    }
        //}

        void fill_list_department()
        {
            getcon();
            da = new SqlDataAdapter("select name from departments", con);
            ds = new DataSet();
            da.Fill(ds);

            list_department.Items.Add("Select Department");
            list_department_2.Items.Add("Select Department");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                list_department.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                list_department_2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        void fill_fee_type()
        {
            getcon();
            da = new SqlDataAdapter("select name from fee_types", con);
            ds= new DataSet();
            da.Fill(ds);

            list_fee_type.Items.Add("Select Fee Type");
            list_fee_type_2.Items.Add("Select Fee Type");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                list_fee_type.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                list_fee_type_2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }



    }
}
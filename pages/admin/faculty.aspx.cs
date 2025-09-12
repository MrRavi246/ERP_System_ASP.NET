using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduErp.pages.admin
{
    public partial class faculty1 : System.Web.UI.Page
    {
        String s = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            if (!IsPostBack)
            {
                fillgrid();
                filldepartment_catagory();
                filldesignation_catagory();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void filldepartment_catagory()
        {
            getcon();
            da = new SqlDataAdapter("select name from departments", con);
            ds = new DataSet();
            da.Fill(ds);

            department.Items.Add("Select Department");
            department2.Items.Add("Select Department");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++) {
                department.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                department2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        void filldesignation_catagory() 
        { 
            getcon() ;
            da = new SqlDataAdapter("select name from designation", con);
            ds = new DataSet();
            da.Fill(ds);

            designation.Items.Add("Select Designation");
            designation2.Items.Add("Select Designation");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++) 
            {
                designation.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                designation2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }


        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from faculty", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Button2.Text == "Add")
            {
                getcon();
                cmd = new SqlCommand("INSERT INTO faculty (first_name,last_name, Phone, department_id, Designation, qualification, experience_years, address) "
                    + "Values('" + faculty_fname.Text + "','" + faculty_lname.Text + "','" + faculty_phone.Text + "','" + department.SelectedValue + "','" + designation.SelectedValue + "','" + Qualification.Text + "','" + faculty_experience.Text + "','" + faculty_address.Text + "')", con);
                cmd.ExecuteNonQuery();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_delete")
            {
                int Id = Convert.ToInt32(e.CommandArgument);
                ViewState["Id"] = Id;
            }
        }

    }
}
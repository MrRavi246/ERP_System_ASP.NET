using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Runtime.InteropServices;


namespace EduErp.pages.admin
{
    public partial class students1 : System.Web.UI.Page
    {

        string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
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
            }
        }

        void getcon()
        {
            con = new SqlConnection(conString);
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

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                department.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                department2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from students", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
        }

        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            string FirstName = txtFirstName.Text;
            string LastName = txtLastName.Text;
            string Email = txtEmail.Text;
            string Phone = txtPhone.Text;
            string Department = department.SelectedValue;
            string Year = ddYear.SelectedValue;

            getcon();

            string query = "INSERT INTO users (email, password_hash, role, is_active) " +
               "VALUES ('" + Email + "', '" + (FirstName + Year) + "', 'student', 1)";


            cmd = new SqlCommand(query, con);

            cmd.ExecuteNonQuery();

        }

    }
}

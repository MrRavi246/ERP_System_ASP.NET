using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EduErp.pages.faculty
{

    public partial class students1 : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter Da;
        DataSet Ds;
        SqlCommand Cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

            getcon();
            if (!IsPostBack)
            {
                Fillgrid();
                Filldepartment_catagory();
            }

        }
        void getcon()
        {
            con = new SqlConnection(conString);
            con.Open();
        }
        void Filldepartment_catagory()
        {
            getcon();
            Da = new SqlDataAdapter("select name from departments", con);
            Ds = new DataSet();
            Da.Fill(Ds);

            department.Items.Add("Select Department");
            department2.Items.Add("Select Department");

            for (int i = 0; i < Ds.Tables[0].Rows.Count; i++)
            {
                department.Items.Add(Ds.Tables[0].Rows[i][0].ToString());
                department2.Items.Add(Ds.Tables[0].Rows[i][0].ToString());
            }
        }
        void Fillgrid()
        {
            getcon();
            Da = new SqlDataAdapter("select * from students", con);
            Ds = new DataSet();
            Da.Fill(Ds);
            GridView1.DataSource = Ds;
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
            int Year = ddYear.SelectedIndex;

            getcon();
            string checkQuery = "SELECT id FROM users WHERE email = '" + Email + "'";
            Cmd = new SqlCommand(checkQuery, con);

            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter(checkQuery, con))
            {
                da.Fill(dt);
            }

            if (dt.Rows.Count > 0)
            {
                Response.Write("<script>alert('Email " + Email + " is already registered!');</script>");
                con.Close();
                return;
            }
            getcon();
            string userQuery = "INSERT INTO users (email, password_hash, role, is_active) " +
                               "OUTPUT INSERTED.id " +
                               "VALUES ('" + Email + "', '" + (FirstName + Year) + "', 'student', 1)";
            Cmd = new SqlCommand(userQuery, con);
            int newUserId = (int)Cmd.ExecuteScalar();

            string studentQuery = "INSERT INTO students (user_id, student_id, roll_number, first_name, last_name, phone, department_id, year_level, status) " +
                                  "VALUES (" + newUserId + ", 'STU" + newUserId.ToString("000") + "', '" + DateTime.Now.Year + "CS" + newUserId.ToString("000") + "', " +
                                  "'" + FirstName + "', '" + LastName + "', '" + Phone + "', " + Department + ", '" + Year + "', 'Active')";
            Cmd = new SqlCommand(studentQuery, con);
            Cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Student added successfully!');</script>");

            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            ddYear.SelectedIndex = 0;

            con.Close();


        }
    }
}
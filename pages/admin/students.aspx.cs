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

        string ConString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection Con;
        SqlDataAdapter Da;
        DataSet Ds;
        SqlCommand Cmd;

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
            Con = new SqlConnection(ConString);
            Con.Open();
        }

        void filldepartment_catagory()
        {
            getcon();
            Da = new SqlDataAdapter("select name from departments", Con);
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

        void fillgrid()
        {
            getcon();
            Da = new SqlDataAdapter("select * from students", Con);
            Ds = new DataSet();
            Da.Fill(Ds);
            GridView1.DataSource = Ds;
            GridView1.DataBind();
            Con.Close();
        }

        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            string FirstName = txtFirstName.Text;
            string LastName = txtLastName.Text;
            string Email = txtEmail.Text;
            string Phone = txtPhone.Text;
            int Department = department.SelectedIndex;
            string Year = ddYear.SelectedValue;
            string address = txtAddress.Text;

            getcon();

            string userQuery = "INSERT INTO users (email, password_hash, role, is_active) " +
                               "OUTPUT INSERTED.id " +
                               "VALUES ('" + Email + "', '" + (FirstName + Year) + "', 'student', 1)";

            Cmd = new SqlCommand(userQuery, Con);
            int newUserId = (int)Cmd.ExecuteScalar();

            string studentQuery = "INSERT INTO students (user_id, student_id, roll_number, first_name, last_name, phone,address, department_id, year_level, status) " +
                                  "VALUES (" + newUserId + ", 'STU" + newUserId.ToString("000") + "', '" + DateTime.Now.Year + "CS" + newUserId.ToString("000") + "', " +
                                  "'" + FirstName + "', '" + LastName + "', '" + Phone + "','"+address+"', " + Department + ", '" + Year + "', 'Active')";
            
            Cmd = new SqlCommand(studentQuery, Con);
            Cmd.ExecuteNonQuery();

            fillgrid();

            Response.Write("<script>alert('Student added successfully!');</script>");

            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            ddYear.SelectedIndex = 0;

            Con.Close();

        }

    }
}

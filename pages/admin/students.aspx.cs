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

            // First, check if email already exists
            string checkEmailQuery = "SELECT COUNT(*) FROM users WHERE email = '" + Email + "'";
            Cmd = new SqlCommand(checkEmailQuery, Con);
            int emailExists = (int)Cmd.ExecuteScalar();

            if (emailExists > 0)
            {
                Response.Write("<script>alert('Email already exists! Please use a different email.');</script>");
                Con.Close();
                return;
            }

            // Get the next available user ID to avoid conflicts
            string getMaxIdQuery = "SELECT ISNULL(MAX(id), 0) + 1 FROM users";
            Cmd = new SqlCommand(getMaxIdQuery, Con);
            int nextUserId = (int)Cmd.ExecuteScalar();

            // Insert user with explicit ID to avoid identity conflicts
            string userQuery = "SET IDENTITY_INSERT users ON; " +
                               "INSERT INTO users (id, email, password_hash, role, is_active) " +
                               "VALUES (" + nextUserId + ", '" + Email + "', '" + (FirstName + Year) + "', 'student', 1); " +
                               "SET IDENTITY_INSERT users OFF;";

            Cmd = new SqlCommand(userQuery, Con);
            Cmd.ExecuteNonQuery();

            // Get the next available student ID
            string getMaxStudentIdQuery = "SELECT ISNULL(MAX(id), 0) + 1 FROM students";
            Cmd = new SqlCommand(getMaxStudentIdQuery, Con);
            int nextStudentId = (int)Cmd.ExecuteScalar();

            // Insert student with explicit ID to avoid conflicts
            string studentQuery = "SET IDENTITY_INSERT students ON; " +
                                  "INSERT INTO students (id, user_id, student_id, roll_number, first_name, last_name, phone, address, department_id, year_level, status) " +
                                  "VALUES (" + nextStudentId + ", " + nextUserId + ", 'STU" + nextUserId.ToString("000") + "', '" + DateTime.Now.Year + "CS" + nextUserId.ToString("000") + "', " +
                                  "'" + FirstName + "', '" + LastName + "', '" + Phone + "', '" + address + "', " + Department + ", '" + Year + "', 'Active'); " +
                                  "SET IDENTITY_INSERT students OFF;";
            
            Cmd = new SqlCommand(studentQuery, Con);
            Cmd.ExecuteNonQuery();

            // Update identity seeds to continue from the new values
            string resetUserSeed = "DBCC CHECKIDENT ('users', RESEED, " + nextUserId + ")";
            Cmd = new SqlCommand(resetUserSeed, Con);
            Cmd.ExecuteNonQuery();

            string resetStudentSeed = "DBCC CHECKIDENT ('students', RESEED, " + nextStudentId + ")";
            Cmd = new SqlCommand(resetStudentSeed, Con);
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

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
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();

        }
        void getcon()
        {
            con = new SqlConnection(conString);
            con.Open();
        }
        protected void btnAddStudent_Click(object sender, EventArgs e)
        {
            string FirstName = txtFirstName.Text;
            string LastName = txtLastName.Text;
            string Email = txtEmail.Text;
            string Phone = txtPhone.Text;
            int Department = ddDepartment.SelectedIndex;
            int Year = ddYear.SelectedIndex;

            getcon();
            string checkQuery = "SELECT id FROM users WHERE email = '" + Email + "'";
            cmd = new SqlCommand(checkQuery, con);

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
            cmd = new SqlCommand(userQuery, con);
            int newUserId = (int)cmd.ExecuteScalar();

            string studentQuery = "INSERT INTO students (user_id, student_id, roll_number, first_name, last_name, phone, department_id, year_level, status) " +
                                  "VALUES (" + newUserId + ", 'STU" + newUserId.ToString("000") + "', '" + DateTime.Now.Year + "CS" + newUserId.ToString("000") + "', " +
                                  "'" + FirstName + "', '" + LastName + "', '" + Phone + "', " + Department + ", '" + Year + "', 'Active')";
            cmd = new SqlCommand(studentQuery, con);
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Student added successfully!');</script>");

            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            ddDepartment.SelectedIndex = 0;
            ddYear.SelectedIndex = 0;

            con.Close();


        }
    }
}
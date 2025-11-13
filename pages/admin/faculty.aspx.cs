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

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                department.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                department2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        void filldesignation_catagory()
        {
            getcon();
            da = new SqlDataAdapter("SELECT DISTINCT designation FROM faculty WHERE designation IS NOT NULL", con);
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
                string userQuery = "INSERT INTO users (email, password_hash, role, is_active) " +
                   "OUTPUT INSERTED.id " +
                   "VALUES ('" + faculty_email.Text + "', '" + (faculty_fname.Text + faculty_experience.Text) + "', 'faculty', 1)";

                cmd = new SqlCommand(userQuery, con);
                int newUserId = (int)cmd.ExecuteScalar();


                getcon();

                string hireDateValue = string.IsNullOrWhiteSpace(hire_date.Text) ? "NULL" : "'" + hire_date.Text + "'";
                string salaryValue = salary.Text;
                string profileImageValue = string.IsNullOrWhiteSpace(profile_image.Text) ? "NULL" : "'" + profile_image.Text.Replace("'", "''") + "'";
                string isActiveValue = is_active.Checked ? "1" : "0";


                string insertFaculty = "INSERT INTO faculty (user_id, employee_id, first_name, last_name, phone, department_id, designation, qualification, experience_years, address, hire_date, salary, profile_image, is_active) VALUES ("
                    + "'" + newUserId + "', 'FAC" + newUserId.ToString("000") + "', '" + faculty_fname.Text.Replace("'", "''") + "', '" + faculty_lname.Text.Replace("'", "''") + "', '" + faculty_phone.Text.Replace("'", "''") + "', '" + department.SelectedIndex + "', '" + designation.SelectedValue.Replace("'", "''") + "', '" + Qualification.Text.Replace("'", "''") + "', '" + faculty_experience.Text + "', '" + faculty_address.Text.Replace("'", "''") + "', "
                    + hireDateValue + ", " + salaryValue + ", " + profileImageValue + ", " + isActiveValue + ")";

                cmd = new SqlCommand(insertFaculty, con);
                cmd.ExecuteNonQuery();

                fillgrid();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_delete")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                using (SqlConnection con = new SqlConnection(s))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM faculty WHERE id = @id", con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.ExecuteNonQuery();
                    }
                }
                fillgrid();
            }
        }

    }
}   
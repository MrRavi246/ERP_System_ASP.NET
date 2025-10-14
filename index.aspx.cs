using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace EduErp
{
    public partial class index : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void getcon()
        {
            con = new SqlConnection(conString);
            con.Open();
        }

        protected void BtnSubmit_click(object sender, EventArgs e)
        {
            string email = txtemail.Text;
            string password = txtpass.Text;

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                Response.Write("<script>alert('Please enter both email and password!');</script>");
                return;
            }

            getcon();

            string query = "SELECT id, role, password_hash FROM users WHERE email = '" + email + "' AND is_active = 1";
            cmd = new SqlCommand(query, con);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                string dbPassword = ds.Tables[0].Rows[0]["password_hash"].ToString();
                string userRole = ds.Tables[0].Rows[0]["role"].ToString();
                int userId = Convert.ToInt32(ds.Tables[0].Rows[0]["id"]);

                if (password == dbPassword || dbPassword.Contains(password))
                {
                    string updateQuery = "UPDATE users SET last_login = GETDATE() WHERE id = " + userId;
                    cmd = new SqlCommand(updateQuery, con);
                    cmd.ExecuteNonQuery();

                    Session["UserId"] = userId;
                    Session["UserEmail"] = email;
                    Session["UserRole"] = userRole;

                    Response.Write("<script>alert('Login successful! Welcome " + userRole + "!');</script>");

                    if (userRole == "admin")
                    {
                        Response.Redirect("pages/admin/dashboard.aspx");
                    }
                    else if (userRole == "faculty")
                    {
                        Response.Redirect("pages/faculty/dashboard.aspx");
                    }
                    else if (userRole == "student")
                    {
                        Response.Redirect("pages/student/dashboard.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid password!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('User not found or account is inactive!');</script>");
            }

            con.Close();

            txtpass.Text = "";
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace EduErp
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmit_click(object sender, EventArgs e)
        {
            string email = txtemail.Text;
            string password = txtpass.Text;

            if (email == "admin@college.edu" && password == "password")
            {
                Response.Redirect("./pages/admin/dashboard.aspx");
            }
            else if (email == "faculty@college.edu" && password == "password")
            {                
                Response.Redirect("./pages/faculty/dashboard.aspx");
            }
            else if (email == "student@college.edu" && password == "password")
            {
                Response.Redirect("./pages/student/dashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Enter Valid Credentials');</script>");
            }
        }
    }
}
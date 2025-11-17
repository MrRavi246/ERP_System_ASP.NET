using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduErp.pages.student
{
    public partial class master : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Master page remains a MasterPage; authentication for content pages is handled by StudentBasePage.
            // Optionally, keep a lightweight check to protect master-only access.
            if (HttpContext.Current.Session["UserId"] == null || HttpContext.Current.Session["UserRole"] == null || HttpContext.Current.Session["UserRole"].ToString() != "student")
            {
                HttpContext.Current.Response.Redirect("~/index.aspx");
                return;
            }
        }
    }
}
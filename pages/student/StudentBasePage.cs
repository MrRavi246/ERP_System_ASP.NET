using System;
using System.Web;
using System.Web.UI;

namespace EduErp.pages.student
{
    public class StudentBasePage : System.Web.UI.Page
    {
        protected int CurrentUserId { get; private set; }
        protected string CurrentUserRole { get; private set; }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            // Centralized session/role guard for student pages
            var session = HttpContext.Current.Session;
            if (session["UserId"] == null || session["UserRole"] == null || session["UserRole"].ToString() != "student")
            {
                HttpContext.Current.Response.Redirect("~/index.aspx");
                return;
            }

            CurrentUserId = Convert.ToInt32(session["UserId"]);
            CurrentUserRole = session["UserRole"].ToString();
        }
    }
}

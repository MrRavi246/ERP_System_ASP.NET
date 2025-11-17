using System;
using System.Web;
using System.Web.UI;

namespace EduErp.pages.faculty
{
    public class FacultyBasePage : System.Web.UI.Page
    {
        protected int CurrentUserId { get; private set; }
        protected string CurrentUserRole { get; private set; }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            var session = HttpContext.Current.Session;
            if (session["UserId"] == null || session["UserRole"] == null || session["UserRole"].ToString() != "faculty")
            {
                HttpContext.Current.Response.Redirect("~/index.aspx");
                return;
            }

            CurrentUserId = Convert.ToInt32(session["UserId"]);
            CurrentUserRole = session["UserRole"].ToString();
        }
    }
}

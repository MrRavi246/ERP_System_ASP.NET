using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace EduErp.pages.admin
{
    public partial class courses : System.Web.UI.MasterPage
    {
        protected string CoursesJson = "let courses = [];";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string s = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(s);
                con.Open();

                string q = "select c.id,c.course_code,c.course_name,d.name as department_name,c.credits,ISNULL(ce.enrolled_students,0) as students,c.description,c.semester,c.year_level,c.is_active, f.first_name + ' ' + f.last_name as instructor from courses c left join departments d on c.department_id=d.id left join course_enrollments ce on c.course_code = ce.course_code left join faculty_courses fc on fc.course_id = c.id and fc.is_active = 1 left join faculty f on fc.faculty_id = f.id order by c.id";
                SqlDataAdapter da = new SqlDataAdapter(q, con);
                DataSet ds = new DataSet();
                da.Fill(ds);

                StringBuilder sb = new StringBuilder();
                sb.Append("let courses = [");

                if (ds.Tables.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        DataRow r = dt.Rows[i];
                        string id = r["id"].ToString();
                        string code = Escape(r["course_code"].ToString());
                        string name = Escape(r["course_name"].ToString());
                        string dept = Escape(r["department_name"].ToString());
                        string credits = r["credits"].ToString();
                        string students = r["students"].ToString();
                        string desc = Escape(r["description"].ToString());
                        string instr = Escape(r["instructor"] != DBNull.Value ? r["instructor"].ToString() : "");
                        bool isActive = false;
                        if (r["is_active"] != DBNull.Value) isActive = Convert.ToBoolean(r["is_active"]);

                        sb.Append("{");
                        sb.Append("id:" + id + ",");
                        sb.Append("courseId:\"" + code + "\",");
                        sb.Append("name:\"" + name + "\",");
                        sb.Append("department:\"" + dept + "\",");
                        sb.Append("credits:" + credits + ",");
                        sb.Append("instructor:\"" + instr + "\",");
                        sb.Append("students:" + students + ",");
                        sb.Append("status:" + (isActive ? "true" : "false") + ",");
                        sb.Append("description:\"" + desc + "\"");
                        sb.Append("}");

                        if (i < dt.Rows.Count - 1) sb.Append(",");
                    }
                }

                sb.Append("];\n");

                CoursesJson = sb.ToString();

                con.Close();
            }


        string Escape(string s)
        {
            if (s == null) return "";
            return s.Replace("\\", "\\\\").Replace("\"", "\\\"").Replace("\r", " ").Replace("\n", " ");
        }
        }
    }
}
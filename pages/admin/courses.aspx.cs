using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduErp.pages.admin
{
    public partial class courses1 : System.Web.UI.Page
    {
        String s = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                filldepartment_course();
                fillInstructor_course();
                //fillcourse_status();
                bindCourses();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillInstructor_course()
        {
            getcon();
            da = new SqlDataAdapter("select first_name from faculty", con);
            ds = new DataSet();
            da.Fill(ds);

            instructor_course.Items.Clear();
            instructor_course.Items.Add("Select Instructor");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                instructor_course.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }

            con.Close();
        }

        void bindCourses()
        {
            getcon();
            string q = "select c.id, c.course_code, c.course_name, d.name as department_name, c.credits, c.semester, c.year_level, c.is_active from courses c left join departments d on c.department_id = d.id order by c.id desc";
            da = new SqlDataAdapter(q, con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables.Count > 0)
            {
                coursesGrid.DataSource = ds.Tables[0];
                coursesGrid.EmptyDataText = "No courses found";
                coursesGrid.DataBind();
            }

            con.Close();
        }

        //void fillcourse_status()
        //{
        //    getcon();
        //    da = new SqlDataAdapter("select is_active from courses", con);
        //    ds = new DataSet();
        //    da.Fill(ds);

        //    course_status.Items.Add("Select Status");

        //    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        //    {
        //        course_status.Items.Add(ds.Tables[0].Rows[i][0].ToString());
        //    }
        //}

        void filldepartment_course()
        {
            getcon();
            da = new SqlDataAdapter("select id,name from departments", con);
            ds = new DataSet();
            da.Fill(ds);

            department.Items.Clear();
            department2.Items.Clear();

            department.Items.Add(new ListItem("Select Department", ""));
            department2.Items.Add(new ListItem("Select Department", ""));

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string id = ds.Tables[0].Rows[i][0].ToString();
                string name = ds.Tables[0].Rows[i][1].ToString();
                department.Items.Add(new ListItem(name, id));
                department2.Items.Add(new ListItem(name, id));
            }

            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();

            string code = course_id.Text;
            string cname = course_name.Text;
            string desc = course_description.Text.Replace("'", "''");
            string credits = credits_course.Text;
            string deptId = department.SelectedValue;
            string sem = semester.SelectedValue;

            // derive year_level from semester: 1-2 -> 1, 3-4 -> 2, 5-6 -> 3, 7-8 -> 4
            string year = "1";
            int semInt = 0;
            int.TryParse(sem, out semInt);
            if (semInt >= 1 && semInt <= 2) year = "1";
            else if (semInt >= 3 && semInt <= 4) year = "2";
            else if (semInt >= 5 && semInt <= 6) year = "3";
            else if (semInt >= 7 && semInt <= 8) year = "4";

            // map Active/Inactive to bit
            string bit = "1";
            if (courseStatus.SelectedValue.ToLower().Contains("inactive")) bit = "0";

            string sql = "insert into courses(course_code,course_name,description,credits,department_id,semester,year_level,is_active) values('" + code + "','" + cname + "','" + desc + "'," + credits + "," + deptId + "," + sem + ", '" + year + "'," + bit + ")";

            cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();

            con.Close();

            Response.Redirect(Request.RawUrl);
        }
    }
}
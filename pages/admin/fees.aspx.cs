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
    public partial class fees1 : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getcon();
                fill_list_department();
                fill_fee_type();
                fillFeeGrid();
                con.Close();
            }
        }

        void getcon()
        {
            con = new SqlConnection(conString);
            con.Open();
        }

        //void fill_list_payment_status()
        //{
        //    getcon();
        //    da = new SqlDataAdapter("select is_active from fee_types", con);
        //    ds = new DataSet();
        //    da.Fill(ds);

        //    list_payment_status.Items.Add("Select Fee Status");

        //    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        //    {

        //        list_payment_status.Items.Add(ds.Tables[0].Rows[i][0].ToString());

        //    }
        //}

        void fill_list_department()
        {
            da = new SqlDataAdapter("select name from departments", con);
            ds = new DataSet();
            da.Fill(ds);

            list_department.Items.Clear();
            list_department_2.Items.Clear();

            list_department.Items.Add("Select Department");
            list_department_2.Items.Add("Select Department");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                list_department.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                list_department_2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        void fill_list_fee_type_3()
        {
            getcon();
            da = new SqlDataAdapter("select payment_method from fee_payments", con);
            ds = new DataSet();
            da.Fill(ds);
            list_fee_type_3.Items.Add("Select Fee Method");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                list_fee_type_3.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }
            void fill_fee_type()
        {
            da = new SqlDataAdapter("select name from fee_types", con);
            ds = new DataSet();
            da.Fill(ds);

            list_fee_type.Items.Clear();
            list_fee_type_2.Items.Clear();

            list_fee_type.Items.Add("Select Fee Type");
            list_fee_type_2.Items.Add("Select Fee Type");
            list_fee_record.Items.Add("Select Fee Type");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                list_fee_type.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                list_fee_type_2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                list_fee_record.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }

        protected void btnAddFee_Click(object sender, EventArgs e)
        {
            string rollNo = std_rollno.Text;
            string name = std_name.Text;
            int feeTypeId = list_fee_type_2.SelectedIndex;
            int deptId = list_department_2.SelectedIndex;
            int amount = int.Parse(fee_amount.Text);
            DateTime dueDate = DateTime.Parse(fee_Duedata.Text);
            string desc = fee_descripition.Text;

            getcon();

            // First, get the student_id from the roll number
            string getStudentQuery = "SELECT id FROM students WHERE roll_number = '" + rollNo + "'";
            cmd = new SqlCommand(getStudentQuery, con);
            object studentIdObj = cmd.ExecuteScalar();

            if (studentIdObj != null)
            {
                int studentId = Convert.ToInt32(studentIdObj);

                // Insert into student_fees table
                string query = "INSERT INTO student_fees (student_id, amount_due, payment_status, due_date, remarks) VALUES (" + studentId + ", " + amount + ", 'Pending', '" + dueDate.ToString("yyyy-MM-dd") + "', '" + desc + "')";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Fee record added successfully!');</script>");
                
                // Refresh the grid
                fillFeeGrid();

            }

            con.Close();

            // Clear fields
            std_rollno.Text = "";
            std_name.Text = "";
            list_fee_type_2.SelectedIndex = 0;
            list_department_2.SelectedIndex = 0;
            fee_amount.Text = "";
            fee_Duedata.Text = "";
            fee_descripition.Text = "";

            Response.Write("<script>alert('NO Student Found Of That Roll number');</script>");
        }

        void fillFeeGrid()
        {
            string query = @"SELECT s.roll_number, 
                                   s.first_name + ' ' + s.last_name as student_name,
                                   sf.amount_due, 
                                   sf.amount_paid, 
                                   sf.payment_status, 
                                   sf.due_date, 
                                   sf.payment_date, 
                                   sf.remarks 
                            FROM student_fees sf 
                            INNER JOIN students s ON sf.student_id = s.id 
                            ORDER BY sf.created_at DESC";
            
            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);
            GridViewFees.DataSource = ds;
            GridViewFees.DataBind();
        }

        public string GetStatusBadgeClass(string status)
        {
            switch (status.ToLower())
            {
                case "paid":
                    return "bg-success";
                case "pending":
                    return "bg-warning";
                case "partial":
                    return "bg-info";
                case "overdue":
                    return "bg-danger";
                default:
                    return "bg-secondary";
            }
        }
    }
}
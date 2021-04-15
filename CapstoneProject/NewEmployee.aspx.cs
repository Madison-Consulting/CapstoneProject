using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using Lab3.App_Code;

namespace Lab3
{
    public partial class NewEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateNewEmp_Click(object sender, EventArgs e)
        {
            String sqlquery = "Insert Into Employee (EmpID, EmpName, EmpPosition, EmpCellNumber,EmpEmail) Values (@ID, @Name, @Position, @Cell, @Email);";

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlquery, con);

            string fullname = txtFirstName.Text + ' ' + txtLastName.Text;

            cmd.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(txtUsername.Text));
            cmd.Parameters.AddWithValue("@name", fullname);
            cmd.Parameters.AddWithValue("@Position", HttpUtility.HtmlEncode(txtPosition.Text));
            cmd.Parameters.AddWithValue("@Cell", HttpUtility.HtmlEncode(txtCell.Text));
            cmd.Parameters.AddWithValue("@Email", HttpUtility.HtmlEncode(txtEmail.Text));


            con.Open();

            cmd.ExecuteNonQuery();

           con.Close();

            if (HttpUtility.HtmlEncode(txtFirstName.Text) != "" && HttpUtility.HtmlEncode(txtLastName.Text) != "" && HttpUtility.HtmlEncode(txtPassword.Text) != "" && HttpUtility.HtmlEncode(txtUsername.Text) != "") // all fields must be filled out
            {

                // COMMIT VALUES
                try
                {
                    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                    lblStatus.Text = "Database Connection Successful";

                    sc.Open();

                    System.Data.SqlClient.SqlCommand createUser = new System.Data.SqlClient.SqlCommand();
                    createUser.Connection = sc;
                    // INSERT USER RECORD
                    createUser.CommandText = "INSERT INTO EmpPerson (FirstName, LastName, Username) VALUES (@FName, @LName, @Username)";
                    createUser.Parameters.Add(new SqlParameter("@FName", HttpUtility.HtmlEncode(txtFirstName.Text)));
                    createUser.Parameters.Add(new SqlParameter("@LName", HttpUtility.HtmlEncode(txtLastName.Text)));
                    createUser.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(txtUsername.Text)));
                    createUser.ExecuteNonQuery();

                    System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();
                    setPass.Connection = sc;
                    // INSERT PASSWORD RECORD AND CONNECT TO USER
                    setPass.CommandText = "INSERT INTO EmpPass (Username, PasswordHash) VALUES (@Username, @Password)";
                    setPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(txtUsername.Text)));
                    setPass.Parameters.Add(new SqlParameter("@Password", HttpUtility.HtmlEncode(PasswordHash.HashPassword(txtPassword.Text)))); // hash entered password
                    setPass.ExecuteNonQuery();

                    sc.Close();

                    lblStatus.Text = "Employee Created!";



           

                }
                catch
                {
                    lblStatus.Text = "Database Error - User not committed.";
                }
            }
            else
                lblStatus.Text = "Fill all fields.";

            Session["Email"] = HttpUtility.HtmlEncode(txtUsername.Text);
            Response.Redirect("LoginPage.aspx");
        }
    }
}

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
    public partial class CustomerCreate : System.Web.UI.Page
    {

        private static Random rnd = new Random();
        int CustID = rnd.Next(100000000, 1000000000);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {


            if (HttpUtility.HtmlEncode(txtFirstName.Text) != "" && HttpUtility.HtmlEncode(txtLastName.Text) != "" && HttpUtility.HtmlEncode(txtPassword.Text) != "" && HttpUtility.HtmlEncode(txtEmail.Text) != "") // all fields must be filled out
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
                    createUser.CommandText = "INSERT INTO CustPerson (FirstName, LastName, Username) VALUES (@FName, @LName, @Username)";
                    createUser.Parameters.Add(new SqlParameter("@FName", HttpUtility.HtmlEncode(txtFirstName.Text)));
                    createUser.Parameters.Add(new SqlParameter("@LName", HttpUtility.HtmlEncode(txtLastName.Text)));
                    createUser.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(txtEmail.Text)));
                    createUser.ExecuteNonQuery();

                    System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();
                    setPass.Connection = sc;
                    // INSERT PASSWORD RECORD AND CONNECT TO USER
                    setPass.CommandText = "INSERT INTO CustPass (UserID, Username, PasswordHash) VALUES ((select max(userid) from CustPerson), @Username, @Password)";
                    setPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(txtEmail.Text)));
                    setPass.Parameters.Add(new SqlParameter("@Password", HttpUtility.HtmlEncode(PasswordHash.HashPassword(txtPassword.Text)))); // hash entered password
                    setPass.ExecuteNonQuery();

                    sc.Close();

                    lblStatus.Text = "User committed!";

                }
                catch
                {
                    lblStatus.Text = "Database Error - User not committed.";
                }
            }
            else
                lblStatus.Text = "Fill all fields.";

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            //create new customer
            String query = "INSERT INTO Customer (CustFirstName,CustLastName, PhoneNumber,Email,CustAddress," +
                "CustCity,CustState,CustZip,CustomerID) " +
                "VALUES (@FirstName, @LastName, @CustomerPhone, @CustomerEmail, @Address, @City, @State, @ZipCode, @CustomerID)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@CustomerID", CustID);
            cmd.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text));
            cmd.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(txtLastName.Text));
            cmd.Parameters.AddWithValue("@CustomerPhone", HttpUtility.HtmlEncode(txtPhoneNo.Text));
            cmd.Parameters.AddWithValue("@CustomerEmail", HttpUtility.HtmlEncode(txtEmail.Text));
            cmd.Parameters.AddWithValue("@Address", HttpUtility.HtmlEncode(txtAddress.Text));
            cmd.Parameters.AddWithValue("@City", HttpUtility.HtmlEncode(txtCity.Text));
            cmd.Parameters.AddWithValue("@State", HttpUtility.HtmlEncode(txtState.Text));
            cmd.Parameters.AddWithValue("@ZipCode", HttpUtility.HtmlEncode(txtZip.Text));


            cmd.ExecuteNonQuery();
            con.Close();

            lblStatus.Text = "Account Created";

            //redirect and save email as a session variable
            Session["Email"] = HttpUtility.HtmlEncode(txtEmail.Text);
            Response.Redirect("CustomerServInfo.aspx");
        }

    }
}
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
using System.Drawing;

namespace Lab3
{
    public partial class CustomerLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         

            if (Request.QueryString.Get("loggedout") == "true")
            {
                lblStatus.ForeColor = Color.Green;
                lblStatus.Text = "User has successfully logged out";
            }

            if (Session["InvalidUse"] != null)
            {
                lblStatus.ForeColor = Color.Red;
                lblStatus.Text = Session["InvalidUse"].ToString();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            //create new customer
            String query = "Select CustomerID from customer where email = @email";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@email", HttpUtility.HtmlEncode(txtEmail.Text)); ;
            SqlDataReader myReader3 = cmd.ExecuteReader();
            if (myReader3.HasRows)
            {
                while (myReader3.Read())
                {
                    Session["ID"] = Convert.ToString(myReader3[0]);

                }
                myReader3.Close();
            }
            con.Close();


            Session["Email"] = HttpUtility.HtmlEncode(txtEmail.Text);

            try
            {
                System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                lblStatus.Text = "Database Connection Successful";

                sc.Open();
                System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
                findPass.Connection = sc;
                // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
                findPass.CommandText = "SELECT PasswordHash FROM CustPass WHERE Username = @Username";
                findPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(txtEmail.Text)));

                SqlDataReader reader = findPass.ExecuteReader(); // create a reader

                if (reader.HasRows) // if the username exists, it will continue
                {
                    while (reader.Read()) // this will read the single record that matches the entered username
                    {
                        string storedHash = reader["PasswordHash"].ToString(); // store the database password into this variable

                        if (PasswordHash.ValidatePassword(txtPassword.Text, storedHash)) // if the entered password matches what is stored, it will show success
                        {
                            lblStatus.Text = "Success!";
                            Response.Redirect("CustomerServInfo1.aspx");
                        }
                        else
                            lblStatus.Text = "Password is incorrect.";
                    }
                }
                else // if the username doesn't exist, it will show failure
                    lblStatus.Text = "Login failed. User Does not Exist";

                sc.Close();
            }
            catch
            {
                lblStatus.Text = "Database Error.";
            }


        }

        protected void lnkNoAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerCreate.aspx");
        }
    }
}
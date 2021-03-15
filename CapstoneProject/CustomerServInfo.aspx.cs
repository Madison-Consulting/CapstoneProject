using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace Lab3
{
    public partial class CustomerServInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                lblLoggedIn.Text = Session["Email"].ToString() + " successfully logged in";
                txtEmail.Text = Session["Email"].ToString();
            }
        }

        protected void btnSubmitRequest_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            string status = "Unassigned";

            SqlCommand cmd1 = new SqlCommand("SELECT CustomerID From Customer WHERE Email = @Email", con);

            cmd1.Parameters.AddWithValue("@Email", txtEmail.Text);

            SqlDataReader myReader3 = cmd1.ExecuteReader();
            if (myReader3.HasRows)
            {
                while (myReader3.Read())
                {
                    string variable = Convert.ToString(myReader3[0]);

                    SqlConnection con1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                    con1.Open();

                    String query = "INSERT INTO ServiceRequest (ServiceRequest.UserEmail, ServiceRequest.CustomerID, ServiceRequest.ServiceType, ServiceRequest.ServiceDate, ServiceRequest.Needs, ServiceRequest.TicketStatus) VALUES (@Email, @CustomerID, @ServiceType, @ServiceDate, @Needs, @Status)";
                    SqlCommand cmd = new SqlCommand(query, con1);

                    cmd.Parameters.AddWithValue("@ServiceType", rdobtnServ.SelectedValue);
                    cmd.Parameters.AddWithValue("@CustomerID", variable);
                    cmd.Parameters.AddWithValue("@Email", Session["Email"].ToString());
                    cmd.Parameters.AddWithValue("@ServiceDate", HttpUtility.HtmlEncode(txtDate.Text));
                    cmd.Parameters.AddWithValue("@Needs", HttpUtility.HtmlEncode(txtNeeds.Text));
                    cmd.Parameters.AddWithValue("@Status", status);

                    cmd.ExecuteNonQuery();
                    con1.Close();

                }
                myReader3.Close();
            }
            con.Close();

        }



        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("StartPage.aspx?loggedout=true");
        }
    }
}
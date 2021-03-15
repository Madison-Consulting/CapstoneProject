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
    public partial class Notifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lstNotifications_Load(object sender, EventArgs e)
        {
            //Assigning employee at the create service screen

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();
            //Possibly adding an Order By Function Later 
            String queryNotifications = " SELECT Customer.CustFirstName, Customer.CustLastName, ServiceRequest.UserEmail,  ServiceRequest.ServiceType,  ServiceRequest.ServiceDate,  ServiceRequest.Needs,  ServiceRequest.TicketStatus FROM Customer INNER JOIN ServiceRequest ON Customer.CustomerID = ServiceRequest.CustomerID WHERE TicketStatus = 'Unassigned';";
            //String queryNotifications = "  SELECT * From Service Where Service.EmployeeID is NULL; ";
            SqlCommand cmdNotifications = new SqlCommand(queryNotifications, con);
            cmdNotifications.ExecuteNonQuery();
            SqlDataReader queryResultsNotifications = cmdNotifications.ExecuteReader();


            while (queryResultsNotifications.Read())
            {

                lstNotifications.Items.Add("CUSTOMER FIRST NAME: " + queryResultsNotifications["CustFirstName"].ToString() + ": CUSTOMER LAST NAME: " + queryResultsNotifications["CustLastName"].ToString() + ": CUSTOMER EMAIL: " + queryResultsNotifications["UserEmail"].ToString() + ": SERVICE TYPE: " + queryResultsNotifications["ServiceType"].ToString() + ":   SERVICE DATE: " + queryResultsNotifications["ServiceDate"].ToString() + " TICKET STATUS: " + queryResultsNotifications["TicketStatus"].ToString());

            }

            queryResultsNotifications.Close();


            con.Close();

        }




        protected void btnAddInitialContact_Click(object sender, EventArgs e)
        {

            //SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            //con.Open();

            //String query1 = "Select CustomerID FROM Customer WHERE Email = @UserEmail)";

            //SqlCommand cmd = new SqlCommand(query1, con);
            //SqlDataReader queryResults = cmd.ExecuteReader();
            //cmd.Parameters.AddWithValue("@UserEmail", queryResults["Email"].ToString());


            //cmd.ExecuteNonQuery();


            //string variable = (string)cmd.ExecuteScalar();

            //Session["CustomerID"] = variable;


            string firstName;
            string lastName;


            int x;
            int y;
            int z;


            x = lstNotifications.SelectedValue.IndexOf("CUSTOMER FIRST NAME:");
            y = lstNotifications.SelectedValue.IndexOf("CUSTOMER LAST NAME:");
            z = lstNotifications.SelectedValue.IndexOf(": CUSTOMER EMAIL:");


            x += 20;
            y += 19;
            z += 17;



            firstName = lstNotifications.SelectedValue.Substring(x, lstNotifications.SelectedValue.IndexOf("CUSTOMER LAST NAME:") - x);
            lastName = lstNotifications.SelectedValue.Substring(y, lstNotifications.SelectedValue.IndexOf(": CUSTOMER EMAIL:") - y);

            Session["Firstname"] = firstName;
            Session["Lastname"] = lastName;

            Response.Redirect("InitialContact.aspx");
        }

    }
}
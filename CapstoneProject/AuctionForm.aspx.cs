using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace CapstoneProject
{
    public partial class AuctionForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divPickup.Visible = false;
            }
        }

        protected void radioBtnProcurement_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (radioBtnProcurement.SelectedValue == "bringin")
            {
                divPickup.Visible = false;
            }
            if (radioBtnProcurement.SelectedValue == "pickup")
            {
                divPickup.Visible = true;
            }
        }

        protected void tblSelectTrucks_Load(object sender, EventArgs e)
        {
            //Getting the Equipment to display in the box

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();
            //Get Equipment from the table 
            String queryNotifications = " SELECT Equipment.EquipmentName, Equipment.EquipmentDescription FROM Equipment;";
            SqlCommand cmdNotifications = new SqlCommand(queryNotifications, con);
            cmdNotifications.ExecuteNonQuery();
            SqlDataReader queryResultsNotifications = cmdNotifications.ExecuteReader();


            while (queryResultsNotifications.Read())
            {
                //tblSelectTrucks.
                //tblSelectTrucks.Items.Add("CUSTOMER FIRST NAME: " + queryResultsNotifications["CustFirstName"].ToString() + ": CUSTOMER LAST NAME: " + queryResultsNotifications["CustLastName"].ToString() + ": CUSTOMER EMAIL: " + queryResultsNotifications["UserEmail"].ToString() + ": SERVICE TYPE: " + queryResultsNotifications["ServiceType"].ToString() + ":   SERVICE DATE: " + queryResultsNotifications["ServiceDate"].ToString() + " TICKET STATUS: " + queryResultsNotifications["TicketStatus"].ToString());

            }

            queryResultsNotifications.Close();


            con.Close();
        }
    }
}
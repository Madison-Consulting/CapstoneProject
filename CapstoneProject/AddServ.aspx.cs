using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Lab2
{
    public partial class AddServ : System.Web.UI.Page

    {
        //button click methods, most buttons do not get used for this lab
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFirstName.Text = (string)Session["FName"];
                txtLastName.Text = (string)Session["LName"];
                txtCustID1.Text = (string)Session["ID"];
            }
        }



        protected void btnClearServ_Click(object sender, EventArgs e)
        {
            ClearAllText(Page);
        }

        //clear all textboxes method
        protected void ClearAllText(Control p1)
        {
            foreach (Control ClearText in p1.Controls)
            {
                if (ClearText is TextBox)
                {
                    TextBox t = ClearText as TextBox;

                    if (t != null)
                    {
                        t.Text = String.Empty;
                    }
                }
                else
                {
                    if (ClearText.Controls.Count > 0)
                    {
                        ClearAllText(ClearText);
                    }
                }
            }
        }


        //method to populate the service fields
        protected void btnPopulateServ_Click(object sender, EventArgs e)
        {



            Random rnd = new Random();
            int ServID = rnd.Next(100000, 1000000);

            Random rnd2 = new Random();
            int ServTicketID = rnd2.Next(10000, 100000);

            txtCustID1.Text = "111736162";
            txtServType1.Text = "Moving";
            txtFirstName.Text = "James";
            txtLastName.Text = "Crane";
            txtMoveTime1.Text = "2";
            txtFoodCost1.Text = "20";
            txtDate1.Text = "11/05/2020";
            txtFuelCost1.Text = "120";
            txtEstCost1.Text = "1000";
            txtLodgeCost1.Text = "0";
            txtCompDate1.Text = "11/06/2020";
            txtEquip1.Text = "truck, forklift";
            txtVehicleUsed1.Text = "truck 4";
            txtDestinationAddress1.Text = "213 State Dr";
            txtDestinationCity1.Text = "Harrisonburg";
            txtDestinationState1.Text = "VA";
            txtDestinationZip1.Text = "22801";
            txtServiceID1.Text = "920213";
            txtHeader.Text = "Move Date Change";
            txtNote.Text = "The Move Date may change to 11/06/2020, customer will contact";
            txtServiceID1.Text = ServID.ToString();
            txtTicketID.Text = ServTicketID.ToString();
            txtStatus.Text = "Open";
            txtEmployeeID.Text = "481947219";
            txtEmpName.Text = "Caitlyn Meyer";

        }

        //add service to db
        protected void btnCommitServ_Click(object sender, EventArgs e)
        {

            Random rnd = new Random();
            int ServID = rnd.Next(100000, 1000000);

            txtServiceID1.Text = ServID.ToString();

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();


            String query = "INSERT INTO Service VALUES (@FirstName, @LastName, @CustomerID, @ServiceType, @Date, @EstCost, @CompletionDate, @VehicleUsed, " +
                "@ServiceID, @MoveTime, @FoodCost, @FuelCost, @LodgeCost, @Equipment, @DestAddress, @DestCity, @DestState, @DestZip, @Header, @Note, @EmpID)";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@CustomerID", HttpUtility.HtmlEncode(txtCustID1.Text));
            cmd.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text));
            cmd.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(txtLastName.Text));
            cmd.Parameters.AddWithValue("@ServiceType", HttpUtility.HtmlEncode(txtServType1.Text));
            cmd.Parameters.AddWithValue("@Date", HttpUtility.HtmlEncode(txtDate1.Text));
            cmd.Parameters.AddWithValue("@EstCost", HttpUtility.HtmlEncode(txtEstCost1.Text));
            cmd.Parameters.AddWithValue("@CompletionDate", HttpUtility.HtmlEncode(txtCompDate1.Text));
            cmd.Parameters.AddWithValue("@VehicleUsed", HttpUtility.HtmlEncode(txtVehicleUsed1.Text));
            cmd.Parameters.AddWithValue("@ServiceID", HttpUtility.HtmlEncode(txtServiceID1.Text));
            cmd.Parameters.AddWithValue("@MoveTime", HttpUtility.HtmlEncode(txtMoveTime1.Text));
            cmd.Parameters.AddWithValue("@FoodCost", HttpUtility.HtmlEncode(txtFoodCost1.Text));
            cmd.Parameters.AddWithValue("@FuelCost", HttpUtility.HtmlEncode(txtFuelCost1.Text));
            cmd.Parameters.AddWithValue("@LodgeCost", HttpUtility.HtmlEncode(txtLodgeCost1.Text));
            cmd.Parameters.AddWithValue("@Equipment", HttpUtility.HtmlEncode(txtEquip1.Text));
            cmd.Parameters.AddWithValue("@DestAddress", HttpUtility.HtmlEncode(txtDestinationAddress1.Text));
            cmd.Parameters.AddWithValue("@DestCity", HttpUtility.HtmlEncode(txtDestinationCity1.Text));
            cmd.Parameters.AddWithValue("@DestState", HttpUtility.HtmlEncode(txtDestinationState1.Text));
            cmd.Parameters.AddWithValue("@DestZip", HttpUtility.HtmlEncode(txtDestinationZip1.Text));
            cmd.Parameters.AddWithValue("@Header", HttpUtility.HtmlEncode(txtHeader.Text));
            cmd.Parameters.AddWithValue("@Note", HttpUtility.HtmlEncode(txtNote.Text));
            cmd.Parameters.AddWithValue("@EmpID", HttpUtility.HtmlEncode(txtEmployeeID.Text));
            cmd.ExecuteNonQuery();
            con.Close();




        }



        protected void btnCreateServTicket_Click(object sender, EventArgs e)
        {
            Random rnd2 = new Random();
            int ServTicketID = rnd2.Next(10000, 100000);

            txtTicketID.Text = ServTicketID.ToString();

            {
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                con.Open();


                String query = "INSERT INTO ServiceTicket VALUES (@TicketID, @Status, @CustomerID, @ServiceID, @EmployeeID, @EmpName)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CustomerID", HttpUtility.HtmlEncode(txtCustID1.Text));
                cmd.Parameters.AddWithValue("@ServiceID", HttpUtility.HtmlEncode(txtServiceID1.Text));
                cmd.Parameters.AddWithValue("@TicketID", HttpUtility.HtmlEncode(txtTicketID.Text));
                cmd.Parameters.AddWithValue("@Status", HttpUtility.HtmlEncode(txtStatus.Text));
                cmd.Parameters.AddWithValue("@EmployeeID", HttpUtility.HtmlEncode(txtEmployeeID.Text));
                cmd.Parameters.AddWithValue("@EmpName", HttpUtility.HtmlEncode(txtEmpName.Text));


                try
                {
                    cmd.ExecuteNonQuery();
                    lblSuccess.Text = "Service Event Added Successfully";
                }
                catch (Exception)
                {
                    lblSuccess.Text = "Unable to insert data. You must add the service event to the database first. ";
                }
                finally
                {
                    con.Close();
                }
            }
        }
    }
}




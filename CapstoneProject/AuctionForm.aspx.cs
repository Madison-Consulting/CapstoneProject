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
                lblFirstName.Text = (string)Session["FName"] + ' ';
                lblLastName.Text = (string)Session["LName"];
                txtCustomerID.Text = (string)Session["ID"];
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

        }

        protected void btnAddEquipment_Click(object sender, EventArgs e)
        {
            bool equipmentUsed = false;
            if (lstboxEquipmentInventory.SelectedIndex != -1)
            {

                foreach (ListItem li in lstboxEquipmentUsed.Items)
                {
                    if (lstboxEquipmentInventory.SelectedValue.Equals(li.Value))
                    {
                        equipmentUsed = true;
                    }
                }
                if (!equipmentUsed)
                {
                    var newItem = new ListItem();
                    newItem.Value = lstboxEquipmentInventory.SelectedValue;
                    newItem.Text = lstboxEquipmentInventory.SelectedItem.Text;
                    lstboxEquipmentUsed.Items.Add(newItem);
                }
            }
        }

        protected void btnRemoveEquipment_Click(object sender, EventArgs e)
        {
            if (lstboxEquipmentUsed.SelectedIndex != -1)
            {
                lstboxEquipmentUsed.Items.Remove(lstboxEquipmentUsed.SelectedItem);
            }
        }

        protected void btnAddTruck_Click(object sender, EventArgs e)
        {
            bool truckUsed = false;
            if (lstboxTruckInventory.SelectedIndex != -1)
            {

                foreach (ListItem li in lstboxTruckUsed.Items)
                {
                    if (lstboxTruckInventory.SelectedValue.Equals(li.Value))
                    {
                        truckUsed = true;
                    }
                }
                if (!truckUsed)
                {
                    var newItem = new ListItem();
                    newItem.Value = lstboxTruckInventory.SelectedValue;
                    newItem.Text = lstboxTruckInventory.SelectedItem.Text;
                    lstboxTruckUsed.Items.Add(newItem);
                }
            }
        }

        protected void btnRemoveTruck_Click(object sender, EventArgs e)
        {
            if (lstboxTruckUsed.SelectedIndex != -1)
            {
                lstboxTruckUsed.Items.Remove(lstboxTruckUsed.SelectedItem);
            }
        }


        protected void btnCommit_Click(object sender, EventArgs e)
        {
            //if (!ddlCustomer.SelectedValue.Equals(""))
            {
                string truckAcc;


                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                con.Open();

                if (radioBtnProcurement.SelectedValue.Equals("bringin"))
                {
                    //truckAcc = "NULL";
                    String query = "INSERT INTO AuctionSchedule (PhotoSpot, CustomerID, AuctionDate) VALUES (@PhotoSpot, @CustomerID, @AuctionDate)";
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@PhotoSpot", HttpUtility.HtmlEncode(txtPhotoSpot.Text));
                    //Need To have multiple auction dates
                    cmd.Parameters.AddWithValue("@AuctionDate", HttpUtility.HtmlEncode(txtAuctionDate.Text));
                    cmd.Parameters.AddWithValue("@CustomerID", HttpUtility.HtmlEncode(txtCustomerID.Text));
                    cmd.ExecuteNonQuery();
                }
                else
                {

                    //Check for Truck Acc
                    truckAcc = radioBtnTruckAccess.SelectedValue.ToString();

                    //Later add inventoryID

                    String query = "INSERT INTO AuctionSchedule (PhotoSpot, TruckAcc, Crew, EquipmentID, CustomerID, AuctionDate) VALUES (@PhotoSpot, @TruckAcc, @Crew, @EquipmentID, " +
                  "@CustomerID, @AuctionDate)";
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@PhotoSpot", HttpUtility.HtmlEncode(txtPhotoSpot.Text));
                    cmd.Parameters.AddWithValue("@TruckAcc", HttpUtility.HtmlEncode(truckAcc));
                    //Later maybe change crew Crew Table
                    cmd.Parameters.AddWithValue("@Crew", HttpUtility.HtmlEncode(txtCrewSize.Text));
                    //Allow for multiple equipment to be used at once
                    cmd.Parameters.AddWithValue("@EquipmentID", HttpUtility.HtmlEncode(lstboxEquipmentUsed.SelectedValue));
                    cmd.Parameters.AddWithValue("@CustomerID", HttpUtility.HtmlEncode(txtCustomerID.Text));
                    //Need To have multiple auction dates
                    cmd.Parameters.AddWithValue("@AuctionDate", HttpUtility.HtmlEncode(txtAuctionDate.Text));



                    cmd.ExecuteNonQuery();
                }
                con.Close();
            }
        }

    }
}
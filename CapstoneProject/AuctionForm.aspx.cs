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
                    String query = "INSERT INTO AuctionSchedule (PhotoSpot, CustomerID, AuctionDate, ProcurementMethod) VALUES (@PhotoSpot, @CustomerID, @AuctionDate, @Procurement)";
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@PhotoSpot", HttpUtility.HtmlEncode(txtPhotoSpot.Text));
                    //Need To have multiple auction dates
                    cmd.Parameters.AddWithValue("@AuctionDate", HttpUtility.HtmlEncode(txtAuctionDate.Text));
                    cmd.Parameters.AddWithValue("@CustomerID", HttpUtility.HtmlEncode(txtCustomerID.Text));
                    cmd.Parameters.AddWithValue("@Procurement", radioBtnProcurement.SelectedValue);

                    cmd.ExecuteNonQuery();
                }
                else
                {

                    //Later add inventoryID

                    String query = "INSERT INTO AuctionSchedule (PhotoSpot, TruckAcc, Crew, CustomerID, AuctionDate, ProcurementMethod) VALUES (@PhotoSpot, @TruckAcc, @Crew, " +
                    "@CustomerID, @AuctionDate, @Procurement)";
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@PhotoSpot", HttpUtility.HtmlEncode(txtPhotoSpot.Text));
                    cmd.Parameters.AddWithValue("@TruckAcc", radioBtnTruckAccess.SelectedValue);
                    cmd.Parameters.AddWithValue("@Procurement", radioBtnProcurement.SelectedValue);
                    //Later maybe change crew Crew Table
                    cmd.Parameters.AddWithValue("@Crew", HttpUtility.HtmlEncode(txtCrewSize.Text));
                    cmd.Parameters.AddWithValue("@CustomerID", HttpUtility.HtmlEncode(txtCustomerID.Text));
                    //Need To have multiple auction dates
                    cmd.Parameters.AddWithValue("@AuctionDate", HttpUtility.HtmlEncode(txtAuctionDate.Text));

                    cmd.ExecuteNonQuery();

                    //find AuctionID from ^ most recent insert
                    SqlDataAdapter daForAuctionID = new SqlDataAdapter("select max(AuctionID) from AuctionSchedule", con);
                    DataTable dtForAuctionID = new DataTable();
                    daForAuctionID.Fill(dtForAuctionID);
                    Session["AuctionID"] = dtForAuctionID.Rows[0][0].ToString();


                    string insertEquipmentQuery = "INSERT INTO EquipmentUsed(EquipmentID, AuctionID) VALUES (@EquipmentID, @AuctionID)";
                    SqlCommand cmdInsertEquipment = new SqlCommand(insertEquipmentQuery, con);
                    //insert trucks first
                    foreach (ListItem li in lstboxTruckUsed.Items)
                    {
                        cmdInsertEquipment.Parameters.Clear();
                        cmdInsertEquipment.Parameters.AddWithValue("@EquipmentID", li.Value);
                        cmdInsertEquipment.Parameters.AddWithValue("@AuctionID", Session["AuctionID"].ToString());
                        cmdInsertEquipment.ExecuteNonQuery();
                    }
                    foreach (ListItem li in lstboxEquipmentUsed.Items)
                    {
                        cmdInsertEquipment.Parameters.Clear();
                        cmdInsertEquipment.Parameters.AddWithValue("EquipmentID", li.Value);
                        cmdInsertEquipment.Parameters.AddWithValue("@AuctionID", Session["AuctionID"].ToString());
                        cmdInsertEquipment.ExecuteNonQuery();
                    }

                }
                con.Close();
            }
        }

    }
}
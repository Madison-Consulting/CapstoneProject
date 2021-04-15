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
    public partial class MovingForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnCommit_Click(object sender, EventArgs e)
        {

            if (txtDateTime.Text != "" && txtDateWindow.Text != "" && txtOriginAddress.Text != "" && txtOriginCity.Text != "" && txtOriginState.Text != "" && txtDestinationAddress.Text != "" && txtDestinationCity.Text != "" && txtDestinationState.Text != "" && txtDriveway.Text != "" && txtDistance.Text != "" && txtMoveSteps.Text != "") // fields must be filled
            {
                // COMMIT VALUES
                try
                {
                    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

                    lblStatus.Text = "Database Connection Successful";

                    //sc.Open();
                    sc.Open();

                    System.Data.SqlClient.SqlCommand createMove = new System.Data.SqlClient.SqlCommand();
                    createMove.Connection = sc;
                    // INSERT USER RECORD
                    createMove.CommandText = "INSERT INTO MoveForm (MoveDateTime, OriginAddress, OriginCity, OriginState, DestinationAddress, DestinationCity, DestinationState, MlsListing, SendPhoto, HomeType, Accessibility, TruckDistance, MoveSteps, LoadingCondition, ServiceID) VALUES (@MoveDateTime, @OriginAddress, @OriginCity, @OriginState, @DestinationAddress, @DestinationCity, @DestinationState, @MlsListing, @SendPhoto @HomeType, @Accessibility, @TruckDistance, @MoveSteps, @LoadingCondition, @ServiceID)";
                    createMove.Parameters.Add(new SqlParameter("@MoveDateTime", txtDateTime.Text));
                    createMove.Parameters.Add(new SqlParameter("@OriginAddress", txtOriginAddress.Text));
                    createMove.Parameters.Add(new SqlParameter("@OriginCity", txtOriginCity.Text));
                    createMove.Parameters.Add(new SqlParameter("@OriginState", txtOriginState.Text));
                    createMove.Parameters.Add(new SqlParameter("@DestinationAddress", txtDestinationAddress.Text));
                    createMove.Parameters.Add(new SqlParameter("@DestinationCity", txtDestinationCity.Text));
                    createMove.Parameters.Add(new SqlParameter("@DestinationState", txtDestinationState.Text));
                    createMove.Parameters.Add(new SqlParameter("@MlsListing", ddlMlsList.SelectedValue));
                    createMove.Parameters.Add(new SqlParameter("@SendPhoto", ddlPhotoNeed.SelectedValue));
                    createMove.Parameters.Add(new SqlParameter("@HomeType", ddlHomeType.SelectedValue));
                    createMove.Parameters.Add(new SqlParameter("@Accessibility", txtDriveway.Text));
                    createMove.Parameters.Add(new SqlParameter("@TruckDistance", txtDistance.Text));
                    createMove.Parameters.Add(new SqlParameter("@MoveSteps", txtMoveSteps.Text));
                    createMove.Parameters.Add(new SqlParameter("@LoadingCondition", txtLoad.Text));
                    createMove.Parameters.Add(new SqlParameter("@ServiceID", "837164"));
                    createMove.ExecuteNonQuery();

                    //find most recent move ID (from code executed directly above^) and set it as session variable
                    SqlDataAdapter sqlDAMoveFormID = new SqlDataAdapter("select max(MoveFormID) from MoveForm", sc);
                    DataTable dtMoveFormID = new DataTable();
                    sqlDAMoveFormID.Fill(dtMoveFormID);
                    Session["MoveFormID"] = dtMoveFormID.Rows[0][0].ToString();
                    sc.Close();

                    //use above recent ID for equipmentUsed insert (includes both truckUsed and equipmentUsed)
                    SqlCommand insertEquipmentUsed = new SqlCommand();
                    insertEquipmentUsed.Connection = sc;
                    insertEquipmentUsed.CommandText = "INSERT INTO EquipmentUsed (EquipmentID, MoveFormID) VALUES (@EquipmentID, " + Session["MoveFormID"].ToString() + ")";
                    foreach (ListItem li in lstboxTruckUsed.Items) //first loop through all trucks and execute query for each
                    {
                        insertEquipmentUsed.Parameters.Add(new SqlParameter("@EquipmentID", li.Value));
                        insertEquipmentUsed.ExecuteNonQuery();
                    }
                    foreach (ListItem li in lstboxEquipmentUsed.Items) //next loop through all equipment
                    {
                        insertEquipmentUsed.Parameters.Add(new SqlParameter("@EquipmentID", li.Value));
                        insertEquipmentUsed.ExecuteNonQuery();
                    }
                }
                catch
                {
                    lblStatus.Text = "Database Error - Information not committed";
                }

            }
            else
                lblStatus.Text = "Please fill all fields";

            Response.Redirect("MoveFormPt2.aspx");
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


        protected void ddlDriveway_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {

        }

        protected void btnAuctionAssess_Click(object sender, EventArgs e)
        {

        }
    }

}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using System.Configuration;

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

                txtIDforCustomer.Text= (string)Session["ID"];

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
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                con.Open();

                //mike added this 4/16 after DB changes
                //adding event to service table first, then retrieving the serviceID of that event and
                //using that serviceID in the AuctionSchedule insert statement

                string insertServiceStatement = "INSERT INTO Service (CustomerID, ServiceType, ServiceDate) VALUES " +
                    "(@CustomerID, @ServiceType, @ServiceDate)";
                SqlCommand cmdInsertService = new SqlCommand(insertServiceStatement, con);
                cmdInsertService.Parameters.AddWithValue("@CustomerID", HttpUtility.HtmlEncode(txtCustomerID.Text));
                cmdInsertService.Parameters.AddWithValue("@ServiceType", "Auction");
                cmdInsertService.Parameters.AddWithValue("@ServiceDate", HttpUtility.HtmlEncode(txtAuctionDate.Text));
                cmdInsertService.ExecuteNonQuery();

                //find ServiceID ^ for most recent insert
                 SqlDataAdapter daForServiceID = new SqlDataAdapter("SELECT MAX(ServiceID) FROM Service", con);
                DataTable dtForServiceID = new DataTable();
                daForServiceID.Fill(dtForServiceID);
                string currentServiceID = dtForServiceID.Rows[0][0].ToString();


                string truckAcc;

                if (radioBtnProcurement.SelectedValue.Equals("bringin"))
                {
                    //truckAcc = "NULL";
                    String query = "INSERT INTO AuctionSchedule (ServiceID, AuctionDate, ProcurementMethod) VALUES (@ServiceID, @AuctionDate, @Procurement)";
                    SqlCommand cmd = new SqlCommand(query, con);


                    //Need To have multiple auction dates
                    cmd.Parameters.AddWithValue("@AuctionDate", HttpUtility.HtmlEncode(txtAuctionDate.Text));
                    cmd.Parameters.AddWithValue("@Procurement", radioBtnProcurement.SelectedValue);
                    cmd.Parameters.AddWithValue("@ServiceID", currentServiceID);
                    cmd.ExecuteNonQuery();

                    
                }
                else
                {

                    //Later add inventoryID

                    String query = "INSERT INTO AuctionSchedule (TruckAcc, Crew, ServiceID, AuctionDate, ProcurementMethod) VALUES (@TruckAcc, @Crew, " +
                    "@ServiceID, @AuctionDate, @Procurement)";
                    SqlCommand cmd = new SqlCommand(query, con);

                    //cmd.Parameters.AddWithValue("@PhotoSpot", HttpUtility.HtmlEncode(txtPhotoSpot.Text));
                    cmd.Parameters.AddWithValue("@TruckAcc", radioBtnTruckAccess.SelectedValue);
                    cmd.Parameters.AddWithValue("@Procurement", radioBtnProcurement.SelectedValue);
                    cmd.Parameters.AddWithValue("@ServiceID", currentServiceID);
                    //Later maybe change crew Crew Table
                    cmd.Parameters.AddWithValue("@Crew", HttpUtility.HtmlEncode(txtCrewSize.Text));
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

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (PhotoAuction.HasFile == true)
            {
                foreach (HttpPostedFile postedFile in PhotoAuction.PostedFiles)
                {
                    string filename = Path.GetFileName(postedFile.FileName);
                    postedFile.SaveAs(Server.MapPath("~/AuctionPhotos/") + filename);
                    string str = PhotoAuction.FileName;
                    PhotoAuction.PostedFile.SaveAs(Server.MapPath("~/Uploads/" + str));
                    string Image = "~/AuctionPhotos/" + str.ToString();
                    string name = PhotoAuction.FileName.ToString();

                              SqlConnection con1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                    con1.Open();

                    String query = "Update AuctionSchedule Set PhotoSpot = @Photo WHERE AuctionID = @AuctionID";
                    SqlCommand cmd = new SqlCommand(query, con1);

           
                    cmd.Parameters.AddWithValue("@Photo", Image);
                    cmd.Parameters.AddWithValue("@AuctionID", HttpUtility.HtmlEncode(Session["AuctionID"]));


                    cmd.ExecuteNonQuery();
                    con1.Close();

                    lblUploadStatus.Text = "Image Uploaded";
                    lblUploadStatus.ForeColor = System.Drawing.Color.ForestGreen;

                }
            }
            else
            {
                lblUploadStatus.Text = "Please Upload your Image";
                lblUploadStatus.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
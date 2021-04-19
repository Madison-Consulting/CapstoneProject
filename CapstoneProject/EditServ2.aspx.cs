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
    public partial class EditServ2 : System.Web.UI.Page
    {
        //button click methods, most buttons do not get used for this lab
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlCustomer.SelectedValue = Session["ID"].ToString();
         
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
                //else
                //{
                //    if (ClearText.Controls.Count > 0)
                //    {
                //        ClearAllText(ClearText);
                //    }
                //}
            }
        }
        


        protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCustomer.SelectedValue.Equals(""))
            {
                btnClearServ_Click(sender, e);
            }

            else
            {
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


                if (rbtnlistServiceType.SelectedValue.Equals("auction"))
                {
                    tblMoveInfo.Visible = false;
                    tblMoveItems.Visible = false;

                    con.Open();
                    string viewAuctionCommandString = "SELECT AuctionInventory.ItemDescription, StorageLocation.StorageName, AuctionInventory.AuctionItemID, Service.ServiceID " +
                        "FROM  AuctionInventory INNER JOIN AuctionSchedule ON AuctionInventory.AuctionID " +
                        "= AuctionSchedule.AuctionID INNER JOIN Service ON AuctionSchedule.ServiceID = " +
                        "Service.ServiceID INNER JOIN Customer ON Service.CustomerID = Customer.CustomerID " +
                        "INNER JOIN StorageLocation ON AuctionInventory.LocationID = StorageLocation.LocationID ";
                    viewAuctionCommandString += "WHERE Service.CustomerID = " + ddlCustomer.SelectedValue;

                    SqlDataAdapter daViewAuctions = new SqlDataAdapter(viewAuctionCommandString, con);
                    DataTable dtForGridView = new DataTable();
                    daViewAuctions.Fill(dtForGridView);
                    grdvwAuctions.DataSource = dtForGridView;
                    grdvwAuctions.DataBind();

                    grdvwMoves.Visible = false;
                    grdvwAuctions.Visible = true;
                }
                if (rbtnlistServiceType.SelectedValue.Equals("move"))
                {
                    tblAuctionInfo.Visible = false;

                    con.Open();
                    string viewMoveCommandString = "SELECT MoveForm.MoveDateTime AS [Move Date], MoveForm.OriginCity AS [Origin City], MoveForm.OriginState AS [Origin State], MoveForm.DestinationCity AS [Destination City], MoveForm.DestinationState AS [Destination State], MoveForm.MoveFormID, Service.ServiceID ";
                    viewMoveCommandString += "FROM  Customer INNER JOIN Service ON Customer.CustomerID = Service.CustomerID INNER JOIN ";
                    viewMoveCommandString += "MoveForm ON Service.ServiceID = MoveForm.ServiceID WHERE Customer.CustomerID = " + ddlCustomer.SelectedValue;

                    SqlDataAdapter daViewMoves = new SqlDataAdapter(viewMoveCommandString, con);
                    DataTable dtForGridView = new DataTable();
                    daViewMoves.Fill(dtForGridView);
                    grdvwMoves.DataSource = dtForGridView;
                    grdvwMoves.DataBind();

                    grdvwAuctions.Visible = false;
                    grdvwMoves.Visible = true;
                }
                if (rbtnlistServiceType.SelectedValue.Equals("other"))
                {

                }

            }
        }


        //protected void btnTicketHistorySubmit_Click(object sender, EventArgs e)
        //{

        //    Random rand = new Random();
        //    int HistoryTicketID = rand.Next(1000000, 10000000);


        //    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
        //    con.Open();


        //    String query = "INSERT INTO TicketHistory VALUES '" + HistoryTicketID + "', @DateTime, @ServTicketID, @EmpName;";

        //    SqlCommand cmd = new SqlCommand(query, con);
        //    cmd.Parameters.AddWithValue("@DateTime", HttpUtility.HtmlEncode(txtDateTime.Text));
        //    cmd.Parameters.AddWithValue("@ServTicketID", HttpUtility.HtmlEncode(txtServTicketID.Text));
        //    cmd.Parameters.AddWithValue("@EmpName", HttpUtility.HtmlEncode(txtYourName.Text));
        //    try
        //    {
        //        cmd.ExecuteNonQuery();
        //        lblSuccess.Text = "Ticket History Added Successfully";
        //    }
        //    catch (Exception)
        //    {
        //        lblSuccess.Text = "Unable to insert Ticket History. ";
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //}

        //protected void btnFullHistory_Click(object sender, EventArgs e)
        //{


        //        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
        //        con.Open();


        //        grdvwTicketDisplay.DataSource = null;
        //        grdvwTicketDisplay.DataBind();

        //    SqlCommand cmd = new SqlCommand("SELECT TicketHistory.TicketChangeDate, @YourName, ServiceTicket.InitiatingEmpName, Customer.CustLastName FROM TicketHistory INNER JOIN ServiceTicket ON TicketHistory.ServiceTicketID = ServiceTicket.ServiceTicketID INNER JOIN Customer ON Customer.CustomerID = ServiceTicket.CustomerID WHERE ServiceID = @ServiceID;",con);

        //    cmd.Parameters.AddWithValue("ServiceID", HttpUtility.HtmlEncode(txtServiceID1.Text));
        //    cmd.Parameters.AddWithValue("@YourName", HttpUtility.HtmlEncode(txtYourName.Text));


        //    SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
        //        DataTable dtCustomerGridView = new DataTable();
        //        sqlAdapter.Fill(dtCustomerGridView);
        //        grdvwTicketDisplay.DataSource = dtCustomerGridView;
        //        grdvwTicketDisplay.DataBind();
        //    }


        protected void btnHistory_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();


            grdvwTicketDisplay1.DataSource = null;
            grdvwTicketDisplay1.DataBind();

            SqlCommand cmd = new SqlCommand("SELECT TicketHistory.TicketChangeDate, TicketHistory.EmpNameTicket, ServiceTicket.InitiatingEmpName, Customer.CustLastName FROM TicketHistory INNER JOIN ServiceTicket ON TicketHistory.ServiceTicketID = ServiceTicket.ServiceTicketID INNER JOIN Customer ON Customer.CustomerID = ServiceTicket.CustomerID WHERE ServiceID = @ServiceID;", con);



            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            DataTable dtCustomerGridView = new DataTable();
            sqlAdapter.Fill(dtCustomerGridView);
            grdvwTicketDisplay1.DataSource = dtCustomerGridView;
            grdvwTicketDisplay1.DataBind();
        }



        protected void grdvwTicketDisplay_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Ticket Change Date";
                e.Row.Cells[1].Text = "Next Employee";
                e.Row.Cells[2].Text = "Initiating Employee Name";
                e.Row.Cells[3].Text = "Customer Last Name";
            }
        }


        protected void btnAddMoveTruck_Click(object sender, EventArgs e)
        {
            bool truckUsed = false;
            if (lstboxMoveTruckInventory.SelectedIndex != -1)
            {

                foreach (ListItem li in lstboxMoveTruckUsed.Items)
                {
                    if (lstboxMoveTruckInventory.SelectedValue.Equals(li.Value))
                    {
                        truckUsed = true;
                    }
                }
                if (!truckUsed)
                {
                    var newItem = new ListItem();
                    newItem.Value = lstboxMoveTruckInventory.SelectedValue;
                    newItem.Text = lstboxMoveTruckInventory.SelectedItem.Text;
                    lstboxMoveTruckUsed.Items.Add(newItem);
                }
            }
        }

        protected void btnRemoveMoveTruck_Click(object sender, EventArgs e)
        {
            if (lstboxMoveTruckUsed.SelectedIndex != -1)
            {
                lstboxMoveTruckUsed.Items.Remove(lstboxMoveTruckUsed.SelectedItem);
            }
        }

        protected void btnAddMoveEquipment_Click(object sender, EventArgs e)
        {
            bool equipmentUsed = false;
            if (lstboxMoveEquipmentInventory.SelectedIndex != -1)
            {

                foreach (ListItem li in lstboxMoveEquipmentUsed.Items)
                {
                    if (lstboxMoveEquipmentInventory.SelectedValue.Equals(li.Value))
                    {
                        equipmentUsed = true;
                    }
                }
                if (!equipmentUsed)
                {
                    var newItem = new ListItem();
                    newItem.Value = lstboxMoveEquipmentInventory.SelectedValue;
                    newItem.Text = lstboxMoveEquipmentInventory.SelectedItem.Text;
                    lstboxMoveEquipmentUsed.Items.Add(newItem);
                }
            }
        }

        protected void btnRemoveMoveEquipment_Click(object sender, EventArgs e)
        {
            if (lstboxMoveEquipmentUsed.SelectedIndex != -1)
            {
                lstboxMoveEquipmentUsed.Items.Remove(lstboxMoveEquipmentUsed.SelectedItem);
            }
        }

        protected void btnAddAuctionTruck_Click(object sender, EventArgs e)
        {
            bool truckUsed = false;
            if (lstboxAuctionTruckInventory.SelectedIndex != -1)
            {

                foreach (ListItem li in lstboxAuctionTruckUsed.Items)
                {
                    if (lstboxAuctionTruckInventory.SelectedValue.Equals(li.Value))
                    {
                        truckUsed = true;
                    }
                }
                if (!truckUsed)
                {
                    var newItem = new ListItem();
                    newItem.Value = lstboxAuctionTruckInventory.SelectedValue;
                    newItem.Text = lstboxAuctionTruckInventory.SelectedItem.Text;
                    lstboxAuctionTruckUsed.Items.Add(newItem);
                }
            }
        }

        protected void btnRemoveAuctionTruck_Click(object sender, EventArgs e)
        {
            if (lstboxAuctionTruckUsed.SelectedIndex != -1)
            {
                lstboxAuctionTruckUsed.Items.Remove(lstboxAuctionTruckUsed.SelectedItem);
            }
        }

        protected void btnAddAuctionEquipment_Click(object sender, EventArgs e)
        {
            bool equipmentUsed = false;
            if (lstboxAuctionEquipmentInventory.SelectedIndex != -1)
            {

                foreach (ListItem li in lstboxAuctionEquipmentUsed.Items)
                {
                    if (lstboxAuctionEquipmentInventory.SelectedValue.Equals(li.Value))
                    {
                        equipmentUsed = true;
                    }
                }
                if (!equipmentUsed)
                {
                    var newItem = new ListItem();
                    newItem.Value = lstboxAuctionEquipmentInventory.SelectedValue;
                    newItem.Text = lstboxAuctionEquipmentInventory.SelectedItem.Text;
                    lstboxAuctionEquipmentUsed.Items.Add(newItem);
                }
            }
        }

        protected void btnRemoveAuctionEquipment_Click(object sender, EventArgs e)
        {
            if (lstboxAuctionEquipmentUsed.SelectedIndex != -1)
            {
                lstboxAuctionEquipmentUsed.Items.Remove(lstboxAuctionEquipmentUsed.SelectedItem);
            }
        }



        protected void btnUpdateAuction_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            //first, update auction item
            string updateAuctionItem = "UPDATE AuctionInventory SET ItemDescription = @ItemDesc, LocationID = @LocationID " +
                "WHERE AuctionItemID = " + HttpUtility.HtmlEncode(txtHiddenAuctionItemID.Text);

            SqlCommand cmdUpdateAuctionItem = new SqlCommand(updateAuctionItem, con);
            cmdUpdateAuctionItem.Parameters.AddWithValue("@ItemDesc", txtItemDesc.Text.Trim());
            cmdUpdateAuctionItem.Parameters.AddWithValue("@LocationID", ddlItemLocation.SelectedValue);

            cmdUpdateAuctionItem.ExecuteNonQuery();

            //second, update AuctionSchedule table
            string updateAuctionInfo = "UPDATE AuctionSchedule SET PhotoSpot = @PhotoSpot, TruckAcc = @TruckAcc, " +
                "Crew = @Crew, AuctionDate = @AuctionDate, ProcurementMethod = @Procurement ";
            updateAuctionInfo += "WHERE AuctionID = " + txtHiddenAuctionID.Text;

            SqlCommand cmdUpdateAuctionInfo = new SqlCommand(updateAuctionInfo, con);
            cmdUpdateAuctionInfo.Parameters.AddWithValue("@PhotoSpot", txtPhotoSpot.Text.Trim());
            cmdUpdateAuctionInfo.Parameters.AddWithValue("@TruckAcc", radioBtnTruckAccess.SelectedValue);
            cmdUpdateAuctionInfo.Parameters.AddWithValue("@Crew", txtAuctionCrewSize.Text.Trim());
            cmdUpdateAuctionInfo.Parameters.AddWithValue("@AuctionDate", txtAuctionDate.Text.Trim());
            cmdUpdateAuctionInfo.Parameters.AddWithValue("@Procurement", radioBtnProcurement.SelectedValue);

            cmdUpdateAuctionInfo.ExecuteNonQuery();

            //lastly, update EquipmentUsed
            if (radioBtnProcurement.SelectedValue.Equals("pickup"))
            {
                //first, delete all EquipmentUsed records for specific AuctionID
                SqlCommand cmdDeleteAuctionEquipment = new SqlCommand("DELETE EquipmentUsed WHERE AuctionID = " + HttpUtility.HtmlEncode(txtHiddenAuctionID.Text), con);
                cmdDeleteAuctionEquipment.ExecuteNonQuery();

                //second, re-add records
                string addAuctionEquipment = "INSERT INTO EquipmentUsed(EquipmentID, AuctionID) VALUES (@EquipmentID, @AuctionID)";
                SqlCommand cmdAddAuctionEquipment = new SqlCommand(addAuctionEquipment, con);
                foreach (ListItem li in lstboxAuctionTruckUsed.Items)
                {
                    cmdAddAuctionEquipment.Parameters.Clear();
                    cmdAddAuctionEquipment.Parameters.AddWithValue("@EquipmentID", li.Value);
                    cmdAddAuctionEquipment.Parameters.AddWithValue("@AuctionID", HttpUtility.HtmlEncode(txtHiddenAuctionID.Text));
                    cmdAddAuctionEquipment.ExecuteNonQuery();
                }
                foreach (ListItem li in lstboxAuctionEquipmentUsed.Items)
                {
                    cmdAddAuctionEquipment.Parameters.Clear();
                    cmdAddAuctionEquipment.Parameters.AddWithValue("@EquipmentID", li.Value);
                    cmdAddAuctionEquipment.Parameters.AddWithValue("@AuctionID", HttpUtility.HtmlEncode(txtHiddenAuctionID.Text));
                    cmdAddAuctionEquipment.ExecuteNonQuery();
                }
            }

            Session["DestAddress"] = txtDestinationAddress.Text;
            Session["DestAddress2"] = txtDestinationAddress2.Text;
            Session["DestCity"] = txtDestinationCity.Text;
            Session["DestState"] = ddlDestinationState.SelectedValue;
            Session["DestZip"] = txtDestinationZip.Text;

        }

        protected void btnUpdateMove_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            string updateMove = "UPDATE MoveForm SET MoveDateTime = @MoveDate, OriginAddress = @OAddress, OriginAddress2 = @OAddress2, OriginCity = @OCity, ";
            updateMove += "OriginState = @OState, OriginZip = @OZip, DestinationAddress = @DAddress, DestinationAddress2 = @DAddress2, ";
            updateMove += "DestinationCity = @DCity, DestinationState = @DState, DestinationZip = @DZip, FoodCost = @FoodCost, ";
            updateMove += "FuelCost = @FuelCost, LodgingCost = @LodgingCost, HomeType = @HomeType, ";
            updateMove += "LoadingCondition = @LoadCondition, TruckDistance = @TruckDistance, Accessibility = @Accessible ";
            updateMove += "WHERE ServiceID = " + txtHiddenMoveServiceID.Text;

            SqlCommand cmdUpdateMove = new SqlCommand(updateMove, con);

            cmdUpdateMove.Parameters.AddWithValue("@MoveDate", txtMoveDate.Text.Trim() + " " + txtMoveTime.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@OAddress", txtOriginAddress.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@OAddress2", txtOriginAddress2.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@OCity", txtOriginCity.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@OState", ddlOriginState.SelectedValue);
            cmdUpdateMove.Parameters.AddWithValue("@OZip", txtOriginZip.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@DAddress", txtDestinationAddress.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@DAddress2", txtDestinationAddress2.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@DCity", txtDestinationCity.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@DState", ddlDestinationState.SelectedValue);
            cmdUpdateMove.Parameters.AddWithValue("@DZip", txtDestinationZip.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@FoodCost", txtFoodCost.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@FuelCost", txtFuelCost.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@LodgingCost", txtLodgingCost.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@HomeType", txtHomeType.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@LoadCondition", txtLoadingCondition.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@TruckDistance", txtTruckDistance.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@Accessible", rbtnlistDrivewayAccess.SelectedValue.Trim());

            cmdUpdateMove.ExecuteNonQuery();

            //updating EquipmentUsed table
            //first, delete all EquipmentUsed records for specific ServiceID
            string deleteMoveEquipment = "DELETE EquipmentUsed FROM Equipment INNER JOIN EquipmentUsed ON ";
            deleteMoveEquipment += "Equipment.EquipmentID = EquipmentUsed.EquipmentID INNER JOIN MoveForm ON ";
            deleteMoveEquipment += "EquipmentUsed.MoveFormID = MoveForm.MoveFormID INNER JOIN Service ON ";
            deleteMoveEquipment += "MoveForm.ServiceID = Service.ServiceID WHERE MoveForm.ServiceID = " + txtHiddenMoveServiceID.Text;

            SqlCommand cmdDeleteEquipment = new SqlCommand(deleteMoveEquipment, con);
            cmdDeleteEquipment.ExecuteNonQuery();

            //second, re-add records for specific ServiceID
            string addMoveEquipment = "INSERT INTO EquipmentUsed(EquipmentID, MoveFormID) VALUES (@EquipmentID, @MoveFormID)";
            SqlCommand cmdAddMoveEquipment = new SqlCommand(addMoveEquipment, con);
            foreach (ListItem li in lstboxMoveTruckUsed.Items)
            {
                cmdAddMoveEquipment.Parameters.Clear();
                cmdAddMoveEquipment.Parameters.AddWithValue("@EquipmentID", li.Value);
                cmdAddMoveEquipment.Parameters.AddWithValue("@MoveFormID", txtHiddenMoveFormID.Text);
                cmdAddMoveEquipment.ExecuteNonQuery();
            }
            foreach (ListItem li in lstboxMoveEquipmentUsed.Items)
            {
                cmdAddMoveEquipment.Parameters.Clear();
                cmdAddMoveEquipment.Parameters.AddWithValue("@EquipmentID", li.Value);
                cmdAddMoveEquipment.Parameters.AddWithValue("@MoveFormID", txtHiddenMoveFormID.Text);
                cmdAddMoveEquipment.ExecuteNonQuery();
            }
            
        }

        protected void grdvwMoves_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("editRow"))
            {
                //getting serviceID value
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                string keyValue = grdvwMoves.DataKeys[rowIndex]["ServiceID"].ToString();
                txtHiddenMoveServiceID.Text = keyValue;
                //getting MoveFormID value 
                string keyMoveFormIDValue = grdvwMoves.DataKeys[rowIndex]["MoveFormID"].ToString();
                txtHiddenMoveFormID.Text = keyMoveFormIDValue;

                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                con.Open();

                //load data from MoveForm table
                string viewMoveInfo = "SELECT Customer.CustFirstName + ' ' + Customer.CustLastName AS Customer, MoveForm.MoveDateTime, MoveForm.OriginAddress, ";
                viewMoveInfo += "MoveForm.OriginAddress2, MoveForm.OriginCity, MoveForm.OriginState, MoveForm.OriginZip, MoveForm.DestinationAddress, MoveForm.DestinationAddress2, ";
                viewMoveInfo += "MoveForm.DestinationCity, MoveForm.DestinationState, MoveForm.DestinationZip, MoveForm.FoodCost, MoveForm.FuelCost, MoveForm.LodgingCost, ";
                viewMoveInfo += "MoveForm.HomeType, MoveForm.LoadingCondition, MoveForm.TruckDistance, MoveForm.Accessibility ";
                viewMoveInfo += "FROM  Customer INNER JOIN Service ON Customer.CustomerID = Service.CustomerID INNER JOIN ";
                viewMoveInfo += "MoveForm ON Service.ServiceID = MoveForm.ServiceID WHERE MoveForm.ServiceID = @ServiceID";

                SqlCommand cmd = new SqlCommand(viewMoveInfo, con);
                cmd.Parameters.AddWithValue("ServiceID", keyValue);

                SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
                DataTable dtMoveInfo = new DataTable();
                sqlAdapter.Fill(dtMoveInfo);

                ddlOriginState.DataBind();
                ddlDestinationState.DataBind();

                txtCustomer.Text = dtMoveInfo.Rows[0][0].ToString();
                //int firstSpaceIndex = dtMoveInfo.Rows[0][1].ToString().IndexOf(" ");
                DateTime moveDate = Convert.ToDateTime(dtMoveInfo.Rows[0][1].ToString());
                txtMoveDate.Text = moveDate.ToString("yyyy-MM-dd");
                txtMoveTime.Text = moveDate.TimeOfDay.ToString();
                //txtMoveDate.Text = dtMoveInfo.Rows[0][1].ToString().Substring(0, firstSpaceIndex);
                //int timeSecondsIndex = dtMoveInfo.Rows[0][1].ToString().LastIndexOf(":");
                //int datetimeLength = dtMoveInfo.Rows[0][1].ToString().Length;
                //string timeNoSeconds = dtMoveInfo.Rows[0][1].ToString().Substring(firstSpaceIndex + 1, datetimeLength - (timeSecondsIndex + 2));
                //timeNoSeconds += " " + dtMoveInfo.Rows[0][1].ToString().Substring(timeSecondsIndex + 4);
                //txtMoveTime.Text = timeNoSeconds;
                txtOriginAddress.Text = dtMoveInfo.Rows[0][2].ToString();
                txtOriginAddress2.Text = dtMoveInfo.Rows[0][3].ToString();
                txtOriginCity.Text = dtMoveInfo.Rows[0][4].ToString();
                ddlOriginState.SelectedValue = dtMoveInfo.Rows[0][5].ToString();
                txtOriginZip.Text = dtMoveInfo.Rows[0][6].ToString();
                txtDestinationAddress.Text = dtMoveInfo.Rows[0][7].ToString();
                txtDestinationAddress2.Text = dtMoveInfo.Rows[0][8].ToString();
                txtDestinationCity.Text = dtMoveInfo.Rows[0][9].ToString();
                ddlDestinationState.SelectedValue = dtMoveInfo.Rows[0][10].ToString();
                txtDestinationZip.Text = dtMoveInfo.Rows[0][11].ToString();
                txtFoodCost.Text = dtMoveInfo.Rows[0][12].ToString();
                txtFuelCost.Text = dtMoveInfo.Rows[0][13].ToString();
                txtLodgingCost.Text = dtMoveInfo.Rows[0][14].ToString();
                txtHomeType.Text = dtMoveInfo.Rows[0][15].ToString();
                txtLoadingCondition.Text = dtMoveInfo.Rows[0][16].ToString();
                txtTruckDistance.Text = dtMoveInfo.Rows[0][17].ToString();
                rbtnlistDrivewayAccess.SelectedValue = dtMoveInfo.Rows[0][18].ToString();

                //load data from EquipmentUsed table
                string viewMoveEquipmentUsed = "SELECT Equipment.EquipmentID, Equipment.EquipmentName, Equipment.EquipmentDescription ";
                viewMoveEquipmentUsed += "FROM  Equipment INNER JOIN EquipmentUsed ON Equipment.EquipmentID = EquipmentUsed.EquipmentID ";
                viewMoveEquipmentUsed += "INNER JOIN MoveForm ON EquipmentUsed.MoveFormID = MoveForm.MoveFormID ";
                viewMoveEquipmentUsed += "WHERE MoveForm.ServiceID = " + keyValue;

                SqlCommand cmdForMoveEquipmentUsed = new SqlCommand(viewMoveEquipmentUsed, con);
                SqlDataAdapter sqlAdapterForMoveEquipmentUsed = new SqlDataAdapter(cmdForMoveEquipmentUsed);
                DataTable dtMoveEquipment = new DataTable();
                sqlAdapterForMoveEquipmentUsed.Fill(dtMoveEquipment);

                int dataRowCounter = 0;
                foreach (DataRow dr in dtMoveEquipment.Rows)
                {
                    if (dtMoveEquipment.Rows[dataRowCounter][1].ToString().Trim().Equals("truck"))
                    {
                        lstboxMoveTruckUsed.Items.Add(new ListItem(dtMoveEquipment.Rows[dataRowCounter][2].ToString(), dtMoveEquipment.Rows[dataRowCounter][0].ToString()));
                    }
                    else
                    {
                        lstboxMoveEquipmentUsed.Items.Add(new ListItem(dtMoveEquipment.Rows[dataRowCounter][2].ToString(), dtMoveEquipment.Rows[dataRowCounter][0].ToString()));
                    }
                    dataRowCounter++;
                }


                tblMoveInfo.Visible = true;
            }
        }


        protected void grdvwAuctions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("editRow"))
            {
                tblAuctionInfo.Visible = true;

                //getting serviceID value
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                string keyValue = grdvwAuctions.DataKeys[rowIndex]["ServiceID"].ToString();
                txtHiddenAuctionServiceID.Text = keyValue;
                //getting MoveFormID value 
                string keyAuctionItemIDValue = grdvwAuctions.DataKeys[rowIndex]["AuctionItemID"].ToString();
                txtHiddenAuctionItemID.Text = keyAuctionItemIDValue;

                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                con.Open();

                //load data from AuctionInventory table
                string viewAuctionItems = "SELECT Customer.CustFirstName + ' ' + Customer.CustLastName AS Customer, AuctionInventory.ItemDescription, AuctionInventory.LocationID, ";
                viewAuctionItems += "AuctionInventory.AuctionItemID, AuctionInventory.AuctionID FROM  AuctionInventory INNER JOIN ";
                viewAuctionItems += "AuctionSchedule ON AuctionInventory.AuctionID = AuctionSchedule.AuctionID INNER JOIN Service ";
                viewAuctionItems += "ON AuctionSchedule.ServiceID = Service.ServiceID INNER JOIN Customer ON Service.CustomerID = Customer.CustomerID ";
                viewAuctionItems += "WHERE AuctionInventory.AuctionItemID = " + keyAuctionItemIDValue;

                SqlCommand cmd = new SqlCommand(viewAuctionItems, con);

                SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
                DataTable dtAuctInfo = new DataTable();
                sqlAdapter.Fill(dtAuctInfo);

                txtAuctCustomer.Text = dtAuctInfo.Rows[0][0].ToString();
                txtItemDesc.Text = dtAuctInfo.Rows[0][1].ToString();
                ddlItemLocation.DataBind();
                if (dtAuctInfo.Rows[0][2].ToString().Equals(null))
                {
                    ddlItemLocation.SelectedValue = "";
                }
                else
                {
                    ddlItemLocation.SelectedValue = dtAuctInfo.Rows[0][2].ToString();
                }
                txtHiddenAuctionItemID.Text = dtAuctInfo.Rows[0][3].ToString();
                txtHiddenAuctionID.Text = dtAuctInfo.Rows[0][4].ToString();

                //load data from auctionSchedule table
                string viewAuctionScheduleInfo = "SELECT AuctionDate, PhotoSpot, ProcurementMethod, TruckAcc, Crew FROM AuctionSchedule " +
                    "WHERE AuctionID = " + txtHiddenAuctionID.Text;
                SqlCommand cmdViewAuctionScheduleInfo = new SqlCommand(viewAuctionScheduleInfo, con);
                SqlDataAdapter daForAuctionScheduleInfo = new SqlDataAdapter(cmdViewAuctionScheduleInfo);
                DataTable dtForAuctionScheduleInfo = new DataTable();
                daForAuctionScheduleInfo.Fill(dtForAuctionScheduleInfo);

                txtAuctionDate.Text = dtForAuctionScheduleInfo.Rows[0][0].ToString();
                txtPhotoSpot.Text = dtForAuctionScheduleInfo.Rows[0][1].ToString();
                radioBtnProcurement.SelectedValue = dtForAuctionScheduleInfo.Rows[0][2].ToString();
                radioBtnTruckAccess.SelectedValue = dtForAuctionScheduleInfo.Rows[0][3].ToString();
                txtAuctionCrewSize.Text = dtForAuctionScheduleInfo.Rows[0][4].ToString();

                if (radioBtnProcurement.SelectedValue.Equals("pickup"))
                {
                    //load data from equipmentUsed table
                    string viewAuctionEquipmentUsed = "SELECT Equipment.EquipmentID, Equipment.EquipmentName, Equipment.EquipmentDescription " +
                        "FROM  AuctionSchedule INNER JOIN EquipmentUsed ON AuctionSchedule.AuctionID = EquipmentUsed.AuctionID " +
                        "INNER JOIN Equipment ON EquipmentUsed.EquipmentID = Equipment.EquipmentID WHERE EquipmentUsed.AuctionID = " + txtHiddenAuctionID.Text;
                    SqlCommand cmdViewAuctionEquipmentUsed = new SqlCommand(viewAuctionEquipmentUsed, con);
                    SqlDataAdapter daForAuctionEquipmentUsed = new SqlDataAdapter(cmdViewAuctionEquipmentUsed);
                    DataTable dtForAuctionEquipmentUsed = new DataTable();
                    daForAuctionEquipmentUsed.Fill(dtForAuctionEquipmentUsed);

                    int dataRowCounter = 0;
                    foreach (DataRow dr in dtForAuctionEquipmentUsed.Rows)
                    {
                        if (dtForAuctionEquipmentUsed.Rows[dataRowCounter][1].ToString().Trim().Equals("truck"))
                        {
                            lstboxAuctionTruckUsed.Items.Add(new ListItem(dtForAuctionEquipmentUsed.Rows[dataRowCounter][2].ToString(), dtForAuctionEquipmentUsed.Rows[dataRowCounter][0].ToString()));
                        }
                        else
                        {
                            lstboxAuctionEquipmentUsed.Items.Add(new ListItem(dtForAuctionEquipmentUsed.Rows[dataRowCounter][2].ToString(), dtForAuctionEquipmentUsed.Rows[dataRowCounter][0].ToString()));
                        }
                        dataRowCounter++;
                    }
                }
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

        protected void rbtnlistServiceType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClearAllText(Page);
            tblMoveInfo.Visible = false;
            tblMoveItems.Visible = false;
            tblAuctionInfo.Visible = false;

            if (ddlCustomer.SelectedValue.Equals(""))
            {
                btnClearServ_Click(sender, e);
            }

            else
            {
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


                if (rbtnlistServiceType.SelectedValue.Equals("auction"))
                {
                    tblMoveInfo.Visible = false;
                    tblMoveItems.Visible = false;

                    con.Open();
                    string viewAuctionCommandString = "SELECT AuctionInventory.ItemDescription, StorageLocation.StorageName, AuctionInventory.AuctionItemID, Service.ServiceID " +
                        "FROM  AuctionInventory INNER JOIN AuctionSchedule ON AuctionInventory.AuctionID " +
                        "= AuctionSchedule.AuctionID INNER JOIN Service ON AuctionSchedule.ServiceID = " +
                        "Service.ServiceID INNER JOIN Customer ON Service.CustomerID = Customer.CustomerID " +
                        "INNER JOIN StorageLocation ON AuctionInventory.LocationID = StorageLocation.LocationID ";
                    viewAuctionCommandString += "WHERE Service.CustomerID = " + ddlCustomer.SelectedValue;

                    SqlDataAdapter daViewAuctions = new SqlDataAdapter(viewAuctionCommandString, con);
                    DataTable dtForGridView = new DataTable();
                    daViewAuctions.Fill(dtForGridView);
                    grdvwAuctions.DataSource = dtForGridView;
                    grdvwAuctions.DataBind();

                    grdvwMoves.Visible = false;
                    grdvwAuctions.Visible = true;
                }
                if (rbtnlistServiceType.SelectedValue.Equals("move"))
                {
                    tblAuctionInfo.Visible = false;

                    con.Open();
                    string viewMoveCommandString = "SELECT MoveForm.MoveDateTime AS [Move Date], MoveForm.OriginCity AS [Origin City], MoveForm.OriginState AS [Origin State], MoveForm.DestinationCity AS [Destination City], MoveForm.DestinationState AS [Destination State], MoveForm.MoveFormID, Service.ServiceID ";
                    viewMoveCommandString += "FROM  Customer INNER JOIN Service ON Customer.CustomerID = Service.CustomerID INNER JOIN ";
                    viewMoveCommandString += "MoveForm ON Service.ServiceID = MoveForm.ServiceID WHERE Customer.CustomerID = " + ddlCustomer.SelectedValue;

                    SqlDataAdapter daViewMoves = new SqlDataAdapter(viewMoveCommandString, con);
                    DataTable dtForGridView = new DataTable();
                    daViewMoves.Fill(dtForGridView);
                    grdvwMoves.DataSource = dtForGridView;
                    grdvwMoves.DataBind();

                    grdvwAuctions.Visible = false;
                    grdvwMoves.Visible = true;
                }
                if (rbtnlistServiceType.SelectedValue.Equals("other"))
                {

                }

            }
        }

        protected void btnViewMoveItems_Click(object sender, EventArgs e)
        {
            tblMoveInfo.Visible = false;

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            string viewMoveItems = "SELECT Room.RoomType, MoveInventory.ItemDescription, MoveInventory.ItemQuant, " +
                "MoveInventory.ItemNote, MoveInventory.ItemID FROM  MoveForm INNER JOIN Room ON MoveForm.MoveFormID " +
                "= Room.MoveFormID INNER JOIN MoveInventory ON Room.RoomID = MoveInventory.RoomID " +
                "WHERE MoveForm.MoveFormID = " + txtHiddenMoveFormID.Text;

            SqlDataAdapter daViewMoveItems = new SqlDataAdapter(viewMoveItems, con);
            DataTable dtForGridView = new DataTable();
            daViewMoveItems.Fill(dtForGridView);
            grdvwMoveItems.DataSource = dtForGridView;
            grdvwMoveItems.DataBind();

            con.Close();
            tblMoveItems.Visible = true;
        }

        protected void btnBackToMoveInfo_Click(object sender, EventArgs e)
        {
            tblMoveItems.Visible = false;
            tblMoveInfo.Visible = true;
        }


        protected void grdvwMoveItems_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("editRow"))
            {
                //getting Move ItemID value
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                string keyValue = grdvwMoveItems.DataKeys[rowIndex]["ItemID"].ToString();

                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                con.Open();

                //load data from MoveItems table
                string editMoveItem = "SELECT ItemDescription, ItemQuant, ItemNote, ItemID FROM MoveInventory WHERE ItemID = " + keyValue;

                SqlCommand cmdEditMoveItem = new SqlCommand(editMoveItem, con);
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmdEditMoveItem);
                DataTable dtMoveItem = new DataTable();
                sqlAdapter.Fill(dtMoveItem);

                txtMoveItemDesc.Text = dtMoveItem.Rows[0][0].ToString();
                ddlMoveItemQuant.SelectedValue = dtMoveItem.Rows[0][1].ToString();
                txtMoveItemNote.Text = dtMoveItem.Rows[0][2].ToString();
                txtHiddenMoveItemID.Text = dtMoveItem.Rows[0][3].ToString();

                divEditMoveItemTextboxes.Visible = true;

                con.Close();
            }
        }

        protected void btnUpdateMoveItem_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            string updateMoveItem = "UPDATE MoveInventory SET ItemDescription = @ItemDesc, ItemQuant = @ItemQuant, ItemNote = @ItemNote " +
                "WHERE ItemID = @ItemID";
            SqlCommand cmdUpdateMoveItem = new SqlCommand(updateMoveItem, con);

            cmdUpdateMoveItem.Parameters.AddWithValue("@ItemDesc", txtMoveItemDesc.Text.Trim());
            cmdUpdateMoveItem.Parameters.AddWithValue("@ItemQuant", ddlMoveItemQuant.SelectedValue);
            cmdUpdateMoveItem.Parameters.AddWithValue("@ItemNote", txtMoveItemNote.Text.Trim());
            cmdUpdateMoveItem.Parameters.AddWithValue("@ItemID", txtHiddenMoveItemID.Text);

            cmdUpdateMoveItem.ExecuteNonQuery();
            

            con.Close();

            divEditMoveItemTextboxes.Visible = false;
            btnViewMoveItems_Click(sender, e);
        }
    }
}


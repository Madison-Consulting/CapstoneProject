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
          
                txtDateTime.Text = DateTime.Now.ToString();

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

                    con.Open();
                    string viewAuctionCommandString = "SELECT AuctionInventory.ItemDescription, AuctionInventory.ItemQuantity, AuctionInventory.AuctionItemID, AuctionInventory.ServiceID ";
                    viewAuctionCommandString += "FROM  AuctionInventory INNER JOIN Service ON AuctionInventory.AuctionItemID = Service.ServiceID INNER JOIN ";
                    viewAuctionCommandString += "Customer ON Service.CustomerID = Customer.CustomerID ";
                    viewAuctionCommandString += "WHERE Customer.CustomerID = " + ddlCustomer.SelectedValue;

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


        protected void btnTicketHistorySubmit_Click(object sender, EventArgs e)
        {

            Random rand = new Random();
            int HistoryTicketID = rand.Next(1000000, 10000000);


            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();


            String query = "INSERT INTO TicketHistory VALUES '" + HistoryTicketID + "', @DateTime, @ServTicketID, @EmpName;";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@DateTime", HttpUtility.HtmlEncode(txtDateTime.Text));
            cmd.Parameters.AddWithValue("@ServTicketID", HttpUtility.HtmlEncode(txtServTicketID.Text));
            cmd.Parameters.AddWithValue("@EmpName", HttpUtility.HtmlEncode(txtYourName.Text));
            try
            {
                cmd.ExecuteNonQuery();
                lblSuccess.Text = "Ticket History Added Successfully";
            }
            catch (Exception)
            {
                lblSuccess.Text = "Unable to insert Ticket History. ";
            }
            finally
            {
                con.Close();
            }
        }

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

        protected void grdvwAuctions_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string keyValue = grdvwAuctions.DataKeys[e.NewEditIndex].Value.ToString();

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            string viewAuctionItems = "SELECT Customer.CustFirstName + ' ' + Customer.CustLastName AS Customer, AuctionInventory.ItemDescription, ";
            viewAuctionItems += "AuctionInventory.ItemQuantity, AuctionInventory.AuctionItemID, AuctionInventory.ServiceID ";
            viewAuctionItems += "FROM  AuctionInventory INNER JOIN Service ON AuctionInventory.AuctionItemID = Service.ServiceID INNER JOIN ";
            viewAuctionItems += "Customer ON Service.CustomerID = Customer.CustomerID WHERE AuctionItemID = " + keyValue;

            SqlCommand cmd = new SqlCommand(viewAuctionItems, con);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            DataTable dtAuctInfo = new DataTable();
            sqlAdapter.Fill(dtAuctInfo);

            txtAuctCustomer.Text = dtAuctInfo.Rows[0][0].ToString();
            txtItemDesc.Text = dtAuctInfo.Rows[0][1].ToString();
            txtItemQuant.Text = dtAuctInfo.Rows[0][2].ToString();

        }


        protected void grdvwMoves_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string keyValue = grdvwMoves.DataKeys[e.NewEditIndex].Value.ToString();
            txtHiddenMoveServiceID.Text = keyValue;

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            //load data from MoveForm table
            string viewMoveInfo = "SELECT Customer.CustFirstName + ' ' + Customer.CustLastName AS Customer, MoveForm.MoveDateTime, MoveForm.OriginAddress, ";
            viewMoveInfo += "MoveForm.OriginCity, MoveForm.OriginState, MoveForm.OriginZip, MoveForm.DestinationAddress, MoveForm.DestinationCity, ";
            viewMoveInfo += "MoveForm.DestinationState, MoveForm.DestinationZip, MoveForm.FoodCost, MoveForm.FuelCost, MoveForm.LodgingCost, ";
            viewMoveInfo += "MoveForm.HomeType, MoveForm.LoadingCondition, MoveForm.TruckDistance, MoveForm.Accessibility ";
            viewMoveInfo += "FROM  Customer INNER JOIN Service ON Customer.CustomerID = Service.CustomerID INNER JOIN ";
            viewMoveInfo += "MoveForm ON Service.ServiceID = MoveForm.ServiceID WHERE MoveForm.ServiceID = @ServiceID";

            SqlCommand cmd = new SqlCommand(viewMoveInfo, con);
            cmd.Parameters.AddWithValue("ServiceID", keyValue);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            DataTable dtMoveInfo = new DataTable();
            sqlAdapter.Fill(dtMoveInfo);

            txtCustomer.Text = dtMoveInfo.Rows[0][0].ToString();
            txtMoveDate.Text = dtMoveInfo.Rows[0][1].ToString();
            txtOriginAddress.Text = dtMoveInfo.Rows[0][2].ToString();
            txtOriginCity.Text = dtMoveInfo.Rows[0][3].ToString();
            txtOriginState.Text = dtMoveInfo.Rows[0][4].ToString();
            txtOriginZip.Text = dtMoveInfo.Rows[0][5].ToString();
            txtDestinationAddress.Text = dtMoveInfo.Rows[0][6].ToString();
            txtDestinationCity.Text = dtMoveInfo.Rows[0][7].ToString();
            txtDestinationState.Text = dtMoveInfo.Rows[0][8].ToString();
            txtDestinationZip.Text = dtMoveInfo.Rows[0][9].ToString();
            txtFoodCost.Text = dtMoveInfo.Rows[0][10].ToString();
            txtFuelCost.Text = dtMoveInfo.Rows[0][11].ToString();
            txtLodgingCost.Text = dtMoveInfo.Rows[0][12].ToString();
            txtHomeType.Text = dtMoveInfo.Rows[0][13].ToString();
            txtLoadingCondition.Text = dtMoveInfo.Rows[0][14].ToString();
            txtTruckDistance.Text = dtMoveInfo.Rows[0][15].ToString();
            rbtnlistDrivewayAccess.SelectedValue = dtMoveInfo.Rows[0][16].ToString();

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
                if (dtMoveEquipment.Rows[dataRowCounter][1].ToString().Equals("truck"))
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


        protected void btnUpdateAuction_Click(object sender, EventArgs e)
        {

        }

        protected void btnUpdateMove_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            string updateMove = "UPDATE MoveForm SET MoveDateTime = @MoveDate, OriginAddress = @OAddress, OriginCity = @OCity, ";
            updateMove += "OriginState = @OState, OriginZip = @OZip, DestinationAddress = @DAddress, ";
            updateMove += "DestinationCity = @DCity, DestinationState = @DState, DestinationZip = @DZip, FoodCost = @FoodCost, ";
            updateMove += "FuelCost = @FuelCost, LodgingCost = @LodgingCost, HomeType = @HomeType, ";
            updateMove += "LoadingCondition = @LoadCondition, TruckDistance = @TruckDistance, Accessibility = @Accessible ";
            updateMove += "WHERE ServiceID = " + txtHiddenMoveServiceID.Text;

            SqlCommand cmdUpdateMove = new SqlCommand(updateMove, con);

            cmdUpdateMove.Parameters.AddWithValue("@MoveDate", txtMoveDate.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@OAddress", txtOriginAddress.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@OCity", txtOriginCity.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@OState", txtOriginState.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@OZip", txtOriginZip.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@DAddress", txtDestinationAddress.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@DCity", txtDestinationCity.Text.Trim());
            cmdUpdateMove.Parameters.AddWithValue("@DState", txtDestinationState.Text.Trim());
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
                viewMoveInfo += "MoveForm.OriginCity, MoveForm.OriginState, MoveForm.OriginZip, MoveForm.DestinationAddress, MoveForm.DestinationCity, ";
                viewMoveInfo += "MoveForm.DestinationState, MoveForm.DestinationZip, MoveForm.FoodCost, MoveForm.FuelCost, MoveForm.LodgingCost, ";
                viewMoveInfo += "MoveForm.HomeType, MoveForm.LoadingCondition, MoveForm.TruckDistance, MoveForm.Accessibility ";
                viewMoveInfo += "FROM  Customer INNER JOIN Service ON Customer.CustomerID = Service.CustomerID INNER JOIN ";
                viewMoveInfo += "MoveForm ON Service.ServiceID = MoveForm.ServiceID WHERE MoveForm.ServiceID = @ServiceID";

                SqlCommand cmd = new SqlCommand(viewMoveInfo, con);
                cmd.Parameters.AddWithValue("ServiceID", keyValue);

                SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
                DataTable dtMoveInfo = new DataTable();
                sqlAdapter.Fill(dtMoveInfo);

                txtCustomer.Text = dtMoveInfo.Rows[0][0].ToString();
                txtMoveDate.Text = dtMoveInfo.Rows[0][1].ToString();
                txtOriginAddress.Text = dtMoveInfo.Rows[0][2].ToString();
                txtOriginCity.Text = dtMoveInfo.Rows[0][3].ToString();
                txtOriginState.Text = dtMoveInfo.Rows[0][4].ToString();
                txtOriginZip.Text = dtMoveInfo.Rows[0][5].ToString();
                txtDestinationAddress.Text = dtMoveInfo.Rows[0][6].ToString();
                txtDestinationCity.Text = dtMoveInfo.Rows[0][7].ToString();
                txtDestinationState.Text = dtMoveInfo.Rows[0][8].ToString();
                txtDestinationZip.Text = dtMoveInfo.Rows[0][9].ToString();
                txtFoodCost.Text = dtMoveInfo.Rows[0][10].ToString();
                txtFuelCost.Text = dtMoveInfo.Rows[0][11].ToString();
                txtLodgingCost.Text = dtMoveInfo.Rows[0][12].ToString();
                txtHomeType.Text = dtMoveInfo.Rows[0][13].ToString();
                txtLoadingCondition.Text = dtMoveInfo.Rows[0][14].ToString();
                txtTruckDistance.Text = dtMoveInfo.Rows[0][15].ToString();
                rbtnlistDrivewayAccess.SelectedValue = dtMoveInfo.Rows[0][16].ToString();

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
                //getting serviceID value
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                string keyValue = grdvwMoves.DataKeys[rowIndex]["ServiceID"].ToString();
                txtHiddenAuctionServiceID.Text = keyValue;
                //getting MoveFormID value 
                string keyAuctionItemIDValue = grdvwMoves.DataKeys[rowIndex]["AuctionItemID"].ToString();
                txtHiddenAuctionFormID.Text = keyAuctionItemIDValue;

                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                con.Open();

                //load data from AuctionInventory table
                string viewAuctionItems = "SELECT Customer.CustFirstName + ' ' + Customer.CustLastName AS Customer, AuctionInventory.ItemDescription, ";
                viewAuctionItems += "AuctionInventory.ItemQuantity, AuctionInventory.AuctionItemID, AuctionInventory.ServiceID ";
                viewAuctionItems += "FROM  AuctionInventory INNER JOIN Service ON AuctionInventory.AuctionItemID = Service.ServiceID INNER JOIN ";
                viewAuctionItems += "Customer ON Service.CustomerID = Customer.CustomerID WHERE AuctionItemID = " + keyValue;

                SqlCommand cmd = new SqlCommand(viewAuctionItems, con);

                SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
                DataTable dtAuctInfo = new DataTable();
                sqlAdapter.Fill(dtAuctInfo);

                txtAuctCustomer.Text = dtAuctInfo.Rows[0][0].ToString();
                txtItemDesc.Text = dtAuctInfo.Rows[0][1].ToString();
                txtItemQuant.Text = dtAuctInfo.Rows[0][2].ToString();

                //load data from auction
                string viewAuctionScheduleInfo = "SELECT ";
            }
        }
    }
}


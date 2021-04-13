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
        //update service in db
        protected void btnUpdateServ_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


            con.Open();

            String query2 = "UPDATE Service SET CustomerFirstName = @FirstName, CustomerLastName = @LastName, CustomerID = @CustomerID, ServiceType= @ServiceType, " +
                "ServiceDate = @Date, EstimatedCost = @EstCost, CompletionDate = @CompletionDate, VehicleUsed = @VehicleUsed, ServiceID = @ServiceID, MoveTime = @MoveTime, " +
                "FoodCost = @FoodCost, FuelCost = @FuelCost, LodgingCost = @LodgeCost, EquipmentNeeded = @Equipment, DestinationAddress = @DestAddress," +
                "DestinationCity = @DestCity, DestinationState = @DestState, DestinationZip = @DestZip, NoteHeader = @Header, Note = @Note WHERE ServiceID = @ServiceID";
            SqlCommand cmd = new SqlCommand(query2, con);
             


            cmd.ExecuteNonQuery();
            con.Close();
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
                    string viewAuctionCommandString = "SELECT Inventory.ItemID, Inventory.InventoryDate, Inventory.ItemInInventory, Inventory.ItemCost, [Service].ServiceID ";
                    viewAuctionCommandString += "FROM Inventory inner join [Service] on Inventory.ServiceID = [Service].ServiceID ";
                    viewAuctionCommandString += "inner join Customer on [Service].CustomerID = Customer.CustomerID ";
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
                e.Row.Cells[3].Text = " Customer Last Name";
            }
        }

        protected void grdvwAuctions_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string keyValue = grdvwAuctions.DataKeys[e.NewEditIndex].Value.ToString();

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT ServiceType FROM Service WHERE ServiceID = @ServiceID", con);
            cmd.Parameters.AddWithValue("ServiceID", keyValue);

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            DataTable dtServInfo = new DataTable();
            sqlAdapter.Fill(dtServInfo);


        }

        protected void grdvwMoves_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string keyValue = grdvwMoves.DataKeys[e.NewEditIndex].Value.ToString();

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

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

            tblMoveInfo.Visible = true;
        }
    }
}


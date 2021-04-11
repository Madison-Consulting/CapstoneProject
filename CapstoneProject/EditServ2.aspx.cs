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
            cmd.Parameters.AddWithValue("@CustomerID", HttpUtility.HtmlEncode(txtCustID1.Text));
            cmd.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text));
            cmd.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(txtLastName.Text));
            cmd.Parameters.AddWithValue("@ServiceType", HttpUtility.HtmlEncode(rdoServType.SelectedValue));
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
            cmd.Parameters.AddWithValue("@Note", HttpUtility.HtmlEncode(txtNote.Text));


            cmd.ExecuteNonQuery();
            con.Close();
        }


        protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlService.SelectedValue.Equals(""))
            {
                btnClearServ_Click(sender, e);
            }

            else
            {
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT CustomerFirstName, CustomerLastName, Service.CustomerID, ServiceType, ServiceDate," +
                    "EstimatedCost, CompletionDate, VehicleUsed, Service.ServiceID, MoveTime, FoodCost, FuelCost, LodgingCost," +
                    "EquipmentNeeded, DestinationAddress, DestinationCity, DestinationState, DestinationZip, Note, ServiceTicket.ServiceTicketID FROM Service RIGHT OUTER JOIN ServiceTicket ON Service.ServiceID = ServiceTicket.ServiceID WHERE Service.CustomerID  = @CustomerID", con);


                cmd.Parameters.AddWithValue("@CustomerID", ddlService.SelectedValue);

                SqlDataReader myReader = cmd.ExecuteReader();
                if (myReader.HasRows)
                {
                    while (myReader.Read())
                    {
                        txtFirstName.Text = Convert.ToString(myReader[0]);
                        txtLastName.Text = Convert.ToString(myReader[1]);
                        txtCustID1.Text = Convert.ToString(myReader[2]);
                        rdoServType.SelectedValue = Convert.ToString(myReader[3]);
                        txtDate1.Text = Convert.ToString(myReader[4]);
                        txtEstCost1.Text = Convert.ToString(myReader[5]);
                        txtCompDate1.Text = Convert.ToString(myReader[6]);
                        txtVehicleUsed1.Text = Convert.ToString(myReader[7]);
                        txtServiceID1.Text = Convert.ToString(myReader[8]);
                        txtMoveTime1.Text = Convert.ToString(myReader[9]);
                        txtFoodCost1.Text = Convert.ToString(myReader[10]);
                        txtFuelCost1.Text = Convert.ToString(myReader[11]);
                        txtLodgeCost1.Text = Convert.ToString(myReader[12]);
                        txtEquip1.Text = Convert.ToString(myReader[13]);
                        txtDestinationAddress1.Text = Convert.ToString(myReader[14]);
                        txtDestinationCity1.Text = Convert.ToString(myReader[15]);
                        txtDestinationState1.Text = Convert.ToString(myReader[16]);
                        txtDestinationZip1.Text = Convert.ToString(myReader[17]);
                        txtNote.Text = Convert.ToString(myReader[18]);
                        txtServTicketID.Text = Convert.ToString(myReader[19]);


                    }
                    myReader.Close();
                }
                con.Close();
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

            cmd.Parameters.AddWithValue("ServiceID", HttpUtility.HtmlEncode(txtServiceID1.Text));


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
    }
}


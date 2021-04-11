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
                if (Session["ID"] != null)
                {
                    ddlCustomers.SelectedValue = (string)Session["ID"];
                }
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

            rdoServType.SelectedValue = "Move";
            txtDate1.Text = "11/05/2020";
            txtEstCost1.Text = "1000";
            txtCompDate1.Text = "11/06/2020";
            txtNote.Text = "The Move Date may change to 11/06/2020, customer will contact"; 

        }

        //add service to db
        protected void btnCommitServ_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();
            
            try //insert service statement
            {
                String query = "INSERT INTO Service (CustomerID, ServiceType, ServiceDate, EstimatedCost, CompletionDate, NoteHeader, Note)" + 
                    "VALUES (@CustomerID, @ServiceType, @Date, @EstCost, @CompletionDate, @Note)";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@CustomerID", HttpUtility.HtmlEncode(ddlCustomers.SelectedValue));
                cmd.Parameters.AddWithValue("@ServiceType", HttpUtility.HtmlEncode(rdoServType.SelectedValue));
                cmd.Parameters.AddWithValue("@Date", HttpUtility.HtmlEncode(txtDate1.Text));
                cmd.Parameters.AddWithValue("@EstCost", HttpUtility.HtmlEncode(txtEstCost1.Text));
                cmd.Parameters.AddWithValue("@CompletionDate", HttpUtility.HtmlEncode(txtCompDate1.Text));
                cmd.Parameters.AddWithValue("@Note", HttpUtility.HtmlEncode(txtNote.Text));
                
                cmd.ExecuteNonQuery();

                string insertTicketStatement = "INSERT INTO ServiceTicket(TicketStatus, CustomerID, ServiceID, EmpID) " +
                    "VALUES(@Status, @CustomerID, (SELECT MAX(ServiceID) FROM Service), @EmpID)";
                SqlCommand cmdInsertTicket = new SqlCommand(insertTicketStatement, con);
                cmdInsertTicket.Parameters.AddWithValue("@Status", HttpUtility.HtmlEncode("Opened"));
                cmdInsertTicket.Parameters.AddWithValue("@CustomerID", HttpUtility.HtmlEncode(ddlCustomers.SelectedValue));
                cmdInsertTicket.Parameters.AddWithValue("@EmpID", HttpUtility.HtmlEncode(Session["Username"]));

                cmdInsertTicket.ExecuteNonQuery();

                con.Close();
                lblStatus1.Text = "Service information and initial ticket info successfully added";
            } 
            catch (Exception exc)
            {
                lblStatus1.Text = "Error saving service and/or ticket info: " + exc.ToString();
            }
        }



        //        protected void btnCreateServTicket_Click(object sender, EventArgs e)
        //        {
        //            Random rnd2 = new Random();
        //            int ServTicketID = rnd2.Next(10000, 100000);

        //            txtTicketID.Text = ServTicketID.ToString();

        //            {
        //                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
        //                con.Open();


        //                String query = "INSERT INTO ServiceTicket(TicketStatus, CustomerID, ServiceID, EmpID) VALUES(@Status, @CustomerID, @ServiceID, @EmpID)";
        //                SqlCommand cmd = new SqlCommand(query, con);
        //                cmd.Parameters.AddWithValue("@Status", HttpUtility.HtmlEncode("Opened"));
        //                cmd.Parameters.AddWithValue("@CustomerID", HttpUtility.HtmlEncode(ddlCustomers.SelectedValue));
        //                cmd.Parameters.AddWithValue("@EmpID", HttpUtility.HtmlEncode(Session["Username"]));


        //                try
        //                {
        //                    cmd.ExecuteNonQuery();
        //                    lblSuccess.Text = "Service Event Added Successfully";
        //                }
        //                catch (Exception)
        //                {
        //                    lblSuccess.Text = "Unable to insert data. You must add the service event to the database first. ";
        //                }
        //                finally
        //                {
        //                    con.Close();
        //                }
        //            }
        //        }
    }
}




using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;
namespace Lab2
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtNote.Text = (string)Session["Notes"];

            }
                string fullName = Session["FName"].ToString() + " " + Session["LName"].ToString();
                lblCustomerName.Text = fullName;
            
            //check if user is logged in
            if (Session["UserName"] != null)
            {
                lblUserLoggedIn.Text = Session["UserName"].ToString() + " successfully logged in";
            }
            else
            {
                Session["InvalidUse"] = "You must first login to access this page!";
                Response.Redirect("LoginPage.aspx");
            }

            //check buttons to color
            //switch (Page.Title)
            //{
            //case "Add Customer": case "Initial Contact":
            //    btnAddCustomer.BackColor = ColorTranslator.FromHtml("#325f57");
            ////    break;
            //case "Inventory":
            //    btnViewInventory.BackColor = ColorTranslator.FromHtml("#325f57");
            //    break;
            //case "Edit/View Service":
            //    btnEditViewServiceEvent.BackColor = ColorTranslator.FromHtml("#325f57");
            //    break;
            //case "Edit/View Customer":
            //    btnEditViewCustomer.BackColor = ColorTranslator.FromHtml("#325f57");
            //    break;
            //case "Move Form": case "Room Form":
            //    btnMovingForm.BackColor = ColorTranslator.FromHtml("#325f57");
            //    break;
            //case "Auction Form":
            //    btnAuctionForm.BackColor = ColorTranslator.FromHtml("#325f57");
            //    break;
            //case "Notifications":
            //    btnNotifications.BackColor = ColorTranslator.FromHtml("#325f57");
            //    break;
            //    }

            //}

            //Button Click Events
            //protected void btnAddCustomer_Click(object sender, EventArgs e)
            //{
            //    btnAddCustomer.BackColor = System.Drawing.Color.Green;

            //}

            //protected void btnAddServiceEvent_Click(object sender, EventArgs e)
            //{
            //    Response.Redirect("AddServ.aspx");

            //}

            //    protected void btnEditViewCustomer_Click(object sender, EventArgs e)
            //    {
            //        Response.Redirect("EditCust.aspx");
            //    }

            //    protected void btnEditViewServiceEvent_Click(object sender, EventArgs e)
            //    {
            //        Response.Redirect("EditServ2.aspx");
            //    }

            //    protected void btnViewEngagements_Click(object sender, EventArgs e)
            //    {

            //    }

            //    protected void btnViewInventory_Click(object sender, EventArgs e)
            //    {
            //        Response.Redirect("Inventory.aspx");
            //    }


            //    protected void btnSearch_Click(object sender, EventArgs e)
            //    {
            //        Response.Redirect("CustomerSearch.aspx");
            //    }

            //    protected void btnLogout_Click(object sender, EventArgs e)
            //    {
            //        Session.Abandon();
            //        Response.Redirect("LoginPage.aspx?loggedout=true");
            //    }

            //    protected void btnNotifications_Click(object sender, EventArgs e)
            //    {
            //        Response.Redirect("Notifications.aspx");
            //    }

            //    protected void btnMovingForm_Click(object sender, EventArgs e)
            //    {
            //        Response.Redirect("MovingForm.aspx");
            //    }

            //    protected void btnAuctionForm_Click(object sender, EventArgs e)
            //    {
            //        Response.Redirect("AuctionForm.aspx");
            //    }

            //    protected void UserIcon_Click(object sender, ImageClickEventArgs e)
            //    {
            //        Response.Redirect("LoginPage.aspx");
            //    }

            //    protected void btnAppraisal_Click(object sender, EventArgs e)
            //    {
            //        Response.Redirect("AppraisalServiceOrder.aspx");
            //    }
            //}

        }

        protected void btnSaveNotes_Click(object sender, EventArgs e)
        {
            String sqlquery = "UPDATE Customer SET Note = @Note WHERE Customer.CustomerID = @CustID;";



            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlquery, con);


            cmd.Parameters.AddWithValue("@Note", HttpUtility.HtmlEncode(txtNote.Text));
            cmd.Parameters.AddWithValue("@CustID", (string)Session["ID"]);
          

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            lblNotesSaved.Text = "Notes Saved Successfully";

            Session["Notes"] = txtNote.Text;
        }
    }
}

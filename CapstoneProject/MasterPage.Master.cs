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

            //check buttons to color
            switch (Page.Title)
            {
                case "Home":
                    HyperLink1.ForeColor = ColorTranslator.FromHtml("#266141");
                    break;
                case "Initial Contact Form":
                    HyperLink2.ForeColor = ColorTranslator.FromHtml("#266141");
                    break;
                case "Edit or View an Existing Customer":
                    HyperLink3.ForeColor = ColorTranslator.FromHtml("#266141");
                    break;
                case "Add a Service Event":
                    HyperLink4.ForeColor = ColorTranslator.FromHtml("#266141");
                    break;
                case "Edit or View Existing Service":
                    HyperLink5.ForeColor = ColorTranslator.FromHtml("#266141");
                    break;
                case "Move Inventory":
                    HyperLink6.ForeColor = ColorTranslator.FromHtml("#266141");
                    break;
                case "Appraisal Service Order Form":
                    HyperLink7.ForeColor = ColorTranslator.FromHtml("#266141");
                    break;
                case "Auction Form":
                    HyperLink8.ForeColor = ColorTranslator.FromHtml("#266141");
                    break;
                case "Initial Auction Service Form":
                    HyperLink9.ForeColor = ColorTranslator.FromHtml("#266141");
                    break;
                case "Moving Form":
                    HyperLink10.ForeColor = ColorTranslator.FromHtml("#266141");
                    break;
                case "Choose a Different Customer":
                    HyperLink11.ForeColor = ColorTranslator.FromHtml("#266141");
                    break;
            }

            txtNote.Text = txtNote.Text.Replace("&nbsp;", "");
            if (!IsPostBack)
            {                
                txtNote.Text = (string)Session["Notes"];

            }
                
            
            //check if user is logged in
            if (Session["UserName"] != null)
            {
                lblUserLoggedIn.Text = Session["UserName"].ToString() + " successfully logged in";
                string fullName = Session["FName"].ToString() + " " + Session["LName"].ToString();
                lblCustomerName.Text = fullName;
            }
            else
            {
                Session["InvalidUse"] = "You must first login to access this page!";
                Response.Redirect("LoginPage.aspx");
            }



        }

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

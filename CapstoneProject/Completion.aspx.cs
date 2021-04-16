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
    public partial class Completion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtFN.Text = (string)Session["FName"];
            txtLN.Text = (string)Session["LName"];
            txtPhoneNo.Text = (string)Session["PhoneNo"];
            txtEmail.Text = (string)Session["Email"];
            txtCustID.Text = (string)Session["ID"];
            txtServID.Text = (string)Session["ServID"];

            if ((string)Session["DestAddress"] != null)
            {
                txtAddress.Text = (string)Session["DestAddress"];
                txtCity.Text = (string)Session["DestCity"];
                txtState.Text = (string)Session["DestState"];
                txtZip.Text = (string)Session["DestZip"];
            }
         

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            String query2 = "Insert into Completion (Experience, PaymentReceived, FinalCost, AdditionalNotes, ServiceID, CustomerID) VALUES (@Exp, @Pay, @Cost, @Notes, @ServID, @CustID);";
            SqlCommand cmd = new SqlCommand(query2, con);

            cmd.Parameters.AddWithValue("@CustID", HttpUtility.HtmlEncode(txtCustID.Text));
            cmd.Parameters.AddWithValue("@Exp", HttpUtility.HtmlEncode(rdobtnPosNeg.SelectedValue));
            cmd.Parameters.AddWithValue("@Notes", HttpUtility.HtmlEncode(txtComments.Text));
            cmd.Parameters.AddWithValue("@Pay", HttpUtility.HtmlEncode(rdoYN.SelectedValue));
            cmd.Parameters.AddWithValue("@Cost", HttpUtility.HtmlEncode(txtFinalCost.Text));
            cmd.Parameters.AddWithValue("@ServID", HttpUtility.HtmlEncode(txtServID.Text));


            cmd.ExecuteNonQuery();
            con.Close();

            lblStatus.Text = "Information Saved";

            if (rdobtnPosNeg.SelectedValue == "Positive")
            {
                string email = (string)Session["Email"];
                ClientScript.RegisterStartupScript(this.GetType(), "mailto", "parent.location='mailto:" + email + "'", true);
            }
            else
            {
                string email = "greg@greenvalleyauctions.com;" + "info@greenvalleymoving.com";
                ClientScript.RegisterStartupScript(this.GetType(), "mailto", "parent.location='mailto:" + email + "'", true);
            }
            
        }
    }
}
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
    public partial class IntialAuctionService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void rbtnDeadY_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtnDeadY.Checked == true)
            {
                txtDeadDate.Enabled = true;
            }
        }

        protected void chkAuctionWalkthrough_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAuctionWalkthrough.Checked.Equals(true))
            {
                divAuctionWalk.Visible = true;
            }
        }

        protected void btnAddItemtoList_Click(object sender, EventArgs e)
        {
            txtDisplayItemsSell.Text +=  txtItemsSell.Text + "\n";
            txtItemsSell.Text = "";
        }

        protected void btnCommitIntialAuction_Click(object sender, EventArgs e)
        {
            string bringIn = "NO";
            string pickUp = "NO";
            string trashRemoval = "NO";
            string auctionWalkthrough = "NO";
            string customerRequestedWalk = "NULL";
            string greenValleyRequested = "NULL";
            string deadline = "";
            if (chkCustReq.Checked)
            {
                customerRequestedWalk = "YES";
            }
            if (chkGreenReq.Checked)
            {
                greenValleyRequested = "YES";
            }
            if (chkBringIn.Value.Equals("BringIn"))
            {
                bringIn = "YES";
            }
            if (chkPickUp.Value.Equals("PickUp"))
            {
                pickUp = "YES";
            }
            if (chkTrashRemoval.Value.Equals("Trash"))
            {
                trashRemoval = "YES";
            }
            if (chkAuctionWalkthrough.Checked)
            {
                auctionWalkthrough = "YES";
            }
            if (rbtnDeadN.Checked)
            {
                deadline = "NO";
            }
            if (rbtnDeadY.Checked)
            {
                deadline = txtDeadDate.Text;
            }

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            String query = "INSERT INTO Service (CustomerID, ServiceType, ServiceDate, EstimatedCost, CompletionDate, Note)" +
    "VALUES (@ItemsBeingSold, @ReasonForAuction, @Deadline, @BringIn, @PickUp, @TrashRemoval, @AuctionLookAt, )";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@ReasonForAuction", HttpUtility.HtmlEncode(txtReasonfor.Text));
            cmd.Parameters.AddWithValue("@Deadline", HttpUtility.HtmlEncode(deadline));
            cmd.Parameters.AddWithValue("@BringIn", HttpUtility.HtmlEncode(bringIn));
            cmd.Parameters.AddWithValue("@PickUp", HttpUtility.HtmlEncode(pickUp));
            cmd.Parameters.AddWithValue("@TrashRemoval", HttpUtility.HtmlEncode(trashRemoval));
            cmd.Parameters.AddWithValue("@AuctionLookAt", HttpUtility.HtmlEncode(auctionWalkthrough));
            cmd.Parameters.AddWithValue("@ItemsBeingSold", HttpUtility.HtmlEncode(txtDisplayItemsSell.Text));
            cmd.Parameters.AddWithValue("@CustomerRequested", HttpUtility.HtmlEncode(txtDisplayItemsSell.Text));
            cmd.Parameters.AddWithValue("@GreenValleyRequested", HttpUtility.HtmlEncode(txtDisplayItemsSell.Text));
            cmd.Parameters.AddWithValue("@ItemsBeingSold", HttpUtility.HtmlEncode(txtDisplayItemsSell.Text));
            cmd.Parameters.AddWithValue("@ItemsBeingSold", HttpUtility.HtmlEncode(txtDisplayItemsSell.Text));
            cmd.ExecuteNonQuery();

        }
    }
}
﻿using System;
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
            string auctionItem = "";
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            String query = "INSERT INTO AuctionInventory (ItemDescription)" +
    "VALUES (@ItemDescription)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@ItemDescription", HttpUtility.HtmlEncode(txtItemsSell.Text));
            cmd.ExecuteNonQuery();
            con.Close();

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
            string pickUpAddress = "";
            string pickUpCity = "";
            string pickUpState = "";
            string pickUpZip = "";
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
            if (chkbxPickUp.Checked)
            {
                pickUp = "YES";
                pickUpAddress = txtAuctionPickUpAddress.Text;
                pickUpCity = txtCity.Text;
                pickUpState = txtState.Text;
                pickUpZip = txtZip.Text;
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

            String query = "INSERT INTO IntialAuction (ReasonForAuction, Deadline, BringIn, PickUp, TrashRemoval, AuctionLookAt, CustomerRequested, GreenValleyRequested, PickUpAddress, PickUpCity, PickUpState, PickUpZip)" +
    "VALUES (@ReasonForAuction, @Deadline, @BringIn, @PickUp, @TrashRemoval, @AuctionLookAt, @CustomerRequested, @GreenValleyRequested, @PickUpAddress, @PickUpCity, @PickUpState, @PickUpZip)";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@ReasonForAuction", HttpUtility.HtmlEncode(txtReasonfor.Text));
            cmd.Parameters.AddWithValue("@Deadline", HttpUtility.HtmlEncode(deadline));
            cmd.Parameters.AddWithValue("@BringIn", HttpUtility.HtmlEncode(bringIn));
            cmd.Parameters.AddWithValue("@PickUp", HttpUtility.HtmlEncode(pickUp));
            cmd.Parameters.AddWithValue("@TrashRemoval", HttpUtility.HtmlEncode(trashRemoval));
            cmd.Parameters.AddWithValue("@AuctionLookAt", HttpUtility.HtmlEncode(auctionWalkthrough));
            cmd.Parameters.AddWithValue("@CustomerRequested", HttpUtility.HtmlEncode(txtDisplayItemsSell.Text));
            cmd.Parameters.AddWithValue("@GreenValleyRequested", HttpUtility.HtmlEncode(txtDisplayItemsSell.Text));
            //cmd.Parameters.AddWithValue("@ItemsBeingSold", HttpUtility.HtmlEncode(txtDisplayItemsSell.Text));
            //cmd.Parameters.AddWithValue("@ItemsBeingSold", HttpUtility.HtmlEncode(txtDisplayItemsSell.Text));
            cmd.Parameters.AddWithValue("@PickUpAddress", HttpUtility.HtmlEncode(pickUpAddress));
            cmd.Parameters.AddWithValue("@PickUpCity", HttpUtility.HtmlEncode(pickUpCity));
            cmd.Parameters.AddWithValue("@PickUpState", HttpUtility.HtmlEncode(pickUpState));
            cmd.Parameters.AddWithValue("@PickUpZip", HttpUtility.HtmlEncode(pickUpZip));

            cmd.ExecuteNonQuery();
            con.Close();

        }

        protected void chkbxPickUp_CheckedChanged(object sender, EventArgs e)
        {
            if (chkbxPickUp.Checked)
            {
                txtAuctionPickUpAddress.Visible = true;
                txtCity.Visible = true;
                txtState.Visible = true;
                txtZip.Visible = true;
                lblCity.Visible = true;
                lblState.Visible = true;
                lblZip.Visible = true;
                lblPickUp.Visible = true;
            }
        }
    }
}
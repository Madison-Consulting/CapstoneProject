using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
    }
}
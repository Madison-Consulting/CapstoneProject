using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace Lab3
{
    public partial class InitialContact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
     

            if (!IsPostBack)
            {
                txtFN.Text = (string)Session["FName"];
                txtLN.Text = (string)Session["LName"];
                txtCustomerID.Text = (string)Session["ID"];
                txtDateTime.Text = DateTime.Now.ToString();                        
            }
         
                
            

            //if (!Session["Firstname"].Equals(null))
            //{

            //    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            //    con.Open();



            //    String sqlquery = "SELECT CustomerID From Customer Where CustFirstName = @fn AND CustLastName = @ln;";
            //    SqlCommand cmd = new SqlCommand(sqlquery, con);



            //    cmd.Parameters.AddWithValue("@fn", fn.ToString());
            //    cmd.Parameters.AddWithValue("@ln", ln.ToString());


            //    cmd.ExecuteNonQuery();

            //    con.Close();
            //}
        }


        protected void ddlContact_SelectedIndexChanged(object sender, EventArgs e)
        {
            {
                if (ddlContact.SelectedValue == "Other")
                {
                    txtOther.Text = "";
                    txtOther.Visible = true;
                }
                else
                {
                    txtOther.Visible = false;
                }
            }
        }

        //protected void rdobtnServ_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (rdobtnServ.SelectedValue == "Auction")
        //    {
        //        txtMovingAddress.Enabled = false;
        //        txtMovingCity.Enabled = false;
        //        txtMovingState.Enabled = false;
        //        txtMovingZip.Enabled = false;
        //    }
        //    else if (rdobtnServ.SelectedValue == "Moving")
        //    {
        //        txtMovingAddress.Enabled = true;
        //        txtMovingCity.Enabled = true;
        //        txtMovingState.Enabled = true;
        //        txtMovingZip.Enabled = true;
        //    }
        //}

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

        protected void btnSaveInitial_Click(object sender, EventArgs e)
        {
            string selectedItems = String.Join(",", chkService.Items.OfType<ListItem>().Where(r => r.Selected)
          .Select(r => r.Text));

            String sqlquery = "UPDATE Customer SET InitialContact = @InitialContact, InterestedService = @InterestedService, HearAbout = @HearAbout, MoveAddress = @MoveAddress, " +
                "MoveCity =  @MoveCity, MoveState = @MoveState, MoveZip = @MoveZip, DateTimeInitial = @DateTimeInitial, Deadline = @Deadline, Time1 = @Time1, Deadline2 = @Deadline2, " +
                "Time2 = @Time2 WHERE Customer.CustomerID = @CustID;";



            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlquery, con);



            cmd.Parameters.AddWithValue("@CustID", HttpUtility.HtmlEncode(txtCustomerID.Text));
            cmd.Parameters.AddWithValue("@InitialContact", ddlContact.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@InterestedService", selectedItems);
            cmd.Parameters.AddWithValue("@HearAbout", HttpUtility.HtmlEncode(txtHearAbout.Text));
            cmd.Parameters.AddWithValue("@MoveAddress", HttpUtility.HtmlEncode(txtMovingAddress.Text));
            cmd.Parameters.AddWithValue("@MoveCity", HttpUtility.HtmlEncode(txtMovingCity.Text));
            cmd.Parameters.AddWithValue("@MoveState", HttpUtility.HtmlEncode(txtMovingState.Text));
            cmd.Parameters.AddWithValue("@MoveZip", HttpUtility.HtmlEncode(txtMovingZip.Text));
            cmd.Parameters.AddWithValue("@DateTimeInitial", HttpUtility.HtmlEncode(txtDateTime.Text));
            cmd.Parameters.AddWithValue("@Deadline", HttpUtility.HtmlEncode(txtDeadline.Text));
            cmd.Parameters.AddWithValue("@Time1", HttpUtility.HtmlEncode(txtTime.Text));
            cmd.Parameters.AddWithValue("@Deadline2", HttpUtility.HtmlEncode(txtDeadline2.Text));
            cmd.Parameters.AddWithValue("@Time2", HttpUtility.HtmlEncode(txtTime2.Text));

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            lblStatus.Text = "Initial Contact Information Added Successfully";


        }
        //protected void rdobtnServ_SelectedIndexChanged1(object sender, EventArgs e)
        //{
        //    if (rdobtnServ.SelectedValue == "Auction")
        //    {
        //        txtMovingAddress.Enabled = false;
        //        txtMovingCity.Enabled = false;
        //        txtMovingState.Enabled = false;
        //        txtMovingZip.Enabled = false;
        //    }
        //    else if (rdobtnServ.SelectedValue == "Moving")
        //    {
        //        txtMovingAddress.Enabled = true;
        //        txtMovingCity.Enabled = true;
        //        txtMovingState.Enabled = true;
        //        txtMovingZip.Enabled = true;
        //    }
        //}

        protected void btnAddService_Click(object sender, EventArgs e)
        {
            Session["FName"] = txtFN.Text;
            Session["LName"] = txtLN.Text;
            Session["ID"] = txtCustomerID.Text;
            Response.Redirect("AddServ.aspx");
        }
    }
}
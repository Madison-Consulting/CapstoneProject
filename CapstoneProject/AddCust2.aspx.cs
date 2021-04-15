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
    public partial class AddCust2 : System.Web.UI.Page
    {
        private bool btnCommitAddCustWasClicked = false;

            protected void Page_Load(object sender, EventArgs e)
            {
                if (Page.IsPostBack)
                {
                    btnInitialContact.Visible = true;
                    btnAddService.Visible = true;
                }
                else
                {
                    btnInitialContact.Visible = false;
                    btnAddService.Visible = false;
                }
            }

            //Button Click Events

            //populate customer fields


            //save customer to DB
            protected void btnCommitAddCust_Click(object sender, EventArgs e)
            {

                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                con.Open();


                String query = "INSERT INTO Customer (CustFirstName,CustLastName,PhoneType, PhoneNumber,Email,CustAddress," +
                    "CustCity,CustState,CustZip,CustomerID) " +
                    "VALUES (@FirstName, @LastName, @PhoneType, @CustomerPhone, @CustomerEmail, @Address, @City, @State, @ZipCode, @CustomerID)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CustomerID", HttpUtility.HtmlEncode(txtCustomerID.Text));
                cmd.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text));
                cmd.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(txtLastName.Text));
                cmd.Parameters.AddWithValue("@CustomerPhone", HttpUtility.HtmlEncode(txtPhoneNo.Text));
                cmd.Parameters.AddWithValue("@CustomerEmail", HttpUtility.HtmlEncode(txtEmail.Text));
                cmd.Parameters.AddWithValue("@Address", HttpUtility.HtmlEncode(txtAddress.Text));
                cmd.Parameters.AddWithValue("@City", HttpUtility.HtmlEncode(txtCity.Text));
                cmd.Parameters.AddWithValue("@State", HttpUtility.HtmlEncode(txtState.Text));
                cmd.Parameters.AddWithValue("@ZipCode", HttpUtility.HtmlEncode(txtZip.Text));
                cmd.Parameters.AddWithValue("@PhoneType", rdoPhoneType.SelectedValue);


                cmd.ExecuteNonQuery();
                con.Close();

            btnAddService.Enabled = true;
            btnInitialContact.Enabled = true;
            lblStatus.Text = "Customer Added!";
            }
        

            //clear all data fields
            protected void btnClear_Click(object sender, EventArgs e)
            {
                ClearAllText(Page);
            }

            //clear all text method to be called
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



            protected void btnInitialContact_Click(object sender, EventArgs e)
            {
                Session["FName"] = txtFirstName.Text;
                Session["LName"] = txtLastName.Text;
                Session["ID"] = txtCustomerID.Text;
                Response.Redirect("InitialContact.aspx");
            }

        protected void btnAddService_Click(object sender, EventArgs e)
        {
            Session["FName"] = txtFirstName.Text;
            Session["LName"] = txtLastName.Text;
            Session["ID"] = txtCustomerID.Text;
            Response.Redirect("AddServ.aspx");
        }
    }
}

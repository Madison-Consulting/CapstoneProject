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
    public partial class AddCust : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Page.IsPostBack)
            //{
            //    btnInitialContact.Visible = true;
            //    btnAddService.Visible = true;
            //}
            //else
            //{
            //    btnInitialContact.Visible = false;
            //    btnAddService.Visible = false;
            //}
        }

        protected void btnCommitAddCust_Click(object sender, EventArgs e)
        {
            Random rnd = new Random();
            int CustID = rnd.Next(10000000, 100000000);
            txtCustomerID.Text = CustID.ToString();


            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();


            String query = "INSERT INTO Customer (CustFirstName,CustLastName,PhoneType, PhoneNumber,Email,CustAddress, CustAddress2" +
                "CustCity,CustState,CustZip,CustomerID, Note) " +
                "VALUES (@FirstName, @LastName, @PhoneType, @CustomerPhone, @CustomerEmail, @Address, @Address2@City, @State, @ZipCode, @CustomerID, @Note)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@CustomerID", HttpUtility.HtmlEncode(txtCustomerID.Text));
            cmd.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text));
            cmd.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(txtLastName.Text));
            cmd.Parameters.AddWithValue("@CustomerPhone", HttpUtility.HtmlEncode(txtPhoneNo.Text));
            cmd.Parameters.AddWithValue("@CustomerEmail", HttpUtility.HtmlEncode(txtEmail.Text));
            cmd.Parameters.AddWithValue("@Address", HttpUtility.HtmlEncode(txtAddress.Text));
            cmd.Parameters.AddWithValue("@Address2", HttpUtility.HtmlEncode(txtAddress2.Text));
            cmd.Parameters.AddWithValue("@City", HttpUtility.HtmlEncode(txtCity.Text));
            cmd.Parameters.AddWithValue("@State", HttpUtility.HtmlEncode(txtState.Text));
            cmd.Parameters.AddWithValue("@ZipCode", HttpUtility.HtmlEncode(txtZip.Text));
            cmd.Parameters.AddWithValue("@PhoneType", rdoPhoneType.SelectedValue);
            cmd.Parameters.AddWithValue("@Note", HttpUtility.HtmlEncode(txtNote.Text));


            cmd.ExecuteNonQuery();
            con.Close();

            //btnAddService.Enabled = true;
            //btnInitialContact.Enabled = true;
            lblStatus.Text = "Customer Added!";

            Session["FName"] = txtFirstName.Text;
            Session["LName"] = txtLastName.Text;
            Session["PhoneNo"] = txtPhoneNo.Text;
            Session["Email"] = txtEmail.Text;
            Session["Address"] = txtAddress.Text;
            Session["City"] = txtCity.Text;
            Session["State"] = txtState.Text;
            Session["Zip"] = txtZip.Text;
            Session["ID"] = txtCustomerID.Text;
            Session["Notes"] = txtNote.Text;
            Response.Redirect("EmpLandingPage.aspx");
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using System.Configuration;

namespace CapstoneProject
{
    public partial class AppraisalServiceOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFirstName.Text = (string)Session["FName"];
                txtLastName.Text = (string)Session["LName"];
                txtPhoneNo.Text = (string)Session["PhoneNo"];
                txtEmail.Text = (string)Session["Email"];
                txtAddress.Text = (string)Session["Address"];
                txtCity.Text = (string)Session["City"];
                txtState.Text = (string)Session["State"];
                txtZip.Text = (string)Session["Zip"];
                txtCustomerID.Text = (string)Session["ID"];
                txtNote.Text = (string)Session["Notes"];
            }

        }

        protected void btnMoveAssess_Click(object sender, EventArgs e)
        {
            Response.Redirect("MovingForm.aspx");
        }

        protected void btnAuctionAssess_Click(object sender, EventArgs e)
        {
            Response.Redirect("AuctionForm.aspx");
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(upldPhoto.PostedFile.FileName);
            string contentType = upldPhoto.PostedFile.ContentType;
            using (Stream fs = upldPhoto.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["Lab3"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        string query = "INSERT INTO ApprasialServiceOrder VALUES @Name WHERE CustomerID = @CustomerID";
                        using (SqlCommand cmd = new SqlCommand(query))
                        {
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@Name", filename);
                            cmd.Parameters.AddWithValue("@CustomerID", txtCustomerID.Text);

                            //cmd.Parameters.AddWithValue("@ContentType", contentType);
                            //cmd.Parameters.AddWithValue("@Data", bytes);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }
            }

            lblMessage.Text = "File uploaded successfully.";
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            String sqlquery = "Insert Into AppraisalServiceOrder (Purpose, DeadlineYN, DeadlineDate, Size, Inventory, CustomerID) Values (@Purpose, @Deadline, @Date, @Size, @Inv, @ID);";

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlquery, con);


            cmd.Parameters.AddWithValue("@Purpose", HttpUtility.HtmlEncode(rdoPurpose.SelectedValue));
            cmd.Parameters.AddWithValue("@Deadline", rdobtnDeadline.SelectedValue);
            cmd.Parameters.AddWithValue("@Date", HttpUtility.HtmlEncode(txtDeadline1.Text));
            cmd.Parameters.AddWithValue("@Size", HttpUtility.HtmlEncode(txtSize.Text));
            cmd.Parameters.AddWithValue("@Inv", HttpUtility.HtmlEncode(txtInventory.Text));
            cmd.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(txtCustomerID.Text));


            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            lblSaveStatus.Text = "Information Saved Successfully";
        }
    }
}
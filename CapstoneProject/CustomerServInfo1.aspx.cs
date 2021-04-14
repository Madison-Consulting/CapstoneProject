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
using System.Drawing;

namespace CapstoneProject
{
    public partial class CustomerServInfo1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {

                txtEmail.Text = Session["Email"].ToString();

                txtCustomerID.Text = Session["ID"].ToString();
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            if (FileUpload1.HasFile == true)
            {
                foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
                {
                    string filename = Path.GetFileName(postedFile.FileName);
                    postedFile.SaveAs(Server.MapPath("~/Uploads/") + filename);
                    string str = FileUpload1.FileName;
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/" + str));
                    string Image = "~/Uploads/" + str.ToString();
                    string name = FileUpload1.FileName.ToString();

                    SqlConnection con1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                    con1.Open();

                    String query = "Insert into CustPhotos (Name, Image, CustomerID) VALUES (@Name, @Image, @CustID)";
                    SqlCommand cmd = new SqlCommand(query, con1);

                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Image", Image);
                    cmd.Parameters.AddWithValue("@CustID", HttpUtility.HtmlEncode(txtCustomerID.Text));


                    cmd.ExecuteNonQuery();
                    con1.Close();

                    lblUploadStatus.Text = "Images Uploaded";
                    lblUploadStatus.ForeColor = System.Drawing.Color.ForestGreen;

                }
            }
            else
            {
                lblUploadStatus.Text = "Please Upload your Image";
                lblUploadStatus.ForeColor = System.Drawing.Color.Red;
            }
        }


        protected void btnSubmitRequest_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            string status = "Unassigned";

            SqlCommand cmd1 = new SqlCommand("SELECT CustomerID From Customer WHERE Email = @Email", con);

            cmd1.Parameters.AddWithValue("@Email", txtEmail.Text);

            SqlDataReader myReader3 = cmd1.ExecuteReader();
            if (myReader3.HasRows)
            {
                while (myReader3.Read())
                {
                    string variable = Convert.ToString(myReader3[0]);

                    SqlConnection con1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                    con1.Open();

                    String query = "INSERT INTO ServiceRequest (ServiceRequest.UserEmail, ServiceRequest.CustomerID, ServiceRequest.ServiceType, ServiceRequest.ServiceDate, ServiceRequest.Needs, ServiceRequest.TicketStatus) VALUES (@Email, @CustomerID, @ServiceType, @ServiceDate, @Needs, @Status)";
                    SqlCommand cmd = new SqlCommand(query, con1);

                    cmd.Parameters.AddWithValue("@ServiceType", rdobtnServ.SelectedValue);
                    cmd.Parameters.AddWithValue("@CustomerID", variable);
                    cmd.Parameters.AddWithValue("@Email", Session["Email"].ToString());
                    cmd.Parameters.AddWithValue("@ServiceDate", HttpUtility.HtmlEncode(txtDate.Text));
                    cmd.Parameters.AddWithValue("@Needs", HttpUtility.HtmlEncode(txtNeeds.Text));
                    cmd.Parameters.AddWithValue("@Status", status);

                    cmd.ExecuteNonQuery();
                    con1.Close();

                }
                myReader3.Close();
            }
            con.Close();
            lblStatus.Text = "Service Request Created";
        }

    }
}
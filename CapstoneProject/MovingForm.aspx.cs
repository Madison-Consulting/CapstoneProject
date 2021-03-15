using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace CapstoneProject
{
    public partial class MovingForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnCommit_Click(object sender, EventArgs e)
        {
            // Connection to the customer database
            HttpUtility.HtmlEncode(txtLoad.Text);
            HttpUtility.HtmlEncode(txtStories.Text);
            HttpUtility.HtmlEncode(txtDistance.Text);
            HttpUtility.HtmlEncode(ddlDriveway.Text);


            if (txtLoad.Text != "" && txtStories.Text != "" && txtDistance.Text != "" && ddlDriveway.Text != "") // fields must be filled
            {
                // COMMIT VALUES
                try
                {
                    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

                    lblStatus.Text = "Database Connection Successful";


                    //sc.Open();


                    sc.Open();


                    System.Data.SqlClient.SqlCommand createUser = new System.Data.SqlClient.SqlCommand();
                    createUser.Connection = sc;
                    // INSERT USER RECORD
                    createUser.CommandText = "INSERT INTO MoveForm (HouseStories, TruckDistance, Accessibility, LoadingCondition) VALUES (@HouseStories, @TruckDistance, @Accessibility, @LoadingCondition)";
                    createUser.Parameters.Add(new SqlParameter("@HouseStories", txtStories.Text));
                    createUser.Parameters.Add(new SqlParameter("@LoadingCondition", txtLoad.Text));
                    createUser.Parameters.Add(new SqlParameter("@TruckDistance", txtDistance.Text));
                    createUser.Parameters.Add(new SqlParameter("@Accessibility", ddlDriveway.Text));
                    createUser.ExecuteNonQuery();




                    sc.Close();

                    lblStatus.Text = "Information committed!";
                    txtStories.Enabled = false;
                    txtLoad.Enabled = false;
                    txtDistance.Enabled = false;
                    ddlDriveway.Enabled = false;
                  
                    btnCommit.Enabled = false;
                    lnkAnother.Visible = true;

                }
                catch
                {
                    lblStatus.Text = "Database Error - Information not committed";
                }

            }
            else
                lblStatus.Text = "Please fill all fields";
        }

        protected void lnkAnother_Click(object sender, EventArgs e)
        {
            txtStories.Enabled = true;
            txtLoad.Enabled = true;
            txtDistance.Enabled = true;
            ddlDriveway.Enabled = true;
            btnCommit.Enabled = true;
            lnkAnother.Visible = false;
            txtStories.Text = "";
            txtLoad.Text = "";
            txtDistance.Text = "";
            ddlDriveway.Text = "";
           
        }

        protected System.Void btnNext_Click(System.Object sender, System.EventArgs e)
        {
            response.redirect("MovingFormPt2.aspx");
        }
    }

}

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

        protected void ddlDriveway_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCommit_Click(object sender, EventArgs e)
        { 
        // Connection to the customer database

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

        //Fills the customers database with the txt boxes filled out by the user and enters it into the database

        con.Open();
        string query = "";

        SqlCommand cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
            con.Close();
        }
        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("MoveFormPt2.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
        Server.Transfer("HomeMaster.aspx");
        }
    }
}
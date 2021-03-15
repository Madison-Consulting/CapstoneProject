using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;
namespace Lab3
{
    public partial class StartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Get("loggedout") == "true")
            {
                lblStatus.ForeColor = Color.Green;
                lblStatus.Text = "User has successfully logged out";
            }
        }

        protected void btnEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }

        protected void btnCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerCreate.aspx");
        }

        protected void btnExistingCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerLogin.aspx");
        }

        protected void btnNewEmp_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewEmployee.aspx");
        }
    }
}
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
    public partial class testNotifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddInitial_Click(object sender, EventArgs e)
        {
            Session["ID"] = txtCustID.Text;
            Session["FName"] = lblFN.Text;
            Session["LName"] = lblLN.Text;
            
            Response.Redirect("InitialContact.aspx");
        }

        protected void btnAddService_Click(object sender, EventArgs e)
        {
            Session["ID"] = txtCustID.Text;
            Session["FName"] = lblFN.Text;
            Session["LName"] = lblLN.Text;
            Session["Date"] = lblDate.Text;
            Session["ServiceType"] = lblServiceType.Text;
            Response.Redirect("AddServ.aspx");
        }

        protected void ddlNotifs_SelectedIndexChanged(object sender, EventArgs e)
        {
                SqlConnection con1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                con1.Open();
                string query2 = ("Select Customer.CustFirstName,Customer.CustLastName,Customer.Email, ServiceRequest.ServiceType, ServiceRequest.ServiceDate, ServiceRequest.TicketStatus, ServiceRequest.Needs, Customer.CustomerID FROM Customer INNER JOIN ServiceRequest ON Customer.CustomerID = ServiceRequest.CustomerID WHERE Customer.CustomerID = @CustID;");
                SqlCommand cmd1 = new SqlCommand(query2, con1);
                cmd1.Parameters.AddWithValue("@CustID", HttpUtility.HtmlEncode(ddlNotifs.SelectedValue));
                SqlDataReader myReader3 = cmd1.ExecuteReader();
                if (myReader3.HasRows)
                {
                    while (myReader3.Read())
                    {
                        lblFN.Text = Convert.ToString(myReader3[0]);
                        lblLN.Text = Convert.ToString(myReader3[1]);
                        lblEmail.Text = Convert.ToString(myReader3[2]);
                        lblServiceType.Text = Convert.ToString(myReader3[3]);
                        lblDate.Text = Convert.ToString(myReader3[4]);
                        lblStatus.Text = Convert.ToString(myReader3[5]);
                        lblDetails.Text = Convert.ToString(myReader3[6]);
                        txtCustID.Text = Convert.ToString(myReader3[6]);
                    }
                    myReader3.Close();
                }
                con1.Close();
            }

        }
    }


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
    public partial class ChooseCustomer : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Session["InvalidUse"] = "You must first login to access this page!";
                Response.Redirect("LoginPage.aspx");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblStatus.Text = null;

            string hex = "#266141";
            GridView2.HeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml(hex);
            GridView2.HeaderStyle.ForeColor = System.Drawing.Color.White;
            try
            {
                GridView2.DataSource = null;
                GridView2.DataBind();
                
                String sqlQuery = "Select CustFirstName as 'Customer First Name', CustLastName as 'Customer Last Name', PhoneNumber as 'Phone Number', Email, CustAddress  as 'Address',  CustAddress2 as 'Address 2', CustCity as 'City', CustState as 'State', CustZip as 'Zip', CustomerID, Note as 'Notes' FROM Customer WHERE CustFirstName LIKE '%" + txtCustSearch.Text + "%' or CustLastName LIKE '%" + txtCustSearch.Text + "%' or CustFullName LIKE '%" + txtCustSearch.Text + "%';";


                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
  
                DataTable dtCustomerGridView = new DataTable();
                sqlAdapter.Fill(dtCustomerGridView);
          
                if (dtCustomerGridView.Rows.Count == 0)
                {
                    lblStatus.Text = "No Customers Found with that Name!";
                    
                }
                GridView2.DataSource = dtCustomerGridView;
                GridView2.DataBind();

            }catch (Exception)
            {
               lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Error Searching for Customer";
            }



            //SqlConnection con3 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            //con3.Open();

            //SqlCommand cmd1 = new SqlCommand(sqlQuery, con3);
            //SqlDataReader myReader3 = cmd1.ExecuteReader();
            //if (myReader3.HasRows)
            //{
            //    while (myReader3.Read())
            //    {
            //        lblFirstName.Text = Convert.ToString(myReader3[0]);
            //        lblLastName.Text = Convert.ToString(myReader3[1]);
            //        lblPhoneNo.Text = Convert.ToString(myReader3[2]);
            //        lblEmail.Text = Convert.ToString(myReader3[3]);
            //        lblAddress.Text = Convert.ToString(myReader3[4]);
            //        lblCity.Text = Convert.ToString(myReader3[5]);
            //        lblState.Text = Convert.ToString(myReader3[6]);
            //        lblZip.Text = Convert.ToString(myReader3[7]);
            //        lblCustomerID.Text = Convert.ToString(myReader3[8]);
            //    }
            //    myReader3.Close();
            //}
            //con3.Close();
        }
    

        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCust.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LoginPage.aspx?loggedout=true");
        }


        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["FName"] = GridView2.SelectedRow.Cells[1].Text;
            Session["LName"] = GridView2.SelectedRow.Cells[2].Text;
            Session["PhoneNo"] = GridView2.SelectedRow.Cells[3].Text;
            Session["Email"] = GridView2.SelectedRow.Cells[4].Text;
            Session["Address"] = GridView2.SelectedRow.Cells[5].Text;
            if (GridView2.SelectedRow.Cells[6].Text == null)
            {
                Session["Address2"] = null;

            }
            else
            {
                Session["Address2"] = GridView2.SelectedRow.Cells[6].Text;
            }
            Session["City"] = GridView2.SelectedRow.Cells[7].Text;
            Session["State"] = GridView2.SelectedRow.Cells[8].Text;
            Session["Zip"] = GridView2.SelectedRow.Cells[9].Text;
            Session["ID"] = GridView2.SelectedRow.Cells[10].Text;

            if (GridView2.SelectedRow.Cells[11].Text == null)
            {
                Session["Notes"] = Server.HtmlDecode(GridView2.SelectedRow.Cells[11].Text);
            }
            else
            {
                Session["Notes"] = GridView2.SelectedRow.Cells[11].Text;
                
            }
          

         
            Response.Redirect("EmpLandingPage.aspx");
        }

        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            string hex = "#266141";
            GridView2.HeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml(hex);
            GridView2.HeaderStyle.ForeColor = System.Drawing.Color.White;
            try
            {
                GridView2.DataSource = null;
                GridView2.DataBind();

                String sqlQuery = "Select CustFirstName as 'Customer First Name', CustLastName as 'Customer Last Name', PhoneNumber as 'Phone Number', Email, CustAddress  as 'Address', CustAddress2 as 'Address 2' , CustCity as 'City', CustState as 'State', CustZip as 'Zip', CustomerID, Note as 'Notes' FROM Customer;";


                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

                DataTable dtCustomerGridView = new DataTable();
                sqlAdapter.Fill(dtCustomerGridView);

                GridView2.DataSource = dtCustomerGridView;
                GridView2.DataBind();

            }
            catch (Exception)
            {
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Error Searching for Customer";
            }

        }
    }
}
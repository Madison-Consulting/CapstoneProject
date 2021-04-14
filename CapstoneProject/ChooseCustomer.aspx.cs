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
        private string customerID;
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
            //Searching the Database for a Customer. 
            string conversionVariable;
            string searchedCustID = "";



            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            //Customer Firstname
            String queryFirstName = "SELECT Customer.CustomerID, Customer.CustFirstName, Customer.CustLastName FROM Customer WHERE CustFirstName = @CustFirstName;";
            SqlCommand cmdFirstName = new SqlCommand(queryFirstName, con);
            cmdFirstName.Parameters.AddWithValue("@CustFirstName", txtCustSearch.Text);
            cmdFirstName.ExecuteNonQuery();
            SqlDataReader queryResultsFirstName = cmdFirstName.ExecuteReader();
            bool checkForValuesFirstName = queryResultsFirstName.Read();



            if (checkForValuesFirstName.Equals(false))
            {
                //Check for last name if firstname is not found.
                queryResultsFirstName.Close();
                String queryLastName = "SELECT CustomerID, CustLastName, Customer.CustFirstName FROM Customer WHERE CustLastName = @CustLastName;";
                SqlCommand cmdLastName = new SqlCommand(queryLastName, con);
                cmdLastName.Parameters.AddWithValue("@CustLastName", txtCustSearch.Text);
                cmdLastName.ExecuteNonQuery();
                SqlDataReader queryResultsLastName = cmdLastName.ExecuteReader();
                bool checkForValuesLastName = queryResultsLastName.Read();
                //queryResultsLastName.Close();

                if (checkForValuesLastName.Equals(false))
                {
                    //lblSearchStatus.Text = "No Results Found";
                    queryResultsLastName.Close();
                    //queryResultsFirstName.Close();
                    con.Close();
                }
                else
                {
                    conversionVariable = Convert.ToString(queryResultsLastName["CustomerID"]);
                    //searchedCustID = int.Parse(conversionVariable);
                    searchedCustID = conversionVariable;
                    customerID = searchedCustID;
                    queryResultsLastName.Close();
                    queryResultsFirstName.Close();
                    con.Close();
                }
            }
            else
            {

                conversionVariable = Convert.ToString(queryResultsFirstName["CustomerID"]);
                searchedCustID = conversionVariable;
                customerID = searchedCustID;
                queryResultsFirstName.Close();

                con.Close();
            }



            SqlConnection con1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con1.Open();
            string query2 = ("Select CustFirstName,CustLastName,PhoneNumber,Email,CustAddress,CustCity,CustState,CustZip,CustomerID FROM Customer WHERE CustomerID ='" + searchedCustID + "';");
            SqlCommand cmd1 = new SqlCommand(query2, con1);
            SqlDataReader myReader3 = cmd1.ExecuteReader();
            if (myReader3.HasRows)
            {
                while (myReader3.Read())
                {
                    lblFirstName.Text = Convert.ToString(myReader3[0]);
                    lblLastName.Text = Convert.ToString(myReader3[1]);
                    lblPhoneNo.Text = Convert.ToString(myReader3[2]);
                    lblEmail.Text = Convert.ToString(myReader3[3]);
                    lblAddress.Text = Convert.ToString(myReader3[4]);
                    lblCity.Text = Convert.ToString(myReader3[5]);
                    lblState.Text = Convert.ToString(myReader3[6]);
                    lblZip.Text = Convert.ToString(myReader3[7]);
                    lblCustomerID.Text = Convert.ToString(myReader3[8]);
                }
                myReader3.Close();
            }
            con1.Close();
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            Session["FName"] = lblFirstName.Text;
            Session["LName"] = lblLastName.Text;
            Session["PhoneNo"] = lblPhoneNo.Text;
            Session["Email"] = lblEmail.Text;
            Session["Address"] = lblAddress.Text;
            Session["City"] = lblCity.Text;
            Session["State"] = lblState.Text;
            Session["Zip"] = lblZip.Text;
            Session["ID"] = lblCustomerID.Text;
            Session["Notes"] = txtNote.Text;
            Response.Redirect("EmpLandingPage.aspx");

        }

        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCust.aspx");
        }
    }
}
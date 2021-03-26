using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace Lab2
{
    public partial class EditCust : System.Web.UI.Page
    {
        private string customerID;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Button Click Events


        //populate customer fields
        protected void btnPopulateCust_Click(object sender, EventArgs e)
        {
            txtFirstName.Text = "Erica";
            txtLastName.Text = "Swan";
            txtPhoneNo.Text = "1763211284";
            txtEmail.Text = "swannie@gmail.com";
            txtAddress.Text = "438 Harlem Rd";
            txtCity.Text = "Cheektowaga";
            txtState.Text = "NY";
            txtZip.Text = "14222";
            txtCustomerID.Text = "117232524";

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

        //update customer in Db
        protected void btnUpdateCust_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            String query2 = "UPDATE Customer SET CustFirstName = @FirstName, CustLastName = @LastName, PhoneNumber = @CustomerPhone, Email= @CustomerEmail, " +
                "CustAddress= @Address, CustCity = @City, CustState = @State ,CustZip = @ZipCode, CustomerID = @CustomerID WHERE CustomerID = @CustomerID";
            SqlCommand cmd = new SqlCommand(query2, con);

            cmd.Parameters.AddWithValue("@CustomerID", HttpUtility.HtmlEncode(txtCustomerID.Text));
            cmd.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text));
            cmd.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(txtLastName.Text));
            cmd.Parameters.AddWithValue("@CustomerPhone", HttpUtility.HtmlEncode(txtPhoneNo.Text));
            cmd.Parameters.AddWithValue("@CustomerEmail", HttpUtility.HtmlEncode(txtEmail.Text));
            cmd.Parameters.AddWithValue("@Address", HttpUtility.HtmlEncode(txtAddress.Text));
            cmd.Parameters.AddWithValue("@City", HttpUtility.HtmlEncode(txtCity.Text));
            cmd.Parameters.AddWithValue("@State", HttpUtility.HtmlEncode(txtState.Text));
            cmd.Parameters.AddWithValue("@ZipCode", HttpUtility.HtmlEncode(txtZip.Text));
            cmd.ExecuteNonQuery();
            con.Close();
        }
        //drop down list of current customers
        //protected void CustDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (DropDownList1.SelectedValue.Equals(""))
        //    {
        //        btnClear_Click(sender, e);
        //    }
        //    else
        //    {
        //        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("Select CustFirstName,CustLastName,PhoneNumber,Email,CustAddress,CustCity,CustState,CustZip,CustomerID FROM Customer WHERE CustomerID = @ln", con);

        //        cmd.Parameters.AddWithValue("@ln", DropDownList1.SelectedValue);

        //        SqlDataReader myReader3 = cmd.ExecuteReader();
        //        if (myReader3.HasRows)
        //        {
        //            while (myReader3.Read())
        //            {
        //                txtFirstName.Text = Convert.ToString(myReader3[0]);
        //                txtLastName.Text = Convert.ToString(myReader3[1]);
        //                txtPhoneNo.Text = Convert.ToString(myReader3[2]);
        //                txtEmail.Text = Convert.ToString(myReader3[3]);
        //                txtAddress.Text = Convert.ToString(myReader3[4]);
        //                txtCity.Text = Convert.ToString(myReader3[5]);
        //                txtState.Text = Convert.ToString(myReader3[6]);
        //                txtZip.Text = Convert.ToString(myReader3[7]);
        //                txtCustomerID.Text = Convert.ToString(myReader3[8]);
        //            }
        //            myReader3.Close();
        //        }
        //        con.Close();
        //    }
        //}
        //view all customers in a grid view
        //protected void btnViewAll_Click(object sender, EventArgs e)
        //{
        //    grdvwCustDisplay.DataSource = null;
        //    grdvwCustDisplay.DataBind();

        //    String sqlQuery = "SELECT CustFirstName, CustLastName, Customer.CustomerID, Service.ServiceID, Service.ServiceDate FROM Customer INNER JOIN Service On Customer.CustomerID = Service.CustomerID ORDER BY CustLastName";


        //    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
        //    SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
        //    DataTable dtCustomerGridView = new DataTable();
        //    sqlAdapter.Fill(dtCustomerGridView);
        //    grdvwCustDisplay.DataSource = dtCustomerGridView;
        //    grdvwCustDisplay.DataBind();
        //}

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
            string query2 =("Select CustFirstName,CustLastName,PhoneNumber,Email,CustAddress,CustCity,CustState,CustZip,CustomerID FROM Customer WHERE CustomerID ='" + searchedCustID + "';");
            SqlCommand cmd1 = new SqlCommand(query2, con1);
            SqlDataReader myReader3 = cmd1.ExecuteReader();
            if (myReader3.HasRows)
            {
                while (myReader3.Read())
                {
                    txtFirstName.Text = Convert.ToString(myReader3[0]);
                    txtLastName.Text = Convert.ToString(myReader3[1]);
                    txtPhoneNo.Text = Convert.ToString(myReader3[2]);
                    txtEmail.Text = Convert.ToString(myReader3[3]);
                    txtAddress.Text = Convert.ToString(myReader3[4]);
                    txtCity.Text = Convert.ToString(myReader3[5]);
                    txtState.Text = Convert.ToString(myReader3[6]);
                    txtZip.Text = Convert.ToString(myReader3[7]);
                    txtCustomerID.Text = Convert.ToString(myReader3[8]);
                }
                myReader3.Close();
            }
            con1.Close();
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


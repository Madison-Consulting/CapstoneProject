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
    public partial class Inventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCustName.Text = (string)Session["LName"];
        }

        //protected void btnViewAllServices_Click(object sender, EventArgs e)
        //{
        //    grdvwServDisplay.DataSource = null;
        //    grdvwServDisplay.DataBind();

        //    String sqlQuery = "SELECT CustFirstName, CustLastName, Customer.CustomerID, Service.ServiceID, Service.ServiceDate FROM Customer RIGHT OUTER JOIN Service ON Customer.CustomerID = Service.CustomerID ORDER BY CustLastName";


        //    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab2"].ConnectionString);
        //    SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
        //    DataTable dtCustomerGridView = new DataTable();
        //    sqlAdapter.Fill(dtCustomerGridView);
        //    grdvwServDisplay.DataSource = dtCustomerGridView;
        //    grdvwServDisplay.DataBind();
        //}

        protected void btnViewAllInv_Click(object sender, EventArgs e)
        {
            grdviewInvDisplay.DataSource = null;
            grdviewInvDisplay.DataBind();

            String sqlQuery = "SELECT Customer.CustFirstName, Customer.CustLastName, Service.ServiceDate, Inventory.ItemInInventory, Inventory.ItemCost, Inventory.ItemID, Inventory.InventoryDate FROM Customer INNER JOIN Service On Customer.CustomerID = Service.CustomerID INNER JOIN Inventory On Service.ServiceID = Inventory.ServiceID ORDER BY Customer.CustLastName";


            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtCustomerGridView = new DataTable();
            sqlAdapter.Fill(dtCustomerGridView);
            grdviewInvDisplay.DataSource = dtCustomerGridView;
            grdviewInvDisplay.DataBind();
        }



        protected void btnAddInv_Click(object sender, EventArgs e)
        {
            {

                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
                con.Open();

                string query1 = "SELECT Service.ServiceID FROM Service Inner Join Customer On Customer.CustomerID = Service.CustomerID Where Customer.CustLastName= @lastname;";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                cmd1.Parameters.AddWithValue("@lastname", HttpUtility.HtmlEncode(txtCustName.Text));
                SqlDataReader myReader3 = cmd1.ExecuteReader();
                if (myReader3.HasRows)
                {
                    while (myReader3.Read())
                    {
                        txtServiceID1.Text = Convert.ToString(myReader3[0]);
                        
                    }
                    myReader3.Close();
                }
                


            String query = "INSERT INTO Inventory (ItemInInventory,InventoryDate,ItemCost,ServiceID) VALUES (@ItemName, @InventoryDate, @Cost, @ServiceID)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ItemName", HttpUtility.HtmlEncode(txtItemName1.Text));
                cmd.Parameters.AddWithValue("@InventoryDate", HttpUtility.HtmlEncode(txtInventoryDate1.Text));
                cmd.Parameters.AddWithValue("@Cost", HttpUtility.HtmlEncode(txtItemCost1.Text));
                cmd.Parameters.AddWithValue("@ServiceID", HttpUtility.HtmlEncode(txtServiceID1.Text));

                cmd.ExecuteNonQuery();
                con.Close();

            }
        }


        protected void ddlInv_SelectedIndexChanged1(object sender, EventArgs e)
        {
            grdviewInvDisplay.DataSource = null;
            grdviewInvDisplay.DataBind();

            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Customer.CustFirstName, Customer.CustLastName, Service.ServiceDate, Inventory.ItemInInventory, Inventory.ItemCost, Inventory.ItemID, Inventory.InventoryDate FROM Customer INNER JOIN Service On Customer.CustomerID = Service.CustomerID Inner Join Inventory On Service.ServiceID = Inventory.ServiceID WHERE Customer.CustomerID = @CustomerID ORDER BY CustLastName", con);

            cmd.Parameters.AddWithValue("@CustomerID", ddlInv.SelectedValue);
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            DataTable dtCustomerGridView = new DataTable();
            sqlAdapter.Fill(dtCustomerGridView);
            grdviewInvDisplay.DataSource = dtCustomerGridView;
            grdviewInvDisplay.DataBind();
        }

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


        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearAllText(Page);
        }
    }
}
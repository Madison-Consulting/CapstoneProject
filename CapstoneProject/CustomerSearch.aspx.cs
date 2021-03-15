namespace Lab3
{
    public partial class CustomerSearch : System.Web.UI.Page
    {
        private string customerID;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            lstBoxViewDetails.Items.Clear();
            //Searching the Database for a Customer. 
            string conversionVariable;
            string searchedCustID = "";



            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            con.Open();

            //Customer Firstname
            String queryFirstName = "SELECT Customer.CustomerID, Customer.CustFirstName, Customer.CustLastName FROM Customer WHERE CustFirstName = @CustFirstName;";
            SqlCommand cmdFirstName = new SqlCommand(queryFirstName, con);
            cmdFirstName.Parameters.AddWithValue("@CustFirstName", txtSearch.Text);
            cmdFirstName.ExecuteNonQuery();
            SqlDataReader queryResultsFirstName = cmdFirstName.ExecuteReader();
            bool checkForValuesFirstName = queryResultsFirstName.Read();



            if (checkForValuesFirstName.Equals(false))
            {
                //Check for last name if firstname is not found.
                queryResultsFirstName.Close();
                String queryLastName = "SELECT CustomerID, CustLastName, Customer.CustFirstName FROM Customer WHERE CustLastName = @CustLastName;";
                SqlCommand cmdLastName = new SqlCommand(queryLastName, con);
                cmdLastName.Parameters.AddWithValue("@CustLastName", txtSearch.Text);
                cmdLastName.ExecuteNonQuery();
                SqlDataReader queryResultsLastName = cmdLastName.ExecuteReader();
                bool checkForValuesLastName = queryResultsLastName.Read();
                //queryResultsLastName.Close();

                if (checkForValuesLastName.Equals(false))
                {
                    lblSearchStatus.Text = "No Results Found";
                    queryResultsLastName.Close();
                    //queryResultsFirstName.Close();
                    con.Close();
                }
                else
                {
                    lblSearchStatus.Text = "Customer Found:";
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
                lblSearchStatus.Text = "Customer Found:";
                conversionVariable = Convert.ToString(queryResultsFirstName["CustomerID"]);
                searchedCustID = conversionVariable;
                customerID = searchedCustID;
                queryResultsFirstName.Close();

                con.Close();
            }

            //Showing Details for the Customer
            SqlConnection conDetails = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            conDetails.Open();

            String sqlQueryPopulateViewDetails = "SELECT  Service.ServiceID, Service.ServiceType, Service.ServiceDate, Service.CompletionDate, ServiceTicket.TicketStatus FROM ServiceTicket INNER JOIN Service ON ServiceTicket.ServiceID = Service.ServiceID WHERE ServiceTicket.CustomerID = '" + searchedCustID + "';";

            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = conDetails;
            //sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQueryPopulateViewDetails;
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            //While the program is reading the values will be added to the listbox
            int rowNumber = 1;
            while (queryResults.Read())
            {
                lstBoxViewDetails.Items.Add(rowNumber + ". SERVICE TYPE: " + queryResults["ServiceType"].ToString() + ":   SERVICE DATE: " + queryResults["ServiceDate"].ToString() + " COMPLETION DATE: " + queryResults["CompletionDate"].ToString() + " TICKET STATUS: " + queryResults["TicketStatus"].ToString());
                rowNumber++;
            }

            queryResults.Close();
            conDetails.Close();


        }

        //protected void btnViewDetails_Click(object sender, EventArgs e)
        //{
        //    string ServiceDate;
        //    int serviceIndex;
        //    string CompletionDate;
        //    int completionIndex;

        //    serviceIndex = lstBoxViewDetails.SelectedValue.IndexOf("SERVICE DATE:"); //+14
        //    completionIndex = lstBoxViewDetails.SelectedValue.IndexOf("COMPLETION DATE:"); //+17

        //    serviceIndex += 14;
        //    completionIndex += 17;

        //    ServiceDate = lstBoxViewDetails.SelectedValue.Substring(serviceIndex, 10);
        //    CompletionDate = lstBoxViewDetails.SelectedValue.Substring(completionIndex, 10);

        //    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
        //    con.Open();

        //    String queryGetService = "SELECT Service.ServiceID FROM Service WHERE ServiceDate = '" + ServiceDate + "' AND CompletionDate = '" + CompletionDate + "';";
        //    SqlCommand cmd = new SqlCommand(queryGetService, con);
        //    cmd.Connection = con;
        //    SqlDataReader queryResults = cmd.ExecuteReader();


        //        string serviceTicketID = queryResults["ServiceID"].ToString();



        //    String queryTicketHistoryandServiceTicket = "SELECT ServiceTicket.TicketStatus, TicketHistory.TicketChangeDate FROM ServiceTicket INNER JOIN TicketHistory ON ServiceTicket.ServiceTicketID = TicketHistory.ServiceTicketID WHERE ServiceTicket.ServiceTicketID = '" + serviceTicketID + "'; ";
        //    while (queryResults.Read())
        //    {
        //        lstDrillDown.Items.Add("TICKET STATUS: " + queryResults["TicketStatus"].ToString() + ":   TICKET CHANGE DATE: " + queryResults["TicketChangeDate"].ToString());

        //    }
        //    queryResults.Close();
        //    con.Close();
        //}


    }
}
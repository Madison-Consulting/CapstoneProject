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
    public partial class MovingForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnCommit_Click(object sender, EventArgs e)
        {

            if (txtDriveway.Text != "" && txtDistance.Text != "" && txtMoveSteps.Text != "") // fields must be filled
            {
                // COMMIT VALUES
                try
                {
                    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

                    lblStatus.Text = "Database Connection Successful";

                    //sc.Open();
                    sc.Open();

                    System.Data.SqlClient.SqlCommand createMove = new System.Data.SqlClient.SqlCommand();
                    createMove.Connection = sc;
                    // INSERT USER RECORD
                    createMove.CommandText = "INSERT INTO MoveForm (HomeType, Accessibility, TruckDistance, MoveSteps, LoadingCondition, SpecialEquipment, MoveTrucks, ServiceID) VALUES (@HomeType, @Accessibility, @TruckDistance, @MoveSteps, @LoadingCondition, @SpecialEquipment, @MoveTrucks, @ServiceID)";
                    createMove.Parameters.Add(new SqlParameter("@HomeType", ddlHomeType.Text));
                    createMove.Parameters.Add(new SqlParameter("@Accessibility", txtDriveway.Text));
                    createMove.Parameters.Add(new SqlParameter("@TruckDistance", txtDistance.Text));
                    createMove.Parameters.Add(new SqlParameter("@MoveSteps", txtMoveSteps.Text));
                    createMove.Parameters.Add(new SqlParameter("@LoadingCondition", txtLoad.Text));
                    createMove.Parameters.Add(new SqlParameter("@SpecialEquipment", rdoSpecEquip.Text));
                    createMove.Parameters.Add(new SqlParameter("@MoveTrucks", rdoMovetrucks.Text));
                    createMove.Parameters.Add(new SqlParameter("@ServiceID", "837164"));
                    createMove.ExecuteNonQuery();

                    //find most recent move ID (from code executed directly above^) and set it as session variable
                    SqlDataAdapter sqlDAMoveFormID = new SqlDataAdapter("select max(MoveFormID) from MoveForm", sc);
                    DataTable dtMoveFormID = new DataTable();
                    sqlDAMoveFormID.Fill(dtMoveFormID);
                    Session["MoveFormID"] = dtMoveFormID.Rows[0][0].ToString();
                    sc.Close();
                }
                catch
                {
                    lblStatus.Text = "Database Error - Information not committed";
                }

            }
            else
                lblStatus.Text = "Please fill all fields";

            Response.Redirect("MoveFormPt2.aspx");
        }



        protected void ddlDriveway_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {

        }
    }

}

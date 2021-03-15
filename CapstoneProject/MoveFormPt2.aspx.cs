namespace CapstoneProject
{
    public partial class MoveFormPt2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnCommit_Click(object sender, EventArgs e)
        {
            // Connection to the customer database
            HttpUtility.HtmlEncode(txtRoom.Text);
            HttpUtility.HtmlEncode(txtBox.Text);
            HttpUtility.HtmlEncode(txtBoxQty.Text);
            HttpUtility.HtmlEncode(txtMoveEquip.Text);
            HttpUtility.HtmlEncode(txtItem.Text);
            HttpUtility.HtmlEncode(txtItemQty.Text);
            HttpUtility.HtmlEncode(ddlValue.Text);

            if (txtRoom.Text != "" && txtBox.Text != "" && txtBoxQty.Text != "" && txtMoveEquip.Text != "" && txtItem.Text != "" && txtItemQty.Text != "" && ddlValue.Text != "") // fields must be filled
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
                    createUser.CommandText = "INSERT INTO Room (RoomType, BoxType, BoxQuantity, MovingEquipment, RoomItem, ItemValue, ItemQuantity) VALUES (@RoomType, @BoxType, @MovingEquipment, @RoomItem, @ItemValue, @ItemQuantity)";
                    createUser.Parameters.Add(new SqlParameter("@RoomType", txtRoom.Text));
                    createUser.Parameters.Add(new SqlParameter("@BoxType", txtBox.Text));
                    createUser.Parameters.Add(new SqlParameter("@BoxQuantity", txtBoxQty.Text));
                    createUser.Parameters.Add(new SqlParameter("@MoveEquipment", txtMoveEquip.Text));
                    createUser.Parameters.Add(new SqlParameter("@RoomItem", txtItem.Text));
                    createUser.Parameters.Add(new SqlParameter("@ItemValue", txtItemQty.Text));
                    createUser.Parameters.Add(new SqlParameter("@ItemQuantity", ddlValue.Text));
                    createUser.ExecuteNonQuery();




                    sc.Close();

                    lblStatus.Text = "Information committed!";
                    txtRoom.Enabled = false;
                    txtBox.Enabled = false;
                    txtBoxQty.Enabled = false;
                    txtMoveEquip.Enabled = false;
                    txtItem.Enabled = false;
                    txtItemQty.Enabled = false;
                    ddlValue.Enabled = false;

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
            txtRoom.Enabled = true;
            txtBox.Enabled = true;
            txtBoxQty.Enabled = true;
            txtMoveEquip.Enabled = true;
            txtItem.Enabled = true;
            txtItemQty.Enabled = true;
            ddlValue.Enabled = true;
            btnCommit.Enabled = true;
            lnkAnother.Visible = false;
            txtRoom.Text = "";
            txtBox.Text = "";
            txtBoxQty.Text = "";
            txtMoveEquip.Text = "";
            txtItem.Text = "";
            txtItemQty.Text = "";
            ddlValue.Text = "";
        }

    }

}

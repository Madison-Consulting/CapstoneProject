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
    public partial class MoveFormPt2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                item2.Visible = false;
                item3.Visible = false;
                item4.Visible = false;
                item5.Visible = false;
                item6.Visible = false;
                item7.Visible = false;
                item8.Visible = false;
                item9.Visible = false;
                item10.Visible = false;
                item11.Visible = false;
                item12.Visible = false;
                item13.Visible = false;
                item14.Visible = false;
                item15.Visible = false;
            }
        }


        protected void btnCommit_Click(object sender, EventArgs e)
        {

            if (txtRoom.Text != "" && txtItem1.Text != "") // room and initial item fields must be filled
            {
                // COMMIT VALUES
                try
                {
                    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString.ToString());

                    //sc.Open();
                    sc.Open();


                    System.Data.SqlClient.SqlCommand insertRoom = new System.Data.SqlClient.SqlCommand();
                    insertRoom.Connection = sc;
                    // INSERT ROOM RECORD
                    insertRoom.CommandText = "INSERT INTO Room (RoomType, MoveFormID) VALUES (@RoomType, @MoveFormID)";
                    insertRoom.Parameters.Add(new SqlParameter("@RoomType", txtRoom.Text));
                    insertRoom.Parameters.Add(new SqlParameter("@MoveFormID", Session["MoveFormID"]));
                    insertRoom.ExecuteNonQuery();

                    //find room ID from most recent^ insert
                    SqlDataAdapter sqlDARoomID = new SqlDataAdapter("select max(RoomID) from Room", sc);
                    DataTable dtRoomID = new DataTable();
                    sqlDARoomID.Fill(dtRoomID);
                    string roomID = dtRoomID.Rows[0][0].ToString();

                    //SQL command to insert each move item to DB
                    SqlCommand insertItem = new SqlCommand();
                    insertItem.Connection = sc;
                    insertItem.CommandText = "INSERT INTO MoveInventory (RoomID, ItemDescription, ItemNote, ItemQuant) VALUES (@RoomID, @ItemDescription, @ItemNote, @ItemQuant)";
                    //begin looping tablerows for each item (the items rows are in a table by themselves, with textboxes in each row
                    int numItemsAdding = 0; // <-- loop counter for below loop
                    foreach (TableRow tr in tblItems.Rows)
                    {
                        if (tr.Visible) //of the 15 rows total, only the visible table rows will have information and will be inserted to DB 
                        {
                            numItemsAdding++;
                            string itemTxtBoxID = "txtItem" + numItemsAdding.ToString();
                            string itemNoteTxtBoxID = "txtItemNote" + numItemsAdding.ToString();
                            string itemQuantDDLID = "ddlItemQuant" + numItemsAdding.ToString();

                            insertItem.Parameters.Add(new SqlParameter("@RoomID", roomID));

                            //referencing each textbox using above dynamically created strings, and getting adding the .text value to each parameter
                            insertItem.Parameters.Add(new SqlParameter("@ItemDescription", ((TextBox)tblItems.FindControl(itemTxtBoxID)).Text));
                            insertItem.Parameters.Add(new SqlParameter("@ItemNote", ((TextBox)tblItems.FindControl(itemNoteTxtBoxID)).Text));
                            insertItem.Parameters.Add(new SqlParameter("@ItemQuant", ((DropDownList)tblItems.FindControl(itemQuantDDLID)).SelectedValue));
                            insertItem.ExecuteNonQuery();
                            insertItem.Parameters.Clear();
                        }
                    }

                    sc.Close();

                    lblStatus.Text = txtRoom.Text + " committed!";

                    //clearing all textboxes
                    ClearAllText(Page);

                    //reset all DDL
                    ClearAllDDL(Page);

                    //hiding all item rows besides the first one
                    int tblItemsLoopCounter = 0;
                    foreach (TableRow tr in tblItems.Rows)
                    {
                        if (tblItemsLoopCounter != 0)
                        {
                            tr.Visible = false;
                            tblItemsLoopCounter++;
                        }
                        else
                        {
                            tblItemsLoopCounter++;
                        }
                    }
                }
                catch (Exception exc)
                {
                    lblStatus.Text = "Database Error - Information not committed: " + exc.Message;
                }

            }
            else
                lblStatus.Text = "Please fill all fields";
        }

        //clear all textboxes method
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

        protected void ClearAllDDL(Control p1)
        {
            foreach (Control ClearDDL in p1.Controls)
            {
                if (ClearDDL is DropDownList)
                {
                    DropDownList d = ClearDDL as DropDownList;

                    d.SelectedIndex = 0;
                }
                else
                {
                    if (ClearDDL.Controls.Count > 0)
                    {
                        ClearAllDDL(ClearDDL);
                    }
                }
            }
        }



        protected void btnAddAnotherItem_Click(object sender, EventArgs e)
        {
            //find current number of rows shown
            int amountOfRows = 0;
            foreach (TableRow tr in tblItems.Rows)
            {
                if (tr.Visible)
                {
                    amountOfRows++;
                }
            }

            //if amount of rows is not maxed out(at 15), make next row visible
            if (amountOfRows < 15)
            {
                tblItems.Rows[amountOfRows].Visible = true;
                lblStatus.Text = "";
            }
            else
            {
                lblStatus.Text = "Maximum items per room reached.";
            }
        }

        protected void btnRemoveLastItem_Click(object sender, EventArgs e)
        {
            //find number of current rows visible
            int amountOfRows = 0;
            foreach (TableRow tr in tblItems.Rows)
            {
                if (tr.Visible)
                {
                    amountOfRows++;
                }
            }
            //subtract one, because now we are working with the rows that are already visible (unlike above method)
            amountOfRows--;

            //if there is more than 1 row visible, hide the last one
            if (amountOfRows > 0)
            {
                tblItems.Rows[amountOfRows].Visible = false;
                lblStatus.Text = "";
            }
            else
            {
                lblStatus.Text = "Room must have at least ONE item.";
            }
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            Session["MoveFormID"] = "";
            Response.Redirect("AddCust2.aspx"); //<-- should eventually change this to home page
        }
    }

}

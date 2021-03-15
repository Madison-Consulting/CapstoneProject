<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Inventory.aspx.cs" Inherits="Lab2.Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Table ID="tblViewServices" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnPopulateInv" runat="server" Text="Populate"  OnClick="btnPopulateInv_Click" CausesValidation ="false"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
            </asp:TableCell>
        </asp:TableRow>
        
        
    </asp:Table>

    <asp:Table ID="Table5" runat="server">
       <asp:TableRow>
           <asp:TableCell>
               <asp:GridView runat="server" ID="grdvwServDisplay" EmptyDataText="No Service Selected!"></asp:GridView>
           </asp:TableCell>
       </asp:TableRow>
     </asp:Table>

     <asp:Table ID="tblDropInv" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblDropDownListnv" runat="server" Text="Choose a Service to View Inventory For"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                     <asp:dropDownList ID="ddlInv" runat="server" AutoPostBack="true" DataSourceID="datasrcInvList" DataTextField="fullDate" DataValueField="CustomerID" OnSelectedIndexChanged="ddlInv_SelectedIndexChanged1" ></asp:dropDownList>
                    </asp:TableCell>
                </asp:TableRow>  
          </asp:Table>

                <asp:SqlDataSource ID="datasrcInvList" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>" SelectCommand="SELECT Customer.CustLastName + ' ' + Service.ServiceDate as fullDate, Customer.CustomerID FROM Customer INNER JOIN Service ON Customer.CustomerID = Service.CustomerID"></asp:SqlDataSource>


    <asp:Table ID="Table1" runat="server" Width="654px">
                <asp:TableRow  HorizontalAlign ="center">
                 <asp:TableCell ColumnSpan="2">
                <asp:Label ID="lblAddInv" runat="server" Text="Add an Item into Inventory" Font-Size="X-Large"></asp:Label>
                 </asp:TableCell>
                </asp:TableRow>
                    <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblItemName" runat="server" Text="Item Name"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtItemName1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                        <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtItemName1" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
                        </asp:TableCell>
                 </asp:TableRow> 
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblItemCost" runat="server" Text="Item Cost"></asp:Label>
                        </asp:TableCell>
                     <asp:TableCell>
                        <asp:TextBox ID="txtItemCost1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                     <asp:TableCell>
                            <asp:CompareValidator ID="CompareValidator13" runat="server" ErrorMessage="CompareValidator" 
                            ControlToValidate="txtItemCost1" Operator="DataTypeCheck" Type="Currency" ForeColor="Red" Text ="Enter a monetary value, excluding ($)!"></asp:CompareValidator>
                     </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblInventoryDate" runat="server" Text="Inventory Date"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtInventoryDate1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtInventoryDate1" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCustName" runat="server" Text="Customer Name"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtCustName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtCustName" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>    
                        <asp:TextBox ID="txtServiceID1" runat="server" Visible="false"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>    
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="2">
                <asp:Button ID="btnAddInv" runat="server" Text="Add" OnClick="btnAddInv_Click"/>
            </asp:TableCell>
            </asp:TableRow>
   </asp:Table>

    <asp:Table ID="viewInv" runat="server" horizontalalign="Center">
                <asp:TableRow  HorizontalAlign ="center">
                    <asp:TableCell ColumnSpan="2">
                        <asp:Button ID="btnViewAllInv" runat="server" Text="View All Items in Inventory" OnClick="btnViewAllInv_Click" CausesValidation="false" />
                    </asp:TableCell>
                </asp:TableRow> 
            </asp:Table>

            <asp:Table ID="Table2" runat="server">
                  <asp:TableRow>
                      <asp:TableCell>
                          <asp:GridView ID="grdviewInvDisplay" runat="server"></asp:GridView>
                         </asp:TableCell>
                    </asp:TableRow>
                 </asp:Table>
            
            
</asp:Content>

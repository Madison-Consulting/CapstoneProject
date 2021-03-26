<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="EditServ2.aspx.cs" Inherits="Lab2.EditServ2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="width: 149%; margin: 0 10%; height: 1572px;">
             <asp:Table ID="tblDrop" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblDropDownList" runat="server" Text="Choose a Service to View"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:dropDownList ID="ddlService" runat="server" AutoPostBack="true" 
                            DataSourceID="datasrcCustomerList" 
                            DataTextField="fullName" 
                            DataValueField="CustomerID" 
                            OnSelectedIndexChanged="ddlService_SelectedIndexChanged" 
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="">- Select -</asp:ListItem>
                        </asp:dropDownList>
                    </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>



               <asp:SqlDataSource ID="datasrcCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>" SelectCommand="SELECT CustFirstName + ' ' +  CustLastName + ' ' + Service.ServiceDate AS fullName, Customer.CustomerID FROM Customer INNER JOIN Service ON Customer.CustomerID = Service.CustomerID"></asp:SqlDataSource>

                           
                                <asp:Table ID="tblTxtBox" runat="server" style="display:inline-block" Width="300px">
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell>
                        <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="txtHeader" runat="server" width="250px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Rows ="8" Width="250px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

              <asp:Table ID ="tblHistory" runat="server" style="display:inline-block">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEditServTicket" runat="server" Text="Edit Service Ticket History" Font-Size ="X-Large"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID = "lblHistID" runat="server" Text="Ticket History ID"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:TextBox ID="txtHistID" runat="server" Text ="Auto-Filled"></asp:TextBox>
                    </asp:TableCell>
                    </asp:TableRow>
                        <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblDateTime" runat="server" Text="Date and Time of History Change"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDateTime" runat="server" AutoPostBack="true" TextMode="DateTime"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtDateTime" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                        <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblYourName" runat="server" Text="Your Name"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtYourName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                        <asp:TableRow>
                     <asp:TableCell>
                        <asp:TextBox ID="txtServTicketID" runat="server" Visible ="false"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                        <asp:TableRow HorizontalAlign="Center">
                     <asp:TableCell ColumnSpan="2">
                         <asp:Button ID ="btnTicketHistorySubmit" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Submit New Ticket History"  OnClick ="btnTicketHistorySubmit_Click"/>
                    </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
                            </asp:TableCell>
                </asp:TableRow>
                        <asp:TableRow HorizontalAlign="center">
                     <asp:TableCell ColumnSpan="2">
                         <asp:Button ID="btnHistory" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="View Full Service History" OnClick="btnHistory_Click" CausesValidation="false" />
                    </asp:TableCell>
                </asp:TableRow>

    </asp:Table>
    <asp:Table ID="tblServiceTicket" runat="server" style="display:inline-block;" > 
       <asp:TableRow>
           <asp:TableCell>
               <asp:GridView runat="server" ID="grdvwTicketDisplay1" EmptyDataText="No Service Selected!" OnRowDataBound ="grdvwTicketDisplay_RowDataBound" ></asp:GridView>
           </asp:TableCell>
       </asp:TableRow>
     </asp:Table>

     <asp:Table ID="Table3" runat="server" Width="65%" HorizontalAlign ="Center" style="display:inline-block; margin-right: 0px;" Height="90px">
                  <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblServiceType" runat="server" Text="Service Type (Moving or Auction)"></asp:Label>
                     </asp:TableCell> 
                     <asp:TableCell>
                         <asp:TextBox ID="txtServType1" runat="server"></asp:TextBox>
                    </asp:TableCell>                    
                </asp:TableRow>
                 <asp:TableRow>
                     <asp:TableCell>
                        <asp:Label ID="lblFirstName1" runat="server" Text="Customer First Name"></asp:Label>
                     </asp:TableCell> 
                     <asp:TableCell>
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                     <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtFirstName" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblDestinationAddress" runat="server" Text="Destination Address"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDestinationAddress1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtDestinationAddress1" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
             </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblLastName" runat="server" Text="Customer Last Name"></asp:Label>
                    </asp:TableCell> 
                    <asp:TableCell>
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtLastName" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblDestinationCity1" runat="server" Text="City"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDestinationCity1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtDestinationCity1" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblDate" runat="server" Text="Service Date "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDate1" runat="server" ></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                     <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator" 
                         ControlToValidate="txtDate1" Operator="DataTypeCheck" Type="Date" ForeColor="Red" Text ="Entry must be a Date!"></asp:CompareValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label2" runat="server" Text="State"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDestinationState1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtDestinationState1" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEstCost" runat="server" Text="Estimated Cost"></asp:Label>
                     </asp:TableCell>
                     <asp:TableCell>
                        <asp:TextBox ID="txtEstCost1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                    <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="CompareValidator" 
                            ControlToValidate="txtEstCost1" Operator="DataTypeCheck" Type="Currency" ForeColor="Red" Text ="Enter amount in dollars, no($)!"></asp:CompareValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label3" runat="server" Text="Zip"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDestinationZip1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                            <asp:CompareValidator ID="CompareValidator" runat="server" ErrorMessage="CompareValidator" 
                            ControlToValidate="txtDestinationZip1" Operator="DataTypeCheck" Type="Integer" ForeColor="Red" Text ="Entry must be a 5 digit integer!"></asp:CompareValidator>
                    </asp:TableCell>         
                </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblCompDate" runat="server" Text="Completion Date"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtCompDate1" runat="server"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:CompareValidator ID="CompareValidator5" runat="server" ErrorMessage="CompareValidator" 
                            ControlToValidate="txtCompDate1" Operator="DataTypeCheck" Type="Date" ForeColor="Red" Text ="Entry must be a Date!"></asp:CompareValidator>

                        </asp:TableCell>
                                         <asp:TableCell>                       
                    <asp:Label ID="lblLodgeCost" runat="server" Text="Lodging Cost"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>                       
                    <asp:TextBox ID="txtLodgeCost1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                            <asp:CompareValidator ID="CompareValidator9" runat="server" ErrorMessage="CompareValidator" 
                            ControlToValidate="txtLodgeCost1" Operator="DataTypeCheck" Type="Currency" ForeColor="Red" Text ="Enter an amount in dollars, excluding ($)!)"></asp:CompareValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblMoveTime" runat="server" Text="Move Time (Days)"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtMoveTime1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                            <asp:CompareValidator ID="CompareValidator6" runat="server" ErrorMessage="CompareValidator" 
                            ControlToValidate="txtMoveTime1" Operator="DataTypeCheck" Type="Integer" ForeColor="Red" Text ="Enter an integer (# of days)!"></asp:CompareValidator>
                    </asp:TableCell>
                                 <asp:TableCell>                       
                     <asp:Label ID="lblFuelCost" runat="server" Text="Fuel Cost"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>                       
                    <asp:TextBox ID="txtFuelCost1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                            <asp:CompareValidator ID="CompareValidator10" runat="server" ErrorMessage="CompareValidator" 
                            ControlToValidate="txtFuelCost1" Operator="DataTypeCheck" Type="Currency" ForeColor="Red" Text ="Enter an amount in dollars, excluding ($)!"></asp:CompareValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblVehicleUsed" runat="server" Text="Vehicle Used"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtVehicleUsed1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>                       
                    <asp:Label ID="lblFoodCost" runat="server" Text="Food Cost"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>                       
                    <asp:TextBox ID="txtFoodCost1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                     <asp:TableCell>
                            <asp:CompareValidator ID="CompareValidator11" runat="server" ErrorMessage="CompareValidator" 
                            ControlToValidate="txtFoodCost1" Operator="DataTypeCheck" Type="Currency" ForeColor="Red" Text ="Enter an amount in dollars, excluding ($)!"></asp:CompareValidator>
                     </asp:TableCell>
                    </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEquip" runat="server" Text="Equipment Needed"></asp:Label>
                     </asp:TableCell>
                     <asp:TableCell>
                        <asp:TextBox ID="txtEquip1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                     <asp:TableCell>
                        <asp:TextBox ID="txtCustID1" runat="server" Visible="false"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="txtServiceID1" runat="server" Visible="false"></asp:TextBox>
                    </asp:TableCell>
              </asp:TableRow>
     
                    <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="6">
                        <asp:Button ID="btnUpdateServ" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Update" OnClick="btnUpdateServ_Click" />
                    </asp:TableCell>
                </asp:TableRow>
<%--                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell ColumnSpan="3">
                            <asp:Button ID="btnClearServ" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Clear" OnClick="btnClearServ_Click" CausesValidation="false"/>
                        </asp:TableCell>
                    </asp:TableRow>--%>
         </asp:Table>


    
  

        </div>
</asp:Content>

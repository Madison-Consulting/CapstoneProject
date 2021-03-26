<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddServ.aspx.cs" Inherits="Lab2.AddServ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

               
     

            <asp:Table ID="tblAddServ" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnPopulateServ" runat="server" Text="Populate" OnClick="btnPopulateServ_Click" CausesValidation="false" />
                        </asp:TableCell>
                        <asp:TableCell>
                                <asp:Label ID="lblAddServEvent" runat="server" Text="Add a New Service Event" Font-Size="X-Large"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnClearServ" runat="server" Text="Clear" OnClick="btnClearServ_Click" CausesValidation="false"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
  
           <div style="width: 99%; margin: 0 10%;" >
            <asp:Table ID="tblTxtBox" runat="server" style="display:inline-block">
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell>
                        <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="txtHeader" runat="server" Width="250px" ></asp:TextBox>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Rows ="20" Width="250px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>



     <asp:Table ID="Table3" runat="server" style="display:inline-block" Width="700px">
                  <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblServiceType" runat="server" Text="Service Type:"></asp:Label>
                     </asp:TableCell> 
                     <asp:TableCell>
                         <asp:TextBox ID="txtServType1" runat="server"></asp:TextBox>
                    </asp:TableCell>     
                      <asp:TableCell>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtServType1" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>

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
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblDate" runat="server" Text="Service Date: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDate1" runat="server" ></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                     <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator" 
                         ControlToValidate="txtDate1" Operator="DataTypeCheck" Type="Date" ForeColor="Red" Text ="Entry must be a Date!"></asp:CompareValidator>
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
                            ControlToValidate="txtEstCost1" Operator="DataTypeCheck" Type="Currency" ForeColor="Red" Text ="Entry must be a monetary value!"></asp:CompareValidator>
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
                </asp:TableRow>
                <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblMoveTime" runat="server" Text="Move Time"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtMoveTime1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                            <asp:CompareValidator ID="CompareValidator6" runat="server" ErrorMessage="CompareValidator" 
                            ControlToValidate="txtMoveTime1" Operator="DataTypeCheck" Type="Integer" ForeColor="Red" Text ="Entry must be an integer (# of days)!"></asp:CompareValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblVehicleUsed" runat="server" Text="Vehicle Used"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtVehicleUsed1" runat="server"></asp:TextBox>
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
                        <asp:Label ID="Label3" runat="server" Text="Zip"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDestinationZip1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                            <asp:CompareValidator ID="CompareValidator8" runat="server" ErrorMessage="CompareValidator" 
                            ControlToValidate="txtDestinationZip1" Operator="DataTypeCheck" Type="Integer" ForeColor="Red" Text ="Entry must be a 5 digit integer!"></asp:CompareValidator>
                    </asp:TableCell>           
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>                       
                    <asp:Label ID="lblLodgeCost" runat="server" Text="Lodging Cost"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>                       
                    <asp:TextBox ID="txtLodgeCost1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                            <asp:CompareValidator ID="CompareValidator9" runat="server" ErrorMessage="CompareValidator" 
                            ControlToValidate="txtLodgeCost1" Operator="DataTypeCheck" Type="Currency" ForeColor="Red" Text ="Entry must be in Dollars($)"></asp:CompareValidator>
                    </asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow>
                     <asp:TableCell>                       
                     <asp:Label ID="lblFuelCost" runat="server" Text="Fuel Cost"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>                       
                    <asp:TextBox ID="txtFuelCost1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                            <asp:CompareValidator ID="CompareValidator10" runat="server" ErrorMessage="CompareValidator" 
                            ControlToValidate="txtFuelCost1" Operator="DataTypeCheck" Type="Currency" ForeColor="Red" Text ="Entry must be in Dollars($)!"></asp:CompareValidator>
                    </asp:TableCell>
                 </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>                       
                    <asp:Label ID="lblFoodCost" runat="server" Text="Food Cost"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>                       
                    <asp:TextBox ID="txtFoodCost1" runat="server"></asp:TextBox>
                    </asp:TableCell>
                     <asp:TableCell>
                            <asp:CompareValidator ID="CompareValidator11" runat="server" ErrorMessage="CompareValidator" 
                            ControlToValidate="txtFoodCost1" Operator="DataTypeCheck" Type="Currency" ForeColor="Red" Text ="Entry must be in Dollars($)!"></asp:CompareValidator>
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
                    <asp:TableCell ColumnSpan="2">
                        <asp:Button ID="btnCommitServ" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Add Service" OnClick="btnCommitServ_Click" />
                    </asp:TableCell>
                </asp:TableRow>

         </asp:Table>

    <asp:Table ID="tblServiceTicket" runat="server">
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell>
                <asp:Label ID="lblStartTicket" runat="server" Text="Start A Service Ticket" Font-Size="X-Large"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="txtTicketID" runat="server" Visible="false"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblStatus" runat="server" Text="Service Ticket Status"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
            </asp:TableCell>
             </asp:TableRow>
                 <asp:TableRow>
                     <asp:TableCell>
                        <asp:Label ID="lblEmpName" runat="server" Text="Your Name"></asp:Label>
                     </asp:TableCell> 
                     <asp:TableCell>
                        <asp:TextBox ID="txtEmpName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                     <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtEmpName" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
             </asp:TableRow>
        <asp:TableRow HorizontalAlign="Center">
            <asp:TableCell ColumnSpan="2">
                <asp:Button ID="btnCreateServTicket" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Create a New Service Ticket" OnClick="btnCreateServTicket_Click"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    </div>

            </asp:Content>

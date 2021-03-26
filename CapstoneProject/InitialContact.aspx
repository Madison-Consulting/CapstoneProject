<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InitialContact.aspx.cs" Inherits="Lab3.InitialContact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

              <asp:Table ID="tblInitialContact" runat="server" style="display:inline-block" width="700px">
              <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnPopulateInitial" runat="server" Text="Populate" OnClick="btnPopulateInitial_Click" CausesValidation ="false"  />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                         <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CausesValidation="false" />
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                     <asp:TableCell>
                         <asp:TextBox ID="txtCustomerID" runat="server" Visible="false"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblContact" runat="server" Text="Wha Type of Contact does the Customer Prefer?"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlContact" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlContact_SelectedIndexChanged">
                            <asp:ListItem Value ="By Phone">By Phone</asp:ListItem>
                            <asp:ListItem Value ="Email">Email</asp:ListItem>
                            <asp:ListItem Value ="Text">Text</asp:ListItem>
                            <asp:ListItem Selected="true" Value ="Select">--Select--</asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell ColumnSpan="2">
                        <asp:TextBox ID="txtOther" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                      <asp:TableCell>
                        <asp:Label ID="lblHearAbout" runat="server" Text="How did the Customer Hear About Us?"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtHearAbout" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtHearAbout" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblServInterested" runat="server" Text="What Service are they Interested in?"></asp:Label>
                    </asp:TableCell>
           <%--         <asp:TableCell>
                        <asp:RadioButtonList ID="rdobtnServ" runat="server"  OnSelectedIndexChanged="rdobtnServ_SelectedIndexChanged1">
                            <asp:ListItem Value="Auction">Auction</asp:ListItem>
                            <asp:ListItem Value="Moving" Selected="True">Moving</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>--%>
                    <asp:TableCell>
                        <asp:CheckBoxList ID="chkService" runat="server">
                           <asp:ListItem ID="chkMoveAsses" runat="server" Value ="Move Assessment" Text="Move Assessment"></asp:ListItem>
                           <asp:ListItem ID="chkAuctionLookAt" runat="server"  Value ="Auction Look At" Text ="Auction Look At"></asp:ListItem>
                           <asp:ListItem ID="chkAppraisal" runat="server" Value ="Appraisal" Text="Appraisal"></asp:ListItem>
                           <asp:ListItem ID="chkMove" runat="server" Value="Move" Text="Move"></asp:ListItem>
                           <asp:ListItem ID="chkAuctionPickUp" runat="server" Value="Auction Pick Up" Text="Auction Pick Up"></asp:ListItem>
                           <asp:ListItem ID="chkAuctionBringIn" runat="server" Value ="Auction Bring In" Text="Auction Bring In"></asp:ListItem>
                           <asp:ListItem ID="chkConsignmentShop" runat="server" Value="Consignment Shop" Text="Consignment Shop"></asp:ListItem>
                        </asp:CheckBoxList>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lbltoAddress" runat="server" Text=" Moving Address"></asp:Label>
                    </asp:TableCell>
                      <asp:TableCell>
                          <asp:TextBox ID="txtMovingAddress" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblMovingCity" runat="server" Text="City"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtMovingCity" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblMovingState" runat="server" Text="State"></asp:Label>
                    </asp:TableCell>
                      <asp:TableCell>
                          <asp:TextBox ID="txtMovingState" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblMovingZip" runat="server" Text="Zip Code"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtMovingZip" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblDateTime" runat="server" Text="Date and Time of Initial Contact"></asp:Label>
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
                        <asp:Label ID="lblDeadline" runat="server" Text="Deadline for your Service (One Date and Time or a Range)?"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDeadline" runat="server" Text ="Date"></asp:TextBox>
                        <asp:TextBox ID="txtTime" runat="server"  Text="Time"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDeadline2" runat="server" Text ="Date"></asp:TextBox>
                        <asp:TextBox ID="txtTime2" runat="server" Text ="Time" ></asp:TextBox>
                    </asp:TableCell>

                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtDeadline" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtTime" SetFocusOnError ="true" ForeColor="Red" Text ="Textfield Cannot be blank!"></asp:RequiredFieldValidator>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4">
                        <asp:Button ID="btnSaveInitial" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Save Initial Contact Information" OnClick="btnSaveInitial_Click" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell ColumnSpan="4">
                        <asp:Button ID="btnAddService" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Add a Service for this Customer" OnClick ="btnAddService_Click" CausesValidation="false" />
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>
    <asp:TextBox ID="txtFN" runat="server" Visible="false"></asp:TextBox>
    <asp:TextBox ID="txtLN" runat="server" Visible="false"></asp:TextBox>

    
        </div>
</asp:Content>

<%@ Page Title="Add Customer" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddCust2.aspx.cs" Inherits="Lab3.AddCust2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

<%--                    <asp:Table ID="Table2" runat="server" Width="300px">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnPopulateCust" runat="server" Text="Populate" OnClick="btnPopulateCust_Click" CausesValidation ="false"  />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                         <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CausesValidation="false" />
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>--%>

        <div style="width: auto; margin: 0 20% ">
<%--            Form to Add Customer Data--%>
            <asp:Table ID="Table3" runat="server" Width="670px">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtFirstName" SetFocusOnError ="true" ForeColor="Red" Text ="*"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtLastName" SetFocusOnError ="true" ForeColor="Red" Text ="*"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPhoneType" runat="server" Text="PhoneType"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RadioButtonList ID="rdoPhoneType" runat="server">
                            <asp:ListItem Value ="Home">Home</asp:ListItem>
                            <asp:ListItem Value="Work">Work</asp:ListItem>
                            <asp:ListItem Value="Cell" Selected="True">Cell</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPhoneNo" runat="server" Text="Phone Number"></asp:Label>
                    </asp:TableCell>
                      <asp:TableCell>
                          <asp:TextBox ID="txtPhoneNo" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtPhoneNo" SetFocusOnError ="true" ForeColor="Red" Text ="*"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtEmail" SetFocusOnError ="true" ForeColor="Red" Text ="*"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                    </asp:TableCell>
                      <asp:TableCell>
                          <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                    </asp:TableCell>

                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtAddress" SetFocusOnError ="true" ForeColor="Red" Text ="*"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtCity" SetFocusOnError ="true" ForeColor="Red" Text ="*"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                    </asp:TableCell>
                      <asp:TableCell>
                          <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtState" SetFocusOnError ="true" ForeColor="Red" Text ="*"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblZip" runat="server" Text="Zip Code"></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                         <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator" 
                ControlToValidate="txtZip" SetFocusOnError ="true" ForeColor="Red" Text ="*"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="center">
                    <asp:TableCell ColumnSpan="2">
                        <asp:Button ID="btnCommitAddCust" class= "btn-GreenValleyGreen" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Add Customer" OnClick="btnCommitAddCust_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="center">
                    <asp:TableCell ColumnSpan="2">
                        <asp:Button ID="btnInitialContact" class= "btn-GreenValleyGreen" Visible="false" enabled="false" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Add Initial Contact Info" OnClick="btnInitialContact_Click" CausesValidation="false" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow HorizontalAlign="center">
                    <asp:TableCell ColumnSpan="2">
                        <asp:Button ID="btnAddService" class= "btn-GreenValleyGreen" Visible="false" enabled="false" Font-Bold="true" ForeColor="White"  BackColor="#325f57" runat="server" Text="Add a Service for this Customer" OnClick ="btnAddService_Click" CausesValidation="false" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                     <asp:TableCell>
                         <asp:TextBox ID="txtCustomerID" runat="server" Visible="false"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                </asp:Table>
                <br />

            
        <asp:Table ID="tblTxtBox" runat="server" Style="position:fixed; top: 80px; right: 100px;">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Rows="15" Width="250px" Height="200"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>

</asp:Content>

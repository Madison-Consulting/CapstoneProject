﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Completion.aspx.cs" Inherits="CapstoneProject.Completion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: auto; margin: 20px 20%; position: relative;">
        <asp:Table ID="Table1" runat="server" Width="452px">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbl1" runat="server" Text="Customer First Name:"></asp:Label>
                </asp:TableCell>
                      <asp:TableCell>
                    <asp:TextBox ID="txtFN" runat="server"></asp:TextBox>
                </asp:TableCell>
                      <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtFN" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbl2" runat="server" Text="Last Name:"></asp:Label>
                </asp:TableCell>
                  <asp:TableCell>
                    <asp:TextBox ID="txtLN" runat="server"></asp:TextBox>
                </asp:TableCell>
                      <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtLN" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbl" runat="server" Text="Phone Number:"></asp:Label>
                </asp:TableCell>
                   <asp:TableCell>
                    <asp:TextBox ID="txtPhoneNo" runat="server"></asp:TextBox>
                </asp:TableCell>
                      <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtPhoneNo" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbl3" runat="server" Text="Customer Email:"></asp:Label>
                </asp:TableCell>
                    <asp:TableCell>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </asp:TableCell>
                      <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtEmail" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
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
                        ControlToValidate="txtAddress" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
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
                        ControlToValidate="txtCity" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
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
                        ControlToValidate="txtState" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
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
                        ControlToValidate="txtZip" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbl4" runat="server" Text="Service Type:"></asp:Label>
                </asp:TableCell>
                 <asp:TableCell>
                    <asp:TextBox ID="txtServType" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtServType" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lbl5" runat="server" Text="Service Date:"></asp:Label>
                </asp:TableCell>
                   <asp:TableCell>
                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtDate" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
                        <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblComments" runat="server" Text="Comments:"></asp:Label>
                </asp:TableCell>
                   <asp:TableCell>
                    <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Rows="15" Height="130px"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtDate" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                   <asp:TableCell>
                    <asp:Label ID="lblExperince" runat="server" Text="Service Experience?"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                       <asp:RadioButtonList ID="rdobtnPosNeg" runat="server">
                            <asp:ListItem Value="Positive" Selected="True">Positive</asp:ListItem>
                            <asp:ListItem Value="Negative">Negative</asp:ListItem>
                        </asp:RadioButtonList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtCustID" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
                
            <asp:TableRow HorizontalAlign="center">
                <asp:TableCell ColumnSpan="3">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="btn-GreenValleyGreen" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>

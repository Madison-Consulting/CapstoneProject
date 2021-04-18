<%@ Page Title="Initial Contact" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InitialContact.aspx.cs" Inherits="Lab3.InitialContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: auto; margin: 20px 20%; position: relative;">
        <asp:Table ID="tblTitle" runat="server" Width="773px">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label ID="title" runat="server" Text="Initial Contact Form" Font-Bold="true" Font-Size="Large"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:Table ID="tblInitialContact" runat="server" HorizontalAlign="Center">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtCustomerID" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblFN" runat="server" Text="Customer First Name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtFN" runat="server" ReadOnly="true"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblLN" runat="server" Text="Customer Last Name:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLN" runat="server" ReadOnly="true"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblContact" runat="server" Text="What Type of Contact does the Customer Prefer?"></asp:Label>
                </asp:TableCell>
                <asp:TableCell ColumnSpan="2">
                    <asp:DropDownList ID="ddlContact" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlContact_SelectedIndexChanged">
                        <asp:ListItem Selected="true" Value="Select">--Select--</asp:ListItem>
                        <asp:ListItem Value="By Phone">By Phone</asp:ListItem>
                        <asp:ListItem Value="Email">Email</asp:ListItem>
                        <asp:ListItem Value="Text">Text</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtOther" runat="server" Visible="false"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblHearAbout" runat="server" Text="How did the Customer Hear About Us?"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlHearAbout" runat="server">
                        <asp:ListItem Selected="true" Value="Select">--Select--</asp:ListItem>
                        <asp:ListItem Value="Realtor">Realtor</asp:ListItem>
                        <asp:ListItem Value="Facebook">Facebook</asp:ListItem>
                        <asp:ListItem Value="Google">Google</asp:ListItem>
                        <asp:ListItem Value="Website">Website</asp:ListItem>
                        <asp:ListItem Value="Newspaper">Newspaper</asp:ListItem>
                        <asp:ListItem Value="Word of Mouth">Word of Mouth</asp:ListItem>
                        <asp:ListItem Value="Mailings">Mailings</asp:ListItem>
                        <asp:ListItem Value="Other">other</asp:ListItem>
                    </asp:DropDownList>
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
                        <asp:ListItem ID="chkMoveAsses" runat="server" Value="Move Assessment" Text="Move Assessment"></asp:ListItem>
                        <asp:ListItem ID="chkAuctionLookAt" runat="server" Value="Auction Look At" Text="Auction Look At"></asp:ListItem>
                        <asp:ListItem ID="chkAppraisal" runat="server" Value="Appraisal" Text="Appraisal"></asp:ListItem>
                        <asp:ListItem ID="chkMove" runat="server" Value="Move" Text="Move"></asp:ListItem>
                        <asp:ListItem ID="chkAuctionPickUp" runat="server" Value="Auction Pick Up" Text="Auction Pick Up"></asp:ListItem>
                        <asp:ListItem ID="chkAuctionBringIn" runat="server" Value="Auction Bring In" Text="Auction Bring In"></asp:ListItem>
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
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtMovingAddress" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblMovingAddress2" runat="server" Text=" Moving Address Line 2"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMovingAddress2" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblMovingCity" runat="server" Text="City"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMovingCity" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtMovingCity" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="No Numbers or Special Characters Allowed"
                        ControlToValidate="txtMovingCity" ValidationExpression="^[A-Za-z]*$" ForeColor="Red"></asp:RegularExpressionValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblMovingState" runat="server" Text="State"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMovingState" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtMovingState" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="No Numbers or Special Characters Allowed"
                        ControlToValidate="txtMovingState" ValidationExpression="^[A-Za-z]*$" ForeColor="Red"></asp:RegularExpressionValidator>

                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblMovingZip" runat="server" Text="Zip Code"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtMovingZip" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtMovingZip" SetFocusOnError="true" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" 
                ControlToValidate="txtMovingZip" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Textfield Can Only Contain Numbers" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDateTime" runat="server" Text="Date and Time of Initial Contact"></asp:Label>
                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="txtDateTime" runat="server" AutoPostBack="true" TextMode="DateTime"></asp:TextBox>
                </asp:TableCell><asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtDateTime" SetFocusOnError="true" ForeColor="Red" Text="*">
                    </asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDeadline" runat="server" Text="Deadline for your Service (One Date and Time or a Range)?"></asp:Label>
                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="txtDeadline" runat="server" Text="Date" TextMode="Date"></asp:TextBox>
                    <asp:TextBox ID="txtTime" runat="server" Text="Time" TextMode="Time"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtTime" SetFocusOnError="true" ForeColor="Red" Text="Not Valid">
                    </asp:RequiredFieldValidator>
                </asp:TableCell><asp:TableCell>
                    <asp:TextBox ID="txtDeadline2" runat="server" Text="Date" TextMode="Date"></asp:TextBox>
                    <asp:TextBox ID="txtTime2" runat="server" Text="Time" TextMode="Time"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtDeadline" SetFocusOnError="true" ForeColor="Red" Text="*">
                    </asp:RequiredFieldValidator>
                </asp:TableCell><asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator"
                        ControlToValidate="txtTime" SetFocusOnError="true" ForeColor="Red" Text="*">
                    </asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell ColumnSpan="4">
                    <asp:Button ID="btnSaveInitial" class="btn-GreenValleyGreen" runat="server" Text="Save Initial Contact Information" OnClick="btnSaveInitial_Click" />
                </asp:TableCell>
            </asp:TableRow>
            <%--            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell ColumnSpan="4">
                    <asp:Button ID="btnAddService" class="btn-GreenValleyGreen" runat="server" Text="Add a Service for this Customer" OnClick="btnAddService_Click" CausesValidation="false" />
                </asp:TableCell>
            </asp:TableRow>--%><asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </div>
</asp:Content>

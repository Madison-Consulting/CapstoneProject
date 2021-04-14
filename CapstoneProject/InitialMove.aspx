<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="InitialMove.aspx.cs" Inherits="CapstoneProject.InitialMove" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="InitialMove" runat="server">

         <asp:TableRow>

            <asp:TableCell>
                <asp:Label ID="lblDateOut" runat="server" Text="What is the date you have to be out of your current address?: "></asp:Label>
            </asp:TableCell>

            <asp:TableCell>
                <asp:TextBox ID="txtDateOut" runat="server" TextMode="Date"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDateWindow" runat="server" Text="What is the window of days you can move?: "></asp:Label>
            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtDateWindow" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblOriginAddress" runat="server" Text="Origin Address: "></asp:Label>

            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtOriginAddress" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblOriginCity" runat="server" Text="Origin City: "></asp:Label>

            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtOriginCity" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblOriginState" runat="server" Text="Origin State: "></asp:Label>

            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtOriginState" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDestinationAddress" runat="server" Text="Destination Address: "></asp:Label>
            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtDestinationAddress" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDestinationCity" runat="server" Text="Destination City: "></asp:Label>

            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtDestinationCity" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDestinationState" runat="server" Text="Destination State: "></asp:Label>

            </asp:TableCell>

            <asp:TableCell>
              <asp:TextBox ID="txtDestinationState" runat="server"></asp:TextBox>

            </asp:TableCell>
        </asp:TableRow>

         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMlsList" runat="server" Text="Is there a MLS Listing?: "></asp:Label>
            </asp:TableCell>
             <asp:TableCell>

                <asp:DropDownList ID="ddlMlsList" runat="server" AutoPostBack="true">
                    <asp:ListItem>Select Value</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
                 </asp:TableCell>

        </asp:TableRow>

          <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPhotoNeed" runat="server" Text="Can you send photos if we need them?: "></asp:Label>
            </asp:TableCell>
             <asp:TableCell>

                <asp:DropDownList ID="ddlPhotoNeed" runat="server" AutoPostBack="true">
                    <asp:ListItem>Select Value</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
                 </asp:TableCell>

        </asp:TableRow>
        
             <asp:TableRow>

            <asp:TableCell>
                <br />
                <br />

                <asp:Label ID="lblAddlServ" runat="server" Text="Do you need Auction Services?: "></asp:Label>
            </asp:TableCell>
           
            <asp:TableCell>
                <br />
                <br />
                <asp:Button ID="btnAuctionAssess" class= "btn-GreenValleyGreen" runat="server" Text="Auction Assessment" OnClick="btnAuctionAssess_Click"/>
            </asp:TableCell>

        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnCommit" class= "btn-GreenValleyGreen" runat="server" Text="Save" OnClick="btnCommit_Click"/>
            </asp:TableCell>
        </asp:TableRow>
       

    </asp:Table>
</asp:Content>

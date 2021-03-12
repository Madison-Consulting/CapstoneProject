<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MoveFormPt2.aspx.cs" Inherits="CapstoneProject.MoveFormPt2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Table ID="tblMoving" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPlz" runat="server" Font-Bold="true" Text="Please, provide the following moving information!"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblRoom" runat="server" Text="Room Type: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtRoom" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblBox" runat="server" Text="Box type: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtBox" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
          <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblBoxQty" runat="server" Text="Box Quantity: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtBoxQty" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
          <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMoveEquip" runat="server" Text="Moving equipment required: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtMoveEquip" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblItem" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
          <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblItemQty" runat="server" Text="Quantity of Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemQty" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblValue" runat="server" Text="Item Type: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlValue" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDriveway_SelectedIndexChanged">
                    <asp:ListItem>Select Type</asp:ListItem>
                    <asp:ListItem>Furniture</asp:ListItem>
                    <asp:ListItem>Tool</asp:ListItem>
                     <asp:ListItem>High Value</asp:ListItem>
                     <asp:ListItem>Specialty</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnCommit" runat="server" Text="Commit" OnClick="btnCommit_Click" />
                <asp:Button ID="btnAnother" runat="server" Text="New" OnClick="lnkAnother_Click" />
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click"/>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>

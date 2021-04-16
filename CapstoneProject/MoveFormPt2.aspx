<%@ Page Title="Room Form" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MoveFormPt2.aspx.cs" Inherits="CapstoneProject.MoveFormPt2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: auto; margin: 0 20% ">
    <asp:Table ID="MoveTwo" runat="server">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="5">
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
    </asp:Table>
    <asp:Table ID="tblItems" runat="server">
        <asp:TableRow ID="item1">
            <asp:TableCell>
                <asp:Label ID="lblItem1" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem1" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemQuant1" runat="server" Text="Quantity/# of Boxes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlItemQuant1" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemNote1" runat="server" Text="Note: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemNote1" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="item2">
            <asp:TableCell>
                <asp:Label ID="lblItem2" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem2" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemQuant2" runat="server" Text="Quantity/# of Boxes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlItemQuant2" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemNote2" runat="server" Text="Note: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemNote2" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="item3">
            <asp:TableCell>
                <asp:Label ID="lblItem3" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem3" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemQuant3" runat="server" Text="Quantity/# of Boxes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlItemQuant3" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemNote3" runat="server" Text="Note: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemNote3" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="item4">
            <asp:TableCell>
                <asp:Label ID="lblItem4" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem4" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemQuant4" runat="server" Text="Quantity/# of Boxes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlItemQuant4" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemNote4" runat="server" Text="Note: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemNote4" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="item5">
            <asp:TableCell>
                <asp:Label ID="lblItem5" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem5" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemQuant5" runat="server" Text="Quantity/# of Boxes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlItemQuant5" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemNote5" runat="server" Text="Note: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemNote5" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="item6">
            <asp:TableCell>
                <asp:Label ID="lblItem6" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem6" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemQuant6" runat="server" Text="Quantity/# of Boxes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlItemQuant6" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemNote6" runat="server" Text="Note: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemNote6" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="item7">
            <asp:TableCell>
                <asp:Label ID="lblItem7" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem7" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemQuant7" runat="server" Text="Quantity/# of Boxes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlItemQuant7" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemNote7" runat="server" Text="Note: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemNote7" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="item8">
            <asp:TableCell>
                <asp:Label ID="lblItem8" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem8" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemQuant8" runat="server" Text="Quantity/# of Boxes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlItemQuant8" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemNote8" runat="server" Text="Note: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemNote8" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="item9">
            <asp:TableCell>
                <asp:Label ID="lblItem9" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem9" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemQuant9" runat="server" Text="Quantity/# of Boxes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlItemQuant9" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemNote9" runat="server" Text="Note: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemNote9" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="item10">
            <asp:TableCell>
                <asp:Label ID="lblItem10" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem10" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemQuant10" runat="server" Text="Quantity/# of Boxes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlItemQuant10" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemNote10" runat="server" Text="Note: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemNote10" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="item11">
            <asp:TableCell>
                <asp:Label ID="lblItem11" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem11" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemQuant11" runat="server" Text="Quantity/# of Boxes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlItemQuant11" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemNote11" runat="server" Text="Note: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemNote11" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="item12">
            <asp:TableCell>
                <asp:Label ID="lblItem12" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem12" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemQuant12" runat="server" Text="Quantity/# of Boxes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlItemQuant12" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemNote12" runat="server" Text="Note: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemNote12" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="item13">
            <asp:TableCell>
                <asp:Label ID="lblItem13" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem13" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemQuant13" runat="server" Text="Quantity/# of Boxes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlItemQuant13" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemNote13" runat="server" Text="Note: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemNote13" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="item14">
            <asp:TableCell>
                <asp:Label ID="lblItem14" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem14" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemQuant14" runat="server" Text="Quantity/# of Boxes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlItemQuant14" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemNote14" runat="server" Text="Note: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemNote14" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="item15">
            <asp:TableCell>
                <asp:Label ID="lblItem15" runat="server" Text="Item: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem15" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemQuant15" runat="server" Text="Quantity/# of Boxes: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlItemQuant15" runat="server">
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblItemNote15" runat="server" Text="Note: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemNote15" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table ID="tblBottomButtons" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnAddAnotherItem" class= "btn-GreenValleyGreen" runat="server" Text="Add Another Item" OnClick="btnAddAnotherItem_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnRemoveLastItem" class= "btn-GreenValleyGreen" runat="server" Text="Remove Last Item" OnClick="btnRemoveLastItem_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell Height="40"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnCommit" class= "btn-GreenValleyGreen" runat="server" Text="Save Room" OnClick="btnCommit_Click" />
            </asp:TableCell>
            <asp:TableCell Width="30"></asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnDone" class= "btn-GreenValleyGreen" runat="server" Text="Done" OnClick="btnDone_Click"/>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

<%--                        <asp:Table ID="tblTxtBox" runat="server" Style="position:fixed; top: 80px; right: 50px;">
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell>
                    <asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Rows="15" Width="150px" Height="140"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>--%>
    
   </div>
</asp:Content>

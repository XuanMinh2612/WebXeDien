<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="chitietsanpham.aspx.cs" Inherits="webbanxe.userCode.chitietsanpham" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <link href="../Content/all.min.css" rel="stylesheet" />
    <link href="../Content/all.css" rel="stylesheet" />
    <script src="../Content/all.min.js"></script>
    <div class="container" >
        <div class="d-flex flex-column justify-content-center align-items-center">
            <div class="">
                <asp:Image ID="Image1"   runat="server" Height="600" Width="900" class="img-thumbnail mt-3" />
            </div>
            <div class="col-md-8 d-flex flex-column fw-semibold lh-lg">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger mb-3" Text="Thêm Sản Phẩm" OnClick="Button2_Click" Width="160px" />
                
            </div>
        </div>
    </div>
</asp:Content>

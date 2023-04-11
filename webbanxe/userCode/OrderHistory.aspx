<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="webbanxe.userCode.OrderHistory" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link
        rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="../Content/all.min.js"></script>
    <link href="../Content/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <main class="container min-vh-100">
        <h1>Order History</h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-hover">
            <Columns>
                <asp:TemplateField HeaderText="Mã Hoá Đơn">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("SoHD") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên khách hàng">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("TenKH") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Địa chỉ">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("DiaChi") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Ngày đặt">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("NgayDH") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Ghi chú">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("GhiChu") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" Text="Xem chi tiết" CssClass="btn btn-primary" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </main>
</asp:Content>

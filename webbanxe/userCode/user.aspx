<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="webbanxe.user" MasterPageFile="~/Site1.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .Button1{
            
        }
    </style>
    <link href="../Content/all.min.css" rel="stylesheet" />
    <script src="../Content/all.min.js"></script>
    <div>
        <div>
            <div class="container min-vh-100">
                <div class="row ">
                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                            <div class="col-md-4 mt-3 mb-3 ">
                                <div class="card border border-primary">
                                    <a href='<%# "chitietsanpham.aspx?MaSp=" + Eval("MaXe") %>'>
                                        <asp:Image ID="Imganh" CssClass="img-thumbnail" Height="300px" runat="server" ImageUrl='<%#"~/img/" + Eval("Anh") %>' /></a>
                                    <div class="card-body">
                                        <p></p>
                                        <p><%#Eval("TenXe") %></p>
                                        <p><%# int.Parse(Eval("GiaBan").ToString()).ToString("C0") %></p>
                                        <asp:Button ID="Button1" CssClass="btn" CommandArgument='<%#Eval("MaXe") %>' CommandName="addsp" runat="server" Text="Thêm Vào Giỏ Hàng" style="background-color: #3379b7;color:white"/>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

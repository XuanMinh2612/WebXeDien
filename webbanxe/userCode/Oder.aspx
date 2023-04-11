<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Oder.aspx.cs" Inherits="webbanxe.userCode.Oder" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link
        rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="../Content/all.min.js"></script>
    <link href="../Content/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <main class="min-vh-100">
        <div class="container">
            <div class="row">
                <div class="col-4">
                    <div class="mb-3">
                        <label class="form-label">Tên Khách Hàng</label>
                        <asp:TextBox runat="server" ID="txtTenKH" class="form-control"></asp:TextBox>

                    </div>
                    <div class="mb-3">
                        <label class="form-label">Địa chỉ</label>
                        <asp:TextBox runat="server" ID="txtDiaChi" class="form-control"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">SĐT</label>
                        <asp:TextBox runat="server" class="form-control" ID="txtSDT"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <asp:TextBox runat="server" class="form-control" ID="txtEmail"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Ghi chú</label>
                        <asp:TextBox runat="server" class="form-control" ID="txtGhiChu"></asp:TextBox>
                    </div>
                </div>
                <div class="col-8">
                    <asp:GridView ID="grvCart" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="None" DataKeyNames="MaXe" Style="margin: 0px auto">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="STT">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex +1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mã Sản Phẩm">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("MaXe") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tên Sản Phẩm">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("TenXe") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hình Ảnh">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Width="150" Height="150" ImageUrl='<%# ("~/img/")+Eval("Anh") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Số Lương">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtsl" Width="150" runat="server" Text='<%# Eval("SoLuong") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("SoLuong") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Đơn Giá">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("GiaBan") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tổng Tiền">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("thanhtien") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>

                </div>
            </div>

            <div>
                <asp:Button runat="server" CssClass="btn btn-primary" Text="Đặt Hàng" ID="btnDatHang" OnClick="btnDatHang_Click" />
                <asp:Label ID="lbTB" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </main>
</asp:Content>

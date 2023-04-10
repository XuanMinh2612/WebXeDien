<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="webbanxe.userCode.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="../Content/all.min.js"></script>
    <link href="../Content/all.min.css" rel="stylesheet" />
    <link href="main.css" rel="stylesheet" />
    <link
        rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: #fcfcfc;
        }

        .footer {
            position: sticky;
            bottom: 0;
            width: 100%;
            background-color: #3379b7;
            text-align: center;
            z-index: 999;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--Phần header--%> 
            
            <nav class="navbar navbar-expand-lg navbar-light " style="background-color: #3379b7">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#" style="font-size: 25px; color: white">Nhóm Bar</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" href="user.aspx" style="color: white">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" style="color: white">Link</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" style="color: white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Dropdown
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#" aria-disabled="true" style="color: white">Disabled</a>
                            </li>
                        </ul>
                        <div class="d-flex">
                            <a href="cart.aspx"><i class="fa-solid fa-cart-shopping" style="font-size: 25px; color: white"></i></a>
                        </div>
                    </div>
                </div>
            </nav>
            <%--phần chức năng--%>
            <div class="container">
                <asp:GridView ID="grvCart" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" CellPadding="4" GridLines="None" DataKeyNames="MaXe" OnRowEditing="gvgh_RowEditing" OnRowUpdating="gvgh_RowUpdating" Style="margin: 0px auto" OnRowDeleting="grvCart_RowDeleting" OnRowCancelingEdit="grvCart_RowCancelingEdit" OnRowDataBound="grvCart_RowDataBound">
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
                        <asp:CommandField HeaderText="Chức Năng" ShowDeleteButton="True" ShowEditButton="True" ControlStyle-CssClass="btn btn-danger" />
                    </Columns>
                </asp:GridView>
                <div class="container d-flex flex-row justify-content-end mt-3">
                    <div>
                        <asp:Label ID="lbtong" CssClass="fw-bold" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <%--Phần footer--%>
        <div style="position: absolute; bottom: 0px">
            <footer style="background-color: #3379b7">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <h4 style="color: white">About Us</h4>
                            <p class="" style="color: white">Xuân Ming Code Web lày đók</p>
                        </div>
                        <div class="col-md-4 mt-4">
                            <ul class="row row-cols-4 ">
                                <li style="list-style: none"><a href="#"><i class="fa-brands fa-facebook" style="color: white; font-size: 30px">Home</i></a></li>
                                <li style="list-style: none"><a href="#"><i class="fa-brands fa-instagram" style="color: white; font-size: 30px">Products</i></a></li>
                                <li style="list-style: none"><a href="#"><i class="fa-brands fa-google " style="color: white; font-size: 30px">Services</i></a></li>
                                <li style="list-style: none"><a href="#"><i class="fa-brands fa-linkedin " style="color: white; font-size: 30px">Services>Contact Us</i></a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <h4 style="color: white">Contact Us</h4>
                            <ul>
                                <li style="color: white"><i class="fa fa-map-marker me-2"></i>218 Lĩnh Nam - Hoàng Mai - Hà Nội</li>
                                <li style="color: white"><i class="fa fa-phone me-2"></i>0963805034</li>
                                <li style="color: white"><i class="fa fa-envelope me-2"></i>dangcongxuanminh@gmail.com</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>

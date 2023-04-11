<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="webbanxe.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <link
        rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <script src="../Content/all.min.js"></script>
    <link href="../Content/all.min.css" rel="stylesheet" />
    <style>
        input[type="text"] {
            display: block;
            margin-bottom: 10px;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        /*#btnAdd {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }*/

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #4caf50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .auto-style1 {
            margin-left: 40px;
        }

        #grvData th {
            text-align: center;
        }

        #grvData td {
            text-align: center;
        }
    </style>
</head>
<body  >
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-light " style="background-color: #198754">
            <div class="container-fluid">
                <a class="navbar-brand" href="#" style="font-size: 25px; color: white">Nhóm Bar</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="#" style="color: white">Home</a>
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
                                    <hr class="dropdown-divider" />
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" aria-disabled="true" style="color: white">Disabled</a>
                        </li>
                    </ul>

                    <ul class="navbar-nav" id="userDropdown">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" style="color: white" href="#" id="navbarDropdown1" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <asp:Label ID="lbUsername" runat="server" Text="Label" CssClass="mx-2 text-white text-capitalize cursor-pointer"></asp:Label>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li>
                                    <a href="#" style="text-decoration: none">
                                        <asp:Button ID="btnLogout" CssClass="dropdown-item" runat="server" Text="Đăng xuất" OnClick="btnLogout_Click" OnClientClick="return confirm('Bạn có muốn đăng xuất không?');" />

                                    </a>
                                </li>
                                <li>
                                    <hr class="dropdown-divider" />
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>

                    <asp:Button ID="btnLogin" runat="server" CssClass="text-white btn btn-outline-info mx-2" Text="Đăng nhập" OnClick="btnLogin_Click" CausesValidation="False" />
                </div>
            </div>
        </nav>
        <h1 class="text text-center text-success">TRANG QUẢN TRỊ SẢN PHẨM</h1>
        <div>
            <table class="container">
                <tr>
                    <td>Mã Xe</td>
                    <td>
                        <asp:TextBox ID="txtMa" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtMa" ForeColor="Red">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>Tên Xe</td>
                    <td>
                        <asp:TextBox ID="txtTenXe" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtTenXe" ForeColor="Red">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>Tên Hãng Xe</td>
                    <td>
                        <asp:TextBox ID="txtHangXe" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtHangXe" ForeColor="Red">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>Năm Sản Xuất</td>
                    <td>
                        <asp:TextBox ID="txtNamSX" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNamSX" ErrorMessage="RegularExpressionValidator" ForeColor="#CC3300" ValidationExpression="[2][0-9]{3}">Năm Sản Xuất Phải Bắt Đầu Bằng Số 2 </asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td>Kiểu Dáng</td>
                    <td>
                        <asp:TextBox ID="txtKieuDang" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtKieuDang" ForeColor="Red">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>Mô Tả</td>
                    <td>
                        <asp:TextBox ID="txtMota"  runat="server" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtMota" ForeColor="Red">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td >Hình Ảnh</td>
                    <td>
                        <asp:FileUpload ID="fileAnh" runat="server" /></br>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="fileAnh" ForeColor="Red">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>Giá Bán</td>
                    <td>
                        <asp:TextBox ID="txtGiaBan" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtGiaBan" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="\d{4,10}">Giá không hợp lý</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" Text="Thêm Sản Phẩm" OnClick="btnAdd_Click" />
                            <asp:Button ID="Button1" runat="server" class="btn btn-success ms-5" Text="Reset" CausesValidation="False" OnClick="Button1_Click" />
                        </br>
                    <asp:Label ID="Label2" runat="server" Enabled="False" ForeColor="Red"></asp:Label>
                        </br>
                    <asp:Label ID="Label3" runat="server" Enabled="False" ForeColor="Red"></asp:Label></td>
                </tr>
            </table>
            <div >
                <asp:GridView ID="grvData" runat="server" CssClass="border-success" AutoGenerateColumns="False" DataKeyNames="MaXe" OnRowEditing="grvData_RowEditing" OnRowCancelingEdit="grvData_RowCancelingEdit" OnRowDataBound="grvData_RowDataBound" OnRowDeleting="grvData_RowDeleting" OnRowUpdating="grvData_RowUpdating" OnSelectedIndexChanged="grvData_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="Mã Xe">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("MaXe") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TenXe" HeaderText="Tên Xe" />
                        <asp:BoundField DataField="TenHang" HeaderText="Tên Hãng" />
                        <asp:BoundField DataField="NamSx" HeaderText="Năm Sản Xuất" />
                        <asp:BoundField DataField="KieuDang" HeaderText="Kiểu Dáng" />
                        <asp:BoundField DataField="MoTa" HeaderText="Mô Tả" />
                        <asp:TemplateField HeaderText="Hình Ảnh">
                            <EditItemTemplate>
                                <asp:FileUpload ID="fileSua" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" Width="350" Height="250" runat="server" ImageUrl='<%# "~/img/"+Eval("Anh") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="GiaBan" HeaderText="Giá Bán" />
                        <asp:CommandField HeaderText="Chức Năng" ControlStyle-CssClass="btn btn-success" ShowDeleteButton="True" ShowEditButton="True" CausesValidation="False" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div style="position: static; bottom: 0px; margin-top:20px">
            <footer style="background-color: #198754">
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

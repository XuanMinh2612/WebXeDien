<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="webbanxe.Register" %>

<!DOCTYPE html
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="stylesheet" href="style.css" />
    <style>
        body {
            background: linear-gradient(to right, #FFC371, #FF5F6D);
            font-family: 'Helvetica Neue', sans-serif;
            font-size: 18px;
            color: #333;
        }

        #btnRegister {
            background-color: #4CAF50;
            border: none;
            color: white;
        }

            #btnRegister:hover {
                background-color: #008CBA;
                color: white;
            }

        #lnkButton {
            background-color: #4CAF50;
            border: none;
            color: white;
        }

            #lnkButton:hover {
                background-color: #008CBA;
                color: white;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Regxister</h2>
            <hr />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
            <br />
            <br />
            <table>
                <tr>
                    <td>Username:</td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server" /></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" /></td>
                </tr>
                <tr>
                    <td>Full Name:</td>
                    <td>
                        <asp:TextBox ID="txtFullName" runat="server" /></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td>
                        <asp:TextBox ID="txtAddress" runat="server" /></td>
                </tr>
                <tr>
                    <td>Phone Number:</td>
                    <td>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" /></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" /></td>
                </tr>
                <tr>
                    <td>Role:</td>
                    <td>
                        <asp:DropDownList ID="ddlRole" runat="server">
                            <asp:ListItem Text="User" Value="user" Selected="True" />
                            <asp:ListItem Text="Admin" Value="admin" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                        <asp:LinkButton ID="lnkButton" runat="server" Text="Login" OnClick="lnkButton_Click"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

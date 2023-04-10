<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="webbanxe.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="../Content/all.css" rel="stylesheet" />
    <script src="../Content/all.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        body {
            background: linear-gradient(to right, #FFC371, #FF5F6D);
            font-family: 'Helvetica Neue', sans-serif;
            font-size: 18px;
            color: #333;
        }
        h2 {
             font-size: 24px;
            font-weight: bold;
            color:#2980b9;
        }
        form {
            margin-top: 12%;
            margin-left: 37%;
            width: 400px;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
        }
        label {
            display: block;
            margin-bottom: 10px; 
        }
        input[type=text], input[type=password] {
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        button[type=submit] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }

            button[type=submit]:hover {
                background-color: #45a049;
            }

        #error-message {
            color: red;
            margin-top: 10px;
        }

        #btnLogin {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 12px 24px;
            margin-left: 38%;
        }

            #btnLogin:hover {
                background-color: #008CBA;
                color: white;
            }

        p {
            font-family: 'Helvetica Neue', sans-serif;
            font-size: 15px;
            line-height: 1.5;
            color: #333;
            margin: 0;
            padding: 10px 0;
        }

        a {
            color: #008CBA;
            text-decoration: none;
            transition: all 0.3s ease-in-out;
        }

            a:hover {
                color: #005F6B;
                text-decoration: underline;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="main">
            <h2>Login</h2><hr />
            <label>Tên đăng nhập:</label>
            <asp:TextBox ID="txtUsername" runat="server" ></asp:TextBox>
            <br />
            <br />
            <label>Mật khẩu:</label>
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" />
            <p>Do not have an account ? <a href="Register.aspx">Click here</a></p>
        </div>
    </form>
</body>
</html>

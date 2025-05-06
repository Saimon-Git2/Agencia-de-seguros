<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AgenciaWeb.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Agencia Don Chucho</title>
    <link href="css/estilo2.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Iniciar Sesión</h2>
            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label><br />
            <asp:TextBox ID="txtUsuario" runat="server" Placeholder="Usuario"></asp:TextBox><br />
            <asp:TextBox ID="txtContrasena" runat="server" Placeholder="Contraseña" TextMode="Password"></asp:TextBox><br />
            <asp:Button ID="btnLogin" runat="server" Text="Ingresar" OnClick="btnLogin_Click" /><br />
            ¿No tienes cuenta? <a href="Registro.aspx">Regístrate aquí</a>
        </div>
    </form>
</body>
</html>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="AgenciaWeb.Registro" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro - Agencia Don Chucho</title>
    <link href="css/estilo2.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
            <h2>Registro de Usuario</h2>
            <asp:Label ID="lblMensaje" runat="server" ForeColor="Green"></asp:Label><br />
            <asp:TextBox ID="txtUsuario" runat="server" Placeholder="Usuario"></asp:TextBox><br />
            <asp:TextBox ID="txtContrasena" runat="server" Placeholder="Contraseña" TextMode="Password"></asp:TextBox><br />
            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" /><br />
            ¿Ya tienes cuenta? <a href="Login.aspx">Inicia sesión</a>
        </div>
    </form>
</body>
</html>

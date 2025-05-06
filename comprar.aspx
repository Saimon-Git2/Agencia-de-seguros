<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="comprar.aspx.cs" Inherits="AgenciaWeb.Comprar" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="utf-8" />
    <title>Comprar Seguro - Seguros SURA</title>
    <link href="css/estilo.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Sidebar -->
            <div class="sidebar">
                <hr />
                <p style="text-align:center;">MENU DE OPCIONES</p>
                <hr />
                <ul>
                    <li><a href="Default.aspx">Inicio</a></li>
                    <li><a href="gestion_planes.aspx">Gestión de Planes</a></li>
                    <li><a href="comprar.aspx">Comprar Seguro</a></li>
                </ul>
                <div class="logout-container">
                    <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar Sesión" OnClick="btnCerrarSesion_Click" CssClass="btn" />
                </div>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <h2>Comprar Seguro</h2>
                <asp:DropDownList ID="ddlSeguros" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSeguros_SelectedIndexChanged">
                    <asp:ListItem Text="Seleccione un seguro" Value="" />
                    <asp:ListItem Text="Seguro de Vida" Value="Vida" />
                    <asp:ListItem Text="SOAT" Value="SOAT" />
                    <asp:ListItem Text="Seguro de Salud" Value="Salud" />
                    <asp:ListItem Text="Seguro de Hogar" Value="Hogar" />
                    <asp:ListItem Text="Seguro de Automóvil" Value="Auto" />
                </asp:DropDownList>
                <br /><br />
                <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre completo" CssClass="input" />
                <br />
                <asp:TextBox ID="txtDocumento" runat="server" placeholder="Número de documento" CssClass="input" />
                <br />
                <asp:TextBox ID="txtTelefono" runat="server" placeholder="Teléfono" CssClass="input" />
                <br />
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Correo electrónico" CssClass="input" />
                <br /><br />
                <asp:Label ID="lblMonto" runat="server" Font-Bold="true" ForeColor="Green" />
                <br /><br />
                <asp:Button ID="btnPagar" runat="server" Text="Pagar" OnClick="btnPagar_Click" CssClass="btn" />
                <asp:Label ID="lblConfirmacion" runat="server" ForeColor="Blue" />
            </div>
        </div>
    </form>
</body>
</html>

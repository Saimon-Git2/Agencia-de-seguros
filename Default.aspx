<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AgenciaWeb.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Agencia de Seguros Sura</title>
    <link href="css/estilo.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
         
        <div class="container">
            <!-- Menú Vertical -->
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
            
            <!-- Contenido Principal -->
           <div class="main-content">
    <div id="panelContent" class="panel-content">
        <h1>Bienvenido, <%= Session["usuario"] %> a Seguros SURA</h1>
        <p>¡Bienvenido a nuestro aplicativo web de Seguros SURA! Aquí podrás gestionar y comprar los seguros que desees de manera rápida y segura.</p>

        <h2>Seguros Disponibles</h2>
        <table border="1" cellpadding="10" cellspacing="0" style="width:100%; text-align:left;">
            <tr style="background-color:#f2f2f2;">
                <th>Nombre del Seguro</th>
                <th>Precio Mensual</th>
                <th>Beneficios</th>
            </tr>
            <tr>
                <td>Seguro de Vida</td>
                <td>$50.000</td>
                <td>Protección familiar, indemnización por fallecimiento</td>
            </tr>
            <tr>
                <td>SOAT</td>
                <td>$180.000</td>
                <td>Cobertura obligatoria para accidentes de tránsito</td>
            </tr>
            <tr>
                <td>Seguro de Salud</td>
                <td>$120.000</td>
                <td>Atención médica privada, hospitalización, urgencias</td>
            </tr>
            <tr>
                <td>Seguro de Hogar</td>
                <td>$75.000</td>
                <td>Protección contra incendios, robos y desastres naturales</td>
            </tr>
            <tr>
                <td>Seguro de Automóvil</td>
                <td>$150.000</td>
                <td>Cobertura por daños, robos, responsabilidad civil</td>
            </tr>
        </table>
    </div>
</div>

            

        </div>
    </form>
</body>
</html>

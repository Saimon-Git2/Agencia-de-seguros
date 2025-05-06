using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace AgenciaWeb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/App_Data/usuarios.txt");
            string[] lines = File.ReadAllLines(path);
            bool valido = false;

            foreach (string line in lines)
            {
                string[] partes = line.Split('|');
                if (partes.Length == 2)
                {
                    string usuario = partes[0];
                    string contrasena = partes[1];

                    if (txtUsuario.Text == usuario && txtContrasena.Text == contrasena)
                    {
                        Session["usuario"] = usuario; // Guardar el usuario en la sesión
                        valido = true;
                        break;
                    }
                }
            }

            if (valido)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblMensaje.Text = "Usuario inválido. Por favor regístrese o escriba bien la contraseña.";
            }
        }
    }
}
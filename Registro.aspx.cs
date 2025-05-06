using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace AgenciaWeb
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/App_Data/usuarios.txt");

            // Validar si el usuario ya existe
            string[] lines = File.Exists(path) ? File.ReadAllLines(path) : new string[0];
            foreach (string line in lines)
            {
                if (line.StartsWith(txtUsuario.Text + "|"))
                {
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    lblMensaje.Text = "El usuario ya existe. Por favor elige otro.";
                    return;
                }
            }

            using (StreamWriter sw = File.AppendText(path))
            {
                sw.WriteLine(txtUsuario.Text + "|" + txtContrasena.Text);
            }

            lblMensaje.ForeColor = System.Drawing.Color.Green;
            lblMensaje.Text = "Registro exitoso. Ahora puedes iniciar sesión.";
            txtUsuario.Text = "";
            txtContrasena.Text = "";
        }
    }
}

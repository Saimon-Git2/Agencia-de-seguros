using AgenciaWeb.modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace AgenciaWeb

{
    public partial class GestionPlanes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                string usuario = Session["usuario"].ToString();

                var seguros = ObtenerTodosLosSeguros(usuario);

                var activos = seguros.Where(s => s.Estado == "Activo").ToList();
                var inactivos = seguros.Where(s => s.Estado == "Inactivo").ToList();

                if (activos.Count > 0)
                {
                    rptSegurosActivos.DataSource = activos;
                    rptSegurosActivos.DataBind();
                }
                else
                {
                    lblMensaje.Visible = true;
                }

                if (inactivos.Count > 0)
                {
                    rptSegurosInactivos.DataSource = inactivos;
                    rptSegurosInactivos.DataBind();
                }
                else
                {
                    lblInactivos.Visible = true;
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
        private List<Seguro> ObtenerTodosLosSeguros(string usuario)
        {
            List<Seguro> seguros = new List<Seguro>();
            string path = Server.MapPath("~/App_Data/seguros.txt");

            if (File.Exists(path))
            {
                foreach (string linea in File.ReadAllLines(path))
                {
                    string[] datos = linea.Split(';');
                    if (datos[0] == usuario)
                    {
                        seguros.Add(new Seguro
                        {
                            Nombre = datos[1],
                            Descripcion = datos[2],
                            FechaActivacion = datos[7],
                            Estado = datos[6]
                        });
                    }
                }
            }
            return seguros;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            string usuario = Session["usuario"].ToString();
            Button btn = (Button)sender;
            string fechaActivacion = btn.CommandArgument;

            string path = Server.MapPath("~/App_Data/seguros.txt");
            if (File.Exists(path))
            {
                var lineas = File.ReadAllLines(path).ToList();

                for (int i = 0; i < lineas.Count; i++)
                {
                    var datos = lineas[i].Split(';');

                    // Buscamos la línea que coincida con el usuario y la fecha
                    if (datos[0] == usuario && datos[7] == fechaActivacion && datos[6] == "Activo")
                    {
                        datos[6] = "Inactivo"; // Estado
                        lineas[i] = string.Join(";", datos);
                        break;
                    }
                }

                File.WriteAllLines(path, lineas);
            }

            // Refrescar para mostrar los cambios
            Response.Redirect(Request.RawUrl);
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            // Código para cerrar sesión
            Session.Clear();  // Limpia la sesión
            Response.Redirect("Login.aspx");  // Redirige al Login
        }
        private List<Seguro> ObtenerSegurosActivos(string usuario)
        {
            List<Seguro> seguros = new List<Seguro>();
            string path = Server.MapPath("~/App_Data/seguros.txt");

            if (File.Exists(path))
            {
                foreach (string linea in File.ReadAllLines(path))
                {
                    string[] datos = linea.Split(';');
                    if (datos[0] == usuario && datos[6] == "Activo")
                    {
                        seguros.Add(new Seguro
                        {
                            Nombre = datos[1],
                            Descripcion = datos[2],
                            FechaActivacion = datos[3]
                        });
                    }
                }
            }
            return seguros;
        }


    }
}
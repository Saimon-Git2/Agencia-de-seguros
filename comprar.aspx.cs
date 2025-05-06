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
    public partial class Comprar : System.Web.UI.Page
    {
 
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                if (Session["usuario"] == null)
                {
                    Response.Redirect("login.aspx");
                }

                if (Request.QueryString["seguro"] != null)
                {
                    string seguroSeleccionado = Request.QueryString["seguro"];
                    ddlSeguros.SelectedValue = seguroSeleccionado;
                    MostrarMonto(seguroSeleccionado);
                }
            }
        }

        protected void ddlSeguros_SelectedIndexChanged(object sender, EventArgs e)
        {
            string seguro = ddlSeguros.SelectedValue;
            MostrarMonto(seguro);
        }

        private void MostrarMonto(string seguro)
        {
            Dictionary<string, string> precios = new Dictionary<string, string>()
            {
                { "Vida", "$50.000" },
                { "SOAT", "$180.000" },
                { "Salud", "$120.000" },
                { "Hogar", "$75.000" },
                { "Auto", "$150.000" }
            };

            if (precios.ContainsKey(seguro))
            {
                lblMonto.Text = "Monto a pagar: " + precios[seguro];
            }
            else
            {
                lblMonto.Text = "";
            }
        }

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            string usuario = Session["usuario"]?.ToString();
            string seguro = ddlSeguros.SelectedItem.Value;
            string nombre = txtNombre.Text.Trim();
            string documento = txtDocumento.Text.Trim();
            string telefono = txtTelefono.Text.Trim();
            string email = txtEmail.Text.Trim();
            string monto = lblMonto.Text.Replace("Monto a pagar: ", "");

            // Validaciones de campos
            if (string.IsNullOrEmpty(seguro) || seguro == "")
            {
                lblConfirmacion.Text = "Por favor selecciona un seguro válido.";
                return;
            }

            if (string.IsNullOrEmpty(nombre) || string.IsNullOrEmpty(documento) ||
                string.IsNullOrEmpty(telefono) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(monto))
            {
                lblConfirmacion.Text = "Por favor completa todos los campos antes de continuar.";
                return;
            }

            // Guardar los datos
            string ruta = Server.MapPath("~/App_Data/seguros.txt");

            using (StreamWriter sw = new StreamWriter(ruta, true))
            {
                sw.WriteLine($"{usuario};{seguro};{nombre};{documento};{telefono};{monto};Activo;{DateTime.Now}");
            }

            lblConfirmacion.Text = "¡Compra realizada con éxito!";
        }


        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("login.aspx");
        }
    }
}

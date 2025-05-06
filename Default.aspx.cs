using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;

namespace AgenciaWeb
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }


        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Elimina todas las variables de sesión
            Response.Redirect("login.aspx");
        }
    }
   

}
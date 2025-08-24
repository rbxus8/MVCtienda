using System.Web.Mvc;
using TiendaMVC.Models;
using Npgsql;

namespace TiendaMVC.Controllers
{
    public class AccountController : Controller
    {
        private string connectionString = "Host=aws-1-us-east-2.pooler.supabase.com;Port=6543;Username=postgres.gaxafybwspgwdnvrsgsm;Password=Database123.$hhy;Database=postgres;SslMode=Require";

        // GET: Login
        public ActionResult Login()
        {
            return View();
        }

        // POST: Login
        [HttpPost]
        public ActionResult Login(User user)
        {
            if (!string.IsNullOrEmpty(user.Correo) && !string.IsNullOrEmpty(user.Clave))
            {
                try
                {
                    using (var conexion = new NpgsqlConnection(connectionString))
                    {
                        conexion.Open();

                        // Consulta solo para verificar existencia
                        string sql = "SELECT 1 FROM usuario WHERE correo=@correo AND clave=@clave LIMIT 1";

                        using (var cmd = new NpgsqlCommand(sql, conexion))
                        {
                            cmd.Parameters.AddWithValue("correo", user.Correo);
                            cmd.Parameters.AddWithValue("clave", user.Clave);

                            var result = cmd.ExecuteScalar();

                            if (result != null)
                            {
                                // Usuario válido
                                Session["Usuario"] = user.Correo;
                                return RedirectToAction("Index", "Home");
                            }
                            else
                            {
                                ViewBag.Error = "Correo o contraseña incorrectos.";
                            }
                        }
                    }
                }
                catch (System.Exception ex)
                {
                    ViewBag.Error = "Error al conectar con la base de datos: " + ex.Message;
                }
            }
            else
            {
                ViewBag.Error = "Por favor ingrese correo y contraseña.";
            }

            return View(user);
        }

        // GET: Logout
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }
    }
}

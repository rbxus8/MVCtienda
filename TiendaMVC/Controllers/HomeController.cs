using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TiendaMVC.Models;

namespace TiendaMVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            // Crear instancia de tu clase de conexión
            var db = new DatabaseConnection();

            // Probar conexión y obtener mensaje
            string mensajeConexion = db.ProbarConexion();

            // Pasar mensaje a la vista
            ViewBag.MensajeConexion = mensajeConexion;

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
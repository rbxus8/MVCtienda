using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TiendaMVC.Models
{
    public class ApplicationDbContext : Controller
    {
        // GET: ApplicationDbContext
        public ActionResult Index()
        {
            return View();
        }
    }
}
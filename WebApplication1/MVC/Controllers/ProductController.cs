using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Repository;

namespace MVC.Controllers
{
    public class ProductController : Controller
    {
        //
        // GET: /Product/
        public ActionResult Index()
        {
            ViewBag.Products = ProductRepository.GetAll();
            return View();
        }

        
        public JsonResult GetAll()
        {            
            var data = ProductRepository.GetAll();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
	}
}
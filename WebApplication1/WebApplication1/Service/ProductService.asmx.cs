using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using WebApplication1.Model;
using WebApplication1.Repository;

namespace WebApplication1.Service
{
    /// <summary>
    /// Summary description for ProductService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ProductService : System.Web.Services.WebService
    {

        [WebMethod]
        public List<Product> GetAllProduct()
        {
            return ProductRepository.GetAll();
        }

        [WebMethod]
        public Product FindProductById(int id)
        {
            return ProductRepository.FindById(id);
        }

        [WebMethod]
        public bool AddProduct(Product prod)
        {
            try
            {
                ProductRepository.Add(prod);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}

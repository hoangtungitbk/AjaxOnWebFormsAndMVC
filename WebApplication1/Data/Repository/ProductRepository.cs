using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Model;

namespace WebApplication1.Repository
{
    public class ProductRepository
    {
        static List<Product> products;
        static ProductRepository()
        {
            products = new List<Product> { 
                new Product{ Id=1, Name="Product 01", Price = 100},
                new Product{ Id=2, Name="Product 02", Price = 200},
                new Product{ Id=3, Name="Product 03", Price = 300}
            };
        }

        public static List<Product> GetAll()
        {
            return products;
        }

        public static Product FindById(int id)
        {
            return products.FirstOrDefault(p => p.Id == id);
        }
        public static void Add(Product prod)
        {
            products.Add(prod);
        }
    }
}
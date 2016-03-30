using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Model;
using WebApplication1.Repository;

namespace WebApplication1.Presentation
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            rptProduct.DataSource = ProductRepository.GetAll();
            rptProduct.DataBind();
        }
        protected void AddProduct(object sender, EventArgs e)
        {
            var prod = new Product { Id = int.Parse(txtId.Text), Name = txtName.Text, Price = decimal.Parse(txtPrice.Text) };
            ProductRepository.Add(prod);
            LoadProducts();
        }

    }
}
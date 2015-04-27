using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                loadProducts();
            }
        }

        void loadProducts()
        {
            using (DBEcommerceEntities db = new DBEcommerceEntities())
            {
                lvProducts.DataSource = db.Products.OrderByDescending(pro => pro.NumViews).ToList();
                lvProducts.DataBind();
            }
        }

        protected void lvProducts_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dp.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            loadProducts();
        }

    }
}
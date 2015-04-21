using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM
{
    public partial class Shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            using (DBEcommerceEntities db = new DBEcommerceEntities())
            {
                List<Product> ds = db.Products.ToList();
                this.lvProducts.DataSource = ds;
                this.lvProducts.DataBind();
            }
        }

        protected void lvProducts_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dp.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            LoadData();
        }
    }
}
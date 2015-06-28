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
                if (Request.QueryString["sucess"] != null)
                {
                    string message = "Chúc mừng bạn đã đặt hàng thành công.Chúng tôi sẽ liên hệ sau";
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append("<script type = 'text/javascript'>");
                    sb.Append("window.onload=function(){");
                    sb.Append("alert('");

                    sb.Append(message);

                    sb.Append("')};");

                    sb.Append("</script>");

                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
                }
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
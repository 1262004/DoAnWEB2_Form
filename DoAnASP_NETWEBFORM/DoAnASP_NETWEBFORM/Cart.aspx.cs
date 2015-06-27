using DoAnASP_NETWEBFORM.helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM
{
    public partial class Cart : System.Web.UI.Page
    {
        DBEcommerceEntities db = new DBEcommerceEntities();
        decimal _total = 0;
        string _unit;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!CurrentContext.IsLogged())
            {
                Response.Redirect("~/Login.aspx?retUrl=Cart.aspx");
            }

            if (!IsPostBack)
            {
                lvItemsCart.DataSource = CurrentContext.getCart().Items;
                lvItemsCart.DataBind();

                lblTotal.Text = string.Format("{0:N0} {1}", _total, _unit);
            }            
        }

        protected void lvItemsCart_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                cCartItem item = (cCartItem)e.Item.DataItem;

                Product product = db.Products.SingleOrDefault(pro => pro.ProductID == item.ProID);
                ((ImageButton)e.Item.FindControl("imgPro")).ImageUrl = "images/product/" + product.LinkImage;
                ((Label)e.Item.FindControl("lblProName")).Text = product.ProductName;
                ((Label)e.Item.FindControl("lblPrice")).Text = string.Format("{0:N0} {1}", product.UnitPrice, product.Unit);
                ((Label)e.Item.FindControl("lblAmount")).Text = string.Format("{0:N0} {1}", item.Quantity * product.UnitPrice, product.Unit);

                _total = Convert.ToDecimal(item.Quantity * product.UnitPrice);
                _unit = product.Unit;
            }
        }

        protected void lvItemsCart_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("deleteItem"))
            {
                int proID = Convert.ToInt32(e.CommandArgument);
                CurrentContext.getCart().delete(proID);

                ((Site)this.Master).updateLinkCart();

                lvItemsCart.DataSource = CurrentContext.getCart().Items;
                lvItemsCart.DataBind();
            }

            if (e.CommandName.Equals("up"))
            {
                int proID = Convert.ToInt32(e.CommandArgument);                
                CurrentContext.getCart().up(proID);
                ((Site)this.Master).updateLinkCart();

                lvItemsCart.DataSource = CurrentContext.getCart().Items;
                lvItemsCart.DataBind();
            }

            if (e.CommandName.Equals("down"))
            {
                int proID = Convert.ToInt32(e.CommandArgument);
                CurrentContext.getCart().down(proID);

                ((Site)this.Master).updateLinkCart();

                lvItemsCart.DataSource = CurrentContext.getCart().Items;
                lvItemsCart.DataBind();
            }
        }
    }
}
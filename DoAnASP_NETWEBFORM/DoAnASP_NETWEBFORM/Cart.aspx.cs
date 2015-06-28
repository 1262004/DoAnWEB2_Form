using DoAnASP_NETWEBFORM.helpers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
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
                Session["Total"] = _total;
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

        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            if (rdoNgay.Checked)
            {
                double amountVND = Convert.ToDouble(Session["Total"]);
                string itemInfo = "Cart Item";
                string name = "hb";
                string phone = "01688469370";
                string email = "hoaibao.cg@gmail.com";
                string currency = "USD";
                PayWithPayPal(amountVND.ToString(), itemInfo, name, phone, email, currency);
            }
            else
            {

                if (Session["CurCus"] != null)
                {
                    Customer c = (Customer)Session["CurCus"];
                    Order O = new Order();
                    O.CustomerID = c.CustomerID;
                    O.DateBuy = DateTime.Now;
                    O.EmployeeID = null;
                    O.Status = 1;
                    O.Payments = "Thanh toan ngay";
                    helpers.cCart cart = CurrentContext.getCart();
                    foreach (helpers.cCartItem item in cart.Items)
                    {
                        Product p = db.Products.SingleOrDefault(q => q.ProductID == item.ProID);
                        OrderDetail del = new OrderDetail();
                        del.ProductID = p.ProductID;
                        del.Quantity = item.Quantity;
                        del.UnitPrice = p.UnitPrice;
                        del.TotalMoney = Convert.ToDouble(del.Quantity * del.UnitPrice);
                        O.OrderDetails.Add(del);
                    }
                    O.TotalMoney = O.OrderDetails.Sum(m => m.TotalMoney);
                    db.Orders.Add(O);
                    db.SaveChanges();
                    cart.Items.Clear();
                    Response.Redirect("~/Default.aspx?sucess=1");
                }
               
            }
        }
        protected void PayWithPayPal(string amount, string itemInfo, string name,
          string phone, string email, string currency)
        {
            string redirecturl = "";

            //Mention URL to redirect content to paypal site
            redirecturl += "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=" +
                           ConfigurationManager.AppSettings["paypalemail"].ToString();

            //First name i assign static based on login details assign this value
            redirecturl += "&first_name=" + name;

            //City i assign static based on login user detail you change this value
            redirecturl += "&city=bhubaneswar";

            //State i assign static based on login user detail you change this value
            redirecturl += "&state=Odisha";

            //Product Name
            redirecturl += "&item_name=" + itemInfo;

            //Product Name
            redirecturl += "&amount=" + amount;

            //Phone No
            redirecturl += "&night_phone_a=" + phone;

            //Product Name
            redirecturl += "&item_name=" + itemInfo;

            //Address 
            redirecturl += "&address1=" + email;

            //Business contact id
            // redirecturl += "&business=k.tapankumar@gmail.com";

            //Shipping charges if any
            redirecturl += "&shipping=0";

            //Handling charges if any
            redirecturl += "&handling=0";

            //Tax amount if any
            redirecturl += "&tax=0";

            //Add quatity i added one only statically 
            redirecturl += "&quantity=1";

            //Currency code 
            redirecturl += "&currency=" + currency;

            //Success return page url
            redirecturl += "&return=" +
              ConfigurationManager.AppSettings["SuccessURL"].ToString();

            //Failed return page url
            redirecturl += "&cancel_return=" +
              ConfigurationManager.AppSettings["FailedURL"].ToString();

            Response.Redirect(redirecturl);
        }
    }
}
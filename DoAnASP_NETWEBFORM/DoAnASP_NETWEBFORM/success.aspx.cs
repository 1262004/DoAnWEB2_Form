using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM
{
    public partial class success : System.Web.UI.Page
    {
        DBEcommerceEntities db = new DBEcommerceEntities();
        protected void Page_Load(object sender, EventArgs e)
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
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                Response.Redirect("~/404.aspx");
            }
        }

    }
}
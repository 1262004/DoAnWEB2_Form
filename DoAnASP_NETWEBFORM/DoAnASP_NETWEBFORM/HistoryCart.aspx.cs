using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM
{
    public partial class HistoryCart : System.Web.UI.Page
    {
        DBEcommerceEntities db = new DBEcommerceEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (CurrentContext.IsLogged())
                {
                    Customer curCus = CurrentContext.getCustomer();
                    var list = db.OrderDetails.Where(o => o.Order.CustomerID == curCus.CustomerID)
                        .Select(ord => new
                        {
                            LinkImage = ord.Product.LinkImage,
                            ProductName = ord.Product.ProductName,
                            UnitPrice = ord.Product.UnitPrice,
                            Unit = ord.Product.Unit,
                            Quantity = ord.Quantity,
                            DateBuy = ord.Order.DateBuy,
                            TotalMoney = ord.TotalMoney,
                            Payments = ord.Order.Payments
                        })
                        .ToList();
                    lvIHistorytemsCart.DataSource = list;
                    lvIHistorytemsCart.DataBind();
                }

            }
        }
    }
}
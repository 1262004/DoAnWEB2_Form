using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM.Admin
{
    public partial class Order_Adm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession = true)]
        public static object OrderList(int jtStartIndex = 0, int jtPageSize = 0, string jtSorting = null)
        {
            return Methods.OrderList(jtStartIndex, jtPageSize, jtSorting);
        }
         [WebMethod(EnableSession = true)]
        public static object CreateOrder(Order record)
        {
            return Methods.CreateOrder(record);
        }
         [WebMethod(EnableSession = true)]
         public static object UpdateOrder(Order record)
         {
             return Methods.UpdateOrder(record);
         }
         [WebMethod(EnableSession = true)]
         public static object DeleteOrder(int OrderID)
         {
             return Methods.DeleteOrder(OrderID);
         }
         [WebMethod(EnableSession = true)]
         public static object DetailList_Order(int OrderID)
         {
             return Methods.DetailList_Order(OrderID);
         }
         [WebMethod(EnableSession = true)]
         public static object CreateDetail(OrderDetail record)
         {
             return Methods.CreateDetail(record);
         }
         [WebMethod(EnableSession = true)]
         public static object UpdateDetail(OrderDetail record)
         {
             return Methods.UpdateDetail(record);
         }
         [WebMethod(EnableSession = true)]
         public static object DeleteDetail(int OrderID, int ProductID)
         {
             return Methods.DeleteDetail(OrderID, ProductID);
         }


         [WebMethod(EnableSession = true)]
         public static object GetCustomerOptions()
         {
             return Methods.GetCustomerOptions();
         }
         [WebMethod(EnableSession = true)]
         public static object GetEmployeeOptions()
         {
             return Methods.GetEmployeeOptions();
         }
         [WebMethod(EnableSession = true)]
         public static object GetProductOptions()
         {
             return Methods.GetProductOptions();
         }
    }
}
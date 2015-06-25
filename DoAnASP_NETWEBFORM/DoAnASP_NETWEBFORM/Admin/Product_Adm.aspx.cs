using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM.Admin
{
    public partial class Product_Adm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession = true)]
        public static object ProductList(int jtStartIndex = 0, int jtPageSize = 0, string jtSorting = null)
        {
            return Methods.ProductList(jtStartIndex, jtPageSize, jtSorting);
        }
        [WebMethod(EnableSession = true)]
        public static object CreateProduct(Product record)
        {
            return Methods.CreateProduct(record);
        }
        [WebMethod(EnableSession = true)]
        public static object UpdateProduct(Product record,bool flag)
        {
            return Methods.UpdateProduct(record,flag);
        }
        [WebMethod(EnableSession = true)]
        public static object DeleteProduct(int ProductID)
        {
            return Methods.DeleteProduct(ProductID);
        }

        [WebMethod(EnableSession = true)]
        public static object GetCateOptions()
        {
            return Methods.GetCateOptions();
        }
    
        [WebMethod(EnableSession = true)]
        public static object GetSuppOptions()
        {
            return Methods.GetSuppOptions();
        }
        // cate
         [WebMethod(EnableSession = true)]
        public static object ProductList_Cate(int CategoryID)
        {
            return Methods.ProductList_Cate(CategoryID);
        }
    }
}
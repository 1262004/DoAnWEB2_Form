using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM.Admin
{
    public partial class Categories_Adm : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
         [WebMethod(EnableSession = true)]
        public static object CategoriesList(int jtStartIndex = 0, int jtPageSize = 0, string jtSorting = null)
        {
            return Methods.CategoriesList(jtStartIndex, jtPageSize, jtSorting);
        }
         [WebMethod(EnableSession = true)]
         public static object CreateCate(Category record)
         {
             return Methods.CreateCate(record);
         }
         [WebMethod(EnableSession = true)]
         public static object UpdateCate(Category record)
         {
             return Methods.UpdateCate(record);
         }
         [WebMethod(EnableSession = true)]
         public static object DeleteCate(int CategoryID)
         {
             return Methods.DeleteCate(CategoryID);
         }

    }
}
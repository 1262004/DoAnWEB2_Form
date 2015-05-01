using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnASP_NETWEBFORM
{
    public class CurrentContext
    {
        public static bool IsLogged()
        {
            if ((int)HttpContext.Current.Session["IsLogin"] == 1)
            {
                return true;
            }

            if (HttpContext.Current.Request.Cookies["accID"] != null)
            {
                int accID = Convert.ToInt32(HttpContext.Current.Request.Cookies["accID"].Value);
                HttpContext.Current.Session["IsLogin"] = 1;

                using (DBEcommerceEntities db = new DBEcommerceEntities())
                {
                    Customer customer = db.Customers.Where(c => c.AccountID == accID).FirstOrDefault();
                    HttpContext.Current.Session["CurCus"] = customer;
                }
            }

            return false;
        }

        public static Customer getCustomer()
        {
            return (Customer)HttpContext.Current.Session["CurCus"];
        }

        public static void desTroy()
        {
            HttpContext.Current.Session["IsLogin"] = 0;
            HttpContext.Current.Session["CurCus"] = null;

            HttpContext.Current.Response.Cookies["accID"].Expires = DateTime.Now.AddDays(-1);
        }
    }
}
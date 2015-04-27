using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnASP_NETWEBFORM
{
    public class CurrentContext
    {
        public static bool IsLogged
        {
            get { return HttpContext.Current.Request.Cookies["User"] != null; }
        }

        public static string UserName
        {
            get { return HttpContext.Current.Request.Cookies["User"].Value; }
        }

        public static Account _Account
        {
            get { return HttpContext.Current.Session["User"] as Account; }
            set { HttpContext.Current.Session["User"] = value; }
        }
    }
}
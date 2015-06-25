using DoAnASP_NETWEBFORM.helpers;
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
                    int role = db.Accounts.SingleOrDefault(acc => acc.AccountID == accID).Role.RoleID;
                    if (role == 1)
                    {
                        HttpContext.Current.Session["CurAd"] = "Admin";
                    }
                    else if (role == 2)
                    {
                        Employee employ = db.Employees.Where(emp => emp.AccountID == accID).FirstOrDefault();
                        HttpContext.Current.Session["CurEmp"] = employ;
                    }
                    else
                    {
                        Customer customer = db.Customers.Where(c => c.AccountID == accID).FirstOrDefault();
                        HttpContext.Current.Session["CurCus"] = customer;
                    }
                }
                return true;
            }

            return false;
        }

        public static Customer getCustomer()
        {
            return (Customer)HttpContext.Current.Session["CurCus"];
        }

        public static Employee getEmployee()
        {
            return (Employee)HttpContext.Current.Session["CurEmp"];
        }

        public static string getAdmin()
        {
            return (string)HttpContext.Current.Session["CurAd"];
        }

        public static cCart getCart()
        {
            return (cCart)HttpContext.Current.Session["Cart"];
        }

        public static void desTroy()
        {
            HttpContext.Current.Session["IsLogin"] = 0;

            if (HttpContext.Current.Session["CurCus"] != null)
            {
                HttpContext.Current.Session["CurCus"] = null;
            }

            if (HttpContext.Current.Session["CurEmp"] != null)
            {
                HttpContext.Current.Session["CurEmp"] = null;
            }

            if (HttpContext.Current.Session["CurAd"] != null)
            {
                HttpContext.Current.Session["CurAd"] = null;
            }

            if (getCart() != null)
            {
                getCart().Items.Clear();
                HttpContext.Current.Session["Cart"] = null;
            }
                        
            HttpContext.Current.Response.Cookies["accID"].Expires = DateTime.Now.AddDays(-1);
        }
    }
}
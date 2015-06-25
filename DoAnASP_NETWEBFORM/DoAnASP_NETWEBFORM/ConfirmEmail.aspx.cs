using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM
{
    public partial class ConfirmEmail : System.Web.UI.Page
    {
        DBEcommerceEntities db = new DBEcommerceEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!CurrentContext.IsLogged())
            {
                if (Request.QueryString["email"] != null && Request.QueryString["pass"] != null)
                {
                    string email = Request.QueryString["email"];
                    string pass = Request.QueryString["pass"];

                    Account account = db.Accounts.SingleOrDefault(acc => acc.UserName.Equals(email));
                    if (account != null)
                    {
                        string pMD5 = helpers.StringUltils.MD5(pass);
                        account.PassWord = pMD5;

                        db.SaveChanges();
                    }
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }            
        }
    }
}
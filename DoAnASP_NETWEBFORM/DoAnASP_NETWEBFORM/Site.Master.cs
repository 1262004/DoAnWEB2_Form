using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged())
            {
                pnLogged.Visible = true;
                pnNotLogged.Visible = false;

                if (CurrentContext.getCustomer() != null)
                {
                    lnkUserName.Text = string.Format("<i class='fa fa-user'></i><b>{0}</b>", CurrentContext.getCustomer().FullName);
                }
                else if (CurrentContext.getEmployee() != null)
                {
                    lnkUserName.Text = string.Format("<i class='fa fa-user'></i><b>{0}</b>", CurrentContext.getEmployee().FullName);
                }
                else
                {
                    lnkUserName.Text = string.Format("<i class='fa fa-user'></i><b>{0}</b>", CurrentContext.getAdmin());
                }

                updateLinkCart();
            }
            else
            {
                pnLogged.Visible = false;
                pnNotLogged.Visible = true;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            CurrentContext.desTroy();
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        public void updateLinkCart()
        {
            lnkCart.Text = string.Format("<i class='fa fa-shopping-cart'></i>{0}", CurrentContext.getCart().getCountItems());
        }
    }
}
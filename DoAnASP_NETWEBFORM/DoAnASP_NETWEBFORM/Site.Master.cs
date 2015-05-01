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

                lnkUserName.Text = string.Format("<b>{0}</b>", CurrentContext.getCustomer().FullName);
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
    }
}
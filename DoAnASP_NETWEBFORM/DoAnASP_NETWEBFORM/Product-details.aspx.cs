using DoAnASP_NETWEBFORM.helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM
{
    public partial class Product_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string procID = Request.QueryString["procID"];
                if (string.IsNullOrEmpty(procID))
                {
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    int proID = Convert.ToInt32(procID);
                }
            }
        }

        protected void txtAddToCart_ServerClick(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged())
            {
                int proID = Convert.ToInt32(Request.QueryString["procID"]);

                cCartItem cartItem = new cCartItem()
                {
                    ProID = proID,
                    Quantity = Convert.ToInt32(txtQuantity.Value)
                };

                CurrentContext.getCart().Add(cartItem);

                ((Site)this.Master).updateLinkCart();
            }
            else
            {
                string url = "~/Login.aspx?retUrl=Product-details.aspx?procID=" + Request.QueryString["procID"];
                Response.Redirect(url);
            }
            
        }
    }
}
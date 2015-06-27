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
        DBEcommerceEntities db = new DBEcommerceEntities();

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

            if (!IsPostBack)
            {
                cbbChoose.DataSource = db.Suppliers.ToList();
                cbbChoose.DataTextField = "CompanyName";
                cbbChoose.DataValueField = "SupplierID";
                cbbChoose.DataBind();

                cbbChoose.Items.Insert(0, new ListItem("- -Nhà sản xuất- -", "0"));
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

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            string keyword = txtSearch.Text;            

            string check = "";
            if (cbAllWords.Checked)
            {
                check = "true";
            }
            else
            {
                check = "false";
            }

            int supID = int.Parse(cbbChoose.SelectedValue);

            if (supID > 0)
            {
                Response.Redirect("~/Search.aspx?key=" + keyword + "&AllWords=" + check + "&SupID=" + supID);
            }
            else
            {
                if (keyword.Length > 0)
                {
                    Response.Redirect("~/Search.aspx?key=" + keyword + "&AllWords=" + check + "&SupID=" + supID);
                }
            }
            
        }
    }
}
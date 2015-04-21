using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM
{
    public partial class Slider_Image : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                using(DBEcommerceEntities db = new DBEcommerceEntities())
                {
                    List<Slider> ds = db.Sliders.ToList();
                    this.lvSider.DataSource = ds;
                    this.lvSider.DataBind();
                    HtmlGenericControl a = (HtmlGenericControl)this.lvSider.Items[0].FindControl("divSlider");
                    a.Attributes.Add("class", "item active");
                }
            }
        }
    }
}
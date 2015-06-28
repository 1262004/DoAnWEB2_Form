using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM
{
    public partial class Sidebar : System.Web.UI.UserControl
    {
        DBEcommerceEntities db = new DBEcommerceEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ListViewParent.DataSource = db.Categories.Where(c => c.ParentId == 0 && c.CategoryID != 0 ).ToList();
                this.ListViewParent.DataBind();
                int count = 10;
                Random rnd = new Random();
                bool a = Convert.ToBoolean(rnd.Next(0, 1)) ? true : false;
                var sup = db.Suppliers.OrderBy(user => a ).Take(count).ToList();
                this.ListViewSup.DataSource = sup;
                this.ListViewSup.DataBind();
            }
            
        }
        public List<Category> GetData(object cate)
        {
            List<Category> ds = db.Categories.Where(c => c.ParentId == Convert.ToInt32(cate)).ToList();
            return ds;
        }

        protected void ListViewParent_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var database = e.Item.DataItem as Category;
                var companyListView = e.Item.FindControl("ListView1") as ListView;
                companyListView.DataSource = database.Categories1;
                companyListView.DataBind();
            }
        }
    }
}
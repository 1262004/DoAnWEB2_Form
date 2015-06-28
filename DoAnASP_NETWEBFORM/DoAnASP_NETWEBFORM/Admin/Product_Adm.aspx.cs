using log4net;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM.Admin
{
    public partial class Product_Adm : System.Web.UI.Page
    {
        private static readonly ILog logger = LogManager.GetLogger
      (System.Reflection.MethodBase.GetCurrentMethod().DeclaringType); // Cách 1 
        DBEcommerceEntities db = new DBEcommerceEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListItem item = new ListItem();
                item.Text = "USD";
                item.Value = "USD";
                this.cbxDonVi.Items.Add(item);
                this.cbxUnitE.Items.Add(item);
                item = new ListItem();
                item.Text = "a";
                item.Value = "a";
                this.cbxDonVi.Items.Add(item);
                this.cbxUnitE.Items.Add(item);

                this.cbxCate.DataSource = db.Categories.ToList();
                this.cbxCate.DataValueField = "CategoryID";
                this.cbxCate.DataTextField = "CategoryName";
                this.cbxCate.DataBind();

                this.cbxSupplier.DataSource = db.Suppliers.ToList();
                this.cbxSupplier.DataValueField = "SupplierID";
                this.cbxSupplier.DataTextField = "CompanyName";
                this.cbxSupplier.DataBind();

                // eddit
                this.cbxCateE.DataSource = db.Categories.ToList();
                this.cbxCateE.DataValueField = "CategoryID";
                this.cbxCateE.DataTextField = "CategoryName";
                this.cbxCateE.DataBind();

                this.cbxSupplierE.DataSource = db.Suppliers.ToList();
                this.cbxSupplierE.DataValueField = "SupplierID";
                this.cbxSupplierE.DataTextField = "CompanyName";
                this.cbxSupplierE.DataBind();
                LoadProduct();
                logger.Info("Load Product ");
            }
        }

        private void LoadProduct()
        {
            this.lvwProducts.DataSource = db.Products.Include("Category").ToList();
            this.lvwProducts.DataBind();
        }
        [WebMethod(EnableSession = true)]
        public static object GetCateOptions()
        {
            return Methods.GetCateOptions();
        } 
        [WebMethod(EnableSession = true)]
        public static object GetSuppOptions()
        {
            return Methods.GetSuppOptions();
        }
        // cate
         [WebMethod(EnableSession = true)]
        public static object ProductList_Cate(int CategoryID)
        {
            return Methods.ProductList_Cate(CategoryID);
        }

         protected void btnSave_Click(object sender, EventArgs e)
         {
             string proName = txtProductName.Text;
             decimal price = decimal.Parse(txtUnitPrice.Text);
             string dvt = cbxDonVi.SelectedValue;
             string image = fileUp.FileName;
             int slton = Int32.Parse(txtSoLuongTon.Text);
             DateTime date = DateTime.Parse(txtDate.Text);
             string mota = txtDetails.Text;
             int cateID = Convert.ToInt32(cbxCate.SelectedItem.Value);
             int suppID = Convert.ToInt32(cbxSupplier.SelectedItem.Value);
             Product p = new Product
             {
                 ProductName = proName,
                 UnitPrice = price,
                 Unit = dvt,
                 LinkImage = image,
                 Discount = slton,
                 DateReceived = date,
                 Details = mota,
                 CategoryID = cateID,
                 SupplierID = suppID
             };
             db.Products.Add(p);
             db.SaveChanges();
             if (fileUp.HasFile)
             {
                 string path = Server.MapPath("~/images/product");
                 string filename = Path.Combine(path, fileUp.FileName);
                 fileUp.SaveAs(filename);
             }
             logger.Info("Add Product " + p.ProductName);
             LoadProduct();
         }

         protected void btnCapNhat_Click(object sender, EventArgs e)
         {
             int proID = Convert.ToInt32(txtProductIDE.Text);
             Product p = db.Products.SingleOrDefault(q => q.ProductID == proID);
             p.ProductName = txtProductNameE.Text;
             p.UnitPrice = decimal.Parse(txtUnitPriceE.Text);
             p.NumViews = Int32.Parse(txtSoLuongTonE.Text);
             p.Unit = cbxUnitE.SelectedValue;
             if (fileUpE.FileName != null && fileUpE.FileName!="" && fileUpE.HasFile)
                 p.LinkImage = fileUpE.FileName;
             p.DateReceived = DateTime.Parse(txtDateE.Text);
             p.Details = txtDetailsE.Text;
             p.CategoryID = Convert.ToInt32(cbxCateE.SelectedItem.Value);
             p.SupplierID = Convert.ToInt32(cbxSupplierE.SelectedItem.Value);
             db.SaveChanges();
             if (fileUpE.HasFile)
             {
                 string path = Server.MapPath("~/images/product");
                 string filename = Path.Combine(path, fileUpE.FileName);
                 fileUpE.SaveAs(filename);
             }
             logger.Info("Update Product " + p.ProductName);
             LoadProduct();
         }

         protected void lvwProducts_ItemCommand(object sender, ListViewCommandEventArgs e)
         {
             if (e.CommandName == "EditPro")
             {
                 int id = Int32.Parse(e.CommandArgument.ToString());
                 Product p = db.Products.SingleOrDefault(q => q.ProductID == id);
                 txtProductIDE.Text = p.ProductID.ToString();
                 txtProductNameE.Text = p.ProductName;
                 txtSoLuongTonE.Text = p.NumViews.ToString();
                 txtUnitPriceE.Text = Convert.ToDouble(p.UnitPrice.Value).ToString();
                 txtDateE.Text = p.DateReceived.Value.ToString("MM/dd/yyyy");
                 txtDetailsE.Text = HttpUtility.HtmlDecode(p.Details);
                 cbxUnitE.SelectedValue = p.Unit;
                 cbxCateE.SelectedValue = p.CategoryID.Value.ToString();
                 cbxSupplierE.SelectedValue = p.SupplierID.Value.ToString();

                 string script = " $('#myEditModal').modal('show')";
                 // Check to see if the startup script is already registered.
                 if (ClientScript.IsStartupScriptRegistered("myEditModal")==false)
                 {
                     ClientScript.RegisterStartupScript(this.GetType(), "myEditModal", script, true);
                 }
             }
             else if (e.CommandName == "DelPro")
             {
                 int id = Int32.Parse(e.CommandArgument.ToString());
                 Product p = db.Products.SingleOrDefault(q => q.ProductID == id);
                 db.Products.Remove(p);
                 db.SaveChanges();
                 logger.Info("Detele Product " + p.ProductName);
                 LoadProduct();
             }
         }

         protected void lvwProducts_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
         {
             dp.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
             LoadProduct();
         }
    }
}
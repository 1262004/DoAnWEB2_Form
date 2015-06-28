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
        DBEcommerceEntities db = new DBEcommerceEntities();
        public List<string> list;

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

                    Product product = db.Products.SingleOrDefault(pro => pro.ProductID == proID);
                    product.NumViews += 1;
                    db.SaveChanges();

                    if (product != null)
                    {
                        imgProduct.Src = "images/product/" + product.LinkLargeImage;
                        lblProductName.Text = product.ProductName;

                        lblPrice.Text = string.Format("{0:N0} {1}", product.UnitPrice, product.Unit);
                        TimeSpan date = DateTime.Now - (DateTime)product.DateReceived;
                        if (date.TotalDays <= 14)
                        {
                            imgNew.Src = "images/product-details/new.jpg";
                        }
                        else
                        {
                            imgNew.Src = "";
                        }

                        if (product.NumInventory > 0)
                        {
                            lblNumInventory.Text = "Còn hàng";
                        }
                        else
                        {
                            lblNumInventory.Text = "Hết hàng";
                        }

                        lblSup.Text = product.Supplier.CompanyName;

                        if (!string.IsNullOrEmpty(product.Details))
                        {
                            list = new List<string>();
                            string[] details = product.Details.Split('_');
                            for (int i = 0; i < details.Length; i++)
                            {
                                list.Add(details[i].Split('~')[0]);
                                list.Add(details[i].Split('~')[1]);
                            }

                            lblHeader.Text = "Thông số kỹ thuật " + product.ProductName;
                        }
                        else
                        {
                            lblHeader.Text = "Chưa có thông số kỹ thuật về " + product.ProductName;
                        }

                        string curUrl = HttpContext.Current.Request.Url.AbsoluteUri;
                        string title = product.ProductName;

                        aFbShare.HRef = "https://www.facebook.com/sharer/sharer.php?u=" + curUrl +"&t=" + title ;
                        aTwitterShare.HRef = "https://twitter.com/intent/tweet?url=" + curUrl + " &text=" + title;
                        aGPlusShare.HRef = "https://plus.google.com/share?url=" + curUrl;
                    }

                    Random random = new Random();

                    List<Product> listProductLike = db.Products
                        .Where(pro => pro.Supplier.SupplierID == product.Supplier.SupplierID)
                        .OrderByDescending(o => o.NumViews)
                        .ToList();

                    if (listProductLike.Count >= 3)
                    {
                        lvProducts1.DataSource = listProductLike.Take(3).ToList();
                        lvProducts1.DataBind();

                        if (listProductLike.Count >= 6)
                        {
                            lvProducts2.DataSource = listProductLike.Skip(listProductLike.Count - 3).Take(3).ToList();
                            lvProducts2.DataBind();
                        }
                        else
                        {
                            lvProducts2.DataSource = listProductLike.Skip(listProductLike.Count - 3).Take(listProductLike.Count - 3).ToList();
                            lvProducts2.DataBind();
                        }
                    }
                    else
                    {
                        lvProducts1.DataSource = listProductLike.ToList();
                        lvProducts1.DataBind();
                    }
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
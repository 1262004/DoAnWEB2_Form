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
                        
                    }

                    Random random = new Random();

                    List<Product> listProductLike = db.Products
                        .Where(pro => pro.Supplier.SupplierID == product.Supplier.SupplierID)
                        .ToList();
                    List<Product> product1 = new List<Product>();

                    for (int i = 0; i < listProductLike.Count - 1; i++)
                    {
                        int index = random.Next(listProductLike.Count - 1);

                        while (product1.Contains(listProductLike[index]) ||
                            product1.Contains(product))
                        {
                            index = random.Next(listProductLike.Count - 1);
                        }
                        product1.Add(listProductLike[index]);

                        if (i == 5)
                        {
                            break;
                        }
                    }

                    if (product1.Count >= 3)
                    {
                        lvProducts1.DataSource = product1.Take(3).ToList();
                        lvProducts1.DataBind();

                        lvProducts2.DataSource = product1.Skip(3).Take(product1.Count - 3).ToList();
                        lvProducts2.DataBind();
                    }
                    else
                    {
                        lvProducts1.DataSource = product1.ToList();
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
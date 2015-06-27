using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM
{
    public partial class Search : System.Web.UI.Page
    {
        DBEcommerceEntities db = new DBEcommerceEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                if (Request.QueryString["key"] != null
                    && Request.QueryString["AllWords"] != null
                    && Request.QueryString["SupID"] != null)
                {
                    string keyword = Request.QueryString["key"];
                    string check = Request.QueryString["AllWords"];
                    int supID = Convert.ToInt32(Request.QueryString["SupID"]);
                    loadProducts(keyword, check, supID);
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }

            }
        }

        private int wordCount(string pharse, string word)
        {
            if (string.IsNullOrEmpty(word) || string.IsNullOrEmpty(pharse))
            {
                return 0;
            }

            word = word.ToLower();
            pharse = pharse.ToLower();

            string BiggerWord = word + "x";
            string BiggerPhrase = pharse.Replace(word, BiggerWord);

            int count = BiggerPhrase.Length - pharse.Length;
            return count;
        }

        private Dictionary<int, int> rank(string keyword, List<Product> list, string ch)
        {
            Dictionary<int, int> listRank = new Dictionary<int, int>();
            foreach (var p in list)
            {
                int rank = 0;
                char[] wordSeparators = new char[] { ',', ';', '.', '!', '?', '-', ' ' };
                string[] words = keyword.Split(wordSeparators, StringSplitOptions.RemoveEmptyEntries);
                int index = 1;
                int howManyWords = 5;
                if (ch == "false")
                {
                    for (int i = 0; i <= words.GetUpperBound(0) && index <= howManyWords; i++)
                    {
                        if (words[i].Length > 2)
                        {
                            rank += (3 * wordCount(p.ProductName, words[i])) + wordCount(p.Details, words[i]);
                            index++;
                        }
                    }
                }
                else
                {
                    for (int i = 0; index <= howManyWords; i++)
                    {
                        if (i >= words.Length)
                        {
                            rank += 0;
                        }
                        else
                        {
                            if (words[i].Length > 2)
                            {
                                if (i == 0)
                                {
                                    rank = (3 * wordCount(p.ProductName, words[i])) + wordCount(p.Details, words[i]);
                                }
                                else
                                {
                                    rank *= (3 * wordCount(p.ProductName, words[i])) + wordCount(p.Details, words[i]);
                                }

                            }
                        }

                        index++;
                    }
                }

                listRank.Add(p.ProductID, rank);
            }

            return listRank;
        }

        void loadProducts(string keyword, string ch, int sID)
        {
            if (!string.IsNullOrEmpty(keyword))
            {
                var listRank = rank(keyword, db.Products.ToList(), ch)
                                            .OrderByDescending(r => r.Value).ToList();

                List<Product> listProductRanking = new List<Product>();
                foreach (var item in listRank)
                {
                    if (item.Value > 0)
                    {
                        Product productRanking = db.Products.SingleOrDefault(pro => pro.ProductID == item.Key);
                        listProductRanking.Add(productRanking);
                    }
                }
                if (sID == 0)
                {
                    if (listProductRanking.Count > 0)
                    {
                        lvProducts.DataSource = listProductRanking;
                        lvProducts.DataBind();

                        lblResult.Text = "Có " + listProductRanking.Count() + " sản phẩm theo từ khóa '" + keyword + "'";
                    }
                    else
                    {
                        lblResult.Text = "Không tìm thấy sản phẩm với từ khóa '" + keyword + "'";
                    }
                }
                else
                {
                    List<Product> listProSup = listProductRanking.Where(pro => pro.Supplier.SupplierID == sID).ToList();
                    if (listProSup.Count > 0)
                    {
                        lvProducts.DataSource = listProSup;
                        lvProducts.DataBind();

                        lblResult.Text = "Có " + listProSup.Count() + " sản phẩm theo từ khóa '" + keyword + "'";
                    }
                    else
                    {
                        lblResult.Text = "Không tìm thấy sản phẩm với từ khóa '" + keyword + "'";
                    }
                }
            }
            else
            {
                List<Product> listProSup = db.Products.Where(pro => pro.Supplier.SupplierID == sID).ToList();
                if (listProSup.Count > 0)
                {
                    lvProducts.DataSource = listProSup;
                    lvProducts.DataBind();

                    lblResult.Text = "Có " + listProSup.Count() + " sản phẩm với nhà sản xuất '" + db.Suppliers.SingleOrDefault(sup => sup.SupplierID == sID).CompanyName + "'";
                }
                else
                {
                    lblResult.Text = "Không tìm thấy sản phẩm với nhà sản xuất '" + db.Suppliers.SingleOrDefault(sup => sup.SupplierID == sID).CompanyName + "'";
                }
            }
        }

        protected void lvProducts_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            string keyword = Request.QueryString["key"];
            string check = Request.QueryString["AllWords"];
            int supID = Convert.ToInt32(Request.QueryString["SupID"]);

            dp.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            loadProducts(keyword, check, supID);
        }
    }
}
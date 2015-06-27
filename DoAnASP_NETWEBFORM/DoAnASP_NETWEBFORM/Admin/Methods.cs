using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnASP_NETWEBFORM.Admin
{
    public static class Methods
    {
        // Categories
        #region "Category"
        public static object CategoriesList()
        {
            try
            {
                var db = new DBEcommerceEntities();
                List<Category> cateList = new List<Category>();
                foreach (Category cate in db.Categories.ToList())
                {
                    Category c = new Category() { CategoryID = cate.CategoryID, CategoryName = cate.CategoryName,Description=cate.Description, Products = null, ParentId = cate.ParentId };
                    cateList.Add(c);
                }  
                return new { Result = "OK", Records = cateList };
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static object CreateCate(Category record)
        {
            try
            {
                var db = new DBEcommerceEntities();
                var addCate =  db.Categories.Add(record);
                db.SaveChanges();
                return new { Result = "OK", Record = addCate };
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static object UpdateCate(Category record)
        {
            try
            {
                var db = new DBEcommerceEntities();
                var cate = db.Categories.SingleOrDefault(c => c.CategoryID == record.CategoryID);
                cate.CategoryName = record.CategoryName;
                cate.Description = record.Description;
                db.SaveChanges();
                return new { Result = "OK" };
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }

        public static object DeleteCate(int CategoryID)
        {
            try
            {
                var db = new DBEcommerceEntities();
                var cate = db.Categories.SingleOrDefault(c => c.CategoryID == CategoryID);
                if (cate != null)
                {
                    db.Categories.Remove(cate);
                    db.SaveChanges();
                }
                return new { Result = "OK" };
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
    #endregion "Category"

        //Product
        #region "Product"
        public static object ProductList(int startIndex , int count, string sorting )
        {
            try
            {
                var db = new DBEcommerceEntities();
                List<Product> query = new List<Product>();
                foreach (Product proc in db.Products.ToList())
                {
                    Product p = new Product() { ProductID = proc.ProductID, ProductName = proc.ProductName,
                        UnitPrice = proc.UnitPrice, Unit = proc.Unit,LinkImage=proc.LinkImage
                        , Discount = proc.Discount ,NumViews = proc.NumViews,DateReceived=proc.DateReceived
                    ,SupplierID = proc.SupplierID,CategoryID=proc.CategoryID,Details=proc.Details,NumInventory=proc.NumInventory};
                    query.Add(p);
                }
                //Sorting
                //This ugly code is used just for demonstration.
                //Normally, Incoming sorting text can be directly appended to an SQL query.
                if (string.IsNullOrEmpty(sorting) || sorting.Equals("DateReceived ASC"))
                {
                    query = query.OrderBy(p => p.DateReceived).ToList();
                }
                //else if (sorting.Equals("Name DESC"))
                //{
                //    query = query.OrderByDescending(p => p.Name);
                //}
                //else if (sorting.Equals("Gender ASC"))
                //{
                //    query = query.OrderBy(p => p.Gender);
                //}
                //else if (sorting.Equals("Gender DESC"))
                //{
                //    query = query.OrderByDescending(p => p.Gender);
                //}
                //else if (sorting.Equals("CityId ASC"))
                //{
                //    query = query.OrderBy(p => p.CityId);
                //}
                //else if (sorting.Equals("CityId DESC"))
                //{
                //    query = query.OrderByDescending(p => p.CityId);
                //}
                //else if (sorting.Equals("BirthDate ASC"))
                //{
                //    query = query.OrderBy(p => p.BirthDate);
                //}
                //else if (sorting.Equals("BirthDate DESC"))
                //{
                //    query = query.OrderByDescending(p => p.BirthDate);
                //}
                //else if (sorting.Equals("IsActive ASC"))
                //{
                //    query = query.OrderBy(p => p.IsActive);
                //}
                //else if (sorting.Equals("IsActive DESC"))
                //{
                //    query = query.OrderByDescending(p => p.IsActive);
                //}
                else
                {
                    query = query.OrderBy(p => p.DateReceived).ToList(); //Default!
                }
                int proCount = db.Products.Count();
                List<Product> ds = count > 0
                           ? query.Skip(startIndex).Take(count).ToList() //Paging
                           : query.ToList(); //No paging
                return new { Result = "OK", Records = ds, TotalRecordCount = proCount };
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static object CreateProduct(Product record)
        {
            try
            {
                var db = new DBEcommerceEntities();
                var addProc = db.Products.Add(record);
                db.SaveChanges();
                return new { Result = "OK", Record = addProc };
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static object UpdateProduct(Product record,bool flag)
        {
            try
            {
                var db = new DBEcommerceEntities();
                var p = db.Products.SingleOrDefault(c => c.ProductID == record.ProductID);
                p.ProductName = record.ProductName;
                p.UnitPrice = record.UnitPrice;
                p.Unit = record.Unit;
                if(flag==true)
                    p.LinkImage = record.LinkImage;
                p.Discount = record.Discount;
                p.NumViews = record.NumViews;
                p.DateReceived = record.DateReceived;
                p.SupplierID = record.SupplierID;
                p.CategoryID = record.CategoryID;
                p.Details = record.Details;
                p.NumInventory = record.NumInventory;
                db.SaveChanges();
                return new { Result = "OK" };
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }

        public static object DeleteProduct(int ProductID)
        {
            try
            {
                var db = new DBEcommerceEntities();
                var p = db.Products.SingleOrDefault(c => c.ProductID == ProductID);
                if (p != null)
                {
                    db.Products.Remove(p);
                    db.SaveChanges();
                }
                return new { Result = "OK" };
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static object GetCateOptions()
        {
            try
            {
                var db = new DBEcommerceEntities();
                List<Category> list = db.Categories.ToList();
                var cates = list.Select(c => new { DisplayText = c.CategoryName, Value = c.CategoryID });
                return new { Result = "OK", Options = cates };
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static object GetSuppOptions()
        {
            try
            {
                var db = new DBEcommerceEntities();
                List<Supplier> list = db.Suppliers.ToList();
                var supps = list.Select(c => new { DisplayText = c.CompanyName, Value = c.SupplierID });
                return new { Result = "OK", Options = supps };
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }

        #endregion "Product"


        public static object ProductList_Cate(int CategoryID)
        {
            try
            {
                var db = new DBEcommerceEntities();
                List<Product> query = new List<Product>();
                foreach (Product proc in db.Products.Where(p=>p.CategoryID==CategoryID).ToList())
                {
                    Product p = new Product()
                    {
                        ProductID = proc.ProductID,
                        ProductName = proc.ProductName,
                        UnitPrice = proc.UnitPrice,
                        Unit = proc.Unit,
                        LinkImage = proc.LinkImage
                        ,
                        Discount = proc.Discount,
                        NumViews = proc.NumViews,
                        DateReceived = proc.DateReceived
                        ,
                        SupplierID = proc.SupplierID,
                        CategoryID = proc.CategoryID,
                        Details = proc.Details,
                        NumInventory = proc.NumInventory
                    };
                    query.Add(p);
                }
                return new { Result = "OK", Records = query};
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
    }
}
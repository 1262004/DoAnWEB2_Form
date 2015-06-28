using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnASP_NETWEBFORM.Admin
{
    public static class Methods
    {
        private static readonly ILog logger = LogManager.GetLogger
         (System.Reflection.MethodBase.GetCurrentMethod().DeclaringType); // Cách 1 
        // Categories
        #region "Category"
        public static object CategoriesList(int jtStartIndex = 0, int jtPageSize = 0, string jtSorting = null)
        {
            try
            {
                var db = new DBEcommerceEntities();
                List<Category> cateList = new List<Category>();
                foreach (Category cate in db.Categories.Where(c=>c.CategoryID!=0).OrderBy(m => m.CategoryID).Skip(jtStartIndex).Take(jtPageSize).ToList())
                {
                    Category c = new Category() { CategoryID = cate.CategoryID, CategoryName = cate.CategoryName, Description = cate.Description, Products = null, ParentId = cate.ParentId };
                    cateList.Add(c);
                }
                return new { Result = "OK", Records = cateList };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static object CreateCate(Category record)
        {
            try
            {
                var db = new DBEcommerceEntities();
                var addCate = db.Categories.Add(record);
                db.SaveChanges();
                return new { Result = "OK", Record = addCate };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
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
                cate.ParentId = record.ParentId;
                db.SaveChanges();
                return new { Result = "OK" };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
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
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        #endregion "Category"

        //Product
        #region "Product"
     
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
        public static object UpdateProduct(Product record, bool flag)
        {
            try
            {
                var db = new DBEcommerceEntities();
                var p = db.Products.SingleOrDefault(c => c.ProductID == record.ProductID);
                p.ProductName = record.ProductName;
                p.UnitPrice = record.UnitPrice;
                p.Unit = record.Unit;
                if (flag == true)
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
                foreach (Product proc in db.Products.Where(p => p.CategoryID == CategoryID).ToList())
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
                return new { Result = "OK", Records = query };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
               
            }
        }
        #region "Account"
        public static object AccountList(int startIndex, int count, string sorting)
        {
            try
            {
                var db = new DBEcommerceEntities();
                List<Account> accountList = new List<Account>();
                foreach (Account cate in db.Accounts.Where(c => c.Enabled == true).OrderBy(m => m.AccountID).Skip(startIndex).Take(count).ToList())
                {
                    Account c = new Account { AccountID = cate.AccountID, UserName = cate.UserName, PassWord = cate.PassWord, RoleID = cate.RoleID, Enabled = cate.Enabled };
                    accountList.Add(c);
                }
                return new { Result = "OK", Records = accountList };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static object CreateAccount(Account record)
        {
            try
            {
                var db = new DBEcommerceEntities();
                record.PassWord = helpers.StringUltils.MD5(record.PassWord);
                var addCate = db.Accounts.Add(record);
                db.SaveChanges();
                return new { Result = "OK", Record = addCate };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static object UpdateAccount(Account record)
        {
            try
            {
                var db = new DBEcommerceEntities();
                var cate = db.Accounts.SingleOrDefault(c => c.AccountID == record.AccountID);
                cate.UserName = record.UserName;
                cate.PassWord = helpers.StringUltils.MD5(record.PassWord);
                cate.RoleID = record.RoleID;
                cate.Enabled = record.Enabled;
                db.SaveChanges();
                return new { Result = "OK" };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static object DeleteAccount(int AccountID)
        {

            try
            {
                var db = new DBEcommerceEntities();
                var cate = db.Accounts.SingleOrDefault(c => c.AccountID == AccountID);
                
                if (cate != null)
                {
                    db.Accounts.Remove(cate);
                    db.SaveChanges();
                }
                return new { Result = "OK" };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static object GetRoleOptions()
        {
            try
            {
                var db = new DBEcommerceEntities();
                List<Role> list = db.Roles.ToList();
                var supps = list.Select(c => new { DisplayText = c.RoleName, Value = c.RoleID });
                return new { Result = "OK", Options = supps };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        #endregion "Account"


        #region "Order"
        public static object OrderList(int jtStartIndex = 0, int jtPageSize = 0, string jtSorting = null)
        {
            try
            {
                var db = new DBEcommerceEntities();
                List<Order> cateList = new List<Order>();
                foreach (Order cate in db.Orders.OrderBy(m => m.OrderID).Skip(jtStartIndex).Take(jtPageSize).ToList())
                {
                    Order c = new Order() { OrderID = cate.OrderID, CustomerID = cate.CustomerID, EmployeeID = cate.EmployeeID, DateBuy = cate.DateBuy, Status = cate.Status, Payments = cate.Payments };
                    cateList.Add(c);
                }
                return new { Result = "OK", Records = cateList };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static object CreateOrder(Order record)
        {
            try
            {
                var db = new DBEcommerceEntities();
                var addCate = db.Orders.Add(record);
                db.SaveChanges();
                return new { Result = "OK", Record = addCate };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static object UpdateOrder(Order record)
        {
            try
            {
                var db = new DBEcommerceEntities();
                var cate = db.Orders.SingleOrDefault(c => c.OrderID == record.OrderID);
                cate.CustomerID = record.CustomerID;
                cate.EmployeeID = record.EmployeeID;
                cate.DateBuy = record.DateBuy;
                cate.Status = record.Status;
                cate.Payments = record.Payments;
                db.SaveChanges();
                return new { Result = "OK" };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }

        public static object DeleteOrder(int OrderID)
        {
            try
            {
                var db = new DBEcommerceEntities();
                var cate = db.Orders.SingleOrDefault(c => c.OrderID == OrderID);
                if (cate != null)
                {
                    db.Orders.Remove(cate);
                    db.SaveChanges();
                }
                return new { Result = "OK" };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }

        // details
        public static object DetailList_Order(int OrderID)
        {
            try
            {
                var db = new DBEcommerceEntities();
                List<OrderDetail> query = new List<OrderDetail>();
                foreach (OrderDetail proc in db.OrderDetails.Where(p => p.OrderID == OrderID).ToList())
                {
                    OrderDetail p = new OrderDetail()
                    {
                        OrderID = OrderID,
                        ProductID = proc.ProductID,
                        Quantity = proc.Quantity,
                        UnitPrice = proc.UnitPrice,
                        TotalMoney = proc.TotalMoney
                    };
                    query.Add(p);
                }
                return new { Result = "OK", Records = query };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }

        public static object CreateDetail(OrderDetail record)
        {
            try
            {
                var db = new DBEcommerceEntities();
                var addCate = db.OrderDetails.Add(record);
                db.SaveChanges();
                return new { Result = "OK", Record = addCate };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static object UpdateDetail(OrderDetail record)
        {
            try
            {
                var db = new DBEcommerceEntities();
                var cate = db.OrderDetails.SingleOrDefault(c => c.OrderID == record.OrderID && c.ProductID == record.ProductID);
                cate.Quantity = record.Quantity;
                cate.TotalMoney = record.TotalMoney;

                db.SaveChanges();
                return new { Result = "OK" };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }

        public static object DeleteDetail(int OrderID, int ProductID)
        {
            try
            {
                var db = new DBEcommerceEntities();
                var cate = db.OrderDetails.SingleOrDefault(c => c.OrderID == OrderID && c.ProductID == ProductID);
                if (cate != null)
                {
                    db.OrderDetails.Remove(cate);
                    db.SaveChanges();
                }
                return new { Result = "OK" };
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }

        //option
        public static object GetCustomerOptions()
        {
            try
            {
                var db = new DBEcommerceEntities();
                List<Customer> list = db.Customers.ToList();
                var supps = list.Select(c => new { DisplayText = c.FullName, Value = c.CustomerID });
                return new { Result = "OK", Options = supps };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static object GetProductOptions()
        {
            try
            {
                var db = new DBEcommerceEntities();
                List<Product> list = db.Products.ToList();
                var supps = list.Select(c => new { DisplayText = c.ProductName, Value = c.ProductID });
                return new { Result = "OK", Options = supps };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        //option
        public static object GetEmployeeOptions()
        {
            try
            {
                var db = new DBEcommerceEntities();
                List<Employee> list = db.Employees.ToList();
                var supps = list.Select(c => new { DisplayText = c.FullName, Value = c.EmployeeID });
                return new { Result = "OK", Options = supps };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }

        #endregion

        #region "Thống Kê"
        public static List<ChartDetail> ThongKeTheoTungThang(int nam)
        {
            List<ChartDetail> ds = new List<ChartDetail>();
            using (var db = new DBEcommerceEntities())
            {
                ds = db.Orders.Where(o => o.DateBuy.Value.Year == nam && o.Status == 2).GroupBy(m => m.DateBuy.Value.Month).Select(m => new ChartDetail { Thang = m.Key, DoanhThu = m.Sum(p => p.TotalMoney).Value }).ToList();
            }
            return ds;
        }
        public static object ThongKeTheoTungThangList(int nam)
        {
            try
            {
                List<ChartDetail> query = ThongKeTheoTungThang(nam);
                logger.Info("Thống Kê theo từng tháng");
                return new { Result = "OK", Records = query };
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static List<ChartDetail> ThongKeTheoTungNam()
        {
            List<ChartDetail> ds = new List<ChartDetail>();
            using (var db = new DBEcommerceEntities())
            {
                ds = db.Orders.Where(o => o.Status == 2).GroupBy(m => m.DateBuy.Value.Year).Select(m => new ChartDetail { Nam = m.Key, DoanhThu = m.Sum(p => p.TotalMoney).Value }).ToList();
            }
            return ds;
        }
        public static object ThongKeTheoTungNamList()
        {
            try
            {
                List<ChartDetail> query = ThongKeTheoTungNam();
                logger.Info("Thống Kê theo từng năm");
                return new { Result = "OK", Records = query };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        public static List<ChartDetail> ThongKeTheoTungQuy(int nam)
        {
            List<ChartDetail> ds = new List<ChartDetail>();
            using (var db = new DBEcommerceEntities())
            {
                double? q1 = db.Orders.Where(o => o.DateBuy.Value.Year == nam && o.DateBuy.Value.Month >= 1 && o.DateBuy.Value.Month <= 3).Sum(m => m.TotalMoney);
                if (q1 == null)
                    q1 = 0;
                double? q2 = db.Orders.Where(o => o.DateBuy.Value.Year == nam && o.DateBuy.Value.Month >= 4 && o.DateBuy.Value.Month <= 6).Sum(m => m.TotalMoney);
                if (q2 == null)
                    q2 = 0;
                double? q3 = db.Orders.Where(o => o.DateBuy.Value.Year == nam && o.DateBuy.Value.Month >= 7 && o.DateBuy.Value.Month <= 9).Sum(m => m.TotalMoney);
                if (q3 == null)
                    q3 = 0;
                double? q4 = db.Orders.Where(o => o.DateBuy.Value.Year == nam && o.DateBuy.Value.Month >= 10 && o.DateBuy.Value.Month <= 12).Sum(m => m.TotalMoney);
                if (q4 == null)
                    q4 = 0;
                ds = new List<ChartDetail> { new ChartDetail { Quy = 1, DoanhThu = q1.Value }, new ChartDetail { Quy = 2, DoanhThu = q2.Value }, new ChartDetail { Quy = 3, DoanhThu = q3.Value }, new ChartDetail { Quy = 4, DoanhThu = q4.Value } };
            }
            return ds;
        }
        public static object ThongKeTheoTungQuyList(int nam)
        {
            try
            {
                List<ChartDetail> query = ThongKeTheoTungQuy(nam);
                logger.Info("Thống Kê theo từng quý");
                return new { Result = "OK", Records = query };
            }
            catch (Exception ex)
            {
                logger.Error(ex);
                return new { Result = "ERROR", Message = ex.Message };
            }
        }
        #endregion
    }
}
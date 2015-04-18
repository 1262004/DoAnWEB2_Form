//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DoAnASP_NETWEBFORM
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        public Product()
        {
            this.Comments = new HashSet<Comment>();
            this.OrderDetails = new HashSet<OrderDetail>();
        }
    
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public Nullable<decimal> UnitPrice { get; set; }
        public string Unit { get; set; }
        public string LinkImage { get; set; }
        public Nullable<double> Discount { get; set; }
        public Nullable<int> NumViews { get; set; }
        public Nullable<System.DateTime> DateReceived { get; set; }
        public Nullable<int> SupplierID { get; set; }
        public Nullable<int> CategoryID { get; set; }
        public Nullable<int> Status { get; set; }
        public string Details { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual Supplier Supplier { get; set; }
    }
}
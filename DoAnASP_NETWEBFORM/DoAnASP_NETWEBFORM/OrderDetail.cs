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
    
    public partial class OrderDetail
    {
        public int OrderID { get; set; }
        public int ProductID { get; set; }
        public Nullable<decimal> UnitPrice { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<decimal> TotalMoney { get; set; }
    
        public virtual Order Order { get; set; }
        public virtual Product Product { get; set; }
    }
}

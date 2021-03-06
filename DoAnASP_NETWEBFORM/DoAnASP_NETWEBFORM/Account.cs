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
    
    public partial class Account
    {
        public Account()
        {
            this.Customers = new HashSet<Customer>();
            this.Employees = new HashSet<Employee>();
        }
    
        public int AccountID { get; set; }
        public string UserName { get; set; }
        public string PassWord { get; set; }
        public Nullable<int> RoleID { get; set; }
        public Nullable<bool> Enabled { get; set; }
    
        public virtual Role Role { get; set; }
        public virtual ICollection<Customer> Customers { get; set; }
        public virtual ICollection<Employee> Employees { get; set; }
    }
}

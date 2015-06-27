using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM.Admin
{
    public partial class UserAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession = true)]
        public static object AccountList(int jtStartIndex = 0, int jtPageSize = 0, string jtSorting = null)
        {
            return Methods.AccountList(jtStartIndex, jtPageSize, jtSorting);
        }
        [WebMethod(EnableSession = true)]
        public static object CreateAccount(Account record)
        {
            return Methods.CreateAccount(record);
        }
        [WebMethod(EnableSession = true)]
        public static object UpdateAccount(Account record)
        {
            return Methods.UpdateAccount(record);
        }
        [WebMethod(EnableSession = true)]
        public static object DeleteAccount(int AccountID)
        {
            return Methods.DeleteAccount(AccountID);
        }
        [WebMethod(EnableSession = true)]
        public static object GetRoleOptions()
        {
            return Methods.GetRoleOptions();
        }
    }
}
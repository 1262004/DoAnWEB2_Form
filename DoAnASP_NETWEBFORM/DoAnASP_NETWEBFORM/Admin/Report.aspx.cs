using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM.Admin
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        [WebMethod(EnableSession = true)]
        public static object ThongKeTheoTungNamList()
        {
            return Methods.ThongKeTheoTungNamList();
        }
        [WebMethod(EnableSession = true)]
        public static List<ChartDetail> ThongKeTheoTungNam()
        {
            return Methods.ThongKeTheoTungNam();
        }

        [WebMethod(EnableSession = true)]
        public static List<ChartDetail> ThongKeTheoTungThang()
        {
            return Methods.ThongKeTheoTungThang(DateTime.Now.Year);
        }
        [WebMethod(EnableSession = true)]
        public static List<ChartDetail> ThongKeTheoTungQuy()
        {
            return Methods.ThongKeTheoTungQuy(DateTime.Now.Year);
        }



        [WebMethod(EnableSession = true)]
        public static object ThongKeTheoTungQuyList()
        {
            return Methods.ThongKeTheoTungQuyList(DateTime.Now.Year);
        }


        [WebMethod(EnableSession = true)]
        public static object ThongKeTheoTungThangList()
        {
            return Methods.ThongKeTheoTungThangList(DateTime.Now.Year);
        }
    }
}
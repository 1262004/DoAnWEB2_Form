using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM
{
    public partial class Contact_us : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                var fromAddress = new MailAddress("ecom0104@gmail.com", "Ecom1262001_1262004");
                var toAddress = new MailAddress("an12ck2@gmail.com", "To Name");
                string fromPassword = "12620011262004";
                //string subject = ((TextBox)FindControl("subject")).Text;
                string body = "Tên: " + Request.Form["name"] + "\n";
                body += "Email: " + Request.Form["email"] + "\n";
                body += "Nội dung: " + Request.Form["message"];

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                };
                using (var message = new MailMessage(fromAddress, toAddress)
                {
                   // Subject = subject,
                    Body = body
                })
                {
                    try
                    {
                        smtp.Send(message);

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "sweet", "sweetAlert('Success', 'Đã gửi!', 'success');", true);
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "sweet", "sweetAlert('Fail', 'Có lỗi xảy ra trong quá trình gửi email! Vui lòng gửi lại!', 'error');", true);
                    }
                }
            }
        }
    }
}
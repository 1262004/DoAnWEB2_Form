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
    public partial class RecoPass : System.Web.UI.Page
    {
        DBEcommerceEntities db = new DBEcommerceEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentContext.IsLogged())
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var fromAddress = new MailAddress("ecom0104@gmail.com", "Ecom1262001_1262004");
                var toAddress = new MailAddress(txtEmail.Text, "To Name");
                string fromPassword = "12620011262004";
                string subject = "Thay Đổi Mật Khẩu";
                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                Random random = new Random();
                string pass = new string(Enumerable.Repeat(chars, 8)
                    .Select(s => s[random.Next(s.Length)])
                    .ToArray());
                string lnkPage = "http://" + HttpContext.Current.Request.Url.Authority + "/ConfirmEmail.aspx?email=" + txtEmail.Text + "&pass=" + pass;
                string body = "Mật khẩu mới: " + pass + "\nNếu bạn là người yêu cầu thay đổi, click vào link này để xác nhận: " + lnkPage;

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
                    Subject = subject,
                    Body = body
                })
                {
                    try
                    {
                        smtp.Send(message);

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "sweet", "sweetAlert('Success', 'Vui lòng kiểm tra email của bạn!', 'success');", true);
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "sweet", "sweetAlert('Fail', 'Có lỗi xảy ra trong quá trình gửi email! Vui lòng gửi lại!', 'error');", true);
                    }
                }
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(txtEmail.Text);
                args.IsValid = true;
            }
            catch
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(txtEmail.Text);
                Account account = db.Accounts.SingleOrDefault(acc => acc.UserName.Equals(txtEmail.Text));
                if (account != null)
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }

            }
            catch
            {
            }
        }
    }
}
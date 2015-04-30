using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                if (Request.UrlReferrer != null)
                {
                    ViewState["RefUrl"] = Request.UrlReferrer.ToString();
                }

                if (CurrentContext.IsLogged)
                {
                    string userName = CurrentContext.UserName;
                    lblMessLog.Text = userName; //
                }         
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (DBEcommerceEntities db = new DBEcommerceEntities())
            {
                var checkAccExist = db.Accounts.Where(acc => acc.UserName == txtEmailLog.Text).FirstOrDefault();
                if (checkAccExist != null)
                {
                    var account = db.Accounts.Where(acc => acc.UserName == txtEmailLog.Text
                                                && acc.PassWord == txtPasswordLog.Text).FirstOrDefault();
                    if (account != null)
                    {
                        var checkEnable = db.Accounts.Where(acc => acc.UserName == txtEmailLog.Text
                                                && acc.PassWord == txtPasswordLog.Text
                                                && acc.Enabled == 1).FirstOrDefault();
                        if (checkEnable != null)
                        {
                            var customer = db.Customers.Where(cus => cus.AccountID == account.AccountID).FirstOrDefault();
                            HttpCookie cookie = new HttpCookie("User");                            

                            if (customer != null)
                            {
                                lblMessLog.Text = "Hello " + customer.FullName;                               
                                
                                cookie.Value = customer.FullName; //cookie
                            }
                            else
                            {
                                lblMessLog.Text = "Hello" + account.UserName;
                                cookie.Value = account.UserName; //cookie
                            }

                            if (cbKeep.Checked)
                            {
                                cookie.Expires = DateTime.Now.AddDays(7);
                                Response.Cookies.Add(cookie);
                            }

                            Session["User"] = account.UserName;
                        }
                        else
                        {
                            lblMessLog.Text = "Tài khoản đã bị khóa";
                        }
                    }
                    else
                    {
                        lblMessLog.Text = "Mật khẩu không đúng";
                    }
                }
                else
                {
                    lblMessLog.Text = "Tên tài khoản không tồn tại";
                }
            }
        }


        protected void btnSignup_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (DBEcommerceEntities db = new DBEcommerceEntities())
                {
                    Account account = new Account
                    {
                        UserName = txtEmailSu.Text,
                        PassWord = txtPasswordSu.Text,
                        RoleID = 3,
                        Enabled = 1
                    };

                    String gioiTinh = "";
                    if (int.Parse(cbbSex.SelectedValue) == 1)
                    {
                        gioiTinh = "Nam";
                    }
                    if (int.Parse(cbbSex.SelectedValue) == 2)
                    {
                        gioiTinh = "Nữ";
                    }

                    Customer customer = new Customer
                    {
                        FullName = txtNameSu.Text,
                        AccountID = account.AccountID,
                        Email = txtEmailSu.Text,
                        BirthDay = DateTime.ParseExact(txtBirthDay.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture),
                        Address = txtDiaChi.Text,
                        Sex = gioiTinh,
                        Account = account

                    };

                    db.Customers.Add(customer);
                    db.SaveChanges();
                }
            }
        }

        protected void cvNameSu_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (txtNameSu.Text.Length < 6)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void cvEmailSu_ServerValidate(object source, ServerValidateEventArgs args)
        {
            using (DBEcommerceEntities db = new DBEcommerceEntities())
            {
                var checkExist = db.Accounts.Where(acc => acc.UserName == txtEmailSu.Text).FirstOrDefault();
                if (checkExist != null)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
        }

        protected void cvCaptcha_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string EncodedResponse = Request.Form["g-Recaptcha-Response"];
            bool IsCaptchaValid = (ReCaptchaClass.Validate(EncodedResponse) == "True" ? true : false);
            if (IsCaptchaValid)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void cvCbbSex_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (int.Parse(cbbSex.SelectedValue) == 0)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void cvBirthday_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                var dt = DateTime.ParseExact(txtBirthDay.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                args.IsValid = true;
            }
            catch (Exception)
            {
                args.IsValid = false;                
            }
            
        }

        

    }
}
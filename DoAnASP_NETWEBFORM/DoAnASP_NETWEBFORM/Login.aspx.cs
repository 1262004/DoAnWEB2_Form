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
                //if (Request.UrlReferrer != null)
                //{
                //    ViewState["RefUrl"] = Request.UrlReferrer.ToString();
                //}

                //if (CurrentContext.IsLogged)
                //{
                //    using (DBEcommerceEntities db = new DBEcommerceEntities())
                //    {
                //        CurrentContext._Account = db.Accounts.Where(acc => acc.UserName == txtEmailLog.Value
                //                                && acc.PassWord == txtPasswordLog.Value
                //                                && acc.Enabled == 1).FirstOrDefault();
                        
                //    }
                    
                //}         
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (DBEcommerceEntities db = new DBEcommerceEntities())
            {
                var checkAccExist = db.Accounts.Where(acc => acc.UserName == txtEmailLog.Value).FirstOrDefault();
                if (checkAccExist != null)
                {
                    var account = db.Accounts.Where(acc => acc.UserName == txtEmailLog.Value
                                                && acc.PassWord == txtPasswordLog.Value).FirstOrDefault();
                    if (account != null)
                    {
                        var checkEnable = db.Accounts.Where(acc => acc.UserName == txtEmailLog.Value
                                                && acc.PassWord == txtPasswordLog.Value
                                                && acc.Enabled == 1).FirstOrDefault();
                        if (checkEnable != null)
                        {
                            var customer = db.Customers.Where(cus => cus.AccountID == account.AccountID).FirstOrDefault();
                            if (customer != null)
                            {                               
                                Response.Cookies["User"].Value = account.UserName;
                                if (cbKeep.Checked)
                                {
                                    Response.Cookies["User"].Expires = DateTime.Now.AddDays(7);
                                }     
                                lblMessLog.InnerText = "Hello " + customer.FullName;
                            }
                            else
                            {
                                lblMessLog.InnerText = "Hello" + account.UserName;
                            }
                        }
                        else
                        {
                            lblMessLog.InnerText = "Tài khoản đã bị khóa";
                        }
                    }
                    else
                    {
                        lblMessLog.InnerText = "Mật khẩu không đúng";
                    }
                }
                else
                {
                    lblMessLog.InnerText = "Tên tài khoản không tồn tại";
                }
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {           
            using (DBEcommerceEntities db = new DBEcommerceEntities())
            {
                var checkExist = db.Accounts.Where(acc => acc.UserName == txtEmailSu.Value).FirstOrDefault();
                if (checkExist != null)
                {
                    lblMessSu.InnerText = "Email đã tồn tại";
                }
                else
                {
                    if (txtConfimPasSu.Value != txtPasswordSu.Value)
                    {
                        lblMessSu.InnerText = "Nhập lại mật khẩu không đúng";
                    }
                    else
                    {
                        string EncodedResponse = Request.Form["g-Recaptcha-Response"];
                        
                        bool IsCaptchaValid = (ReCaptchaClass.Validate(EncodedResponse) == "True" ? true : false);
                        if (IsCaptchaValid)
                        {
                            Account account = new Account
                            {
                                UserName = txtEmailSu.Value,
                                PassWord = txtPasswordSu.Value,
                                RoleID = 3,
                                Enabled = 1
                            };

                            Customer customer = new Customer
                            {
                                FullName = txtNameSu.Value,
                                AccountID = account.AccountID,
                                Email = txtEmailSu.Value,
                                BirthDay = DateTime.ParseExact(dtBirthDay.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture),
                                Address = taDiaChi.Value
                                //sex...
                            };

                            db.Accounts.Add(account);
                            db.Customers.Add(customer);
                            db.SaveChanges();
                            lblMessSu.InnerText = "Đăng ký thành công";
                        }
                        else
                        {
                            lblMessSu.InnerText = "Chưa nhập captcha";
                        }
                    }
                }
            }
        }

    }
}
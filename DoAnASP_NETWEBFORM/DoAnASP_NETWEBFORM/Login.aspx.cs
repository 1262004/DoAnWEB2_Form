using DoAnASP_NETWEBFORM.helpers;
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
            if (CurrentContext.IsLogged())
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (DBEcommerceEntities db = new DBEcommerceEntities())
            {
                string pass = StringUltils.MD5(txtPasswordLog.Text);
                var checkAccExist = db.Accounts.Where(acc => acc.UserName == txtEmailLog.Text).FirstOrDefault();
                if (checkAccExist != null)
                {
                    var account = db.Accounts.Where(acc => acc.UserName == txtEmailLog.Text
                                                && acc.PassWord == pass).FirstOrDefault();
                    if (account != null)
                    {
                        var checkEnable = db.Accounts.Where(acc => acc.UserName == txtEmailLog.Text
                                                && acc.PassWord == pass
                                                && acc.Enabled == true).FirstOrDefault();
                        if (checkEnable != null)
                        {
                            int role = checkEnable.Role.RoleID;
                            if (role == 1) // admin
                            {
                                var employ = db.Employees.Where(emp => emp.AccountID == account.AccountID).FirstOrDefault();
                                Session["IsLogin"] = 1;
                                Session["CurAd"] = "admin";
                                Session["CurEmp"] = employ;
                                Response.Redirect("~/Admin/Report.aspx");
                            }
                            else if (role == 2) // nhân viên
                            {
                                var employ = db.Employees.Where(emp => emp.AccountID == account.AccountID).FirstOrDefault();
                                if (employ != null)
                                {
                                    Session["IsLogin"] = 1;
                                    Session["CurEmp"] = employ;
                                    Response.Redirect("~/Admin/Report.aspx");
                                }
                            }
                            else // khách hàng
                            {
                                var customer = db.Customers.Where(cus => cus.AccountID == account.AccountID).FirstOrDefault();

                                if (customer != null) // là khách hàng
                                {
                                    Session["IsLogin"] = 1;
                                    Session["CurCus"] = customer;
                                }
                            }
                            Session["Cart"] = new helpers.cCart(); 
                            if (cbKeep.Checked)
                            {
                                Response.Cookies["accID"].Value = checkEnable.AccountID.ToString();
                                Response.Cookies["accID"].Expires = DateTime.Now.AddDays(7);
                            }

                            string retUrl = Request.QueryString["retUrl"];
                            if (string.IsNullOrEmpty(retUrl))
                            {
                                retUrl = "~/Default.aspx";
                            }
                            Response.Redirect(retUrl);
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
                Account account = new Account
                {
                    UserName = txtEmailSu.Text,
                    PassWord = StringUltils.MD5(txtPasswordSu.Text),
                    RoleID = 3,
                    Enabled = true
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

                using (DBEcommerceEntities db = new DBEcommerceEntities())
                {
                    db.Customers.Add(customer);
                    db.SaveChanges();
                }

                Response.Redirect("~/board.aspx?msg=1");
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
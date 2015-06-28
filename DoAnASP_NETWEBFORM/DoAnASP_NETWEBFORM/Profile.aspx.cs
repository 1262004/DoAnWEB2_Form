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
    public partial class Profile : System.Web.UI.Page
    {
        int accID;
        DBEcommerceEntities db = new DBEcommerceEntities();
        Customer customer;
        Employee employee;

        protected void Page_Load(object sender, EventArgs e)
        {            
            if (CurrentContext.IsLogged() == false)
            {
                Response.Redirect("~/Login.aspx?retUrl=Profile.aspx");
            }
            else
            {
                if (CurrentContext.getCustomer() != null)
                {
                    accID = CurrentContext.getCustomer().Account.AccountID;

                    customer = CurrentContext.getCustomer();
                    if (!IsPostBack)
                    {
                        txtName.Text = customer.FullName;
                        txtBirthDay.Text = String.Format("{0:dd/MM/yyyy}", customer.BirthDay);
                        if (customer.Sex.Equals("Nam"))
                        {
                            cbbSex.SelectedIndex = 1;
                        }
                        else
                        {
                            cbbSex.SelectedIndex = 2;
                        }
                        txtDiaChi.Text = customer.Address;
                    }                   
                }

                if (CurrentContext.getEmployee() != null)
                {
                    accID = CurrentContext.getEmployee().Account.AccountID;

                    employee = CurrentContext.getEmployee();

                    if (IsPostBack == false)
                    {
                        txtName.Text = employee.FullName;
                        txtBirthDay.Text = String.Format("{0:dd/MM/yyyy}", employee.BirthDate);
                        if (employee.Sex.Equals("Nam"))
                        {
                            cbbSex.SelectedIndex = 1;
                        }
                        else
                        {
                            cbbSex.SelectedIndex = 2;
                        }
                        txtDiaChi.Text = employee.Address;
                    }
                    
                }
            }
        }

        protected void btnUpdateLog_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Account account = db.Accounts.SingleOrDefault(acc => acc.AccountID == accID);
                account.PassWord = StringUltils.MD5(txtPassNew.Text);
                db.SaveChanges();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweet", "sweetAlert('Success', 'Thay đổi mật khẩu thành công!', 'success');", true);

            }
        }

        protected void btnUpdatePro_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string gioiTinh = "";
                if (int.Parse(cbbSex.SelectedValue) == 1)
                {
                    gioiTinh = "Nam";
                }
                if (int.Parse(cbbSex.SelectedValue) == 2)
                {
                    gioiTinh = "Nữ";
                }
                if (customer != null)
                {
                    Customer cusEdit = db.Customers.SingleOrDefault(cus => cus.AccountID == accID);
                    cusEdit.FullName = txtName.Text;
                    cusEdit.BirthDay = DateTime.ParseExact(txtBirthDay.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    cusEdit.Sex = gioiTinh;
                    cusEdit.Address = txtDiaChi.Text;
                }
                else
                {
                    Employee empEdit = db.Employees.SingleOrDefault(emp => emp.AccountID == accID);
                    empEdit.FullName = txtName.Text;
                    empEdit.BirthDate = DateTime.ParseExact(txtBirthDay.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    empEdit.Sex = gioiTinh;
                    empEdit.Address = txtDiaChi.Text;
                }
                db.SaveChanges();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "sweet", "sweetAlert('Success', 'Thay đổi thông tin thành công!', 'success');", true);
            }
        }

        protected void cvPassOld_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string po = StringUltils.MD5(txtPassOld.Text);
            Account account = db.Accounts.Where(acc => acc.AccountID == accID && acc.PassWord == po).SingleOrDefault();
            if(account != null) 
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }


        protected void cusvCbbSex_ServerValidate(object source, ServerValidateEventArgs args)
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
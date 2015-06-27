using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM.Admin
{
    public partial class Profile : System.Web.UI.Page
    {
        DBEcommerceEntities db = new DBEcommerceEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // get tu session
            Account account = db.Accounts.SingleOrDefault(m => m.AccountID == 2);
            Employee em = db.Employees.SingleOrDefault(m => m.AccountID == account.AccountID);
            this.lbUsername.Text = account.UserName;
            this.lbFullName.Text = em.FullName;
            this.lbPhone.Text = em.Phone;
            this.lbSex.Text = em.Sex;
            this.lbAddress.Text = em.Address;
            this.lbBirthDay.Text = em.BirthDate.ToString();

            ListItem item = new ListItem();
            item.Text = "Nam";
            item.Value = "Nam";
            this.cbxSex.Items.Add(item);
            item = new ListItem();
            item.Text = "Nữ";
            item.Value = "Nữ";
            this.cbxSex.Items.Add(item);
            // bindding edit
            this.txtUsername.Text = account.UserName;
            this.txtFullName.Text = em.FullName;
            this.txtPhone.Text = em.Phone;
            this.cbxSex.SelectedValue = em.Sex;
            this.txtAddress.Text = em.Address;
            this.txtBirthDay.Text = em.BirthDate.ToString();
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Account acc = db.Accounts.SingleOrDefault(m => m.AccountID == 2);
            if(txtPassword.Text!="")
                acc.PassWord = this.txtPassword.Text;
            Employee em = db.Employees.SingleOrDefault(m => m.AccountID == acc.AccountID);
            em.FullName = txtFullName.Text;
            em.Sex = cbxSex.SelectedValue;
            em.Phone = txtPhone.Text;
            em.Address = txtAddress.Text;
            em.BirthDate = DateTime.Parse(txtBirthDay.Text);
            db.SaveChanges();
        }
    }
}
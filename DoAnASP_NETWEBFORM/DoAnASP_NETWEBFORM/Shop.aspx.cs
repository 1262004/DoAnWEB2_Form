﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnASP_NETWEBFORM
{
    public partial class Shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                string rid = Request.QueryString["cate"];
                int id = 0;
                if (!string.IsNullOrEmpty(rid) && Int32.TryParse(rid, out id))
                {
                    LoadData(Convert.ToInt32(rid));
                }
                else
                    LoadData();

                rid = Request.QueryString["ship"];
                id = 0;
                if (!string.IsNullOrEmpty(rid) && Int32.TryParse(rid, out id))
                {
                    LoadDataShip(Convert.ToInt32(rid));
                }
            }
        }
        private void LoadDataShip(int shipID)
        {
            using (DBEcommerceEntities db = new DBEcommerceEntities())
            {
                List<Product> ds = db.Products.Where(p => p.SupplierID == shipID).ToList();
                this.lvProducts.DataSource = ds;
                this.lvProducts.DataBind();
            }
        }
        private void LoadData(int cate=0)
        {
            if (cate == 0)
            {
                using (DBEcommerceEntities db = new DBEcommerceEntities())
                {
                    List<Product> ds = db.Products.ToList();
                    this.lvProducts.DataSource = ds;
                    this.lvProducts.DataBind();
                }
            }
            else
            {
                using (DBEcommerceEntities db = new DBEcommerceEntities())
                {
                    List<Product> ds = db.Products.Where(p=>p.CategoryID==cate).ToList();
                    this.lvProducts.DataSource = ds;
                    this.lvProducts.DataBind();
                }
            }
        }

        protected void lvProducts_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dp.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            LoadData();
        }
    }
}
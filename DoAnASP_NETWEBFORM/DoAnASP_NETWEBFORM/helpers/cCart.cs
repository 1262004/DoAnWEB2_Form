using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAnASP_NETWEBFORM.helpers
{
    public class cCart
    {
        public List<cCartItem> Items { get; set; }

        public cCart()
        {
            Items = new List<cCartItem>();
        }

        public void Add(cCartItem item)
        {
            cCartItem existedItem = Items.Where(i => i.ProID == item.ProID).FirstOrDefault();

            if (existedItem != null)
            {
                existedItem.Quantity += item.Quantity;
            }
            else
            {
                Items.Add(item);
            }
        }

        public int getCountItems()
        {
            return Items.Sum(i => i.Quantity);
        }

        public void delete(int proID)
        {
            cCartItem existedItem = Items.Where(i => i.ProID == proID).FirstOrDefault();

            if (existedItem != null)
            {
                Items.Remove(existedItem);
            }
        }

        public void up(int proID)
        {
            cCartItem existedItem = Items.Where(i => i.ProID == proID).FirstOrDefault();

            if (existedItem != null)
            {
                existedItem.Quantity += 1;
            }
        }

        public void down(int proID)
        {
            cCartItem existedItem = Items.Where(i => i.ProID == proID).FirstOrDefault();

            if (existedItem != null)
            {
                if (existedItem.Quantity > 1)
                {
                    existedItem.Quantity -= 1;
                }
                
            }
        }
    }

    public class cCartItem
    {
        public int ProID { get; set; }
        public int Quantity { get; set; }
    }
}
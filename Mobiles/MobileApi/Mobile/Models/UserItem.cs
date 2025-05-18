using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mobile.Models
{
    public class UserItem
    {
        [Key]
        public int Id { get; set; }
        public virtual User User
        {
            get
            {
                return App.Users.FirstOrDefault(x => x.Id == UserId);
            }
            set
            {
                UserId = value != null ? value.Id : 0;
            }
        }
        public int UserId { get; set; }
        public virtual Item Item
        {
            get
            {
                return App.Items.FirstOrDefault(x => x.Id == ItemId);
            }
            set
            {
                ItemId = value.Id;
            }
        }
        public int ItemId { get; set; }
    }
}

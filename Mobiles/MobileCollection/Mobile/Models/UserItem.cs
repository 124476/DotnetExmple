using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mobile.Models
{
    public class UserItem
    {
        [Key]
        public int Id { get; set; }
        public virtual User User { get; set; } // virtual - обязателен при связи
        public int UserId { get; set; }
        public virtual Item Item { get; set; } // virtual - обязателен при связи
        public int ItemId { get; set; }
    }
}

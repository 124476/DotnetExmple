using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mobile.Models
{
    public class User
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public virtual Role Role { get; set; } // virtual - обязателен при связи
        public int RoleId { get; set; }
        public virtual User? Lider { get; set; } // virtual - обязателен при связи
        public int? LiderId { get; set; }
    }
}

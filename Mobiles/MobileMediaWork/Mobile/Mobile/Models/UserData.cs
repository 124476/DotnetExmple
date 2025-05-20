using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mobile.Models
{
    public class UserData
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Data { get; set; }
        public virtual TypeUserData TypeUserData { get; set; }
        public int TypeUserDataId { get; set; }
        [NotMapped]
        public string Type
        {
            get
            {
                if (TypeUserDataId == 1) return "📷";
                if (TypeUserDataId == 2) return "🎥";
                return "🎙";
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mobile.Models
{
    public class ItemImage
    {
        [Key]
        public int Id { get; set; }
        public virtual Item Item { get; set; } // virtual - обязателен при связи
        public int ItemId { get; set; }
        public string Image { get; set; }
        [NotMapped]
        public ImageSource? ImageSource
        {
            get
            {
                try
                {
                    byte[] bytes = Convert.FromBase64String(Image);
                    using (var ms = new MemoryStream())
                    {
                        return ImageSource.FromStream(() => ms);
                    }
                }
                catch
                {
                    return null;
                }
            }
        }
        public int IsSynced { get; set; } = 0;
    }
}

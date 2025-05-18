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
        public byte[] Image { get; set; }
        [NotMapped]
        public ImageSource? ImageSource
        {
            get
            {
                if (Image == null) return null;
                return ImageSource.FromStream(() => new MemoryStream(Image));
            }
        }
    }
}

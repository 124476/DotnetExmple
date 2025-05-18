using Microsoft.Maui.Controls;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mobile.Models
{
    public class Item
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public bool IsPublished { get; set; }
        public float Price { get; set; }
        public int Count { get; set; }
        public string? Image { get; set; }
        public string? Doc { get; set; }
        public string? DocFormat { get; set; }
        public DateTime? DateStart { get; set; }
        public TimeSpan? TimeStart { get; set; }
        public string? Description { get; set; }
        [NotMapped]
        public ImageSource? ImageSource
        {
            get
            {
                try
                {
                    byte[] bytes = Convert.FromBase64String(Image);
                    return ImageSource.FromStream(() => new MemoryStream(bytes));
                }
                catch
                {
                    return null;
                }
            }
        }
        [NotMapped]
        public string ColorDownload
        {
            get
            {
                return Doc == null ? "Gray" : "";
            }
        }
        public int IsSynced { get; set; } = 0;
    }
}

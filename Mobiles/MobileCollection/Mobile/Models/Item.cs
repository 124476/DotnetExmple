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
            set
            {
                if (value == null) Image = null;

                var streamImageSource = value as StreamImageSource;

                var cancellationToken = CancellationToken.None;
                var task = streamImageSource.Stream(cancellationToken);
                task.Wait(cancellationToken);
                var stream = task.Result;

                using (var memoryStream = new MemoryStream())
                {
                    stream.CopyTo(memoryStream);
                    Image = Convert.ToBase64String(memoryStream.ToArray());
                }
            }
        }
    }
}

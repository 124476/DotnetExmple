using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;

namespace Desctop.Models
{
    public class ColorPalitra
    {
        public string Name { get; set; }
        public Brush Color
        {
            get
            {
                return (Brush)(new BrushConverter().ConvertFromString(Name));
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Desctop.Models
{
    public partial class Item
    {
        public int Hour
        {
            get
            {
                if (TimeStart == null)
                    TimeStart = new TimeSpan(1, 0, 0);
                return TimeStart.Hours;
            }
        }
        public int Minute
        {
            get
            {
                if (TimeStart == null)
                    TimeStart = new TimeSpan(1, 0, 0);

                return TimeStart.Minutes;
            }
        }
        public bool IsFile
        {
            get
            {
                if (Doc == null)
                    return false;
                return true;
            }
        }
    }
}

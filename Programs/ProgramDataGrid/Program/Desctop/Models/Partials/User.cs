using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Desctop.Models
{
    public partial class User
    {
        public string Items
        {
            get
            {
                var items = UserItems.Select(x => x.Item1.Name).ToList();
                return string.Join("\n", items);
            }
        }
    }
}

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
                var items = App.UserItemss.Where(x => x.UserId == Id).Select(x => x.Item.Name).ToList();
                return string.Join("\n", items);
            }
        }
    }
}

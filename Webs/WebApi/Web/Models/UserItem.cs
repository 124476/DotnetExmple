using System;
using System.Collections.Generic;
using Web.Servies;

namespace Web.Models;

public partial class UserItem
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public int ItemId { get; set; }

    public virtual Item Item
    {
        get
        {
            return DataManage.Items.FirstOrDefault(x => x.Id == ItemId);
        }
        set
        {
            ItemId = value.Id;
        }
    }

    public virtual User User
    {
        get
        {
            return DataManage.Users.FirstOrDefault(u => u.Id == UserId);
        }
        set
        {
            UserId = value.Id;
        }
    }
}

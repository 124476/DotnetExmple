using System;
using System.Collections.Generic;
using Web.Servies;

namespace Web.Models;

public partial class ItemImage
{
    public int Id { get; set; }

    public int ItemId { get; set; }

    public byte[] Image { get; set; } = null!;

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
}

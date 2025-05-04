using System;
using System.Collections.Generic;

namespace Web.Models;

public partial class ItemImage
{
    public int Id { get; set; }

    public int ItemId { get; set; }

    public byte[] Image { get; set; } = null!;

    public virtual Item Item { get; set; } = null!;
}

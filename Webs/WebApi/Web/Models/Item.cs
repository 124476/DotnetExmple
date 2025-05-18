using System;
using System.Collections.Generic;

namespace Web.Models;

public partial class Item
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public bool IsPublished { get; set; }

    public double Price { get; set; }

    public int Count { get; set; }

    public byte[]? Image { get; set; }

    public byte[]? Doc { get; set; }

    public string? DocFormat { get; set; }

    public DateTime DateStart { get; set; }

    public DateTime TimeStart { get; set; }

    public string? Description { get; set; }
}

using System;
using System.Collections.Generic;

namespace Web.Models;

public partial class User
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Login { get; set; } = null!;

    public string Password { get; set; } = null!;

    public int RoleId { get; set; }

    public int? UserId { get; set; }

    public virtual ICollection<User> InverseUserNavigation { get; set; } = new List<User>();

    public virtual Role Role { get; set; } = null!;

    public virtual ICollection<UserItem> UserItems { get; set; } = new List<UserItem>();

    public virtual User? UserNavigation { get; set; }
}

using System;
using System.Collections.Generic;
using Web.Servies;

namespace Web.Models;

public partial class User
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Login { get; set; } = null!;

    public string Password { get; set; } = null!;

    public int RoleId { get; set; }

    public int? UserId { get; set; }

    public virtual Role Role
    {
        get
        {
            return DataManage.Roles.FirstOrDefault(x => x.Id == RoleId);
        }
        set
        {
            RoleId = value.Id;
        }
    }

    public virtual User? UserNavigation
    {
        get
        {
            return DataManage.Users.FirstOrDefault(x => x.Id == UserId);
        }
        set
        {
            UserId = value?.Id;
        }
    }
}

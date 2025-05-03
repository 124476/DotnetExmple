using Microsoft.EntityFrameworkCore;
using Mobile.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mobile
{
    public class DBContext : DbContext
    {
        // public virtual DbSet<Модель> { get; set; } 
        // virtual - обязательно!
        public virtual DbSet<Item> Items { get; set; }
        public virtual DbSet<ItemImage> ItemImages { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserItem> UserItems { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            string dbPath = Path.Combine(FileSystem.AppDataDirectory, "db.db");

            if (!File.Exists(dbPath))
            {
                using var ms = FileSystem.OpenAppPackageFileAsync("db.db").Result;
                using var fileStream = File.Create(dbPath);
                ms.CopyTo(fileStream);
            }

            optionsBuilder.UseLazyLoadingProxies();
            optionsBuilder.UseSqlite($"Filename={dbPath}");
        }
    }
}

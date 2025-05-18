using Microsoft.EntityFrameworkCore;
using Mobile.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mobile.Servies
{
    public class DBContext : DbContext
    {
        public virtual DbSet<Item> Items { get; set; }
        public virtual DbSet<ItemImage> ItemImages { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserItem> UserItems { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            string dbPath = Path.Combine(FileSystem.AppDataDirectory, "databaseapi.db");

            if (!File.Exists(dbPath))
            {
                var file = File.Create(dbPath);
                file.Close();
            }

            optionsBuilder.UseLazyLoadingProxies();
            optionsBuilder.UseSqlite($"Filename={dbPath}");
        }
    }
}

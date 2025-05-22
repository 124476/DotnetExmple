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
        public virtual DbSet<TypeUserData> TypeUserDatas { get; set; }
        public virtual DbSet<UserData> UserDatas { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            string dbPath = Path.Combine(FileSystem.AppDataDirectory, "databasemedia.db");

            if (!File.Exists(dbPath))
            {
                using var ms = FileSystem.OpenAppPackageFileAsync("databasemedia.db").Result;
                using var fileStream = File.Create(dbPath);
                ms.CopyTo(fileStream);
            }

            optionsBuilder.UseLazyLoadingProxies();
            optionsBuilder.UseSqlite($"Filename={dbPath}");
        }
    }
}

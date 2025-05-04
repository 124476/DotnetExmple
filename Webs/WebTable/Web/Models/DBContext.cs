using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Web.Models;

public partial class DBContext : DbContext
{
    public DBContext()
    {
    }

    public DBContext(DbContextOptions<DBContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Item> Items { get; set; }

    public virtual DbSet<ItemImage> ItemImages { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserItem> UserItems { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseLazyLoadingProxies();
        optionsBuilder.UseSqlServer("Server=DESKTOP-5AL3OJL\\SQLEXPRESS;Database=WPFExmpleDataBase;TrustServerCertificate=True;Trusted_Connection=True;"); // Текст остается прежним
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Item>(entity =>
        {
            entity.ToTable("Item");

            entity.Property(e => e.Description).HasMaxLength(500);
            entity.Property(e => e.DocFormat).HasMaxLength(150);
            entity.Property(e => e.Image).HasColumnType("image");
            entity.Property(e => e.Name).HasMaxLength(150);
        });

        modelBuilder.Entity<ItemImage>(entity =>
        {
            entity.Property(e => e.Image).HasColumnType("image");

            entity.HasOne(d => d.Item).WithMany(p => p.ItemImages)
                .HasForeignKey(d => d.ItemId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ItemImages_Item");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.ToTable("Role");

            entity.Property(e => e.Name).HasMaxLength(150);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.ToTable("User");

            entity.Property(e => e.Login).HasMaxLength(150);
            entity.Property(e => e.Name).HasMaxLength(150);
            entity.Property(e => e.Password).HasMaxLength(150);

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_User_Role");

            entity.HasOne(d => d.UserNavigation).WithMany(p => p.InverseUserNavigation)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK_User_User");
        });

        modelBuilder.Entity<UserItem>(entity =>
        {
            entity.HasOne(d => d.Item).WithMany(p => p.UserItems)
                .HasForeignKey(d => d.ItemId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UserItems_Item");

            entity.HasOne(d => d.User).WithMany(p => p.UserItems)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_UserItems_User");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}

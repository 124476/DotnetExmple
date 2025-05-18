using Microsoft.EntityFrameworkCore;
using Mobile.Models;
using Mobile.Servies;
using System.Diagnostics;

namespace Mobile
{
    public partial class App : Application
    {
        public static List<User> Users;
        public static List<Role> Roles;
        public static List<Item> Items;
        public static List<ItemImage> ItemImages;
        public static List<UserItem> UserItems;

        public static User User;
        public App()
        {
            InitializeComponent();

            Task.Run(async () =>
            {
                await InitData();
            });

            MainPage = new AppShell();
        }

        public static async Task InitData()
        {
            Users = await NetManage.Get<List<User>>("/api/Users");
            Roles = await NetManage.Get<List<Role>>("/api/Roles");
            Items = await NetManage.Get<List<Item>>("/api/Items");
            ItemImages = await NetManage.Get<List<ItemImage>>("/api/ItemImages");
            UserItems = await NetManage.Get<List<UserItem>>("/api/UserItems");
        }
    }
}

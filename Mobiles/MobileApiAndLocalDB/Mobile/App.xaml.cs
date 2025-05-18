using Microsoft.EntityFrameworkCore;
using Mobile.Models;
using Mobile.Servies;
using System.Diagnostics;

namespace Mobile
{
    public partial class App : Application
    {
        public static DBContext DB = new DBContext();
        public static User User;
        public App()
        {
            InitializeComponent();

            InitilizationDB();

            Timer timer = new Timer(async _ =>
            {
                await InitData();
            }, null, 0, 1000);

            MainPage = new AppShell();
        }

        public static void InitilizationDB()
        {
            using var db = new DBContext();
            db.Database.EnsureCreated();
            db.Database.Migrate();
        }

        public static async Task InitData()
        {
            try
            {
                if (DB.Users.Count() == 0)
                {
                    foreach (var enty in (await NetManage.Get<List<Role>>("api/Roles/")))
                        DB.Roles.Add(enty);
                    DB.SaveChanges();

                    foreach (var enty in (await NetManage.Get<List<User>>("api/Users/")))
                        DB.Users.Add(enty);
                    DB.SaveChanges();

                    foreach (var enty in (await NetManage.Get<List<Item>>("api/Items/")))
                        DB.Items.Add(enty);
                    DB.SaveChanges();

                    foreach (var enty in (await NetManage.Get<List<UserItem>>("api/UserItems/")))
                        DB.UserItems.Add(enty);
                    DB.SaveChanges();

                    foreach (var enty in (await NetManage.Get<List<ItemImage>>("api/ItemImages/")))
                        DB.ItemImages.Add(enty);
                    DB.SaveChanges();
                }

                foreach (var enty in DB.Users)
                {
                    var responce = 0;

                    if (enty.IsSynced == 1)
                        responce = (await NetManage.Post("api/Users/", enty)).IsSuccessStatusCode ? 0 : 1;
                    else if (enty.IsSynced == 2)
                        responce = (await NetManage.Put($"api/Users/{enty.Id}", enty)).IsSuccessStatusCode ? 0 : 2;
                    else if (enty.IsSynced == 3)
                        responce = (await NetManage.Delete($"api/Users/{enty.Id}")).IsSuccessStatusCode ? 0 : 3;

                    enty.IsSynced = responce;
                }

                foreach (var enty in DB.ItemImages)
                {
                    var responce = 0;

                    if (enty.IsSynced == 1)
                        responce = (await NetManage.Post("api/ItemImages/", enty)).IsSuccessStatusCode ? 0 : 1;
                    else if (enty.IsSynced == 2)
                        responce = (await NetManage.Put($"api/ItemImages/{enty.Id}", enty)).IsSuccessStatusCode ? 0 : 2;
                    else if (enty.IsSynced == 3)
                        responce = (await NetManage.Delete($"api/ItemImages/{enty.Id}")).IsSuccessStatusCode ? 0 : 3;

                    enty.IsSynced = responce;
                }

                foreach (var enty in DB.UserItems)
                {
                    var responce = 0;

                    if (enty.IsSynced == 1)
                        responce = (await NetManage.Post("api/UserItems/", enty)).IsSuccessStatusCode ? 0 : 1;
                    else if (enty.IsSynced == 2)
                        responce = (await NetManage.Put($"api/UserItems/{enty.Id}", enty)).IsSuccessStatusCode ? 0 : 2;
                    else if (enty.IsSynced == 3)
                        responce = (await NetManage.Delete($"api/UserItems/{enty.Id}")).IsSuccessStatusCode ? 0 : 3;

                    enty.IsSynced = responce;
                }

                foreach (var enty in DB.Items)
                {
                    var responce = 0;

                    if (enty.IsSynced == 1)
                        responce = (await NetManage.Post("api/Items/", enty)).IsSuccessStatusCode ? 0 : 1;
                    else if (enty.IsSynced == 2)
                        responce = (await NetManage.Put($"api/Items/{enty.Id}", enty)).IsSuccessStatusCode ? 0 : 2;
                    else if (enty.IsSynced == 3)
                        responce = (await NetManage.Delete($"api/Items/{enty.Id}")).IsSuccessStatusCode ? 0 : 3;

                    enty.IsSynced = responce;
                }

                foreach (var enty in DB.Roles)
                {
                    var responce = 0;

                    if (enty.IsSynced == 1)
                        responce = (await NetManage.Post("api/Roles/", enty)).IsSuccessStatusCode ? 0 : 1;
                    else if (enty.IsSynced == 2)
                        responce = (await NetManage.Put($"api/Roles/{enty.Id}", enty)).IsSuccessStatusCode ? 0 : 2;
                    else if (enty.IsSynced == 3)
                        responce = (await NetManage.Delete($"api/Roles/{enty.Id}")).IsSuccessStatusCode ? 0 : 3;

                    enty.IsSynced = responce;
                }
            }
            catch
            {

            }
        }
    }
}

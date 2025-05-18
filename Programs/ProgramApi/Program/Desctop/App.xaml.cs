using Desctop.Models;
using Desctop.Servies;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Threading;

namespace Desctop
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static List<User> Users = new List<User>();
        public static List<Role> Roles = new List<Role>();
        public static List<Item> Items = new List<Item>();
        public static List<UserItems> UserItemss = new List<UserItems>();
        public static List<ItemImages> ItemImagess = new List<ItemImages>();

        public static User User;
        public App()
        {
            DispatcherUnhandledException += App_DispatcherUnhandledException;

            Task.Run(async () =>
            {
                await App.InitData();
            }).Wait();
        }
        public static async Task InitData()
        {
            Users = await NetManage.Get<List<User>>("api/Users");
            Roles = await NetManage.Get<List<Role>>("api/Roles");
            Items = await NetManage.Get<List<Item>>("api/Items");
            UserItemss = await NetManage.Get<List<UserItems>>("api/UserItems");
            ItemImagess = await NetManage.Get<List<ItemImages>>("api/ItemImages");
        }

        private void App_DispatcherUnhandledException(object sender, System.Windows.Threading.DispatcherUnhandledExceptionEventArgs e)
        {
            e.Handled = true;
            MessageBox.Show("Ошибка!");
        }
    }
}

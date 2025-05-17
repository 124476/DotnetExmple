using Desctop.Models;
using Desctop.Servies;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace Desctop.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageUsers.xaml
    /// </summary>
    public partial class PageUsers : Page
    {
        User ContextUser;
        public PageUsers()
        {
            InitializeComponent();
            InitializeComponentRefresh();

            DispatcherTimer timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Tick += Timer_Tick;
            timer.Start();
        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            Refresh();
        }

        private async void InitializeComponentRefresh()
        {
            ComboItems.ItemsSource = App.Items.ToList();
            ComboRoles.ItemsSource = App.Roles.ToList();

            ContextUser = new User();

            Refresh();
        }

        private async void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(ContextUser.Name) || string.IsNullOrEmpty(ContextUser.Login)
                || string.IsNullOrEmpty(ContextUser.Password) || ComboRoles.SelectedIndex == -1)
            {
                MessageBox.Show("Заполните все поля!");
                return;
            }

            var user = App.Users.FirstOrDefault(x => x.Login == ContextUser.Login && x.Id != ContextUser.Id);

            if (user != null)
            {
                MessageBox.Show("Такой логин уже используется!");
                return;
            }

            if (ContextUser.Id == 0) await NetManage.Post("/api/users/", ContextUser);
            else await NetManage.Put($"/api/users/{ContextUser.Id}", ContextUser);

            ContextUser = new User();

            Refresh();
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            var user = (sender as Button).DataContext as User;
            if (user == null) return;

            ContextUser = user;

            Refresh();
        }

        private async void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            var result = MessageBox.Show("Удалить?", "Предупреждение", MessageBoxButton.YesNo);
            if (result != MessageBoxResult.Yes) return;

            var user = (sender as Button).DataContext as User;
            if (user == null) return;

            await NetManage.Delete($"/api/users/{user.Id}");
            
            ContextUser = new User();

            Refresh();
        }

        private async void Refresh()
        {
            ListUsers.ItemsSource = null;
            ListUsers.ItemsSource = App.Users;

            ComboUsers.ItemsSource = null;
            ComboUsers.ItemsSource = App.Users.Where(x => x.Id != ContextUser.Id).ToList();

            DataContext = null;
            DataContext = ContextUser;

            RefreshItems();
        }

        private async void BtnDeleteItem_Click(object sender, RoutedEventArgs e)
        {
            var item = (sender as Button).DataContext as UserItems;
            if (item == null) return;

            await NetManage.Delete($"api/UserItems/{item.Id}");

            RefreshItems();
        }

        private void RefreshItems()
        {
            ListItems.ItemsSource = null;
            ListItems.ItemsSource = ContextUser.UserItems;
        }

        private async void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            var item = ComboItems.SelectedItem as Item;
            if (item == null) return;

            var itemUser = new UserItems() { User = ContextUser, Item = item };

            await NetManage.Post("api/UserItems", itemUser);

            RefreshItems();
        }
    }
}

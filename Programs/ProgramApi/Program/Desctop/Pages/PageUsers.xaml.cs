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

namespace Desctop.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageUsers.xaml
    /// </summary>
    public partial class PageUsers : Page
    {
        User contextUser;
        public PageUsers()
        {
            InitializeComponent();
            InitializeComponentRefresh();
        }

        private async void InitializeComponentRefresh()
        {
            ComboItems.ItemsSource = (await NetManage.Get<List<Item>>("api/items")).ToList();
            ComboRoles.ItemsSource = (await NetManage.Get<List<Role>>("api/roles")).ToList();

            contextUser = new User();

            Refresh();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            //if (string.IsNullOrEmpty(contextUser.Name) || string.IsNullOrEmpty(contextUser.Login)
            //    || string.IsNullOrEmpty(contextUser.Password) || ComboRoles.SelectedIndex == -1)
            //{
            //    MessageBox.Show("Заполните все поля!");
            //    return;
            //}

            //var user = App.DB.User.FirstOrDefault(x => x.Login == contextUser.Login && x.Id != contextUser.Id);

            //if (user != null)
            //{
            //    MessageBox.Show("Такой логин уже используется!");
            //    return;
            //}

            //if (contextUser.Id == 0)
            //    App.DB.User.Add(contextUser);
            //App.DB.SaveChanges();

            //contextUser = new User();

            //Refresh();
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            var user = (sender as Button).DataContext as User;
            if (user == null) return;

            contextUser = user;

            Refresh();
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            //var user = (sender as Button).DataContext as User;
            //if (user == null) return;

            //App.DB.User.Remove(user);
            //App.DB.SaveChanges();

            //contextUser = new User();

            //Refresh();
        }

        private async void Refresh()
        {
            DataContext = null;
            DataContext = contextUser;

            ListUsers.ItemsSource = null;
            ListUsers.ItemsSource = (await NetManage.Get<List<User>>("api/users")).ToList();

            ComboUsers.ItemsSource = null;
            ComboUsers.ItemsSource = (await NetManage.Get<List<User>>("api/users")).ToList().Where(x => x.Id != contextUser.Id).ToList();

            RefreshItems();
        }

        private void BtnDeleteItem_Click(object sender, RoutedEventArgs e)
        {
            var item = (sender as Button).DataContext as UserItems;
            if (item == null) return;

            contextUser.UserItems.Remove(item);

            RefreshItems();
        }

        private void RefreshItems()
        {
            ListItems.ItemsSource = null;
            ListItems.ItemsSource = contextUser.UserItems;
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            var item = ComboItems.SelectedItem as Item;
            if (item == null) return;

            var itemUser = new UserItems() { User = contextUser, Item = item };

            contextUser.UserItems.Add(itemUser);

            RefreshItems();
        }
    }
}

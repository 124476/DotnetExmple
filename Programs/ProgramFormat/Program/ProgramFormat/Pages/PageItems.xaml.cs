using ProgramFormat.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.RightsManagement;
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

namespace ProgramFormat.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageItems.xaml
    /// </summary>
    public partial class PageItems : Page
    {
        Item contextItem;
        public PageItems()
        {
            InitializeComponent();
            ComboUsers.ItemsSource = App.DB.Users;

            contextItem = new Item();
            DataContext = contextItem;
            Refresh();
        }

        private void Refresh()
        {
            DataItems.ItemsSource = null;
            DataItems.ItemsSource = App.DB.Items;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(contextItem.Name) || ComboUsers.SelectedIndex == -1)
            {
                MessageBox.Show("Заполните все поля!");
                return;
            }

            if (contextItem.Id == 0)
            {
                var lastUser = App.DB.Users.LastOrDefault();
                if (lastUser != null)
                    contextItem.Id = lastUser.Id + 1;
                else contextItem.Id = 1;
                App.DB.Items.Add(contextItem);
            }

            contextItem = new Item();
            DataContext = contextItem;
            Refresh();
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            var item = (sender as Button).DataContext as Item;
            if (item == null)
                return;

            contextItem = item;
            DataContext = null;
            DataContext = contextItem;
            Refresh();
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            var item = (sender as Button).DataContext as Item;
            if (item == null)
                return;
            App.DB.Items.Remove(item);

            contextItem = new Item();
            DataContext = null;
            DataContext = contextItem;
            Refresh();
        }
    }
}

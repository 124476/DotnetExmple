using ProgramExcel.Models;
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

namespace ProgramExcel.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageItems.xaml
    /// </summary>
    public partial class PageItems : Page
    {
        Item contextData;
        public PageItems()
        {
            InitializeComponent();

            ComboUsers.ItemsSource = App.DB.Users.ToList();
            contextData = new Item();
            DataContext = contextData;
            Refresh();
        }

        private void Refresh()
        {
            ListData.ItemsSource = App.DB.Items.ToList();

            contextData = new Item();

            DataContext = null;
            DataContext = contextData;

            ComboUsers.SelectedIndex = 0;
        }

        private void BtnUpdate_Click(object sender, RoutedEventArgs e)
        {
            var data = (sender as Button).DataContext as Item;
            if (data == null)
                return;

            contextData = data;

            DataContext = null;
            DataContext = contextData;
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            var data = (sender as Button).DataContext as Item;
            if (data == null)
                return;

            App.DB.Items.Remove(data);
            Refresh();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(contextData.Name) || ComboUsers.SelectedIndex == -1)
            {
                MessageBox.Show("Заполните все поля!");
                return;
            }

            if (contextData.Id == 0)
            {
                contextData.Id = App.DB.Items.Count() == 0 ? 1 : App.DB.Items.Last().Id + 1;

                App.DB.Items.Add(contextData);
            }

            Refresh();
        }
    }
}

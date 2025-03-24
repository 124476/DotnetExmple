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
    /// Логика взаимодействия для PageUsers.xaml
    /// </summary>
    public partial class PageUsers : Page
    {
        User contextData;
        public PageUsers()
        {
            InitializeComponent();

            contextData = new User();
            DataContext = contextData;
            Refresh();
        }

        private void Refresh()
        {
            ListData.ItemsSource = App.DB.Users.ToList();

            contextData = new User();

            DataContext = null;
            DataContext = contextData;
        }

        private void BtnUpdate_Click(object sender, RoutedEventArgs e)
        {
            var data = (sender as Button).DataContext as User;
            if (data == null)
                return;

            contextData = data;
            DataContext = null;
            DataContext = contextData;
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            var data = (sender as Button).DataContext as User;
            if (data == null)
                return;

            App.DB.Users.Remove(data);
            Refresh();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(contextData.Name))
            {
                MessageBox.Show("Заполните все поля!");
                return;
            }

            if (contextData.Id == 0)
            {
                contextData.Id = App.DB.Users.Count() == 0 ? 1 : App.DB.Users.Last().Id + 1;

                App.DB.Users.Add(contextData);
            }
            Refresh();
        }
    }
}

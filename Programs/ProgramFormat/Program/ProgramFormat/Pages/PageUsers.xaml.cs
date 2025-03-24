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
    /// Логика взаимодействия для PageUsers.xaml
    /// </summary>
    public partial class PageUsers : Page
    {
        User contextUser;
        public PageUsers()
        {
            InitializeComponent();
            contextUser = new User();
            DataContext = contextUser;
            Refresh();
        }   

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(contextUser.Name))
            {
                MessageBox.Show("Заполните все поля!");
                return;
            }

            if (contextUser.Id == 0)
            {
                var lastUser = App.DB.Users.LastOrDefault();
                if (lastUser != null)
                    contextUser.Id = lastUser.Id + 1;
                else contextUser.Id = 1;
                App.DB.Users.Add(contextUser);
            }

            contextUser = new User();
            DataContext = contextUser;
            Refresh();
        }

        private void Refresh()
        {
            DataUsers.ItemsSource = null;
            DataUsers.ItemsSource = App.DB.Users;
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            var user = (sender as Button).DataContext as User;
            if (user == null)
                return;

            contextUser = user;
            DataContext = null;
            DataContext = contextUser;
            Refresh();
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            var user = (sender as Button).DataContext as User;
            if (user == null)
                return;
            App.DB.Users.Remove(user);

            contextUser = new User();
            DataContext = null;
            DataContext = contextUser;
            Refresh();
        }
    }
}

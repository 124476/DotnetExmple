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
    /// Логика взаимодействия для PageLogin.xaml
    /// </summary>
    public partial class PageLogin : Page
    {
        public PageLogin()
        {
            InitializeComponent();
        }

        private async void BtnOpen_Click(object sender, RoutedEventArgs e)
        {
            var login = Login.Text;
            var password = Password.Text;

            App.User = App.Users.FirstOrDefault(x => x.Login == Login.Text && x.Password == Password.Text);

            if (App.User == null)
            {
                MessageBox.Show("Неверные данные для входа!");
                return;
            }

            NavigationService.Navigate(new PageItems());
        }
    }
}

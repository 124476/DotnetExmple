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

        private void BtnOpen_Click(object sender, RoutedEventArgs e)
        {
            var login = Login.Text;
            var password = Password.Text;

            App.User = App.DB.User.FirstOrDefault(x => x.Login == login && x.Password == password);

            if (App.User == null)
            {
                MessageBox.Show("Неверные данные для входа!");
                return;
            }

            NavigationService.Navigate(new PageItems());
        }
    }
}

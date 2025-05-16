using Desctop.Pages;
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

namespace Desctop
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MyFrame.Navigate(new PageLogin());
        }

        private void BtnUsers_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageUsers());
        }

        private void BtnRoles_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageRoles());
        }

        private void BtnItems_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageItems());
        }

        private void BtnOpen_Click(object sender, RoutedEventArgs e)
        {
            App.User = null;

            Refresh();

            MyFrame.Navigate(new PageLogin());
        }

        private void MyFrame_ContentRendered(object sender, EventArgs e)
        {
            Refresh();
        }

        private void Refresh()
        {
            Admin.Visibility = Visibility.Collapsed;

            if (App.User == null)
            {
                BtnOpen.Header = "Войти";

                return;
            }

            BtnOpen.Header = "Выйти";

            if (App.User.RoleId == 1)
            {
                Admin.Visibility = Visibility.Visible;

                return;
            }
        }

        private void BtnSell_Click(object sender, RoutedEventArgs e)
        {
            MyFrame.Navigate(new PageSell());
        }
    }
}

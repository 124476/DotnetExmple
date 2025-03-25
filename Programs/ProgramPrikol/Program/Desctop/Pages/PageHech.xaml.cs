using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
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
    /// Логика взаимодействия для PageHech.xaml
    /// </summary>
    public partial class PageHech : Page
    {
        public PageHech()
        {
            InitializeComponent();
        }
        public static string HashPassword(string password, string salt)
        {
            var pbkdf2 = new Rfc2898DeriveBytes(password, Encoding.UTF8.GetBytes(salt), 10000);
            byte[] hash = pbkdf2.GetBytes(32);
            return Convert.ToBase64String(hash);
        }

        private void BtnHech_Click(object sender, RoutedEventArgs e)
        {
            TextHech.Text = HashPassword(TextText.Text, "g24g4h635w45tewtgery452y"); // Соль, состоящие более чем из 8 символов
        }
    }
}

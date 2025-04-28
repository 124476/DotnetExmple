using Desctop.Properties;
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
    /// Логика взаимодействия для PageLocalization.xaml
    /// </summary>
    public partial class PageLocalization : Page
    {
        public PageLocalization()
        {
            InitializeComponent();
            UploadLang();
        }

        private void UploadLang()
        {
            var dict = new ResourceDictionary();
            switch (System.Threading.Thread.CurrentThread.CurrentUICulture.ToString())
            {
                case "ru-RU":
                    dict.Source = new Uri("Resources/Resource.ru.xaml", UriKind.Relative);
                    break;
                default:
                    dict.Source = new Uri("Resources/Resource.en.xaml", UriKind.Relative);
                    break;
            }
            Application.Current.Resources.MergedDictionaries.Add(dict);
        }

        private void BtnSetLang_Click(object sender, RoutedEventArgs e)
        {
            var current = System.Threading.Thread.CurrentThread.CurrentUICulture;
            if (current.ToString() == "en")
                System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("ru-RU");
            else System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("en");

            UploadLang();
        }
    }
}
